Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DA2E64A87
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSM9DgJ8s8ciANY65GvKwivzFuJwV1VAivJ5cEw7IQQ=; b=bJ/t6qBoL0Fp+ld/Vl67GdSxGp
	nAyL0bhNz4uOswrq/24DmMePYwYMmlXh4asncLVNgmG/7hWguMbfi60tKuQj8n7RcjxLOYe5M7ItO
	0r3rcSw8YSD4v+PW4jui4ZEixYRK4wKUIqm2WcrdiyqDir6u6rzWTP6zSeGUjFZ6MlhjFObM7sFJC
	TWKHbdDA5qFkomx4BoSiqLGpQqffyDOQuEgm/UWY/2ikRFV2uqd1aiAcJZIBY3BbfxMIb1m7yuFyb
	Ez/5PWRtMBuVez1sXL1x4SnjAcPjfzUj/z71ocPxQQjwHpaReFinYhwwn0lhA2uAwIjeijHuB7mfA
	mwqhtv/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISGV-00000009TI9-0WdW;
	Tue, 03 Dec 2024 12:44:31 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISCa-00000009SIo-3J3F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:40:29 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d0d71d7f00so4761000a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 04:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733229627; x=1733834427; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSM9DgJ8s8ciANY65GvKwivzFuJwV1VAivJ5cEw7IQQ=;
        b=R/sMnRd72r1iT7pKiMdEZjSGUAQfi96CHz6fTMzZvI04FvoURMOMkfXtUjpQUGVwYZ
         6cV73myyrhotxWr978YZHeRBHa1YTmmW1Y53TwO7kRWNnBDSBVgXVYqATc+YT84YcYA9
         sNVkPC1aA6hsPQ9vfq6G1dIq7XWRyUJxtUtFErs93WxbOcI7KwancT+ghD8IjRmjroNx
         lChiIltOrvQcbCgVeDV/rqSuwxPpA7eBmdo8H9R1r1eMGut9crPirQHBCUiThxXtsJ/m
         OTemyBP8bZGjKdiiiEZ4vO4Kdm6/umm0isPjHgOU9TUCQpKeD2QAtZPUCfl7lWZZJxpQ
         wNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733229627; x=1733834427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSM9DgJ8s8ciANY65GvKwivzFuJwV1VAivJ5cEw7IQQ=;
        b=YdZxpkqFafXdgllF54C0Pfl1pJo/5XzTTBB1jN1OEC0Rvu6KGOmgdeOEYnhf4VIsum
         5lmgzzubMZmYfWSku2VwkaPAMoP6DWO7dagaJxBUFN40HGbUKT9LNWmTl27xcMDo+L69
         s3znJZDY99Pz7hvX9taDnjXUDpOiD17oLtIqCmg5CJqZDl3159xVcJyRasJcCEEGTRaR
         iK1m0kJlyvsdGWHlZcsclSJklATWuxwkuzrWsg8z8GZOG5CAYSeHV1M1/y/ZoKNNQt3T
         i3LfFhJ01zbazydGxjEZI/GLrEyaW3m1PQ9cOcywxZH0FWN5/9+4TjOBik4zWY7fK1ia
         nVVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsYVmDYXpTdTlfdx27raFex6mL2PgaT8Wat7lup3/ATh5ZDeN7SeFgGvlSEAMF6PPxu7ucE0EdJUNKG7jNszZo@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/pipWWt4GBwSYqyNt2bmKUbYzaAtSOyXQD3zJy4j26VkJYE86
	2pSYP4RooKYMlBkx7xNWq5VPFblIex10Jy51ple1tPWxPjn0nCNn1S5X4Qf/0pA=
X-Gm-Gg: ASbGncuF73EjwXkJQC/jAaWbP8Urr3pODNibWQEq2Cx8CcyeCPhY0PcMgb58KKUX1O/
	s78pzyBqz0sUPDpDxPMl9uFhWT2J5qWylKSSdLf2LNjD1Yiv8Sgb5vYjXrH0AAVCmXu4ulwZkaA
	eiJS9Se+XsaCGwchwSxya2Rt/r6GIt9YdSEgcJSeBjnedF4YyIji4rm5HH3FzsX2+XmAiepx2/w
	kEO71Z41/G4mkVNBPTbW10fxZi7r8cZtKN4zuBMN6dbiFeI673rslMF8ZCcLv6fsXyRVlm7US6s
	PipjODsv8PiDZtMuCCpOkwnH4P+rRgl+tA==
X-Google-Smtp-Source: AGHT+IHow5Ax9TALz74PlLZBVVpeQZfnTQ4QfucP7E9gMwHlWhWcBplvAxbKn5vgo6QeTg9aVvDQPw==
X-Received: by 2002:a17:906:1ba9:b0:a99:4162:4e42 with SMTP id a640c23a62f3a-aa5f7eef4demr200217966b.37.1733229627078;
        Tue, 03 Dec 2024 04:40:27 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6a4csm616809466b.106.2024.12.03.04.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:40:26 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:40:26 +0000
Subject: [PATCH v2 3/5] arm64: dts: exynos: gs101: allow stable USB phy
 Vbus detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-dts-v2-3-1412783a6b01@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044028_827924_267304E4 
X-CRM114-Status: GOOD (  10.39  )
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

For the DWC3 core to reliably detect the connected phy's Vbus state, we
need to disable phy suspend.

Add
    snps,dis_u2_susphy_quirk
    snps,dis_u3_susphy_quirk
to do that.

While at it, also add
    snps,has-lpm-erratum
as this is set downstream which implies that the core was configured
with LPM Erratum. We should do the same here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
- drop snps,dis_rxdet_inp3_quirk and instead use the mentioned
  properties. The former alone wasn't reliable enough in all
  situations, e.g. when attached to certain USB hubs.
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 18d4e7852a1a..c5335dd59dfe 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1302,6 +1302,9 @@ usbdrd31_dwc3: usb@0 {
 				interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
 				phys = <&usbdrd31_phy 0>, <&usbdrd31_phy 1>;
 				phy-names = "usb2-phy", "usb3-phy";
+				snps,has-lpm-erratum;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
 				status = "disabled";
 			};
 		};

-- 
2.47.0.338.g60cca15819-goog


