Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE39C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 15:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pJAee28q72qTBjZcGP6IMl+e1YIXch0GS+MmyHTBJTg=; b=jiuT4v3wy9BedONUpkvPONQp2S
	/ULVxdfP+cVu5xtdL/8Xm8Vz5iRunAZINlpgqNsUnZBpkCdHBhIG2KSG/FkrvE64+hXfjQlm7INgn
	7wXeNcKFVBnqFyz/mba2DCarSiSObbodeaO6OtGMAojtkm5UT7MtKCc0F/cAsFL5eDLgilpttAKSm
	Cyym1NgEwCNJ+NGiLLwreb9d6tl4aUGcHqA/ycRxWyVu29Zk/niG4kbc+2DWKGQpXKAYSjuCp2/fZ
	qzoycMhRECBdDiv8LTupDT/Fbaf8DUgi/kjr3AUBgxmKF8NVtaOZPQ6/pyBfzL5GlNwAwX4vdMUt8
	+yMQSxHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0cs-00000007F5k-46Ef;
	Tue, 10 Jun 2025 15:10:58 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyRL-00000006q97-3L9u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:50:57 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLDZr012939;
	Tue, 10 Jun 2025 14:50:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=pJAee28q72qTBjZcGP6IMl
	+e1YIXch0GS+MmyHTBJTg=; b=CNz98/qQnnuBxhV5Kdj2cMdL+uycW/qV2Hms1h
	eorEmBev9WP7jPcbcFDXsPIYPve9s14fQhgGE/jHulo6KeZxnr6fVArNtcNxetxQ
	9AqGhP+WUFAn6ut7ZvoxaHSufPT/Sf9ENU7o8m6yw7YXG++o8QnAzGcGxCTX/jLq
	69n74N/QxcBN0R7YZzEsd7n6duxGw42+4U7pQ5+KdsCYXn+HLVMTN52NJMa+kf+c
	xT6fUGTqb5ZV8VIvZ+3KVDA66d6Iww+iJjyEEVrnrzZUXM4YiWLZ6gy2IRD2C6/O
	PA/EPcnZTOqzJw+iNFpDu5Bo/TDkZzB0TenMNeaT9cNbDkpQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aumd9u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 14:50:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 64BEB40044;
	Tue, 10 Jun 2025 14:49:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7854AB35DBD;
	Tue, 10 Jun 2025 14:48:59 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:48:59 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andy Shevchenko
	<andy@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Jonathan Cameron <jic23@kernel.org>, Lee
 Jones <lee@kernel.org>,
        <linux-iio@vger.kernel.org>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Olivier Moysan
	<olivier.moysan@foss.st.com>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
Subject: [PATCH 0/5] STM32: Fix build warnings about export.h
Date: Tue, 10 Jun 2025 14:48:50 +0200
Message-ID: <20250610124855.269158-1-antonio.borneo@foss.st.com>
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
X-CRM114-CacheID: sfid-20250610_055056_122475_776D732C 
X-CRM114-Status: UNSURE (   6.70  )
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

This series fixes, for the SoC's STM32, the new warnings that
appear from v6.16-rc1 about mismatch between the include of
linux/export.h and the use of EXPORT_SYMBOL().

Antonio Borneo (5):
  bus: stm32_firewall: Fix build warnings about export.h
  iio: adc: stm32-dfsdm: Fix build warnings about export.h
  iio: trigger: stm32-timer: Fix build warnings about export.h
  iio: trigger: stm32-lptimer: Fix build warnings about export.h
  mfd: stm32-timers: Fix build warnings about export.h

 drivers/bus/stm32_firewall.c                | 1 +
 drivers/iio/adc/stm32-dfsdm-adc.c           | 1 +
 drivers/iio/adc/stm32-dfsdm-core.c          | 1 +
 drivers/iio/trigger/stm32-lptimer-trigger.c | 1 +
 drivers/iio/trigger/stm32-timer-trigger.c   | 1 +
 drivers/mfd/stm32-timers.c                  | 1 +
 6 files changed, 6 insertions(+)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.34.1


