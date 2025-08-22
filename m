Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376F6CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 06:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+gx5ZNCMsuG+9EZ8S5YZHwkusVOhHhpz+xIEdXsfkY=; b=hWoMfm5O4/lyvLe42XB2I8GWoh
	G4aCz9zVpL1yzTwV59Jc7QuaNiKxMngZN85GBoiX0l7Hkg2OllmxyKWEJACLed5jNdL4KlgtjRO3U
	/tevw6TBr7U6+NdhqXMtCtKWW7xisSpGmkwdqL55wZxJKy+lew7T+4YfPQRPAogcYbDpUWnHVyWeh
	oOCQkXnKUNf/AdSX5gRbHx63/SjOtnfcikDVfCaohHzXIDrJQZHLctpdTaNj+39aOjJ0cc9KcZtYC
	7v22RsvWc6sTwGPtPV7uP5SDYqJ4eIwOU/UcWJpWSNrEtkNqe4WLefYwQey8jsG2rVGHCq5myavCR
	KcpgWz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLaJ-00000001jww-2jDP;
	Fri, 22 Aug 2025 06:49:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upGzj-00000001Bbd-0anH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 01:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=j+gx5ZNCMsuG+9EZ8S5YZHwkusVOhHhpz+xIEdXsfkY=; b=oO1HWRSaU0OWDbtjq0g/nrMdLs
	/YBbDIbQKvtOzn6icY9+LqNrhRu6JguWAXXZE0Stu12cy0Iw223lOqLQjjkj8ShTvkBYgPqgoudqT
	UOwMntiO2KEj7aJgKBk36jamY1yoy0j0wf/QZVWBdO5X1wz60/mm+87EJZRaUQ+piWOfcOTiJuJjW
	BTytd77QzLe3oJn8NWjwLQ8hpFhk4OrKTUUC4WITaGy8WcndAwhqMq+qRx26XcU9OLu9lhFZdCbI9
	J1QmMdodFqz6K2JYYZ2TyLpi/QqirdarxGNUZvkRvgp3LJdMO+QZ2/ngAUtg/JAJlkve/t5gRE0Mw
	Mb98PfFQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upGze-00000000jor-0awt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 01:55:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4DF2FA58764;
	Fri, 22 Aug 2025 01:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E43C4CEED;
	Fri, 22 Aug 2025 01:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755827694;
	bh=LDt1xNEXDV4dCIkz7nCmkUUILCzxDoXGLDJ0dFTAhvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rQ1QAK+ejMF2UsJTYMuGaQ+IUgv6wAQRUG1tk9AKVHc5EzOuBwatDMV2fTFBvZn5i
	 87J0trOaDm015XUoetk1CWfbiu72sypzgCtoDDeLo2MplMOpClXboXPx6n2LAwQtlI
	 urSrhJtfcvsQNLTXMWNHZlSdzZn6nPjNjCh8wiSrdzNVuZmFKpDz2gWbssytXP0xQj
	 hdnvytjfOnWU3HcUfPGND+WYEGAsoZY9VUQyhlP5r9Uwm2klEWv/HyQ1KXx1U6urkO
	 5xfvPPiAcsEbwTvMO0C7wpnFfhQ+O9tGhCETceauxB6SJXbA+ztvKYRHrFoqC6JPof
	 Bf1ng3cyhJTxg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 Aug 2025 02:53:36 +0100
Subject: [PATCH v7 07/29] KVM: arm64: Pay attention to FFR parameter in SVE
 save and load
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-kvm-arm64-sme-v7-7-7a65d82b8b10@kernel.org>
References: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
In-Reply-To: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
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
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LDt1xNEXDV4dCIkz7nCmkUUILCzxDoXGLDJ0dFTAhvY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBop829BfoReXLtofNQ/kSrhSNQrNRdpaxmFkV/T
 Frm4XVS2POJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKfNvQAKCRAk1otyXVSH
 0IjhB/sF1Ys0WLO7A1A82RVjg1EGqd6NKiYg5AvJPYIvoPas6kpQsDCY2maqTagJ+xiueDoTxRm
 HJ+ZMnY0BudQLN8nXcOQRjKKhn59JQHrd+pJp2OPk6mjp7ev5SCENSoVRunepqOEGx1Yid805UO
 +ikcucvpnAOHOhDQofC22vWssdqMANC0G2iE1fVRSVJy9f/Svs+TlZknaG1Psh6GoqBv65WFtAj
 8ZyObioXb69XxEJXUIGvn4HL40otAYtrv+4XDSkIS9qOt8NgMXM2iIzVSGDgNaMDRUyoplONbqH
 xY//UrwfZs8HibaGIExxej3MEd3vb49SGNGl3BJ+12BEj139
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_025502_959541_4268662C 
X-CRM114-Status: UNSURE (   9.52  )
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
index e950875e31ce..6e16cbfc5df2 100644
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


