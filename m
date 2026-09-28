Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FD9CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sh6Pmvo+oky2qgEQsEeaC94BZWoDkn7hbfzIYXVj9ts=; b=PSORHyc//yfYpUytVFGzz/z7gP
	rJ4Yf0ve5IxuIqyE8pA6A5HphZ9xF501tlyR0dqXYwHTpO9lZwtyc65Wfxqr5RTWB4uzNnI+++n5i
	F7nG0h/m6Se+xrzpxIOGVJhrZdAzVRfSw33yFqUbIGBstP7fy1Ecdl/qjfDM/o/S2Za+COIdFicKw
	nxKjfhQmkQ5dMOVnTphkCht4cn1O9dKe21aIFoJ3EaKXmcJaOSGZyapdvLz3ZPqeKeo8Aq927loJ5
	BRd1uo31OkqhdHb45cuRM0o0Vm4uJY41qlsHG80uEUxUjyzfCmdSxQv5TcdRbI3F7FC5uiPn6sPkw
	t3Ix8pDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB84s-00000000HtD-3JLG;
	Mon, 28 Sep 2026 09:55:18 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB84j-00000000HoW-0TRH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 09:55:10 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-487038a4a88so1652253f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 02:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790589306; x=1791194106; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sh6Pmvo+oky2qgEQsEeaC94BZWoDkn7hbfzIYXVj9ts=;
        b=jwLmLUg6r2qlYPRolWYtcdlzF4lVhANqCLmtMNRlG6bprvGxqwxrIQEinfgwyYOyUr
         ruU3bWoyn2s/rL45WLHYHlOG6VvmX34xnqRh7da88YytGnHzB5FFMzgijKcofP9gNeaS
         bVDwp1sycjjjATgGoj0W8kbaeVqFHmMsLuY3kQU3oT8uoLY5Uae08HOfk0g3AIjebAZS
         tThWEYd2AVrTlMh9cQnvodq6YIfYBBdzR4TUZeZVjzp1WI0Q5izty7lmbiTmHyNm9+kx
         Owx7Q7lsEqO5YPO1QKN+cFFNi9Npyene7TxVsfGdnsdxMg3GgqlqWFXnqGYYa5ePdVJj
         4KZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790589306; x=1791194106;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sh6Pmvo+oky2qgEQsEeaC94BZWoDkn7hbfzIYXVj9ts=;
        b=nFEcB2kWhINfONt1D2qTQN/OpvHO8xa0wS4xpmZJQSe35pj/w7DaOJ1oxSc8JOGYXb
         97zQGP19iwU/yvVJp9RICsUAe5bJF/gfbTrnPZIZjKiCb73OZ/OwB4I2AgxWWgrsdJIr
         W5vM2FVLnuky3jbeMD+3T2HY99XGFm2biQZUiHwKtfHyDsxNvlTtaEpLfGhTRRfNvXvb
         19LVEHEJbiCBgT0otXoal1rXh+QKC9oF1thXu4SyodC2MZbdg0DrCcoVTpd/A4hKGwUh
         +3SCZ/A7xzdVZTeNJgjRuTWGhMb+w0w7YxcRUDpG5TaMlMeqxKlEho6FnqoUlWDuiwk0
         dyxw==
X-Forwarded-Encrypted: i=1; AKwUvBzYvyk0lpHeNWzOJR9wp9nSHX3scoiSxcVDK3fAubbdyleZpFkIntPJ9VcFon+gjBYuTNxz6E2vcUWO1CKTwtcP@lists.infradead.org
X-Gm-Message-State: AFq9FYLtVkrW+lwEi74wzA/VGLuJIWVwe8TQoty3bJngAQOJ2f4NoXmK
	6Im/e9ndBpP9QwGvQTtPy42CGCqSH8TxEdcT14jdeTA9lIXiep3HI3dYCLv9GFdW0TnsMHufTP/
	tKiVeJm7JapdhCYQxfjeM8A==
X-Received: from wrbhe29.prod.google.com ([2002:a05:6000:15dd:b0:488:8b42:e490])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64cc:0:b0:487:212:a412 with SMTP id ffacd0b85a97d-4887165f6fdmr25234575f8f.9.1790589305543;
 Mon, 28 Sep 2026 02:55:05 -0700 (PDT)
Date: Mon, 28 Sep 2026 10:54:50 +0100
In-Reply-To: <20260928095454.3255918-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260928095454.3255918-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928095454.3255918-2-vdonnefort@google.com>
Subject: [PATCH v2 1/4] KVM: arm64: Fix MMFR0 TGRAN advertisement for pVMs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_025509_158156_872CD6C0 
X-CRM114-Status: GOOD (  12.03  )
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

Protected VM ID register emulation leaves unlisted fields at 0. This
creates two issues for TGRAN:

  * TGRAN16: 0 means non-implemented. It prevents 16KB protected VMs
    from booting even when the hardware supports it.

  * TGRAN4|TGRAN64: 0 means implemented. This may falsely advertise the
    feature even when the hardware does not support it.

Advertise all the TGRAN fields in pvmid_aa64mmfr0 so that the hardware
support is properly propagated.

Cc: stable@vger.kernel.org
Fixes: 6c30bfb18d0b ("KVM: arm64: Add handlers for protected VM System Registers")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 8758c6801776..ec469d96516a 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -121,6 +121,9 @@ static const struct pvm_ftr_bits pvmid_aa64mmfr0[] = {
 	MAX_FEAT(ID_AA64MMFR0_EL1, SNSMEM, IMP),
 	MAX_FEAT(ID_AA64MMFR0_EL1, BIGENDEL0, IMP),
 	MAX_FEAT(ID_AA64MMFR0_EL1, EXS, IMP),
+	MAX_FEAT(ID_AA64MMFR0_EL1, TGRAN4, IMP),
+	MAX_FEAT(ID_AA64MMFR0_EL1, TGRAN16, IMP),
+	MAX_FEAT(ID_AA64MMFR0_EL1, TGRAN64, IMP),
 	FEAT_END
 };
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


