Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E29DC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 08:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hAJu0kdEpj3Z9zT+qLxNZnnpfIMphhCV7QLcQTbwNUM=; b=VIow/JSx5NmvNJG/EpO8FDCA2k
	ncorf/l2Hm+shVTEjJ/5l8wjZd9UHf6MdHd135qdvnTXszmZN1fy35EC+7/1GLi4TYVPtAN/M15qu
	CJuG8M1M69LGrNDsOcNrzsMASEc8fz4UVZokVIHgmbhWEP+N17UT7jA6CvyXd21oq0gkEMcTVsvp3
	tlOMIGWe27BWqpJylMmNgJyAlYoWUMaQ5TvQ5G6TEY207tcYYweuM4tZtrWeBRqotrMQjduH3gddC
	Nwxaf2pdDa+nDroaS/XT83hoolrtDsVn2B/VBDUvrnTEbabukYRWIGFEjUJrof2haretaP0tehCm1
	VlfQRtFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMR0-00000007xUz-0Gb2;
	Wed, 26 Mar 2025 08:48:26 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMLu-00000007wmH-2ufY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 08:43:12 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q8R0E7020083;
	Wed, 26 Mar 2025 09:42:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=hAJu0kdEpj3Z9zT+qLxNZn
	npfIMphhCV7QLcQTbwNUM=; b=J8Dtg6pmvhuECRvoHhoHnqlFiH1NWuvQEt+p56
	fwnlYMh7vnreS690X/P4lUsCjB5UtyD5PNaLJyNezb1BoeIP52sLpBlcXQRQuXTG
	64DcznkJqhSUKPAPdzIUlidew4n6HLZxfjYBoTdtrhCg8MaVexfSDD3L8oepicg6
	rTXEJaJD2uIxKk4FrxXQKSKgSxTowKJwbsFbpoJrfxrPfvmRxMfIGk1hSeC4yre6
	kJfIoo5XfdlFC7LzvzwMyPo0PBuIlCj+Uu5rakrGKt1WfZmD4q473sVzGEtBkDJx
	ihbPjK6IlIEu3XfUGJo48/Cg1aOVRPmvsdJv4vOTK2VAqStg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45me348488-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 09:42:49 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A145440058;
	Wed, 26 Mar 2025 09:41:50 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4728787F421;
	Wed, 26 Mar 2025 09:40:01 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 09:40:01 +0100
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 09:40:00 +0100
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
Subject: [PATCH 0/2] stm32-rproc: Add firmware-name DT property support
Date: Wed, 26 Mar 2025 09:39:10 +0100
Message-ID: <20250326083912.12714-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_02,2025-03-26_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_014311_021673_0D221B80 
X-CRM114-Status: UNSURE (   9.20  )
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

 .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml    | 5 +++++
 drivers/remoteproc/stm32_rproc.c                          | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)


base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
-- 
2.25.1


