Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675CCCEE35A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 22:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ko9X3F2pJefo8kFJzOpo7ZCLmuSA3XuPcJxCSpJR+O8=; b=1R2tbz28MP5Kqq+RjmAdBK93RK
	IKVyvtG9wEt8962J/QUj+M3vqMyHmJ0Yy9j2MstzppZwC8r/kHrRgFQZodUllbSWz0lWWFH71ZZZn
	Wdjb7i8CS11l1q7VFHdQ4stQ5VW1rac/wGH0NsZ6P6iHLRd5wlKBYq98s4+ceFTmYHkOZPPFx03iQ
	wxQHlKUA7ypk2SFUdLy5bBUQKjKt8+DvgcxDn7fBG34fI4Kl8xxq2XO87RqyNU6mI0T8Y46MtkaHt
	IV7W2GejVetSDMa37GwlTfAbWkodhqa2EQrtDIuxaI2g2wyQeUfcpylOs9DtaIOnOnD/E6GvuceGz
	UoHzDtcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTyh-00000001ARZ-2Bi2;
	Tue, 18 Nov 2025 22:15:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTyc-00000001APy-1IHk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 22:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763504104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ko9X3F2pJefo8kFJzOpo7ZCLmuSA3XuPcJxCSpJR+O8=;
	b=K02Ib6Epdxd3gdT1YohWi/oipSOfBWNp9FJGe7sV0PEI+H8NRWWG23iu86oVBABeZl9k6c
	YO3Zi61xiUZI3e8Q7LRPZL5YQiSgq0oGvKunyorEu/h8O7QJgC0zRhoACi8fWb0uYbtCLQ
	Uec+L1K4qexhYZGHBKUmIsKULQ32ZTk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-80-lLEnVWWeNQCqTetmi_WxcQ-1; Tue,
 18 Nov 2025 17:13:22 -0500
X-MC-Unique: lLEnVWWeNQCqTetmi_WxcQ-1
X-Mimecast-MFC-AGG-ID: lLEnVWWeNQCqTetmi_WxcQ_1763504000
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C49FE19560B0;
	Tue, 18 Nov 2025 22:13:19 +0000 (UTC)
Received: from thinkpad-p1.kanata.rendec.net (unknown [10.22.88.100])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5ABD6180047F;
	Tue, 18 Nov 2025 22:13:17 +0000 (UTC)
From: Radu Rendec <rrendec@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] PCI: host-common: Allow drivers to use the device's drvdata pointer
Date: Tue, 18 Nov 2025 17:12:42 -0500
Message-ID: <20251118221244.372423-1-rrendec@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_141506_497514_EB972602 
X-CRM114-Status: GOOD (  12.90  )
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

Currently there's only one user of pci_host_common_init(), the
pcie-apple driver, and it goes to great lengths to store its own
per-device private pointer, because the device's drvdata is used by
pci_host_common_init() to store a pointer to struct pci_host_bridge.
See commit 643c0c9d0496 ("PCI: apple: Add tracking of probed root
ports").

However, it looks like this is necessary only for simple drivers that
use pci_host_common_{probe,remove}() directly as their platform
probe/remove functions. More complex drivers that allocate their own
private structure, like pcie-apple, can store a pointer to that instead;
the pointer to struct pci_host_bridge can be encapsulated in the private
structure if it's needed.

The first patch changes the pci-host-common library to free up drvdata
for drivers that do not use pci_host_common_{probe,remove}() directly.

The second patch uses the changes in the first patch to simplify the
pointer storage logic. This patch is *untested* because I don't have
access to the hardware.

Radu Rendec (2):
  PCI: host-common: Do not set drvdata in pci_host_common_init()
  PCI: apple: Store private pointer in platform device's drvdata

 drivers/pci/controller/pci-host-common.c | 36 +++++++++++-----
 drivers/pci/controller/pci-host-common.h |  6 ++-
 drivers/pci/controller/pcie-apple.c      | 53 ++++--------------------
 3 files changed, 36 insertions(+), 59 deletions(-)

-- 
2.51.1


