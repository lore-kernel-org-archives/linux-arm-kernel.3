Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3B6C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=je1VJ6mKVPvUaaEVhOcM6k4XIwS96a65cb57ultTPxg=; b=KJB+vqseZeDRq91RTt9EIciW8Q
	u0uwY5no6Zb2woGRhCojla/A+BtzJZDOlJFBj6wOz6ibaS0rVsCpdCP0MJjox3bJ9EUqS8LWopuPD
	NJHYrJxySd66bjmpDTzYedfmsIlKKyyKN8VFkdrVFfKrFvvcPd2QGhbuTcGRExHU24CIdAIit4D3N
	bZz21W4gKJwgpT7ac6GBzU+1SSFX45ayGuMsZx0c4GUSjbOxBjXF8wP6/46ohmtHpT47TlGM3j+Ct
	cHRYHP03o7cMyKdiGidxpHmPQeun7J519uW3DtAus/AjVeP4zVvePU1COzmh9pBWaXoP0LZXGjrb3
	IrMQUvlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjm7-00000008cuC-1rTD;
	Thu, 27 Feb 2025 19:42:27 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tniSS-00000008JDb-3Biu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:18:05 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43ab4563323so6829405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 10:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740680282; x=1741285082; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=je1VJ6mKVPvUaaEVhOcM6k4XIwS96a65cb57ultTPxg=;
        b=M/wsywHYkXpfLv0xHfC52132bO15hHDpmht5DRTJnDhor+X7ik5WvWuPld3gBeAkq4
         fHx/z4QiKok2JWD6Ik8Bzltj2SPyqCJD+7ZMJ7FSCzK2JSW0V5y7J2quwPrv5e6QBCAy
         HRmlW2oKfZjkmPu/ODE1L3/9GE1eIomXO41onwl2HAFaQXn4vJLp4E79JJVjnEz2Ptzy
         dbwytPpyc2qGh4nKnfEbXbsD+JBJOT+AVkQO9wqLwvzRzzKb7gzBDjr9M+KkptD53TPM
         SCjXUwEq5CSQH/8PNSZHF//jU2PaesoEpb8taNYJI/l9XVY5FDulKeR/lXI7ADKFuGr2
         zcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740680282; x=1741285082;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=je1VJ6mKVPvUaaEVhOcM6k4XIwS96a65cb57ultTPxg=;
        b=BJ0/E9n8/JuzMSdCJdFqHHqTVGHFRZ/nXj39VuYXhOihBmNPxjKCCd6mmn9qIrkv2L
         eBYUVwoCDEE1FZSOl1t9ceQqXB4hpK8fhtZcaC1tddEqZlOyy59045E5AKFee8xB5HVs
         jRzV0xNfvO8KxYpR5otKuUJ3w3Py1KqRQdoKyTV/5k/Zs07SpOmxt7gwyVIB8sJkT7wM
         iGoVP+bul2w7flYyiIY/1Uu5HnJAO8UvMoPslJZHXWfBrLaBZcljaTPgI5M8s+ZHpj01
         1mCrcA57noJzNb2ruKn4iCuVzPJi5/nmNXMeVSI7G8b1gVsEu2o8a7mDmHL7C1+9b8mR
         lzhA==
X-Forwarded-Encrypted: i=1; AJvYcCVrW14pkFCyOALVRLPgOSGOsjjSfj8Ke+E9S+kUAZavX/rEFZ0QremtvNOZdPFsP23tOTq7thtv+E2eIZok09xr@lists.infradead.org
X-Gm-Message-State: AOJu0YyeHzUW+OnHgURrAeYD0gVBgHjw39Ntyks+UoTGkDK+ede9o3mX
	Ojed45VFg1YZsOFn/LgVE2ZRNY18B1BJD86MhojbWAqiGBRuB5CPd0R1XSiz6kpFMWPMO2MjR0Q
	ssD9TNyKNIeJU4mv6qxEowc0Vyg==
X-Google-Smtp-Source: AGHT+IHIGWkJyk1W72MtPuYvvfSzBwxqwzISAWt47NfzIFTk3QsHe3svTwzMWq8Ixj0RG6cPRh6eQd4HAPYTSjvNZaI=
X-Received: from wmbek12.prod.google.com ([2002:a05:600c:3ecc:b0:439:948d:4146])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d16:b0:439:9e13:2dd0 with SMTP id 5b1f17b1804b1-43ba66d5bd9mr1947805e9.6.1740680282702;
 Thu, 27 Feb 2025 10:18:02 -0800 (PST)
Date: Thu, 27 Feb 2025 18:17:49 +0000
In-Reply-To: <20250227181750.3606372-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20250227181750.3606372-1-sebastianene@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227181750.3606372-5-sebastianene@google.com>
Subject: [PATCH v2 4/4] KVM: arm64: Release the ownership of the hyp rx buffer
 to Trustzone
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
X-CRM114-CacheID: sfid-20250227_101804_796679_964FE3F0 
X-CRM114-Status: GOOD (  11.32  )
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
2.48.1.711.g2feabab25a-goog


