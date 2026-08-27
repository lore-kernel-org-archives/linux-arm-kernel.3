Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882B7C5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 07:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nrk8uUDBNanFfnr96a4o3nFXywW6wHqNdCn0K9fnuO8=; b=vH7xBelpQKETCLT+xHV6GOlrML
	kAz6CXt8pVAZ1SUv1FjZz4u3T8YITvSdrm5JXX1XY+CDiO9eGBACJXKoJMfGhmIO5vqfbSoHvVCLn
	ABQR5A0W9X+b1nQWweFQfOBpc56x0Dflw2vI/fhHQWGJK/rzYlb1uIB9yuJtIe6h1q0Wkok3LUP8z
	aL30UHtQU2nI+XgY3idg1Ipfc3qVi0Xk6oz0BlBidZKDeblI5QQIaoZkzfsv10+f8mgGo2Z29iXIx
	Qjbui+rM9WbFIeWt7JMOlWtmTTfT21JVuam64dzpeMy3Uf8fiCUuGdwe16/a5FNJzSTDGMtPYMwUO
	KJLnVsBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzV08-00000003aXQ-3MLi;
	Thu, 27 Aug 2026 07:58:20 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzV05-00000003aW6-3jQg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 07:58:19 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38e041ea211so417940a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 00:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787817496; cv=none;
        d=google.com; s=arc-20260327;
        b=Klx+TQX9Y65n8dZP23nZHuroJzWWKgzLSyZNU0QoMeAbHja9SmWiUxdc+sxf/XDqm6
         zDKAgT3dJcOjaRIVmY2kIOGQnuI9laqf26gnxo9TkqCYYeL4d7YTMp8+RREO7ugOUyPk
         BET5XBgmPGostKL9T+zwRfeN6zdskBzrukg2z3gueMVIrAIiNn1Pz5mw6XR+6Hrml00g
         1AB3ncOU3MXE1jElsuzPY/27YOjYhFdmllaHlFEzGob/zxYynScJmN5DktgpcSMz484+
         QodA06sxYKHex53HgXnzW5iUvwuGm2Tuw+tIAriLkyuKN+IiRnoOpIYQiZzG8qAC8Vab
         ZqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Nrk8uUDBNanFfnr96a4o3nFXywW6wHqNdCn0K9fnuO8=;
        fh=MC4IYQhvxw1QhhYGuIj4Wq1m00epdEyulYTgnecY1dA=;
        b=IshEB4ZWvRbLVFe/Cf0V1l2uy6w5YaXO4yk7845mlU3uH7YwXd98+LWB3ENG84htbb
         dPgtjym7jwBXNfhuGFIFmHoxriAVDUeUAmIn4BaOV65zlYRW5YY79lSbgRF+3la9znyx
         8j78/AVd0CMagIbHF9pfiT3Puob9AbWTjMB634eIuCNj60RfE1c7TzK1BvWlB/a1krfR
         7nVG516FiygGehAKo33Oi2hk3MSMqQol/XuVWwuO/0zum4FVZikqqPbF6u5IlwnxRVjC
         SJJduHADAQvyr02YQLVce2m4hKmDHDCLop7/ooq6hYNCmzerAzuWzzz2taf5KSi9t46e
         D5YQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787817496; x=1788422296; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nrk8uUDBNanFfnr96a4o3nFXywW6wHqNdCn0K9fnuO8=;
        b=dHmH/VtDmwUXfShUAbSrUjtGCFzEdpimGPxUHZcNfMrbeL7isqDSnRnE+KqiNDd1J2
         FDXWmrTxM8rNwwLYUpjG9qUdsC/DlH5elS2JD2GpZLD9pRmjXRH0tFOySWDDgv5sW2xQ
         iuzXA+5vz9App6ODUGw0FcQBXgdD8fpJNGLDvbJpWkDOBDQ3CG7bP3URSTvT+tjVc6Uo
         kH1BWCY3j8lP7FTYWZcqt3rDm8fKVV4zKWRXDAfU8oSZcKL0yaKljZZqzzRT6I6RE1YX
         RLN6hFXGRTlWQpOPmintWbfPqQiiOT07I2xAqlYkBrr8/z95q/KvHghoF0ZlKHlDRCxO
         QR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787817496; x=1788422296;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Nrk8uUDBNanFfnr96a4o3nFXywW6wHqNdCn0K9fnuO8=;
        b=oJt/b3aZWCVHdWOQ8GsP58BAQJPiPEY8iGWBLqHvB0KR0hovnE7mQzF4JeU8tbttfY
         7hERrv/HHCD3Qo+vljFfpdkNC0c9xKcYS7eX6WC10GMQ5K3LVSOlxCl4DKRBeBRxe8eQ
         vDazAKJGjyV1MZ1OxzDHCOIlmHczqIhkp5vlGbUNSzMFv1jV5XKlP7h4BQoBGh5sPAea
         3xpsgMOXCBJnw9WjY5hXO2sRs9534agRl1LYFgm+Lq8Zf1bVL6c15elg6HVuokBllZ1X
         xDPdD9rp2yAHOIiGAUPPBsLqS5RbnvQMyq+AqqW6H8iQnDF91CZ0aqSXceehU0P6/UXC
         mdbg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7gFQE6v9Rl1KKq/Rd3KfKAyNFV3+82Zm9PNEh+0zBWjr1pF/wSbdVYJLiQ4f0a4Y1HA0YLTtjCOTwQgr6FBPC@lists.infradead.org
X-Gm-Message-State: AFuF++mzQyLlyXcDwoD44dZ6yanOqduvAzDRNGnVP94WxYLLBCX7Rtmz
	CNUrR3yhGPkAPuyjfO1XZ0KrRVRc8tkaMqNK13WCgrwLGLy2oBgBFbq424QbSx21EMpvdqLvKN+
	A8R3uHxi0YxRI4FxvpkXfwJgHlOpRrEg=
X-Gm-Gg: AR+sD136llSq7nwHTvCQoj/KXP85CrEBvFR0Bo+GyDRGWjtkbljVj12E/J9w+fm/JxM
	kMS4E50UJykqfraAQaYFT7NjIdgeRW2ypogPWJc8Ie0JhzZAJ1N/CKWtd3jeiW2DbPjfFsWLW2f
	WmdTcM8umFtSq0bkhu/Q1N9YUE6pJfqt/mcfEES1cQsYNEj08Ay2dBQwu1xmAdLffiPgeu2Y8JM
	qQVXzlF9ateKmL8rSNUyczNT73OcxsGkByH+j5XWNsB3R9OCkkc/5FZTIRiwLVBwwCUECKz9WMQ
	Yiv/IAnMCXUhb0RdDAYY2eKMWVirF9dQRxezt1lPus+fwzuGzAwm4khzfRMHJJ5V0+jW6NjabWY
	k79DnD29jitkG5fit/M+JPwA40MCoOAYLWlGIQLcbZZLeIzYg8IXB7EZF
X-Received: by 2002:a17:90b:1649:b0:37f:fdc8:71b4 with SMTP id
 98e67ed59e1d1-3966d3fe36bmr25869449a91.2.1787817496356; Thu, 27 Aug 2026
 00:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260821122928.41343-1-phucduc.bui@gmail.com> <20260821122928.41343-3-phucduc.bui@gmail.com>
 <47c14ad6-0311-467b-907c-517ff5044438@intel.com>
In-Reply-To: <47c14ad6-0311-467b-907c-517ff5044438@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 27 Aug 2026 14:58:04 +0700
X-Gm-Features: AcwNN1XimKrPZge6zf8CptLL1uRO5gf5i0cHec8ah767upjHTgiSMh8y0Tz3b7w
Message-ID: <CAABR9nHyDL8=EiSi+_GBpHM0xLZraH8az+HRXQWudG=1hLZ7qQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: mediatek: mt8183: Fix APLL enable error handling
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_005817_957896_D8CBCB05 
X-CRM114-Status: GOOD (  20.97  )
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

Hi Cezary,

Thank you for your review.


> I have mixed feelings about appl*_mux_setting().  Take a look at its
> disable-path: if clk_set_parent() fails the follow up
> clk_disable_unprepare() is skipped possibly leaving one of the clks
> hanging.  I'd expect error paths of callers (of said mux_setting()
> function) to ensure all the clks are disabled and unprepared
> unconditionally.
>

Perhaps the primary purpose of the appl*_mux_setting() functions is to
configure the mux, as their names suggest, which may explain why the disable
path is currently structured this way. However, I think your point is valid.

As far as I understand, calling clk_disable_unprepare() before
clk_set_parent() should not cause any issues. Therefore, we could move both
clk_disable_unprepare() calls before changing the parent in the disable path:

------------------------------------
clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
                                 afe_priv->clk[CLK_CLK26M]);
if (ret) {
...
goto EXIT;
}
ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
                                afe_priv->clk[CLK_CLK26M]);
if (ret) {
...
goto EXIT;
}
-------------------------------------

To be honest, after looking at the code for other MediaTek SoCs, I found quite
a few logic issues and inconsistent clock handling. This, along with
the git log history,
makes me wonder whether these code paths were ever properly tested on
real hardware.
Therefore, I have stopped at mt8186 for now.


> >       /* setting for APLL */
> > -     apll1_mux_setting(afe, true);
> > +     ret = apll1_mux_setting(afe, true);
> > +     if (ret)
> > +             goto ERR_APLL1_MUX_SETTING;
>
> Why goto? The check is valid but the label in my opinion is unnecessary.
>

The function could return directly here, but I used goto to keep it
consistent with
the existing error handling in this function.

> > +     apll1_mux_setting(afe, false);
> > +ERR_APLL1_MUX_SETTING:
>
> While UPPER case for goto-labels is not part of the coding style I see
> why you did it - to be cohesive with the rest of the file.

Yes, that's right. However, I noticed that the mt8186 code uses
lowercase names for goto labels,
so the style is not consistent across the file.

https://elixir.bootlin.com/linux/v7.2/source/sound/soc/mediatek/mt8186/mt8186-afe-clk.c#L303

Best regards,
Phuc

