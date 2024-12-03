Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD01E74AC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 17:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LoV8E+YWhIydOLMEnE/SzJ/Hu5kN6Y7HhbbpbAHakYU=; b=mXOAQV88YGt2pn+9+OvSSBKJx3
	Wc7wVKMpocxXuVdW9OOxhg/ZSZTm252ryqfZDXqVvSp+K650EGn3XqxmFXRtKIM4JJciufKQmXcjV
	i7rIgDkxCmnsqJbsvLLLYsMJksBOjy6P9BW5AUcnk5KubtALlfDSROSVKjwpvrBilY0HU6mdBBpSH
	bZou8YAZotiB/Yp4AyV5kLP23RHEWXbU4Bt73bScjr5mrVzGB+pipSzthMaKPTjJWVDtJ/gj7Og5y
	fdJhuILx7/vCOlcB/TpTNT/J+AwvBXBCanJGGpk2fyhEbIBslEGeijeot0Vbq7+Ldb/Sa1kSIOuwB
	mNA1hEhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWvm-0000000AHX2-1Ikq;
	Tue, 03 Dec 2024 17:43:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWtQ-0000000AH3p-1sRO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Dec 2024 17:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=LoV8E+YWhIydOLMEnE/SzJ/Hu5kN6Y7HhbbpbAHakYU=; b=b3at+yQMveEXy057H97C5O8+CG
	x/kEAH5EfraKaVxgjW13gUAk6gI5VERQTZBi9QmGGnGhrovKOLTz2aWaicRfX2vLxLcEcqgp/DlIM
	f1x6Rw+TOdZx/htalV/GCMi1gAKnbMG3FhgYKD9d2g2V/a5lHUGJUSZ6zcKHqK4Mp9RmLS4z7Vonl
	SlIb5VHKTgSqujYB2Xrul5cU7QpbGU1VtlALFWn60Id/4PKCsQ2pZV7ABta9+cDJUMTANQM0UgnVl
	m6tlwEaJHSrxtol+BBTkqWEYoUv3Z6O2BK/VvGc8DbnDTS+7kBrc8IAmkjQBKe43xyUS8qEYRmEbh
	XNBfdXWQ==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWtN-00000002R9S-0XEG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 17:40:59 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3C077w008565;
	Tue, 3 Dec 2024 18:40:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=LoV8E+YWhIydOLMEnE/SzJ
	/Hu5kN6Y7HhbbpbAHakYU=; b=OVggdtwtNIMpzMGX4KSl6eJlFr2LntxkG6zVyr
	0r4Q8NChRpw/CQ8nHVYOZ/SnlN7y0S5ArnoprBOg0j28/E0vs4w/0XByqzm26svI
	hx7m859VAXu8DMW8NAsj5aA3TBiKwr6MlNtVfp61iQH2lAy8Gdk8++GGo4RJO1Oy
	HxUEtBEH4vr4+X9+SHd888tB5dSjBTvFzBjDeB22k/C9NdMxpUWRTzlJb3u9QNXL
	hbU1r9UPmowj3lSDq0/K5VTxIwifVH6yd1ROpGD9OVpxUwRFh/sjrxtmW4RYFj1a
	sgyJBWir0taA2W4IcR/XQlI9bqmplQEfEJSyWs2nx8ynOdrw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 437rq96b6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 18:40:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BB19D4004A;
	Tue,  3 Dec 2024 18:39:44 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A4772359C7;
	Tue,  3 Dec 2024 18:39:10 +0100 (CET)
Received: from localhost (10.48.86.128) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 3 Dec
 2024 18:39:10 +0100
From: Etienne Carriere <etienne.carriere@foss.st.com>
To: <linux-kernel@vger.kernel.org>
CC: Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi
	<cristian.marussi@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        Etienne
 Carriere <etienne.carriere@foss.st.com>
Subject: [PATCH v2 0/2] firmware: arm_scmi: unbound discrete rates, support round rate
Date: Tue, 3 Dec 2024 18:39:06 +0100
Message-ID: <20241203173908.3148794-1-etienne.carriere@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.128]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_174057_584524_CA157B8E 
X-CRM114-Status: GOOD (  10.86  )
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

These 2 patches propose to remove the limitation of 16 discrete rate max on
SCMI clocks and implements an effective round_rate operation on SCMI clocks
that provides non-linear possible rates.

The 1st patch removes a limitation on SCMI clocks that is not really needed
since the SCMI clock driver does not need to store the full list of
supported discrete rates but only require to store the min and max rate
values. This change was initially proposed in:
https://lore.kernel.org/lkml/20240729065306.1210733-1-etienne.carriere@foss.st.com/

The second patch implements a real round_rate operation that is needed for
example on STM32MP25 platforms for the video and the sound drivers that needs
to know the effective possible clock rates in order to select a compliant sample
clock frequency regarding the audio quality constraints.

STM32MP25 platforms also need the 1st patch of this series since many of the
audio clocks (SAIx and MDFx interfaces) and the LTDC video clock are provided
by SCMI clocks (CK_SCMI_FLEXGEN_x).

Etienne Carriere (2):
  firmware: arm_scmi: get only min/max clock rates
  firmware: arm_scmi: round rate bisecting in discrete rates

 drivers/clk/clk-scmi.c            |  21 ++-
 drivers/firmware/arm_scmi/clock.c | 205 +++++++++++++++++++++++++++++-
 include/linux/scmi_protocol.h     |   7 +-
 3 files changed, 220 insertions(+), 13 deletions(-)

-- 
2.25.1


