Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1072FC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzANICZPcrQ4mfbgZVA3ED3GO6T9Lf7g8EslsvNWAkc=; b=pn4i1q+/bWLp70MokTH1NDyue7
	UwZL+TLtbsaPlRtdJBkY224U99gbs6zI04Y/yAI1eGyWjRWYB5tbA69S0BJuaFeqnu3ICVtlc/ByU
	xpTF+OQrwOs7wJ0KjCT2h7GVy3VGH1xuDMzZq7ffyNg3+lEtbuy7o2vf2X2cJkS71XNfXMv0B+ImX
	lC3f35/MxsDh3w+shJBz7Rc51FTPXJhC+uhP2VOj4x3V5us10/AXyKw4/N5l/HSP4jwcqjT26wZVu
	r5hPYVJsUDvcwpmHO3frf6c/NiqKy6IYNWLa7900ware57faxNMEon4ycG7s++9/JjVGCV9NqAYl7
	kbHG+tng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjznH-0000000ExoF-41U6;
	Wed, 15 Jul 2026 13:36:59 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjznF-0000000ExnD-2bMN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:36:58 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47f36a122fdso2346912f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 06:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784122615; x=1784727415; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dzANICZPcrQ4mfbgZVA3ED3GO6T9Lf7g8EslsvNWAkc=;
        b=IiP2Qda53iKfvzmaMVFsaT0I9yYrRrg7cRh8ZCY/SFOdVHkRw1sUu3TdehDfYQJZnO
         Gd/VVHNNAK5mrOwXso+f4POZ/ErP4YTpX3uzMYRKkHyoMCqjFWp5AYlqa+O5WgldULme
         UigCdnaRW5KqHJ6B3bOd4IUTNQoogayFLSm+FRaPFnJJ/62C4sRMb3wNbs7Ilh+oSXzE
         gS3HA1HG688PY4zeDnxV+A729wXobT5P2GZyETYnD0u7MAI6t/uSpVbg8SXonxbDc8rw
         3kaWl5DaEblA6IibkyEltv6Lgc+9u6duGRilUjOr/ntPXwAazYevDXISCPrT7aYuUs+1
         PllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122615; x=1784727415;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzANICZPcrQ4mfbgZVA3ED3GO6T9Lf7g8EslsvNWAkc=;
        b=mhcLCb65QnbDUrUHj86LBfspUauTJZMYcdTnStlCaO12e8raLMmnQ5l+EBTTzBJUZm
         cDS25jhl44duDYt1whIxe6NRJk9WHbrPz4xhSbdDLnBbku+VnG0D1d5tzbsfDuwUcvSr
         2pr1qMZYMWZrshPDIb9HPCYQ59wGwTO6JkRT0QiARSfE685mC2MebYCH4HwBt3JF2SZG
         fPruSQVqv+z0lgQAhSvN0b3yK8Q7A/zSyt9li6SslBhqMIyAQ7WTvQoDz8Mo/MgJFeLF
         MVSVJ0MPXcvTApPaqGAOJ7V4DMGNfkTr0sExL92b4n4szJgmsvncNmW27Kodsvhv4WT9
         YViQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQ0mRQUa/40XiJOf+Tx3+urNOqcmM/rVCXDZw8sZs7HllJaboXOOPHm65W4kREunR6AHw+kvX7WMXFt22K5e0B@lists.infradead.org
X-Gm-Message-State: AOJu0YyvmQpcV/5IL/CXYpesx9E8Vy5CMDB90KkN/si2MK2PjaFgTcG2
	dPLZbr81Tb/l0zYY5rCGBhZltEljAE3L2bdlws/ZxBB4HctvBNSEcxDS
X-Gm-Gg: AfdE7cnTk2dY3bJX02yffoZH8SvwwYldVfr3R/VyYQuhMkJMBpVsVPUtMmtPuCV+Iyg
	nDHwooGmKs8ecZdC98h85EHC0kRg88TXujTC2o24YeJV6JNINxdDJMC7ID7FiQ8u1cthVHk8/L9
	8MUFdIOOPk9xO1M2YYkUnRsp9DpZjkT0ED3+GxBjv17jz9E4G7neSJYhNBGLrWMf0I5MsIDAjzg
	OfYn1cCQatFlX3wcZg16OPC5+Td6LEZnnL5G7YHzkF9CAFaUIKcvMtfkYmwQoD46pA1QKFr8BQU
	CuwKE7BDITSPxDMtTgsPqFRU4d8X5eBZIxzk2qhC2ODdHHTaGaKgxZ7Dg+38HZUJqTSSakPd39W
	dghMdqCvVe3YgxtPI8NRrfvbFsRs0llrqtwfUXePeer19neTIilgaG1oqOfrrdnM+HnWsx6FsRt
	cfz4+00UpO
X-Received: by 2002:a5d:5846:0:b0:475:94e1:29d5 with SMTP id ffacd0b85a97d-47f2dce942amr20020545f8f.20.1784122615112;
        Wed, 15 Jul 2026 06:36:55 -0700 (PDT)
Received: from owl5 ([2001:861:3201:3d10:e682:163f:4878:db7e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f462e0cb2sm16802692f8f.0.2026.07.15.06.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:36:54 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:36:53 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Esben Haabendal <esben@geanix.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Adam Thiede <me@adamthiede.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
Message-ID: <aleM9Wy9otpd6Je3@owl5>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <8733xko1ms.fsf@geanix.com>
 <0f719c00-3cf5-4403-afbf-713b07255981@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f719c00-3cf5-4403-afbf-713b07255981@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_063657_671676_EB21DE53 
X-CRM114-Status: GOOD (  21.72  )
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

On Wed, Jul 15, 2026 at 03:25:11PM +0200, AngeloGioacchino Del Regno wrote:
> On 7/15/26 14:53, Esben Haabendal wrote:
> > Gary Bisson <bisson.gary@gmail.com> writes:
> > 
> > > Some bridges, such as the TI SN65DSI83, require the HS clock to be
> > > running in order to lock its PLL during its own pre-enable function.
> > > 
> > > Without this change, the bridge gives the following error:
> > > sn65dsi83 14-002c: failed to lock PLL, ret=-110
> > > sn65dsi83 14-002c: Unexpected link status 0x01
> > > sn65dsi83 14-002c: reset the pipe
> > > 
> > > Move the necessary functions from enable to pre-enable.
> > > 
> > > Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> > 
> > Hi
> > 
> > I have run into the same problem, but in combination with another
> > pipeline. I am seeing same problem with an i.MX8 using the nwl-dsi
> > bridge and the dcss driver.
> > 
> > I have submitted a fix that adresses the problem in the ti-sn65dsi83
> > driver instead. With a bit of luck, it can replace the fix proposed in
> > this thread.
> > 
> > See https://lore.kernel.org/all/20260711-ti-sn65dsi83-fixes-v1-2-d85eb5342b98@geanix.com/

Thanks, just tried it on 7.2-rc3 with my patch reverted and confirm that
it works too. My assumption was that the SN65DSI83 was locking the PLL
earlier for some specific reason and therefore was reluctant to change
it.

> > /Esben
> 
> That clarifies a lot of things.
> 
> The patch on mtk_dsi shall be reverted then.

Angelo, do you want me to offer the revert patch? Should I wait to see
how the other thread goes?

Regards,
Gary

