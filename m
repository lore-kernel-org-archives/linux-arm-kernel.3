Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92220C43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 22:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgDHYDGdp3s1Dejk8hKBifIQkaWCPHBgxY5F3+CDVvM=; b=3hOMhIvWILvSJQzTKS4ySSIfnU
	ZJgmiu6YK9dCbfaF1wo4Ym9qFlB9h//gXP658irW+ikWEZTHknYXrwRX8Zh8xIh0uFP+p9abARgqD
	DHS7qV05BadIf1NR6qy/uwGlm70T1PZPQNyI3sF8tsB1MLqqzlxI7pmPpL2cDwYbE+m7NyFcvozF4
	ou6efT6xg5UDu3bMgc8kaG7uG7p8sQMyBToCRiDZLIyj/m/eok20KO6swOGZ6BLAJy1ucWRwQ8W8F
	TLSccB4GR2zdJvtYU69TIs7snhFovp/Ee6chqEh1JMeBZbTR6wUp2elCl4/RaTKnsVo3N4qWZ8fVh
	yPw34ysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDY-0000000BuZT-1YYy;
	Fri, 26 Jun 2026 21:36:08 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDJ-0000000BuMH-0sxs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 21:35:54 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-37c9d82cd57so1032667a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782509752; x=1783114552; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=MgDHYDGdp3s1Dejk8hKBifIQkaWCPHBgxY5F3+CDVvM=;
        b=J2k6DUfJlrTrwXJfCV5ieAD1kk5/hxeMC1KEdOpRiYCMstViBuLf2DoFlL1VzYstXw
         7/nnw1qgEbZfU+bSrKfdsJZ7ZtuieTbYJHUYRAJ0Rwn4Cye2xG7rePXw+paRU3IynDV2
         Zqj+Fyp30AklJg/c+mCfPM+RaF6eq/mDP4KhgPZs4OsbaH9P3NOavZgIdqGgZuSMpaJT
         cRqnnnSjtNyDG+iOgUf7901Y4HO4fyWHy5YERvHxt3atFNDaWa3MnwVz8s8zlSQqCOO4
         oEQiwDKlTr3mUBIjdqugBXnezWO0fetkJtTqjaMM4Z/12Ei+46e8ZmmpGylfVbnLdUTN
         2C5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509752; x=1783114552;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgDHYDGdp3s1Dejk8hKBifIQkaWCPHBgxY5F3+CDVvM=;
        b=r6SljYjGCNbLaROxQyOzQtZMN++ZLne475KzAQvfTgwOmP6WLhOF3WIv4zn1uJ3bkS
         JHtN2dbE6Pun0upTs1nLlQsi8ksxIGXAYHRtQP1MCKiCP4nU6BbXDVXzpWVfmjjUx/MF
         GN1ac4ddvTfARTFDDLUG3DdLJ5fEK8FtEFdexjCuCAXos8deOMoII9N8s+kgbRjN1cwv
         1SzzGWJIx5D3x/bqieDxWZkLK2KfbgiGme+K91R8qzPYb7zVxkF31ql1uKLdStq9bHUE
         rHivtm38BlIt08bB1Kd9Nqj0Rgv36318gWoDdP/RB+ZrQ8wGjU+SreyIDmWQYa6dL1ve
         /j3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr75YZzgNAqhHJQe2Ljhsy+XVslSDlhQm1imCYKp3HWSx+zqj51A1xIpfI0EFCEBdR264jUJqC3rbRssVv0H7oR@lists.infradead.org
X-Gm-Message-State: AOJu0YwzCUi/fG7DSVVaOyKUVQppWP3tC8EoUTFoM0Sv9/0QoRCD19q0
	tld2Nmy7mrflKUiV/AFcOkSEgp3FvSdf3xKgF+hp7l7ZgTc1huD0K6gIgR/sbRmMWH4wT967i+a
	tYNyF3A==
X-Received: from pjbch13.prod.google.com ([2002:a17:90a:f40d:b0:37d:c9ac:4621])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:46:b0:37e:1ff4:44c0
 with SMTP id 98e67ed59e1d1-37e1ff4463cmr2659910a91.12.1782509751839; Fri, 26
 Jun 2026 14:35:51 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:35:26 -0700
In-Reply-To: <20260626213534.3866178-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260626213534.3866178-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626213534.3866178-14-seanjc@google.com>
Subject: [PATCH v8 13/20] KVM: selftests: Make number of IRQs configurable in
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
X-CRM114-CacheID: sfid-20260626_143553_256016_D17FAAF5 
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
index fd03ec940362..bb20bb81e930 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -146,12 +146,13 @@ static const char *probe_iommu_type(void)
 
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
@@ -186,7 +187,7 @@ int main(int argc, char **argv)
 	struct kvm_vm *vm;
 	int irq, irq_cpu;
 
-	while ((c = getopt(argc, argv, "ad:eht:")) != -1) {
+	while ((c = getopt(argc, argv, "ad:ehi:t:")) != -1) {
 		switch (c) {
 		case 'a':
 			irq_affinity = true;
@@ -197,6 +198,9 @@ int main(int argc, char **argv)
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
2.55.0.rc0.799.gd6f94ed593-goog


