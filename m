Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C21E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IBTkV7f3tHLL3a0/+LFUjq8XSR+FbJv2mVoRlaCf1rc=; b=HhhZtK5WfM0v5n
	aZpGO78zAwn+3Eu9+C+D25ql0UkHp9XlJFq6wKmJVqaBQYkwotDIqFNRZt3rI6xC7pyeM4y92qaCJ
	J2NFDB2kZyu7hs9nek/JGeRgShKxZh/VAqjLmayNi8/6yK2FRKH/rg/I/Lb3HeINmfvfeu6vtpnfn
	icv5TINWS1Q7OfnCLQu9aqGYpZwMMWCpDvMXo464OcXkk9T+MFRikAiRKzFsO1WymsANyYUY/0Bo8
	V70KmCL+SCRCr7wWEcXVpE580Ozy/XTyOgJiEGfY0TADZ2YOF/yp+Y6FulVSjWSW+NjYJ+KYQ0ux8
	0Dpd3YBn9RaIqOsJOSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGND-00000004XE6-0Et2;
	Mon, 13 Jan 2025 09:04:39 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGJ1-00000004VcH-0RDF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 09:00:21 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D5kEGo011711;
	Mon, 13 Jan 2025 10:00:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=IBTkV7f3tHLL3a0/+LFUjq
	8XSR+FbJv2mVoRlaCf1rc=; b=zB/xkpxP3y7ogr9OMuZMglx/AL5ur2pcsS3ggR
	P7ZlZyHRSXBjoPdh0ECDzpo80CxJvjS23OSX6rPNQPHx5y6gnNNNfJLZIwzf9Aqs
	mlrPGLRlV/KgvGA6guQkEKHuURhlvzT7k3BCO38fQW0iw5YN3o8tWAse3Zxk/kx0
	ihVMYbfhVQJjipl1a0F6/khTUQA4e8cp6WS4xXiscaO2WJbugRChmp2lwj4lRtsa
	C8Nyr+WHWTD6g+TAnYYKcFhCUcoJ0HKgA0WVPBcdb832T5EQ5lXJ0iZclZKKB8Ut
	RMORrVSMniExrWVEQY82CIrKSs2uJm5iu6MlSkgzccw8Uq5Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 444vyr0p8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 10:00:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 041934004F;
	Mon, 13 Jan 2025 09:59:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 49A4A231332;
	Mon, 13 Jan 2025 09:58:12 +0100 (CET)
Received: from localhost (10.129.178.39) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 13 Jan
 2025 09:58:11 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v3 0/9] media: stm32: csi / dcmipp corrections
Date: Mon, 13 Jan 2025 09:57:50 +0100
Message-ID: <20250113-csi_dcmipp_mp25_enhancements-v3-0-33b96744df46@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI7VhGcC/43NTQqDMBCG4atI1o1MosHYVe9RitRkrFnkB0ekR
 bx7o9BFV+3y/RieWRnh5JDYuVjZhIsjF0OO6lQwM97DA7mzuZkEWQspGm7IddZ4l1Lnk1Qdhnx
 m0GOYiesWAXEQbd0PLBNpwsE9D/56yz06muP0Or4tYl//hBfBgcu+rqQGZUVjL0MkKmkuTfRsp
 xf54RQI0D84mTlQGrRBBViLb27btjdkw5BjGQEAAA==
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
X-CRM114-CacheID: sfid-20250113_010019_440020_08EE549A 
X-CRM114-Status: UNSURE (   7.21  )
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

Various fixes within the stm32 csi bindings/drivers and
stm32 dcmipp driver.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Changes in v3:
- Add commit 'media: stm32: dcmipp: correct ret type in dcmipp_graph_notify_bound'
- Link to v2: https://lore.kernel.org/r/20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com

Changes in v2:
- Correct commit message within the dt-binding commit, related to
  removal of bus-type property from the example.
- Link to v1: https://lore.kernel.org/r/20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com

---
Alain Volmat (9):
      media: stm32: dcmipp: correct ret type in dcmipp_graph_notify_bound
      dt-bindings: media: clarify stm32 csi & simplify example
      media: stm32: csi: add missing pm_runtime_put on error
      media: stm32: csi: register subdev only at end of probe
      media: stm32: csi: use ARRAY_SIZE to search D-PHY table
      media: stm32: csi: simplify enable_streams error handling
      media: stm32: csi: remove useless fwnode_graph_get_endpoint call
      media: stm32: csi: correct unsigned or useless variable settings
      media: stm32: dcmipp: add has_csi2 & needs_mclk in match data

 .../bindings/media/st,stm32mp25-csi.yaml           |   5 +-
 drivers/media/platform/st/stm32/stm32-csi.c        | 102 +++++++++++----------
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  23 +++--
 3 files changed, 67 insertions(+), 63 deletions(-)
---
base-commit: d216d9cb4dd854ef0a2ec1701f403facb298af51
change-id: 20241217-csi_dcmipp_mp25_enhancements-89e0eef194bf

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>


