Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773A1C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/poVjj7DauL+sp/Q/JZ34E4HGVAnOwuNgsFBTn2UtM=; b=lVnev4ktHATShUPOeBc6KrWJPw
	tavjgQ6SojXy1qpHBzFPoSKf0mrfmiddywc6dNH4PmuHqbr+n0fB9KHCco/ebkMOOQhmNk5NC8nHV
	CIF6cs/4DKmEZ6iAGncb3asSCt+QDLt1Ih57hfhQuFwj3m5DrwVnizYZEIVLsnY0ccZMGuZmkoAWM
	2giL3/ccC/1T0kk8LnVznD40x6N6MGlNFlnYWuLrPMxAzUrbpdwERQJbUsyAUsyJ/us/Ti+Z1kt0I
	E/0ePtON8OQmXk0RMQRzMiMXZ3mb536OHXP4xaRWcG1NWYpFqloaR++xzW+hlU15YZoG7Fo3jTw7y
	fodEzAcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4Sm-000000087zy-3nEQ;
	Wed, 29 Jul 2026 13:36:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4SY-000000087oA-3WFj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Jul 2026 13:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=q/poVjj7DauL+sp/Q/JZ34E4HGVAnOwuNgsFBTn2UtM=; b=eQJdU/A3tFAXsp8H/AN+HLmsaK
	VPmKJK3PCLhm1Qo1R8qV/emaZ+v5BUitT7hyW6gcJ2yptsL8Vi5Sz8m9C3IsruCwNRcKc0r4OnZ2s
	5wFsn2xi1V6AEscTojlgz84Oohrk3oBxCM+VvwipBjyUmWZjqzoHgwF92C0OjItNbxwa7fVFFiZCN
	R+V6mXXykw5PNHY6Xr6Y9XgDPtNMKvKTkz7RhYBq2bC78m1pXbDOEd9q7iZq/7om7M5iesX5v1wTo
	e/+zFbGzadUepgrCZmnBKTTet6cRMz9AG87eoCN4S/Fgz2JWP9M1W3WL4PJOkZf1/4kNYP5DCMJfc
	eJYwgH/g==;
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wp4SV-00000005r7V-3gq5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:36:33 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6aae367af50so359620eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 06:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785332189; x=1785936989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/poVjj7DauL+sp/Q/JZ34E4HGVAnOwuNgsFBTn2UtM=;
        b=WmX7NNBmAvNXfdXg+rJcwm1eVNXgy0A0MNzrY4aU0v4+rFAGBXdE4/eQ4AVmwg+ukU
         CmHqi/ZYu7ru6Hg8/iOFSrXQ9lkcNdxEAMsM+fU74iZFrqrrqNlEpN0OfwoXAISDI5zB
         CxTFsgARBoJ3QAqFBj7X+aEUlwGFOoYTrWkV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332189; x=1785936989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/poVjj7DauL+sp/Q/JZ34E4HGVAnOwuNgsFBTn2UtM=;
        b=Ohx3DYh/Z4a3cWA0UJUJ3oYVmYr5NguvlqfqEo3U3HH0GEkzcIMr+4eTUGmFWa0X8C
         WyqBX297UGkeDxW5xMaAmMUw/1FHSkpEBg9JyXzu2VL5Ey+rC+vgjXeynkumfUYpf0r9
         slqv1rgiHGWvEgD86ROMA7HB6k7CsJE/xy4+SwECddFsiX5ZjUbi2zSDWnXHem1h+Soh
         h7I6ZectraoYMTPl3p6Wej5NsrWFG+qP7r7JWMMk+4gUvvreSOpc5qnMQDcXoUNAPl3F
         U7jUdMcBRjonzqUadZWf8aitZlv8J3X+/TIy0yoFxoQq27ufrltIVIRTbCUpD020qqkO
         XQQw==
X-Forwarded-Encrypted: i=1; AHgh+RrQyNNvnXvNjd5lCH8qbJvaHSJsYlw1/zvY/DcdTJKT+22ZHPYoN7uX3idF5c8gcJT8/SD5USDkFtzi+te9gnoE@lists.infradead.org
X-Gm-Message-State: AOJu0Yymtzvh0eueSoUt0ud7TyS0CbkjW0USv+393OwXT8bYGTNgCbQi
	dHi9WPpM2eueN/iMdpHG/M5R2xCz1iWlJ07qbp+EX6C+WidVubJVIVXe6q++2SuuDQ==
X-Gm-Gg: AR+sD13OeQDinooY5xKotNBR1qqJ2+V/BuQd1KLQPKLlb1ZHcIWQT2tLzrkkpPAPPbk
	Ty2CFP4Su15eGlyOj3NR1c/B4Kfxq0JRFMWw0wECBQpQBXBYwdmqS50nlKVmQCnNogP2tgh6ADP
	hzNGEFFcw5EGqcs4m51p7c/wXyJUBhfvApRDCVqDE41XAlOS8PGQ/tgip5D1Ic47aW998ljhoGH
	Z0TK9J3dehzj4gKnR/+bY3CkGIEQXlLO2B8n/nHIuvTvUQBsq4NPlnO3sJ39rwWpwCIZNSDwOfV
	NfygXUZnE7Pb58dIZuzi8kU45d2bIheYk8cWGlnCCVun58obswUymxW2Iho0SizLmF6/XRewTHQ
	09Ng3TPlWBXZ6oBAw1Pje2wnQaFhnOlxzU9l95DzJK7kFe5GZFQo9kcwmTS6vyei+Epm4Jpu4Ce
	Bv3wR80wabci8jtpTOnybz9dEwP4NNilUGqJ7D4d+KR8kZgUbphQ5W68DhRLT5p8xs6g==
X-Received: by 2002:a05:6820:1a04:b0:6a1:857f:787b with SMTP id 006d021491bc7-6ac96d6ef03mr2710820eaf.55.1785332189205;
        Wed, 29 Jul 2026 06:36:29 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca527fe83sm1956196eaf.6.2026.07.29.06.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:36:28 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Fabio Estevam <festevam@nabladev.com>,
	linux-rockchip@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yao Zi <ziyao@disroot.org>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] dt-bindings: soc: rockchip: grf: Add RV1106 compatibles
Date: Wed, 29 Jul 2026 07:35:50 -0600
Message-ID: <20260729133609.3465563-4-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729133609.3465563-1-sjg@chromium.org>
References: <20260729133609.3465563-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_143632_042393_5ADDA89F 
X-CRM114-Status: GOOD (  11.22  )
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

Add the compatibles for the general register files of the Rockchip
RV1106: the main GRF, and the per-bank GPIO IOC blocks used by the pin
controller.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v3:
- Use a separate compatible for each GPIO IOC block, since their
  register layouts differ

Changes in v2:
- Drop the grf-cru clock-controller child and use the syscon-only
  group for the main GRF, since the CRU now provides the MMC phase
  clocks
- Use a single gpio-ioc compatible for the per-bank IOC blocks in
  place of the ioc and pmuioc regions

 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 2cc43742b8e3..ec122db3b8fd 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -64,6 +64,12 @@ properties:
               - rockchip,rk3588-vo1-grf
               - rockchip,rk3588-vop-grf
               - rockchip,rv1103b-ioc
+              - rockchip,rv1106-gpio0-ioc
+              - rockchip,rv1106-gpio1-ioc
+              - rockchip,rv1106-gpio2-ioc
+              - rockchip,rv1106-gpio3-ioc
+              - rockchip,rv1106-gpio4-ioc
+              - rockchip,rv1106-grf
               - rockchip,rv1108-usbgrf
           - const: syscon
       - items:
-- 
2.43.0


