Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48908CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 06:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBL9lupI6VldWKtWDKOusMstyfxtbMzxrKyxN/4ZaQY=; b=zj358MrehRRkPfwxhMcOmIM+fr
	5Lh6Bb0Pn4mlC/6bc8804SOI817iiR+UwYDA7gh9X3Xqf/IBhfKzyTplboRnHmCYYWmcWD5es/aGx
	R1xHuf2EhbkpDBgGzcwCHFfeuXln6sy5qTYyRA8kaPA1cIA1vZwRZvXiGMY1rJxIhV3U0pQothZXR
	tnFk43k0T6cXRdxBga2JUpHITfqEMFivb4ZjdNRTF/K2GZRp7tulUHK3/jm7G3TbAUWef2iPjWPWv
	7wpwPLOiXMACx2XQtgVw/guT9QexdbQsMGJPbbvkMecp504uTPlFSpOz0+h0nWv18hE5fzVyVVlcS
	CY2lnikA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpFX-00000005Gxv-2fBa;
	Thu, 23 Oct 2025 06:56:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpFV-00000005Gw2-0OBP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 06:56:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4711b95226dso4361215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 23:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761202595; x=1761807395; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uBL9lupI6VldWKtWDKOusMstyfxtbMzxrKyxN/4ZaQY=;
        b=teH2qO24wqfbXdxLJEWRmxoBw1EWH5icxSQtwyKJzFTo6IrKjMahFTgIS46Ips6fXd
         Ah03y0AkcUuCiGmkYIMvJ/awq0aY0+GR+u9CaRtl46tio1vZrHuAxues/6sY0OBSS7dW
         bxdWTtgKzIRG07ZROX8iMSgMqKDVxByPfEX3ZTGnC6MtFmeM/nFLEsN663hZHeEmoYeX
         d6uS6r442C336HCJjXximhie+Z0xSSl3SuDRznL9GIwkksdxdmi1apvpUH7ZPEw0OzIz
         T8vD1K0UNHbj6mkYujO4JlwdprWl2nSbg5Y0GtBbSnm/TDAkqNAXe1aLVY0x20LLXmOn
         mNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761202595; x=1761807395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBL9lupI6VldWKtWDKOusMstyfxtbMzxrKyxN/4ZaQY=;
        b=XUzmLKZG17z70vT9Dj1UM/egmTUdzzq8thDHI8HV9Qzj6gXcz6NOFqXbB4Yg5xuckx
         HgVLQf+hAiax9Pdod1KXcQIvQq2xFAbUaKH/FPtfloSqDB5dwAHmKfEa6sjBfWjRClUL
         Avb1DdMOJiDHpNGUWYHmG5P5XktRl7zFF2sqCw2KZf2AUtD1iJ2NwOipkuDyGfXkM7ZW
         Qg68HYSzDoQPWX6xvArMZK5XbpaGuhg5ztUz5nTITGrP7I+Hk9sm58cw8yG6NROPe1bN
         HBiVaI6cTuHz3G+xlprrvceMYDwGdVP9kgwPosyrfMuAMn52P9v8J4vGUo96gMPMWOU9
         KcRg==
X-Forwarded-Encrypted: i=1; AJvYcCWoIveKCC0ml6bu0KttaeptPoqL8b6VvDh3INcYMOXIA3uJcOoJMVeHJZDexV0/dpL45aducWtR/nVcUkSrxhzN@lists.infradead.org
X-Gm-Message-State: AOJu0YynHnmF5Qi5VZclF09FfNdW9vCT20iUxdpUfBn2paJ3XzmaKLd0
	cDJ4/gl8Nvr8cTOjbjgj7d1MLfbCnnokflzuj2yptXDU7oAiWSKWpjXTvlR2T47ZWGw=
X-Gm-Gg: ASbGnct+v/inBNJ7IzP1tIu9dubQjjviVN4rqRPhZcQK7YTUNv4Wg1TE9dhMScb4GtT
	vveTI6JOI4JKsVL+3pdN9vUNunW4taSquVjVgYv6eOj1jIC9zp73EdC75tOxjvMVejtP6hXrQYr
	4FJU0z53FetSqODft0tuG3WyWjnYdt6Fil/4OZZ9zwl0A4MbynxVk6MnScG0jbVgpHtvVgOCyFx
	FTsuBaEy+M5hWtn1klI0Ak9l8Sv5fR81Ah0R1xmUBva0gs5Bo+nk92cyx7lwzUHzHNYXTNpIgmo
	f4ioHqkLf6/bzLPSoMTB0rwrwVbgihTi3ESdzRlckLkwLxKkzvP2wLw8F/vBSOHyG7dEfu+kHfr
	5gUuhwLfwX4aMpe0+FFPoaJ8wA/AkWRreCuny+x81kCvPK0Ui5eu+16ZIZa06obfG8ssj8S1HXd
	5+2vC8seA=
X-Google-Smtp-Source: AGHT+IGpQD/mtL5CvJA6o/mUd4UXTKshusdC3K11xj2LRMgyz3ANFxCnibnxcRJODpBqSTGDyYLPBA==
X-Received: by 2002:a05:600c:1493:b0:471:1c48:7c5a with SMTP id 5b1f17b1804b1-4711c487d74mr115681885e9.9.1761202594902;
        Wed, 22 Oct 2025 23:56:34 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494ac30b4sm52576665e9.2.2025.10.22.23.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 23:56:34 -0700 (PDT)
Date: Thu, 23 Oct 2025 09:56:31 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8mp-audiomix: Use the auxiliary device
 creation helper
Message-ID: <4skca2rmh7pfasmptplp24uucst264idevjbjhid4uj3fbxelg@ap2mzqkmbqtl>
References: <20251023-auxiliary-v1-1-0a16fa4c3cdd@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-auxiliary-v1-1-0a16fa4c3cdd@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_235637_134023_23FDB1DA 
X-CRM114-Status: UNSURE (   7.36  )
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

On 25-10-23 09:49:32, Peng Fan wrote:
> Use the auxiliary device creation helper to remove some boilerplate code.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

With Frank's suggestion in place, LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

