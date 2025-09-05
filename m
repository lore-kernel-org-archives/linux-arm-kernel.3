Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2363DCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 03:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8EcrVIZwNopsNZSwOydQsgN/ufJO3CjXbEARxDEpAw=; b=KepizXkXF/T32jcFAKWGLzxF4P
	UGPAZThPu/WjWqo3jaNAthgTrTRYHOXePuqx5ruqx/U0TgOpW0ozEg317+pEVNo/e1Ce6Tu1oMDHw
	rlI5BD6s+79CsGYLeVKm6Pm4Ua3Ba+7+xMYzP0volPfZGWFRKkc88byDm2swGQHmq4yVlalZSKHU1
	LoZc3EB6GeQev2mooQVzwjyjurk3EY2TnY2v3FJmxBRGoGy/8EfuilUUunyb1dSIsafGD7mDrbkNh
	L4C9H6rS69Za+NxFgNRlfeA+fEoSyoOMrP1FXxcuOSPsA1np7OyKb4rG6kpkZDKh7I9o+aqXvIVD6
	BMjSEtqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMyv-0000000GOia-1OAF;
	Fri, 05 Sep 2025 03:19:21 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMdo-0000000GIQu-0eqg;
	Fri, 05 Sep 2025 02:57:33 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-32b7d165dc6so1502835a91.3;
        Thu, 04 Sep 2025 19:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757041051; x=1757645851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8EcrVIZwNopsNZSwOydQsgN/ufJO3CjXbEARxDEpAw=;
        b=GH6235204gpFYgGMX/JPtCLGCAjBZtdgMpHvK31fMjxqVmmiGXrYWXRecSulmRYpWL
         lwvL37+kcvmsWal1apc5u7ZOV85SXGB6RhX37iQrwsmchZuqF6wyfnhYb9Ods3pngEIu
         f495/3TbyqU06OHQYqYWllkTGrgY9sJKk/89P8bc1jMJjiCec9YY4WBeJyu2nFrxCm1d
         vDjmTXqXOk7zevyeo/99xoLj/Eiq3JDlwdpBmJXvpaLSKPZoyDw47SUIIXuAnHa/duPg
         hKUV9OqXrHZqDZPjzLvkyJHDwl3WGXMpBzCy+OM+1RNta2C2ASu1K75f3/TaYckOVKvk
         Oz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757041051; x=1757645851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8EcrVIZwNopsNZSwOydQsgN/ufJO3CjXbEARxDEpAw=;
        b=hGp4qle4FXEp1jBX9N/r+QrujIQ2XWgQE5p+7++8yMPcqO6451DcKEQ2mif5AXBVKu
         kUH9NardWgrV+t/lJSISNx7cYuWJukNRvpeB9Vpu1+h8Y2wRdNVChJm0MZH6DoWmCnnf
         LkImJZKmgLtglwd3H9dKWw7FrrrAychepWJU3BsIRBLjNi14KBGr/LuQsCghVh7xBQYD
         yjykAcDRTom3HRoVytLAX8WU9c9F42qkdTjHgVQnaKANwxd5Eo9XFwHoV0z+dJAptipG
         iOKzn8aT+aIZqcsSTG1XQgzNuzrIMaCHJ66OxOBrgpktudVGppyJFLJMSWuxa6HLbxLg
         v8tg==
X-Forwarded-Encrypted: i=1; AJvYcCVWygY75JZaWOSKkIousgmdwdSxKAVQBETASjfWo8mnBGTmilgY5XNKTiBvVfExkKIfjE84CPPwrVKDimre1iU=@lists.infradead.org, AJvYcCWhHedklEUP0BZ1qGR5a1sITxhgm12hs1HnBLtcEc7Po5E7Zkw9QuegZ5Kto4EMcgEYunNf1Fih0cMbSa8kXz07@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6uhWMgCHDGJRA4z4gNsWTAo+5+Qa7CWf6eMPDFsmwlMmhbQ/g
	eLK8UrDYJIxFxIu/AL3Sqi7CyYkutF0iW6/L0Sgk6qt0Aig4Y1M9yO4n
X-Gm-Gg: ASbGncvgX691TCzMJYdTqPwojNrVwgQ2ga+zG4J+QTDO2CZATKoILnSyWfzVssv6Qj9
	IFoKEZsf0o9NhhW27nJDPQfVuFcLLcrdfjYRHWNtqvIk8uTD3EZhNK5Sb3odAU339zUlmBsUm8j
	srF3Y/gmSBI+cAZhlhhI7UHvQnF5csa5ml47sSLHkDfwJc5hB8jjPiircip7hbs+MZu6qH7cNF+
	d5/H+Lb+ds+tqjlRCrCYgfBGhNEzu3ybfkR1u+THtb9KtoESHB4o8/L+TDGRpHyPFsMxUxMlwcD
	yqFDnTJPUx/ETdKf5F/pqCKStxWNc6xqfE3T6pYTNngamVEuRXdHTP92Ow1GXc9vBIC+T2XhXqQ
	8RaVfeVRBK1M=
X-Google-Smtp-Source: AGHT+IFkUZ/awaS6F+2idIA8T3dfM+RISVps6w8uss4iQ4826z031WYJJfT7U4nhTTSqsApsI52Duw==
X-Received: by 2002:a17:90b:1e12:b0:31e:cc6b:320f with SMTP id 98e67ed59e1d1-32815412adcmr22646678a91.5.1757041051319;
        Thu, 04 Sep 2025 19:57:31 -0700 (PDT)
Received: from localhost.localdomain ([2401:ce20:10::d4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329e1c8e07bsm9428588a91.4.2025.09.04.19.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:57:30 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v2 7/8] arm64: dts: rockchip: Add DSI for RK3368
Date: Fri,  5 Sep 2025 10:56:31 +0800
Message-Id: <20250905025632.222422-8-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250905025632.222422-1-cn.liweihao@gmail.com>
References: <20250905025632.222422-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_195732_195386_8D995439 
X-CRM114-Status: UNSURE (   9.22  )
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

Add the Designware MIPI DSI controller and it's port nodes.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 60e982a3d..1b2178726 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -869,6 +869,11 @@ vop: vop@ff930000 {
 		vop_out: port {
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			vop_out_dsi: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&dsi_in_vop>;
+			};
 		};
 	};
 
@@ -883,6 +888,41 @@ vop_mmu: iommu@ff930300 {
 		status = "disabled";
 	};
 
+	mipi_dsi: dsi@ff960000 {
+		compatible = "rockchip,rk3368-mipi-dsi", "snps,dw-mipi-dsi";
+		reg = <0x0 0xff960000 0x0 0x4000>;
+		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_MIPI_DSI0>;
+		clock-names = "pclk";
+		phys = <&dphy>;
+		phy-names = "dphy";
+		resets = <&cru SRST_MIPIDSI0>;
+		reset-names = "apb";
+		rockchip,grf = <&grf>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			mipi_in: port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dsi_in_vop: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&vop_out_dsi>;
+				};
+			};
+
+			mipi_out: port@1 {
+				reg = <1>;
+			};
+
+		};
+	};
+
 	dphy: phy@ff968000 {
 		compatible = "rockchip,rk3368-dsi-dphy";
 		reg = <0x0 0xff968000 0x0 0x4000>;
-- 
2.39.5


