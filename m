Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9833CD4842
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vWqIXrpE2Ly8encEK5XElKZl+8B0OQogZgUPoAVNec=; b=QMvbnrGxqxWgItbuFsR3iPCnXn
	Qg5Ef2rtzQq0rGvRjhs3JwS2QvfrPZhyvg/XoTXf684ec041XKb6OFqeeUN1LHb+lHWd4eTshxTvY
	kJ7Z9dIW3pS8olIo3x3q2HlDWOSVqHTeGPpEP/LfJdI2ox2MECZFxYYTohmUo/1SacE+xzWip9npu
	ekezG1bo7zB2sfudaayyTTX7hfDAV8eIqKq5GLl/0dQP3kKU8oqzO3mrd+7T90gFeHUODOxvMJqL7
	0gRWRATrVXBk+YTNNguEFozfdTM3VQM76nHTH9HUSUy7QvpJyaNOiBAeb2UoOnPpYVU+hT5ronnb+
	NgR4QHlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPAd-0000000DOnz-2j0T;
	Mon, 11 May 2026 11:51:35 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPAb-0000000DOmX-0WUz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:51:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso49893955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 04:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778500291; x=1779105091; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4vWqIXrpE2Ly8encEK5XElKZl+8B0OQogZgUPoAVNec=;
        b=ZS25NZrDAzFXdN/Ngo21BKH4R2kWvG+Flm+l+PjPLjbv2zv3pKZlOdqV00xN/jS2II
         s0nL2DuW3JKHbF3mTNEbXkbdjKkZK5fjkE6VBuyggwNfYmdm46oKy6loiJLoDczhkI+a
         AI/uc8TpgEQI4JDKOBDWyWIEoDXHfyMrE3Pc1porWN0mMQcAdkB0M3a9VguNvQ5Tdog9
         fxUmF4Bv0DcffmnN0qNoKIXI20/ErRN/qXX9n7sOo0HrMWIGG0P8ZHPIE2iRDxmZR5dy
         WH2yvbXBm+nqDLbyiNpydQH3QWYvJiS5DveGd3pzRCcBKaR3hpuBBj71ACqsFj3zi1U1
         zuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778500291; x=1779105091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vWqIXrpE2Ly8encEK5XElKZl+8B0OQogZgUPoAVNec=;
        b=nUsmcryrt00PkwpQ1HBq1j7lKUisnyDmBctJeWC1AGTlAy0ES17xEzCWrb7Lx+nbFJ
         Tk+0kBOfjef+NzgKG3I3jneTqwf2BjCUrQtguXm8GVW/HB0ziuN1ADwW7Piycy9mEwrj
         qj39+vc3wZdiNZM3c/9BqS2BpJJI4slNOPyRC8sEH/YYVkMxWeeguaeqMJqHifuYtGg9
         VZTEDfZ4Q/pa4PLh1U9UBrps/UXQxlXJAdRAY+5En4A37TWtEHY1Y3XuogdmTd2trlvf
         XCHpGrmwY1cgZM7HCvJxzIdqOiqJocZ33E+rHsf10ZuSM986kHZUMG/mRZVE1VPtAh6k
         kRug==
X-Forwarded-Encrypted: i=1; AFNElJ/073m1x7S3s0At1SKOynSC6tNObzVg/JLDKvID5rtGkVUX+82COkPJT2EHZr2tOtmLEC1vlrjoKONvDUWI1FbR@lists.infradead.org
X-Gm-Message-State: AOJu0YzQDMi5OTllfu0eCYkFMszfS2C89RGMJa/LrEBAfFnfgj3sRq5T
	fB53B5BrWt9SA3aRAcdTeL617+rO9viR9ZY+Zcm1IoKqngcFcL2AGkbm
X-Gm-Gg: Acq92OE/03dWa2dVLvmKqiUCq/+h/S/W50I084Hv32Jlm8AI2o2XVH9BzGYImyXAuQ3
	mBIt5S48z5bQYXfuIjCZIrlfsicYhOhzt9BLb6JZKAkjoNVkKY1p1fsTa8Nb+pyANjhMb+a+XMR
	QdHz0ZftYwlG5L3l0NEl1TXuHtwOuO5WZHfMD9M3LSSMdnI66wVX53mKMjSNpVEWknY7F2f63u2
	Mso8pz6cV2MBR90P0S9F3jCABVZYdsx2A9xq2QUHZMUydB5sAbobPzMRU2NC4gg5x84VLPU7p1g
	TKASox4EzIdEYX+eXEbQ6U8Ve5Pw5BqvD3QB4FjpThBTq6AC697bq4JJQA5n10xFpEhvyPeKofu
	6dGj0rWChO0pA5RiGYMf4FznAQxGSH9NHeX63/qmnofQ5lKTWwYYNDsleB3DzMDJdYiO5BMziwU
	UCVe9TDRy+9Ztl8qzUGrHlsq5VwpI=
X-Received: by 2002:a05:600c:4512:b0:489:284:44ab with SMTP id 5b1f17b1804b1-48e51e1deedmr372311795e9.12.1778500290423;
        Mon, 11 May 2026 04:51:30 -0700 (PDT)
Received: from owl5 ([2001:861:3201:3d10:d26e:45c6:70b:8eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6cd75sm23966132f8f.16.2026.05.11.04.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:51:29 -0700 (PDT)
Date: Mon, 11 May 2026 13:51:28 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm64: defconfig: Enable MT7921S support
Message-ID: <agHCwC9U1YHFBBuF@owl5>
References: <20260310-mtkdefconfig-v1-1-717eb3e6eea7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-mtkdefconfig-v1-1-717eb3e6eea7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_045133_189378_E09603A8 
X-CRM114-Status: GOOD (  15.85  )
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

On Tue, Mar 10, 2026 at 04:52:12PM +0100, Gary Bisson wrote:
> Enable MT7921S which is the SDIO variant of the MT7921, also called
> Filogic 320 [1].
> This driver is now used by Tungsten510/700 platforms which are now
> included upstream.
> 
> [1] https://www.mediatek.com/products/broadband-wifi/mediatek-filogic-320
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index b67d5b1fc45b..d469ad15dc69 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -200,6 +200,7 @@ CONFIG_BT_HCIUART_QCA=y
>  CONFIG_BT_HCIUART_MRVL=y
>  CONFIG_BT_MRVL=m
>  CONFIG_BT_MRVL_SDIO=m
> +CONFIG_BT_MTKSDIO=m
>  CONFIG_BT_QCOMSMD=m
>  CONFIG_BT_NXPUART=m
>  CONFIG_CFG80211=m
> @@ -462,6 +463,7 @@ CONFIG_MWIFIEX_SDIO=m
>  CONFIG_MWIFIEX_PCIE=m
>  CONFIG_MWIFIEX_USB=m
>  CONFIG_MT7921E=m
> +CONFIG_MT7921S=m
>  CONFIG_RSI_91X=m
>  CONFIG_WL18XX=m
>  CONFIG_WLCORE_SDIO=m
> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260310-mtkdefconfig-5d9626f242c7
> 
> Best regards,

Gentle ping on this request. Let me know if anything is missing.

Regards,
Gary

