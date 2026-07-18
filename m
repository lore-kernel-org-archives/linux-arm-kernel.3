Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B10C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 08:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HzdZoi0bv+xxuKeJljmyb5SqIlDMVTBvbaIEvE8LEk=; b=2hOE65fZqrqOkNhR/sR+2DbstE
	gafA7QcuwxhQzNJofPoo9zDGK0wzurZxjAaBKAqw0GCgpF8PL6mmzy+cccFqGzeibuADzeLPbHwjk
	e3GwsKDuLZEvAkew2HBcfleQReEfIhcLn0lLGJ4cVEkRnzdvKwB/2CDtPaEW9ZapvnIEyP/+u7Zhu
	zBbfnj7QEEr5jRuIXBn3UJ73Z9cnJPrHq4/ml+YID7iYKtlaYJSa5HyB8E1RpeKoelNXpBAs7Ke6m
	RuSoZWzE5cr1NFy0I+RvZWUzd+SQVNru430Ff1qP01Jt/sycYDP4HQDSV7wRnFJxjellM0EsKLY+F
	VMIQ+21g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl0rp-00000003uyH-1z26;
	Sat, 18 Jul 2026 08:57:53 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl0ri-00000003uv0-34EB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 08:57:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4925a778491so3498495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 01:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784365065; x=1784969865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HzdZoi0bv+xxuKeJljmyb5SqIlDMVTBvbaIEvE8LEk=;
        b=IcVJJoDqXXbusynADc38yG/aZEbqgW6gc59r08o/sURWokZIGtVsvR0Uj6ADi9Dx3S
         TbD/ClQjVmCBBRbn3kj6jGRUeBgji1yi/SXedY6qZg8HzdTEYWKTS8Zoppo2jT1Zrgf/
         wXiM0XqXFA6RTEIMU5fpGLbrObAP/ziZ+ozUiGqRmSYmF1RPl80qVEm73jxwzPecFJGZ
         4SFjoRaVqw1bxfD67SqGHln0MKFvM6yEYSROpemd+k7KmMZMFeHQW3revmRcJ+TOED73
         w5dRwqlntdqSufNZzl77c7DenyJdYb+E90IRBavhCxddcleuTewoqlLWBLfv9zhVr0R0
         5mXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784365065; x=1784969865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1HzdZoi0bv+xxuKeJljmyb5SqIlDMVTBvbaIEvE8LEk=;
        b=PtOqgX21aeqFaCxtPjwOKodtcDKmR4eQM0Ab7zXGhhMhXjEUZlcLXxYEDkTU6zhoR/
         Mmr0+Fi2of9EALjay+nhnTolTtj6FsKE98b2PdOV2NRAx/E6KlyRnG3M3P5PpVc4uQZn
         vcFc3PZnJ+yswI8nGDSiierMxAAGdgUb78Zhtn82/7TGZcIvceIrKFjCYTIF1MKWnyn4
         MNuodnOGFlo17D1Cz4ITmjr3D9S272FVHmVekvVQ/Bo0Wy7v5/wmMsTkAr3xiUu+z/b1
         YV9Az0FU+bjO9itr6NEssjNecdAwu0PqVdZPluMytCUaA61ql0ivXJknqhyWcHu83sVW
         WYAA==
X-Forwarded-Encrypted: i=1; AHgh+RoV9/JyqoFwEpUdCJuQoTgHY2aqcm0Ai/ikw2vO3R88bf7PGZAMOi5WWFPw0uk/6Ni1visZaK0EckFb0jn8mpla@lists.infradead.org
X-Gm-Message-State: AOJu0YwfbpuRH11lDl3EV136mDXKChtBG0+sb03NkP//vnN8ZpDarzDm
	eoiVhu64o6YApOLCa3eZHwOXzDuiTr3aqpIFXpe2FIBNF+xBQ0ZW2kYz
X-Gm-Gg: AfdE7cm6Tr6TUUADjADU1w7WAAsXIVw3/UnOuTVEGn5Auu6N45PBkqEWgNqhvJ36GFJ
	wTLBlBRhEwFL2ldNp9iPnlK2MbDbnneQLcx43aBbe9/7i7h/5/PJVb4kP1MZRhGmyf7itZUMzv1
	2VKZsRmIU3gQHM5kbXKLi/DO08RQF2PE8t+CEXJT284oEEfbPQoLa9njoQyfgbiMIdzPgSHUB5O
	6y+zWRdIgi14C8SbNCBSiOCBXA1S6NAuhLKliESk4jPSPqo47+0QIKn+aXO+ko4f5zsmMKq9skf
	FxRuHzCWvTAFXvh2vErVP9SF0ARj2yQBzBS/e//o16NtJls5IzaV4FVHqgPzk1kT16vFCk3gXqu
	PIH13cMGjv0oWT7suGpLht9LXFlMZd+hWsrxii0QgVrjR2siOQeVJsxH8blkCeiLMnhQFqCvjxD
	sbdUMedtrpFIRtmUGdrmw8sqs1uLnHk6CBzdEv52+iZiLBC9HILhrT3tQAJtWXnEn/P5U/bTuz7
	66CELvpEQ==
X-Received: by 2002:a05:600c:35c8:b0:495:4505:dad0 with SMTP id 5b1f17b1804b1-4954a3eb076mr54474895e9.2.1784365064613;
        Sat, 18 Jul 2026 01:57:44 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8D1600206D23E70680CBAA.dsl.pool.telekom.hu. [2001:4c4e:1b8d:1600:206d:23e7:680:cbaa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954834edc3sm91477455e9.0.2026.07.18.01.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:57:44 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v3 1/4] dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
Date: Sat, 18 Jul 2026 10:57:25 +0200
Message-ID: <20260718085728.6797-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260718085728.6797-1-royalnet026@gmail.com>
References: <20260718085728.6797-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_015747_453332_96DF6555 
X-CRM114-Status: GOOD (  13.68  )
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

The HDMI RX controller can expose the audio embedded in the incoming
HDMI stream as an ALSA capture device. Document the #sound-dai-cells
property so that a sound card can reference the HDMI RX audio DAI.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Changes in v3:
- no changes

Changes in v2 (all suggested by Sebastian Reichel):
- reworded the commit message to describe the hardware
- property description now documents the DAI indexes (0 = I2S,
  1 = S/PDIF)
- moved the consumer reference into the binding example

 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml       | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
index b7f6c87..fa6cd0d 100644
--- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
+++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
@@ -78,6 +78,13 @@ properties:
       The phandle of the syscon node for the Video Output GRF register
       to enable EDID transfer through SDAIN and SCLIN.
 
+  "#sound-dai-cells":
+    const: 1
+    description:
+      The HDMI RX controller has two digital audio interfaces, one for
+      I2S and one for S/PDIF. The DAI cell selects the interface, 0 for
+      I2S and 1 for S/PDIF.
+
 required:
   - compatible
   - reg
@@ -129,4 +136,6 @@ examples:
       pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_5v_detection>;
       pinctrl-names = "default";
       hpd-gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
+      /* referenced by a sound card as <&hdmi_receiver 0> (0: I2S, 1: S/PDIF) */
+      #sound-dai-cells = <1>;
     };
-- 
2.53.0


