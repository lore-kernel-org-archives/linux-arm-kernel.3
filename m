Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789E6C19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 21:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jElUUP1cXmmGkWA/+GnRTo6wT5X97muVU936DPVGfcc=; b=oDERqbA2pjVbGwRoIL9RTVCPwA
	FTxAqlDkJWu5Jzoo4RHOnJcTNcI/maTthu6r3aRUCDVpf3kUz1zni/6eHeXgI1+9n2XiFSJkiRo8r
	kcvaLZiP3Z/KUmus5kOrKQe6oDAkZJFv46zCpkWgTG7P9/7O4jWMrwGwFT3o5LSN/znBdDzHNH1Nh
	FA3wHIvPv2xdhwSkOWSh9RJafuJWlHHOWUsC+RGM3F6tTSy0GzXSqtnb0draVaEaRvL174pX9Zxoy
	Nrx6O6e6nTsSSdMi2xrcqbsf82/B7jrPhRTrXXEFLT01dlp/qhpeJ3reQXOMhP9rB7OfVMpCYRUa2
	rOjahvpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPQl-00000005XUN-2KOy;
	Wed, 26 Feb 2025 21:59:03 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPH8-00000005WNB-1GYG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 21:49:07 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43943bd1409so2332075e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 13:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740606544; x=1741211344; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jElUUP1cXmmGkWA/+GnRTo6wT5X97muVU936DPVGfcc=;
        b=gq/JJ/JPVlXHflumRawu55dvjh3fRsnTJcPcLkMGDsMK6yC0PbJHxwd6DYjJ8qNJqV
         Y5poQaRW8Yu2Fnp2nIaidJF5danPMoraGZtTMlGvL2odGoIyLpLJ6lgMtgZuUsY6CiYK
         HvfALuUSL0gHYUXflZ/zAAbBL9yGH86fyzONEZn4/0GMCAFqp/Xf441ONwWNjr31FC/+
         /9vAzyu0Q0vvh3cM0mWc+vhgFLXNv8tTKP8d/zJPubdHjIXcm9IAhrBTL+gFSl3+Tu8+
         fNnFPT5qVeG5bdfQDmwgNsg7SvegAV7EQEnlzMni/77roiwjcmXGIj0jwQ5/mW1+ISIO
         3krQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740606544; x=1741211344;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jElUUP1cXmmGkWA/+GnRTo6wT5X97muVU936DPVGfcc=;
        b=Oo1jorQOD+cdlRO6VeUugx5zryPA68IhFJhsidczfmXP3aVhOqMC6L+xkAjtRJpi6i
         YARtD/ApieahpAnuVJ66YYsWUkWSXIhE8Sv5YFHst1F4vaWX8Mk2F02NGmI9PYDv7siY
         DvtO5QdEiEBP52m80SOG1D72ufazrksFR6QgqWeJoM8oIJJZmV4Pxz6IBo8GP1WyE58P
         95jFDMc6IdVCix/tFskt3Prdhp9TFPFXc6tXZw33Q/IB0+UhRLOW8ebXLBKY5OlLXgHe
         v0PdYak1xiHp0cIuO4N/9RwCMpAenF4aBJwQljSEPLFC0DpATFprRiTzqHdSPIpICdR0
         1plw==
X-Forwarded-Encrypted: i=1; AJvYcCWdd3/n5YvuhRJoymavS3Alma3+byMp3Ajxzl3dev9Lx2aCFlwrQNVq0EKQ1ryKQ7rnOeKo3bsEsbL0dHkXGgSA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/Qtiy/9uPV6TtpLcDNjdsoFtpJZyJHWWMlmjuK9ooRlnsTuJF
	Wj91stpvyNYqMhcm4iDGKzxgYFGEpfLCnzQ2iMmDOCbQ5K6SKagThZ33i6G7dTj8P8hx+5mJD30
	JnXXWsiL5hG6PLDCkDfwX7lxfeA==
X-Google-Smtp-Source: AGHT+IFMNilNm63tpaGE1Thx+63/zfmAmfVfjbx1vaV84Aa8shwCpD7h0mmGQaUHETfocmAdjgNyNEVh/DYceyRboA4=
X-Received: from wmbfm16.prod.google.com ([2002:a05:600c:c10:b0:439:850b:8080])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3506:b0:439:6dba:adf2 with SMTP id 5b1f17b1804b1-43ab8fe7734mr46217465e9.15.1740606544357;
 Wed, 26 Feb 2025 13:49:04 -0800 (PST)
Date: Wed, 26 Feb 2025 21:48:53 +0000
In-Reply-To: <20250226214853.3267057-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20250226214853.3267057-1-sebastianene@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250226214853.3267057-4-sebastianene@google.com>
Subject: [PATCH 3/3] KVM: arm64: Release the ownership of the hyp rx buffer to Trustzone
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, sebastianene@google.com, snehalreddy@google.com, 
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Andrei Homescu <ahomescu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_134906_340924_1B963D4F 
X-CRM114-Status: GOOD (  11.71  )
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

Introduce the release FF-A call to notify Trustzone that the hypervisor
has finished copying the data from the buffer shared with Trustzone to
the non-secure partition.

Reported-by: Andrei Homescu <ahomescu@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 861f24de97cb..7da0203f1ee9 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -725,6 +725,7 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
 	DECLARE_REG(u32, uuid3, ctxt, 4);
 	DECLARE_REG(u32, flags, ctxt, 5);
 	u32 count, partition_sz, copy_sz;
+	struct arm_smccc_res _res;
 
 	hyp_spin_lock(&host_buffers.lock);
 	if (!host_buffers.rx) {
@@ -741,7 +742,7 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
 
 	count = res->a2;
 	if (!count)
-		goto out_unlock;
+		goto release_rx;
 
 	if (hyp_ffa_version > FFA_VERSION_1_0) {
 		/* Get the number of partitions deployed in the system */
@@ -757,10 +758,12 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
 	copy_sz = partition_sz * count;
 	if (copy_sz > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
 		ffa_to_smccc_res(res, FFA_RET_ABORTED);
-		goto out_unlock;
+		goto release_rx;
 	}
 
 	memcpy(host_buffers.rx, hyp_buffers.rx, copy_sz);
+release_rx:
+	ffa_rx_release(&_res);
 out_unlock:
 	hyp_spin_unlock(&host_buffers.lock);
 }
-- 
2.48.1.658.g4767266eb4-goog


