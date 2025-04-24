Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3BDC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 10:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aERnI4nGEWOaDiyE/saKz1WUIFLeGMpl5PL1uZMPNV0=; b=IWHs+nSM+Kma7oV0VYBfSw+hF9
	UOB466lnAAnWlHhkTYSpjtXldg/NHe6MzcFqVGugpWQaB4DivfRRSQoRGoaMbefXbKXq8Fz6cpJDx
	FPIoa1LsS1OoY0toyzEoU5QC7uGEBqQkxnP0W+PrYyR58am+YISujAdQhdpnoqflPiyrJtw1JqzUO
	Yqbi/QYknaaLnD6uqh+MY3yos+8HQyqWh31aVder4FmZ6WqW/jW4U9T+t3iC1Nd8iOCp+2zPREHhu
	DzJNRsLhog6g6bnWCc2faXGRmyHyfgu8FxW+wDGBAyYlTU7NKBVzB+8D56cNZSi9bfWbDTG+r3uxe
	4lf3BJOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7txF-0000000DhrL-0qRR;
	Thu, 24 Apr 2025 10:37:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t3d-0000000DXZS-0qAO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 09:39:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D81B1063;
	Thu, 24 Apr 2025 02:39:43 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5B5FC3F66E;
	Thu, 24 Apr 2025 02:39:47 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] firmware: arm_scmi: Add polling support to raw mode
Date: Thu, 24 Apr 2025 10:39:39 +0100
Message-Id: <174548753045.773263.4405616321402423622.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310180811.1463539-1-cristian.marussi@arm.com>
References: <20250310180811.1463539-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_023949_289402_9EA23DEA 
X-CRM114-Status: UNSURE (   7.32  )
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

On Mon, 10 Mar 2025 18:08:11 +0000, Cristian Marussi wrote:
> Provide a couple of additional debugfs entries to enable polling-mode on
> the waiting path of injected messages: message_poll will cause the system
> to poll while waiting for the reply, while message_poll_async will send an
> asynchronous message, as usual, and will use polling mode for the immediate
> synchronous part of the async command.
>
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Add polling support to raw mode
      https://git.kernel.org/sudeep.holla/c/07cb8c324b63
--
Regards,
Sudeep


