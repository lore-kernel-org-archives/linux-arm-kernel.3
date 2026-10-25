Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A57606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 06:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qRbdy5MS;
	dkim=pass (2048-bit key, unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=A0lsAGtp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A9bl18hVVgrv7Ih87a3z0Wf/fVitBdQUFLUywp64nL8=; b=qRbdy5MSmj9i9toYKacC1LmuRK
	O9dF5QSL6FUGwi4V2tGfFDjCo32fWmb9Gwb6LXDM5UZQXslOu2CLdJs9noBX7ypN6W0+IqbZG+P4P
	LtBOEkNmXywrj7mV/4QLjZ6vpMT8jjlwbq/Z5jUJkbTJGKuJ7k5LnP72x0HnhQP86OqpnFXCPulCT
	VcoBwOMvO7Nwu4pjwK+JPl/C/A9hhB3IXUQXa80keVqLJhghPBXaa3bJ/2lqimBgstwvKornnDnrZ
	8dlHwSIRY3QEo8C0kFZrr7dH04Ivc90ZrAS+piTlewpViaDK+drOnniq14AaWVWMRIJDlPfEPqF+m
	pe5Yun+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrte-00000000ntl-1Nfo;
	Sun, 25 Oct 2026 06:39:58 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrtE-00000000njA-2d0U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 06:39:34 +0000
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P4sXJ33859554;
	Sat, 24 Oct 2026 23:39:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=A9bl18hVVgrv7Ih87a3z0Wf/fVitBdQUFLUyw
	p64nL8=; b=A0lsAGtpStmQ1294rM06fJ+MxdROxNzf/Mo+bMXu64inGXv+6Ffm7
	57kzSfGSUJ4uUQZEur3KSkn/DZBlmuDZb+IF+RohCP3SJDywSKRdijyIfDiUOLtE
	Cs6pr1SCvVzouhZ7tQfJZnoo+hnqc8TjL96EQG6edGZ5TgIVDguPFzzjkzp244Bu
	PG4i2pwdwHFVmK2uvcU+PoNhNapYsvpCgG0njiqKAleMEAHvlL646QxjYbo2c2s1
	zPdIVeW2zRpqArxmXmBxnHM0k7OfH59mLlyFkvMM2E4/nIaVDapSAZU1RoJb4DJT
	QGiet8SfuK0h0TbE+4Ck1LcGbg1iYJJ2g==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hh7ucrreq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Oct 2026 23:39:17 -0700 (PDT)
Received: from localhost (2620:10d:c085:108::150d) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Sun, 25 Oct
 2026 06:39:16 +0000
From: Amir Ayupov <aaupov@fb.com>
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel
 Pereira <danielmaraboo@gmail.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/7] coresight: syscfg: Remove unused CS_CFG_MATCH_INST_ANY
Date: Sat, 24 Oct 2026 23:39:04 -0700
Message-ID: <52b3c337cbf4a8460e399b084c6f854eb3beee89.1792907333.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1792907332.git.aaupov@fb.com>
References: <20261012230527.750567-1-aaupov@fb.com> <cover.1792907332.git.aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: g_WBa0SmE3mzO0U886MCEDuPOY2yTsXa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAyNiBTYWx0ZWRfXwQs66oe6ZWXq
 smMs4APL3u0kQC9IiDPyBrrPlhnz8UlJUZWTvaE9Rw7EpaeWnxtMAOexkQbelpQF+N6soVbtv14
 d89xy9N7AAf0z7Y0WywG2eFuFwj2Hu1TUWnh67xibC70UKfLZ/4s2DZUkxY+9i4Y9A734RXTr6+
 9O235KYJpUu5IJx44lJVHVnE765NPT0DGGxqbPTSO8LR7d46yi0xdGlZ8HKU+/C61ZJJ5BLc9yk
 puYKS+gSORFhEpdSwxuZ9RqA19v8QJeQfWBsQEf14D8FuGQe3UK8GGwy63J+gZyy2S2AmmCKrzi
 zpmVn5MYjU1FRQZnaKRuw/JlEGEXNCD0Zj50MpSEFZmHfOugvoT4nzijkzZ6PHm9XaNuvRqYece
 ARh4+NrBKLuXnNrdPv/uQzAoX7d8zChjqqOA6+E2WgJN2THZ+Zn4yLTLWXirVvXINDJifu0jHdB
 J4v5BW6+V/ACihABQ5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAyNiBTYWx0ZWRfX/4NY1D4MmO64
 aN458k/vJX8OGffSUERlI2brIgQl53efnreTDYsw6QJjRIukBUFqngep2aFqQ+ka4bnGInCFoRF
 Gi27a1G4PTsLOshp9LSo/65jIpuJTQw=
X-Proofpoint-ORIG-GUID: g_WBa0SmE3mzO0U886MCEDuPOY2yTsXa
X-Authority-Analysis: v=2.4 cv=SN3Xx+vH c=1 sm=1 tr=0 ts=6adda415 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=jCddH8ec0KUNCymVuxII:22 a=7CQSdrXTAAAA:8 a=FOH2dFAWAAAA:8
 a=izEjV56Hqa_c8yfQj7cA:9 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_02,2026-10-21_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_233932_785843_3AE2B8DE 
X-CRM114-Status: GOOD (  11.95  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CS_CFG_MATCH_INST_ANY has been defined since the system configuration was
introduced but is not used by any configuration, feature or device.
Remove it.

Suggested-by: Leo Yan <leo.yan@arm.com>
Assisted-by: Devmate:Opus-5.5
Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 drivers/hwtracing/coresight/coresight-config.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
index f04e73b91d9a6..220bc54f8e5e1 100644
--- a/drivers/hwtracing/coresight/coresight-config.h
+++ b/drivers/hwtracing/coresight/coresight-config.h
@@ -39,9 +39,6 @@
  */
 #define CS_CFG_MATCH_CAP_MASK		GENMASK_U32(15, 8)
 
-/* flags defining device instance matching - used in config match desc data. */
-#define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
-
 /*
  * Limit number of presets in a configuration
  * This is related to the number of bits (4) we use to select the preset on
-- 
2.52.0


