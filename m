Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC88FC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 12:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGtiJKFC+4PqVoLKD/yH9r97ziN6wjqXvuYJmigg/rU=; b=WPa3Hcm9tps7A4O+AaupT/n1SN
	QMky0wKbjES7+1PBRjpexyZk+zfrZEuOzDMU5VAJtQyn6U4R3kxbmdmLZtif/VNXfZmyxV2OUQkWn
	20aD78N9u1bN1lEX/2qrsZdcDIiXa+1KTrixbCr0UXCHMrd4ZJkUbJQf3A3oxug3KD+hgCrI9b9q3
	K/RqWZXMRkSFQO2+yS1h6m0OPR0Qta1fntep5349rWtXRoPSdcTxx72LneV4gc1AeMy2f6R7RZzR3
	YTDBA0VA8RDuvyafpFJ9M5KvJa6//WU4q41SlEcbB8oOzruDS7v4zu5+q9OaZwNuwa0rrWRaFBYTg
	NXxVa5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uEX-0000000GFcp-3DgK;
	Sat, 19 Sep 2026 12:31:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uEW-0000000GFc9-0y3k
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 12:31:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DC4E43BBE;
	Sat, 19 Sep 2026 12:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3421F00898;
	Sat, 19 Sep 2026 12:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789821115;
	bh=CGtiJKFC+4PqVoLKD/yH9r97ziN6wjqXvuYJmigg/rU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bkPIttP3wENNkUS8Jqc7U3PZ8Zz3btYMznZ2rlc6Aj/Yt3gWBAQcHDShvUeYX5rCT
	 /SYADMXh2uySLF8MnAlbL9VeljSm0tD7HM+Dh11JrgnFGG6vqbKoGseHt7xgLgjava
	 CDHw4fIG0eMKjXGRdJSc5WXlmcOcQBq8nx1DPvwgAkb0XOCIGZqiT/QjRXhZWKdqGk
	 w7dUDSgo+68m+iJ4XSZ75hSXX8LDRsgoIYs1w8EtCE7CbtuehPCuxucdEjUwGew9Rv
	 B44jkOamU0sYjm880Ssf2mocwh93BUuNzS2jRmroZ8dnlbf02krpTV3iU+PwJ8yemv
	 j+QVOKDVIHbdA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x7uET-0000000AwvV-2LdR;
	Sat, 19 Sep 2026 12:31:53 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 2/4] KVM: arm64: vgic-v5: Correctly reset h_lpi_ist to NULL
Date: Sat, 19 Sep 2026 13:31:48 +0100
Message-ID: <20260919123150.3283606-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919123150.3283606-1-maz@kernel.org>
References: <20260919123150.3283606-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Resetting a pointer to 0 is not completely wrong, but sparse
legitimately shouts about it integer/pointer mix.

Use NULL as expected.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609190952.glUgOBvp-lkp@intel.com/
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v5-tables.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v5-tables.c b/arch/arm64/kvm/vgic/vgic-v5-tables.c
index ba8a8d5fcc2a3..d7196ed5d1bfd 100644
--- a/arch/arm64/kvm/vgic/vgic-v5-tables.c
+++ b/arch/arm64/kvm/vgic/vgic-v5-tables.c
@@ -1066,7 +1066,7 @@ static int vgic_v5_alloc_two_level_lpi_ist(struct kvm *kvm, unsigned int id_bits
 		/* Free the L1 IST again */
 		vmi = xa_load(&vm_info, vm_id);
 		kfree(vmi->h_lpi_ist);
-		vmi->h_lpi_ist = 0;
+		vmi->h_lpi_ist = NULL;
 
 		return ret;
 	}
-- 
2.47.3


