Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A504CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 15:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IibueGhEEmNd2+d81oLiHRI9L7xBk11xjq6MNbG7ers=; b=kf8K7STvxQ+QmOFzoWrw+U+ZRK
	JOHGitSA/7yeQxc22S4LDWt7vnOic3ogoU6y8lYsHIMtOe1W8xt9UaF/QsC/S+mzL5agzyByunE3z
	8RqLmyJMi2ngOsRFWjKbuIHq8abWyfxpOv//dBt6k4VY1c9qFLQzZY9vIFWFAcmRWUWhgptUN+gB5
	FSNR7rggnoLcMZ+sIpU9yBX6cgv3a4WvoL0wFMjW/mQOl3DykL1YTMndnfGhFZp4rw8OFPz7hZ20Y
	rxPhfCTipeU27RtzbV9PrgtsQCwd77IEbUzOs4KipwKc4H/6Ead4w4KNauAGx7DuS/AbsMfSySk01
	HgLF8bww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xISNO-00000005y1Y-0xw0;
	Sun, 18 Oct 2026 15:00:42 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xISNF-00000005xxk-3OFT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 15:00:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49e73611928so13947985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 08:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792335632; x=1792940432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IibueGhEEmNd2+d81oLiHRI9L7xBk11xjq6MNbG7ers=;
        b=eE4eLaV1aNbqF7+7GKTNzMYPJckiKyThpX8/d90yoqx/H4PeAs80g3XhUp9k2nW0zN
         b42oSmOUQrHlQNZG4OKjwkX0wQ8E7uZXPnalxkk2rifEM6nJDsmzQjnqJ7JZsoMowpR5
         GnhTU2UCPAD43YMJNcitcSC5GH8ZLgFs5QiCwKZSCBxON0HAleiQzRWuoNK+ZBviyNAZ
         tsTj2ypK7YZk3PikbByHMNzdZc8IzRP+LJ0DAmqkGdP5JLR2bpmEup2GJpgYGa2L32X8
         j5oZzhmNy901Ejzx7WwE76ET7rfZkaaShcj1yZJTfNlUfjt5iHZ8t/qagxVIBPtdWQN7
         d1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792335632; x=1792940432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IibueGhEEmNd2+d81oLiHRI9L7xBk11xjq6MNbG7ers=;
        b=fQ2uG5PD3YRXBxJwmNgkoGbH17fnyN0QIuPRUS6ZMrm73NVrjFvpJM5T2Gc8LgyD9D
         7WeyalN5xo2Pv2jDfgTRkzr7C7pZaBX8f8E67shQEX13LI9dyQZoeg0IYBUdgzNnspPt
         hZ86OgOqD8w9B8yFtWoUeo9SVaAqXcIbUN5gJy9bpcuF9loQlQ9iBBFqwuuAUsXXHQ8d
         qiFvkcXMRvY5no5y1DxNIP6Kk7StmTobLEwec/1lzBTgQ1oczj7v4H/N36dVSUpgp57n
         151OJ9DbzufMYX3eue/nMjcSbkf/oTm3+ng/i+lgpN0Hkyy3BqixkBqsG7tMxfNDdGlL
         vx/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxGajZ05yLvipj0mPTSoMFfkvaM0M96ITzR14i1CsVspGNT1z3gHY5e0PH8ynbd1E8CMc7rhDndWZRm11piCjEt@lists.infradead.org
X-Gm-Message-State: AFq9FYKWSNJRMNGKKsoA430D6bgBw8xiM8n+yc5E8wxRKojqm19Gs4Wo
	Wc7Ea045SIAuNn2BKJse/F8gWzUuxvgx0jM9sSx5DnJBhJbVrs7Gp0Zl
X-Gm-Gg: AYBFou3jEAH4hNy5qP5mNds6sbgfsuLBkEKi27A9NwO2vxeL3x/q3TXMSKFXAsz65EV
	j69Jpg08yaJRD1nbA4mzCkxFd7tKNLp3g2C6D/jLzSQKox90bROJks2O4pJxXK4/NnnUTcGQaV2
	pCl0nPk9j0mbghsfGa4S+ANhVLLsbtgbZuQ3JxE8eYeO/W1mA8rt4r02F9xSYTgABw9hN0dMMPE
	g6rH4oV7yU2EnpkQ8II+M+hn1y1BvKt+4TRzZz3NCIh1qz7HCUjuXLPbbL752PK8lUePqJd2FbN
	dSFvwkzyG5WTEEaaZXN5kmQbeuA1BSmb6Tq/lTsUb6aGgPiYcKqecUHfiiAebNYfmKOpRWZR2MY
	lLAQ6qdCxhuDLj60d/0i9PLKEKQFFZI0VxL7SpN249OIPWzt5JoY7mgamDyzYekLZszXGiMSvvK
	Q3oKJuEzerwLcYqx6OBodCcZAGqSEw2avuLDKthnHhDtUO22fMtcg2olc3erXmuc+0SKlqRmcc1
	iBrmUtdfqplL3KRKA+WHM7b+bCaXWBQm6Rr/DJO5jSyog==
X-Received: by 2002:a05:600c:5254:b0:4a1:e57b:667e with SMTP id 5b1f17b1804b1-4a1e57b68c7mr27470435e9.4.1792335631733;
        Sun, 18 Oct 2026 08:00:31 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ad6245sm212868925e9.3.2026.10.18.08.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:00:30 -0700 (PDT)
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
	sander.speetjens@gmail.com,
	pbrobinson@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v13 1/3] dt-bindings: rtc: Add missing type to trickle-voltage-millivolt
Date: Sun, 18 Oct 2026 17:00:26 +0200
Message-ID: <20261018150028.1047172-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018150028.1047172-1-sander.speetjens@gmail.com>
References: <20261018150028.1047172-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_080033_864793_2D375A51 
X-CRM114-Status: GOOD (  10.44  )
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

The trickle-voltage-millivolt property had no associated type.
-millivolt is not a default property unit suffix, so the schema does
not automatically infer uint32. Explicitly reference the uint32
definition so the type is correctly declared.

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
V12 -> V13: No changes

V12: https://lore.kernel.org/linux-rtc/20261018143712.1040152-1-sander.speetjens@gmail.com

 Documentation/devicetree/bindings/rtc/rtc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
index efb66df82782..e46d50b1063e 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
@@ -51,6 +51,7 @@ properties:
       if trickle charger should be enabled.
 
   trickle-voltage-millivolt:
+    $ref: /schemas/types.yaml#/definitions/uint32
     description:
       Selected voltage for trickle charger. Should be given
       if trickle charger should be enabled and the trickle voltage is different
-- 
2.56.0


