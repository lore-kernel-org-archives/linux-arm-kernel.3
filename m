Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E75C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 05:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkuBRw05Sy7EYSCt6VyIOWdi3s1ObjekFGBZ5YExy/0=; b=qlDaEkF1FpHnGmHJ4+IwNYQ/7P
	qYZdHX39UXMm4noPXhKGDTtUO5apZHJ7JdBY/NuO0yFvwHNCbUoylkAJSNiYd7GwonEDYPqritbKS
	EXNawbpmizPeSKLiibKeYdsstRHPSNZVAGPstoNkHUuFuU+lmXXwAi0M2L9+KhKhlXP3+jpfBNbDO
	lI81UNDlo6RE027++ch/ZoYY/jlUvRKOCNdx5IkVINBkuuKjkYzeww0KSrqUoMztef+9TB3FlTbRY
	vSUlSVzKwpJdm3U7NmJco72vYdTK5/LBMTp4pPCLFvkxWIOhmOb5+ZB7GGrTI2eauwLMCuEJHWvqD
	e6LBWwtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtdg-0000000HM2j-3Mn7;
	Thu, 08 May 2025 05:17:44 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtXs-0000000HLMt-1ezP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 05:11:45 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b1ffd144867so153632a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 22:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746681103; x=1747285903; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkuBRw05Sy7EYSCt6VyIOWdi3s1ObjekFGBZ5YExy/0=;
        b=Yfw4/1JoScGfAmSd88rMpvnAQlltE1ydHB2AWLoSoKDeqLy6oc8KymU0JU2rHTo8IZ
         uTTKtEqeOWXfRMx+axL1CwO/cRSD7dtX/FBU+ki+64WeC3f94MHH4zLPW3XbRZdpkrVk
         JsLyZhCWTjVpe5fzUABrE8WnSP/Cpvl6pe03nZLeBYbEvtPKl96RBx7lb+Mumfr31iS4
         VP9KgtwFLQJAi9d17CpueqyJjXENknjJ7qYtVKIDC3fJGBptrnzk2XNwzPUnTMJu1QxN
         Bplo6EC17KqFyOfJrc95LJ43KN3ON2WWUu/gg0kO3+jd8rrPXZCMn+iCNYrSUx8wN/oL
         B85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746681103; x=1747285903;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkuBRw05Sy7EYSCt6VyIOWdi3s1ObjekFGBZ5YExy/0=;
        b=AZTjfcnPgtoEMZV/ozKkSMz2WhHkzqvhGdeyn3kv8dum6hQ7uqhtzE3TABTaZ32alF
         u1+Joah519B/dJA3hsBX/V2LYXSRK2BM9MzHeGvY3ipsaMU7WuQcpidyo03BHiNlvGtD
         DwZpvKHC38sQ47WPmJ81G0x6Y0uWBl4OKm8BMPp5CQPpP99uF4pZn7+N2/5HIVPJpkG8
         vsfZ5S3Tu3yVjz+J37H+aYqRd0LoK8w2ck3TgksElA2ogcfctMAtLheNQ0+dEFnu6iNG
         iVCd1inExdIHoavmWIBms3qy8LyTglpfBEC6Kzpvyvc5wanUeAn1WqTgrO0D8G1WrvIN
         5qqA==
X-Forwarded-Encrypted: i=1; AJvYcCXWTacX2mRpBQntRsainpm5KkNARFt3KquA3XhenroUyAz3Svhf6GD1ojDuSLlbZmuh69QYqhqZu4ozeM6sW/vS@lists.infradead.org
X-Gm-Message-State: AOJu0YwVF2j9M83+ACdi6+pbp1aZrn6AyoKEKgqbecT/TW718Foc3OE2
	F3ePWNhLJ0xUGjAoz9rF+er3XksCAdH8VUvsNHrFXARois8TRstEC/ntCnjNesOdImomukZFHee
	JLg==
X-Google-Smtp-Source: AGHT+IFqi/sBjRSvaoAz7eZ3j5I77pIqUeGYHqCXjKMp3cZTaUN3BhT0tP3SmQRRmwUf1j4EPXnzb1Q6Nqg=
X-Received: from plok6.prod.google.com ([2002:a17:903:3bc6:b0:220:ea57:34e3])
 (user=amitsd job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:990:b0:22d:b240:34c9
 with SMTP id d9443c01a7336-22e5ee2cfd9mr89525335ad.53.1746681103163; Wed, 07
 May 2025 22:11:43 -0700 (PDT)
Date: Wed,  7 May 2025 22:08:52 -0700
In-Reply-To: <20250508050856.674782-1-amitsd@google.com>
Mime-Version: 1.0
References: <20250508050856.674782-1-amitsd@google.com>
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250508050856.674782-3-amitsd@google.com>
Subject: [PATCH v1 2/2] arm64: dts: exynos: gs101-pixel-common: add graph
 property to connect tcpc & fg
From: Amit Sunil Dhamne <amitsd@google.com>
To: sre@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	peter.griffin@linaro.org
Cc: andre.draszik@linaro.org, badhri@google.com, tudor.ambarus@linaro.org, 
	alim.akhtar@samsung.com, dima.fedrau@gmail.com, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Amit Sunil Dhamne <amitsd@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_221144_430570_757C4E14 
X-CRM114-Status: UNSURE (   9.56  )
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

Add "port" binding to represent vbus/vchgin connection between tcpc
connector & battery using OF graphs.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index 84fc10c35629..45b079c16146 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -186,6 +186,14 @@ usbc0_role_sw: endpoint {
 						remote-endpoint = <&usbdrd31_dwc3_role_switch>;
 					};
 				};
+
+				port@3 {
+					reg = <3>;
+
+					conn_batt_vbus: endpoint {
+						remote-endpoint = <&batt_conn_vbus>;
+					};
+				};
 			};
 		};
 	};
@@ -197,6 +205,12 @@ fuel-gauge@36 {
 		interrupt-parent = <&gpa9>;
 		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 		shunt-resistor-micro-ohms = <5000>;
+
+		port {
+			batt_conn_vbus: endpoint {
+				remote-endpoint = <&conn_batt_vbus>;
+			};
+		};
 	};
 };
 
-- 
2.49.0.987.g0cc8ee98dc-goog


