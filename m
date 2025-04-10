Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAABC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 08:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wqO2slsnh59nFq087C5rxGpjESWCJ50GtHK4rAF6Ko=; b=0/WLB3z2pW8KnSnUxZ2IqZ6fhd
	Cwj7NviAWbNNgV2tqnyBgX3Pg93ZYSCms4a0/toUwlpAaGg+EDPFdhIwndnJIBg9bT5FkYnLsBWCq
	qnoeKosYo5i23hHZoqBU2fibIY6pPjSKjBGKeVIWqG5K2dCOJ7pRzvsWBdfOfXuvw8mXIHBUTVzsd
	/+7OmgoGiGBTL3Twv7o0jqhoNbD1Tj8EiVK5mdvyP4fwl0PWu6onV4bUn/he0Ueq42B/IQgnH7iHl
	GYAmT1G5appB7BSMxbqs9sMfE6CriamU9T3t1xT2QlEA2HdD9rR+kOgKLnKWf/06soBdZgNVQmSOB
	m9hw9lcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nWh-00000009nXa-2WtE;
	Thu, 10 Apr 2025 08:44:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mws-00000009gBH-0lOk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 08:07:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04A6D1007;
	Thu, 10 Apr 2025 01:07:46 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0BF1E3F694;
	Thu, 10 Apr 2025 01:07:41 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com,
	huangxiaojia2@huawei.com,
	mark.rutland@arm.com,
	samuel.holland@sifive.com,
	palmer@rivosinc.com,
	charlie@rivosinc.com,
	thiago.bauermann@linaro.org,
	bgray@linux.ibm.com,
	tglx@linutronix.de,
	puranjay@kernel.org,
	david@redhat.com,
	yang@os.amperecomputing.com,
	mbenes@suse.cz,
	joel.granados@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nd@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v3 4/4] tools/kselftest: add MTE_STORE_ONLY feature hwcap test
Date: Thu, 10 Apr 2025 09:07:23 +0100
Message-Id: <20250410080723.953525-5-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410080723.953525-1-yeoreum.yun@arm.com>
References: <20250410080723.953525-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_010746_264958_9DD57A18 
X-CRM114-Status: UNSURE (   7.89  )
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

add MTE_STORE_ONLY feature hwcap test.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index a539eeb0bfc0..32385f67498e 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -1104,6 +1104,12 @@ static const struct hwcap_data {
 		.hwcap_bit = HWCAP3_MTE_FAR,
 		.cpuinfo = "mte_far",
 	},
+	{
+		.name = "MTE_STOREONLY",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_MTE_STORE_ONLY,
+		.cpuinfo = "mte_store_only",
+	},
 };

 typedef void (*sighandler_fn)(int, siginfo_t *, void *);
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


