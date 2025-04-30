Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF6CC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 16:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MhBfo7eW4dxLckU5s8+ke5Fpqegf0jPSqbK3MOKU29Q=; b=AHCO4xTN9LmuZeinf27sa/bj4z
	teOmSRcsci1Ag4uLkv2UFAxORzyTYTbp5041YnerlbE6dRa4nJe0+TPYqcT7Qwm5Xyv46pci+qLXC
	gBo32XKsiZNapXoqoGKXLZayVKFvrzvMzukbkICll3or8T9F8O5LUP41iFAGCrBlYFZjiwK+YfM9A
	JdwGOixdPHcHNfDFEXl+p2zdvemtPZaxsLVM9RbB4brPVv0OaOTHFJMw98rhM2mNxtOt5wvoD4dLy
	lTVoTnvfLuswLQLkKadsDRuD8+r0qe3gLjgP8F2tFSYqTwweVkN3KTr0Z5nL9CHlCeKcVF/jBHqwu
	tsehKB4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAkO-0000000DUyu-1aF3;
	Wed, 30 Apr 2025 16:57:24 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAiR-0000000DUUe-2seH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 16:55:25 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UCaS5U026622;
	Wed, 30 Apr 2025 18:55:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=MhBfo7eW4dxLckU5s8+ke5
	Fpqegf0jPSqbK3MOKU29Q=; b=NCfYOGMz5X9nMwLbWjzVS31qOr8Z2+1AdGQR6q
	h7up/wVVu1XxDn9u/a+LRSuX4yjqorb3uh0ZJyvn/2VekCCkt6/DhVyoi8gVU7sj
	1U13FXL9vsQX7nc2SYo7g2HSBjMmA26P0+4tyLNQ9X7WCCXUP7O9T3kVQy4fNUji
	e6uualePudYLvZLmhf6mutWzVgd1yI4q20s3heD71CRHeqw45c0QLmUIJI2QmGBE
	/UQ1ZjXU+PP7dV02Eo1ykAfttcnURxRiRn0YNEWw+NAtS2sGg9aWWBfo5S8cFC7L
	nZBzV4AQWCUkh8MwiG1W7uYvx9QZwjF+P0hcxBwKKtov5eWg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tmv84t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 18:55:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BB1B04004B;
	Wed, 30 Apr 2025 18:54:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E99FDA476FE;
	Wed, 30 Apr 2025 18:53:28 +0200 (CEST)
Received: from localhost (10.252.20.195) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 18:53:28 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>
CC: <linux-sound@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] ASoC: stm32: sai: fix kernel rate configuration
Date: Wed, 30 Apr 2025 18:52:07 +0200
Message-ID: <20250430165210.321273-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.20.195]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_05,2025-04-24_02,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_095524_228773_AD49AC6E 
X-CRM114-Status: UNSURE (   8.10  )
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

This patchset adds some checks on kernel minimum rate requirements.
This avoids potential clock rate misconfiguration, when setting the
kernel frequency on STM32MP2 SoCs.

Olivier Moysan (2):
  ASoC: stm32: sai: skip useless iterations on kernel rate loop
  ASoC: stm32: sai: add a check on minimal kernel frequency

 sound/soc/stm/stm32_sai_sub.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)


base-commit: a9bfaf85aaf2dabf541eb7a4895db025d6d8eb1c
-- 
2.25.1


