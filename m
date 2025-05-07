Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61550C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 09:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+y8jPOzO/Gnjm1gvhE1qivFemvUWxShS+OkhHR4ZTcI=; b=e6R8X2U/k93cM98SJOkHnUT3sj
	eJPtDtwDf5/TcPDExgCBiIcmEXTpIZmkCUWPhhwG+Y2BBq1Ina46mSaBft20SJPYMw9EnAG2h3abd
	ojO5N3wyYEs5Ge9YLxaI1Zn9KZNLIV480KZcSaX2gOq7P868aohzVHoeIaKWLYZ3SPLHiZ3wnOWC1
	NTNup6799CUq2bBDeHpCeRHHWkuScvjL9s4ClKZ9TAtyA9U7IhffDBUSflMS/k+RUarT8MtaG3oNh
	N9QzGQJGXYHyCGVkdfNpajnNDClTNJB+Fyby7VyvN5DLfTmC5pvl+cS+q2vf/ypsbv5Qd2tZU0Ut/
	3sIzWsiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbQK-0000000F1Dw-3xTf;
	Wed, 07 May 2025 09:50:44 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCay2-0000000EvbY-2vpc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 09:21:32 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a0ad54f0aeso143553f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 02:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746609688; x=1747214488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+y8jPOzO/Gnjm1gvhE1qivFemvUWxShS+OkhHR4ZTcI=;
        b=RCZmc5sps1azXFqsTU2rGPPgxRsahxiDrtU3KoZrfmJ3QbHyMKC+wyxhZxGb/BVJk5
         W/TppQXBBpImTiGnXM7zGLCYQEabIotXSwgv1Sgih0NLNApDWf9wGdngAZmqbMukTjsm
         1FkeG8mT80xfrWBHQVwApd3nNf7IrZNl7hW4x59tiI7jfoX7yEIJ0QPQOnV9tdFcCiZd
         dVn+ssQwV7LLVEFI1UAEzZRzqF8NRGE6mkCm9NeGQAysAXKALdcIYbAZNeI6nR2PEOPH
         uPf994bTP+ArxVqticy3o0bwqnQOtRY4oLiN5hSwRD4eT6ogItXey6JkskVcKx3LsTHE
         g90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746609688; x=1747214488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+y8jPOzO/Gnjm1gvhE1qivFemvUWxShS+OkhHR4ZTcI=;
        b=Vy/j2ng7yOG8364i7bnzfREj4GQ3ef6GkCgTpngkv44+Cf1ZYscfsQRgGgx8kBJOgY
         CPoo6lEqWMJGmGvcPzoPJkb89/+k+CaD6eVLMW+rDY5u8jutXhXZJQL/aniTu28R3Gh3
         TP9xZSnq0xdDp1SDg6I0FPPDLo3bEC3kjchVwRSZBlsTnCTW9+olMpIIcyfArkRvZDLq
         mb8po5z+95TKgzLZNlYmQq3314blbK7px8wCIoKq36WoA/aKBvCUkAdwzoNmz7hI8hSn
         RBGzQwsEjbMIlfkVcF5dMuEmmV5jdz+FbdtzwxoHa9phEweBubaxmG63MI1bB6Wi1qF5
         DTOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuxWmlhpXOE6kONIJZ7tiQshq2YNb+Usc9TPF1JUNibXldHXeIXvZQjXcooc02besfPkID9JTb5vWTcAccE+Bv@lists.infradead.org
X-Gm-Message-State: AOJu0YygWIYUw5YFcPWhjquPuUEfqqDMBhZ7pTWRT3KRIdeNZR1Mf1/3
	LG9Shk8v63c3oAo4GtveDVEmist0bRYKWVIdyB3mSmS7rhPH0hQNniMHpvRR4BY=
X-Gm-Gg: ASbGnctfFcdXwJoHd37H5mZcplYbVmybbL2/hCHHz/idoKY9zlhOIw5pRuX0FA/WVUB
	BVoSo0szi5/XtLfNMOGofIWXqAbxXThqGgIUNLrZxDdzjvn19lSXuS298EjqFChHcOzid6XkEGl
	mFLg9ZxzXWg1NStaUa5CawQOxPNx6aK7jwCgKumadXtUCoUXuKQqhJNtad6qfmnIo1vm6hihua6
	w6EQeZkX+0CUguqSb0H/TnrxqaBg5YbY77x0M/oFS23+v/jbQYfxJ9qI7oixpwZwnB/WoK9q8kn
	v3c0mmukqGVpG2nyQg3asTXi+hlUOwmcgfcMoLnGDx5AaGEo8Q==
X-Google-Smtp-Source: AGHT+IGj/1ahHnSJ4e2xPVwr+AuBbHJ0wuhNIZomcjtqGtlqcAu1lDRaE0pf4RUZq68YnrfTUyA8AA==
X-Received: by 2002:a5d:47c5:0:b0:3a0:7d47:8d7e with SMTP id ffacd0b85a97d-3a0b4a363a9mr745845f8f.8.1746609688581;
        Wed, 07 May 2025 02:21:28 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b5764733sm1633431f8f.22.2025.05.07.02.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 02:21:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	stable@vger.kernel.org
Subject: [PATCH] bus: firewall: Fix missing static inline annotations for stubs
Date: Wed,  7 May 2025 11:21:22 +0200
Message-ID: <20250507092121.95121-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Zuk4ngv1wcV3NMC95okNfizOZQtgYbFjGF2v7oWA7MU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoGyYROrndXK6jXz7UdfFDTRPGKx2tUXBG8hAo+
 NjoRR0HvAyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBsmEQAKCRDBN2bmhouD
 1yXTEACTo9Eb1/KCCY3Jd9m8bNUsYfG6kBXHtTAAFI8wXEESF8U4GhmrAvx81vwof2w0YREvtxb
 ISMF0pjB6RnocBfCP85nQ746kCG8w4rVNu7MT0UDe2Jz018fFc7e0HVZvZYTA6jt8gJBKwCmqd/
 OgFPMAwzCMmhAN0BMMRhei5JK5WBibxnRVJcAEQUEStj9wP5hwWVvHLNHyVpQvZfaC/8dWZBQtn
 zmtaN+U9IM6vKJGcwlagZLSUw66zRwLh2m+JGoab8bZzlOQ14Obp0WgsNouRNXtU9sKOglP/YrK
 Me7qo1tycDwv/7E4OHa3sRgrA68d2lbHXQc4FGvocItlGvWTu/gKzaXMeN7j0BXnWRU1GukWcOQ
 l5QHEjIyw1Vub0gO20KmikggPtrV01IS1/6oWur1TIG6J1cQDwQrWO3sOTlviVTRx7y/vrfwuuN
 w54+Az1E3GuM7qxNAvOY+CEG5RIzkNT/aVfRMbCZt4GBPLFctNStFxyP1qSRnD/nA+4AT9Nqy9Z
 D+nsGkQaCaMla6U9FWlPBqK6HaD1qzIz3Wd/OF8PYatfVDMZSP1QMZGFmYK2BV1r7DZV431BQET
 XmFwOSmhvwY44mJFyA9kdRO+00I/Vd3zISVSx8V6tEaHfIjeqV0ByI9r73KKQY17jhlYWNl1C6W qg3wA9+J6hsAWEg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_022130_747852_2F16039F 
X-CRM114-Status: GOOD (  11.43  )
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

Stubs in the header file for !CONFIG_STM32_FIREWALL case should be both
static and inline, because they do not come with earlier declaration and
should be inlined in every unit including the header.

Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: <stable@vger.kernel.org>
Fixes: 5c9668cfc6d7 ("firewall: introduce stm32_firewall framework")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/linux/bus/stm32_firewall_device.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
index 5178b72bc920..eaa7a3f54450 100644
--- a/include/linux/bus/stm32_firewall_device.h
+++ b/include/linux/bus/stm32_firewall_device.h
@@ -114,27 +114,30 @@ void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 su
 
 #else /* CONFIG_STM32_FIREWALL */
 
-int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall,
-				unsigned int nb_firewall)
+static inline int stm32_firewall_get_firewall(struct device_node *np,
+					      struct stm32_firewall *firewall,
+					      unsigned int nb_firewall)
 {
 	return -ENODEV;
 }
 
-int stm32_firewall_grant_access(struct stm32_firewall *firewall)
+static inline int stm32_firewall_grant_access(struct stm32_firewall *firewall)
 {
 	return -ENODEV;
 }
 
-void stm32_firewall_release_access(struct stm32_firewall *firewall)
+static inline void stm32_firewall_release_access(struct stm32_firewall *firewall)
 {
 }
 
-int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
+static inline int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall,
+						    u32 subsystem_id)
 {
 	return -ENODEV;
 }
 
-void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
+static inline void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall,
+						       u32 subsystem_id)
 {
 }
 
-- 
2.45.2


