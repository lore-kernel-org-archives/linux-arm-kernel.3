Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F201FCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=puq/QVPjJHJaaP1wqvS4Jd4MbGPB7yk1PKVylU/wUU8=; b=VRdvwqFtr8n81R+GT7cbL0gcbq
	rGXhGAe52sOJ7vo5ph2oUm2FVmptOonjwE4Zj0j0lIBCLaj9gc8+gNLVoAeShwYUerjuq3YIrQguN
	1cQMkzXmhI1hF0A85EzQpGWk656T+PBW1g47dy+QYnIpLRyX82XJa3JL6lEmTHOrt6FmigbEsVkwj
	ufpHKWFHqYvss/AbgrUYrXb2Uvg2sD3oUtlE4vFSElZcOjZmIAt0thnUtuZLUgO6iVwcL8go7s5CF
	cSSZ6vqFzhwrTR7B/Zfjd8s64nqzRYQr9VUjO2zx7lAKvTAIc/N622tYJwMqGnEVHht4UwPseqJLV
	yjEkWAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5oE-00000003WOc-44bX;
	Mon, 15 Sep 2025 09:47:42 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5oC-00000003WOF-2DPg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:47:41 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7726c7ff7e5so3155949b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 02:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757929659; x=1758534459; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=puq/QVPjJHJaaP1wqvS4Jd4MbGPB7yk1PKVylU/wUU8=;
        b=UAZlhVR1FXdJPZsGOhejHU8Nqg4n7VVXoZBQcNQIdEvDGpCHuFa0bmEO8QDom3eNZT
         P6qqTlPVPH8X9QqRD8XpFS3YUFs+Qs4xKfm0Gx9kMAY5zGoqbD1F6ecqVDC2+xTWQ2Lz
         5SMSeqnhDyYAkWcaJVTlKVdkJ+8bH5SOggnQRki+krysuOy1esPpT93gKoIIBBXtj+Y7
         l/lyasmfaZEY5eCGrVguM1AmV67lpKcrhc4YOgfsXJwM2M7E1IZcWbzbksd8b6YoAPvw
         ChFUFpDlcOW9BEiq3K0HTV9F/denNxDDih2O/xw1FWp9aqXtcVjYzBRbJ2cQKj+YUv6A
         Cang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757929659; x=1758534459;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puq/QVPjJHJaaP1wqvS4Jd4MbGPB7yk1PKVylU/wUU8=;
        b=OkhBXz6WcLSY7oEMjOtgSkuPfzI+KJIRWThqmdAuBCqiRsZD/o4msCWmS82oUj3T7t
         sqBiwdZmtPhQ1+W7W27TvLc2VG1KZzgIJmNAQSl4J1dyzg68sa6OrKi5Gy3LYzIhf+Jc
         n2qMPL6EVUJqDUX8ueFU3+d1/OCySPmxllc1Qv/BqPrfU3PIonhGM7D0nRIL76pglNPi
         ptyjP2wiy72amF5PTVuAAxBxjG2xU8nnlSqVxGF8QF/7zbbUkKHM8MLdQI54YKyLMrT0
         nMfbQvIfefyhmzNTGUYOBGm33w/oRwimoCs/fpf8feDAR3XRyQz1LPoBg1t0H0znE2/3
         ty1A==
X-Forwarded-Encrypted: i=1; AJvYcCVX7e2MsXSih0lqP/QnDYKehviIXNETDLwLJqzIEMv8fq5rw0OoM4Sgl4Rx70b9vhaXBNStgDyft9XUaVGrQv4E@lists.infradead.org
X-Gm-Message-State: AOJu0YxhN1YehaLG9CGYYsDTqUvfd8P5slYGk8Rb1DGaG8U8/aX3tDsw
	VtoMBTmmFEGYx6/NCEvADuKOaJ1+NC/4HlJH0orxi0X6cM/1RJQZz+bp
X-Gm-Gg: ASbGncudyQjv+4oSICzAogmO3setXdeUx6vDKHVCFHeatoNmSUKNa2E8WOBui4ZHeZV
	GidE8KYcmeXN8e+CN5BOlLLQwB5KNZFQGKD7uvGdWRwHnlYqCxdF7sCdmCAhKpGgLroMUf7dn5D
	QMmxHWB1SomEIOhJwZIxukniSrJRS31MTXx/DX/ZH2NrvvUWsBw8xCwf4Hac02JQZQ3UuODhrwn
	OHZrqOcAz5KGRa+t5zwZD071hC3dlvYbOGIO1B57ibLFNYVc5i2Qm9Upf/1Qjh6uqlIzalw2KKv
	5YxaCNPmFDYTldhYE865m4CB2wl9dJm/zl7Jlfg7MEBOQ0jd+CtqrMraOwo+6N+bQf3pubQO4Vf
	Qg7pLI5xOR6A6rgAPAIKYPW6bufuAlUipmaTg97cNM8EfUUU3reixcW5sdDQ=
X-Google-Smtp-Source: AGHT+IGkXts2jRdzrIsnTzuf0gryCyKv7pwYxHT8stwUeB3vyz3wWYX7tzBsHMaYizcHXmUk5+6mwA==
X-Received: by 2002:a05:6a20:432b:b0:245:fb85:ef58 with SMTP id adf61e73a8af0-2602c90cbe2mr16311805637.40.1757929659394;
        Mon, 15 Sep 2025 02:47:39 -0700 (PDT)
Received: from [172.17.0.3] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b184f4sm12997210b3a.62.2025.09.15.02.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 02:47:38 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
Date: Mon, 15 Sep 2025 17:47:23 +0800
Subject: [PATCH] ARM: dts: aspeed: clemente: add shunt-resistor-micro-ohms
 for LM5066i
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-leo-dts-add-shunt-resistor-v1-1-d65389148a3d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKrgx2gC/x3MwQrDIAwA0F8pOTfQylpmf2X0IBprYGhJXBlI/
 32y47u8BkrCpLANDYQuVi65Yx4H8Mnlg5BDN5jJLJOdF3xTwVAVXQio6ZMrCilrLYLPaFdvHz4
 aZ6EHp1Dk7z9/7ff9A4VGMn5sAAAA
X-Change-ID: 20250915-leo-dts-add-shunt-resistor-8f96c94cf2a9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 george.kw.lee@fii-foxconn.com, bruce.jy.hung@fii-foxconn.com, 
 leo.jt.wang@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757929656; l=1194;
 i=leo.jt.wang@gmail.com; s=20250618; h=from:subject:message-id;
 bh=cxAqupFOX5uFq92Avu8qu3m3xhpolK/5U494g4n1Fko=;
 b=GRx+rMoPC+Ks8u7cyFLnZgiZtR2njjInKSWufNm641lfB01ZSutgDpAepPQNVYxa1v3HucGVm
 CXu/0vJgogXDF0XZGPSB2GXDvlJT6dGy7IwENtdjSa5g1twGsK3oMQP
X-Developer-Key: i=leo.jt.wang@gmail.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_024740_574605_63B01C3E 
X-CRM114-Status: GOOD (  10.41  )
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

Add the 'shunt-resistor-micro-ohms' property to the LM5066i power
monitors on I2C1 for the Meta Clemente BMC board. This accurately
describes the hardware and is required for proper power monitoring.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index ecef44d8997775b26cac10353b42b03dc644f033..a614f947dafc9a6628c3f3d45b62ff3ca9d2b618 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -642,12 +642,14 @@ &i2c1 {
 	power-monitor@12 {
 		compatible = "ti,lm5066i";
 		reg = <0x12>;
+		shunt-resistor-micro-ohms = <183>;
 	};
 
 	// PDB
 	power-monitor@14 {
 		compatible = "ti,lm5066i";
 		reg = <0x14>;
+		shunt-resistor-micro-ohms = <183>;
 	};
 
 	// Module 0

---
base-commit: 3708a165a98c23cc83216deda88bc7d64ba85527
change-id: 20250915-leo-dts-add-shunt-resistor-8f96c94cf2a9

Best regards,
-- 
Leo Wang <leo.jt.wang@gmail.com>


