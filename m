Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6CEE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 13:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dTNG0nibu7UYo45+nRmB7lqVuql0kGdP8sbH3SBpRbk=; b=bQxWS9m7RogZWykm0I+iVerHaX
	iGvlNY0BaME4yLEBVzyRm1dLXDcxuGRQcy3yOKFWTEKu85cWsO6qBADPfT2gvY6eSgo2iJaXW4EeV
	jsWsQ0hBy5HzTqAvx9xe1VbtJF5OQv/rv+SHL+BBk84iZrPoN5JYyIZJFi5r3BOnK6qrdYHQQT94t
	NznvCc9xazkCsrPLTT18sIdfAT9oQ1ccNu01ucxQgWyNhr3R30Vqzf0gmm9w8OXqPSB0JYTD4mkps
	JtC0Ld6SOA3CeD4LEb6CSsvDM9xvD+fotRgZ/YCL2kvmUxjYFAUyk45JxyBRZHRXbWc4pMZNmPMi5
	DqRVzlhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOccb-00000004xEu-0KXL;
	Fri, 20 Dec 2024 13:00:49 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcZB-00000004wjW-0lBd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 12:57:19 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKBdFUi004018;
	Fri, 20 Dec 2024 13:57:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=dTNG0nibu7UYo45+nRmB7l
	qVuql0kGdP8sbH3SBpRbk=; b=cbNqS2HHeHCpZwYociD56gu52aYjKaeVeum1vu
	2NSL2Vs9on0oSTYygyae2nBwFolnr9WR1esvA5M7nsI1bEiyT5brGk/pc2Ealp77
	9d0KfCRyE3c3kZJVUkxNhzUEYA2wFUrGFK8TiAQhM9TavDO87lW1HWYHVOr3p5Mz
	aLaKNyTx9mWU7455jTl1CWDbcXqxyMuC/koH6iyEP5RlPHO4I/+Fo4BTATtXr7a6
	dNEa7oFsZZAFtaC22jeQAjul27YJ1X+V4KfviGhT58iM8TMzNRqUJBKk4v0bkxjf
	vgv4krrhOadXoMWTVkgVDx+0EXQ+VX9cJrAby19hFuk1hIRw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43n34bsrpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 13:57:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E8A8E4004F;
	Fri, 20 Dec 2024 13:55:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B02C272C3A;
	Fri, 20 Dec 2024 13:55:10 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 13:55:09 +0100
From: <patrice.chotard@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Petr Mladek <pmladek@suse.com>, Yoann Congal <yoann.congal@smile.fr>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <soc@kernel.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
Subject: [PATCH v2 0/4] ARM: config: stm32: Remove useless flags
Date: Fri, 20 Dec 2024 13:55:02 +0100
Message-ID: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_045717_530520_3F015832 
X-CRM114-Status: UNSURE (   8.42  )
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Running "make savedefconfig" highlights that some flags are no more used,
remove them.
Remove some flags to reduce the kernel image size as STM32 MCU's board
embeds low amount of RAM.

Changes in V2:
  _ squash patches 2-7
  _ split patch 1 in three parts and add epxlanations about flags removal.

Patrice Chotard (4):
  ARM: configs: stm32: Remove FLASH_MEM_BASE and FLASH_SIZE in STM32
    defconfig
  ARM: configs: stm32: Clean STM32 defconfig
  ARM: configs: stm32: Remove CRYPTO in STM32 defconfig
  ARM: configs: stm32: Remove useless flags in STM32 defconfig

 arch/arm/configs/stm32_defconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.1


