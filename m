Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E321C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnYlFKw2gC6YhmPu1z4HDJiUvpQLTVAYFHuFiV6NB1w=; b=rNVKZbqEWHf7sl/wHdI4pM8tdR
	tRPPOfFt5Zpv7ZtmpUGdGsNLjjcvOofixdXMmlVDrBRw3Dzhkr6XQ0eR/JYDvyWrKzfVoMAAvtgrr
	Dbo8Hzx8aAjBGpGu4fatHAMOevAKu3iJOLdZ40IzuR1srZYg4NkZc4xc2eSkK7DZYyylVobMRa6+w
	RtVnnoU0zx5rO7tz49mO8eD2MzbOP+Qtm2ITahmcVB3ZeyN7QhnGtjfW28u95Ivu/8/PP9YquHLCq
	+wVdfh9TKJu1Ac48lNyNFzRPUd8zjHBDz9FhKBGaOPjunhfh+UdeFuOkBEsDXs7P2BWSbqxZuy4D1
	S4NEI7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVENR-0000000FYqm-2SNc;
	Fri, 27 Jun 2025 19:04:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCpJ-0000000FPHH-3wIz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Jun 2025 17:25:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dnYlFKw2gC6YhmPu1z4HDJiUvpQLTVAYFHuFiV6NB1w=; b=K3emaxav1/g+pMpzjjsjlkjWY+
	NbE6SfMM0y91N7F9zstsWv8CNvyhWQQjDtlHNmBC7uBUiPX7lNbG/VOxRTKXQccaN0ksxRuSmr7Pj
	ThfeECDTAPlbO23I1awOO6WPrBjeNvba06KUdWDrtV7TSvUt7sNGJUVI7dvx0fmv/cv414ihvAXXv
	3MzfHI+qkwpp2la9YqxxX866VHCNj8S83wAvwlmKLD+a4LravlDjupaIl2Ic2MO8cipEHuCWH6aJy
	VhyEe0YUmnuGZLEOQONX84SkrFsmTKty8C/qS6xDGDz2uUB0iDMcfAaLajsxbRMIbGIZUp2+X9GIM
	H/Nouomw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCpG-00000006OLI-3hzw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 17:25:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9DA7FA53016;
	Fri, 27 Jun 2025 17:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F2FC4CEEF;
	Fri, 27 Jun 2025 17:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751045113;
	bh=90CTXdhM4nXMyJJrevGmqFnP/+4mWVosryCVClyymX0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=acs+QkaApBJ4j866g1JzSz4mabzMzDW/EbRNQufSODvNdSW5J+TUwkNy2ltyNwfxf
	 S/uO7eEust3ue0lx77kAgy3XPEGut1hMwWrxsQ/BanH/TXTiMKHeUpPkgYxrbCEKBS
	 aLlX2M7oGQAjpOvbqCU/9sZPtVzFaCdbjlSr0wtGALl2syRbs6I702m2Mn1NK9vc0X
	 NKAtMyKCwuwlB1uU5zoo1+X19QzQySq+0G9vgiDYjOlpRNsQdzYpl5AiV1/a7ZLoPs
	 YXxMFeXZpsklmoYxLLhULmndQsVjWhmEkE3H3c3b6HDw8bSE+z0tl36IeNBslm4mlz
	 HB5N7mgvQoqSw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 27 Jun 2025 18:20:45 +0100
Subject: [PATCH 2/3] KVM: arm64: Expose FEAT_LSFE to guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-arm64-lsfe-v1-2-68351c4bf741@kernel.org>
References: <20250627-arm64-lsfe-v1-0-68351c4bf741@kernel.org>
In-Reply-To: <20250627-arm64-lsfe-v1-0-68351c4bf741@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325; i=broonie@kernel.org;
 h=from:subject:message-id; bh=90CTXdhM4nXMyJJrevGmqFnP/+4mWVosryCVClyymX0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoXtPvo1Q9IWlfzKdT2SxDbt/hCcoPGNEpIsh/n
 gf0f1HU6JiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaF7T7wAKCRAk1otyXVSH
 0FQ9B/9/31gIL2CSNg29xUMAoNbUdzwpDLkOhtKr0sZD8J8Azdb7a9Y1I55DicWXIYc6+7dMUQy
 tGeufBHdm+WUCloBnS9xwszmL9FzhyLcfwFiMt11+RN7H0ZAMvYEr9dGwHgouNr5GZ50fMZQkQF
 /05yQK7m7tUBD/8JYAwvoRfRQ8iRRjCBMIHZwiUnEVJ+FlhF/xJuVsoYO/BaQPxfTJb2/77CM2B
 4+t555LIJiQ/wtwETAUZUpyM9iAAislTccKpyGVuPg+a4TzrwJIDDMufJP7oxrkCbp/0QtfE3lQ
 f1QrsxPfN/gt6ARLWACnW6K+/Vb89ZoZJOXmLLQVaqew2m+N
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_182523_137670_73ECB2D9 
X-CRM114-Status: GOOD (  11.27  )
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

FEAT_LSFE (Large System Float Extension), providing atomic floating point
memory operations, is optional from v9.5. This feature adds no new
architectural state, expose the relevant ID register field to guests so
they can discover it.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 76c2f0da821f..be685422bf9b 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1636,7 +1636,8 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 			val &= ~ARM64_FEATURE_MASK(ID_AA64ISAR2_EL1_WFxT);
 		break;
 	case SYS_ID_AA64ISAR3_EL1:
-		val &= ID_AA64ISAR3_EL1_FPRCVT | ID_AA64ISAR3_EL1_FAMINMAX;
+		val &= ID_AA64ISAR3_EL1_FPRCVT | ID_AA64ISAR3_EL1_LSFE |
+			ID_AA64ISAR3_EL1_FAMINMAX;
 		break;
 	case SYS_ID_AA64MMFR2_EL1:
 		val &= ~ID_AA64MMFR2_EL1_CCIDX_MASK;
@@ -2921,6 +2922,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 					ID_AA64ISAR2_EL1_APA3 |
 					ID_AA64ISAR2_EL1_GPA3)),
 	ID_WRITABLE(ID_AA64ISAR3_EL1, (ID_AA64ISAR3_EL1_FPRCVT |
+				       ID_AA64ISAR3_EL1_LSFE |
 				       ID_AA64ISAR3_EL1_FAMINMAX)),
 	ID_UNALLOCATED(6,4),
 	ID_UNALLOCATED(6,5),

-- 
2.39.5


