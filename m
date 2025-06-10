Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDF3C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 17:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xDfYRyarrgvvh2wy//yUSDfOPipUMyzMYfOpAjRJTT4=; b=nOfYwjkCYkpRwuUzxyze4fB9V2
	mvHAmLL0ubGnkD21hiaRme/1cJ3uWjkSSnjcXQLcRgfqaI79bpBR9bW1yc+1KbwekZ1i1OD+v5vh8
	3t8/GEVIpB39WVENIMvqgNIGYZQhIhegddkt4VsTYgFm0AHpL4UhTE7iZS2sJsH9hzxREuAbQT88s
	jpzJTBCP5zI0O2UswiwWkuU7ced4cEnTXl2R+jTZOMPo+iKPKEAHTfSvUzfdYKBm1+EXKHdZr+dsh
	bVz4s3CHRt0WiUY1rgEXluTRn1NDW6TQv4mYpeQ3E7zK3/inCz8YI8aUZtccmDDOIoKv61zMKZoJA
	UgqrlD2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2sr-00000007eMS-170E;
	Tue, 10 Jun 2025 17:35:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP027-000000078So-0NgC
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 14:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=xDfYRyarrgvvh2wy//yUSDfOPipUMyzMYfOpAjRJTT4=; b=KnyCLf/2KtCCQ8qg8WSkzNr0M5
	ax12Y2e1wBjGPq5JgLNV29TDyCgCmozTXG3qWLU3MFcdhVFDNFkAaUw6UbRrngTW58mNgPX2hNc4Q
	t8p2H+6OAJcpdFdBXLQKWCeW/8xUCKFmMlX/3Kuh5glIm8M5eY0yaVHeyFbPLQa+wz/SppxGrzRsD
	B4Hqgby2nfCUk5zIys+Siv1nnSAVg2Wq0FVHb3c4zk9x+exg8rROZSTR1ju4K0kbJlfxrAl0gqZHe
	QCORXm4H4eRwnLjDvn1Ir8Hc46Qf79wXEXVWwUrHczsjxbh55i1v6hlta5D7visj04Ioz8tgvO6yo
	EWwWj2Dg==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP023-00000001sUl-0kzK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 14:32:58 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLEan013925;
	Tue, 10 Jun 2025 16:32:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=xDfYRyarrgvvh2wy//yUSD
	fOPipUMyzMYfOpAjRJTT4=; b=shhGGg9fg6nZp0bUBgZ6LA4w/T2bgVnrGKl7My
	Jcz/lZxX7qoPiLbSYEdRNYhZfUm+tCbcw4eiC9To21hJ8fGTou131GXJKLV4369I
	Qh2G0li0wZQhqJ/wKsDEHzf/nCedmOtH7cpFDmYV8Eh9MGQQQYSoJgLav3TcPBdx
	v4oh9cAiuDKx1PUyP3yFylItiVPrUQR75Qg0GQ/FfY5JmoC0gq/80aCaqR1KNtD5
	Dsiz06ANiJWCNuXoMINxlYLT0zYM+kT9u4hVTrZdUPlxzQgeviibbhfT8TnWTAqp
	vFbN7tSOD/H4k3mWGeg8zzJBYUHkcj5eNGjBgMDRDraVoj0Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cahmnmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 16:32:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 588874005F;
	Tue, 10 Jun 2025 16:31:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34C16B36E48;
	Tue, 10 Jun 2025 16:30:46 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 16:30:45 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v2 0/5] pinctrl: stm32: add irq affinity, RIF, module support
Date: Tue, 10 Jun 2025 16:30:37 +0200
Message-ID: <20250610143042.295376-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_153255_477669_4180D9A4 
X-CRM114-Status: GOOD (  11.16  )
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

This v2 is a subset of the v1, split-out to simplify the review.

This subset:
- adds support for irq affinity,
- adds support for Resource Isolation Framework (RIF),
- allows compile the driver as module,
- adds entry in MAINTAINERS for STM32 pinctrl,
- minor cleanups.

Please notice that the entry in MAINTAINERS already excludes the pinctrl
driver HDP that has a different maintainer but it's still under review in
https://lore.kernel.org/lkml/20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com/

Changes v1 -> v2 subset:
- rebased on v6.16-rc1,
- added include export.h required by v6.16-rc1,
- change in Kconfig to avoid default build on COMPILE_TEST,
- added entry in MAINTAINERS,
- Link to v1: https://lore.kernel.org/lkml/20241022155658.1647350-1-antonio.borneo@foss.st.com/


Antonio Borneo (3):
  pinctrl: stm32: Declare stm32_pmx_get_mode() as static
  pinctrl: stm32: Add RIF support for stm32mp257
  MAINTAINERS: Add entry for STM32 pinctrl drivers and documentation

Cheick Traore (1):
  pinctrl: stm32: Manage irq affinity settings

Stephane Danieau (1):
  pinctrl: stm32: Allow compile as module for stm32mp257

 MAINTAINERS                                |   8 ++
 arch/arm64/Kconfig.platforms               |   1 -
 drivers/pinctrl/stm32/Kconfig              |   6 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c      | 135 ++++++++++++++++++++-
 drivers/pinctrl/stm32/pinctrl-stm32.h      |  19 ++-
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c |  15 ++-
 6 files changed, 168 insertions(+), 16 deletions(-)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.34.1


