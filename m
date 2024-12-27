Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F95E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=; b=gRga5FEsM2ptDWbajZC4c3U6Jo
	WCiGVeIZb0Hf3ZwXja9FE2sgbL2xxXTraK2InGtzMJV3/lyC5eeNIZwMwotsMAE7FkLc+pEiH+O5a
	IjsM8wdokn7b7k/RNJnOjXgu0LMJD7ESKvdM5g4n9qe6S7GIVWUtX22VfWdpSBWN8h/d8/E//7Gb0
	IZ012nb0vincAvwBSwaWl7BD34hMmmqgIvETxxv0TotDNLZc8aRjva7Mf3zfW70cY3omZDV8n4D7p
	Q8knUb3JQdoVbM1E0cOCaEpWsVBfvnR9ckNaEP40y/6h9msTxVOA5KFqLNgTYkmymt9emE9PhjPz1
	EKdJz2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDoh-00000000gS4-3pbD;
	Fri, 27 Dec 2024 17:08:03 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDec-00000000eUw-1Rad
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:57:39 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aa689a37dd4so1083966566b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318657; x=1735923457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=NNvwJcbvsdsW1vAyRB0yezCvAebkJCU4a5dQcRsORkz1/i+MeEGwAu9W/xFZ9V8clV
         9nSGw6+y8rtWhcBHFEAT9pKeiC5xPRzC3MaVk+QBx/MZMCy5JtInbz1e2Vsbtp+7oUnf
         1KsaivocS9Bph87uFsyGm4rKcKVpAl2NQ+/XE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318657; x=1735923457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=fo0uj2Zp0ZRIH0yl8MFlWVhrKTHvmyZh/y5b8x0UeXyP6Kh3oeXL4gr63p0r/bxplt
         imGTPBLZqTm0yVoEkSN5wJLT4buO3niyk4YnNY2N/aZdvK1sDOZxH/JYsEFVULW5qw3v
         tSYT0sHAi3wmLVhzQseI2i0yYcLPNPJseRf3krRmkv0/EciyClQdnLYfNdrynVm1em5/
         pvwtX1rTv3B9vOjhazTbKN5uCP7yUg3qfepHBntC3YYMNp6986Dy22byu5W7tv4LzNJa
         L/QHRtJoEFUYP3u3JWJ9P7ToCkxrMULRL3qSJQXFfKmi8FAx+IBh8aw5RKvbyTz5eiKt
         nhJw==
X-Forwarded-Encrypted: i=1; AJvYcCXuOSDLBVV+5r31PZzfXyLwA5ZEhy+f6eUzpdGSJv3GCv6sw0ED0ogIwNXj6cuTQVg6hPBrIqpihQdrxsiFKChX@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq7ksC1DzuZBfo4gSleuezgHEbC6us9nRlGSeV0ptO7X40McyH
	mLhPOlAy9ccYPFEgvPpNAjJn7lCcf0dSUt0/MfysFPkERyz/TffPVgBFq1+ew70=
X-Gm-Gg: ASbGnctWODGgLte1VrUpoF0IcN3vY+M+OKKILvOELeD3EacboQ97i7+841C0I+cYK20
	oNK1AGAgnPVdnsEMSgDKEk5UM1EEyXIj6TekKxdQ8JBTO8briCpQ0fHt1ob20s0Pl6topPnePhe
	ftyBGsjHZseZ2ksn4pYh1qnza+LMPiXjHsCz2B2tsjoLZt1mXhZ66+MgQcCxn0JH6Kss+/b0Usy
	X7lKzSh2dOERDg0ZhrmilzUj5xWCCdgfb4ksOvj0i22pAs4P4eLOfowQs3l/TNUmfeWJmAFmOIq
	YpNFOI5BgXrEL0I1u6fJZQ==
X-Google-Smtp-Source: AGHT+IHqEpKvPrvAcl6AfnqPR2zMpwbkTUBZZsaRlEKFV18gzQEhapMBi6kOkudHyHxl8CuL5KGNTg==
X-Received: by 2002:a17:907:7f92:b0:aa6:a87e:f2e1 with SMTP id a640c23a62f3a-aac3378ef88mr2400967166b.56.1735318656917;
        Fri, 27 Dec 2024 08:57:36 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:36 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 08/23] arm64: dts: imx8mp: add anatop clocks
Date: Fri, 27 Dec 2024 17:56:11 +0100
Message-ID: <20241227165719.3902388-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085738_382925_CB45AA2F 
X-CRM114-Status: UNSURE (   8.92  )
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

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..0b928e173f29 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -709,6 +709,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


