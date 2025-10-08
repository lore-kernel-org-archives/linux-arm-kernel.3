Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514FECAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 14:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eE9WSxJ3Au9IkBue0v/NglVJ4JjXfdml/DngLu1lSQw=; b=N84WFOnf4hFq5zZBt4Lx1KeSOO
	PMwZd1Rqwatv90hxPs67ojDfyronVPm7gtBL4NZiqe34S4DgfQIdKX48Nb+izhtE9VqJWYxlkb2Ye
	pqp+P06Qd3xD+MBAYYRdPtFkqH78GlqzU1EVLP/0Gd3im1Bbi+VtLJD/iD7F9cugRyIOgW1yqUEOJ
	wQl/5b4M+65+68f0gtcAxyNLbTYtf5b7H2JopyLND7tJdBYkb+2JGuqnK/+iqFf+63kVlYMCsH7LU
	rayAdiE/O5IXxxedoxFnAgYOectB4I+1l695AzzEPyLwww34c+pWQz2nuxoK8V2yttzEUt5vIkA6c
	LBnO2NYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6V2O-000000041vD-1vxE;
	Wed, 08 Oct 2025 14:21:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6V2M-000000041uR-1GZt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 14:21:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 674514376C;
	Wed,  8 Oct 2025 14:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9EE4C4CEE7;
	Wed,  8 Oct 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759933261;
	bh=Sx0SteDPRmJFcqg50YxwV4lcQ6BV5pFc2BTLLbYJImQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=czJf48BdGtP5MgMondaHstZGFYGR0tzbfaL68XXOI4uwNSBO1Jv4RQUFPJEfrifZ9
	 rcr0hmc4lb1BkYgE+FO4EHrDTmOq3Hxjrq13wFo+zh0xo1o6wpa5OcLyeix9RKdaWr
	 fN3EMCsjmNnFLTVEVP2Xrn6GE9NSnl0lMbkOQO4ADKIJXnzSfkrlxLKhoHPe039ujz
	 S8aoWS1OFyQ4e87+zQrReV0PeS1bqNHEUhD564fEnlhTUFoWlqTxeRo9WXr1NC7rq6
	 8qBmxi9EuzUPQ4OuShSQIrK0FJRr7175ax7tbxPzfdn1pORS0PjjoL4YNtw3MHn/Iq
	 dgm0MS/vkbcBw==
Message-ID: <82605ddd-d0d8-4449-8bb9-9f94b2bde734@kernel.org>
Date: Wed, 8 Oct 2025 16:20:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: macsmc: Initialize mutex
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_072102_367040_421D3324 
X-CRM114-Status: UNSURE (   5.95  )
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

On 25.09.25 22:33, Janne Grunau wrote:
> Struct apple_smc's mutex was not initialized before use. Surprisingly
> this only resulted in occasional NULL pointer dereferences in
> apple_smc_read() calls from the probe() functions of sub devices.
> 
> Fixes: e038d985c9823 ("mfd: Add Apple Silicon System Management Controller")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


Thanks,


Sven


