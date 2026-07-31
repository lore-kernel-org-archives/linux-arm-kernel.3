Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691CFC55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1t219Uo5uTrxIXX4Pq8w6KIqBvayeGDC3OL82qt7QsE=; b=zCBGhUVREWz/8lhs19JRSu/f7x
	wIGftj79P82BfgagxZJXJBuaaOKQMMZkF97RUtvPEB1pf2HZ1V+fSP8M2qFXBC/ncEMvILTndigVC
	U5RPaOXVlAa1PEnJhAXcvv9FaQTGS8cF3Nbu8yuoVeCqMzYjn/yMH74qi592Jk7xMwUH84AD6HoIs
	bAdZWItK1tjK041EXXc7FWuxBKoCNHoK1adiBRBo45lWF7wo2aqGHpPv73CjgybfsqrXE6wEyUEe4
	zS5bsWQfsErHmXIxUUhdRgTNh3Zr6g1zBhWhjdTUBAsjS9G3MwThA1AifX7xevbxaClNoUgz0Fvkn
	3+8KlXHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprsd-0000000DLs2-3W2H;
	Fri, 31 Jul 2026 18:22:47 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprsb-0000000DLrg-2WVP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:22:46 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c15fc5a1b7eso95416966b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 11:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785522163; x=1786126963; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1t219Uo5uTrxIXX4Pq8w6KIqBvayeGDC3OL82qt7QsE=;
        b=Ha44WahMLQ3kKMOzlH4jsnf1465Ta5zfeDg7HZeRKsECOc1Qm03qC8SB4G4k/1rTn4
         nhJdLEY1ngTbLzqymxcDVmG167MLpOZHjyl1j+xI2nwD56t5LPSh4VNah8mpqptq3VoH
         Pr2dwFinXFucy6165ZsTeX69DsjOtqK68M+/7k4YMW1RZmEM7e/o6Ln0wdLe8IGrKvGd
         ABApXjqKoQbL0t0f9tMaP201V5ScWOCN4g9ZXKbIcsUlBJOeSIf82PpHLZGVGH7km/SB
         AtXCnez6vWcV41kqUADCsMLtoPL1j5glTrGi/WiqcfL5+GTzIFBSeIT+6tXqGcBeaTk9
         ehRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522163; x=1786126963;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1t219Uo5uTrxIXX4Pq8w6KIqBvayeGDC3OL82qt7QsE=;
        b=iP7DHY1lEx1xGpozDPezD4yEMMagHyjgIQlwcA7F3Emw6mBmm5BRO1cDG8GIsLNLiM
         bX/ybkezGFxflraSL3tgrhT0Z2jUswVqhJ3LqrVVI7+eq03ox5h454zRozRx4On4v+N8
         dAkDWnI2znSrsHASLEgb1Dp/fJP32QGM6HpW17PfEMB6PUoRyxvlXSsFC6Vk49nKq2hK
         OK5srmgYJrdLmRRiXC2+1sR9RAO/LRMXZsuKcpH5ARdUS6eBgB65SsUx3yWNYoI5cqFu
         B0TjhdQJ6N+MvGlCAae2Cdn1lj3cFDGtKN22eSs8GPGRJ5ZxFg20AujlHW4S9kgTJXXv
         MvUA==
X-Forwarded-Encrypted: i=1; AHgh+RplJ8DNnq/p9wTzRiEo7PQrxFBlByFPZPalF4/PW/9Inal7bFzexeDd7QB++8AdxT3EBqnTIcVHuxxN9vXOGnMY@lists.infradead.org
X-Gm-Message-State: AOJu0YyDFj5FWBCka9U1jGOAIyC46LaFyLxAq7fexgTbDWZ8qi1BrSnH
	3ImgN2Z2OkKzo0NYbuWB2pSXkIUGbS7LStpoQBRplv0E6QQPkfWjla6pwbaE81KqcYrcO61su+c
	1WYuZQ91t9acwkj1Mkr80Ig==
X-Received: from ejcwb5.prod.google.com ([2002:a17:907:d505:b0:c12:5033:55e7])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c05:b0:c16:6669:a4fd with SMTP id a640c23a62f3a-c1fe8103ebcmr38912166b.16.1785522162650;
 Fri, 31 Jul 2026 11:22:42 -0700 (PDT)
Date: Fri, 31 Jul 2026 19:22:31 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731182231.1277064-1-vdonnefort@google.com>
Subject: [PATCH] KVM: arm64: Drop %pB on nVHE panic when stage-2 is active
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_112245_666768_448BBA5D 
X-CRM114-Status: UNSURE (   8.27  )
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

Currently, the host stage-2 is lazily mapped. kallsyms, accessed with
the modifier %pB is therefore potentially unmapped. If the hyp panic
occured with the host stage-2 lock taken, a dead lock will occur.

Fixes: 6ccf9cb557bd ("KVM: arm64: Symbolize the nVHE HYP addresses")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 54aedf93c78b..2e1951c215ae 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -509,8 +509,12 @@ void handle_exit_early(struct kvm_vcpu *vcpu, int exception_index)
 
 static void print_nvhe_hyp_panic(const char *name, u64 panic_addr)
 {
-	kvm_err("nVHE hyp %s at: [<%016llx>] %pB!\n", name, panic_addr,
-		(void *)(panic_addr + kaslr_offset()));
+	/* Kallsyms might not be mapped in the host stage-2 */
+	if (is_protected_kvm_enabled() && !IS_ENABLED(CONFIG_PKVM_DISABLE_STAGE2_ON_PANIC))
+		kvm_err("nVHE hyp %s at: %016llx!\n", name, panic_addr);
+	else
+		kvm_err("nVHE hyp %s at: [<%016llx>] %pB!\n", name, panic_addr,
+			(void *)(panic_addr + kaslr_offset()));
 }
 
 static void kvm_nvhe_report_cfi_failure(u64 panic_addr)

base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
-- 
2.55.0.508.g3f0d502094-goog


