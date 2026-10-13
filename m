Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44250CC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEa+Rdu9+EfuAYgmCjCGvhNSYahtyd7A0zbUlfTjoks=; b=yYuEviMjt5wKOXhBccIELg9FDK
	C00AqczP4MRpLPEqc64Ihb+iEGSY/aJ7E4gihk43XPwc9GeX2jALhlXVFSGRvLYaHTLy13fwIb2Oi
	Ii6iybA1v25ASIuxtTu0f5JjIZkY12DvJR3LMqV/Nil6zxWp6JRn+249SzyX38irkLq5Gwjvc8TdD
	m6cRZedNZIQ9L+uLnWhmxE7mdiFl/0Q53BZvvKXq1wRHX2et+xCFTQMX+cxFm2zAoesQTo/HhmGix
	50q3cgymzj0y8hC4olxi4ruGRSA98ybDU95wypaNoIDqqTlyQGKxwz796JWn6ymVvCUG/oVQNPBAH
	xY7kzdfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHN-0000000CUs1-2Sva;
	Tue, 13 Oct 2026 09:58:41 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHC-0000000CUbh-11CX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:58:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A370DC653E6;
	Tue, 13 Oct 2026 09:59:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25E1B60362;
	Tue, 13 Oct 2026 09:58:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3EBC11D7017F;
	Tue, 13 Oct 2026 11:58:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791885506; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZEa+Rdu9+EfuAYgmCjCGvhNSYahtyd7A0zbUlfTjoks=;
	b=u2oKYqNrsffIJJl9wdO6pP/oLGOSIm88BphtIbxi6xl/dc1yLIvFx3d6uBPLrpl3xLiyY8
	YMNp00e9oq6fCGZvI2EbtEcbkUbQDQC0bdocHGz+vjAYbX4goO22X1a/hQns/CnoTGgP3q
	Ji1UIObrKcCPvqF75TRQhOEEVCjFKSu4tycAXvxKxZ+HwQMSgxNfkXsu02NhOYQB3Y2sUW
	RSZNPMmJd71HAHVzawjz2x+vlQB2eMW9Kf1g9eqr3YIMVFqeZ00VE1LbA9KM0iGS0TLo3q
	AJcehyb1E6hjDeRzado5DSWFAAmdLKrDWmutZtCv5bV42gwlDtAiuHq4gpfXQg==
Message-ID: <b3cc2212-c6d4-4e28-9181-6f8a474f5f31@bootlin.com>
Date: Tue, 13 Oct 2026 11:58:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: fix mqprio and cbs combination
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Davide Caratti <dcaratti@redhat.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Daniel Thompson <daniel@riscstar.com>
References: <20261012-stmmac-mqprio-cbs-combo-v1-1-831e323eb4ef@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261012-stmmac-mqprio-cbs-combo-v1-1-831e323eb4ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_025831_302500_3BC68991 
X-CRM114-Status: UNSURE (   8.41  )
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

Hi,

On 10/12/26 23:14, Lorenzo Bianconi wrote:
> The channel-mode mqprio offload and the CBS offload can currently not be
> enabled at the same time. tc_mqprio_validate_chan_mode() refuses the
> mqprio offload as soon as any TX queue is configured in AVB mode, and
> tc_setup_cbs() refuses to enable CBS while the strict-priority scheduler
> is active. As a result the combination is rejected whichever order the
> two are configured in.
> 
> The strict-priority scheduler selected by the channel-mode mqprio
> offload and the per-queue CBS shaper are independent MTL settings and do
> not conflict, so drop the checks and let the combination be offloaded.
> The following configuration, which was previously refused, now works:
> 
>   $ tc qdisc replace dev eth0 handle 100 parent root mqprio num_tc 4 \
>         map  0  0  0  0  0  1  2  3  0  0  0  0  0  0  0  0 \
>         queues 1@0 1@1 1@2 1@3 mode channel hw 1
>   $ tc qdisc replace dev eth0 parent 100:2 handle 102: cbs \
>         idleslope 800000 sendslope -1700000 hicredit 494 locredit -1049 offload 0
>   $ tc qdisc replace dev eth0 parent 100:3 handle 103: cbs \
>         idleslope 400000 sendslope -2100000 hicredit 247 locredit -1296 offload 1
>   $ tc qdisc replace dev eth0 parent 100:4 handle 104: cbs \
>         idleslope 200000 sendslope -2300000 hicredit 124 locredit -1419 offload 1
> 
> Fixes: 47891d501e34 ("net: stmmac: add tc mqprio hw queue priority offload")
> Tested-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thank you Lorenzo,

Maxime


