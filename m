Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD4EFB44BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 06:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNbMg9AslVvZiiEWGI6uGT+vEhOUt52xGI3Fc3qxq8U=; b=m82HlVkr1IB8odsQ3Tm9saFCWQ
	4ZZun6x8/W/EFdRXYDXa4ujjyTI2V4YpOT/LERR+OBPGbXJ77ZRQbTMyhIOJ0Y9rY7zQlvuSAw4j+
	1tYBFFtol8Ffdp5J+dCwCa31N7cOzZ+6n8x6eUqYgj5QiGVWkBqMv1CxhimrxSqHn6/Fo/LIkIgDy
	uo+gYd3vciEDIniG0PbQ6qfx+y3T/6GUHfbHS/AZcDvdfIL93OnwQDwf1ry6SPeF7WWJlm22N4e60
	cVzzrncBEGx20vkARMWasHMhTBnuy1leqwxHWTZMZSg6oLPaItcUCZdsArRWCw43SY4NDfcnmmmGX
	OdEbxGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAPP-0000000Cjk0-1aDF;
	Fri, 24 Apr 2026 06:53:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAPN-0000000Cjhu-16vl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 06:53:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB87460123
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FAAC2BCB4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013580;
	bh=gNbMg9AslVvZiiEWGI6uGT+vEhOUt52xGI3Fc3qxq8U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JTXK1Ak76tCGFWb7vMniYbyq48DWii1+RRGlO2wpvHGVtEwu+GHK6qPRR/JR43xDJ
	 vciN28Hl4jKw1KkBnhwlwO6S40W7KZuAA8XFeQ58hfxnzCAa2xulzagF34iX24r40p
	 CXFMSnpG2L5N8KK8kWRpjtx8Q7WxxAnhxVMZFxbruCPqmFG4TV3rcq/LUxo4z/RhGo
	 JVhJDpY3ooIl3JpsK4uvUbobtIbS6fLwWX/GFgtYnUYeDP3lgzzJOqNxik61gGtTLF
	 vZYJzgxks1Wo7Arfqcl+Re7FkJfmH+gackc2aue4fNtMf3a+QfJHCfLVXzDOkaoyhm
	 8bxZtuQW3ZFBA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a337552604so6916663e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 23:53:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/djhGztFCvnpjJ7DAJYlTLZrKFFy7eI0mVaWiuWBu673FdbGYVdQ6gHJ3fqN9lU9mX7517wxgfsDvz91+tqr5x@lists.infradead.org
X-Gm-Message-State: AOJu0Yw22E1pAjgSDThtDxORYtpL/1AEyJfupKEzJpQDmOnyKR1k31oE
	uu+jK0hS49VDKVt+GIKO9RTE/e9OLiKEk3S3sTfVEkWKLIZ0X9UeHZafm5gClmbSBGX8BV7J8A4
	d/OKE4gHT8J7T8WfCRAV3hsbSGk+OXRw=
X-Received: by 2002:a05:6512:1447:10b0:5a4:194c:d897 with SMTP id
 2adb3069b0e04-5a4194cd8bamr7403618e87.12.1777013578918; Thu, 23 Apr 2026
 23:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com> <20260412-defconfig-v1-3-a46918286451@oss.qualcomm.com>
In-Reply-To: <20260412-defconfig-v1-3-a46918286451@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:52:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLk=CwN95oU9bfhi_NmbCqn58rok2vLZg5sG4owUcvAfKQ@mail.gmail.com>
X-Gm-Features: AQROBzDCv_DrToTiZDyzTe7ZjtHhnunM9aws4kiPnrnL6FeGj5zRRLPjXVxCHtM
Message-ID: <CAD++jLk=CwN95oU9bfhi_NmbCqn58rok2vLZg5sG4owUcvAfKQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: defconfig: Drop default or selected drivers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev
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

On Sun, Apr 12, 2026 at 6:21=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Drop all options which are either defaults or selected by other drivers:
> 1. IMX Pinctrl drivers are defaults for this ARCH.
> 2. RP1 is selected by MISC_RP1.
> 3. I2C_DESIGNWARE_PLATFORM is default with I2C_DESIGNWARE_CORE.
> 4. DRM_SAMSUNG_DSIM is selected by DRM_EXYNOS_DSI.
> 5. SUN6I, SUN8I and Renesas DRM drivers have defaults.
> 6. SND_SOC_ROCKCHIP does not exist.
> 7. Several ASoC drivers are selected by other main sound switches.
> 8. USB_CDNS3_IMX is default with USB_CDNS3.
> 9. IPQ_APSS_5018 never existed.
>
> No impact on include/generated/autoconf.h.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

