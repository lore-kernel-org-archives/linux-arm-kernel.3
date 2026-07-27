Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6F0C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQJDwppTbenN9i1kslHGqMMbg0eBRFfA6rG90oLttek=; b=aUtpIovIJGlxiPgvPQmaOyq8rn
	+HLVAc8+GKI4NstPUIelsoOPIDtvHfRxEb5jTTIiJQuLt3rZJjlt5qtox8F7/5pNy4Qz2o2gFzo8U
	2sdxAgHnBJsb/E2wiC5cTc6vTIbKAfE0gJucaflY9LH56tM+6rpJw6rg+ySe8LQw8cz0Zg8Pv2QrF
	Qw0G9IbeFBIOo19ecloP1X7FLEXCajLhGSKYpPpXTHSRHKL9X8B4jF+JJk93LNgNg4d1DSKGfsapr
	ZI5IQKYNm+KvlttynOtMteAxBC+EVZ/9dmPpbG2n3axiAZ1A9sQrJ8bOGo3/D8uRKKWQT57+exhWQ
	diFvjjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woI5q-00000002Otl-3SN0;
	Mon, 27 Jul 2026 09:57:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woI5p-00000002OtY-2ooJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:57:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 483F141377;
	Mon, 27 Jul 2026 09:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702531F000E9;
	Mon, 27 Jul 2026 09:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785146273;
	bh=YQJDwppTbenN9i1kslHGqMMbg0eBRFfA6rG90oLttek=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DPpOmaU0NxzDbdXd0JKhBfLhp/WSyqhSgzpKGorhp/ECw8rGNAcG6+2ZyeqZ4HdXI
	 Id2PKM+lic4xqSbPvNauVMhZYblAny5sjy53RWii2Xez6IDErVD4NvwMjeZ1n0oOK9
	 cHtuW3DTVjsOYxMfoiYDVhCud5RwdakzaS1Za1JHnPq+oVbz3wpP2aVVTqnW9HYSq6
	 x+s9sgOMXFD0RQu9KlsZ7GnCrF2upFbkwH5tqyQTpfXrAvUVsplYeV59CWHOv/4V35
	 DUBeZy/Ln9XM2TTDL/zVKiSJzHe5Q0nh4X06Ib2W24Z/IlU0zkOZnvtUucruFcJs1t
	 cY+337Pc5HZ9A==
Message-ID: <0e740755-9eab-424e-803e-a956740994fb@kernel.org>
Date: Mon, 27 Jul 2026 11:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] soc: fsl: dpio: Use scope-based resource
 management in two functions
To: Markus Elfring <Markus.Elfring@web.de>,
 Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Roy Pledge <Roy.Pledge@nxp.com>, kernel-janitors@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <690827f2-e746-4378-bb7c-9948cd69dc15@web.de>
 <d95d2f4c-f3cf-44eb-b61b-79ba7891674d@kernel.org>
 <d2e5df25-c8b7-4ee6-8ebf-1725542baabd@web.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <d2e5df25-c8b7-4ee6-8ebf-1725542baabd@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Ioana,

Le 06/07/2026 à 12:36, Markus Elfring a écrit :
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 6 Jul 2026 11:42:10 +0200
> 
> Some adjustment opportunities were picked up.
> 
> Markus Elfring (2):
>    Use scope-based resource management in dpaa2_io_store_create()
>    Use scope-based resource management in dpaa2_io_create()
> 

As the (new) maintainer of drivers/soc/fsl/dpio, could you have a look 
at this series ?

Thanks
Christophe

> 
> v2:
> Christophe Leroy requested to apply the attribute “__free(kfree)”.
> 
> 
>   drivers/soc/fsl/dpio/dpio-service.c | 37 ++++++++++-------------------
>   1 file changed, 12 insertions(+), 25 deletions(-)
> 


