Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649C4606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3bjMVX1Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gJnNMMnwMUzcu7RpJAfAtm5ftRwCHKJNH4erz+wHv/0=; b=3bjMVX1ZLMja0I
	tBiQUx2+7w82ntfob2cWg3rqC7Ewn5bDZrLxxK9/EscXrpTLI2OqtMXmlygHmMxka9+3HU37il3FN
	ogoTJZB24T/NleVfbhYsvTZpUe5oPb79avMuvn+NaJugmW2/oykoQ3Kz0vZu38sRXNFkKDjrvfiEE
	DVnd0/AEBGG9tuu3bBC8gLr74E5fOSuLQyCOA8YNGK2xNo2YtE5/wmzV6RFuxVxFl71xqm5xRLS2F
	cZuNUK+UpozLD9CSb/x4Hj4hCjI5jRznvfHj4ZcPw8ZLTL4HgVydpT14MCJpxerM7MMsIp5kLUn3f
	Amu+XGfbO0IeKOQD5YXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoi7-0000000G5XV-1EDi;
	Mon, 02 Nov 2026 09:52:15 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNohz-0000000G5Vw-1YZZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:52:12 +0000
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-6 (Coremail) with UTF8SMTP id AQAAfwC3Dd09XehqJkXYAQ--.31447S2;
	Mon, 02 Nov 2026 17:51:57 +0800 (CST)
Received: from localhost.localdomain (unknown [218.76.62.144])
	by mail (Coremail) with SMTP id AQAAf8DwSHU3XehqVDv0AA--.22683S3;
	Mon, 02 Nov 2026 17:51:55 +0800 (CST)
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
Subject: [PATCH 1/2] dt-bindings: PCI: Add linux,pci-domain-reuse property
Date: Mon,  2 Nov 2026 17:51:49 +0800
Message-Id: <20261102095150.2370959-2-cuichao1753@phytium.com.cn>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20261102095150.2370959-1-cuichao1753@phytium.com.cn>
References: <20261102095150.2370959-1-cuichao1753@phytium.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DwSHU3XehqVDv0AA--.22683S3
X-CM-SenderInfo: pfxlux1drrlkut6sx5pwlxzhxfrphubq/1tbiAQAHAGrnk0kE5QABsx
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=cuichao175
	3@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW7Zw18XFWfKw4rKF13Ww1xKrg_yoW8Ar43pa
	9a9ryUXF4kXF17A3yYv3WjvF15WrykJF48Gw42kwnrKFs5ta9Yqr9a9r1jgFyUCF48ZFW5
	AFZxGa4rGr48XFUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
	UUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_015207_547294_C724E9A8 
X-CRM114-Status: UNSURE (   9.34  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a new optional boolean property 'linux,pci-domain-reuse' for PCI
host bridges.

By default, the 'linux,pci-domain' property must be unique across all
host bridges. This property allows a host bridge to explicitly opt-out
of this uniqueness check, permitting multiple host bridges to reuse the
same software domain number.

Host bridges reusing the same domain number must have disjoint ECAM,
bus-range, memory, and IO windows so that (domain, bus) tuples remain
globally unique.

Co-developed-by: Wang Yinfeng <wangyinfeng@phytium.com.cn>
Signed-off-by: Wang Yinfeng <wangyinfeng@phytium.com.cn>
Signed-off-by: Cui Chao <cuichao1753@phytium.com.cn>
---
 .../devicetree/bindings/pci/host-generic-pci.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/host-generic-pci.yaml b/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
index 420d551e9af9..1b439e2f38af 100644
--- a/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
+++ b/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
@@ -114,6 +114,16 @@ properties:
       Requests with Address Type (AT).
     type: boolean
 
+  linux,pci-domain-reuse:
+    description:
+      Boolean indicating that this host bridge is allowed to reuse the same
+      "linux,pci-domain" value as another host bridge on the platform. Host
+      bridges reusing the same domain must have disjoint ECAM, bus-range,
+      memory, and IO windows so that (domain, bus) tuples remain globally
+      unique. A duplicate domain on a host bridge without this property
+      remains an error.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.33.0


