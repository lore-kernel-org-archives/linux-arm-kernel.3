Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC2CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pGIq1PR9lkwo6mEo5Eq/Q4i7Z1n4SSZ995JZ/LQKCc=; b=Fy4lJpzmfE3yLD6QIMMhutqm+h
	f2l5FuOTovAJAd2UZErxzQ9p7kKYKI9IWvTOVw9Ur7Qvf6J0ekih9Lip6L+kaQn1AJCIBa6cDjE2X
	miccE6y6ZqZnOwGJIjCV3Hu37W89TuaG+3rA3YSn6q4+bXni2PVG5p0JcAOwI/AZVJ97lf+qevHlR
	DTMj3iRzXb7Ql4OI8Tsj5ZODGGzk95e9NA0DOAyR1Jhji1JTCKsvAXoLgtBwug+1rF0ITz6Oiai1q
	hZUyLT2SLFC2vZLYXkf48/Jq6WRv04dX6t1BvF7Kc+bIcj3cUnUshYtE9TFmKujnABFJZoCGvPM3t
	ENWjZ/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeJk-00000005Cjm-3r0W;
	Fri, 20 Dec 2024 14:49:28 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeGN-00000005BhA-15aG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:46:00 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso1518966f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 06:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705958; x=1735310758; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pGIq1PR9lkwo6mEo5Eq/Q4i7Z1n4SSZ995JZ/LQKCc=;
        b=X5LglxinJtv+XnDALQx5+5QKZxz5JvxLSQx95XE03JskgH6mh8oQbBq7j85eHciUtZ
         LM+5UjrVPdUCRSZxTgAc6xwqTh5NbSi4cHLwpJbt75DTAhSPXhW9o5mxBbkf4c+ARcyX
         DpZwa99EnGSxu/V3A/PDz6oSl0oVFce8dB+KCnGEqjXKRI2ILKWJ836jr2zZKDmFd2XI
         PLt3SoBzk8Q8RvY+0ShxvANp+qKv98zDOz24aT5nJWusOzqiJ+/vLgqCcDx+a1md535p
         BRJfHspsmkuxRtnmFFnck7BQVDh1qgUVJ2tIiDEKnb/BP1LcSDkNp8Zudo1fdcCNmYCr
         GFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705958; x=1735310758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pGIq1PR9lkwo6mEo5Eq/Q4i7Z1n4SSZ995JZ/LQKCc=;
        b=gRztqocrfdi/IZYC1NFE5savnDYpyL1VTE/ddpAMbCZRA8a+k7PX/KoX/zomyUttmo
         hEUHV+uGKOpHowxWWdKaQ5PoQFo2VJivPKOdVVMjUvtz0qGku6hTCLP4HJGQXDvhcxzB
         XD/Uw4kJhvUdZYOpUohFwxbta3lMhxSusvjofhwNj5egCkW3jvGLRcMXm34sI4DblqS0
         Bp6d7tmI+Qe0ZxoD2iO8+4/fCcnu2alB9f71jvxnl4d/aiTF4NKSPISk/lIPpDAjifcL
         7e9yTN6Z1ha+ywS0Df54LoQym6WYi0K6XRK9itusrNaVygKByWI33h8ipBrBoIpzvUos
         TxkQ==
X-Gm-Message-State: AOJu0Yw/FLnRG9Pl9cVWDZRMpsoXcNjpRmeq6IupZjYoAhbD6ZdQaXQD
	CXz9OVt4RfaFdHDgd2/+PjYGPivSJ8WXbe0MxKB6Q2nv1yeHqQVYYfLU3p3+RME=
X-Gm-Gg: ASbGnct7ysbFDzwm4nz6pK8weZn1UIXtt/uRyN4+WBfUqxY+Cmcj/wALQS6WpTuKdr2
	brdgoCEq1Y+bCm3I2nzC9zdJpQbdTgsuROgNp6DgyJhdm0Dk1Z4xN6JCGtOKIU0FwJVqfQwD5P3
	hxeLlAsDbQrdyoXvOxmdRUtuwQNIbLQOoX2chP411IMB+rF0VdeHqfOaWqt1/Cya2PqDXOO/AVd
	9V9DXg/naW6ELSRanZTZvR8dqZfRHaJ+YMDZmvMtKMXBRzcLAckIbl9UrvYO7k2xXbvbpt3TK1W
	kG4I4t56fxoOQlbSBRV/viYoUcoD62xTmSK6
X-Google-Smtp-Source: AGHT+IHswtHlhbAXYQTsxmj42Cx6z0kRvJ6s2dUNedujrsv1Y3qGW1iMiZ0SDo7FMblpbxhFtQc7lA==
X-Received: by 2002:a05:6000:78d:b0:386:31a9:31ea with SMTP id ffacd0b85a97d-38a221faa71mr4052627f8f.33.1734705957980;
        Fri, 20 Dec 2024 06:45:57 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm4227874f8f.44.2024.12.20.06.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:45:57 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 20 Dec 2024 14:45:45 +0000
Subject: [PATCH v3 2/4] arm64: dts: exynos: gs101: add AP to APM mailbox
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-gs101-acpm-dt-v3-2-642d64daa5d1@linaro.org>
References: <20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org>
In-Reply-To: <20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734705955; l=1282;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ksJ+kZjL8uLlN+FZ+pHkeFoebJsDUcUmZPaIlmDO4Og=;
 b=x0Ev+HpwVYqbwB+I6AVvSeZI9hA8fjFh/u8hIaK1sJWwZeeE1MvacpEYn9gzDmAWTMUsWEdNZ
 ecBCUxDslrZAhS1a9R+KuoBbFFAZG+4joMBRs9YtU8+yeFqxZube1LL
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_064559_304815_FB1FA2DB 
X-CRM114-Status: GOOD (  10.87  )
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

GS101 has 14 mailbox controllers. Add the AP to APM mailbox node.

Mailbox controllers have a shared register that can be used for passing
the mailbox messages. The AP to APM mailbox controller is used just as a
doorbell mechanism. It raises interrupt to the firmware after the mailbox
message has been written to SRAM where the TX/RX rings are defined.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 1441e9a252c2..6947dd081a0e 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1445,6 +1445,15 @@ wakeup-interrupt-controller {
 			};
 		};
 
+		ap2apm_mailbox: mailbox@17610000 {
+			compatible = "google,gs101-mbox";
+			reg = <0x17610000 0x1000>;
+			clocks = <&cmu_apm CLK_GOUT_APM_MAILBOX_APM_AP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <0>;
+		};
+
 		pinctrl_gsactrl: pinctrl@17940000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x17940000 0x00001000>;

-- 
2.47.1.613.gc27f4b7a9f-goog


