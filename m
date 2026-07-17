Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2BDC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 16:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTNiDs+YQP5gErq+/6PIKAwZFcni80aDhJBtKwTwBbg=; b=Chka8gPC1W4AJ4wLcKLp+0X6Pr
	KKGaqbVlh+rbw9EEWHN50zw5bBmXfhHBLoGGkyb7/NIdLG7ZJ0QqpYUTeyMSsMXIhl3i8VRLVLtrq
	ykxWGuW1yHJOa6lT1JffDqgpp6hQEUgEZqnPuvrMSAZnqC8Ao4bOzHilHsJa8HhAbkFP2DzUgHRGT
	v5I9cNJZEDX9IqOMh9HVN5KZ2Woi39eU8qwbgb1THOTgEXh3AVETP0cM5yNLv2RtHBqpDNLjhU4fN
	RWkaO9iIocaoxaDkuCM2+38/i6tsksmmTNh0zYg1j6h9p8HyNXpeyfuVsw81coXKe/mkc2PNkuzVj
	teVt+HvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkl5M-00000002hgK-2wUB;
	Fri, 17 Jul 2026 16:06:48 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkl5J-00000002hez-3Tw5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 16:06:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493c19bad03so62820515e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 09:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784304403; x=1784909203; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BTNiDs+YQP5gErq+/6PIKAwZFcni80aDhJBtKwTwBbg=;
        b=l4P1/QkK4M2tCapXMyps7xxxTCnfeulxZWzD/gIgbzBw+IcG1npaYPS0bSUdRb9nYU
         zLsIRarwqfkhlz8dcRma3zC0tnJjh+4VyWUbz0AMwN9qn+VLmSDYNOpmWluxCAF2Wvje
         +sKR7negDiIbCRb1ZZaLR97e0Y3d9G0A2FeB9I75U+5iRD6aik4ICtzq815gTxDtebS/
         dxltXK+y0zZqHsZozZhmb9kuTwcEITuAbcIHl92KjHa29RpekDDRwABxIjFUXglnfYE4
         He5v1MyabYNPPgoaFvXp09gNxwEMARobmfoOk8PeKzrIHUd+xbZqL37xURgBRxwXRaka
         oa3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784304403; x=1784909203;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTNiDs+YQP5gErq+/6PIKAwZFcni80aDhJBtKwTwBbg=;
        b=QZMf//9Vh38LLiRfZsyoY55qDbigQTojdbE9U3t1lYqdOVsz2b7yiUYgydRL32nGo+
         oVWkjTMts7BO2Yy053OnpyYbO9RIwcaayiKoss0VJqVnDwKBK9+aOIGwwsuROC/cs5x6
         SsSiR3UPHR9gWjoQAiUcWG7Aedc95Bcu3D6c/LpCHDqNhFYSFfRFq174kKXIKGHjxrnL
         ESo1FP3wG37kLYEfXCa+4fSqc2mEcSUjIcJ1103ddpSKcGHkwFvLOTkDyBJ75B8TMngZ
         QGlCA+US380P/laZS/ZCYNMO3s+9TT45FNWhmKw6TUMvCY6kI51y6eBNuUOqh5yL4pw9
         QvFw==
X-Forwarded-Encrypted: i=1; AHgh+RoVNDS78DSHqKZNEeSFFPG3ntyh1bBO4GRt0M3bVTKjJmjwQ20vrGwxjUfCv9JueocdfVIXOszEqzxc2BgPPJVB@lists.infradead.org
X-Gm-Message-State: AOJu0YxtsgFQaVZ+UEXaiCoazHRNysr+xatrb9ZiC9AlG67th4k4eWm3
	cevY918eEUfsdfZLG7CYO2wWtx1k4nXpcgCmWqNpwROoc7UiDx/BO5Uc
X-Gm-Gg: AfdE7ckzIr0L+9ra0VtfdNFdhqlZZC64d26U5BPZIWQ40QMbYiSqoCY0CcaRHxHEY7+
	J2UcP1dVrS0cTdtw2Lvcag6BB8nzDSu8CPzZsHv0xBw0sENR6Y9XXfhxCuHjOJWz0rWb8Zo7CU+
	SWfI+J0qDoIv/OUGpSEV9UnNRcV9/t7TEjyD0lZenjX3vp1pjEDxCfRR9fZZtgbX6R/cUnf1syN
	GTKrBGCcVooOK5HIqUJXVG4ghOgtsoE/2nRrBmvTp07MfFhmeGUr8xMoT/zGtkv25kVXfW5oNux
	UjQ2zSCzTmtWTcqJE+9fenq30Ul9H3h900kDZjMjBKk2KJdp1NRgt8QKY5Xlq+XcKLBxxHHnx57
	5ITn4+Ok35XffiPi4HbEZZyiVlRiQDL3LxZKPxsBIx+vgAD8AC+czBuhApbkGD6ZiGUB6LhbE1w
	==
X-Received: by 2002:a05:600c:4453:b0:495:4f62:1ff7 with SMTP id 5b1f17b1804b1-4954f622066mr5214955e9.17.1784304402908;
        Fri, 17 Jul 2026 09:06:42 -0700 (PDT)
Received: from owl5 ([2001:861:3201:3d10:d4b8:8874:bdef:21b2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954ba2abd0sm37795105e9.15.2026.07.17.09.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:06:41 -0700 (PDT)
Date: Fri, 17 Jul 2026 18:06:40 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Adam Thiede <me@adamthiede.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
Message-ID: <alpTEPsy-SIQv_Oc@owl5>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <8733xko1ms.fsf@geanix.com>
 <0f719c00-3cf5-4403-afbf-713b07255981@collabora.com>
 <aleM9Wy9otpd6Je3@owl5>
 <aRN3_2FHX8XmTcwduTAPwz4UFde4B0tbB09ajyeUg5qZxiIYMmbvMkG7CPoNTl4iySYMZawbLMWijO47R22gkg==@protonmail.internalid>
 <65558ccc-4f2c-492d-8c74-627d27dce864@collabora.com>
 <87h5m0mkca.fsf@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5m0mkca.fsf@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_090645_880560_EBC2FCC3 
X-CRM114-Status: GOOD (  26.40  )
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

Hi Angelo & Esteban,

On Wed, Jul 15, 2026 at 03:52:05PM +0200, Esben Haabendal wrote:
> "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
> writes:
> 
> > On 7/15/26 15:36, Gary Bisson wrote:
> >> Hi,
> >>
> >> On Wed, Jul 15, 2026 at 03:25:11PM +0200, AngeloGioacchino Del Regno wrote:
> >>> On 7/15/26 14:53, Esben Haabendal wrote:
> >>>> Gary Bisson <bisson.gary@gmail.com> writes:
> >>>>
> >>>>> Some bridges, such as the TI SN65DSI83, require the HS clock to be
> >>>>> running in order to lock its PLL during its own pre-enable function.
> >>>>>
> >>>>> Without this change, the bridge gives the following error:
> >>>>> sn65dsi83 14-002c: failed to lock PLL, ret=-110
> >>>>> sn65dsi83 14-002c: Unexpected link status 0x01
> >>>>> sn65dsi83 14-002c: reset the pipe
> >>>>>
> >>>>> Move the necessary functions from enable to pre-enable.
> >>>>>
> >>>>> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> >>>>
> >>>> Hi
> >>>>
> >>>> I have run into the same problem, but in combination with another
> >>>> pipeline. I am seeing same problem with an i.MX8 using the nwl-dsi
> >>>> bridge and the dcss driver.
> >>>>
> >>>> I have submitted a fix that adresses the problem in the ti-sn65dsi83
> >>>> driver instead. With a bit of luck, it can replace the fix proposed in
> >>>> this thread.
> >>>>
> >>>> See https://lore.kernel.org/all/20260711-ti-sn65dsi83-fixes-v1-2-d85eb5342b98@geanix.com/
> >>
> >> Thanks, just tried it on 7.2-rc3 with my patch reverted and confirm that
> >> it works too. My assumption was that the SN65DSI83 was locking the PLL
> >> earlier for some specific reason and therefore was reluctant to change
> >> it.
> >>
> >>>> /Esben
> >>>
> >>> That clarifies a lot of things.
> >>>
> >>> The patch on mtk_dsi shall be reverted then.
> >>
> >> Angelo, do you want me to offer the revert patch? Should I wait to see
> >> how the other thread goes?
> >>
> >
> > Gary, yes please, send a revert and make sure to explain the reason why
> > we're reverting this in the commit description :-)
> 
> Maybe test if my fix actually solves the problem with the mtk_dsi driver
> also ;)

As mentioned in the other thread, your patch works but it might break
the init sequence recommended by the bridge datasheet.

Moreover, the drm_bridge.c doc [1] does mention that the clock lane
should be initialized during pre_enable. If we agree on this assumption
I believe my patch should not be reverted.

Maybe Adam's bridge driver must be patched instead, just like the
nwl-dsi driver should be updated to follow the drm recommendation.

Let me know your thoughts.

Regards,
Gary

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/drm_bridge.c#n169

