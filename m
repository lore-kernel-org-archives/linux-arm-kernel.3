Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86C5C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCmrCueJeRS5ibC5xxnWfa61fpspJ03Yh0ZfFkdp9c0=; b=FikF2etvNNSUJu/HKT8XpIZPZX
	a9a897N/hdzjdrkHc3PGyQKhlefloAs2MABv3EIT20d4QdXsfAI5kCiJjT0qS2sr3j9DkCH/GP8BQ
	cWUoSnGCSDvK1Iny+tTUv42eVo9dNW4O+KYawEMzc3s59Xi02VEOxnCpqOlvP3rX/YDATGsYfg2GT
	8QTE5M9GKJMaN5RcY+RSHg3yOCqPB8qITVh21VitIKY1pq5rjHFMIKrbM0iffHpIIS0pm83ctzE25
	HMqE8BAIXXoEOEUa6upat2nkTBVOqPNjP7Ut6v63FCx24Z9DclFUgbeCClqEGpq8E23STmoGq31Ls
	QKBPNC3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoVT-0000000C6zk-14uH;
	Thu, 26 Jun 2025 15:27:19 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnuI-0000000Bzh7-491y;
	Thu, 26 Jun 2025 14:48:56 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eCmrCueJeRS5ibC5xxnWfa61fpspJ03Yh0ZfFkdp9c0=;
	b=44vNn8MCNJ+FutWdudMlsBA3G+UbTWImF6VbC1fmDTNCH89l8n929pLAeGCfhevSgCiOHx
	qR2Pzu/Hikfx9eoKGSdYF0YWtfY4LMn9Uy8csZr3F7QW/skk4Avn7l08CGBx9uo+Kv/c3I
	42Hhj7HOTK6i1fohMP/3yxYHWJVOjVUbfe1W2DOFIschnImeameeNA2JMRhH72D3MztZXV
	mj1BL+IC1TkfGw0vM3YmbWlI3eIRnUOjwn33AVCdzN3SkIPkYbuRNwMqHteLui6zmjsJX7
	Ie6yFUUX7Rp0ZMbMr1wTGrlEugc3TlfybTR8mi17OVQGle5MY8PbjC/E1NScaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eCmrCueJeRS5ibC5xxnWfa61fpspJ03Yh0ZfFkdp9c0=;
	b=QRkvml8xuqeE/T0T/GtW59FNC+nurgJExh7WDPwC30vEPHH2tnY37E23Gw86l4Xa+UrrDi
	grm02T3W7v93ESDQ==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Joyce Ooi <joyce.ooi@intel.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Michal Simek <michal.simek@amd.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 15/16] PCI: vmd: Convert to lock guards
Date: Thu, 26 Jun 2025 16:48:05 +0200
Message-Id: <836cca37449c70922a2bea1fb13f37940a7a7132.1750858083.git.namcao@linutronix.de>
In-Reply-To: <cover.1750858083.git.namcao@linutronix.de>
References: <cover.1750858083.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074855_176759_7F6F31A7 
X-CRM114-Status: GOOD (  12.36  )
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

Convert lock/unlock pairs to lock guard and tidy up the code.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
Cc: Nirmal Patel <nirmal.patel@linux.intel.com>
Cc: Jonathan Derrick <jonathan.derrick@linux.dev>
---
 drivers/pci/controller/vmd.c | 73 ++++++++++++++----------------------
 1 file changed, 29 insertions(+), 44 deletions(-)

diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
index 375ce9d6d9f6a..d9b893bf4e456 100644
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -180,13 +180,12 @@ static void vmd_compose_msi_msg(struct irq_data *data=
, struct msi_msg *msg)
 static void vmd_irq_enable(struct irq_data *data)
 {
 	struct vmd_irq *vmdirq =3D data->chip_data;
-	unsigned long flags;
=20
-	raw_spin_lock_irqsave(&list_lock, flags);
-	WARN_ON(vmdirq->enabled);
-	list_add_tail_rcu(&vmdirq->node, &vmdirq->irq->irq_list);
-	vmdirq->enabled =3D true;
-	raw_spin_unlock_irqrestore(&list_lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &list_lock) {
+		WARN_ON(vmdirq->enabled);
+		list_add_tail_rcu(&vmdirq->node, &vmdirq->irq->irq_list);
+		vmdirq->enabled =3D true;
+	}
=20
 	data->chip->irq_unmask(data);
 }
@@ -194,16 +193,15 @@ static void vmd_irq_enable(struct irq_data *data)
 static void vmd_irq_disable(struct irq_data *data)
 {
 	struct vmd_irq *vmdirq =3D data->chip_data;
-	unsigned long flags;
=20
 	data->chip->irq_mask(data);
=20
-	raw_spin_lock_irqsave(&list_lock, flags);
-	if (vmdirq->enabled) {
-		list_del_rcu(&vmdirq->node);
-		vmdirq->enabled =3D false;
+	scoped_guard(raw_spinlock_irqsave, &list_lock) {
+		if (vmdirq->enabled) {
+			list_del_rcu(&vmdirq->node);
+			vmdirq->enabled =3D false;
+		}
 	}
-	raw_spin_unlock_irqrestore(&list_lock, flags);
 }
=20
 static struct irq_chip vmd_msi_controller =3D {
@@ -225,7 +223,6 @@ static irq_hw_number_t vmd_get_hwirq(struct msi_domain_=
info *info,
  */
 static struct vmd_irq_list *vmd_next_irq(struct vmd_dev *vmd, struct msi_d=
esc *desc)
 {
-	unsigned long flags;
 	int i, best;
=20
 	if (vmd->msix_count =3D=3D 1 + vmd->first_vec)
@@ -242,13 +239,13 @@ static struct vmd_irq_list *vmd_next_irq(struct vmd_d=
ev *vmd, struct msi_desc *d
 		return &vmd->irqs[vmd->first_vec];
 	}
=20
-	raw_spin_lock_irqsave(&list_lock, flags);
-	best =3D vmd->first_vec + 1;
-	for (i =3D best; i < vmd->msix_count; i++)
-		if (vmd->irqs[i].count < vmd->irqs[best].count)
-			best =3D i;
-	vmd->irqs[best].count++;
-	raw_spin_unlock_irqrestore(&list_lock, flags);
+	scoped_guard(raw_spinlock_irq, &list_lock) {
+		best =3D vmd->first_vec + 1;
+		for (i =3D best; i < vmd->msix_count; i++)
+			if (vmd->irqs[i].count < vmd->irqs[best].count)
+				best =3D i;
+		vmd->irqs[best].count++;
+	}
=20
 	return &vmd->irqs[best];
 }
@@ -277,14 +274,12 @@ static void vmd_msi_free(struct irq_domain *domain,
 			struct msi_domain_info *info, unsigned int virq)
 {
 	struct vmd_irq *vmdirq =3D irq_get_chip_data(virq);
-	unsigned long flags;
=20
 	synchronize_srcu(&vmdirq->irq->srcu);
=20
 	/* XXX: Potential optimization to rebalance */
-	raw_spin_lock_irqsave(&list_lock, flags);
-	vmdirq->irq->count--;
-	raw_spin_unlock_irqrestore(&list_lock, flags);
+	scoped_guard(raw_spinlock_irq, &list_lock)
+		vmdirq->irq->count--;
=20
 	kfree(vmdirq);
 }
@@ -387,29 +382,24 @@ static int vmd_pci_read(struct pci_bus *bus, unsigned=
 int devfn, int reg,
 {
 	struct vmd_dev *vmd =3D vmd_from_bus(bus);
 	void __iomem *addr =3D vmd_cfg_addr(vmd, bus, devfn, reg, len);
-	unsigned long flags;
-	int ret =3D 0;
=20
 	if (!addr)
 		return -EFAULT;
=20
-	raw_spin_lock_irqsave(&vmd->cfg_lock, flags);
+	guard(raw_spinlock_irqsave)(&vmd->cfg_lock);
 	switch (len) {
 	case 1:
 		*value =3D readb(addr);
-		break;
+		return 0;
 	case 2:
 		*value =3D readw(addr);
-		break;
+		return 0;
 	case 4:
 		*value =3D readl(addr);
-		break;
+		return 0;
 	default:
-		ret =3D -EINVAL;
-		break;
+		return -EINVAL;
 	}
-	raw_spin_unlock_irqrestore(&vmd->cfg_lock, flags);
-	return ret;
 }
=20
 /*
@@ -422,32 +412,27 @@ static int vmd_pci_write(struct pci_bus *bus, unsigne=
d int devfn, int reg,
 {
 	struct vmd_dev *vmd =3D vmd_from_bus(bus);
 	void __iomem *addr =3D vmd_cfg_addr(vmd, bus, devfn, reg, len);
-	unsigned long flags;
-	int ret =3D 0;
=20
 	if (!addr)
 		return -EFAULT;
=20
-	raw_spin_lock_irqsave(&vmd->cfg_lock, flags);
+	guard(raw_spinlock_irqsave)(&vmd->cfg_lock);
 	switch (len) {
 	case 1:
 		writeb(value, addr);
 		readb(addr);
-		break;
+		return 0;
 	case 2:
 		writew(value, addr);
 		readw(addr);
-		break;
+		return 0;
 	case 4:
 		writel(value, addr);
 		readl(addr);
-		break;
+		return 0;
 	default:
-		ret =3D -EINVAL;
-		break;
+		return -EINVAL;
 	}
-	raw_spin_unlock_irqrestore(&vmd->cfg_lock, flags);
-	return ret;
 }
=20
 static struct pci_ops vmd_ops =3D {
--=20
2.39.5


