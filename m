Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54D6C3ABC7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Myq2XfHVb0MCYxGwUIzv9irNP9ib+OZ3T0q1M7+MjU=; b=WCeWS8unIQ18B4FOBgBeLJ6EPy
	3AkaNWFZV+72XQCBMCLIxDtYJts8iVCthZVO4hyT7NxQOCiFsdoSQZ2PD0ZZ3KGhuKwIXhILrtIYr
	M2G7P631hPk5AoariqMCbUnJ8IkjOwpwT6Rt8LOI9ldUVJt75COchawobbdzYEpd49XZ4lVYCwg6C
	6x33uDeWNLZ1YH27vTeJmf6PRc0N6o9Hmzo0K4d32kmIOcfvAajzQUDvWQs6t2wp8wxST741/wbNY
	r5VKcDVcxkyyBn1OsE9zGcEbCqtyXqwf4wJgFfdOUphCAgCpi0TiyeEwHygDR70u5YTVov2jwxN68
	WllUAGSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQgl-0000000DWSi-2saA;
	Tue, 06 May 2025 22:22:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLOu-0000000CiKY-1QZV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9317BA4D6FD;
	Tue,  6 May 2025 16:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B49C4CEF6;
	Tue,  6 May 2025 16:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549851;
	bh=Uxgz86q4vttcqou3lbEa8mbH5Xk35X47+RPO2LMlXkk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AIZ+RaXnP4PF0CA6k34lsw8KbJlvuVCrD4cMCVUsUnYoKNL4G30axhDvaml9B37NZ
	 LbE6jgqohLjDouNpM1RkpfoIsLd0v1I5a8+jy5/2gjN4B2e3tE09Zzj58qUuSwk5ON
	 BFlhfGoCJ7DIVix6KOdOZB7LpzXmtnL8UI8pRWN2tFNhkksnOTRwaiV1h18LcsynQO
	 kUqndh1pMOPrq3QNNVne0WOcWU4Oy2EPcCCQa7IUaufX/rLurf3GEHfLp6K5x+FHBL
	 S6iyL9b5hEsfqJWnew4rTty8aIcXQGkDS71JZ2cKZBDK25cIHSJGPl7H5gXMzCqObJ
	 t04GdbWUf4Bdg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOr-00CJkN-MJ;
	Tue, 06 May 2025 17:44:09 +0100
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v4 16/43] KVM: arm64: Tighten handling of unknown FGT groups
Date: Tue,  6 May 2025 17:43:21 +0100
Message-Id: <20250506164348.346001-17-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250506164348.346001-1-maz@kernel.org>
References: <20250506164348.346001-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094412_453248_072EFE94 
X-CRM114-Status: GOOD (  13.89  )
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


