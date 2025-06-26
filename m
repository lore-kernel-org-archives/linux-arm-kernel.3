Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B97C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 21:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0rlrS+BB1a4km1rs1/r4Dwn4U0O9ETz8kgdC8TDIbZQ=; b=uxoBzHmgAH+eeV
	8tRNQh41DdNB098NlyM8MS3GBFEB1q90D62INGmxugDjocJVbFDXcwTiBCktOQ8JJqTkh2eR7oTvC
	tPZbhN2GvQF3hJXPAtOeMRIBppCiaIW8MwIlJAxAtlbTortmC+EI8jXJuwrixaaalIQywsdFD8JRG
	XUXdAmnjTcUiDDDI9Pz9xhZWMlI0tFb7jMMs8pVGq58oYIlclsWhvHs6c4eKKe3iDgsTmzxtnz1m+
	k64yWTSbRCOiwAaaaYdYOfjlqSNejdI9w8NHajMxRJiIu2OZcu31Fei7n1MTi9dgTikAtUR+ntve3
	6ZCbdKwTvJht2zug6OBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUu07-0000000Cogt-3t7m;
	Thu, 26 Jun 2025 21:19:20 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUscR-0000000CeA8-09WT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:50:48 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QFvBVk009049;
	Thu, 26 Jun 2025 21:50:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=0rlrS+BB1a4km1rs1/r4Dw
	n4U0O9ETz8kgdC8TDIbZQ=; b=vwbBIqqEhkvE27+fHaTNvB/Iz87u32du8q760f
	PLT5XZro5KM4JHJ0APaB2G7nR76CDXTW5zBdeAOwD4Rh41X8MaQR1ytK6a9iOM+p
	73eBWGv8UlOWZJEcxtC/QLmtbLBEpFXdCuqaC+GaLZsa0WQP/IFTqnaLQQC5Jecz
	HqvgUP0gxrqxuGaesLQHfR2cEoPrVyjy4ARKDsuwyKpgNXu6PkQ1edV9zfm2M8ZW
	qBjYQrhwjGE/6aGd76vLMO199DlmqyO4K1wDg9fnNGtNVc0tNlbHqhMXsKmWm//n
	6EOC7lsgouKMJaYMjbPoPoUlQk4TOeA3gRl7Yn7hbMocAkZQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dm33ruyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 21:50:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F3D7040044;
	Thu, 26 Jun 2025 21:49:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E0CE8BD23A2;
	Thu, 26 Jun 2025 21:48:41 +0200 (CEST)
Received: from localhost (10.252.1.90) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 21:48:40 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: [PATCH RFC 0/2] Introduce ddr[3-4]-channel binding
Date: Thu, 26 Jun 2025 21:48:33 +0200
Message-ID: <20250626-ddr-bindings-v1-0-cae30933c54c@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABGkXWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMz3ZSUIt2kzLyUzLz0Yt2UpFQj46TktFQjS0sloJaCotS0zAqwcdF
 KQW7OSrG1tQDB4daQYwAAAA==
X-Change-ID: 20250626-ddr-bindings-dbe23bcfe299
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Mark
 Rutland <mark.rutland@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.1.90]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_125047_581203_BF0AF506 
X-CRM114-Status: UNSURE (   9.65  )
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

This series aims to request comments for the ddr-channel binding as I'll
need them for the stm32-ddr-pmu driver.
The V1 of the driver and a start of discussion can be found here:
https://lore.kernel.org/r/20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com

The first patch contains a base of binding, which I find sufficient for
my needs but perhaps you'll have suggestion for addition or rework as this is
mainly inspirate from lpddrX-channel binding.
As we can find the same property in the two channel binding maybe this can be
shared properties.

The second patch, that contains stm32-ddr-pmu binding, aims to provide an
example of usage of this ddr-channel bindings.
Note the "memory-channel" property which I mainly want to discuss about
and gather some feedbacks.

For your knowledge, the stm32-ddr-pmu driver (DDRPERFM peripheral) needs
the dram type information for its internal working with ddr events.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
Clément Le Goffic (2):
      dt-bindings: memory: add jedec,ddr[3-4]-channel binding
      dt-bindings: perf: stm32: introduce DDRPERFM dt-bindings

 .../memory-controllers/ddr/jedec,ddr-channel.yaml  | 53 +++++++++++++
 .../devicetree/bindings/perf/st,stm32-ddr-pmu.yaml | 90 ++++++++++++++++++++++
 2 files changed, 143 insertions(+)
---
base-commit: e34a79b96ab9d49ed8b605fee11099cf3efbb428
change-id: 20250626-ddr-bindings-dbe23bcfe299

Best regards,
-- 
Clément Le Goffic <clement.legoffic@foss.st.com>


