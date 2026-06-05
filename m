Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E50CD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 07:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRiUKaQT1nJBPq+KqxNJfa8ue8e7/Pl8K6UY0lHo7O4=; b=iS0mrW74/ebOUQDUq7BUHUaKVy
	4LDbqM4eKZGwgXZUqNLFq4NQB8m2snInEZOKFqYJZx8yFT8uQXoCh3OT+QSl4on3OaNR05ir1qoFv
	8Ruc4aZFkq5DCToy53OrvymyYqomFruODzQ9ntH0dkRKhdYW9nB3tP5VVP2cOnXIP0Fnz98lyqFMF
	5znHm1VpaOVKOsLdm4p+KmIwpSlkwRUSHROLte7vE/2yOPASd5lcHtpwfV1tR2AZNkGxHLaPd+yj4
	/FgzJNbCsUzj7RxXVk+RhIyNugLXbSVHNPadtAoTU3/AWVDkQ7pbxAluTIoVUu3HzNYneAddeoMWp
	ajBSnE5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOgw-00000000Cv5-3vAh;
	Fri, 05 Jun 2026 07:10:06 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOgu-00000000CsH-0eGH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 07:10:05 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-46015dc517aso1284828f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 00:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643402; x=1781248202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRiUKaQT1nJBPq+KqxNJfa8ue8e7/Pl8K6UY0lHo7O4=;
        b=O+IaGA1sQJhpJdX+GdFLd5bqXkrGkPXvUelS4+SM91BZ6jyYWjPVPzauUBpHAvFJl9
         hVL4f0m63vZZarTq12Hk43fA4+6lloLP6huoCp6pHBvwuszfMRDXHjSz73WWsqb6Phna
         nGiSw0DzMCZLeLTtaJ9EPE7wnWwHPwZDZ4EWox4und+kip4LsFcmr/brkPtxa88hgAPE
         c/QALpaxmkPlW+IhLwrhqSpe0QPc7lCiw+evUGmCpo3SVb31IcO24gMdDKyUGEf1M/HM
         gGqY5IsaJi51w+yeKyBZDTnshODxxDyRaHOZB7eYLJtNG8/l8LOfy3iM9N3PuV0CyAtf
         ozoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643402; x=1781248202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GRiUKaQT1nJBPq+KqxNJfa8ue8e7/Pl8K6UY0lHo7O4=;
        b=iyg3UDSqEGGzcmqyn+qRNDXRY+othhPytfjZODRGSQoDBiO+iHmJ3A7x/sVI2CrBlw
         hObkl2fRRaNYBhlfjNOIfXdqlvAIOwq7U00f5j7i1dN5KGI0HJxY+LxWyO/1qW753Yrr
         xgeyseJL0YArGrydrpIymsmIlaALGfQ66mTGtabxw5FWopNa4WcaSefdccnt5AzgjGVS
         nLr4y3jdtZl6iA9llqtb3SoSJZaB4Zk0sfzdBF/MdPyfhLQ5M/bnOsKaA2R+VjOOBwTy
         KDhFwCo5BpHwPj1gfBc+ySAmtUd8Eb5go5OIc61pwtpaqziKzuN4l/Auds4v+YwaH5jW
         EpOQ==
X-Gm-Message-State: AOJu0YyPbBNI/YOkKFiasT/cV/y96fO2txNvs90EU4+u5dkCpfoSjVch
	p8dYRPFaoz9eQs7gxTehbfZWPt+X9NT8t5B3J1KvHXKYEnpzm7L5M81YwB7v3Gox3UM=
X-Gm-Gg: Acq92OHcDUrD5T4lkrPs0iG5My5AgZNHFw6DeEMuqnKVeM+cf5oAbYk0lDI1k+wAt3B
	cETgFz57TSnB+tBAaPzrUOZ6Emc31lxz+ESVJ6A9ePIAjGI7skraKfQsWFOWrEaVVHKGDeYTpYm
	s/ZEeFJKVRu2pjU/+p37aw2UxelUQHxsSthb8TBFM0bQFmOmOz7ZLGYsdXc4r4UirOZd5QyUA5Q
	LF5eOPJU+I60ojjjXIxJfIKQexKLaTGyVlE+1mSVXU2bzTctF4auWQJ3mhRk7t43nmMfbbq//r6
	fQp7GRFAV9LyVy2edwb4ugMJtjdAngRYxUBI4XfcRk6Bga5i5kIIucgcaKofQNM27Akycf3FSH8
	h4wdSwPGoGvFyX6KgiSACom4TQ6dFI9NePtPDhLUI+H7OXCWay+oPv7nXjAof+WEOCw0Gf4RQGQ
	L/N53FC684r3qgT5Yut2wZFHy6bSphphHQ1pm+hKEfJV8irZn25LJE/DKEFQK9A0WVrbE0EPdWF
	E01nKwy0u3Pbg0Ij/OFbg==
X-Received: by 2002:a5d:4ec7:0:b0:45e:ed7e:f900 with SMTP id ffacd0b85a97d-460304ee4bemr2656740f8f.6.1780643402240;
        Fri, 05 Jun 2026 00:10:02 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:10:01 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 4/7] dt-bindings: input: sun4i-lradc-keys: Add A100/A133 compatible
Date: Fri,  5 Jun 2026 09:09:18 +0200
Message-ID: <20260605070923.3045073-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_001004_214679_886BC2DF 
X-CRM114-Status: GOOD (  11.12  )
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

The Allwinner A100/A133 SoCs have an LRADC which is compatible with the
versions in existing SoCs. Add a compatible string for A100, with the R329
fallback.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
- new patch

 .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
index 6bdb8040be65..524c8b51f53f 100644
--- a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
+++ b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
@@ -23,6 +23,7 @@ properties:
       - const: allwinner,sun50i-r329-lradc
       - items:
           - enum:
+              - allwinner,sun50i-a100-lradc
               - allwinner,sun50i-h616-lradc
               - allwinner,sun20i-d1-lradc
           - const: allwinner,sun50i-r329-lradc
-- 
2.54.0


