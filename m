Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3513EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 00:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ek7c/V4tEPRnWDg9ne0X3d57G2QR4Kt93BNCHQvtsg=; b=WLRf/WP4X00iK9QsJnAo/uuyaM
	q4Ry4+Ud6Hf/6VDS+jKzc8lZF/BH0+HENWYY9aWhgzHQUg8xmI02wT3l09ky8aWw5KChW3/+cWVyH
	+I529S24X7VUZU64QaIX3mBhfGl1pD/avNHcLe99jvByCtTmJywvBLiAOZjKrrE48BiWQg7iApNuz
	xjOP0R1njJaRiy9+mJ/plD1ZfygUWaj6StwwnbG7CN6dsD+LF33h/8sTlvWs3katkdmj5FV4jSTe7
	3ysjcn0dDC8spkHcQAu7u2lxX0OWmWWfWFzjdp8jLasBhlXTQeLEWHaUkgEBSJdUE8pJAAhuHvqJr
	URipw9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2JA9-00000005lSl-3Nhh;
	Wed, 09 Apr 2025 00:19:29 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Izi-00000005kDp-15sM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 00:08:44 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 06D292113E9F;
	Tue,  8 Apr 2025 17:08:40 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 06D292113E9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744157320;
	bh=8ek7c/V4tEPRnWDg9ne0X3d57G2QR4Kt93BNCHQvtsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Of+UYZp2I4weN3I81NEdoIr6gHMQsX3CjbNKnmmILmhtmUf4OHR93sp3AhZBtJ2pd
	 p1p+jiVB2MOUPwfNzvia/zk8pDwYavj+M98l9VP+2iQjxvMKZGei/TzEdRpNb6jH7A
	 QZU2sGxZRVpouYt/yXPi/sDcuyn3Lg+7XMI11FP0=
From: Roman Kisel <romank@linux.microsoft.com>
To: aleksander.lobakin@intel.com,
	andriy.shevchenko@linux.intel.com,
	arnd@arndb.de,
	bp@alien8.de,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	dakr@kernel.org,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	gregkh@linuxfoundation.org,
	haiyangz@microsoft.com,
	hch@lst.de,
	hpa@zytor.com,
	James.Bottomley@HansenPartnership.com,
	Jonathan.Cameron@huawei.com,
	kys@microsoft.com,
	leon@kernel.org,
	lukas@wunner.de,
	luto@kernel.org,
	m.szyprowski@samsung.com,
	martin.petersen@oracle.com,
	mingo@redhat.com,
	peterz@infradead.org,
	quic_zijuhu@quicinc.com,
	robin.murphy@arm.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	x86@kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next 6/6] drivers: SCSI: Do not bounce-bufffer for the confidential VMBus
Date: Tue,  8 Apr 2025 17:08:35 -0700
Message-ID: <20250409000835.285105-7-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409000835.285105-1-romank@linux.microsoft.com>
References: <20250409000835.285105-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_170842_327548_6198C49B 
X-CRM114-Status: UNSURE (   9.06  )
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

The device bit that indicates that the device is capable of I/O
with private pages lets avoid excessive copying in the Hyper-V
SCSI driver.

Set that bit equal to the confidential external memory one to
not bounce buffer

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
---
 drivers/scsi/storvsc_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/scsi/storvsc_drv.c b/drivers/scsi/storvsc_drv.c
index a8614e54544e..f647f8fc2f8f 100644
--- a/drivers/scsi/storvsc_drv.c
+++ b/drivers/scsi/storvsc_drv.c
@@ -686,6 +686,8 @@ static void handle_sc_creation(struct vmbus_channel *new_sc)
 	struct vmstorage_channel_properties props;
 	int ret;
 
+	dev->use_priv_pages_for_io = new_sc->confidential_external_memory;
+
 	stor_device = get_out_stor_device(device);
 	if (!stor_device)
 		return;
-- 
2.43.0


