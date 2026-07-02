Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6954AC43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SH7WQ9SiDmPMZjRW1eSq8yZFjs2MRMTIkpOwzk9G5V4=; b=gLp6+4CJq7Ldn2Yopcj1uRtXFf
	Dib4rg8LmkWXLIcKflx9Yi4cK/WaHymkBgeMbE6hoQpLbIsFMhMKqV30b4pLj2louSZqm7eUsnTAW
	RpiX3L/nOpA1SgTYme+v5i54qaONpXs7WqFHVZloLSHI+FGby/9gEx2DTTV+Nlanvg9A+rLX6OXI6
	fmedSzOg3t9ZGNZ9XFwUkzC+/AgKEDvWSqvjmEsLn6bafcNM3c0Jju/L5hIMze1jA7Fw7yNzL29Sw
	pU+/utUpKzO+Vjc58/yT3pKo6XRBW/CIjdD86viWPzOh+YoaX/6v2xOQTTEYZRqEmvKA7K9O7PcGF
	6ObAyQMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMsG-00000005Lg2-451V;
	Thu, 02 Jul 2026 19:15:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMsF-00000005LfZ-2nsk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:14:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C172601CA;
	Thu,  2 Jul 2026 19:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF691F000E9;
	Thu,  2 Jul 2026 19:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783019698;
	bh=SH7WQ9SiDmPMZjRW1eSq8yZFjs2MRMTIkpOwzk9G5V4=;
	h=From:Date:Subject:To:Cc;
	b=KrjLEjSP4FiHTUsd/cegqj0k8a4XS8Yg2wuGlC5ffjrDDiqfnd9D9A9ALDizhzSsZ
	 m+c6QAICxeCGvAs3WVN75eRmDvYb0uUuo8QYddDppQ4dSHW1nIhj1CLm5FRiAjEvhu
	 4J6sqCL+329qgryhhQgGBfDF+hb+644Gt5e5uWi0pdoFicG2bUFxjKmIo3fqBu+20r
	 sHr5EqcNkzISd8XwzPAlzGe1gaF+leFXjbeEXKDZBNtPwzGJBpFd7FZfsghcgITVbw
	 hqVNRIJvYB+U/fiJvkag6A6LOYuPDhf97ZLO3aE7voThAm1Jz3sVG2V5kSM7fMQbnr
	 Mob0IhMmhIgdQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 02 Jul 2026 20:13:35 +0100
Subject: [PATCH] arm64: mm: When logging data aborts only decode Xs when
 ISV=1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-arm64-xs-decode-v1-1-64600f149969@kernel.org>
X-B4-Tracking: v=1; b=H4sIAF64RmoC/yXMTQqDMBBA4avIrDuQsTGIV5Eu0mTUEfwho0UQ7
 97YLr/FeycoJ2GFpjgh8UdUljmDHgWEwc89o8RsKE3pjKMafZqcxUMxclgio/f0JGfJ2KqCXK2
 JOzl+x/b1t+7vkcN2b+C6vkN/yUhzAAAA
X-Change-ID: 20260618-arm64-xs-decode-aa1316410455
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1954; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xM6NQHWl+Dt8zD7RchVRavjCeaB+a+Le6syKuTiV13w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqRriwhS37La+L4a041/nb4xr0U19aTrdaxha/z
 Yp5Nz3JqQyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaka4sAAKCRAk1otyXVSH
 0LkMB/wKOqD20NDH9z5OeLLuvsdOzYcGjOehHr4Byr7RBXfkCsumnuhLwWbd6BeJBEwOWyNIEHO
 /usVB0nmD0+5GxQQilX9PPE3j7PG0ia+Nj7FcZtAR6DXlho1fv+ZBh1RN3uW7ST6z9uB1ifVO8l
 5qofqCEzXNbFJeFr4SFGeIhAh4UGTDN6afoycFFrqF9PrxsmX1aJgKGK38lWn+ObhtQiS4ZfdX/
 rqBHfa3NzPGGrBeXXLzJzTHEhpG1Uu34GhH+dYLkFHKGD3KBzPh2HWKCJWG6L1K9cWN2Aq79TjD
 Cby/M1jyjJQN7JhvkFDkPet8XSLwAaNN5Mo7Wji7dxVTwH2h
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

When logging the decode of a data abort we currently unconditionally decode
and display Xs. Currently the only defined non-RES0 values for this field
are for cases where ISV=1, move the decode of Xs into our existing check
for ISV=1. This avoids potential confusion if some other use is assigned to
these bits for ISV=0 cases in future, or misleading someone into thinking
there is a meaningful value there with currently defined architecture.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/mm/fault.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 85e23388f9bb..0b52557652be 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -76,6 +76,8 @@ static void data_abort_decode(unsigned long esr)
 		pr_alert("  SF = %lu, AR = %lu\n",
 			 (esr & ESR_ELx_SF) >> ESR_ELx_SF_SHIFT,
 			 (esr & ESR_ELx_AR) >> ESR_ELx_AR_SHIFT);
+		pr_alert("  Xs = %llu\n",
+			 (iss2 & ESR_ELx_Xs_MASK) >> ESR_ELx_Xs_SHIFT);
 	} else {
 		pr_alert("  ISV = 0, ISS = 0x%08lx, ISS2 = 0x%08lx\n",
 			 esr & ESR_ELx_ISS_MASK, iss2);
@@ -87,11 +89,10 @@ static void data_abort_decode(unsigned long esr)
 		 (iss2 & ESR_ELx_TnD) >> ESR_ELx_TnD_SHIFT,
 		 (iss2 & ESR_ELx_TagAccess) >> ESR_ELx_TagAccess_SHIFT);
 
-	pr_alert("  GCS = %ld, Overlay = %lu, DirtyBit = %lu, Xs = %llu\n",
+	pr_alert("  GCS = %ld, Overlay = %lu, DirtyBit = %lu\n",
 		 (iss2 & ESR_ELx_GCS) >> ESR_ELx_GCS_SHIFT,
 		 (iss2 & ESR_ELx_Overlay) >> ESR_ELx_Overlay_SHIFT,
-		 (iss2 & ESR_ELx_DirtyBit) >> ESR_ELx_DirtyBit_SHIFT,
-		 (iss2 & ESR_ELx_Xs_MASK) >> ESR_ELx_Xs_SHIFT);
+		 (iss2 & ESR_ELx_DirtyBit) >> ESR_ELx_DirtyBit_SHIFT);
 }
 
 static void mem_abort_decode(unsigned long esr)

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260618-arm64-xs-decode-aa1316410455

Best regards,
--  
Mark Brown <broonie@kernel.org>


