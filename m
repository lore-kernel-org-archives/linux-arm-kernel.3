Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D324C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 17:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1YjJZ+rVA0yqOXQO5b73/Moyy7cIi0WrLG+x3W7mq0=; b=J9lS0E16PDCfgc57RwXq0sxec1
	DgN7lM8MXSW0LLhGOp7GK9p95OQSC0yrSS64OYa1FGMrPvB+m8Plx+2h1kDCpCQE1qkEaXXlZMLkm
	Qg1djw0j6LhPWdFuxlZtUu7m7EXLxA6CkO8IZmlzY0NzG5VaCc9Sr9l+/JbZkyk2oLiXfuBw3mqzK
	p2IwiuTdbNJzKvnN0y8IF3B39ixu+GrpA471mwW47ak+iKle6T9LC+wt7Wvkg+T05O6dOb8CHDytR
	V+dq4iQKQ/ohoNdtY4ot6Ufglh7P/E+w1QapbjRqLPLKYJujQy4cTmBTHrDVUhD5AzHcaV1pQrTIe
	0XiNyjYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2iM-00000007cIs-0vnB;
	Tue, 10 Jun 2025 17:24:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP025-000000078ST-2bDh
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 14:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=f1YjJZ+rVA0yqOXQO5b73/Moyy7cIi0WrLG+x3W7mq0=; b=eJOqOs/T+IoIyk0N56BcR0EIkp
	MZ3AGdftcc8h8xzsXdovr0FfYI86dKMkKTgiG2h6eCJbpDmaK+PwhXluoS2tU8cyspeZg8T/XRaAL
	2PnW3w3WvZI6/FjuYuZvdOU8mCja09h5suY0x/b/CFJTC1r70KXhb6aN99bj9aQqSd6jzQ4UyJG7K
	K/pC5g1KDMeMpJk6FJK2UX7L4nY00+KewIqxsquC3rRSty78Lwh1q3x6OzVE5gweTOoxdkyZ0/vxB
	6++C7Md1EirnER2uu1tp+IktNQm+KLne/II6gacEGNUgoDpqH1rokKPBl2urTF6IwyODdbdXPVkyC
	wSG+k18w==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP023-00000001sUk-0QnD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 14:32:57 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLD46020329;
	Tue, 10 Jun 2025 16:32:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	f1YjJZ+rVA0yqOXQO5b73/Moyy7cIi0WrLG+x3W7mq0=; b=nfTY66zaPBEo3liu
	PuSm0b9RxZfTywjshCTMt5PTCY+GpD03ftSvm6NXO8SXRx6GtGaB7z3aN0ZiX2hH
	BmtFQ6XNZcqe7cDvCGlENwyl5QA1iJfpm9hSQp98nao+8g0LBGrNp2ed++04vh4F
	wzXihVJE2Ns3NFK87mklPXKiCd/iLVGN1ftd9bs3Rfn2WwM1B5W8jTkmD7XB9QLz
	k+q0kPgKzaF9gmPz6k4YzmUJpYXaLqwEJ69SshDlGswediR0A3bocuVnIN4Khtqa
	U44YNeFTBquxtMIuTsj7POHlA3ok9EBhN6zY7t3ltRM+dBOOO5RN0M8CAjVYEAXc
	K2EDNA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aja4vty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 16:32:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5820A40061;
	Tue, 10 Jun 2025 16:31:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4F686B37BF4;
	Tue, 10 Jun 2025 16:30:47 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 16:30:47 +0200
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
        <linux-stm32@st-md-mailman.stormreply.com>,
        Cheick Traore
	<cheick.traore@foss.st.com>
Subject: [PATCH v2 2/5] pinctrl: stm32: Manage irq affinity settings
Date: Tue, 10 Jun 2025 16:30:39 +0200
Message-ID: <20250610143042.295376-3-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610143042.295376-1-antonio.borneo@foss.st.com>
References: <20250610143042.295376-1-antonio.borneo@foss.st.com>
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
X-CRM114-CacheID: sfid-20250610_153255_478122_F47E6A54 
X-CRM114-Status: GOOD (  10.96  )
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

From: Cheick Traore <cheick.traore@foss.st.com>

Trying to set the affinity of the interrupts associated to stm32
pinctrl results in a write error.

Fill struct irq_chip::irq_set_affinity to use the default helper
function.

Signed-off-by: Cheick Traore <cheick.traore@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 3abf47e31c019..e0e3e649976b8 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -413,6 +413,7 @@ static struct irq_chip stm32_gpio_irq_chip = {
 	.irq_set_wake	= irq_chip_set_wake_parent,
 	.irq_request_resources = stm32_gpio_irq_request_resources,
 	.irq_release_resources = stm32_gpio_irq_release_resources,
+	.irq_set_affinity = IS_ENABLED(CONFIG_SMP) ? irq_chip_set_affinity_parent : NULL,
 };
 
 static int stm32_gpio_domain_translate(struct irq_domain *d,
-- 
2.34.1


