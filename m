Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2109C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 01:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k8KC5ka+5vWytfIWMb1krli2dzmwMQJJVn3QlLRPtVA=; b=HBug4E/ZEfgMoL/nROnJX6tr6n
	RHElV73dRAOksiyKgP8cOa7hL0UG6Y4BNz40zQ6pURcvHeG/t5lwWZePG9g7UEpWeAlLIvLc056Gu
	1igpto61f8+2ndgH3eOAUo9K6YbujOjwu6/yrcz87TimRPDMr0QPdy3ijHZeBrVjjDjJ8eISxO7Ce
	b3sJOI7pI5N/zxfCYmXSQhySx0IPrBHvUkjsTrDFs9PsVtq6WqKCNg53Z1S6UG1XpwrO77fzkil0n
	bPyBT3NG/6x+IWV/wKyEbZVjKA5y8O+plpuGpd1UGOG2n0F5kcVBelsjio5Z3iMtQ94yy5N+mueGO
	UTptbYLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFjde-00000002Bfw-2bUt;
	Fri, 16 May 2025 01:13:26 +0000
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net ([206.189.21.223])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFjZc-00000002BAX-0dPC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 01:09:18 +0000
Received: from E0005182DT.eswin.cn (unknown [10.12.97.162])
	by app2 (Coremail) with SMTP id TQJkCgDXaJImkCZoiJh8AA--.40410S2;
	Fri, 16 May 2025 09:08:58 +0800 (CST)
From: weishangjuan@eswincomputing.com
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	richardcochran@gmail.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	p.zabel@pengutronix.de,
	yong.liang.choong@linux.intel.com,
	rmk+kernel@armlinux.org.uk,
	jszhang@kernel.org,
	inochiama@gmail.com,
	jan.petrous@oss.nxp.com,
	dfustini@tenstorrent.com,
	0x1207@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	lizhi2@eswincomputing.com,
	Shangjuan Wei <weishangjuan@eswincomputing.com>
Subject: [PATCH v1 0/2] Add driver support for Eswin eic7700 SoC ethernet controller
Date: Fri, 16 May 2025 09:08:48 +0800
Message-ID: <20250516010849.784-1-weishangjuan@eswincomputing.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TQJkCgDXaJImkCZoiJh8AA--.40410S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur1rAr1kXr1kKw4DXw1fWFg_yoWkGwb_Cr
	1xZr95Ja1UXF4jvayjkrs7uryq9F4DJrySkFZ8AFWYv3sFqrWDGF95ArykZF1UGr4rJF9x
	Wryft34Iyw12gjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbHkYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAa
	Y2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ec7
	CjxVAajcxG14v26r1j6r4UMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
	Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
	xan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVWrXVW3AwCY02Avz4vE-syl42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4Rz6wtUUUUU
X-CM-SenderInfo: pzhl2xxdqjy31dq6v25zlqu0xpsx3x1qjou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_180916_494127_83A0A003 
X-CRM114-Status: UNSURE (   9.83  )
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

From: Shangjuan Wei <weishangjuan@eswincomputing.com>

  Introduce a driver for the Eswin eic7700 series SoC ethernet controller,
  adding support for the ethernet functionality in the Linux kernel. The
  driver provides basic functionality to manage and control the ethernet
  signals for the eic7700 series chips, which are part of the Eswin SoC family.

  Supported chips:
    Eswin eic7700 series SoC.

  Test:
    I tested this patch on the Sifive HiFive Premier P550 (which uses the EIC7700 SoC),
    including system boot and ethernet.

Shangjuan Wei (2):
  ethernet: eswin: Document for eic7700 SoC
  ethernet: eswin: Add eic7700 ethernet driver

 .../bindings/net/eswin,eic7700-eth.yaml       | 142 +++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 521 ++++++++++++++++++
 4 files changed, 675 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c

-- 
2.17.1


