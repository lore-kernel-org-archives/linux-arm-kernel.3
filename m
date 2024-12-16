Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5895E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u5wGE5wijHPgCUYNBXHSukVMCuhvYNDhcscMJnWi4EI=; b=0C25NFKYUozCyw82lO9pCsV7NP
	jgr1IlUpbHNnl8M6FEXq8PGK/zLFcVPqzKHUHQ5+J2kdh+zS6Q8hegqGCS7F3MoHNHfYm4KTSubjR
	wlU3CmaropV1ixevnO3jJySXOpd02CTxpv+n2WTyoPmUYLNfNqCqkMKgbNRVDHLhTpn33rbYyRKdB
	9A9yfe2pFonCvM7Cwx32Zo8D3VqtXEY/SbNTEK6XbBHMLhcI8q/rRiwxuHq9fLMf8jt7mksls/bNj
	nmbhMFVN0MVuYiR/oly4O9xEXj62trycL1e5LIgG1dydS1M2wt6RhD6mXAUO3kiSbYRu1xs3KC1wB
	ywZUugEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDFU-0000000ASIs-363X;
	Mon, 16 Dec 2024 15:43:08 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDDD-0000000ARee-2uNb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:40:49 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGEYBor024315;
	Mon, 16 Dec 2024 16:40:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=u5wGE5wijHPgCUYNBXHSuk
	VMCuhvYNDhcscMJnWi4EI=; b=wDnQ/1e9NzRlJAEmmolrW6ZfzCwN5bhKfft1Ma
	HToVJAVUpNZSsw6/W3NtPZUSSdIBgeGQ1/S+t/Te6jQ7X3W0U23rJWJ6HR2RrGa1
	2xJI1QYNVTAg8lPQbWhzr+z3uwfu8b4kJEJFKGHSW2hKEBopC2VMmHSA9vdh8Qn4
	m5o1yNCDe+akkZc63m7wpZgZHyzT3WImJCVjoNtyJuPi8R1c4zfEIJwKrUvkkMWn
	s7u6ucNOtzACQMkWpIuBFkWkkl98QVNSOkxEisil+qIUtQkJ1SWhHw4Ca05Br4dQ
	g0riPTWuwuCyZvIjcf9RkVDQyG6oF+bY4jULKYmAd7sx1Saw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43jp3887bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 16:40:42 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8130440048;
	Mon, 16 Dec 2024 16:39:47 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6BECB277BE6;
	Mon, 16 Dec 2024 16:39:19 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 16 Dec
 2024 16:39:19 +0100
Received: from localhost (10.252.30.129) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 16 Dec
 2024 16:39:18 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <alexandre.torgue@foss.st.com>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <fabrice.gasnier@foss.st.com>, <olivier.moysan@foss.st.com>
Subject: [PATCH 0/5] ARM: dts: stm32: add counter nodes on stm32mp13 and stm32mp15
Date: Mon, 16 Dec 2024 16:39:03 +0100
Message-ID: <20241216153908.3069548-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.30.129]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_074048_036026_E3E4FA40 
X-CRM114-Status: UNSURE (   6.38  )
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

Counter driver originally had support limited to quadrature interface
and simple counter. It has been improved[1], so populate and enable
stm32 timer counter nodes on stm32mp13 and stm32mp15.

[1] https://lore.kernel.org/linux-arm-kernel/20240307133306.383045-1-fabrice.gasnier@foss.st.com/

Fabrice Gasnier (5):
  ARM: dts: stm32: populate all timer counter nodes on stm32mp13
  ARM: dts: stm32: populate all timer counter nodes on stm32mp15
  ARM: dts: stm32: add counter subnodes on stm32mp135f-dk
  ARM: dts: stm32: add counter subnodes on stm32mp157c-ev1
  ARM: dts: stm32: add counter subnodes on stm32mp157 dk boards

 arch/arm/boot/dts/st/stm32mp131.dtsi      | 40 ++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts   | 12 +++++++
 arch/arm/boot/dts/st/stm32mp151.dtsi      | 41 +++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts  |  9 +++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 18 ++++++++++
 5 files changed, 120 insertions(+)

-- 
2.25.1


