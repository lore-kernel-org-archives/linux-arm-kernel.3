Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32116FB44C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 06:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdUYr0Rsgb2sBfZ3T6Iso2j36eHk1wThXmYAC5Uaw3I=; b=otnvpMd6o8Cw19Ky+rUkkvql5j
	rVIrqq8TvIlNXGxGexJUdVWcWhF0NAU+KfSi1yKNIOI8+BkZjiN2fOQB2LwzmQ5s5w71Lway//9dL
	EZxjlB0E76x348QBTa+0ooaeSJJHOgSrcLWM0Rp3zKqEcGhZGYpIcvwWBU7O83mxLAivkcEKpKFjU
	YWylv8Jf24GHpmyeiOhZt4Mh9lDy2iy/isJI+j0ClUOZ1V/nh1/3197TrWlxm3hoSeotUAmS8SNFV
	pNxjkrctXy3Wm+NM26Dljgw76haQHC3r7+2gL6OmsNLgj/7Fvcog3GcVTGxU/tv6Pk2s6knJLb7AT
	egCgv1Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAVx-0000000ClIA-0jwl;
	Fri, 24 Apr 2026 06:59:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAVv-0000000ClHk-48F2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 06:59:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F29C60121
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFA0C4AF0C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013987;
	bh=LZsFY7iJShNWMEVnFNOL857SDQajJ3gYYQlZ3v6aEVA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OsfISfbicJ8X1LXm68dOc3+GADNAmAx7Ak1zMFSAjJfwx2bR+BlPz3+5WHit1g5Ml
	 9l40EOC3zSSOEWM3AFU9ajSRDTCUtW7X57/SB6u1M+3V9t6w6iBhKcVpa7/Rnzbkw9
	 PpU4vCSP0UrqVqMoe0kSFISIU0hkvlgeSxL7o/FmPTzNrqplxTOo9nmae4S2cYL+Rx
	 Ik34qy59dIUsBugzFJ9fcex5GVCd6KFss3//WFrvkYgvWKDEk88Nup5OljYa5bOn9E
	 BT0knNAnHCFoNZcCf+Z7/EtJJ28mTNcynZHswt/KDx32+WqvEbwSqxDSX0paPNC1UE
	 0EUjRksKbOrBQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a40502e63bso6896559e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 23:59:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8+f8JZgM2NrJBJrF0pZXGmXc8fhFpix/bfj95SDag70v7cSV+h+dY4qV0WdnKo9pMLQ36/qQmb1Kh5WDC4JI9M@lists.infradead.org
X-Gm-Message-State: AOJu0YzPxTozx7pMO3f6l/8pukjrc4dwz0pc5tyGdxzelIojyIJWrIp7
	16k+dRU9NyUiET68VfNv9ab/1KQeUtF/X+oUUJJCmDS1dbtO56eYfL8N/1lKmQrb2K4mc3dKlBO
	tf9xQE8PCTiNZifcntAYDvjBktqny7rs=
X-Received: by 2002:a05:6512:3e07:b0:5a4:12db:d0f2 with SMTP id
 2adb3069b0e04-5a4172de474mr12767434e87.24.1777013985824; Thu, 23 Apr 2026
 23:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
 <20260412-b4-defconfig-multi-v7-v1-4-e76de035c2df@oss.qualcomm.com>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-4-e76de035c2df@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:59:34 +0200
X-Gmail-Original-Message-ID: <CAD++jL=LY266=b68ydnS4tVdvicPqteNLqPKqummrzFRjOLXCw@mail.gmail.com>
X-Gm-Features: AQROBzBmsWhHQ2_KXCFXGlplKosIuekAM-QBBy4E5vzAQYJGtE0Q5WL4C4_ykRk
Message-ID: <CAD++jL=LY266=b68ydnS4tVdvicPqteNLqPKqummrzFRjOLXCw@mail.gmail.com>
Subject: Re: [PATCH 4/5] ARM: multi_v7_defconfig: Cleanup redundant options
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Apr 12, 2026 at 7:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Drop all redundant entries:
> 1. SERIAL_BCM63XX is default=3Dy for ARCH_BCMBCA.
> 2. USB_GPIO_VBUS is conflicting with enabled USB_CONN_GPIO since
>    commit 0ce0f9d0785a ("usb: phy: phy-gpio-vbus-usb: Add device tree
>    probing").
> 3. SND_HDA_CODEC_REALTEK_LIB is selected by other codecs,
>    SND_HDA_CODEC_ALC269 by default.
> 4. SND_PXA_SOC_SSP depends on ARCH_PXA which is only for multi v5.
> 5. SND_SOC_ROCKCHIP is gone since commit cae3cc435db5 ("ASoC: rockchip:
>    Standardize ASoC menu") and can be simply dropped without effect.
> 6. SND_SOC_TLV320AIC32X4 is selected by SND_SOC_TLV320AIC32X4_I2C/SPI.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

