Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14424CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8/Xk2PZDV84vw6TpgqIZSg/Fqm5aTct485yHDlUUv0=; b=1xD8p79rLVWjdNRyL7+XO048S4
	Bv+pdBlccW+H3Al+1bRuMnd5Amgt5I5w6jgt3A60yVcTZQSZvp8VXC1WWqzEdMyAJPLXTkdohkI6G
	d/qqN5e4idWu9jED7PDExncDHDYreQrGgcqBiHcBXuHR5E1Dfbp9zJObJt5OYSaDmwsDZBaAT+Qil
	9yLgQM/4pxssZLkCcrkX1jX3vYNdurf0xp1YVoUH4+Wx8VTarsPtyKqkLy0bsh+Bh6Z7T8xWI2BRK
	JaWTz0SvOxr0rzmOGjRccuM7gtqA+XSVa73rmMtFWw+JWG/xGDkQy7ElGAO6GxG6hZPgCRHb9eea7
	ZnMij4cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj88-00000003B2N-2mX3;
	Fri, 16 Oct 2026 14:41:56 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7o-00000003AlE-28rn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:41:37 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48c6955a7c3so1945430f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161695; x=1792766495; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8/Xk2PZDV84vw6TpgqIZSg/Fqm5aTct485yHDlUUv0=;
        b=pDmd7MomQyheYaN5OjVM+Q/GTVuRgpdcZJcyjXM051ppd2lCxwlrX1TYk4NfbJ3FmN
         p857vQgehoaKoJnCBpSTFBU6IRz1Nd74QR6c1HAa6OgoLShZWGoSlvRLqGrMLFnvDnaj
         PqJ+8FY9MpJNrfhQR8Nj+BSQcz6qhfmLIVs0xMdKC8od+568YqbZtVOMzQA0gKDXAmcF
         4R3b6fgSldTajWw0+VG5Xe2QGeGAR0xI5ueRuCyMJQa4mMTIaO4qEkLjKwlsl4Dxbjka
         FvRbmDBtipUIEd1YsmYonubwub16hmczlFGsrK3x2aE5qn+thCTxGRl0MPDJnjCtjkL6
         4ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161695; x=1792766495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8/Xk2PZDV84vw6TpgqIZSg/Fqm5aTct485yHDlUUv0=;
        b=fLWyiPiF6eJPSz/jNEqFupDFGbNvPJqfsttrK9vWNSUvX3oC/LQElV7jtNdR/WqaD8
         fzPz5BrhNbgS04wgV9YiZftldfPFMIZZ8Rsh0h3wAnH4LcvKqexvyV64FUkiPjTOgqSF
         brLVbJ1DduIoLDlQnVxSH+6J7sY2nee5raS2+cU/1i28vFOVxZ4AC+q9hiJpyUw+yJT/
         WU0bFZup8LeozfwUW0KAAO0iSgnxszhg9Bo9BXdRn8lp6y94HrLkkoxbjh43cehoJF20
         kzCQc6fgZk7DGhWUaYowUnLfZoTLo85sJRRVq7vor9f6KYMkGngCBb8rqUe6LpXpw7/s
         lCPg==
X-Forwarded-Encrypted: i=1; AKwUvBxMMW349XtqDLKEctKQec+F+WBn6aUIy8EdibPPdu8nnvapJ1nsPi/+xY+ojrOmYto+/o6WMNX7ufU1Frf2GQ9q@lists.infradead.org
X-Gm-Message-State: AFq9FYKMgc1wypV/5ro9nSSPYwuGWpZvWyIpiEPhw84ubPOx3qsqkTw1
	CzanahG1k6ZN1Q0/7ehOFxcyRiXHNKHhmfKiBao1i0CE3yY/8K0yBw8NX7xy21WJxFQ=
X-Gm-Gg: AYBFou033J855NZyejs0EyAi3YxjMJFOfKfmMwFmt24rOlXzYILBOv7mo6AW0Fds3i9
	wtTyWxpv2/zs9TmIKkDt9lIvTZqrG9LXOi8B0xUiYUBRFFbFgE3e8nrvQhM9LeWycgDRN49pkL6
	vkdLdEpf/5qOgOpKkC2ImX0WOjJKZUU38DHIDRYNMcftAhoVlKBHNSk1setPmM3P5jpuqVi+bOI
	1B2YWAO32+r7iINo3UUcFnWTPrg/UXgrkQq2T8Cx6Sift44R0rByegH4aAJSMYVSw5ZGhV3ihqK
	O7ruFFwumn27BfGwSNlfST2B9677/mmpIepw7+Ir7pIp+1HD97hlT5D+0lsRbFtQDAXfYJgDfdS
	695KDkf7AnKIQaUVIpCb0ubMLwIL5HI8a2jo6obXMye0ZVXqlqBOmR2umsBUfLqCMv4LBNSjKsj
	nYfmwimEbfvsw6oWjL6herqDjDJdrJYIbBvzDXg8UNSFeNylSUevqR5dhxOEhT0Qdkhvwwy2Epd
	5QBn4fq9DWJQI5H0mN/5mqB8Sawbs/cYGE77ciN5Vd0Xkn4+hp05ZECIBD1rvyx5EPSC9Y=
X-Received: by 2002:a05:6000:1788:b0:48d:dc6f:219a with SMTP id ffacd0b85a97d-48ddc6f2463mr32085591f8f.27.1792161694722;
        Fri, 16 Oct 2026 07:41:34 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:34 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:25 +0200
Subject: [PATCH 10/10] ARM: dts: omap: dm8168-evm: enable MUSB multipoint
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-10-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=1428;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=T/OTFeU/v/eoDvotZ5j14Er/J0T6ty7EyR4RK8RPU/Y=;
 b=El6cBgAWcx1/Y1oiKVFS0M3auY1+K99qcECWB2yFtM7I86gnakEGU9Bvizfq9fy23L7kDfbMS
 ScFiJnh5fvIBHFd2bCgcrvsyWrFDxrSkC7g69bVRVa/PyuUddV23MyM
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_074136_582964_C48FABB7 
X-CRM114-Status: GOOD (  12.29  )
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

From: Christopher Obbard <christopher.obbard@linaro.org>

The DM8168 USB controllers are used in host mode and must advertise
multipoint support to the MUSB core. Without this the kernel disables
external hub support and warns:

    musb-hdrc: kernel must disable external hubs, please fix the
	configuration

On the affected board this also prevents devices from enumerating
reliably, with descriptor reads failing with -EPROTO:

    usb 1-1: device descriptor read/all, error -71

Set mentor,multipoint to the default value of 1 for both MUSB instances.
With this enabled, USB devices enumerate successfully on the host ports.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
index a6d42766a496..4b4e4d850231 100644
--- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
@@ -198,17 +198,14 @@ &mmc1 {
 	wp-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
 };
 
-/* At least dm8168-evm rev c won't support multipoint, later may */
 &usb0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb0_pins>;
-	mentor,multipoint = <0>;
 };
 
 &usb1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb1_pins>;
-	mentor,multipoint = <0>;
 };
 
 &sata {

-- 
2.56.0


