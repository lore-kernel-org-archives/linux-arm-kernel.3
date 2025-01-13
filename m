Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D32E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1bsQJ2ko4AQU0XqRWQ9Cw+Ol5kmhhV4BUyjb/RUyC4=; b=PzLG2LqjYv/yY3OfC5DHZUtKnV
	N/ikgNKplabsV5HuiTcwfot47eahbqtZmMQUazT7r2PnJVSByO9wecKJBaA4/r77w8N/iJAIKeHps
	vHHnNruDjZ/2ibuPZ5q9LZJylX/zv6UcMX01tD5uP4p0T0d9g/mTf5GEv8xhdeKnVeDxUdrIOWKU5
	0AqVIoIeMDcAIKg0MJyahKKnUjbne/wHcxc+/q7z1mc/2gpiVHtjaoOveZA/QAz7qxKPt/nc2gkAi
	xH9iTfRTnIh7sd+NHz/5yjzTMVL7swYjUTdVDRVyS3juKH36Wk4XGvxJ2YfpsyubVfS0vfj2/Z1ZK
	QX47D6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGQq-00000004XwQ-0iIj;
	Mon, 13 Jan 2025 09:08:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGJD-00000004VhZ-32dc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jan 2025 09:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=x1bsQJ2ko4AQU0XqRWQ9Cw+Ol5kmhhV4BUyjb/RUyC4=; b=BTyvPBqVeIbEj53aszszulnRTn
	8/7mL6jWSSunRQaTGPz9KzICEQ6D52wCLIE6A4nzYNTbi/o/ArFi5qKF0pSiFYR1NYZJV5vy/JAFP
	0Psad5VElmhxGVs0LdGRn77gd1PYcwZ9YPtDaYgWuB7mAK3B4nBsjmGGOwvHaKABAeG7wp2R+FxmC
	omPyVTPMPc5tKysB75sh42ZSJOUlfePUyBF9ufFA4ludxSK7Id80WQNHQNfXW9undZjLzMp8FE4+8
	ohSmGwtWy0uR5Y/kzRohJm8P3u4pCCyhvpJf3Tyzflwst5gQ18m9xA15Tem0jidF2oPw0e4s7KD/e
	K3R8AoKw==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGJ3-0000000AGnm-3Jw1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 09:00:30 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D4YHlO013631;
	Mon, 13 Jan 2025 10:00:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	x1bsQJ2ko4AQU0XqRWQ9Cw+Ol5kmhhV4BUyjb/RUyC4=; b=b8BsM6Ok6jYdInrN
	w6/pCLSsiIkv/aup8BIx6Hr7DpjGaV3I/bvm1faZ76tvT8PqFZ8ExTDPXNUzsxRS
	M1bEckrEQ+1+UuQf6mSbL4aD4YfItBg6S2HCmxM8XCdNjGgM7vzZ6f2QGSwmatL8
	9P+M+R3ZSqKUcH6I+tQwubR0Ztzx/t1aN3FpKMXb/0H/Ygi5tag7FMyGVQxnkDPY
	136svFCb3rR0YcDTUDxKPy15w5ISO/zHw5JnJwV12wvW4qPyNUgP5TFLACJR11Rj
	dHUCl1zyBvSGgMLZDfzx2lYED0lFWwgxH1qdTtRcCDXGZmnpD7Wseum9LiGrxad3
	jpzgAg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4444fmub4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 10:00:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4F8664004A;
	Mon, 13 Jan 2025 09:59:01 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E028B23456A;
	Mon, 13 Jan 2025 09:58:12 +0100 (CET)
Received: from localhost (10.129.178.39) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 13 Jan
 2025 09:58:12 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 13 Jan 2025 09:57:51 +0100
Subject: [PATCH v3 1/9] media: stm32: dcmipp: correct ret type in
 dcmipp_graph_notify_bound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-csi_dcmipp_mp25_enhancements-v3-1-33b96744df46@foss.st.com>
References: <20250113-csi_dcmipp_mp25_enhancements-v3-0-33b96744df46@foss.st.com>
In-Reply-To: <20250113-csi_dcmipp_mp25_enhancements-v3-0-33b96744df46@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.1
X-Originating-IP: [10.129.178.39]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_090022_575141_6F8751B9 
X-CRM114-Status: GOOD (  12.32  )
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

The ret variable used within the function dcmipp_graph_notify_bound is
wrongly defined as unsigned int while it can also be signed.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 71acf539e1f3..5a04018a6a9d 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -296,7 +296,7 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
 				     struct v4l2_async_connection *asd)
 {
 	struct dcmipp_device *dcmipp = notifier_to_dcmipp(notifier);
-	unsigned int ret;
+	int ret;
 	int src_pad, i;
 	struct dcmipp_ent_device *sink;
 	struct v4l2_fwnode_endpoint vep = { 0 };

-- 
2.34.1


