Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A202C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 08:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RwQA9b/mWaVp+3r4CodO9CjopcR6rVnhFumfJnY0gE0=; b=GUpu6VroCPxcS4WEQd/ZtlNTau
	ubXBdUAsTbkLax57eaZSevCH4eA1C1y5VIcjWJZBwHkO+RrypZF8q1up5OteD9xSilItHLkCCRqKF
	BTl8pDMKJp9mZGM0++yQ0osJHqhb/MpYp9GSAaw/Kdazc7EBlyVqgEdXaaCtQLoz1PgnHgKZIqGQx
	QxlCBK4lOrDHJfAXpqAyAE2mF5q8zzLpwwDhd9+a+H2+YBTqlWFAVtb490pfi4qtQbJextb8up84L
	B7z6Jv6fWo1U5PKgdMPRlUOR3hiKN83vj8bO+CWXB+POMHRd4Ay6b/9T5IwKnU0LnojYXQ9EnXw0Q
	rPaBntJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txifJ-0000000ASrU-2zu7;
	Thu, 27 Mar 2025 08:32:41 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txid2-0000000ASWM-2hYC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 08:30:22 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5oYpX010674;
	Thu, 27 Mar 2025 09:30:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=RwQA9b/mWaVp+3r4CodO9C
	jopcR6rVnhFumfJnY0gE0=; b=h33hU/l4STScdpRVI9zvhixwzWwfXEZJVEOENO
	smat1YitnZ6UnS2mtrUyF5nL5sVArlpOIrWzRcZHSZksDK2dj8w4Mi5/U8ES9Mt3
	qcQnIoFj6fj3oktYTwC92EKiPvft/BpMeiNtztYd1xcUIOCKnsNOaivtgmfWYdi9
	RG4UrurOwopaOgOdKPPXdeFWfF9kuMQJfCrrRDMVDm7Z2A2aojsg1GV5ZJ/TgCC4
	im0p22kz1d+1YI2YsdKSpekXg1u7sqf/5srwtsAV8eVZzZ6/+YS9brKPSbmY1iZf
	0MR9GH3SCGmyBfVhCirUAKRbBG6A2ixlF22RUzPFLbXoCvEg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45mwrb2c4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:30:05 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 012A640096;
	Thu, 27 Mar 2025 09:28:58 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D6A28329EE;
	Thu, 27 Mar 2025 09:27:32 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 09:27:32 +0100
Received: from localhost (10.252.3.68) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 09:27:32 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 0/2] stm32-rproc: Add firmware-name DT property support
Date: Thu, 27 Mar 2025 09:27:19 +0100
Message-ID: <20250327082721.641278-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.3.68]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_013021_152462_45D63140 
X-CRM114-Status: UNSURE (   9.28  )
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

Add flexibility by supporting the optional "firmware-name" property.

This allows specifying in the device tree the firmware that needs to
be loaded on boot, if the "st,auto-boot" DT property is set.

Arnaud Pouliquen (2):
  dt-bindings: remoteproc: stm32-rproc: Add firmware-name property
  drivers: remoteproc: stm32_rproc: Allow to specify firmware default
    name

 .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml    | 4 ++++
 drivers/remoteproc/stm32_rproc.c                          | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)


base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
-- 
2.25.1


