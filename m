Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE06C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 08:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8W+kWi80hTbgKc8WD5gFQsUGSWJf7sfWCY60HPdtDo8=; b=wRVEheqNNzXuk63ymPUEtXg5j7
	y5ZFz4zlr0pbYNEOOiiwOc3QFfUaxlYJiQ9JRPCnPb3cmlMv4ntLL/mDbAyr21vwQp1LbuBOg7Crh
	G+5GjntajU4kfUM9sZGl3+zR/4KOzH9payftb1nUPNUmrAko4E0W4Iav+4kpbQLT2Gm3DbtErhdtl
	Pa0+xuhgfoTEYe4EJIeHhsO/fmNJHajDF2EUhPJK82lrfYeqHQFVoHSXmNd27dLpXS+NONslig4nV
	FQfSEs+pr5O8QR5zAN5asOlhBZRYtKkYfrLr5GUMO4QaO/GJdz+Xcy8zisoqKy3gtM6q+8kzD1lhF
	/6fnTnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxgwj-0000000ENuY-1z2s;
	Sat, 22 Aug 2026 08:19:21 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxgwg-0000000ENu2-1ttg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 08:19:19 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c1670dad7a8so322092466b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 01:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787386756; x=1787991556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8W+kWi80hTbgKc8WD5gFQsUGSWJf7sfWCY60HPdtDo8=;
        b=i8FCiAAGJKeGYOa28n28Lnl9A8MMj60BarrldNlPHwh1gElOuq8HXoBwJxOlk4LY7E
         BcVRG/h3MRfBsTVC8mMCFCCs1VzN5MLHPW7V+liJ/OcqpZqGXe/hKOyfOqYKTjYldzdD
         jwjBq8hbnTm/bcVibz2DLEMlWbzGsSzzPcZAOnDyzTMR2dadP9uUAdSiDOiYpdQQlqN/
         0XouiB8UJnQMdTqlvjgenr0DiJtoj4ILeKAKrcrroBeNr3WLKPXiMhZuT7O8vFfV45Wb
         aXIrGnHSZRbV9LhY/kzb2lgCro0v9nq7H3/L1MgLpokFQvp2nyMFuRjPjzy1VMcwxSph
         KYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787386756; x=1787991556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8W+kWi80hTbgKc8WD5gFQsUGSWJf7sfWCY60HPdtDo8=;
        b=dvs6zRgtbbDoZkM5hDWQEeVgPce6QQ21g1nNXq31nH4tpBjbIPPUBp+hN6QBDMiIK7
         kja6dpgGE7ijVH7NK6W0Hg0Lu7ke1fpFGqyNGozBfwMF+C2YJk29wuvWpGt5GD0h9DI5
         YMeluhXjHm34VZTjea3u2qroydWnMogfxseHZ3tiuJh6mJ5UItZFAv1cJb6uaIkUGGpd
         UxA31p9McomeO+IejukqvD+OW6ctZKBNuxEzpz/WcnoaDF8vOzvHNxd23GCoFvAlE1Hk
         pNdsu3iSbXIFQsHAinOcQqqJfbnweE4aB0hXIXupiNWVigNqepoK+KgbJER5JpJBhLpr
         vvwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpT+9aW4pFg9Vu76qrDfLH7ceWNNgL9MgGWBGi+s/j+FWwxZIIoUUn/3ICOeIJk8+EvICDYp4fflHAkBCEeqkh9@lists.infradead.org
X-Gm-Message-State: AFuF++nvwMHf31H3f03rppen+DbOih6jZyqZZV6eeTpOsayzWoDk33hO
	9CRn/kf359sBimvC/3wIR74K7O4528bjJEAHnd6MMbs9dylWi5T57fXp
X-Gm-Gg: AR+sD138iPDfrOLSQ+0VBusQpfUf9kdm7bjClZFlIAXOr/MgoHbAVO8Ts/WRZQoFjtE
	FUynpcGtI0jCTH/RY7b+/ePOPG4zBn7QPYfpLZxLBqwDdN9lkbDwWlDEqBNOsSlH+EhUsYfKO51
	4ZEwX6Eitukj/7mSzdFYtmewcqBgLmuWF2MZQ6VUmTmXEMT6xqyare2AcfD0bSFFynHB9Afri22
	tvjc4E+8+Zr2HpWzyK0BJlYaQibBYR96kQx79d5QxaDEKjbzisRaLrhxa971R217WIQAZT5dTtX
	99M4hMyduMz8DMKp0DEJbKXLgWU2PThk6FETBpZoraDHHKcsnHd+vTU8lf5+lqTBCn5mDP4nZFb
	qMlalaCck7RK+aT3Fh/Kg5Rcm2m19iijbvAD+BWDHupStPccCA7O/pbLB4GW8ygxfFltqc1H/qM
	bOnxhaBPz2I3QGiTZPvtmeoPI8ETd+YoTkbEuhxzlOYkB0PLD8jnuHvAPv7NkH7/yw+i7+upeLS
	1CqQBywFCNJhkF3gXAYWQ1f2cuTxbUvm+ckFuEFsT48q46B24kBxzQ0JRAhzwat9JQNiFOsdDOw
	eTv1o0rC+iG3GXRHjkmL8RwoFC3oTagQ2D22WzKxtD0igDnZqu8x5mC95P4y+6I3W9nSA62ct8d
	oj+Q2N/bW
X-Received: by 2002:a17:907:d12:b0:c24:82b9:361c with SMTP id a640c23a62f3a-c2482b93766mr1016989566b.17.1787386756173;
        Sat, 22 Aug 2026 01:19:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24962bd8fasm295741866b.28.2026.08.22.01.19.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 01:19:15 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: Fix CoreSight CTI Kconfig symbol
Date: Sat, 22 Aug 2026 10:19:12 +0200
Message-Id: <20260822081912.88774-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_011918_510400_C5998386 
X-CRM114-Status: GOOD (  11.61  )
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

The option exposing CoreSight CTI integration registers is
CONFIG_CORESIGHT_CTI_INTEGRATION_REGS, not
CONFIG_CORESIGHT_CTI_INTEGRATION_TEST.

Fixes: b39b46fb9c6a ("dt-bindings: arm: Adds CoreSight CTI hardware definitions")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 949444aba1f8b..345e93ca39f96 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -43,7 +43,7 @@ description: |
   connection. Any user / client application will require additional information
   on the connections between the CTI and other components for correct operation.
   This information might be found by enabling the Integration Test registers in
-  the driver (set CONFIG_CORESIGHT_CTI_INTEGRATION_TEST in Kernel
+  the driver (set CONFIG_CORESIGHT_CTI_INTEGRATION_REGS in Kernel
   configuration). These registers may be used to explore the trigger connections
   between CTI and other CoreSight components.
 
-- 
2.53.0


