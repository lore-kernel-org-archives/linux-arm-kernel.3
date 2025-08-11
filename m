Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EF4C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 09:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvFHSGZwLN3YwiP0saSyRjb7os0te5s05A7sOxB9tag=; b=MpLVuBz9TP6GOAaiiceAIRiHFR
	ssBtN986q1TDsFymJLT8kQ3xXqdmfOoaRncNqVYkPm9m7oLELPNoi0cqhMazXvHLwldVfWlRuhfOw
	TGbwFnp194Y7kaV+txGoDLWXA3uIK5BmXb40m73106V5ePz2+MRUFcrdgh74cpsXYeUnK5/nqljIv
	4Bjb1QkjK9KT1rmbPiTupbrxd/sTZRXVPlL6PPiMGAIDZEUXaA7n3VQruxENJvWyJJekxtpgy1Ozl
	7Sp/TVvTo5ettAtXh2Z9jWLOYQeinCPwmFbkfE8C+Nuqgn05uwkKqZAQsSzQzcOZ57uAOoQglrlVt
	YR/ts6sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOuv-000000079Il-2bSZ;
	Mon, 11 Aug 2025 09:34:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOru-0000000782m-3Bho
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 09:31:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05D07152B;
	Mon, 11 Aug 2025 02:30:52 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4899B3F5A1;
	Mon, 11 Aug 2025 02:30:59 -0700 (PDT)
Date: Mon, 11 Aug 2025 10:30:51 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	"open list:MAILBOX ARM MHUv3" <linux-kernel@vger.kernel.org>,
	"moderated list:MAILBOX ARM MHUv3" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] mailbox: arm_mhuv3: Remove no_free_ptr() to maintain the
 original form of the pointer
Message-ID: <aJm35DGRj2RZ7W9Q@pluto>
References: <20250811082536.377896-1-liaoyuanhong@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811082536.377896-1-liaoyuanhong@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_023102_844484_6A5C962E 
X-CRM114-Status: GOOD (  15.01  )
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

On Mon, Aug 11, 2025 at 04:25:36PM +0800, Liao Yuanhong wrote:
> Remove no_free_ptr() to ensure PTR_ERR() consistently retrieves the correct
> error code.
> 

Hi,

> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/mailbox/arm_mhuv3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/arm_mhuv3.c b/drivers/mailbox/arm_mhuv3.c
> index b97e79a5870f..0910da67f8a1 100644
> --- a/drivers/mailbox/arm_mhuv3.c
> +++ b/drivers/mailbox/arm_mhuv3.c
> @@ -945,7 +945,7 @@ static irqreturn_t mhuv3_mbx_comb_interrupt(int irq, void *arg)
>  			if (IS_ERR(data)) {
>  				dev_err(dev,
>  					"Failed to read in-band data. err:%ld\n",
> -					PTR_ERR(no_free_ptr(data)));
> +					PTR_ERR(data));
>  				goto rx_ack;

Yes indeed the cleanup kfree helper takes care to skip any ERR_OR_NULL
by itself...good catch, thanks for this.

Acked-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

