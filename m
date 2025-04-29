Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFF2C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 04:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=; b=Ig61GId7fDRRVE/+9I1bsK8k3Y
	6UPKyclWsXRUaJ0rdNTR4aaUYxEsewoHx05TFW+QoPQuaY/vS66fp3A/ysToCaC/hvohLAkUWt3sj
	kgPtUlWdI7ZI+1ik5w/o4HtxhNBOkxszfx/EVeZlfFFjX5dyP+5xfsXCRKiAyGuAXns86dbADLSl4
	9etORMROUWaIrf4eeX/t9scWsz21+QsRuyAzYHImRNC7A+FcTojyph3YTCl4ygdHreb3Oaq7mmD3x
	esufCoTbnEUlE9WoLcCEZapktEEp8jEiNv5um7k/B0/fMwtjLBE4Sk5Eukh2sNBkxmunQSTODPvFM
	GY95EQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9cQm-00000008Hsi-2Nz4;
	Tue, 29 Apr 2025 04:18:52 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9btc-00000008DEo-0YWl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 03:44:37 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-301cda78d48so6965415a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 20:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898275; x=1746503075; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=;
        b=GCZ9Qbk03XRR/sWro17jD+ZyhSwxt4XPZH4SzGs3b3pBCd9SfL01/ogQ5XkRqeLZ4J
         OmzjJs5YN/rhDn6SRpjS/iZ9cvFLs/gIUao1kAbGAzSVLW4hxs73pPc/gBHHAloK4Kj5
         kHoRvGni1rHZNdcT3O/tZ/SvvBus9U+g4iFrLU1Eyd0pQbiNwAvdF+iO7mNzaTFV8HcH
         Hip+4K5+3bCby5gVt8HCPcpSVQ+Q+06cwxT6OriyiuvSy66V62GO6TR6zHTfbm1gbHEv
         MH4o6DAaZFY7TNhOy8LRmBUORONVTDfR58inHReOWfJANfUn59f5eoG9KyaGWA8ckbKf
         FQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898275; x=1746503075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=;
        b=WmSVQtZfxJeVtrqrUlOJ7wAZKs8ozigAeVunn58tSnX7DZbxwy87DFh9Fac/fEMQ4A
         LikZ4OsIozifsHqjPR8I3Cws+/6qjrkNcUdGoxp5mX5yhSKdzZYoP0aIWJsjnF76/y+K
         euyRt0yzvqhbGy+A+Oj2/w7Tkk+5urAEga89djv/1JFA/tCon198951LhhXBucuPnX9T
         KDfRGxqeP4iGADUKE4cmzm33/52j5bAh2pvOgxfluco8SuR9lvrjpqYsmjrACyR4ytKG
         hoxJLT1naa2wriGB+EUvKC3uGAwCV9F3XCw1mhvZLZ4sFhbsXPYvihyMcMBR4ILGyAmT
         cysg==
X-Forwarded-Encrypted: i=1; AJvYcCXvstHAmI1aZ+eS+8gerNDt6dUA2etljQqwuDoo5i/nQTtjM0ZcyXg60SXYUMX3wY4IRyn1nbtWscaRl91kRWaX@lists.infradead.org
X-Gm-Message-State: AOJu0YwZtyGkJ8sYW9fNaBJZ5ynBGTm6FHeIFHWyGfl1CqUJifkauqnl
	R95cZjpoBpyCfs1ryLlnMz5LqK2Bctoo8HcadKQEkA0lcyWTMSgB
X-Gm-Gg: ASbGncuUlmcHLvYWQUDeNHmNN5ZKYEd9FK3v4y9OoDaaCYrLNIJgCbbmesrr2nlFKJL
	JQAfJAVxkA24nZ2KbnlDdkN3lEQwdURqvSRjyQw+65hreNdGRi8L7Ge1KkfovyNbyvDdDmQu4NW
	7sMNTj2qSJ63ei0Oofq7ubAysQAphHNqSWcQRn8H7rS4K+ZgVyZcX7AA069ppVwy7eD/K4p/U7B
	0ZTPBpKLBbimMiiuKLWRLJkKFF5Vinh3GdMaaRH8n1oikEnRH3nefA3C4czKrgkFrkH+B602PzN
	Hs0Er1gpe3WYLXuOOiUAB6iqqgP9v28gkDH1fYbK4KK3LbsZl59P0uI5MA==
X-Google-Smtp-Source: AGHT+IHWfMjbVQ7CEMWplQp6hbDhEW0CnashZJmxKBOUPepAX15akTtG/oxgIuKanhYarcPeCqHQeQ==
X-Received: by 2002:a17:90b:4c09:b0:2ef:2f49:7d7f with SMTP id 98e67ed59e1d1-30a2155ece6mr3699740a91.18.1745898275246;
        Mon, 28 Apr 2025 20:44:35 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:34 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:41 +0800
Subject: [PATCH RESEND v6 17/21] arm64: dts: apple: s8001: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-17-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=umS18Mpui1EoUACcGD+WdVdka5VgnqwULsO8fA+OvnQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErl/IRyZyitmYveeenL0GQFh0I4cCrA6w6+0
 9uwRuLZGQaJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5QAKCRABygi3psUI
 JKOPD/94+SO3FKA31NGVpaytKTjTzwMf8DGMAGqxJ3qNQv1fbU25mGiif6KB8zFmOIFvLYaKWGL
 3lHVdyBFk3VRfYjagBokp7A32epeJOpRr3bJVzBAtyIVZqgpLmfpMToHKoHGY++WMKTkqCexJcY
 1AIvtoXobSR0z7CFGe0K0VgakVOwp4KwFMJPtA3m6hveWhGKvUvslHaVSNUZfI8BvmyPZFRGF2B
 fkmqjzN8cyKVkPUbTvKRd7j6hIRFFUtzQ0F2bOvPjMh3k1hguUCEIraz0IrrJY89cYgQI6XzstX
 crkcRrNhOfbzhUx7Bf+JAI4RKtY1+2W6CSEXXwqfEr8gm+WxvaeeqyUHxORn7aXXXcjmZSW8esG
 FxKwhUjw33IrQrZtNqUD96Fh5DL4852ZvjvFJs25Ro5myt7hQOroQfZuIdpZ2chsNQ8pBwdwj5H
 b6eOaanSwrQX3ueBcLwJlIlfjw6zpHm5uxhCWQ1+qgKlTjF3GW9uX6zL6GjR8uWV13ApHCpN+Zm
 Pqf9CZC7srE0xwu7pfhnT9kbhIvEBjnD8rd3elEJ1HUD87JRVph6NcubeYCNYbPvF5XXl7utSGJ
 DICB8VUoC1e5100qCY2XDRjVWVrIOVJiLT8hLwRbmEzMLRjC5yX410cSKjuiRClh7xqZq1yZE3L
 +EU36l+T7kjRA4Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_204436_176471_93E1C311 
X-CRM114-Status: GOOD (  10.04  )
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

Add CPU PMU nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index d56d49c048bbf55e5f2edf40f6fd1fcff6342a9f..33760c60a9189df5491256f81db7f413cada27a7 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -209,6 +209,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s8001-pmgr.dtsi"

-- 
2.49.0


