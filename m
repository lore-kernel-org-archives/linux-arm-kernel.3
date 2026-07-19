Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA667C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 23:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHHDIsQbOpwZi830OTqOQ3hDBLn1pO6beb+B2zMHong=; b=oSYlOjFmFRXp1XXdgn5WryiqTZ
	2BJoB4Og67vf/dfT3dppWQRPQMaQr5hDlR1U465rlDPV3+YFfOA58952jzapOMVj51rWXB6Kv+pni
	bDN6Sl0Lf5pIJBbKlgLLSbCO9Pr7tROiquK9fmpDulfae7efqfTwSY0b23t/t2utnDEt0Pt4fUeYi
	8yeCITkD08BX9w887snzqu00he8DkA/NRCSbdlSNvDjDt2QCZyzv3UZ4qVJFgQ2HARjHnPkd1Nbwn
	LxI2IkMxo94A3kP2RhqK21F/9ChEygGaJvGoZzmm68Nv8Onw/RhPMd80/DeAFxyev2UyVGWYXJUW7
	OA6Kk2Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlaea-00000005SX8-1YQs;
	Sun, 19 Jul 2026 23:10:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlaeS-00000005SRU-1Fox
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 23:10:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0DE6D44FE4;
	Sun, 19 Jul 2026 23:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F111F00A3E;
	Sun, 19 Jul 2026 23:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784502627;
	bh=kHHDIsQbOpwZi830OTqOQ3hDBLn1pO6beb+B2zMHong=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lo+44WdHWR5FaVr2MBCA2Oi12puRxO33IEUwiiwkesDFzeJfFzlmbpsGDUGo9pfO7
	 alscwjcwFtUfcrjoOeTXvNfrIeKqYMZNofGvqAqzXVnH+5ygn9gfeMqrcSENMmyPKJ
	 BqalFy7DICoPecWYv4c7YbA1r3fjK+fTqaCszo4SNy0ZIzr4xj28mRcskaqPTUocS5
	 h25SS9MFv+Hrr6v5/NRTeNIYBxiyJ97Yg6RCaNuqKE1KNsCFqtY9viO4HRTCeSTUYK
	 YAQGRm1pvqmL3ZM8ZbEol+nyjQEJVm4GaKr3HfjXaLwXhuA4jYGA0wJ3z4xJHYhsJX
	 GyLJHjDwh85DA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 20 Jul 2026 00:07:34 +0100
Subject: [PATCH v13 07/32] KVM: arm64: Remove bitrotted comment on
 handle_sve()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kvm-arm64-sme-v13-7-d9abd3ffa245@kernel.org>
References: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
In-Reply-To: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Jean-Philippe Brucker <jpb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=842; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LQ82hLeixhPo51PUrjrzXUzX6f0ySuwDN5dUrbNo3NM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXVksEu2TfVUeiwJxJfegVrA3okXWKBKbLNFG6
 7+06mW1CBWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal1ZLAAKCRAk1otyXVSH
 0AtOB/4nD3lNzZzEhkQxDTqe121DOffEM7mPd0/E/XOXQUbMwYpopWzhfFY3H9+GRkIARvq2Z4q
 kXFMMb6Gttx+24ZE3LaswzpFPQCevP85rdp2rPR+Iztfb44hzeYKNvGm5loa82w8778+AiNKzfX
 dLGZdPeRKpbqdZu7NWhWSJ9UyNx1mKmdbDhIDeKYpbTc4TVe0R0qVB/pcuc8pDvsinuhjrk0qj7
 Agd+KsKJthnwRIzFG3mFkZrFYNduL1YTD8VgksqPTTRXdT1KAhusF163mjw9XFJuJezdBcdNFhf
 huZn5D47QZhk0jCoUoWdg8vOhb70Ml8GoDxwSozEGwdCKpD6
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

The comment for handle_sve() says that we only call it if the guest does
not support SVE but it is now also used for nested guests which have
enabled traps at EL2.  Just remove the comment.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/handle_exit.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 54aedf93c78b..f674cd25d894 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -224,10 +224,6 @@ static int kvm_handle_unknown_ec(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
-/*
- * Guest access to SVE registers should be routed to this handler only
- * when the system doesn't support SVE.
- */
 static int handle_sve(struct kvm_vcpu *vcpu)
 {
 	if (guest_hyp_sve_traps_enabled(vcpu))

-- 
2.47.3


