Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79EDC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 22:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsfY0lV9E4GQej2w/iz2H9P9kYpTOHKDKPixk3yXVII=; b=mPKbmAmZhMDV0AzfBvJ+0q6hgI
	IZagLIAsRFkX+uy45qKA+SeIJr9l9g2uHPdE3O/WwNJP6qsrUGwYq72sYvah+EeaBdVdyWJ8M+Ukp
	sdA8CIgGMKcyNs+lKYw4pYzCTNVDfrmlbYR0HfrD8ldJuOdp2u+xXIfZPGb/1Mev3D1+lAkDPyza/
	p1XWicX83iEp83+gxgxHzxvFcnofr2srnqyRdAM6qjTLktPgQKTxfB1QJz9HZsP3xIir5W5V+tJ6I
	QhfOsM9RTyAwlNCTZ4kheLe7WbKFAVDbIQSSlXuvoSRKovymggM201Uo1wRfJBwosbWsia1jQSABb
	/HYYU3KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAyyP-00000003AoH-1TTH;
	Fri, 02 May 2025 22:35:13 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAyVD-0000000384s-1crH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 22:05:04 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-74068f95d9fso72558b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 15:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746223503; x=1746828303; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsfY0lV9E4GQej2w/iz2H9P9kYpTOHKDKPixk3yXVII=;
        b=j4VqNQnlhJbjsfNCwfNxcSQgUSGq19lrQC0vgvH5NZ+zFDTCHJyjpITCMCYVLCgY/Z
         YVRu0t1jldb56NrPrujoVJo7idWIl8HX2LjWP4mpjDgGun+iIMOJsI/2Dr7ry+LFE5wl
         8k/kY2HtmJWefHOrjUF3psZkXtbmSN/t4eWFDvywzxzE0ydnNHEvPxuU8/W0lUP3lzub
         VVo0oGH8XAqU0w286k9qH/2b+6P70ef1FV9qskhCUL5pit3VeXCj6ZmahDid5wXdaaNd
         cTW50JNVegL+Wzj903SBYIHNkMWa6JF7YsIJl0+9e0PoPAzg8kW3eRWTvBai9c75ja6G
         ADSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746223503; x=1746828303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsfY0lV9E4GQej2w/iz2H9P9kYpTOHKDKPixk3yXVII=;
        b=sTJXFa2iCWXSQVdYLXtjtvZzped7MPWf6V2NaycgxgGSe0e4r6MsMiw5RIUMYilZii
         GombvBZpxJj0OQOGFqNQMMS40re4BHqIFO4dJzVAjbLGyQ2FsmFK2+EM83KTGmYCRTKV
         s1NJFTqRvbg/ASGXa/M+4iQski30rjRfdWc1GjKwkrITGSvP+FP8b51QaEX646oeMD2e
         G7bB5NjfKheya7fjB3eE68vsaLr28RvlHhZ59khxFTUXpaK59gzdjO31TF5ev671dHqn
         /u5vVqhDwl/n+Eo/p12dxkvIch7YMd/iXIfyOkHYuHgKOaYkYwnpZS3e8iAiRAGMD1G5
         +UZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG7wiIVSYC2l+2WLkmvszuhiXv2RfF4KIL2MHmqZPK+UlyqjlJ8n/EAGK8IPZZVV3O0VPs51aXnwJZlLWmkPPz@lists.infradead.org
X-Gm-Message-State: AOJu0YxrmDPzCtT8UsSFmftlV0IlnGpof99o3xldartQRZX+oxq8oqb9
	wyTMFYANiQO0UeQ7TXdVL5+Otog+12JzVBDqWOShAJnypQhDYEvj
X-Gm-Gg: ASbGncvkgnpdJYqOVUq2bCBFXTubSC1FpK6T+LBDOgy5OzP8La5NdyBc2Fx26L4qW1w
	ADJIkVQzsmEgwR4ARHS7QQuMP3pfGl7NF2J3mXgq1rXiOTwuqeveWZ4ZbnUrUwao7lecSnBF/59
	UXpVsAImrQ+fz55dJDZFWUhnnmSB2biSnXSmmafwpXHmgg1PtEzYa4NB9aIskj0OA6DOiei1rVg
	YqxzMNiYVSX0x+xZrJ4qh0rPdZW+qbsLVGsvvD96gMBaeEJKY7JAlr9TPgaQhIKN1VBOHAwq3CM
	Ph3Y9zaU/HXeJn4SkyHL0MH1GOO5gh+lpr7+/go+lajK3h+m0248YQrYX661Uy4=
X-Google-Smtp-Source: AGHT+IEIHdpKHHp0Jwn7v/qswP5sSpR+7kBroeMagApShsPV6L42FJ5hXjpTpVflWJhXlFGCaYxMhw==
X-Received: by 2002:a05:6a21:6b86:b0:1f5:8153:93fb with SMTP id adf61e73a8af0-20cde8575f6mr5246810637.10.1746223502909;
        Fri, 02 May 2025 15:05:02 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c48ac4sm1301153a12.55.2025.05.02.15.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:05:02 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 03 May 2025 02:04:25 +0400
Subject: [PATCH v2 3/3] ARM: dts: vt8500: add DT nodes for the system
 config ID register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-wmt-soc-driver-v2-3-8c774ad84d47@gmail.com>
References: <20250503-wmt-soc-driver-v2-0-8c774ad84d47@gmail.com>
In-Reply-To: <20250503-wmt-soc-driver-v2-0-8c774ad84d47@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746223484; l=3308;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=dWBUq8bBWa8P3YO4Zzb1jAw2fF/9zbTcQ/3MFoyjWSY=;
 b=CdXpquQvvaMvwd0gcmXPZLNq+z5O4wX4uzNPsvinL/S+zR46NynHev1DlfM1FVWwry826+djS
 lMlJuAeRroJBBILdR0gJkSvp7YJvYjQC6WVmUABZJYFkPQiz08/gdvd
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_150503_435867_4AA56CC7 
X-CRM114-Status: GOOD (  11.44  )
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

Every VIA/WonderMedia SoC has a 32-bit chip ID register at the
MMIO address 0xd8120000. Add respective device tree nodes to let
the system code access it at runtime for the selection of appropriate
hardware quirks where needed.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500.dtsi | 5 +++++
 arch/arm/boot/dts/vt8500/wm8505.dtsi | 5 +++++
 arch/arm/boot/dts/vt8500/wm8650.dtsi | 5 +++++
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 5 +++++
 arch/arm/boot/dts/vt8500/wm8850.dtsi | 5 +++++
 5 files changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index 09f5ed3e6821b72fc440f9de3df0ad484d2c4e17..2ba021585d4889f29777a12473964c29f999f3a0 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -55,6 +55,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		chipid@d8120000 {
+			compatible = "via,vt8500-scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index c81810b967bb349419a5ac7db4e788faec3695fb..99c064c916b2279797f71261ca9306e9dcd4bbd8 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -66,6 +66,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		chipid@d8120000 {
+			compatible = "via,vt8500-scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 555008120a3e315591d2ca49a39d354925d570fd..0d6c7bd87f7dcce0eef056d04c38ab1de5d52639 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -62,6 +62,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		chipid@d8120000 {
+			compatible = "via,vt8500-scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 309f6e5129fb817d343cd58a8d90340afd8d6eb9..0158c0ba5dd110957eac38775d3bf3ebd2ab4154 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -68,6 +68,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		chipid@d8120000 {
+			compatible = "via,vt8500-scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index 3f4a514d65e2ac7658b73cc9c4f3cae1407265bc..c4bfb4d30aad0358b39cbf30edf0c63e32167bbd 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -65,6 +65,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		chipid@d8120000 {
+			compatible = "via,vt8500-scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;

-- 
2.49.0


