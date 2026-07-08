Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011A3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 15:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aX3VKusEpXR9oPYMG8wA1f/3Abd5fn9FdmFI4yazez0=; b=tYRCaxGUM88Qt/kytKVEaG7edT
	s0K5DdjUsocZp8AeQDXWKhlgwqr8dO4JeLXV+ImsWkTelSopWSg+gy05hLOvvI1nBVwHGvaAEh8sN
	nAne9u+ssyVksViKkDPb/dubDsWkgfEdXKDxuV5WiH6Lxt2CMmoghJ0HxwAG3mTcV5XgvwPzjtzPf
	lBLJIxzvRAN8Wv8Q6pCmwJACg5fCGaYLKKxrwHI2KcatUrRGrzvGKlHMi8MgdlL5ggeYQgqXifl9A
	8CSmUlNrlDjOvydh++MFCAaZ7GMqZVGqHDlm8OuWfuc9jVqx05pCN4bbWKF83EZTgJDIhHaUhlHle
	An32GKFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUM6-0000000HUpy-0khZ;
	Wed, 08 Jul 2026 15:38:34 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUM3-0000000HUot-3tK4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 15:38:33 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4798bea72f9so604981f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 08:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1783525110; x=1784129910; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aX3VKusEpXR9oPYMG8wA1f/3Abd5fn9FdmFI4yazez0=;
        b=Cz8vreGmsW/o7mN0lz6U7CZ6gJymFzfXPsIpP650/4FKiXX7zFMUV/SoH2RydSLH4g
         EkUuS3SDL5eVk/k7SQ2MmCg+hmWXNuPaM48uycGKanAxyntKU3ibTypQ6/FvYH3ue5vL
         sfBMtUVwbSPox4BaZ93RswyVC8iR1zvsi6z3BZNBtgOAoOWyBvnP5IZoj7mb08ZDyJ4I
         YfhvgxizQ5qowWjGRMNbOCZrgncBZK+LxN/SkPbmt+xvsNhUcyD4IseYklIOIaQvOYk0
         Bs1F4mPjR/kCwSlhngJtwdZdZFtec9UHcrbsOr/hdXlhXNAYM8CSDniCk9suQqRi66Uz
         yRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525110; x=1784129910;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aX3VKusEpXR9oPYMG8wA1f/3Abd5fn9FdmFI4yazez0=;
        b=Wigx02jij/dngkScXJG2DFFMgPUIGpiE7DDsvVvkmAUg9YSzD5EZBMm057II0c58EB
         ilJmhn9DI5qeSJ1EoPKxBrkSfoyaw23Z9G8w+v2axsIEAtRWmoSZOx4LyrI370Xf8dia
         NdOvBTO8Jqn3u/gMR/pFwmtYkI8lzIihofSn4cg38AAC7HtNXEOrDX5Tj/oSeToiDnGs
         hsgqixIoNphI855hHBMw6x67jOr2vOiyoWtezN57as7PNPA32PbhP5umnyVN052tdqcV
         0n7wW0HK07BRJY23S3JcgGcLk4LceuQct1D4khWN22JiRaKeaei20trcW+J/ZbVhnzDR
         TI3g==
X-Forwarded-Encrypted: i=1; AHgh+Rq0l+MycvKw9DyUZHJb/hJ7o5XMKlrd1/OKIODxCjlSFATZicZqqzgkwE/TMo5/nEAcbl1KySdH+khCeXlPhF8O@lists.infradead.org
X-Gm-Message-State: AOJu0YxBVyfaZidyM/K4PiAuy980JDMm5T0uSS69u4LVsxgftlzhAsvO
	qZaHk+mRONPN/UpovOYzrsVdHRv+yFqXcaoMdxeqmdHyoel+HLgJJ6ATlidWRET0iDo=
X-Gm-Gg: AfdE7clUVtVOLtPHLskZBaKoPKh64/TgZ8+J/tS9Sf3Pg2N/SphrupnQ1XfSBojO9NL
	JzgO3CqCNVWnoUmb369kesS+FvkxcpLV99CYX1PuK39aYYtIkQO+gOZfWv1h8xkjKmhdUXw2Mrw
	eZTUiLQCSv8hGoBRzc8qwUyFmcZkHqOa3bWkIgxKifSJdIPoEQUDKIZibSJQxMzA6lM672AIlue
	qpU3jCnDIeFlqoyZGoaAnEarLPWVvsTRycqK37t7F9hzKQiYxGogzffM9MQd8Cyg9Qo0Wh8Iw2l
	sii/dehJlOwv6cC5GksD1qMLSWzSlNd2PhHHAVuxjxvhjNI+W5GEnfCusZMdzb81DKXC8mofUsZ
	aFGuBsBAv2jgTCZgIwVIbA1Ai7ubf4EJQJIpKLca8cGWXBEAbhUDnpK0PCRxthpEKFsITCZQMhF
	FBlg85w0DB1ZKtwYo4dq0uRfVksIx1WakPMZeK+DHMJH3auFvfYaKa6Xzh70lusdORxOfCMaeru
	lE2Yu8RDYsG6A3+u6DyBkcw/RiXA5Og01jjKx8=
X-Received: by 2002:a05:6000:25c8:b0:474:9dd3:981 with SMTP id ffacd0b85a97d-47df07314bbmr3555871f8f.26.1783525110073;
        Wed, 08 Jul 2026 08:38:30 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm44254136f8f.15.2026.07.08.08.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:38:29 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v4 1/7] dt-bindings: serial: 8250: aspeed: add compatible string for ast2600
Date: Wed,  8 Jul 2026 15:35:53 +0000
Message-ID: <cbe59dfba231dcd55fa86233dc076b017d67463a.1783524645.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_083831_986008_B27AE5E8 
X-CRM114-Status: GOOD (  11.57  )
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

The ast2600 was using the ast2500 vuart compatible string.
Make it possible to have ast2600-specific properties.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 .../devicetree/bindings/serial/8250.yaml      | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index bb7b9c87a807..8f22121381fc 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -23,7 +23,10 @@ allOf:
     then:
       properties:
         compatible:
-          const: aspeed,ast2500-vuart
+          contains:
+            enum:
+              - aspeed,ast2500-vuart
+              - aspeed,ast2600-vuart
   - if:
       properties:
         compatible:
@@ -106,6 +109,9 @@ properties:
       - const: ns16850
       - const: aspeed,ast2400-vuart
       - const: aspeed,ast2500-vuart
+      - items:
+          - const: aspeed,ast2600-vuart
+          - const: aspeed,ast2500-vuart
       - const: intel,xscale-uart
       - const: mrvl,pxa-uart
       - const: nuvoton,wpcm450-uart
@@ -287,17 +293,19 @@ properties:
   aspeed,sirq-polarity-sense:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: |
-      Phandle to aspeed,ast2500-scu compatible syscon alongside register
-      offset and bit number to identify how the SIRQ polarity should be
-      configured. One possible data source is the LPC/eSPI mode bit. Only
-      applicable to aspeed,ast2500-vuart.
+      Phandle to aspeed,ast2500-scu or aspeed,ast2600-scu compatible syscon
+      alongside register offset and bit number to identify how the SIRQ
+      polarity should be configured. One possible data source is the LPC/eSPI
+      mode bit. Only applicable to aspeed,ast2500-vuart and
+      aspeed,ast2600-vuart.
     deprecated: true
 
   aspeed,lpc-io-reg:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     maxItems: 1
     description: |
-      The VUART LPC address.  Only applicable to aspeed,ast2500-vuart.
+      The VUART LPC address. Only applicable to aspeed,ast2500-vuart and
+      aspeed,ast2600-vuart.
 
   aspeed,lpc-interrupts:
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -305,8 +313,8 @@ properties:
     maxItems: 2
     description: |
       A 2-cell property describing the VUART SIRQ number and SIRQ
-      polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH).  Only
-      applicable to aspeed,ast2500-vuart.
+      polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH). Only
+      applicable to aspeed,ast2500-vuart and aspeed,ast2600-vuart.
 
 required:
   - reg
-- 
2.54.0


