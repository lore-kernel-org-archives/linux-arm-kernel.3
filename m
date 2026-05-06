Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D30BCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sris0xyiMLfYPD6D/YefkQkhGzEH93jUaJ4nBZ/Loa0=; b=yy7BIgZP4BhP5pJeQncwVW1QEw
	ZO7AMv3l5IYaTBd27JGt0bY4dRUSyyE92lERfz3IRezz3iWfPeiy27U631E73upBkL8sDbYHjiDGH
	MtOsaeXAj2WF1+lqxOx/K4mvPDyLFAJBmg0tAvsNMVWLIz2fPJ5OheeyQTT2eGPdpYIF4RXA09miP
	Z11OMCM5kAuHlDtXikv6JhGdBMaFEjo1VB1KMvWt+Hq02WE5+qhfKOKuSkG8uczupHmb3N7zdRD13
	rtdMjfCXHulKS/fU7aV47D+D7J4Vsmlt0zE37/xCPxPg2N1mu3JVS83t/mg1i+TBPRda2XKE1Hp14
	oIQJGbGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe7O-00000001J69-3oOi;
	Wed, 06 May 2026 15:24:58 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKe7M-00000001Ixp-2xlR;
	Wed, 06 May 2026 15:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=sr
	is0xyiMLfYPD6D/YefkQkhGzEH93jUaJ4nBZ/Loa0=; b=hDDHTfQzz2ffofBWZ6
	MMO1lj9A9H/9vDW4NbQFBR/f8Xw7UUFwfkt8GvaLmvh5Hx8u21aeOzXk27XcU+rD
	huHoO115HRJ9ERdNVq5Db1hOUD9Io3ook8IBV7imAu6TVHzcEbjgNG7e7A/iz6/+
	3fabcJ6BJK/JGoeQ6yLk2bLk0=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wCHAqsXXftpv5CgDg--.43926S9;
	Wed, 06 May 2026 23:24:17 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vigneshr@ti.com,
	jingoohan1@gmail.com,
	thomas.petazzoni@bootlin.com,
	pali@kernel.org,
	ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	claudiu.beznea.uj@bp.renesas.com,
	mpillai@cadence.com
Cc: robh@kernel.org,
	s-vadapalli@ti.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v2 7/8] PCI: mediatek-gen3: Add 100 ms delay after link training
Date: Wed,  6 May 2026 23:23:45 +0800
Message-Id: <20260506152346.166056-8-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260506152346.166056-1-18255117159@163.com>
References: <20260506152346.166056-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHAqsXXftpv5CgDg--.43926S9
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr4kWw4fAw18WF4rJF1kZrb_yoWDArXE9a
	y8JrWfZay5Cry5CFnayFyrZr9aya47Wr18XayrKFnxZa48ur9Yqr9IvryDXFs5Gw4aqF17
	tryqyF18uFyDAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRufOztUUUUU==
X-Originating-IP: [240e:b8f:927e:5900:dbee:26f0:1b68:48a4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AG4XGn7XSHiCgAA3P
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_082458_487885_176FDEDE 
X-CRM114-Status: UNSURE (   9.18  )
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

The MediaTek Gen3 PCIe host driver lacks the required 100 ms delay after
link training completes for speeds > 5.0 GT/s, as specified in PCIe r6.0
sec 6.6.1.

The driver already stores max_link_speed (from the device tree). After
mtk_pcie_startup_port() successfully brings up the link, call
pcie_wait_after_link_train() to comply with the specification.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b0accd828589..7c5f2ba7157b 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -570,6 +570,8 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 		goto err_power_down_device;
 	}
 
+	pcie_wait_after_link_train(pcie->max_link_speed);
+
 	return 0;
 
 err_power_down_device:
-- 
2.34.1


