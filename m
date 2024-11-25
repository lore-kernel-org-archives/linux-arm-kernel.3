Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFB7D3B7F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OrSFAeaZkprBy7P3lMH7kOEBpCY6P76XdwhF0PdEGyU=; b=Gy7nSYgfRVEN9dNxf9pGtf39PJ
	/9G0j0SauF8aVU2eL+P5qW8od/RyESBR0YBVpzVBEClP9DrRAktfdzIERw6AwChSNoE7RHwnJJvKe
	vGrWgaPNtxvZdes5+FDopXp6tcrUEk7GvtwsbT9s84d23hBuAzGbJnfucOl3K+3TcSP4yxrW/QeRq
	yQ/Y1oIacwOOFZ1ntnP9/1SqnbLig1qT4oZyxkv/F80fd/5aqFSvnLI2PZcUrPDotoAXwhlzNJaEy
	mXxYwm2Ana5kZiN82C2letcQYqbx2snKd7gWgqdrcbSrH7KYmQZPoP/72Nh7D0RU/U4v1hDaeDqZC
	ztr2G3Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFW9q-00000007his-3hnN;
	Mon, 25 Nov 2024 10:17:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVhL-00000007dc0-0LoQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:48:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B5D45C2702;
	Mon, 25 Nov 2024 09:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D86AC4CECE;
	Mon, 25 Nov 2024 09:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732528082;
	bh=fFDoWawgI33eZaEQEGoUTTZhQQtQ+oC/k8T3cn7uRfM=;
	h=From:To:Cc:Subject:Date:From;
	b=K4Kn6JMkTVlXgUG0OA7Uxnxdbb9XjuI1MazRwEcQFVVHRZ7u1QcE2rAzl/TIGR7sQ
	 ZJxkGA/3qMlLgTFKobIswulSFDS6CT7Bf9oLAmBS90kMPl6HYudXGb1PpURDO/y9M9
	 UNMaldMtiUkJBBeJYL6d4li66SfOsyUGynw7RCrQnlsNBSdFP8ssp2b/eel9lyq+vJ
	 Mb/neaAqI1Dzfxfh4VcqHuFfV02OIvsW54iIuUGkZCRpe0zF3bmN7C4bx9z3GAG68t
	 LkAaV6tsO7t0uxbeVeCzt1MVGVg0YHoEfZrmz6GWdLdjjLkDJgvkWqe9xlN4YJtAPf
	 VHkTCGigxEdTw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tFVhI-00FecR-0e;
	Mon, 25 Nov 2024 09:48:00 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH] KVM: arm64: Fix S1/S2 combination when FWB==1 and S2 has Device memory type
Date: Mon, 25 Nov 2024 09:47:56 +0000
Message-Id: <20241125094756.609590-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_014803_161688_912F7CC8 
X-CRM114-Status: GOOD (  11.74  )
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

The G.a revision of the ARM ARM had it pretty clear that HCR_EL2.FWB
had no influence on "The way that stage 1 memory types and attributes
are combined with stage 2 Device type and attributes." (D5.5.5).

However, this wording was lost in further revisions of the architecture.

Restore the intended behaviour, which is to take the strongest memory
type of S1 and S2 in this case, as if FWB was 0. The specification is
being fixed accordingly.

Fixes: be04cebf3e788 ("KVM: arm64: nv: Add emulation of AT S12E{0,1}{R,W}")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 8c5d7990e5b31..98cb499fa4b11 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -739,8 +739,15 @@ static u64 compute_par_s12(struct kvm_vcpu *vcpu, u64 s1_par,
 			final_attr = s1_parattr;
 			break;
 		default:
-			/* MemAttr[2]=0, Device from S2 */
-			final_attr = s2_memattr & GENMASK(1,0) << 2;
+			/*
+			 * MemAttr[2]=0, Device from S2.
+			 *
+			 * FWB does not influence the way that stage 1
+ 			 * memory types and attributes are combined
+ 			 * with stage 2 Device type and attributes.
+			 */
+			final_attr = min(s2_memattr_to_attr(s2_memattr),
+					 s1_parattr);
 		}
 	} else {
 		/* Combination of R_HMNDG, R_TNHFM and R_GQFSF */
-- 
2.39.2


