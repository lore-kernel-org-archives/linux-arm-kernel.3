Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2964BC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 20:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9izLyMp/5i2KVR8HOm1zZ4f9E3YGtMOgojviQ95lSU=; b=eE8ZG3kNOjM3vmxihUFPq+CZR+
	dHIQxzj/ZNYMgPizZsTuPRjgRhoXS8XJxDFjYJjKp/bjN2Knc+jJk563Q6iVggIi+R3/G8tuBETs7
	JS4ETWzCSbhicHiSd1u0c6VDt7LKdivWpDsRaLJA5IkleORHWJc3Pxg1RntcLPkScXBs994KsZ3MO
	/5YVilcvV0QwD3jAogLVvnmAqKskQX64sL2LGZktXk2fy6bJgPqoUg7OvnO1AfJQSM9mWXgYylyWa
	PtreNLXaXPfVpL8hZvzfKFygMPTGERHFr9B49NkzAPdlBeOqaNX3s3QMUZewzldxZcSaL6R6FiSVN
	/rno7/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18xf-0000000AUrE-2one;
	Mon, 31 Aug 2026 20:50:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18xe-0000000AUr5-04rH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 20:50:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 29BB660053;
	Mon, 31 Aug 2026 20:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE8A1F000E9;
	Mon, 31 Aug 2026 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788209432;
	bh=o9izLyMp/5i2KVR8HOm1zZ4f9E3YGtMOgojviQ95lSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CV8CJneHdMj4Q16XsW4JGLt17n4ejprHffEe/4jovFLmTVdNKI9G3tCosk828bLMf
	 USoCxIqNNKXexEwK4llgOF6FHg0eyHr/uhrKdnbGHRRiSz14/XyreIDy10VJXpbM7Z
	 hkE7LYGFVbdSvJfSO14YDPtkgWDpSWAQ7avTDEag62tXd1h3sockqMhN7gL/pgubqy
	 l99o6j9LJ+EaVd1/9GUA7Hv233BD8ngMq+7sJRCw3ez4Hed3tGWg3OSnyG+Fd4ZZNo
	 qo+tN0dLTq/bAGPcZFztGOcWhN/nb1D2Q5dWpecf3e790Mlvh8iVQrVJZdb78txmQR
	 hbtOKeL6PMKvg==
Message-ID: <2b5dd31e-396d-400c-aae4-4d476f7ca880@kernel.org>
Date: Mon, 31 Aug 2026 15:50:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: socfpga: select the PL310 erratum 753970 workaround
Content-Language: en-US
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260830142244.37216-1-pengpeng@iscas.ac.cn>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260830142244.37216-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 8/30/26 22:22, Pengpeng Hou wrote:
> ARCH_INTEL_SOCFPGA selects CACHE_L2X0 and several PL310 erratum
> workarounds. The 753970 workaround is still conditioned on PL310, but that
> Kconfig symbol no longer exists, so this one selection is always disabled.
> 
> Select PL310_ERRATA_753970 directly, consistently with the other PL310
> workarounds required by the platform.
> 
> Fixes: fbc125afdc50 ("ARM: socfpga: Turn on ARM errata for L2 cache")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   arch/arm/mach-socfpga/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied!

Thanks,
Dinh

