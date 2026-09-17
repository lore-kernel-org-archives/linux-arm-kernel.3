Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC22C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 06:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y3wbvAbBWnutdIwHnF3F6m/7uEF6jqU2B+avYv0omNg=; b=bCXtI6fASZjhI1ZLwb5hByqCjq
	zAYCOXE1SPF2kq+BrGzKfYSE1wXZeJtKxfmNCL46aeXz1lNI+y/olVf7jblkgp+UMoTLkZQi5ttlr
	SpVbUKU3dr4sC0sv21Htpu5TMnhepss7bEM2n5OLMUYMHyoHZoxOsfWBYv6PedfTspE/blzOvsv12
	Nv48LNJlcNwRAdDQP24a5dXUb43hWhAg536aiRR/Tb/4v5JZ94zJYzGlouznucYy5lc08RysaNH4V
	4KdX70+uZnpVF50uK3Qub1beZy8qe2ZfcJ5/aGEPptPWVo5yM8WhIAZOQ9V5aYbHELL68gX0wMIUH
	t/Y1imlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75uP-0000000Ah4i-0ASJ;
	Thu, 17 Sep 2026 06:47:49 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75uL-0000000Ah45-3kdo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 06:47:47 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b965f447cso3711285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 23:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789627664; x=1790232464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y3wbvAbBWnutdIwHnF3F6m/7uEF6jqU2B+avYv0omNg=;
        b=FvFoKBk8bdNHJmukOze6mzGHghZwzzpOajFX8zAI1ePnUHrbA+YaxF9mIwUYER1AGW
         hjYmaDFMl15Kz/Gyd2G/T9++FIv2mHViFOlsd4fJzeST6PFEP1ETBD1d5CIScQVgzsm6
         O3T7bVKu27z5Cpp+cZvFsybtm0P19fKKwSABjNcN1QcGrg05l+R37OMELoLPaJyuwBFS
         ls3wv0mWvt6IjiPVMJvkhcWyka9TuIJwh/sWDcQoM0Q/mQs7VqX4gPgF63JnGiDQq9iu
         AVkZMMcKTND/2AI0u3R/aSRSiE2nhzK2puZW7+6+uFaaC7aseGZ1UglKDjl5Y/Q2zjV+
         nIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789627664; x=1790232464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3wbvAbBWnutdIwHnF3F6m/7uEF6jqU2B+avYv0omNg=;
        b=tlD5ZaxZkUObikEfNv+8zaaI7RCIIB+tzEmAVsmF+TimVcaI1DOHtdE2OyOmtT8wcx
         GKfYmHeWLxGpQIABq+fhwHeR1C0lzdvhB9JlCi4f4gVrIf6P6F5rJ5Ukxx0tfCdOtHJf
         PoFm50qPqdEVOBSzfbd9hbTS2lpj6zPbIcdSKyr6cNp4vQCRlwRJVr7MO+5pS/ZQ4z30
         ik2c2M6tRsnJv1IZgINAHlf0D7nWTORnooewn7ekcpMTgBLc0TcaPqVJlZ4qGic8n90C
         VuPf1uXQyq+CDfS0+8TRsJj6r8/YLvRAI8o2X13U6lzoOut0c1ktgtIeOWrxUqvRRRy9
         XFBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGCiTETXDcCRz0V7Y4RwCk8lM2ImxaHtHPMib3wblQdtpSBJtA5pCg8KTerDQB2BgFNGSSFNd3sY/hrRY6c1yc@lists.infradead.org
X-Gm-Message-State: AFuF++kEj21DKg+47bmvMLu7+2vrThijzzH//Ab/CZHfY9YUf105Mrnw
	tMhRg91WHmMKpz2KBMsYhtWos3u1V4u4bJgohUeXKLNlkcx9UsjPiphI
X-Gm-Gg: AYBFou3I94NcpWscMfzmkuFUXo5gQls+hBsfPCr0l4IWdJcVHlEqXU2DrVAiVTOVNkz
	+UTEcqUi4M3askpao9r/fLOC9nZj9Su8EJpFQ6qH8QAoeLqMyq4g4Cpl62QnOwd6auhZxf/Kbp9
	PcMbnny1F2RrfiQ6ygVuP1V8Eai++hJkYNtU6RXtA1xh37+PjDSGCxqc/SrITMOTKl9mAIZUPVV
	bio/0xsebkjmLTwu0ij59BltHuzQZB2rBo+eeP+wDNl9j8WYUfd6GZegtBkbDJ8goWNe7D1e3uK
	kIVGT1nLglWDf6Y26gwbFM9yy2cjhtYx1kSln7GNFQCv36ChEVW0rSKTQA66aeNddg5byMcUj/s
	1rmiSVyJYV5aBzFxhFoN0OiU5/qDxoO273khRuDR923XxsxicqnHXEQWNRo8jMyrWUN7vshZH4t
	i+9GRBAaEm+T9+adFMz8pBLmUrYlmjeaEhjqi9h55ulZXj6YmZMhJAFp25HCS95j3tW75xDrfOX
	SN38V8gwADMoTKmHVdhaNFDXCFY7OPr2lYBjIrmgaPvY6MZsJOIS4Q7szvDUrS1v/U1fihPuCxp
	ZMnZz+DInDfFuVAooCIZHMSaEVId4gA9QCjoP+674odhtqky2mV/SQFkUjUj3+FpIg0K91KFgw3
	h
X-Received: by 2002:a05:600c:8b17:b0:49c:fa20:cc0a with SMTP id 5b1f17b1804b1-49eb7339522mr57916485e9.33.1789627663778;
        Wed, 16 Sep 2026 23:47:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9dc6-c001-54ee-4741-4927-0a28.310.pool.telefonica.de. [2a02:3100:9dc6:c001:54ee:4741:4927:a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf438fbsm13129266f8f.36.2026.09.16.23.47.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Sep 2026 23:47:43 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: microchip: vcap: Stop selecting DEBUG_FS for KUnit tests
Date: Thu, 17 Sep 2026 08:47:36 +0200
Message-Id: <20260917064736.77354-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_234745_997534_B990E504 
X-CRM114-Status: GOOD (  11.93  )
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

VCAP_KUNIT_TEST enables DEBUG_FS even when the kernel configuration
leaves it disabled. Remove the selection, following the dependency rule
in Documentation/dev-tools/kunit/style.rst.

The debugfs implementation and its tests are already built only with
DEBUG_FS. The other VCAP tests can run without it.

Fixes: 552b7d131aa0 ("net: microchip: sparx5: Add VCAP debugfs KUNIT test")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Validation on net c9151088f167: x86_64 LLVM builds and QEMU runs
with DEBUG_FS disabled and enabled. The other VCAP suites pass in both
configurations. The debugfs suite is present only with DEBUG_FS=y and
all four cases pass.

 drivers/net/ethernet/microchip/vcap/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/vcap/Kconfig b/drivers/net/ethernet/microchip/vcap/Kconfig
index 97f43fd4473f..1af30a358a15 100644
--- a/drivers/net/ethernet/microchip/vcap/Kconfig
+++ b/drivers/net/ethernet/microchip/vcap/Kconfig
@@ -40,7 +40,6 @@ config VCAP_KUNIT_TEST
 	bool "KUnit test for VCAP library" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	depends on KUNIT=y && VCAP=y && y
-	select DEBUG_FS
 	default KUNIT_ALL_TESTS
 	help
 	  This builds unit tests for the VCAP library.

base-commit: c9151088f1674fd29ff26a20f5fc687acf53a2f0

