Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C7DC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 07:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yYy4AbJx68HMcvUd81BZlBUUo2lt5qzF5zCFnIAXP0=; b=1ZlovBKI64cAsiloD0RLEFkuAE
	FDgwqQG/e5Kx24THUxCGoP7CGwD6z21w797+zIoivgcOFyHR7ARSO/pRhlvzgrtIvFWjL/BhUz/Q6
	GD9XISNpl7vxqNRyX35jiFiYFb+15P2XLQ+Z15DUkGLgzXE4CbA/eGxV8d3ivKyDvFghEYEEgmr0a
	aMtzfBCqwmeVG9u172RJyjeOLdYP8q9LBvyYVmzm5m1C1/mQ3/cSIY1SD17oWsxZ2bEmQh3S98ln7
	JsB2qAqmUczNQmN3zrhm6xE2j8m+xSABi7PJNbQZUBJ3+RwJ5IiQW95FG1MxTH/vV4mgFe7YenOih
	olZJ0zbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvX4P-0000000E93s-1JTm;
	Fri, 21 Mar 2025 07:45:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWoG-0000000E67K-3Qfk
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Mar 2025 07:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6yYy4AbJx68HMcvUd81BZlBUUo2lt5qzF5zCFnIAXP0=; b=Xi54NJ2P/JrzTkQqS7uCzprQ2y
	sjz5QwNJXY1ibmAbs/pO08nK/dMA4cHbV8DpjRIYG4x3v3avqNpNu4G5k7g0R+z1DJ6AswHYHMLzz
	IngBP9VyE+lHO2P4c97BFwG5FY7NQ+A/AgrZXkJ9oj4b16dkvxaSaTZQxosfO0UQxvKAsSQn2Cjc8
	lTgXTHJbCJPKW/gz+vwX1BKtNl1ICwoX7MQ2IiA+Jh+7vGenCRyeP9LdzvoHUnZ9ZsqcbH+n3DuSL
	SjNF17Qy8q4dLqfcoHz2Ab6blwkLlAyA9chsHUfM8qnw45cAy7zVrOFYavRTf0IcgWBoO9RwkJ40/
	OPYn51aw==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWoD-00000004Jsj-3xx4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 07:28:51 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22548a28d0cso4110325ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 00:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742542127; x=1743146927; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6yYy4AbJx68HMcvUd81BZlBUUo2lt5qzF5zCFnIAXP0=;
        b=LMBC9oRTK+/gPzCP0iCZ7+jfRgB4KHvCGiAEVuFqStFTSc+C1ibVLp3ffFAOTCSm1f
         jiBX9uyGpCUQZZiyA2swhgSU5kwD9qwybv4NbU7/3YiIfh4c20snyXUhBhohzbBDiATz
         A622wrIx50rXMnhcl6XFsn0o1fP/dmrwPwTQ9AZ9uB8vh+cGls6bdiUgHr+3Fj03D3Z/
         q9rPIVRmD6kyVDoCTdYYbfBWRtaBASTtp53H4/bFUjWKiPJkoPA1ag6MiLWb2QBDQqDy
         HUKrT9N+MYQf4RoOgTWAJmljVw74CBFt+n574SbmhmhhzOx2edkL+FumeL5GyzuxbeVj
         mzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742542127; x=1743146927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yYy4AbJx68HMcvUd81BZlBUUo2lt5qzF5zCFnIAXP0=;
        b=GABq7EsLUkL3wpg+E/ZX/QJO3WcA7mU0whMwrD3sHw5WmDmi7hCWGK4p+WS54Xd1eL
         M9LMkImXhfMoUDh1qQXCJtzqj6vPO36l33xDJ8enPCf0iVNz0bFtKY5DcTl6dq3HgCQO
         U+myGLj9SeuqJm8etDaUmwmsdj+VPjoKIEuR8W2xdWeOleRUzvu+1lrJKYKnkvzu80AG
         D6tgO/gAC2mlJyfQ//FMFd9JnoT5h16BuyKuQ2+fCV1hrjLNqftNuB0NukSK3tl1SYpK
         cMnw0CVxIZqjvu6bF/TRbRDgSG2PPTCd+IqIeyDg8363rd+wILpIYiCFcuIxNYEijRdE
         6Oow==
X-Forwarded-Encrypted: i=1; AJvYcCWaE/Uz2vOHqMZsHs/kJOHDc2Umbgmkag6xQl3CEfRoEk/qkasZvuaY9uW76d0rUp3iqrYTS+4vwbWVbeSb3j2W@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxo/rVjoieFFLxLcAQazOmv2Tn9b/H63XcBHB5eMzgQgPQ5XFt
	XtE2xyBALitWrf2aoY7d5SFrIEYRHQcNX+EYvLA/YxBnCtiRlEEslYjHRg==
X-Gm-Gg: ASbGnctJVi2G/gqct2BASPu84V3XKy930AuuZj/W/+zPl9zPUvCUo5UksP14Sa2ivRV
	Ly2BNOgiTnbCF4s7xu/i6tokm7rz1wfMa1NGZg3Y5GsPscDyseP3NVZhA6HyYnft2wtNRtClDFv
	GMKDsrqlty0KgtUqDDpttkhOY8Z5bvBxKX+OQmhbyaQ9fAi8zV5//1Sa78UdS/ZOrSgGWJf92yq
	Dv08mrXdjia8iGZOsSsNzT0l2Y5+q+UsweSXxfB3lv6jKA3VVxQSamG743mnaUP3QN9sa4q2v1u
	0FM8oBmpsZzQOlmL3mSUTif8xRLtJ99ngCoYFtofvHRt4oRWIsJucHJanxRCK69NTa6a63FJgOo
	F9E+SP/aP7QLO2BZaBxC9/Q==
X-Google-Smtp-Source: AGHT+IFz7z9DTULNmP+oLx3nWMYzi7RsllXSFyhzZAy2FVTHB5ZXzxdUyhyyOFfzLur+HYKAMXEW7w==
X-Received: by 2002:a17:902:d2d1:b0:224:24d5:f20a with SMTP id d9443c01a7336-22780e231a1mr42741185ad.48.1742542127003;
        Fri, 21 Mar 2025 00:28:47 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f396fasm9862265ad.27.2025.03.21.00.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 00:28:46 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 21 Mar 2025 15:26:09 +0800
Subject: [PATCH v6 08/10] ARM: dts: aspeed: catalina: Enable multi-master
 on additional I2C buses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-potin-catalina-dts-update-20250102-v6-8-4bd85efeb9b4@gmail.com>
References: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
In-Reply-To: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742542103; l=1008;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=p/QorKJCn9XrFKbtYC8NvQNC1AWXOIPQaV8PshPU3mA=;
 b=hV+DOjonfukNtIa7vGCSR+jzs82NRq4/way8tjyiwrTKrV6clGwwNua5InfHy7waqGTVFHXvK
 faEslXcUhw7DyXaYrSgm5Z7hz5gKtrp0n1tFujFjX9XQSfpXo2jPHzU
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_072850_132162_66552A7C 
X-CRM114-Status: GOOD (  10.63  )
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

Update the device tree to enable `multi-master` mode on I2C buses shared
between the host BMC and the NV module with HMC. This ensures proper bus
arbitration and coordination in multi-master environments, preventing
communication conflicts and improving reliability.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 6702be32918e..2dbb65db9250 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -815,6 +815,7 @@ ssif-bmc@10 {
 
 &i2c12 {
 	status = "okay";
+	multi-master;
 
 	// Module 1 FRU EEPROM
 	eeprom@50 {
@@ -825,6 +826,7 @@ eeprom@50 {
 
 &i2c13 {
 	status = "okay";
+	multi-master;
 
 	// Module 0 FRU EEPROM
 	eeprom@50 {

-- 
2.31.1


