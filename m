Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F2FE66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 09:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FeZmpsDdG1RUrBzKUX3sBiMLnau+8z4mBhxLnyXrfgM=; b=rMNLCHuUjBzVUg3OpXVyeU/bin
	BvpXhuC0J8y2vofGJ9BEbJ0L+krwwXjmxs4jI1Gr6FUIKurpN5SsfTJFnM3HVGS9qTk1GQFMMTphW
	glUycJGx+CWZxqZcRL/gXGlboOPy4XjH6rpgYL9454gRtoCfeqPvnkNQqo9tdE8GXAUXovo50pRUi
	b2Q36WLemQ6eI031Y4sl1NVtag2WHwCwcpmq99CXK8wUPKWl58NPh87L51FwEUZvUzUrs+vT47vOG
	hWFsqCoAADGTRnwWZofdQ14lN6hAWZVPLD7mJNP6bEX70LlFSacq4WtIb7rXhfrPK4fSH9vhfnFWm
	tSxHf7ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXFrp-0000000CHu4-1k5m;
	Sun, 21 Dec 2025 09:36:45 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXFrn-0000000CHsq-1ZS6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 09:36:44 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a0bae9aca3so43195375ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 01:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309802; x=1766914602; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeZmpsDdG1RUrBzKUX3sBiMLnau+8z4mBhxLnyXrfgM=;
        b=hsPkbilgNluZxzmDGM0ihAv4hFAmg5S0Q9nYknMPQcKC8OosoGwVALeGjB8ypad7bV
         5xAnj3z3otQvcDtHCdrTPj+9lo+CM8G0gBfCguZnkuya59DX8w3K7SGezwrs1b/225hz
         /exU+vwcC4/mNOxdAZWVbZ39cfOWoIkzig4uMdsIRkVKBmfwcpYyPT9SjKAxUqgCagF2
         ug7hlA2agUYtLUPypgfEJ7tZHqh/10g8wKG71K9XrzZ/CjEgvcnaavcs9S8JixkloPTc
         gB6vTQbJ3QGWiPyy/5nj/WacKzm0X4duGjpkD7nFCGjP949hPecCPiB8yjwlq9p1VArH
         OrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309802; x=1766914602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FeZmpsDdG1RUrBzKUX3sBiMLnau+8z4mBhxLnyXrfgM=;
        b=bUWZOPoMCUSf4JOlebYCHG4dX3qGujfwEcD5y7zBQst28brkGInZ1sYpI8b7aeea/Z
         tYPmjemaZNWDwSdXXD4tSPGoAK2vq4KW0dUrDZ/O/28Oh2lWAAM7EOEdgY9nD4i+Hr9q
         HqbqShdZ/zvX1aTuUjq6UJXvksZDJHHipCpTLybU/ah9Vl4bytJX8EdBv+zD+Fgm9TiK
         URjdll+C7xB4796rEnVM/5jbkNq4NJjBP5ddislTCqyGVr5Mu1h+h+re8h12iHF2UX0n
         K0UPjfQ2t0fXr/XS8S30IJ73Q4OrBu2B5mufAbDknrSSyoJia0igDQxA9WE5fKrokdoD
         KOQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP5MMOLS+NzvtQKb+yxxYo0yl9CQKv/eBsEaD9VsHg7KKasbItQ2lhIIk79l01qY9iTrUaHfFnjIF6XbVWfkso@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6npYy791WLoKUdkQmltOFFQcCcy0/3bnoBjAvG30o5dC5MKle
	ahyL8Pb7HxIqw3Sq+22Ld3/JSWBFeYqnSQdHbmabccMDp3NAdpoZHIuD
X-Gm-Gg: AY/fxX5fYUBxJmeLjlf3mU7vPbuToAXWummFGuj5nfA77txUNi4UL/mikYJdUDrcQ8C
	Sk29pAnkMiCDtq4cecKCguwZwlO6AqYB9ZbvhjF4h6HjCCWet9ztUN/UQWIhi0m9PeuFV2KDHVY
	Km5uoPEOzNrhaWibz2GGhUYoW5BDfeE3e/AspPTL38P9g+Wm9ulTG/O1FTuUudefq4rC/WqZDGo
	pdPGVwkXJizuCBoZSr3ZPUdKvDUJY1cVMT1+Gryvk9MK6NnQn5uEpDeIr86pWPMrwuHh9CnIpU1
	oJuC6+O2GY7IzInQtbqvRc182GdpfsdBQT14HiXItCKs4QpaYRdVWrD8H8V105sm0h8qYXID0ZA
	ZY0DIHO72UvKROSjrJVujYBVlM6CNH3TW7nr+5lpHEoR5XWdzIOH3PTslt6WEaWznC0MUkqGQd9
	d96to0dd/2DIfB6zAjXzXDa1q8QHQIPcn1Iv9urgYEpM1WqXA6s3jVOslfMgwUwrKtJPeFEFJLR
	lZqMfX0HtVn3dpH1g4vDqhABJdFTgJ7P64UUy2FyvYKvYYmXyHZxi1vw+v1luNfoU+P7sneAbUZ
	4Ao4q1s0DynV3L0efM3bl0dSpHFWvZqs2dJmi8jao8toSMEW+rc+MR0sr/xS4Q==
X-Google-Smtp-Source: AGHT+IGmGZRoabrxlFiBda/1xG97X0TAK54HY5FazNa28CSCbtrIjPg0PALs67RO4ic8ZL4omZOAvQ==
X-Received: by 2002:a17:903:4b0c:b0:2a2:dc1f:78d8 with SMTP id d9443c01a7336-2a2f293d04cmr67609985ad.42.1766309802436;
        Sun, 21 Dec 2025 01:36:42 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:36:42 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:35:58 +1000
Subject: [PATCH v2 2/7] ASoC: dt-bindings: update tdm-slot.txt references
 to tdm-slot.yaml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-2-ed4d96413aec@gmail.com>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
In-Reply-To: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2794;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=J/JGbSI46p8HTL2RHYE+qUnCr5BQESuhvOilzbTTq48=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+yfNENmnr37sueAd3tzaNTZ3sqsW8Jh0uRewa79W3
 JQxpSG0YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNWvexj+6XktOBa64faCSAYXoROlpwQKz4VnvXmq/fORfa2E2mnVGoZ/2jEv/Bt
 3CZ3bYaGv51FbZajFc+0Y/6Ez7lb3yl9FvvvOAgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_013643_423878_F4C1677C 
X-CRM114-Status: UNSURE (   9.53  )
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

Ensure that all references to tdm-slot.txt have been updated to
tdm-slot.yaml, and are schema-compliant.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/imx-audio-card.yaml   | 14 ++++++--------
 .../bindings/sound/simple-card.yaml      | 14 ++------------
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index 3c75c8c78987..eb702f48d694 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -31,6 +31,12 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/string
         maxItems: 1
 
+      dai-tdm-slot-num:
+        $ref: tdm-slot.yaml#/$defs/dai-tdm-slot-num
+
+      dai-tdm-slot-width:
+        $ref: tdm-slot.yaml#/$defs/dai-tdm-slot-width
+
       format:
         description: audio format.
         items:
@@ -38,14 +44,6 @@ patternProperties:
             - i2s
             - dsp_b
 
-      dai-tdm-slot-num:
-        description: see tdm-slot.txt.
-        $ref: /schemas/types.yaml#/definitions/uint32
-
-      dai-tdm-slot-width:
-        description: see tdm-slot.txt.
-        $ref: /schemas/types.yaml#/definitions/uint32
-
       playback-only:
         description: link is used only for playback
         $ref: /schemas/types.yaml#/definitions/flag
diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 533d0a1da56e..a14716b2732f 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -27,14 +27,6 @@ definitions:
     description: dai-link uses bit clock inversion
     $ref: /schemas/types.yaml#/definitions/flag
 
-  dai-tdm-slot-num:
-    description: see tdm-slot.txt.
-    $ref: /schemas/types.yaml#/definitions/uint32
-
-  dai-tdm-slot-width:
-    description: see tdm-slot.txt.
-    $ref: /schemas/types.yaml#/definitions/uint32
-
   system-clock-frequency:
     description: |
       If a clock is specified and a multiplication factor is given with
@@ -115,6 +107,8 @@ definitions:
 
   dai:
     type: object
+    $ref: tdm-slot.yaml#
+
     properties:
       sound-dai:
         maxItems: 1
@@ -133,10 +127,6 @@ definitions:
       bitclock-master:
         $ref: /schemas/types.yaml#/definitions/flag
 
-      dai-tdm-slot-num:
-        $ref: "#/definitions/dai-tdm-slot-num"
-      dai-tdm-slot-width:
-        $ref: "#/definitions/dai-tdm-slot-width"
       clocks:
         maxItems: 1
       system-clock-frequency:

-- 
2.52.0


