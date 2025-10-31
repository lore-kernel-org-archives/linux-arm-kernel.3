Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560DFCCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Prc2FqBCKdzHY6nEpuB9LU3Sy57F4RCmA/VQbF5rrrs=; b=xJNOECL+XjWdXJJlUFNooWHLCk
	2nnPIbCuANOwnJr4btrQgVUB8b6i8pZjCU3IU8qEy1+k89Bjqnadauqr61Ud2z7xWbm6zStWiSq6n
	0ZdME64BhG3qsfxt4sBBRyOnLfyH4+Dm35eXFbgbKVU0v83ZdgGcvvKFGG9m3j8CifqvxrcoDo54y
	VzpVlp4Co4Z0ebx5Cm/UWBbCaV8sEAKB332y2E/HDKtS2c/jWJTJLNTRvSmCJTtKXObRHo0+FquDS
	TOmBlPE41GxK1dDBGv5QzVWicGzwGNs6v5lI7FDUpVG2y1UER8VNGEt4hnTQdifuqaDQhnIvNjSM6
	r2++PNvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEs3j-00000006Q0Z-0AVG;
	Fri, 31 Oct 2025 16:33:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEs3g-00000006Pzf-0Anl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 16:33:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6C12C1A17B6;
	Fri, 31 Oct 2025 16:32:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 392CF60704;
	Fri, 31 Oct 2025 16:32:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12CD711818025;
	Fri, 31 Oct 2025 17:32:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761928374; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Prc2FqBCKdzHY6nEpuB9LU3Sy57F4RCmA/VQbF5rrrs=;
	b=a7ywpVnHwP3DxXaeUHlnNNOmBr68JW6/D8Sdwho3OVgzpATcfab+7qTznAIsRfgUC0UjcM
	Ck+5JRJ4G6j9mqujE5RF3nX80IIkAgSgfA0LnNCVMHDZ/gmCBXVi/PIUkX+FMk/A3GvmTJ
	SUOyt2bKTHr5ykKw1g8WKy6cGw6KhQALaV0IZebpYoGbrkmCrgfGY390B2shmJ4JWBA8K0
	zfLffb1eHwV04MuniPkW1+l8CTFIw1+2ub3U6vvoaOwthYagCvsMK8ypY4WGRRJ+S7u2Dg
	SvXmR3qCclupBXLg4FX7hYdt+qWBbQ1rFcXox+HWN3M+r0WhhpD85PAovVCD8w==
Message-ID: <08518010-3997-4e11-b17e-94765e9c1ca9@bootlin.com>
Date: Fri, 31 Oct 2025 17:32:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/4] net: altera-tse: Read core revision before
 registering netdev
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Simon Horman <horms@kernel.org>, Boon Khai Ng <boon.khai.ng@altera.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251030102418.114518-1-maxime.chevallier@bootlin.com>
 <20251030102418.114518-3-maxime.chevallier@bootlin.com>
 <b72e0572-6000-478a-b125-93f079944ace@lunn.ch>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <b72e0572-6000-478a-b125-93f079944ace@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_093300_217906_F1A946A2 
X-CRM114-Status: GOOD (  14.92  )
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

Hi Andrew,

On 31/10/2025 17:15, Andrew Lunn wrote:
> On Thu, Oct 30, 2025 at 11:24:15AM +0100, Maxime Chevallier wrote:
>> The core revision is used in .ndo_open(), so we have to populate it
>> before regstering the netdev.
> 
> All that open does is:
> 
> 	if ((priv->revision < 0xd00) || (priv->revision > 0xe00))
> 		netdev_warn(dev, "TSE revision %x\n", priv->revision);
> 
> So i agree this does not need a Fixes: tag.
> 
> But i do wounder why this is in open. The revision has already been
> printed once in probe. Are values < 0xd00 or > 0xe00 significant? Is
> this left over code and some actions that were previously here are now
> gone?
> 
> Maybe a better fix is to remove this, and make revision local in
> probe?

You are correct. I was focusing on leaving the existing behaviour
untouched so I didn't dig any further, but now that you point this
out, we can definitely simplify that.

The revision is read from the priv->megacore_revsion address, and
stored into priv->revision.

The only other spot where this could have been useful is in
altera_tse_ethtool.c, .tse_get_drvinfo(), but here we actually
re-read the version from the registers...

So indeed we can keep that local to probe, print a warning for
unexpected version, and just drop priv->revision :)

Thanks, I'll respin with this.

Maxime

>       Andrew


