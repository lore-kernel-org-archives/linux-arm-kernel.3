Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D670B1076387
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 17:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUGrmWIs1eqe1Uc4sRH3g6ZJwCj+Y/CkFLvTuPn+h5I=; b=BvgyHty+qt32x6HlqK4UFk2LWZ
	3LItzp0M6cPCrURJ5SIRov2AQXMeUHwGqE6HA2g9oUE6fuNZ003nnFD3XYdiZGFUvEbz9e0+cmqMe
	yivamOFWHHgTh0cklqC1CceEfvOIzA6Cm3l4MQy0j19DA90tZnQg1y7Ijp/Irurk9kdYF6+5zZsI6
	WU4u5O4VzIvwuuCsPOyGRGK0GUN+G74oWFIaoiFeAZab6RZm/I8+KjOb3nqpbUO4yRl/77sYNxVRr
	wQQp9W4f0dlVhmUgWqvtfiK9PkB9yazpZblGb4f1d5uf4F72MpcbYHlU8pkdPPZkIoKKXoY/nApga
	oY5oeMtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zRg-0000000Fr8Y-3P3t;
	Wed, 01 Apr 2026 17:33:36 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zRc-0000000Fr7w-14SH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 17:33:36 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-35d9749c26dso3490497a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 10:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1775064811; x=1775669611; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUGrmWIs1eqe1Uc4sRH3g6ZJwCj+Y/CkFLvTuPn+h5I=;
        b=MOWqP7WOrulv9Er2I7+h9V6C7Z9WL7ueEYYlIpXM5CIVqhWmYJ36Lh5NUr74YiBNVk
         jCByMai2sCuoveH3hyFPM+WB0oFtJH+MdZjotD9a1i7jLDDxn1dOVQutH1VjBUX0Q7EW
         8j5lQBK6+Mku/1tbPVAA8AnsWi+sXCCYyyyduHM2ZhkZhR4nI7byJzGeVrZ4VRHdofeh
         dQBgbGTt/PFPKzPYwf3GueoNK6U/7OudHftqiOkG4ysz/ssnK9UvVPD3QRdFlknjcTe0
         rkNdoFeSu3qMkOSoj+Gw69SFOGoRLMfzqLuLhmH7zzm4CC18JEYNm0RYFS0LUREa1YEr
         4q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775064811; x=1775669611;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUGrmWIs1eqe1Uc4sRH3g6ZJwCj+Y/CkFLvTuPn+h5I=;
        b=alhdNperIaGGVeU9Z7lYjV0x1spb/nS/0049fTnhrQX0z8MnXkfOzo2+lzZwyy6Pfs
         /6kV/E7Mh9F41dGK/fM0EDzViVyaq8e8GZQmrsOvNM5kYnptjNXos9IV8ak7YOSfRIwL
         ZNcW3obWwfnkVUdMgTlsEyarKHRq6JZhT284FbuwUCr266dZt7Sgkl6+mKkW4Yr81CED
         aHsPEhpiuQZw4PJ3tG0MnU3Y5+CaLbqzdEHo7LWdO2AvZy/OVDe0YlNq5H8Vfo+yr5eb
         oeyiYnS10AfboS01mSQQaDD3Z702+EFs/bdR7FQzJXgLneYkC9PTazj+sJjvwC9nl3+y
         yySQ==
X-Gm-Message-State: AOJu0YwhcW6XdsOPXkmF+lnL47U+wbbV5Uywx9wX9ZPDMqJXVWpVI2cL
	SyAOQm81AY799tadMsayXaLHn2vna25QwRaI2EfDkQWZGRLxa3OvNNJDaSphqboE+D4=
X-Gm-Gg: ATEYQzwqFav8Ygd/Iv+T2t9HihSOJvKm7k/Zt3XMAxZzFYED7G7BKIbzy0PWuMGfdoC
	H+7ArIAGjLaAe81Bm4SHPQHKW1bKT62IaHY+lMQOiTGl6aipmit4GMlP90W81i6XBP/PKcS+n4R
	0AXkTj4eZNjqcJm/IFSv9eui39GdsdpYYbwP/oLZhI8ke3ChJve1oTu8s2UsQrspPTexHBO9Sgh
	y/NO2tA+KL7OjuuA5PtJQN/GHuSRIFNMlXbps6DdlLs/ahvksrYZ+j3+98uC3pRnWrZCfXNF/50
	VRZ0RIVi7LR5MXPHhTjL+XtWFTVkHayg+X0wrv4KnwSHtuZmeucTXQpnT1PV0wowRDReBQ43ZW4
	6nBs3D9LrW6iM5XXKirYq5TQXRhaZEwgVaP24+NfhdknF3pxG+PcdyNhYWMHakG3Dg5ujKPpb4x
	DZbzYMXbvJ3VKrpMlYZbo=
X-Received: by 2002:a17:902:f54a:b0:2b0:6e12:bb21 with SMTP id d9443c01a7336-2b269d4af02mr44706185ad.41.1775064810785;
        Wed, 01 Apr 2026 10:33:30 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbca2sm2974705ad.73.2026.04.01.10.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 10:33:30 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux@armlinux.org.uk,
 aaro.koskinen@iki.fi, jmkrzyszt@gmail.com, tony@atomide.com,
 andreas@kemnade.info, rogerq@kernel.org, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, soc@lists.linux.dev,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] arch/arm: Drop CONFIG_FIRMWARE_EDID from defconfig files
In-Reply-To: <20260401082533.214103-1-tzimmermann@suse.de>
References: <20260401082533.214103-1-tzimmermann@suse.de>
Date: Wed, 01 Apr 2026 10:33:29 -0700
Message-ID: <7hcy0ivb4m.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_103332_601599_0C50067E 
X-CRM114-Status: UNSURE (   8.40  )
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> CONFIG_FIRMWARE_EDID=y depends on X86 or EFI_GENERIC_STUB. Neither is
> true here, so drop the lines from the defconfig files.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/configs/davinci_all_defconfig | 1 -
>  arch/arm/configs/omap1_defconfig       | 1 -
>  arch/arm/configs/omap2plus_defconfig   | 1 -

For omap*_defconfig:

Acked-by: Kevin Hilman (TI) <khilman@baylibre.com>

Kevin

