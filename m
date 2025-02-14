Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B89C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VsPae/AIgdRA8eGvKv6u4FTnrugolHSptm5thA0+SQ=; b=O6/1QO6Zr0jEiGEOdcPQOAAW+S
	F3dt4G497XITgaWnBOtQYCLv9ceKjk4Y+XMLH5G2iUd73YOQZbV4Ewvc6FEbtCm3J/OqvqIm8mxhg
	/WsYRaXDRwbB0F8YTxJplZOcMcJ1NJbvcjnpYHLFl2v1+ZwtVYLdqmaYVcIgvDFB6zpsVDPewoqMJ
	ypv7ZtUwqISGYHNwrgtGYxIhCddVGJ63v1DZRMAg80Amohm2Qi1U5zu2qxu5tTX5eAXWlmXhC9Q3p
	4JhwbbjtCzrGCDD4Qt3NYE6a3J/D2EDYk0UlcHUwM5MVv23cFxSkl1rgLjS0Ra8DSoGG9P13MXD3w
	6ERQoJhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tilAg-0000000DJ6Q-0XMt;
	Fri, 14 Feb 2025 02:11:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1til1B-0000000DFDy-37d4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:01:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B635E5C5D1A;
	Fri, 14 Feb 2025 02:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B8AC4CEE2;
	Fri, 14 Feb 2025 02:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739498482;
	bh=JnEqIyH78l9xsw6E0vWUYiTwf0S6e7Oe4YtvEVb5AnM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d7UIjh0q+lcU0AxLdlaSXJLGrhIZWxBc+DQOAwQSY/QjBnAOWKlSJboYy6RpfYHjv
	 h5dCR3LHAieYy1H39UzMHoanhdUTdg52orb4Ko4oPiZlfWzmj4nufeT46HEKd9D7mU
	 CoeLjavVayJc1kdRwRAT0UQX+cegEboPALT4yJhLJysxLKveOImDweQyD1pcPdcOlf
	 HjPzAFslOi6e2x0grvwjfFLh96qVQxFL4X6EPhgfzr0xnzKjoKJNO9K1uC0t7Gedna
	 6WvekUWWXOA9nHEBKWOYLh0BqXdMQxWHat5cn5haNUjwTWTR1yLF7sDvRl9H3BX6BU
	 Gs420OjoUWyJA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 14 Feb 2025 01:57:49 +0000
Subject: [PATCH v4 06/27] KVM: arm64: Pay attention to FFR parameter in SVE
 save and load
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-kvm-arm64-sme-v4-6-d64a681adcc2@kernel.org>
References: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
In-Reply-To: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JnEqIyH78l9xsw6E0vWUYiTwf0S6e7Oe4YtvEVb5AnM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnrqPF+pAtXQPXSTsQZGuqvhemh9NN4G4H2ci9DUiY
 AClsV1KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ66jxQAKCRAk1otyXVSH0COFB/
 9U9N3HtxehL/e0EI+cW9a8BBCSt/vjX16EH5FMpRsx4zCyw3E7fWPLLgsoDgdZnMgNnc11B+WnvK6K
 Aoidkh0Q48OAkja1ZMtrKJlTYcXXuxOL6GVKyxSAr8oHydJ79ke2S9gb/XXFpvBGFDDqUzc5gQBp1f
 wxdw2M+BEEor2AOo6HpaWEMv8anIrmeG4w05y0SmrWPEnjNUCR2/SJaIeRQGBn3k0xp0gtfD/mb3mi
 EI8oKaanbuwZ4bg/zEW71/6bFvdkfrbGE3QsH0roySCGAwRGrudhRElr0IJSDnduaHpt3muWwGoawe
 vD6+erTFWPuV/u9/aD8b/aoaAmPlPk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_180125_830769_2F199215 
X-CRM114-Status: UNSURE (   8.97  )
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

The hypervisor copies of the SVE save and load functions are prototyped
with third arguments specifying FFR should be accessed but the assembly
functions overwrite whatever is supplied to unconditionally access FFR.
Remove this and use the supplied parameter.

This has no effect currently since FFR is always present for SVE but will
be important for SME.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/hyp/fpsimd.S | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/fpsimd.S b/arch/arm64/kvm/hyp/fpsimd.S
index e950875e31cee4df58d041519b7584356463c91b..6e16cbfc5df27e63732655dffea60d7039c37332 100644
--- a/arch/arm64/kvm/hyp/fpsimd.S
+++ b/arch/arm64/kvm/hyp/fpsimd.S
@@ -21,13 +21,11 @@ SYM_FUNC_START(__fpsimd_restore_state)
 SYM_FUNC_END(__fpsimd_restore_state)
 
 SYM_FUNC_START(__sve_restore_state)
-	mov	x2, #1
 	sve_load 0, x1, x2, 3
 	ret
 SYM_FUNC_END(__sve_restore_state)
 
 SYM_FUNC_START(__sve_save_state)
-	mov	x2, #1
 	sve_save 0, x1, x2, 3
 	ret
 SYM_FUNC_END(__sve_save_state)

-- 
2.39.5


