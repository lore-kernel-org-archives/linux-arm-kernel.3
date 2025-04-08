Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E731C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rybp547yy23nG7I/q8UAEP5SkPfb0716tA5JnYyqhwk=; b=VB8zylJFvo5JCkQ2nQ1v1gMhLu
	oNIcKNDEnf932rQPRpPAQkT5rKdm9rnrorzJuqSSOfSWRwdN530LTN+twuTSjK190oB5zkwKz+Ey5
	B/k2bhsnF716mHVe1HefffbCGmyz1P2txClxrYVXf9IaTK1X0NgI+1GV+xPZ9l5EYOVymGaIGa24R
	HeSoonviW7p8k+UricwmcrPBrXrxXwfG8crgqdVLzwZHTXb8FQcJLCHjcCWCC2BK+396sAimSyRhg
	A4rR6mMTGbGTYyX9McpaQhoqYjkNW9CbEdyBFZkuey9ltKB9qGhfcO6o17g9tdqyMpyQlLcAsxHs8
	4OII8OOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26gP-00000003m4J-0q4g;
	Tue, 08 Apr 2025 10:59:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u266m-00000003dlt-29c9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:23:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF6DE1688;
	Tue,  8 Apr 2025 03:23:08 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 934C93F6A8;
	Tue,  8 Apr 2025 03:23:06 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] firmware: arm_scmi: Balance device refcount when destroying devices
Date: Tue,  8 Apr 2025 11:23:03 +0100
Message-Id: <174410775216.2544674.4482099310313665654.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306185447.2039336-1-cristian.marussi@arm.com>
References: <20250306185447.2039336-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_032308_592919_E1A5EAF2 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 06 Mar 2025 18:54:47 +0000, Cristian Marussi wrote:
> Using device_find_child() to lookup the proper SCMI device to destroy
> causes an unbalance in device refcount, since device_find_child() calls an
> implicit get_device(): this, in turns, inhibits the call of the provided
> release methods upon devices destruction.
> 
> As a consequence, one of the structures that is not freed properly upon
> destruction is the internal struct device_private dev->p populated by the
> drivers subsystem core.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Balance device refcount when destroying devices
      https://git.kernel.org/sudeep.holla/c/9ca67840c0dd
--
Regards,
Sudeep


