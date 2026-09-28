Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D98FCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jR3WhNAC7esZJyW8kVFTlbkrx91BH/WUnAY/2qjkEi0=; b=XzORyOD3DAAbroOQdiNGVZxo8T
	vPM8KCbgnpZ1/Dm7fN33//aCylH12JKnzWdh9j2HHbD7WNvT+2G2cJYxpxeNML13jVwkmxtLQGd6D
	VdXAvZ1q+2s8qy4jCtbzi09bExrnzunKzVAv57hIjytg4mPaUfa0q2W61ljL2mmAgG6p4tpDun1fl
	4EovqdyjuYIgn6BxIAJlVlfaLqFE41AAkveKt0sxYoWLuaMXrAJKPJKhB9YHT2qCRMqGRYOMlb41k
	tyb6AFs6YV2fkmjWbOolEYKO76o4U1svkP188AOKartHz57oct/6+jLksL1KUVJZyReeJnmHzI1mp
	zbMpD5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDFe-00000000tz5-0Pvx;
	Mon, 28 Sep 2026 15:26:46 +0000
Received: from out-59.mta0.migadu.com ([2001:41d0:1004:224b::3b] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDFE-00000000to4-1MEo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:26:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=gCZ4+xDzVSAKXpVOsX9KJAGTjtUx6xvPoFZNvNTGzOQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790609178; v=1; x=1791213978;
 b=AT9jcM7Qb7MVac0xNbLN2XpMVJzWexGkjlsRZBfPM4eZ9YjBEOmOjPuFeyEFfvDvaSiTCQ0V
 pB/heBaslEVTk+8x2ASGL4xQ6gsNjOmniWZl1dNa6z93fBb4C+XM559RmHGQrKdfWXKiAMkCzev
 soUuKHZE2vX0fTuntJ42Bh9Y=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 741b53cb36a0a279;
	Mon, 28 Sep 2026 15:26:18 +0000
X-Mizu-Trace-ID: 741b53cb36a0a279
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jing Zhang <jingzhangos@google.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/10] KVM: arm64: selftests: Free the thread arrays in vgic_lpi_stress
Date: Mon, 28 Sep 2026 16:25:07 +0100
Message-Id: <20260928152507.2116110-11-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260928152507.2116110-1-fuad.tabba@linux.dev>
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_082620_514716_D9F1BB0E 
X-CRM114-Status: UNSURE (   8.06  )
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

run_test() allocates the vCPU and LPI thread arrays and never frees
them, while destroy_vm() frees the rest of the test's allocations. Free
them once the threads have been joined.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
index 9a69c439a0f8f..d09db95db3bd5 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
@@ -330,6 +330,9 @@ static void run_test(void)
 		kvm_pthread_join(vcpu_threads[i], NULL);
 
 	report_stats(delta);
+
+	free(lpi_threads);
+	free(vcpu_threads);
 }
 
 static void setup_vm(void)
-- 
2.39.5


