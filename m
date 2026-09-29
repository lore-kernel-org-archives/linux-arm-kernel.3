Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9DACA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 05:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTnb5gdEOwnPdz4JRroX+sFrer89MQl7kw/S2QGLtV4=; b=qOqJTqNPsCsQMtCZq0UsFfL0Ep
	hcoERiv88r9n9OX9kDy7Bc6k3txC/fuN4yZ2dwZPOd4EESqM+4FC0C3VTQ4HkaX0Y8gUsoR65uOva
	/fI8YTDvPPRXU1JcV96Xecgy4cSfiO616Ls+NFtkeyuYtkMu2BHVkEdAUTZsyta+BQnEiMjRqAXA1
	xOW5oIB9eiWu3DGGkyHmMvSTH4XmiOHzK7BZL7puRkKqpJROPVotYlyGjMbEcB10UtIJD+A/kEWs4
	7JlEcoHALfpU4pN3kxOF3cGAkAJww3o0YAj++swsEpHKpnyNf9BhCakd+foR8OXX1X8aoEiRF+Z2V
	/dT0VEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOms-00000002GJX-3bSO;
	Tue, 29 Sep 2026 03:45:50 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOmf-00000002GCb-2XXq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:45:38 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cc795ad1f5aso1901387a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 20:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790653536; x=1791258336; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTnb5gdEOwnPdz4JRroX+sFrer89MQl7kw/S2QGLtV4=;
        b=hlBq4uHIpPp99+EXR45EM+hZwl14TEUBdh98x+vkcIn8Dy9tivW4ZmZS06TbpWMmtj
         ek50/o8ZWUeR8fjXih2ZxKeZyXQI7Azug5StBwPLXTXJ8vzVEQ67OyoD06/tjZRBKIda
         1vmX4GzrRe0dRxX7x4Igytmnee8+Q6Bhbvh4AJUHkjcaNV8LAXU70cIwdHRJCEdOQtmH
         C/ou73VNHem0/GPEWKAdkOYrCxHlByoEuru7eS0QMv6SqPkKfDI/QX45Ehvjzx1ii+Ly
         Gv9axQfK6YSAi10EMjSt7oRpjIF7/4wdcBmT7OqxzbwofUOfeX4LQnU7qCwS7l6dCI6i
         Yylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790653536; x=1791258336;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTnb5gdEOwnPdz4JRroX+sFrer89MQl7kw/S2QGLtV4=;
        b=eQpF/+iusp8ffhr860XOSQfr1SiTFIxvt9cIWvmLNTD36cZ2thYi8LEWg4EtBBfngy
         6wKysi/F1Kpk4itYwmfujuKQ2kF9QCMY/xM0758dB7j39TkJAwfV0uv6W4nNp7cXqwZt
         rFwZjxlYh9UUlhMI8SffbxYJdCyynlPjEL+rZL1q89Hx/EdqQv4Fn6dLEb32+oaAhHB+
         YK0va3U6pGZUuHLnp/c70iGuOn/RYuMBaLRb0+eKHyprv80ZTFbUU2+lammzzCoJZmtI
         mzV0nxTj3MCEIPhLNP7/wrh1Bz9350ZycYueWTLsOgYF2zV53OoyLqQRSQULogSVJ0h+
         SWFA==
X-Forwarded-Encrypted: i=1; AKwUvBz76ynCg69lGpAuXoA6DW+CnnES1redODei+GCAJ5ww3cE5f8kJ2bCg1SM1PcON3Kwv+2UnzyUx7kCaDdch1cKx@lists.infradead.org
X-Gm-Message-State: AFuF++nOSg9ZB8v0XpNi0k+qsThiIheY2D0jzvLY90GQp7MrcyRvfFd4
	OI2X0TsDRdM1BjyoEZDaDZf/ow4M6t/kwJVf+5jNo+GBhlO5Jqp2MqXRUGaOE/YFuqx9I9bQz2T
	MzA==
X-Received: from pgbdp8.prod.google.com ([2002:a05:6a02:f08:b0:cc7:a092:edd9])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e38b:b0:3de:67b8:26bc
 with SMTP id adf61e73a8af0-3de67b82a79mr3606310637.30.1790653536063; Mon, 28
 Sep 2026 20:45:36 -0700 (PDT)
Date: Tue, 29 Sep 2026 03:45:01 +0000
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
Mime-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929034510.2023173-8-praan@google.com>
Subject: [PATCH v11 07/16] genirq/msi: Cache MSI message in irq_chip_write_msi_msg()
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_204537_650554_E75D67A5 
X-CRM114-Status: GOOD (  15.02  )
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

Currently, PCI MSI caches the composed MSI message into the MSI
descriptor inside __pci_write_msi_msg(), whereas platform MSI and other
device MSI domains do not cache the message in the core, forcing
individual drivers to manually copy the message into desc->msg if they
need to restore it across power transitions.

Cache desc->msg in irq_chip_write_msi_msg() before invoking the chip
callback so all hierarchical MSI domains automatically record the
latest message. Document why the redundant assignment in
__pci_write_msi_msg() must remain for direct callers outside the
irq_chip hierarchy.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/pci/msi/msi.c | 6 ++++++
 kernel/irq/msi.c      | 9 +++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 80a9db417dc8..f7bedc31d486 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -257,6 +257,12 @@ void __pci_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
 		pci_write_msg_msi(dev, entry, msg);
 	}
 
+	/*
+	 * Although irq_chip_write_msi_msg() already caches the message,
+	 * keep the assignment here for callers that invoke
+	 * __pci_write_msi_msg() or pci_write_msi_msg() directly outside
+	 * the irq_chip hierarchy.
+	 */
 	entry->msg = *msg;
 
 	if (entry->write_msi_msg)
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index fb5f372215bf..df460a574d80 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -634,6 +634,15 @@ static unsigned int msi_domain_get_hwsize(struct device *dev, unsigned int domid
 static inline void irq_chip_write_msi_msg(struct irq_data *data,
 					  struct msi_msg *msg)
 {
+	struct msi_desc *desc = irq_data_get_msi_desc(data);
+
+	/*
+	 * PCI Multi-MSI shares a single descriptor across all vectors and
+	 * the device stores only the base message. Cache the message of the
+	 * first interrupt only, so that sub-vectors cannot overwrite it.
+	 */
+	if (desc->irq == data->irq)
+		desc->msg = *msg;
 	data->chip->irq_write_msi_msg(data, msg);
 }
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


