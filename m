Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A37606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 01:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ih1XuhCj;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QDBeBjv6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=07VnCDdZgrzdsG+27Xy41SOvbpr4/0B1ubxXinJ54D4=; b=ih1XuhCjHwL9ZPnFoPH4yRt/6r
	t2YhGGAJ7Jvz9Y4Gqn6TB7H1suy6ACjj2CBUNWqgXBOMDFaAq++Q68JhCvRDPXRQ/IgNKW5TyZ9wG
	xst4DI024WKbIWOxCuL1gQ/2/oz6DEVjaCC5JNhLuA3876pLV7RCBOiP9D8HZfuGvqscX5wwrzevu
	GwEJMBWzQ8GhbBbNGl87syYxefIiQ6PR2tbd1CB15iriNYQmA742dvE19cojMxCvdueFWooeESZf1
	PNLhMohbCCGQ9OL05llz8k4BtaDIUAX5FwWxXNK3O/ujPJERCoNGPbwp6QBNXmAdP6MSXea3bdM1Y
	C1yerCGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8K1-0000000Ax1l-2n0H;
	Fri, 06 Nov 2026 01:00:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8K0-0000000Ax1b-0IYe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 01:00:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E85A6020A;
	Fri,  6 Nov 2026 01:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9551F0089F;
	Fri,  6 Nov 2026 01:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793926846;
	bh=07VnCDdZgrzdsG+27Xy41SOvbpr4/0B1ubxXinJ54D4=;
	h=From:To:Cc:Subject:Date;
	b=QDBeBjv6NmLn18PB8g59CCbSZS4Z3hXFPUoxDHMbPPzaSVAZSnBOUzE6kur3wQ1XT
	 BzdQl055/pQj5sQEUqML6hIw+fqs7iB1LMjPjH986yMBbV13YyApbahkYIw3NEr55D
	 Z5mYlkFjyLOqwEFGkXn4dAbVwu09f5ElHiLTqH6eAZiGdLgclKF6xswaCRA/8jI7yG
	 GHzPyV6hJ8/xnYLnOZr0OU36aUPq/6NRtELg4gYgNCSDZtcysZ0vyU+XRWqmjs/dDy
	 uXgzfVKdBjcUGKRAa2jY+bCWeqkb4tisJSPdGDi5m6k5VULUHVe3QeGsVPV3PmPStE
	 Y8S8miXf5v9+g==
From: Thorsten Blum <blum@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	shechenglong <shechenglong@xfusion.com>,
	Thorsten Blum <blum@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Cc: Zenghui Yu <zenghui.yu@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: proton-pack: Remove redundant fallthrough statements
Date: Fri,  6 Nov 2026 01:59:52 +0100
Message-ID: <20261106005952.1369-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2160; i=blum@kernel.org; h=from:subject; bh=Xl6KJ6mk95FWXjn9wfGKPGwewowEPHLFqb1NTJTb9Bo=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlv1TpPm0v++iOv1DmZhUm66Madze4X/7lskP82c/Zzt pjGjl03OkpZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAiUoKMDL8kDpva3Nv8dIdT w/3Is77HOA4/kq2oWKkTXJwX0ivdqcjIsPKBlkHI5whef32xPSEt2i1NpdH3X67vKm8vuV9sJjC VFQA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Consecutive switch labels do not need fallthrough statements. Remove the
redundant statements.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/arm64/kernel/proton-pack.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 8096f8069893..155504de3ab3 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -141,7 +141,6 @@ ssize_t cpu_show_spectre_v2(struct device *dev, struct device_attribute *attr,
 
 		return sysfs_emit(buf, "Mitigation: %s%s\n", v2_str, bhb_str);
 	case SPECTRE_VULNERABLE:
-		fallthrough;
 	default:
 		return sysfs_emit(buf, "Vulnerable\n");
 	}
@@ -187,7 +186,6 @@ static enum mitigation_state spectre_v2_get_cpu_fw_mitigation_state(void)
 	case SMCCC_ARCH_WORKAROUND_RET_UNAFFECTED:
 		return SPECTRE_UNAFFECTED;
 	default:
-		fallthrough;
 	case SMCCC_RET_NOT_SUPPORTED:
 		return SPECTRE_VULNERABLE;
 	}
@@ -436,7 +434,6 @@ ssize_t cpu_show_spec_store_bypass(struct device *dev,
 	case SPECTRE_MITIGATED:
 		return sysfs_emit(buf, "Mitigation: Speculative Store Bypass disabled via prctl\n");
 	case SPECTRE_VULNERABLE:
-		fallthrough;
 	default:
 		return sysfs_emit(buf, "Vulnerable\n");
 	}
@@ -480,11 +477,9 @@ static enum mitigation_state spectre_v4_get_cpu_fw_mitigation_state(void)
 	case SMCCC_RET_SUCCESS:
 		return SPECTRE_MITIGATED;
 	case SMCCC_ARCH_WORKAROUND_RET_UNAFFECTED:
-		fallthrough;
 	case SMCCC_RET_NOT_REQUIRED:
 		return SPECTRE_UNAFFECTED;
 	default:
-		fallthrough;
 	case SMCCC_RET_NOT_SUPPORTED:
 		return SPECTRE_VULNERABLE;
 	}
@@ -768,7 +763,6 @@ static int ssbd_prctl_get(struct task_struct *task)
 		/* Mitigations are disabled, so we're vulnerable. */
 		fallthrough;
 	case SPECTRE_VULNERABLE:
-		fallthrough;
 	default:
 		return PR_SPEC_ENABLE;
 	}
@@ -930,7 +924,6 @@ static enum mitigation_state spectre_bhb_get_cpu_fw_mitigation_state(void)
 	case SMCCC_ARCH_WORKAROUND_RET_UNAFFECTED:
 		return SPECTRE_UNAFFECTED;
 	default:
-		fallthrough;
 	case SMCCC_RET_NOT_SUPPORTED:
 		return SPECTRE_VULNERABLE;
 	}

