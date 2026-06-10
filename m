Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE511CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 00:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tqxmpm7d/JaqIgSqRfX3CyBlzjwL6Mz/tL0QEbP+aa4=; b=2Zuo1/lXOXl4yqUzdnV62dQ7kU
	SvR0yM05vPUmYvGI1mTUX/MbKSpgt/4fvux4s8v7fkHm10pUTxR03PVJhOzZJW3qHKrRHNKeqFwI0
	OFMbdWntiL0uRXl/ypdyMGbmmqjd/K9GnMJNx+8wDhgiQA7kbLL6Og6PTRaOtQGIChYg8/rezpgN0
	Gk3tmptKrss73dkt84BrTHxGUZBCCpuogbVINUW6dRuByI6F7sqmzzvskgf2pfD3CDGNTHesNc1te
	nIl8XTujm00e8yXGkLVL9ZwvyUGw8nkPMR0x3FbRsJFKBIDQTmqoBGSN0mBxvHVN5eVAkWrZb2SSS
	OLuBAnxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7Ci-00000006ZZb-1ouQ;
	Wed, 10 Jun 2026 00:54:00 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7Cf-00000006ZW3-36Wh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 00:53:58 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2beff6b6e74so61321255ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 17:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781052836; x=1781657636; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Tqxmpm7d/JaqIgSqRfX3CyBlzjwL6Mz/tL0QEbP+aa4=;
        b=Fw9GgYwo6yRCwVvixzAZYNpmBGLj/zc26GzVJymWorqWJ36JzPT1JgncpTlRpwZHOT
         nTWXPEp4tPybRyyGLRBxJCB5luDoBy8ggIgswro7wjV8BDAkf2VvRNxhN42yBI7p8p/m
         dS4Qq5oeGe4NCyS9zuLmAbLp25I5dgssv/WjoXVTSgMT9k4grniw+tpze6qE6RdMyA9+
         tqFwlwK6melqiaI6nc5OppCMlqqgri73qcPYh9s1dMC0I8CBMKFbrQtdR4rYeehCZK4D
         ph4TqfIrUkk+H0nsXYDF6SR6gxWnrLkaba3JO6rdQBuFzgbrxRU39SR9vApSxSK6byzn
         U86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781052836; x=1781657636;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tqxmpm7d/JaqIgSqRfX3CyBlzjwL6Mz/tL0QEbP+aa4=;
        b=oFQIoF2k7l78HeGzJZpWLGMwOnsscOW1lMtk3RLhTpobdSCXw8eLWEyxCZk4SawvVQ
         1JWXU5Klz/WJSqgRacXTxyLk+X/6BIOk4iB3f8C3LI/f5Jac8ZFeMrbAaYVB5OGn2U41
         bVB5LeV9Kq0Gr63u8KmaVLGXrN1OyTiYWX125IHJ6zxRjmIAyrzgG5EGaruj5D96SfZ2
         mvofSgrENKs6/AsGfAaaWEunQMcuQfVpU3jN67Ax4ShPpzBkj5Jn+17XszCblberxsHa
         0+2zPKoiaxSguYubstbUk3059E1ZspPT5+4DhSXx3821pHOK++oYDKHeypK3S5n8Gvty
         tr6A==
X-Forwarded-Encrypted: i=1; AFNElJ+MafCZQpfm+3ErAb0EvM3qEnmn2UpjdMXxrn2TOXoqqqqEAtjBREbuY9aN+c7VcR0RdQ6NLGDaZesPFC+CE+cE@lists.infradead.org
X-Gm-Message-State: AOJu0YwQGVyqB25Rf6PkfNpr8EbT6fZT3an1xiO0uF3jzsYMdznTLKTV
	kfbXLuizoZKlPgKp5uqlLcuDc5NakTVA0uTOqUKxkhU7xXiBb7fLqLCNhkbkSR5WTXqUxTu47yv
	1x6l2GQ==
X-Received: from plsa5.prod.google.com ([2002:a17:902:b585:b0:2bd:4f41:fbf4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c946:b0:2c2:5446:30dd
 with SMTP id d9443c01a7336-2c254463670mr157005975ad.7.1781052835786; Tue, 09
 Jun 2026 17:53:55 -0700 (PDT)
Date: Tue,  9 Jun 2026 17:53:31 -0700
In-Reply-To: <20260610005338.2967132-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260610005338.2967132-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260610005338.2967132-12-seanjc@google.com>
Subject: [PATCH v6 11/18] KVM: selftests: Make number of IRQs configurable in
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
X-CRM114-CacheID: sfid-20260609_175357_815941_E1334F6B 
X-CRM114-Status: GOOD (  12.91  )
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
index 2ad9efd9abc7..15791ba0a2f9 100644
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
2.54.0.1099.g489fc7bff1-goog


