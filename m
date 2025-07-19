Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A587FC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 02:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsexNHaM4jCVSuVd+py/oW7lMZzsP0ypq/9GpTlXY3g=; b=CkuitKy8+tEsqqtTfMpMM5X1TV
	sxDHpO38YYiu/V3FAi056EnTmH9yv1LpIYMQFWSpD+W8T7eDCDpz8vhL/GRjBEG+gNo5pyJHsQDd+
	4K8lg3ittQ9seGCY3vDMlfDYuj6hDNPvNCYe4HaLQOoauYaLM4CWFq12Bi7R7Px9WtefJr2We94ov
	Gph5RjPawYQCC3q3U7/i5H1Au+bigs45RCMq4hSA/XTALzBnYL7Rls3d67zIJnQPik41h53TRP76X
	qD5hN9N26kYJHdqcxwgG7p8GR7RuTSqwS/yruNGjS1ypOEvphIBGkAxvoqibPC8vZDJY5tYcV2Qg5
	LjfMeBVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucxD0-0000000Dk6b-1WiX;
	Sat, 19 Jul 2025 02:21:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucx3L-0000000DjJQ-0Hv4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 02:11:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 35AE545F64;
	Sat, 19 Jul 2025 02:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9659C4CEFF;
	Sat, 19 Jul 2025 02:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752891113;
	bh=Qkay+td2CTF8tiBwafQanjBkZb8hXhQmz0Ko/raVV7c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kvzBhPX2As4S9PpPjzujySHMe3jFqms6HMlL0V9wpkpYHlWsxrHjO9A2MEYY2eLbh
	 mEroUHMTA7LOsSDrqNMug+L0vFFnSHdZGYzahA6Vvkl/DHIDo8qMZYSLMmvBHlPltP
	 j7X3xEDLpX5YHb8RfrhHyPyfnoKrCWKomCE68FZk2mPohdZ2el872gDANrEIWpKI5w
	 cKLDKQlTeJAymtOSOmH/wMSwynhrOxQNZ90YfMlVunbB6jzAxYwi+kBX4aXJ6AXPc4
	 XT9NI+bklB9duXZFpDHsAnWe+3IoZSkWc9RnrL+D1yB1v9KaEgHLMDCPxpMl4l8zUn
	 0YKzI6KzZbJxw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB895C83F1A;
	Sat, 19 Jul 2025 02:11:53 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Sat, 19 Jul 2025 02:11:27 +0000
Subject: [PATCH v8 5/7] KVM: arm64: Mask response to FFA_FEATURE call
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-virtio-msg-ffa-v8-5-03e8e8dbe856@google.com>
References: <20250719-virtio-msg-ffa-v8-0-03e8e8dbe856@google.com>
In-Reply-To: <20250719-virtio-msg-ffa-v8-0-03e8e8dbe856@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, ahomescu@google.com, armellel@google.com, 
 arve@android.com, ayrton@google.com, qperret@google.com, 
 sebastianene@google.com, qwandor@google.com, 
 Per Larsen <perlarsen@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752891112; l=1363;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=55yA/b9WaRmX85NmDdLJkZinkMYQwcAGAdUeGaUKBZ4=;
 b=sNeyafSSHUrLsmXTiUjqsrcfVjOFuY4rtzvyG/u1PdIsoRhxBd/haBBhQ1GbB2Dt0nX/m0MLl
 pbxXYv/TMoOA6/Y9FNIxafXa33hJUmsrt3XKiCqhCvmuwtgEaAsL8Mt
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_191155_158925_3AB3AA99 
X-CRM114-Status: GOOD (  12.65  )
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
Reply-To: perlarsen@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Per Larsen <perlarsen@google.com>

The minimum size and alignment boundary for FFA_RXTX_MAP is returned in
bit[1:0]. Mask off any other bits in w2 when reading the minimum buffer
size in hyp_ffa_post_init.

Signed-off-by: Per Larsen <perlarsen@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 2 +-
 include/linux/arm_ffa.h       | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 5a173ea481940236356e2bc4248d094a858a0923..2cbecc9af5d27a9e7c8497001cf9b0987c72bdb4 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -733,7 +733,7 @@ static int hyp_ffa_post_init(void)
 	if (res.a0 != FFA_SUCCESS)
 		return -EOPNOTSUPP;
 
-	switch (res.a2) {
+	switch (res.a2 & FFA_FEAT_RXTX_MIN_SZ_MASK) {
 	case FFA_FEAT_RXTX_MIN_SZ_4K:
 		min_rxtx_sz = SZ_4K;
 		break;
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index e1634897e159cdc208931938649eb0fb04d5a070..cd7ee4df9045dceca1c4e0dca2d533b770b1b056 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -128,6 +128,7 @@
 #define FFA_FEAT_RXTX_MIN_SZ_4K		0
 #define FFA_FEAT_RXTX_MIN_SZ_64K	1
 #define FFA_FEAT_RXTX_MIN_SZ_16K	2
+#define FFA_FEAT_RXTX_MIN_SZ_MASK	GENMASK(1, 0)
 
 /* FFA Bus/Device/Driver related */
 struct ffa_device {

-- 
2.50.0.727.gbf7dc18ff4-goog



