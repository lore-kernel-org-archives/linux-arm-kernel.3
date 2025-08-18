Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC6CCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pT+FesBFtq2q0zpSE/VooRgFKvV6p27aGiOwtFg7aSQ=; b=Wd3w1fKk0ZgL3GjNzVBH9aybGT
	6YaNLeM4MlAJReti4xkyNyijklYBigJgN5eF1MOSiSipbuS2b+vrW6ftJ2vWYPErZyCeDdDL5xaAA
	/R8Q1Jw6PiHnHGSdgHPdD4APxXmdileQlJ10S0YlJb2A8jKDIftFFjnFWA9kbNlylYeFaykWA+1wm
	Oxz5c7AdKYjWsdEPYERCBZpMDUOMBPudS16jJ7bfoiG48i7lyWK7QrDyAzDd0x5Kj0oevE7kZvqJC
	N8LP5kWXzaIWXL8e6fYeWjt1ZfolSt8TJ4BKnn3eUtvLuVZmhP27AJm3WG4223IsVW/9UZSNAv/6S
	g1q0DG0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3nD-00000008E2k-1Cuw;
	Mon, 18 Aug 2025 17:37:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3KX-000000085uj-1Qsj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 17:07:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD0C35C6267;
	Mon, 18 Aug 2025 17:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB006C4CEEB;
	Mon, 18 Aug 2025 17:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755536852;
	bh=KhHns3MO0aHvf+3Asuji1SH4gKY6cGswxL3bjgtAUSI=;
	h=From:Date:Subject:To:Cc:From;
	b=J4Zht8J9cq28qvrFdNfKEhj6+9ZF3/cDfE7ThTl02xFlct9SSpXoQdeE+ZpCY+KM0
	 EYTnSOOkZ/JwKjy5XlRnbhw+Y/6XpZcrlzAm1+IIOp1fzbb1LAdT7qBr1h+ViURf1d
	 KdZgz3aD2/S5BBlkUT//+2y307Hk5JjZFIJbzRaxWAV4eBFHuZsllpGzIzuQLXZQRT
	 FAYbTz6kW81T5dWMQZyfCYCVrS10hZDko46lU1fHnWNouAKx4Im9wJNTtRxbfGeJmZ
	 lJJlSM8Sa30BxbDZuKP+A7L7D6AaGCqCyiIs9lPGIAoed8mGkZhY0mmF3J+p+A4uc0
	 q0vt3kfqcYVBg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 18 Aug 2025 17:41:00 +0100
Subject: [PATCH] KVM: arm64: selftests: Sync ID_AA64MMFR3_EL1 in
 set_id_regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-kvm-arm64-selftests-mmfr3-idreg-v1-1-2f85114d0163@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJtXo2gC/x2NywqDMBAAf0X27IKJ8UF/RTykZmOXNrbsihQk/
 27wODDMnKAkTAqP6gShg5W/WwFTV7C8/LYScigMtrFdM5oO30dCL6l3qPSJO+mumFKUtohCKw5
 PH8cwWOdaA6XyE4r8vw/TnPMFI+NEvXEAAAA=
X-Change-ID: 20250815-kvm-arm64-selftests-mmfr3-idreg-7baf8d724431
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KhHns3MO0aHvf+3Asuji1SH4gKY6cGswxL3bjgtAUSI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoo13QE86Q+y16bpfWE+6x/9uKmyweiprMs5xFd
 i2iompCKpmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKNd0AAKCRAk1otyXVSH
 0BLnB/47gyQvwyahO0s7MsRSP2NgxKt/teBkTEhY6fNSSnTUGClsLhO1v7AwheWNVNuF7pMb9N3
 sSFAFAcJwQaJmtRlJQca/uTn5FLMGV5Fp3EznJ1nOatvjL17YpmJixZyGZOppo5cNL6+TBLCiUp
 CTVDIgAWbUAkzhA8NVdmyRQgcoQA/cW7vq2y5/2tLPCkcr9vZqkjeiDA45szgLRWm0KtfEXRcRe
 FU63m2c+k07H7iPqyDtf0m9qDWgrgvNHD1yaqpyze2ryyrVywr7tMsxSJSryueQ3TMxHXU0ymMk
 MVb302LVklf1wglLZJWS4Q8yT52k9g+yv/ZiLqqVnk2lf6+H
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_100733_428397_7C66C3BB 
X-CRM114-Status: UNSURE (   8.56  )
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

When we added coverage for ID_AA64MMFR3_EL1 we didn't add it to the list
of registers we read in the guest, do so.

Fixes: 0b593ef12afc ("KVM: arm64: selftests: Catch up set_id_regs with the kernel")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index d3bf9204409c..97d5ab9ef0fe 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -243,6 +243,7 @@ static void guest_code(void)
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR0_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR1_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR2_EL1);
+	GUEST_REG_SYNC(SYS_ID_AA64MMFR3_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64ZFR0_EL1);
 	GUEST_REG_SYNC(SYS_CTR_EL0);
 	GUEST_REG_SYNC(SYS_MIDR_EL1);

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250815-kvm-arm64-selftests-mmfr3-idreg-7baf8d724431

Best regards,
--  
Mark Brown <broonie@kernel.org>


