Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2B8C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 06:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6w3NFT+onEn23Jrah2wXzUpMg4pSRyv/OfHasrBAkIM=; b=fvZL+GH5eAR489NRJhWnFwe8Oy
	l8+lnc/7WbACmEZ6IP1cvtf6sRoM3V4fEtTc9AU55pRdjIq9MmYY1njp+D58jTt9YP8kIz1sDH4iy
	/v9iqvUi+eWYX1vWixOzLSuubGBFw7unNsacX3h3DzlsZ156526IZldU1Y3aOjR9Lf16DPfBWOeUz
	qQ0rLW4lut3rV8M4cCa27i1/vmH4CM8AZc8nLxDQrXq+PtsOlOD78OymQpuxUok4eLr4y5JaSKOCP
	VGbnCspqiPlkACnr5d1jIdB24lAEHBCsC7YkUyHoO/mJZyuFJYMkn7tT5uO2HM+T8Vu/gYgILCCE+
	okvmpYXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNyf-0000000FyJS-3cv5;
	Mon, 24 Aug 2026 06:16:13 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNyc-0000000FyHG-1gPH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 06:16:12 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38dcbade417so3558377a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 23:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787552169; x=1788156969; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6w3NFT+onEn23Jrah2wXzUpMg4pSRyv/OfHasrBAkIM=;
        b=bw+pN0nIrKeld7z3rViSnzo/50rscLOkZXgwfHCe+9uc4j0yFIUiVV7W9Xx3OTElqm
         xB/74lYo+C5kQr2H709tgW08eJgBlLPrefG4TSd2HzkbwB6fiuZyCXN1BZTX0d7qvkEd
         KpH27l6B8ZXSzTlWrTCDHLHGcGbwTEMKy66rAi80SnvJNsA5n+FcCFKuFOzm8mbVe2yj
         uasEOFZBl0obiRX03/x/dilCL3TtLrTV62fCDUY5DaRX5W87qqlYxo/95lzwFyCBqQvK
         0yqm30ovBU95KXW9QSMzV3kojbAdK8SGGKHhoo+HERTgpuwFnYhOWt2wFVt2oJbOz+dD
         Z48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552169; x=1788156969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6w3NFT+onEn23Jrah2wXzUpMg4pSRyv/OfHasrBAkIM=;
        b=SzbK181zomcE3ON9nfzM0f0pfdxVt1iU1WnbtDFeGZLe48BFilUmv2Ajm+B+RCJozO
         G89vvW7btAFDBLyFeOdRNOq7kVBPrxtRlpOXIQPY2+2LsCvSyXqAskRGyoKY2nB4fBos
         KeS81i/jP9A0MbkLJVJTznXT0REyCgZeQ33UOkDUihCXQ4TimiYY7hlNmWtPswZb8nym
         LSAVbDQ1vY9Zv3BTvKYaVGDP/zcmUElYD+AFaBe3MAkmCPnmOJcEOghOQdA7HS7Aewiz
         Um+x/vAriHmww3LRJ28kbGJNB+5aewZe9OmLlaFfp8aXw0ALBDejZ4HqdLpsQTT+iWUo
         hInA==
X-Forwarded-Encrypted: i=1; AHgh+RrVr3YANy6kuENj848AmopU20ZcEH3Re9plfjFctFBm6Ses03AMbSMHku4X05DESvAFRb91KZtQBml7bsLkwGtE@lists.infradead.org
X-Gm-Message-State: AFuF++mumQ2IbAPV1xC1QyD7z2QcTsheiKZN16EDp4yB0ITHXmG1+4LM
	OtM2JUImGq91zhZ6SzJsX6x2D7nxo6+SGae5hCTRZWmXn+hFnxbu4YVm
X-Gm-Gg: AR+sD13ps0uzUp0aKhUV85esG00B7PhRueTzro53Z5/RFGIdT/tmHynhyvpHa8mY53P
	jXH/hXktykzYkB4EBCYRVG8hvIEkcTpR9QWa1Llt1b/xqMb5XIT2qj0y3Cg0hPt4O5Ftois+il4
	ViWdGnMxcPBqPcL9YfK4/TtSPNQgJ+2AhpXWAVQtlQDn711MWAVRZGDbgPBy2DDrrtc4E70PyRM
	IINT8K5I+hxyE8MtVahHaYwoN/Q3tC7UiX3Md6VPuVxM2oKCN0c0TnNbEsRyfRqmA4LWdFIcsb4
	MqTsE6RdiY/QdmVQIUOT2+6cS9PUJWmfSYZF8tZ27MKbRnuVI425mpFvqazGjCWQkPl53Yg+kQ8
	eXP01zavrSX88rx0kjEcjFnC0NSLPOQcuHJqO6KlnhxwwOQyBaJbqL2t/Z99NeUwe2Nht0RZ69w
	v73CMhuMI796cGCyUiRdK4EF70V1LtgV1AOI5kb9EA6gdbDpYWhSKZx9WObrsYvmbjwF2v4C0z5
	Q==
X-Received: by 2002:a17:90b:4f91:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-395c33a6e92mr40860671a91.6.1787552169488;
        Sun, 23 Aug 2026 23:16:09 -0700 (PDT)
Received: from Alone ([2a02:6ea0:d33b:6282::14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4af750esm8779646a91.11.2026.08.23.23.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:16:09 -0700 (PDT)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH 1/2] ARM: cpuidle: Fix "sucess" typo in comment
Date: Mon, 24 Aug 2026 12:00:55 +0545
Message-ID: <20260824061555.356345-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_231610_954620_865C2FC6 
X-CRM114-Status: GOOD (  12.11  )
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

Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
 arch/arm/kernel/cpuidle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/kernel/cpuidle.c b/arch/arm/kernel/cpuidle.c
index fba1f8bb0..784457ac7 100644
--- a/arch/arm/kernel/cpuidle.c
+++ b/arch/arm/kernel/cpuidle.c
@@ -79,7 +79,7 @@ static const struct cpuidle_ops *__init arm_cpuidle_get_ops(const char *method)
  * cpuidle_ops are tagged __initconst and will be unloaded after the init
  * process.
  *
- * Return 0 on sucess, -ENOENT if no 'enable-method' is defined, -EOPNOTSUPP if
+ * Return 0 on success, -ENOENT if no 'enable-method' is defined, -EOPNOTSUPP if
  * no cpuidle_ops is registered for the 'enable-method', or if either init or
  * suspend callback isn't defined.
  */
-- 
2.55.0


