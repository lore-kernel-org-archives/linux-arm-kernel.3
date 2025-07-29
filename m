Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F92C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 06:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F2yOpyt/YqjoKcmqvqIBEL8aDBHvJPFc1AXuZ7tPAYg=; b=oWSqQLVDJm5GECGdAF48uFqNLE
	WmTeqRUuYQY7HO6uCfm+TFiHxtJkKAbQGMUGUZrFp4WeoUHkKAYafKEY2XzmQaBTJ/tLTXiUMXrfr
	Lrg2S2aLdFcICK91N8ymqBaSN5MsjELjvqubDrLjXBjSN1nE9BNGB3aOHMq1J5v9m8GEi9LFcp4EA
	n4s4VoBd9/NLx8p2z+nZIff30jElW+dej1U1m3p8DTfGydBDCqDNvzXYyo52yz8/fbLWtQtch6M7p
	tf64I1mqj1+1Z/wvpzvOIFOx4kIZrepfZmxDF5t6syNzPXZaDaWN9ie4n51CSBtfubmoTvmmGAalL
	Q8EeoEQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugdmJ-0000000G1Aj-03vD;
	Tue, 29 Jul 2025 06:25:35 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugdjn-0000000G0uK-2uNW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 06:23:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1753770175; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=F2yOpyt/YqjoKcmqvqIBEL8aDBHvJPFc1AXuZ7tPAYg=;
	b=BhGzb5Po5h9H1sj1KpG1YLUnwjmDoVJlkk+H+oZU8R2xA+KUcpzXX/R510uiZ5yWTVE9IRvKCWNz4fEHdrxBqfOKgJhPqhzLDyf+XkF5GEQt2PpmDhbsHzA0yXCZpgxi3rBvhGb14GvzMNSw0WfhOl0iF4MWGzhI37gZMI93q/Q=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WkP.haK_1753770170 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 29 Jul 2025 14:22:51 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org
Subject: Why prevent boot memory to be hot-removed on arm64?
Date: Tue, 29 Jul 2025 14:22:50 +0800
Message-ID: <87cy9j1pol.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_232300_512984_D7DD9A8C 
X-CRM114-Status: UNSURE (   7.63  )
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

Hi, Anshuman,

When I read memory hotplug code on arm64, I found that a memory notifier
(prevent_bootmem_remove_notifier()) is used to prevent the boot memory
to be hot-removed on arm64.  I understand that some memory (for example
the boot memory) shouldn't be hot-removed on some platforms.  However,
after checking the code, I found that the memory can only be hot-removed
via ACPI (acpi_memory_device_remove()), CXL/NVDIMM
(dev_dax_kmem_remove()), or virtio mem (virtio_mem_remove_memory).
IIUC, CXL/NVDIMM or virtio mem shouldn't be boot memory, and ACPI memory
hot-remove shouldn't be setup by the firmware if some memory ranges
shouldn't be hot-removed.  If so, the boot memory cannot be hot-removed
accidentally, prevent_bootmem_remove_notifier() just makes the boot
memory can not be offlined.

Or I missed something?

---
Best Regards,
Huang, Ying

