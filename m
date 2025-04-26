Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6568DC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 12:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Myq2XfHVb0MCYxGwUIzv9irNP9ib+OZ3T0q1M7+MjU=; b=1Cc3JHXylIfU+cPn/EHR5tK+oT
	iuW+aBRm/ODFRVP5Sxo1YUKT4JkRMuTQ7QmFiUsNUH172Slex5MDAZk/kJvd0DBmR0F1Ec3UQ7Anq
	FEFFamWOmT0uklud5bH8iUqi5nKzBYnFbaPxHVmlgIyVwH7cP9pMTDP+oxNmQjiHyWztWgid9IVL+
	cHaY24uHL3WaXgO9KKTvWB46ZuoUdlkYs7utA+A/zhFwxEJlYf2naWpKenK6jgdx/ZVH8ia5avZej
	oYmt4IhiV8yThiYKz6FPVhIKpvEsIKnSrt0pM02Nxpza8AfYXvrIrLAkeRMEub7kfhbfTMCPsRQgJ
	/ICUC82w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8f5z-000000022MU-0c3R;
	Sat, 26 Apr 2025 12:57:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeN-00000001z1C-2BS4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:28:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C15E34A6CE;
	Sat, 26 Apr 2025 12:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7470BC4CEEC;
	Sat, 26 Apr 2025 12:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670534;
	bh=Uxgz86q4vttcqou3lbEa8mbH5Xk35X47+RPO2LMlXkk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XdQuYbdxcKyau7PSbfz8GgotYQ0d4XCoE7ZH/PaR17p6qpEvWfqYssMiNN9Pte/tv
	 KKbkMmS9Do/MgtFAce8M3nz2Q/wplZNAP0gbwaDP306vmxhy9wmHdw+8G3u5RWz9X+
	 CekYPwUDNLr70IPeU1DiKrmvpmkMxxJJ9QjqcRi6lhrhw3Ab5SXg9iAWNMtRiMOOQ7
	 48P2IoloewPk69eJh1y0qEkuburu1VxnjTAhwn/k4wQTW1wgVCKsf1W3qEx+bd3PU2
	 WsxWM1PJhGP8BXski5SikAhh6Sv2Jy6J5apjxoazthGP5Xr693qU0mHZ0NZC/4knWK
	 Ry2PBF3atuKKg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeK-0092VH-JQ;
	Sat, 26 Apr 2025 13:28:52 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 15/42] KVM: arm64: Tighten handling of unknown FGT groups
Date: Sat, 26 Apr 2025 13:28:09 +0100
Message-Id: <20250426122836.3341523-16-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_052855_592910_DC72BB53 
X-CRM114-Status: GOOD (  13.29  )
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

triage_sysreg_trap() assumes that it knows all the possible values
for FGT groups, which won't be the case as we start adding more
FGT registers (unless we add everything in one go, which is obviously
undesirable).

At the same time, it doesn't offer much in terms of debugging info
when things go wrong.

Turn the "__NR_FGT_GROUP_IDS__" case into a default, covering any
unhandled value, and give the kernel hacker a bit of a clue about
what's wrong (system register and full trap descriptor).

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index efe1eb3f1bd07..1bcbddc88a9b7 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2352,9 +2352,10 @@ bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
 		}
 		break;
 
-	case __NR_FGT_GROUP_IDS__:
+	default:
 		/* Something is really wrong, bail out */
-		WARN_ONCE(1, "__NR_FGT_GROUP_IDS__");
+		WARN_ONCE(1, "Bad FGT group (encoding %08x, config %016llx)\n",
+			  sysreg, tc.val);
 		goto local;
 	}
 
-- 
2.39.2


