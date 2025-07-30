Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAD5C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 20:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIjCGhz8tLixz44uwO4xKNvBCCKp5RNzQO4yWFCNcHo=; b=XwCG9dH+lwCykhptABhPH2gxeQ
	7a6YMOGBJLwQyhFzbCKLKG8PhpdoVPgkH2aAQjrAaRD7Auk8CnyblfZEuaFTZpPe91Z8wwTLQ1pVq
	8HDFt8jsz8vdkdP6MUt15Idqwd1Y5zm+n8Lidc7lZB20EZ5Yto7NuEuzYHVbPNAsANXku1K2xJk4d
	Ukt63j/VTRZ8Zf3ERHWdX2FdGflSTnYnpqUIlkI9VSlMmNoBoZNg9diuOrAQCJB/6OgslGWHIrPLt
	gs1wWy5hOhq3D3TywzBW/jCbNqtyWRHAMiIa4ZJg0q1Oagd3/y8RLpm9Shc1ZtugMmO/f2SvkW6WG
	BTyHE9NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhD8P-00000002M4E-20yB;
	Wed, 30 Jul 2025 20:10:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhCrO-00000002Jc2-255U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 19:53:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3b782cca9a0so155087f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 12:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753905189; x=1754509989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIjCGhz8tLixz44uwO4xKNvBCCKp5RNzQO4yWFCNcHo=;
        b=yTpv1mTqLgJlJnfYv4MLM4F0xGhwwlFriI3MSx+9rM2vTu+z+b4DOQQu2Y3RhLxKSB
         sMUjxLzAX7+bzRDvSAx5bxasryB8zeWs95sFnvE1MsdRE2RhqHd1+7+iKd5GLrMf5Sct
         f0WIibFToFlbV6JKUZyTnBAOcexj+Y3KkjkIHwlYO7GC1aFuVc/fGelKEcYnySbnjWF9
         G3w/b9WaNgkoBdOiaBw6NWZISWoWxbT8PRln0TN96Q2bQpHhfob7n+EIi/TYXSoj5QmL
         R5crNZbbdy1JpGuqJdtXqCCT3OiWjqU3O9raIv24P8Zo9n0H+92+dg/3boI/0S+AJ7He
         wYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905189; x=1754509989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIjCGhz8tLixz44uwO4xKNvBCCKp5RNzQO4yWFCNcHo=;
        b=wLLLZqr3fiVnwOjxyb29ByLMWpJvhiawbEZFRirGuiTMBbqvsucZjeKw+E/D7TW3TB
         /ZWYV35xGpv2Frh6/XposFZBRTdapu6kPAb9bIm36JVBYeOt22u5ghsSn2G2xMmlR3hm
         LknDsKa2MRRfaNBi4Hhom/pzNsYMqNUQfkFDHK0AK5hfKE5xSwi+6V5SzpW1BtkAGl85
         Rmbijv7rXBBMrpSurQbDyKIq/qikBZccXXYryTsZgPMqjacKho3ZlyWP6uZkdt0ZtS9C
         qjnHTaAyftgEu8YtnkgBi9PC9OovA8lfZohp5AwBcN9PyveFnQP8KLxOZPZA6oGath3J
         PHCg==
X-Forwarded-Encrypted: i=1; AJvYcCUhCLf//HDhOjWfvAljv3pNf9eorvTA3VhxL/PxfyiWKu+X9d8uvHXqjoqpkOGODHTjs43xvZ1fvjtiFIncghfe@lists.infradead.org
X-Gm-Message-State: AOJu0YwNJg4U1GDwcnXPqHss6UnKoMPaP6AgD10EC3srifmCWqJd3ske
	S+eyOZgMP6J8lCDMLMjWXhnHVO4pwDy/nktFlZ2FhkvMYYxJcFo3B2euPVWjpPi2Mf0=
X-Gm-Gg: ASbGnctCrGf1lDTp8MClLedXD/SDibBETkQNS5lYLfMrfOf0ETPRVtT3dO0HQFPfQ1v
	Y4xScsx53d+xxH7ETrKW6my3XUnOp/lSdA0pswxsCoO9PutrwTlgUQ9p0jAWcxCS9M1spjdsb6g
	vc832pPIVYGmomcGTA97zVDxVZip6XtgrUBOmG9MiReNuOt7WX3L0o0A4xnZoqsdfoY1nDokliB
	ywKNDYi3oOXuqLsmn521GsiE5krCLEl5/HvO6DLH++3aqrpK8Ryja8WZhXEz5v+H+8ORHNPuj/8
	jKfD2HsDSq1nyC/okmRBeBm8SvdFJixLopeveWQS2FZjlw7IwVGThrT22S/MxYP6ZKxYX9VuzPx
	a8Mcivn+5hI4D00uMEZNdFwyWv8+vs9PG15YwhwndzPpLqGsi
X-Google-Smtp-Source: AGHT+IEmsYHO0oNTJZYruShh/TW9R20EpAqhA//OGFPfdlNYdNfaTg5M72i1uh4bkKDQ8O6mJZ4IOg==
X-Received: by 2002:a5d:54cb:0:b0:3b7:889e:2b2b with SMTP id ffacd0b85a97d-3b795010da3mr2683397f8f.47.1753905189071;
        Wed, 30 Jul 2025 12:53:09 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a4dcsm9556193f8f.32.2025.07.30.12.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:53:08 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH 6/8] arm64: dts: s32g274-rd2: Enable the SWT watchdog
Date: Wed, 30 Jul 2025 21:50:19 +0200
Message-ID: <20250730195022.449894-7-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730195022.449894-1-daniel.lezcano@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_125310_537930_C1BE62DF 
X-CRM114-Status: GOOD (  11.09  )
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

The SWT0 is directly connected to the reset line and only one instance
is useful for its purpose. Let's enable it for the s32g274-rd2.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
index 505776d19151..4f58be68c818 100644
--- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
+++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
@@ -56,6 +56,10 @@ &stm3 {
 	status = "okay";
 };
 
+&swt0 {
+	status = "okay";
+};
+
 &usdhc0 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc0>;
-- 
2.43.0


