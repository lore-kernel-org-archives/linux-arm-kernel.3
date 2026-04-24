Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106D6FB44C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 06:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIneKd2yUpV75kxalCCv06aaKxpjm3JH07r1+8qVhVU=; b=gi2V1Z3z5cr60cxnIsFoSuzIm9
	V/d0wRygfwJ65F5mrbeiBhro29jzwW8slNVpSjmrU511gpscoTUSgNy/J2/M3iw3GtDtai/hvrSn9
	zso1bwXxRpkgtD+rgZXhY90lO1lQzCrxnY64Ctd8TjaM4U6oAREi6xdgTesjFUxaJZwP4stNziQIo
	4LtJSOKYPWUNWd8EsltRTcP5SucIYJx2Qvgf/OXnnP2ax5dIJSeOqYlB2tpmoeLCV6FNz50t+UphF
	sQYdz662pjVwdZnFKpLBZUOMTZhFaRvlbxsjEjqgkBd7za8VJfNzne1HmnJw7AmC1aAUR5m//QfiN
	+FcCumig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAUr-0000000Cl1a-0cgW;
	Fri, 24 Apr 2026 06:58:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAUp-0000000Cl1N-3wsH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 06:58:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A15060120
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 031ABC2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013919;
	bh=IPi/+Vyv6aQFQSyZXeZ0oxHNzEPss0vbDNKeN9Kde6g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kku4l+U0ckoHtw89UyGWrNG9Tiq0DZBFD4DvNrjad0ByFYPh+LKqfkDEa9U9kMnUr
	 vq0p3R/4Lb3v5DPa5rmI9mbwoxss9YIHkWFr4lmE90eLwrPqVV65giT9hRpffQzraQ
	 allEsthfMW+RtefuYCK6sOV/BB4WxN9oBZVshceIPuLoh0nJdE5VYVCWeyD17JdPD/
	 QLA4y10kWgh3HRPwXtX+NYgx0z1ESnmR7sUI59VeurnBt2r0lXIO47rTt5V7N47lPM
	 yNvk/CsDkbXkmsgEHD9kN2g9ph/c4SB4sh8VphZ3l3+dKwzbILn5Ywovt/LvQ90Q92
	 oJIJd+F1qur8Q==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a413f83226so7678916e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 23:58:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/1kYFOfM0v6BbWcyQWo0DcqwQ3IxWk7A+stRv3LcW01Rb+oSzy7QjaQzSMNnjS3dQki0pd668lnnT4ygXuoHI2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwj+qWGPWL1FmtBBIdLUBQel4GMIkH7zbfSnWfQ4vvYtaUK3E5
	zCZPXKDRdDMO01/kKhZOGOwHlTtl+svgMJ7BN5ozrG254x6APc6M4KjRyWDCkCwdNRkB1Z59Iny
	8S2+l2lD6nN0SnD2c+WSy9sp3sl+c+Jo=
X-Received: by 2002:a05:6512:398a:b0:5a1:42ae:88b6 with SMTP id
 2adb3069b0e04-5a4172a2f31mr8641497e87.18.1777013917744; Thu, 23 Apr 2026
 23:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
 <20260412-b4-defconfig-multi-v7-v1-2-e76de035c2df@oss.qualcomm.com>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-2-e76de035c2df@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:58:25 +0200
X-Gmail-Original-Message-ID: <CAD++jLnU6qf5QoW7xH+=0e4UiHWqUGQS5cX78EtEONhvxmLLwg@mail.gmail.com>
X-Gm-Features: AQROBzB-942dPXAfTM04NoAlrIm_VT2pS3PYsMqrPQZ0Mrmk0TIpj2V5E1vE8sQ
Message-ID: <CAD++jLnU6qf5QoW7xH+=0e4UiHWqUGQS5cX78EtEONhvxmLLwg@mail.gmail.com>
Subject: Re: [PATCH 2/5] ARM: configs: Drop redundant I2C_DESIGNWARE_PLATFORM
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

> I2C_DESIGNWARE_PLATFORM is default=3Dy via I2C_DESIGNWARE_CORE, which is
> enabled.  No impact on include/generated/autoconf.h.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

