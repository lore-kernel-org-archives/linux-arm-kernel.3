Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A2CEED630
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 17:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WehPTyXoKdt7ZPc0MWnuY5iEZrpHgXBaGSOiJG5FN8=; b=TNyHHB9lgTklhRKvjdu1QQ1tmS
	bz+V1PXTdqiDjK9UI66ibwW+4yemFWUA+b3ARvKqr+GKA+xG3rH1wAs4JzkHIB3iS2QVSHhJmRj+I
	UD6pKHz2vK3byGCXFZh/3nTBozqRiQTsUqIbI12xDdMhB5Dh8UFugutMyOY+fei8wXheml69Z8JdF
	4meOBgDfqIA2QWVzeWXicbg04j4Xwc3SSvjgytiii+7nfljVIHqYq8S0trNhmf/OWVc7NGG6v3GyJ
	//exCwAn5ZdN9NUImqiPVbax4K1LhwpKM7lQXpJktlfNJ9xPHDBj8XBlIPpTKfd93OtpIe1vA7xQu
	TvLwkhAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMtZ-00000007PpG-41at;
	Thu, 01 Jan 2026 17:55:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMtX-00000007Pov-2gJM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 17:55:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EE5C497;
	Thu,  1 Jan 2026 09:55:23 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 52A1E3F63F;
	Thu,  1 Jan 2026 09:55:29 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Ally Heev <allyheev@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] arm: fix uninitialized pointers with free attr
Date: Thu,  1 Jan 2026 17:55:26 +0000
Message-ID: <176729006197.117434.8934138942645805963.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105-aheev-uninitialized-free-attr-arm-v1-1-f7b6cb5d3361@gmail.com>
References: <20251105-aheev-uninitialized-free-attr-arm-v1-1-f7b6cb5d3361@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_095531_722702_828999A0 
X-CRM114-Status: UNSURE (   8.95  )
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

On Wed, 05 Nov 2025 19:37:52 +0530, Ally Heev wrote:
> Uninitialized pointers with `__free` attribute can cause undefined
> behaviour as the memory assigned(randomly) to the pointer is freed
> automatically when the pointer goes out of scope
> 
> arm doesn't have any bugs related to this as of now, but
> it is better to initialize and assign pointers with `__free` attr
> in one statement to ensure proper scope-based cleanup
> 
> [...]

Applied with $subject changed to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] arm: fix uninitialized pointers with free attr
      https://git.kernel.org/sudeep.holla/c/78b74136affd

--
Regards,
Sudeep


