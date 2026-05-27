Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0749CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 01:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uN5DfBzCdxgMtcbb6Yn1Crv8Mos2ktrmL1d0GO1AHx0=; b=OlGn4mgA4PhC5R+y3NRotITxRK
	lSlajJRHNL5PVf01+teEvEMzPdbplTdyUyULceeb9Y1hkdWFAlGI7W+fHkb1qQ7jWeNxTQtJEaY05
	RgVwEo0HlKQMPq6nBa69z5X/ftNAKGv/zAXYfBSag2DteSJoTovZX8KSqAw/IxQMs2r/XBfh4oYrP
	J0nb6SNAjuJUV4pAYfAQa8g8kO+sy2jMPgNBaxhIojP3rQju2+byGKI2+YqGMyEcUbNysU3AucdQE
	q1ufoqEdP1X50JG12Be0r7f93qlgvuQeKW0mGYDBWO4U+DVUOSyjavaihLMYhEH8XoNX8p5ci+BsK
	yDHWE+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS3HA-000000038LC-2iAs;
	Wed, 27 May 2026 01:41:40 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS3H8-000000038KN-1d8b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 01:41:39 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so36615986eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 18:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779846097; x=1780450897; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uN5DfBzCdxgMtcbb6Yn1Crv8Mos2ktrmL1d0GO1AHx0=;
        b=lhJ8yx5wuxIEbh3Z420v2Js8mLc6UVzhhOlXJJqM5gUmZvNXhzuCDFoeWjj2XJKFH5
         ix1oD85w2Vn+CiwDRFKzyzMsokKEI281GHBERLTdqwICX10xiqOZ1CHNVv7i+lGjYGOy
         +VDINDwhKgJa5yMaYNwwyC/U8cNNnb2FQxDI19Pf5k9eX2mypDz44j7VJ5W24GeeDZwB
         JQyK7ZKEdtOa4mFL2Q0snHxE1yV+OFv6E6wOeBlYdC1f/euShypHfGAMtDrbThsnyxt/
         PU7GFU/iFfKBdala8MC5LMZ1SYMfcT9IBw2doWDN5BGMsDDl5tzWkPjHw+AiKb2xCTSv
         L92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779846097; x=1780450897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uN5DfBzCdxgMtcbb6Yn1Crv8Mos2ktrmL1d0GO1AHx0=;
        b=oXVSgF5bRuP8hRkt7aUOSMdhH2WOpvCPJa9X2TeK9WCNYNg8muYzWA1vOrH2incv+p
         E1bySIKqcjVkZ9ROtBCeb7rSeQZSllwvelPFHmM4NJxVC0FIK9RD9TxXvSVB5/esmrZB
         2BCtNcHHppA0DsFyI8ovUBCK1O8ZmDEWeoo8dL3od41+p7z1Krq2NtB94QsfSBzXgtLE
         WYDVEkU6vXo17NUJsMTVIJdNVTuNAV8mgyXs7jWvaFBIPz75SvtgAT3bxErL/EUvvcQ2
         QwSRm0lKYQvk0FaI8n+Q+Ax12aFKX1Ec4j5WPffCuavWHTa6C7zP+7btnoxNx6dcuHJk
         uSLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+bKVcn4Jp1/9BDD7sIaTOa17figY5288INmkQuOa8acTx/HYyNETFxch7+0b+W9HqBlTGKZG7Kp9QMIJnrpJ5z@lists.infradead.org
X-Gm-Message-State: AOJu0YyqboCqcRKZxeIEOjjw81V5W+uTDp2AfEKo2GJ4GYtChb78BvNd
	QQNmbO702ni1SEQ4JOhAzmhpnFEWh85QZFkwc/DtHR9pD+cgAWPzrzsg
X-Gm-Gg: Acq92OGim8+KDZZS9GuR83Mc6ZfTPVw12gw/VxmAZT5C11G4S8x9LiB6iz0OwJe6xrw
	+adsQwpldlvT1emm6vAri0Z7YMw5xwVenVB9CmX91CuOWtzTAqwiOmjGMm5HgMLNAcQSQ9spiVJ
	LJFXl+wrdjMaUPzs539JZ1IrVR3cOiA9g5jW+pwpsXUIAWRNMAchjcj+Bv7UH/Gd7L3TDjHHpZF
	UfrjLtSZFCYVd9B1MAYxdsTWsuoqXP2iJi4amPBZYpdz2IfU3fwHlkryeFUbefOb7pMSkkmewE/
	ZSECtzCUXolTh+EXrI4frmCplUs70hXqvSI02Fs9TXg+ofmT1B4G4dhL1zhFTGRfbMVhAoBd4ku
	pgyv0BRQabqjuq6kfBB8tlw8i0/3vNwWu51EFxEWFj2TcPHJStDx8FoL1MO55lM8p0VOeO6Vsdf
	zzSl6AhOQju17NJEjBtSForEusL4a4o9kGgNeEKmEwL7SsbHBB5sbQsNpHc+piyEjTF40u1GHKC
	pY=
X-Received: by 2002:a05:7300:4305:b0:2ef:1d11:18ae with SMTP id 5a478bee46e88-3044912c25amr9993942eec.28.1779846096801;
        Tue, 26 May 2026 18:41:36 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:912f:eb49:d713:7401])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304a57c04f8sm3258965eec.11.2026.05.26.18.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 18:41:36 -0700 (PDT)
Date: Tue, 26 May 2026 18:41:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-input@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] Input: mtk-pmic-keys - match loop with count
Message-ID: <ahZJ2Opc2K7WLZKF@google.com>
References: <20260527004543.22875-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527004543.22875-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_184138_424610_AE95FB11 
X-CRM114-Status: GOOD (  21.27  )
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

Hi Rosen,

On Tue, May 26, 2026 at 05:45:43PM -0700, Rosen Penev wrote:
> of_get_available_child_count is used along with
> for_each_child_of_node_scoped, which can cause a mismatch when keys have
> a disabled status.
> 
> If a disabled child node exists in the device tree alongside available ones,
> the loop could execute more times than the initial validation accounted for.
> This might increment the index variable past the allocated array bounds,
> leading to out-of-bounds accesses on irqnames[] and keys->keys[].
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index c78d9f6d97c4..5d4ebbafd276 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -363,7 +363,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	for_each_child_of_node_scoped(node, child) {
> +	for_each_available_child_of_node_scoped(node, child) {
>  		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
>  
>  		keys->keys[index].irq =

I think Sashiko correctly points out that this may result in incorrect
register data and interrupts being mapped to the keys (potentially
shifting them).

Maybe we should stop counting nodes separately, iterate over all of them
here and bail out with an error if we encounter more than 2 (does not
matter if they are marked available or not), and then skip not available
nodes? WDYT?

Thanks.

-- 
Dmitry

