Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82C8606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 05:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v59ZWaLD;
	dkim=pass (2048-bit key, unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=f5vTNBuD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A9bl18hVVgrv7Ih87a3z0Wf/fVitBdQUFLUywp64nL8=; b=v59ZWaLDHXasGic12/fBKqqvy5
	WVquPRM5Zv+upZdPnx+uFZSLsB1oNnO5LPBv/sTE4y40d7z1InMXRGw9s+5ZkXn/oLYFGQIWI5Dup
	wDB26p8hL7FsdQUVYt78qvUe0afcnOc5C40saOpdxXGUR0mYxu+jyZ3oNC7LT/Y2AMxAxIcnprTdr
	HWYCsp1brGqRcP8MWHJenRJAPajBCeUJHITpG7r675EI7UYQzwqQH2Y24BdLy3QKaWfMb2/E5BPKU
	eNWbw9i71p27x38KBe2ByFGQ3LJiBMlz/ODvBKy21Uu2A4eLuwUehdrZWFT/wwbpV6utg6jUWZ3sl
	WHGmPVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDa5-00000001kzj-3EWq;
	Mon, 26 Oct 2026 05:49:13 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDZh-00000001kro-1zol
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 05:48:50 +0000
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q38wAL2861008;
	Sun, 25 Oct 2026 22:48:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=A9bl18hVVgrv7Ih87a3z0Wf/fVitBdQUFLUyw
	p64nL8=; b=f5vTNBuD0MxMQjl00dAgjBxKRjB0ahl/o41lNuiuxOhvrMUv5GReQ
	KYjiHWMHOSm5kJSaOLI7fvSXprxuclHkG6ZgW2AuFhNZrZRdNEKbJ8gjFXw1e6H4
	vp8pv0N2tHg5krV8N1JILztRIQgcR5FPNfp0BsgZ2ekBfXbSnTXMvJL/7QPCDrt9
	dhG9f3v8TMZ+oJklJrV7H7PLBu+5bcgY4oSewHXy2cuTwFcijW4baxUMX4VbTH+/
	Lt/CK2qr3+45Tos52LPp/+tKxd3n/WFJtnVreQJzQtzqpA82W8ZlTF3e5WhKHOWR
	JNcxxiLfoulysv4TdCVICDrl66j0VRcfg==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hgtg6exqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 25 Oct 2026 22:48:34 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1c::11) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 26 Oct
 2026 05:48:33 +0000
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
Subject: [PATCH v4 4/7] coresight: syscfg: Remove unused CS_CFG_MATCH_INST_ANY
Date: Sun, 25 Oct 2026 22:48:24 -0700
Message-ID: <52b3c337cbf4a8460e399b084c6f854eb3beee89.1792989860.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1792989860.git.aaupov@fb.com>
References: <cover.1792907332.git.aaupov@fb.com> <cover.1792989860.git.aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: i8xt5jn8lp9NkcowSxGYUivne0NqIKOl
X-Proofpoint-ORIG-GUID: i8xt5jn8lp9NkcowSxGYUivne0NqIKOl
X-Authority-Analysis: v=2.4 cv=OJqyTiaB c=1 sm=1 tr=0 ts=6adee9b2 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=wpfVPzegXHpEFt3DAXn9:22 a=7CQSdrXTAAAA:8 a=FOH2dFAWAAAA:8
 a=izEjV56Hqa_c8yfQj7cA:9 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMiBTYWx0ZWRfX+6yW8JK4MQTW
 s8/TWcxLAyJHpRDMHviN9BpSkY6uApI4fPTM4wSkTU2cHmo+VDmIk3uxooUm6BRlkbgQAYnnSDM
 bf3qJe43nsdnDDfRAMMzHtBxcZvaccMSFOBPar9Qb6liiWX+39u6XquRsLJwwSWFHvMSD4OBYi4
 rsFhyL2QvNKU3wljsPmh6RRS9WwofiE3KW0Vki8X2vOodRe+KuxLZgbHmzp2NKLVTyZyyJCYqTT
 drG+7YTmilI6oNzflQJkj4fFdO6JLOFiaciwDOPMt4A5HHNU8uSqqlmdvwaEECjRJcVHQXreIDy
 7QLGUl0JFVl0PIECr8mj7ZatWWQA4d7N1cbsjvf+ovFayImI/zmn5rXF/4bBXP5m/uoh7bJPZLA
 zYB73uURN6z2jXLfsEUL7XKSsZl13uwwYTHnFq3nQoLnbzQ8EbFzPNt+G8bL44MCCXX9MYHiTQl
 kE97ZtaHAi4ARGJVQEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMiBTYWx0ZWRfX4gbY4byeAoIK
 0h0aqKQNhfc8zzyklj+ggArzFFDh41PwA2BfUYss2rlpk6/jRIlKqjRnNTsv9v22dZ94vu0H+qU
 KaS1tjl1ufP09DTG8VG2Hmneon6B+H8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_224849_642762_1674E384 
X-CRM114-Status: GOOD (  11.99  )
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


