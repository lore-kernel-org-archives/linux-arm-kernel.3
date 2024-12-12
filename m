Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C41E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 13:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+9a62ZNb/EWT2KZraUPUvnwvMhSxc9YsoXJSC42SEw=; b=J4AsHpORlTQO0NF1yoQ0uXdiJl
	VSqXuNa0oc/m2g7vz1CMpUJzRyRAm+B/YbbIZjido9bVldhlrZ2Mik2KMRDfVVdSjO4Oq20uX1g0Y
	OluR0msFf65sddjDKL2nSLHwG3Wl2a4+hQqvqEB+fsVF+mkxJ0TqK2MTfglmUoqaLWT7PefanxAiI
	qnRTc1TISsG5AZIkUSXNbazkxtm4+0Jr2Ca4BtVBuE2EzzpgO9OcbScO5Cbere84qqFQsOJ68pzMp
	fp/xAhBQMNrdDD1XMJPBQBoYrgDyEntBdvk/O2pjkmw9cCTj3SpovGa4DqfOfL5AoBGpmPx2cJusX
	yXONJ76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjQ4-00000000Vj7-3bxQ;
	Thu, 12 Dec 2024 13:39:56 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjL0-00000000Ulr-2FQX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 13:34:43 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2166360285dso5667195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 05:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734010481; x=1734615281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+9a62ZNb/EWT2KZraUPUvnwvMhSxc9YsoXJSC42SEw=;
        b=PrvxFmORx3oDNzbencQxn7Fr4k4sbDGxOQgPJE8OUhglocQ6FMDDwrySAiwDz/sJSG
         5eLNrPrP26EgeqDxY0Vt26zyv+H1/i/DH6Nl9FqLgMJPlu/6WEJXuhFFnCl3qWZAftsQ
         eva6eGnrT+am2e6eE99v0pHFJ7n1waMIFiG5IYodrHVmvnLF3UNmJyL/88q7jvGLP5py
         Aq+/L3PlemDDV6XTga4Qnp6aXK6WMvGMcKgOSy0wrPmv8FIZq0sIhZ+2XpA7np53fDRr
         +stNTkiNY2dfprCmQWR+Von0iGrSb2YXxn18AvyZcO+PSC4kSCUzSjvCvBAZSF3gvw8U
         3Zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734010481; x=1734615281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+9a62ZNb/EWT2KZraUPUvnwvMhSxc9YsoXJSC42SEw=;
        b=kN0hgQYSsyibScr02HJXxf195R78a3t9UNQQGVrfNIuhm3zLm6iPS0lJRvF3+hWoAh
         rNYO3e836GLH1jxXra29/+xOqt+0MxibGB/16wH84JLhM5gposkwzcrOOrNXaV1KVe/u
         obirSMpIt4bRKmCshKB2cyx2BhvzZcUowSyzAp2bFSiAbbKBSs2manDH1m0FoTPTV5NM
         qBHUA56sz+4WK+0gbFBX1xZihLertzHrKnd9gB/exyrUL2+e5OcdzihI58/OTtxBwf9R
         YZeV/Tqj62CtLjBahWm/230vqP8EV1qczqU4QFnZ+lNTUv/XQNb5qQ9gbltwGCCWKmuJ
         7SSA==
X-Forwarded-Encrypted: i=1; AJvYcCV4gscFZTnRtiwWQdvhS76xlbk4M1cQbiPL4tPF1VJJ6rv2nWVQmSV5UkdJ1BmXyT5QdartwSrpWaIKw6wlV9r7@lists.infradead.org
X-Gm-Message-State: AOJu0YyRP6t2qGFEUyCO0vrwAoQlXFTQN29kecBG2cOPVeXtBqJXR/xj
	3Qeu0d+puwHXDqyAwsKWoFlc3qCRTVakRBr4xhqr85RrMgJ/y4AC
X-Gm-Gg: ASbGncvobw83s1CAuZLd/s33465hzeBQ7MbqFtfUzOCU6dxm9h8JxZ6/pRaLeTiNtRM
	7bIYFQvbhTqNxwoFb/s4RH47AwDUdK9E68CwP1ctuny9rP6stuRZU+Vf9EtFDAdeNxkplKW31tc
	sKqDj2grDA2NNrgOCbJexP2HHQr4AZR+AjfKfMiiUhjORYzp0NzNmK+ou8BXXjlvhcB2YufakuW
	tRr2C+/1LlnptM5T2qVkF9k5Yl5oSxyFNWU/DN3eIujjyAGSS0B0WhzyOiLPD56jrdUVLGnf3rd
	bdwOBLL3uffbI6y8nGpkggqzoSKUzPoOjzXA/1dMmXOgSsypDWKS27PVpU0An5/vmAnv7gjlEBp
	Q0qaE
X-Google-Smtp-Source: AGHT+IHy1BSLKHF/ez/arq9rOsDz9L+2JIM6hHhlvZ3suOhtFcy4XDdXZnNQNlk3OKOkub/hn6NdTQ==
X-Received: by 2002:a17:902:cec4:b0:216:5e6e:68b4 with SMTP id d9443c01a7336-2178aeed4c4mr63751705ad.46.1734010481565;
        Thu, 12 Dec 2024 05:34:41 -0800 (PST)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2163562a838sm83390165ad.29.2024.12.12.05.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 05:34:41 -0800 (PST)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	patrick@stwcx.xyz,
	amithash@meta.com
Cc: Jerry.Lin@quantatw.com,
	yang.chen@quantatw.com
Subject: [PATCH v1 4/4] ARM: dts: aspeed: minerva: add second source RTC
Date: Thu, 12 Dec 2024 21:32:26 +0800
Message-Id: <20241212133226.342937-5-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212133226.342937-1-yangchen.openbmc@gmail.com>
References: <20241212133226.342937-1-yangchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_053442_569560_397327C4 
X-CRM114-Status: UNSURE (   9.30  )
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

Add second source RTC on i2c bus 9.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 7fddbe833cc2..ef96b17becb2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -1292,6 +1292,11 @@ rtc@51 {
 		compatible = "nxp,pcf8563";
 		reg = <0x51>;
 	};
+
+	rtc@68 {
+		compatible = "dallas,ds1339";
+		reg = <0x68>;
+	};
 };
 
 &i2c12 {
-- 
2.34.1


