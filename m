Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FAD606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cI1MFlVq;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=w1WrA+QX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=huQ0ijUwRXsaVECpM6U2QYII1iXOy65EuxhrHwpGo7U=; b=cI1MFlVqsVhnNY
	KnoU5JuNIrC+tPmLFcOD9xEtHDjw090y9hJttltl+/cm+plh/4fDF4PMPwiceVufq3V9GE5jUm9oC
	G54s9Q2Tjg6XTDXkdOsM6vhaCep8spnVmHl2wC7uLmpqR7/pbizceaxVFOH7W7c81L05MSZB64Jgo
	l/nSkY/wrfpYXqLWpdlVfix5iZC0+yhl8z6LWGwthPYwfHrqqdPIwMTFfHWS3jtlqTaD5084WBde1
	Zqbbw7PU75bRd+NyE5wGLVJMTZ1uZIR37quOlpbJ3YGgszvOI0TVwnj6g60qRopTty6uzgo8n/Wyi
	dWHpnQd306CNiSLq1www==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrfn-0000000GXn4-07Eq;
	Mon, 02 Nov 2026 13:02:03 +0000
Received: from out-194.mta1.migadu.com ([95.215.58.194] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrfj-0000000GXkB-3imp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:02:01 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=UYSZWfHATTfeaAzNdQKHeR6V+/Yl8CVJBkSsVEPXnhs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793624517; v=1; x=1794229317;
 b=w1WrA+QXLi8ERIeOHNlSSW08IDnMTvbodcd01jDJYbndDE8XcnceRkgwaZajVkfebLD99U5c
 KMXFUK93hcUtJIMwkKzuQK5HQtHivoc2Yi/TxIq/nWxxli5mHHPPm7X1ipChArN48ktqLmRGbNC
 aeuWQAfFF0xBQYWg9W/ta51M=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c86092ad60db5f7c;
	Mon, 02 Nov 2026 13:01:57 +0000
X-Mizu-Trace-ID: c86092ad60db5f7c
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/13] irqchip/gic-v3-its: Page-align ITT allocations under protected KVM
Date: Mon,  2 Nov 2026 13:01:24 +0000
Message-ID: <20261102130133.3684226-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102130133.3684226-1-fuad.tabba@linux.dev>
References: <20261102130133.3684226-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_050200_073952_8857C4AB 
X-CRM114-Status: GOOD (  11.96  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Bartłomiej Grzesik <bgrzesik@google.com>

A later patch has the protected KVM hypervisor take each device's ITT
for as long as the device is mapped, by having the host donate its
pages. A page the hypervisor already owns can't be donated again, so the
MAPD of a device whose ITT shares a page with another device's would be
rejected.

Round each ITT up to whole pages in protected mode. This spends up to a
page per MSI device where a 256-byte ITT would have shared one: tens of
pages on a phone, thousands on a server with thousands of VFs.

Signed-off-by: Bartłomiej Grzesik <bgrzesik@google.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 282e4bafb084f..8cc1bd8e7835b 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3493,6 +3493,9 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
 	nr_ites = max(2, nvecs);
 	sz = nr_ites * (FIELD_GET(GITS_TYPER_ITT_ENTRY_SIZE, its->typer) + 1);
 	sz = max(sz, ITS_ITT_ALIGN);
+	/* The hypervisor takes ITT pages per device. */
+	if (gic_is_protected_kvm())
+		sz = PAGE_ALIGN(sz);
 
 	itt = itt_alloc_pool(its->numa_node, sz);
 
-- 
2.47.3


