Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083B0606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gqO3/jqA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hZd39NkOwt0spQ0Fc/i0H3+nue4pIN5LVhWFLWxW1TM=; b=gqO3/jqATlH00t
	zj2dXngKxgy4oam9zM3GSCDP0T11Hry1tM+tSY5fVreUajoMiVgqtbcNFh6qPa28KSOvQM7r2N3bb
	XuYWLSQoxQJWNc8ZNj8lmymkIbrBIUDWwEeth4PjIN35m6feJIqNDvOxRNQciYf1CJIgc+DDzBqFn
	a9NidAXQxG8HdH4cn6o0w/Shhfx+jW+UreFuellpXqaI/y9rbmbbBA72Dc6/DWRj848tM0uuJ8KpK
	iXUnr0deqGCkG/BoDSwZm95SbsiOaZ2i9V0RUD6OalYqwHxMQlC+PPp4VJOQRMMzpQOTruiz3GNww
	fi+FKeHYBXeRrcShiKfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoiA-0000000G5Zf-1lWy;
	Mon, 02 Nov 2026 09:52:18 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoi7-0000000G5Xa-34cc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:52:17 +0000
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-7 (Coremail) with UTF8SMTP id AQAAfwBXX59JXehqwjA_BQ--.17544S2;
	Mon, 02 Nov 2026 17:52:09 +0800 (CST)
Received: from localhost.localdomain (unknown [218.76.62.144])
	by mail (Coremail) with SMTP id AQAAf8DwSHU3XehqVDv0AA--.22683S4;
	Mon, 02 Nov 2026 17:51:57 +0800 (CST)
From: Cui Chao <cuichao1753@phytium.com.cn>
To: Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Wang Yinfeng <wangyinfeng@phytium.com.cn>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] PCI: Allow reusing PCI domain numbers in DT
Date: Mon,  2 Nov 2026 17:51:50 +0800
Message-Id: <20261102095150.2370959-3-cuichao1753@phytium.com.cn>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20261102095150.2370959-1-cuichao1753@phytium.com.cn>
References: <20261102095150.2370959-1-cuichao1753@phytium.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DwSHU3XehqVDv0AA--.22683S4
X-CM-SenderInfo: pfxlux1drrlkut6sx5pwlxzhxfrphubq/1tbiAQAHAGrnk0kE5QACsy
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=cuichao175
	3@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoWxurWruFyrAF17urW5KFWkXrb_yoW5tFyUpF
	W7trW5ur4kXF1UXwn8Jr1UWFyYkFZYkFWkJw13Kw1kuFn8tFyqgr18try0gFyUArWUJFyj
	yFnrJw1Dtr18JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
	UUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_015215_938509_9B4991CF 
X-CRM114-Status: GOOD (  14.85  )
X-Spam-Score: -2.6 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In the existing DT path, a uniqueness constraint is imposed on the PCI
domains of multiple PCIe nodes, which prevents devices under different
PCIe RCs from reusing the same software domain number.

Add support for the 'linux,pci-domain-reuse' DT property. For a PCI
node that declares this property, it is allowed to reuse the same
'linux,pci-domain' number with other nodes. For a PCI node that does
not declare this property, the original uniqueness check remains in
place.

Reasonable resource partitioning does not affect the global uniqueness
of devices. When domains are the same, as long as the physical
resources of two PCIe nodes (RCs), such as ECAM, bus ranges, mem32,
mem64, and IO, do not overlap, (domain, bus) remains globally unique,
and the BDFs of all devices are also globally unique.

Device tree example:
Each RC node participating in reuse declares 'linux,pci-domain-reuse';
whether the same number is actually reused is determined by the
'linux,pci-domain' value. In the example, the ECAM, bus-range, and
ranges of the two RCs do not overlap.

 pcie0: pcie@10000000 {
        ...
        linux,pci-domain = <0>;
        linux,pci-domain-reuse;
        bus-range = <0x00 0x7f>;
        ranges = <0x01000000 0x00000000 0x00100000 0x00000000
                  0x10000000 0x00000000 0x00100000
                  0x02000000 0x00000000 0x20000000 0x00000000
                  0x20000000 0x00000000 0x10000000
                  0x43000000 0x00000200 0x00000000 0x00000200
                  0x00000000 0x00000100 0x00000000>;
        ...
 };

 pcie1: pcie@20000000 {
        ...
        linux,pci-domain = <0>;
        linux,pci-domain-reuse;
        bus-range = <0x80 0xff>;
        ranges = <0x01000000 0x00000000 0x00200000 0x00000000
                  0x10100000 0x00000000 0x00100000
                  0x02000000 0x00000000 0x30000000 0x00000000
                  0x30000000 0x00000000 0x10000000
                  0x43000000 0x00000300 0x00000000 0x00000300
                  0x00000000 0x00000100 0x00000000>;
        ...
 };

Co-developed-by: Wang Yinfeng <wangyinfeng@phytium.com.cn>
Signed-off-by: Wang Yinfeng <wangyinfeng@phytium.com.cn>
Signed-off-by: Cui Chao <cuichao1753@phytium.com.cn>
---
 drivers/pci/pci.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7c6f2aba8144..245ffb9d2f74 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6801,13 +6801,19 @@ static int of_pci_bus_find_domain_nr(struct device *parent)
 		/*
 		 * If domain is in DT, allocate it in static IDA.  This
 		 * prevents duplicate static allocations in case of errors
-		 * in DT.
+		 * in DT. Platform that legitimately reuse a domain number
+		 * across host bridges (disjoint ECAM/bus/memory/IO) opt out
+		 * of this check with "linux,pci-domain-reuse".
 		 */
 		domain_nr = of_get_pci_domain_nr(parent->of_node);
-		if (domain_nr >= 0)
+		if (domain_nr >= 0) {
+			if (of_property_read_bool(parent->of_node,
+							"linux,pci-domain-reuse"))
+				return domain_nr;
 			return ida_alloc_range(&pci_domain_nr_static_ida,
 					       domain_nr, domain_nr,
 					       GFP_KERNEL);
+		}
 	}
 
 	/*
@@ -6824,6 +6830,10 @@ static void of_pci_bus_release_domain_nr(struct device *parent, int domain_nr)
 	if (domain_nr < 0)
 		return;
 
+	/* Reusers never acquire the static slot, so never release it */
+	if (of_property_read_bool(parent->of_node, "linux,pci-domain-reuse"))
+		return;
+
 	/* Release domain from IDA where it was allocated. */
 	if (parent && of_get_pci_domain_nr(parent->of_node) == domain_nr)
 		ida_free(&pci_domain_nr_static_ida, domain_nr);
-- 
2.33.0


