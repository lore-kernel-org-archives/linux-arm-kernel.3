Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A857F513F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 02:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=; b=JalUpWvtfAHkCvNHaBxke4voK5
	nYCCVaHzDr+k1fWBED7TJ4oHf+n3lmrU/uCZmUC/xUxtSvOytT3M5CnWPU0uz9qm4BL273OBR67uX
	4M1WqxKUl51pYPSpqv+4Fy8hdlFDMQLm9Ot4KwdG0weOt+v0Ucw1XXwf04d5Wm8lpJSGXeaaBPuji
	eDrMKw64Wu7MK8Sorij7I0MpVNl12xDccBn2Ee8NPUxqoZ8Q6es7HXzVEmE+09npILpRcHCxlPiHU
	ev++437YZX40VP7roj2MtrBTWe5bpS+ZKLJ7hkBiKYWBNvECConaOANOaEGLmXc+VTyVBExQMY0ez
	0q8+j+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLDM-00000002twr-3EIE;
	Fri, 06 Mar 2026 02:46:56 +0000
Received: from mail-qv1-xf63.google.com ([2607:f8b0:4864:20::f63])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLD8-00000002trM-29b4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 02:46:47 +0000
Received: by mail-qv1-xf63.google.com with SMTP id 6a1803df08f44-899ed41208fso103313096d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 18:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1772765201; x=1773370001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=;
        b=WTIQODUpmgOte/lnFGktE+FW7IkW/E4TyW6950AeQ5W0UD1lxOyDc+NsSpyHZ1vWge
         SJTYUNqw36Fsvqs+7WkSFrm/2hyIBQK2TSVKPXr43zPRBHFV1WpAGSLcz3jo+yNYqj66
         ulGGrtmRtTdHWixyifSro5JqlZf9hBRjoxN/HBpvVlZHvNd3KKxR1r/kJgXAWLra1Vt1
         Jyvd/aTWbbDrifHTFMEY4kPatrCjGqviq1IjqApGes1jqstkUekdLaRN317lcwlSE5W+
         TsiZZolO4uAORjf/vUFIta7GQ0aPTbg+/sI4DdqqBYg/Oi/71EI8Hm80wxmlYIj7d+l1
         m1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772765201; x=1773370001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C8HDblj7fRKJtovg4Bo+ljGQF5b9QTgQki2w/2Xqdco=;
        b=xSaoummmyWb68SP/R8M+VeafHzEgoEGBP/ToS2YlmhoBfc4xZ5CautGANgQrZueNJw
         HJ3Iblw1vjRG771gCgC63gPBBLlK8ywUAH/ZWfA9y5Bl/rflvDZQXGNzZBNOPmQPgaTv
         hl7dJDSA/WbNgaqOLM5Fbgj7r0szBj1VYHn5Fu8ngrA3+LdeNU7sVO+KqyZghz3CCZw0
         N0a7/trORHqZlkCwDTVezNvzK48n8IWokrRpmtdfepjXAY18e3Mw0VN1oR9jDkgDiI/J
         rNlT9WR0iw7buFo7BO06A17QQ7reMIi47MRJi6UymkKv5wxrLqiPiFcSmzNrd+TBHDGD
         y7EA==
X-Forwarded-Encrypted: i=1; AJvYcCWjAtvqaS+pgwIY/83Whffayi8IcebdgEhIm+QNFiS+dbZO5jTkNu/EXpuj+H5w8qnjDcE5jtUX8MUgfY8cAKf6@lists.infradead.org
X-Gm-Message-State: AOJu0YzDFRLe4fh++kf4qO3T5rTuInxZNu4cs5qrgt4yx7dO3jTOpbQW
	PGO1NFtANOpTQ2BXB2fJc93R5mTiOF4JfRmuoYpovwKgsgyj5oj9FgkRBvg/ahtURju/WbEQvna
	07eGoozOXRXBIdSUd8shBy4lbLE+u+6rE/jxr
X-Gm-Gg: ATEYQzxcGLGaytlSx2Y5EieVut56tKYmwJ1Rcv/3lxaM+/vSTplefsMY9sSL+oYqCci
	pSjQyjN1I0p5PSr6aRzPDU33WQEXXGDjB7DOvgD3KT1B8BFGtV3ZVz62Sdlebt81SfOWEOx8BUc
	AsdiacgtVV6l9tMi82Ypyi+gHBTvzGjflV6+qWYbyWr+8IUkaYbJvZE71WQ0gLDH0pMBYGMeHK7
	KFoNtEOUvS4Gx5zcPMNNwx6EuuEnicp9TYIGn7/OPKDLrdjmUESD4oB6WwORbwX4aPQOT55ysE4
	7bk4YLcgNVKicZyOvgp9/e7FJubf34LZeNh0s9KL/dKvHke91hSc48MXRIkTpDrRWQgBm50rS1e
	KqGxVC+qMSOFDXwHi/g2/IhaqGkPexvE+BAOQTY65b90u
X-Received: by 2002:ad4:5d6c:0:b0:899:f725:419b with SMTP id 6a1803df08f44-89a30a7dba7mr6939816d6.27.1772765201104;
        Thu, 05 Mar 2026 18:46:41 -0800 (PST)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89a31412832sm168366d6.11.2026.03.05.18.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 18:46:41 -0800 (PST)
X-Relaying-Domain: ausil.us
From: dennis@ausil.us
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: FUKAUMI Naoki <naoki@radxa.com>,
	Hsun Lai <i@chainsx.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	John Clark <inindev@gmail.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Alexey Charkov <alchark@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
Date: Thu,  5 Mar 2026 20:46:32 -0600
Message-ID: <20260306024634.239614-2-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306024634.239614-1-dennis@ausil.us>
References: <20260306024634.239614-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_184642_559041_D7C7402B 
X-CRM114-Status: UNSURE (   8.84  )
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

From: Dennis Gilmore <dennis@ausil.us>

Add compatible string for the Orange Pi 5 Pro.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index ae77ded9fe47..3c6b83a84463 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1320,6 +1320,7 @@ properties:
         items:
           - enum:
               - xunlong,orangepi-5
+              - xunlong,orangepi-5-pro
               - xunlong,orangepi-5b
           - const: rockchip,rk3588s
 
-- 
2.53.0


