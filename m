Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A65606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aCk5SEd2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=piXRLkxe/MMr3aw8+5GCp8kCJ3Al4TCZfqVsOYAL3vM=; b=aCk5SEd2uDrs3A7ns4/cz5/BKI
	2B9opVecJHqoaoPxOItaNwnreSgBDgpEt7kw8OX24/10hc3oVhjiWn1jOv5DY/oclm94/U4oJDNWr
	QgvxV+O48Nrr4GxdVZ3Gq+h9lu7mIGiXzTWfdUlCtJvXy95QP2oJEBedkmYfP5NTfEYyITUiwUDk6
	NsX1pfteQmsAKT8xR9WgSF5cD5wgyyjdHqY17Nuf7uPVm1C11kQgkegS5HBFejL9aHCVULLmqUhxi
	Y3C1Jx/c0JCQ/FvSJOX20wW+QUG6a1CiR2z/9qLFVnStl1qpvn239i4MRSVZr6A9yIxCxgVURUtGZ
	n2LSoj+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoi5-0000000G5Wp-0sVl;
	Mon, 02 Nov 2026 09:52:13 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoi0-0000000G5Vz-1zzv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:52:12 +0000
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-6 (Coremail) with UTF8SMTP id AQAAfwAnCX5BXehqOUXYAQ--.19552S2;
	Mon, 02 Nov 2026 17:52:01 +0800 (CST)
Received: from localhost.localdomain (unknown [218.76.62.144])
	by mail (Coremail) with SMTP id AQAAf8DwSHU3XehqVDv0AA--.22683S2;
	Mon, 02 Nov 2026 17:51:51 +0800 (CST)
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
Subject: [RFC PATCH 0/2] Allow reusing PCI domain numbers in DT
Date: Mon,  2 Nov 2026 17:51:48 +0800
Message-Id: <20261102095150.2370959-1-cuichao1753@phytium.com.cn>
X-Mailer: git-send-email 2.33.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DwSHU3XehqVDv0AA--.22683S2
X-CM-SenderInfo: pfxlux1drrlkut6sx5pwlxzhxfrphubq/1tbiAQAHAGrnk0kE5QAAsw
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=cuichao175
	3@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoWrtrW8Zw17Wr1DCFW3ZFyrJFb_yoWDtFc_uF
	97ZryDWayUAF1Fqa4fJr1SqFy8uw4DJr1jyFZ0qF1qg345ur1ay395WrnxZ3WxJr47Zry3
	Cr93Cwn7u3ya9jkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
	Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
	UUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_015208_641305_4939CDE7 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series allows multiple PCIe host bridges to reuse the same software
domain number in Device Tree (DT), provided their resources are disjoint.

In mainstream GPU P2P functionality, whether the GPUs participating in
P2P belong to the same PCIe domain is one of the decision criteria. In
the existing DT path, a uniqueness constraint is imposed on the PCI
domains of multiple PCIe nodes, which prevents devices under different
PCIe RCs from reusing the same software domain number.

It should be noted that equality of PCI domains at the software level
is not equivalent to the final P2P decision. The ACPI path directly
returns '_SEG' and does not perform a similar uniqueness check, as
'_SEG' is a purely software concept and allows multiple RCs to use the
same value.

Cui Chao (2):
  dt-bindings: PCI: Add linux,pci-domain-reuse property
  PCI: Allow reusing PCI domain numbers in DT

 .../devicetree/bindings/pci/host-generic-pci.yaml  | 10 ++++++++++
 drivers/pci/pci.c                                  | 14 ++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

-- 
2.33.0


