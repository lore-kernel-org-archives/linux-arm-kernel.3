Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA802C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DM/W5OiE7zuL0Fj+5+8EggB4ExQGwHREFTFpjNObiQ8=; b=2gkyzMEwVlwaWduI2GrbHVmzLO
	NKkIcTQjnekFcygmwPb4lPdgk1o4OOGSggjNWl8K2XlDK/cUl3ZZFN10SxZLTeUzjyQHFb5nNwGeh
	URMLhUzhGyx3ZMc7VLeOvTKvkw7KIPTXp6E78DYysKTBmbWv6rptEWoOUm+LZ8b9muLK2XNmSbZ4l
	si5VkPKyQbRqPW11+IkK5BsTo7S/ymVQc7WxHiarFAC8kp496CKiDEu5qX/H5kUC4VGfBFe52V33d
	btYmWQxKZFpg4vGl1P/BT/2+i36qiwBVBJJo4RX7032d6FmIye5FQLthA8bNVYxbVGE9Ah3K1qYkQ
	jSZI9L3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CdX-0000000BTjh-17a2;
	Thu, 17 Sep 2026 13:58:51 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CdU-0000000BThV-1zhm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 13:58:50 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6356f6bso738601f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 06:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789653527; x=1790258327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DM/W5OiE7zuL0Fj+5+8EggB4ExQGwHREFTFpjNObiQ8=;
        b=i+JB3NWm4IX/tgqcFeXelf/CXkwM2K2DySs+DVv/XKyHTz9emTozzjwTuiwik9C+gv
         9B2Id5ck1jkQFMCt+DxZO/C3GGRPS0u07DO41Yh7jumEbguae1F20oOMLhpfNx2815Hy
         nYyD1WbRb/gu75E5WGZpWto+8/3FAjCMuiAxn5lVFoux+40Y+XozbK2qKUyvgWBwBOHx
         MYLndEDbniLOvVsu1pyRPx/EHxyY7gTMQ+17wwHJQTEeUCwTwUEdgPEVPK5D5a3XAXxc
         5Q7CqApOBY1WfR5ZsF+NzLk3YnBBXbVDq96c+KfzSo1mxjK23j4gDTN64vXoZQPDMJna
         mYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789653527; x=1790258327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DM/W5OiE7zuL0Fj+5+8EggB4ExQGwHREFTFpjNObiQ8=;
        b=S84pb5HmvunNXgI/XNG7lJ3b6ck3+sszm2IsHVUjOgZHzBbwFiYEsk/mdusLpNOedQ
         9XoEn/9Ddh7fDJ8QJslHxSRjAV0EXYJicGwLTGpQ2N1HMJ7qoxbLTld9h6gcoC+J+wgX
         VUckSN9iBrI8V+h6qFk0Uh+R6ngwDjqu+TQVdJ2JgEYxG6B3wSfypeyJ+tuBrZKuF70c
         SwPXtvov949rfu8ZFMqUc/Z5PMvtFU9y1T8xPM9MvrTY5SkZk4lLCI6TODUq+4EVo8BB
         BjrmlwztQju24BDraOwERt4UXQkwQ57386rzTPZaRiWdTnZJCHr38WExY9+7Hc5RfxNg
         pt+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwgfEW7e8ybh1oBO53ajCPEGvmktwFktP9MjVMhqFCrnPDWn62/RzSEzfVoeA9s0QrG7zyPUxUlng8eoqdthBxW@lists.infradead.org
X-Gm-Message-State: AFuF++mV5NY+r/Zp070NagDk9rA5hBCONiiDWauDB65pD6xMEa5suUwc
	pH3Ro1+7DfT9qwzirjFerBM0bgsQOZyMKCUvL5p/1TFegD1biRedN2HN
X-Gm-Gg: AYBFou3o7dWo1s5w0DOMjekuHhgmtPwkWVqa4p3HM+dr4I30fGbdqpKMdbNBnwnwHw7
	tXHc3M3/IC6g4vNSqmpuW71YOr2PBVjAiaOjLNK4HfffaZAm23bqQqFrkl5skMVuImCZBSNvSE4
	uSI+lblTsL7VvZbDlC81u3ledYkiy2e0yNS9VVclfisaa2ALNhFfztq7M5K0UMPO6Y6X552zJQM
	NcA+8PDIodOvs+dQWsA/UoxhuuM8CApJNRE+XJv8QK5NZi7G4u7ndpM3pkGcNi+wUwb0b3sqn/J
	DlD09I5qNkTys+Fc27GGnnT0fy/7ZsH97a7m+N2qdmKhEyiegk/NGJadWDD0EpQcbeh6Qvr9CnI
	WjB7HkbmzkKI6z+rcOG1EwUBfDpsTVeuy5MMKO7InTErN/UPwjqnb+bnPzZo1KI29eDL/OGL2bu
	RxNZodcBZTFa6jWAMNPohKFNNx+7MGc5yTikisTk3y3LEeaBg3BfiFFoFhGdvj+W5hrfM/9bTVe
	4NwsyceVQeVrJjoh4o8DboccKBQuRbYrOjr14u1vqsvejyFdcA0vg2NSg==
X-Received: by 2002:a05:6000:4543:b0:487:62d:37d6 with SMTP id ffacd0b85a97d-4870d062278mr12784911f8f.23.1789653526791;
        Thu, 17 Sep 2026 06:58:46 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf414c3sm12851706f8f.30.2026.09.17.06.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:58:46 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com
Subject: [PATCH v3 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Thu, 17 Sep 2026 15:58:40 +0200
Message-ID: <20260917135841.841680-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917135841.841680-1-sander.speetjens@gmail.com>
References: <20260917135841.841680-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_065848_528233_80738EA6 
X-CRM114-Status: GOOD (  10.06  )
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

Add trickle-voltage-millivolt property for the Raspberry Pi 5 RTC.

V2 -> V3: Fixed the firmware property naming

V1 -> V2: As discussed with Krzysztof Kozlowski, this property is folded into
the existing raspberrypi,bcm2835-firmware properties.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec9..dc71fd57834e 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -133,6 +133,11 @@ properties:
     required:
       - compatible
 
+  trickle-voltage-millivolt:
+    $ref: /schemas/rtc/rtc.yaml#/properties/trickle-voltage-millivolt
+    minimum: 1300
+    maximum: 5000
+
 required:
   - compatible
   - mboxes
@@ -144,6 +149,7 @@ examples:
     firmware {
         compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
         mboxes = <&mailbox>;
+        trickle-voltage-millivolt = <3300>;
 
         firmware_clocks: clocks {
             compatible = "raspberrypi,firmware-clocks";
-- 
2.55.0


