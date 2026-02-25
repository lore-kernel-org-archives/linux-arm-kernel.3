Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702BDFD45FB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 23:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9tiRaqzs41Tp2aztKcPkArrBbXFpbWH4r/ca+c356Q=; b=pdB4/Ua52upxaNE3nNaXR3FYVD
	cMGzC9gD0JfZ2HBr4BGwcokM8arqiTmB3MbTm7mA4v9hdTYfbTSHdC8kadWfSEHZRBqTzD23kdv+w
	BeqBSpz9R/YglwwLqVp84W6xt+7/BSP5zdZDtuOT2bEwesmhZi2AZrbkbjL6AayI33h8QGjkRo3Uh
	Fko5hNyEYAFL5TEDGuWHXTP1POnGxKV91uH/jU9kYMFlnH52MPYmjuY3AY9Xinsl8XPcZdeTiDFNO
	EC2cfG2jEB9cJvsPgS73Schu602vLUJCmbUtlWlbVB7nXFrWY9MpCcuxZsOeh+nrG6fbk6kAqApsW
	VqIZDwVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNzy-000000052SK-322p;
	Wed, 25 Feb 2026 23:08:54 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNzu-000000052QM-0EIR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 23:08:51 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2adcede372cso687545ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 15:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772060929; x=1772665729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9tiRaqzs41Tp2aztKcPkArrBbXFpbWH4r/ca+c356Q=;
        b=AonRfHnrOZzTRaU5IilomkhHUt9ZSYYJCffj09HMz+h/4rzgKstanpvsrnqZOruuQ9
         5ZziTnTlIHZWL9XyjMpKAv5rtAGphceFyA/WH3R0RqyZnYWFLBvhYlO5RHlKgBLdeYrZ
         /o0TxjUZ4WcR7ur6X0CNCauJsH6U+L3YCI3JAHnW9basUd7zUAo7nooY4XJqUvC2Vyic
         7MK47aQbh+vQVwIWXlNijmjPabRsubGdGsJpBimFdf52WlFpVQsCpKnGifL/0aQalASu
         21jUa46WuYfgILPiS8h2Xgx/b/g/wi9JdAwSKGory0ZBqHwWx/kLCh2yyrvHWOKnN6ua
         txoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772060929; x=1772665729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z9tiRaqzs41Tp2aztKcPkArrBbXFpbWH4r/ca+c356Q=;
        b=Yz22XRIwtVmnw5Pr6nhx6qUyhLUFvBw6XAnVWgv4cC5jVOiEO+C7RQRVkfRnLbtH+X
         zzf3GZj5b3DrcKyMXuTeJlEkxzvKzRMZrJKE7UryoQsX1cY12E1HkNfcjEiqZBGGA/M3
         abLl5/e1Wu1p52oRUEZAS5Rq/nK/o9hRB5C+b3vi+nXVCoyMvc7NxviEiIbphXiVLXHI
         Yg/+FJSBPSPxWG+FGVc14RA6CyICRsFa6wC1EluoXa1LexSZmyMOmxD3nC3eoaqEzACh
         nHx/Y46mEvVJ+tlUWzq32aDiXCLggXRfj4svZpPe1KQOMbO3ReSl1FHz2FplUasN3llz
         lmbA==
X-Forwarded-Encrypted: i=1; AJvYcCV3Q/O64/0QzQCsJSYSLmW3eprH1J32DUw1BY4AD83bqvyr0fCSnbO4qLkCn6XOtmI/4FGbzq7j25pMET2WM8dH@lists.infradead.org
X-Gm-Message-State: AOJu0Yym0/45vQ+RoYYebCxE6sF1JMDXlIGi8W4kMyBbOvO4J76G7SCX
	OtLw56jpiXxcbrASr/lDRJ5u3aZTSPw/4NBp2fTgfDxlf9TK6b2UPnZG
X-Gm-Gg: ATEYQzwa6Gxh8JZkJHI3xQpH2lVOVTzkrVNulVLeqwRWRlnGd+LFSB2MsLhWSjg3adS
	MrHBNsqo6rTogz4bcjpAMnnPQzMBkFBit+8kpLbI9xP/dKhL/CuhbmpAkS9AGiP3TUNvlyjbSL9
	JgEdc8/Ov24sB/9RONd89jk4vWcVJbpfTu0n/aee0CRycnMEgb2JMIyoPu1084JS+mCzNmmLGR2
	4c3dbD9XJ8Cz0oX1APfPBOAnHSR2JFSJ9vUuNK0T01puUrMAH7Kb9+4jUneJxdcRz0mT8F1eqWu
	YmCu+YXxEUWx1wy3yNFdmRhiwpMsWtSjRpmU9rsH1clVTFTy60WV/wrA7zWtIuXRhp3ptsDZJbc
	DBWmdS0qKr+863FO9egTC2t8nT1RYSptfbimXzX7Qgnh3au/PlpMQ+OSP1dXB6J+bCl2U0+3JDA
	o9+n/bLo76sIRHGYztJdiGm4jYy5MWVEhcB5xeHBjUI4A09bGIc+mi/g==
X-Received: by 2002:a17:902:f608:b0:2ab:2633:d986 with SMTP id d9443c01a7336-2ae036ef4ddmr979255ad.49.1772060929153;
        Wed, 25 Feb 2026 15:08:49 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b2309sm3378285ad.19.2026.02.25.15.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 15:08:48 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 2/4] ARM: dts: BCM5301X: panamera: set WAN MAC from nvram
Date: Wed, 25 Feb 2026 15:08:25 -0800
Message-ID: <20260225230827.21715-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225230827.21715-1-rosenp@gmail.com>
References: <20260225230827.21715-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_150850_085596_94ED1A77 
X-CRM114-Status: UNSURE (   9.69  )
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

The MAC address from the stock firmare is offset by 1. Define it
properly to avoid having to override it in userspace.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
index 2b5c80d835e9..74161b76008a 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
@@ -25,6 +25,10 @@ memory@0 {
 	nvram@1c080000 {
 		compatible = "brcm,nvram";
 		reg = <0x1c080000 0x100000>;
+
+		et2macaddr: et2macaddr {
+			#nvmem-cell-cells = <1>;
+		};
 	};
 
 	gpio-keys {
@@ -230,6 +234,9 @@ port@3 {
 
 		port@4 {
 			label = "wan";
+
+			nvmem-cells = <&et2macaddr 1>;
+			nvmem-cell-names = "mac-address";
 		};
 
 		port@5 {
-- 
2.53.0


