Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC4BCD98DC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9sUY/ENZfo/yRx5ubG6cRB6yRWSUsHWXW31a/Wy3XI=; b=uNMBN+GddWfCpCfte/kHxAaYOz
	K1+b5qepqt2loJ+WyTCk+Nxo91gN9f+aKNrWe/n34VZNs+3SAPDIzXNhswSPFYD8KRa3kzkverZ7Z
	BcDXTbASyBkeurK7HJNK/4uy374aVvi4GTkzVIEnhpmXeV3mNgC9kI5I95M/apLZKS49RxmZbIclR
	3TYYYZ/hHxNDJJbY/Gl8Kje5fH1/iIkuC6/AYAXqDU+CWspENOiJHiTR4Vjbuvj5Cn8oL7UjqQK+w
	6qAOZDqlpe7JkwXA+W+QfDlFqWCLN6cIbAy+om/o1hWMYbvA1bZaBG6f0GCkK4jPCxPzzKmj96hZr
	NjkqHYpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7V-0000000Bo1F-2yRy;
	Sat, 13 Jun 2026 00:21:05 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7J-0000000Bnis-0vo8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:20:54 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-36e09ec696aso2404846a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310052; x=1781914852; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=q9sUY/ENZfo/yRx5ubG6cRB6yRWSUsHWXW31a/Wy3XI=;
        b=Kg8RPQ4QOI/9JZ5gySa4wyV6FeqI/2NSFGdvL5+QRzr2+IygThU4xl4QEEGzXFaVCV
         OW0TVvdiuSaFMF7mpnR1RwBcmAPCOFDxAVxN2C/6mJrXgLGaWbbAtDVJ99dTtVNH9wCv
         4Mj0FKo0z3FFOXO23qfJ+ImiR20J7P4vGGAUh/oCC09bhwExYIeIX16T6axFEfzEjTaj
         imvarz1UXVg8ZJ9zdaSVwgGgqT8pHwMizAXVCcVdC6VQqlzvObaq4wJzsOOKmugslEH4
         lSlUv7TG2HcVfWYxFSSw5u0/ocitXux3plXAEXHtoZhh5LtrwbsqsR+S3LDz2J+ogxkl
         mFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310052; x=1781914852;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9sUY/ENZfo/yRx5ubG6cRB6yRWSUsHWXW31a/Wy3XI=;
        b=soa4nmx6hmH6/4+0ZsRB82QRhVxhffEcIu0JcTpSp/eVU7QGJ71vShCcotnFgCy07K
         PCF5MjKAPdyz5cDQ7g2VU8WNh4lLIcElUkyKLCtgsz+C4LAVxUVwlNUtGK6gIQyc/Yys
         NKQjtRqw71maAH2hq3YXcAlkLA2V/XjyuyOcpQV3D3rXDzfoSv1O4bMAdl9hHzUmK9IB
         fxANZYmg8x/Jzfqw4nJlYSUgLy6Z7u95M3mFJoMlzICiCR8/q6a7ArloNNJGIqCX4yy9
         oWqdzZzNjv33zCkbrYu0iFTrBCbdZdX5o1clZ7RpK2j+jYGAVDnQ235WcQ50pWqp+hC9
         b9KQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nMKOzCXRzyGZ9Aqr/jZ4c/g4e8kM0mrI/pFlUpvD1rOQcFE3mx1m5YuBjTicBcN2woKTsaZM69G/vh1kjsSaX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy363MCh8NTsTnBTh/uG2pweZk6FYTELoHpBDDwUgaGObwB24P7
	rRhOjBSodt2RJa0OhUP7al/Fl4HTyzYkb1F5rZJdPd/sA/pszljSGiqUYC/luqqfQb1cnm/fro+
	/aVRP/w==
X-Received: from pgpd17.prod.google.com ([2002:a63:bd51:0:b0:c86:13dc:1ee6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7f87:b0:3b5:6b5a:4f29
 with SMTP id adf61e73a8af0-3b784012441mr6057241637.30.1781310051467; Fri, 12
 Jun 2026 17:20:51 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:20:24 -0700
In-Reply-To: <20260613002031.745413-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260613002031.745413-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613002031.745413-14-seanjc@google.com>
Subject: [PATCH v7 13/20] KVM: selftests: Make number of IRQs configurable in
 IRQ test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
	Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_172053_280201_165C24A4 
X-CRM114-Status: GOOD (  12.44  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Matlack <dmatlack@google.com>

Extend the eventfd IRQ test with a '-i' flag to let the user specify the
the number of IRQs to generate (instead of hardcoding the test to always
generate 1000 interrupts).

Signed-off-by: David Matlack <dmatlack@google.com>
Co-developed-by: Josh Hilke <jrhilke@google.com>
Signed-off-by: Josh Hilke <jrhilke@google.com>
[sean: massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/irq_test.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index 2356912e2272..2cfb6c24e8d6 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -134,12 +134,13 @@ static const char *probe_iommu_type(void)
 
 static void help(const char *name)
 {
-	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-t iommu_type]\n", name);
+	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-t iommu_type]\n", name);
 	printf("\n");
 	printf("Tests KVM interrupt routing and delivery via irqfd.\n");
 	printf("-a	Affine the device's host IRQ to a random physical CPU\n");
 	printf("-d	Use a VFIO device to send MSI-X interrupts instead of manually signaling the eventfd\n");
 	printf("-e	Set empty GSI routing in-between some interrupts\n");
+	printf("-i	The number of IRQs to generate during the test\n");
 	printf("-t	Override the IOMMU type to use (vfio_type1_iommu or iommufd)\n");
 	printf("\n");
 	exit(KSFT_FAIL);
@@ -174,7 +175,7 @@ int main(int argc, char **argv)
 	struct kvm_vm *vm;
 	int irq, irq_cpu;
 
-	while ((c = getopt(argc, argv, "ad:eht:")) != -1) {
+	while ((c = getopt(argc, argv, "ad:ehi:t:")) != -1) {
 		switch (c) {
 		case 'a':
 			irq_affinity = true;
@@ -185,6 +186,9 @@ int main(int argc, char **argv)
 		case 'e':
 			set_empty_routing = true;
 			break;
+		case 'i':
+			nr_irqs = atoi_positive("Number of IRQs", optarg);
+			break;
 		case 't':
 			iommu_type = optarg;
 			break;
-- 
2.54.0.1136.gdb2ca164c4-goog


