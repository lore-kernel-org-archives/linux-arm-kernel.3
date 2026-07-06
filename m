Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29905C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zboxgN5bMNXSf6lrUmEWx4BFr4AoapL6ahNKlrvd4RE=; b=yYRytLzu+56qIeneMRnTLwQUqH
	qQBoSIbaQIEXybC4aTrsJ/w2QxSHuv1tJ8WdzqT0cmxUFRE07nBNj8jieCh/2y70htZ2wjRw1kasT
	JlKx18aVlHanxV66/HZQTqHS2EcrecJyfi4lRotn0TsQa3KfRya6VnKel4JvAxaKL7w8wYSrDPTyy
	LCecW29w0FsGXatbwR60Qx0/s9efQyxspcc9iLDK8Y8iwzlvq2FAoI0WzLnWpAD4xiBpHPWraVTYA
	hLDsvd7g5tmhb01ZEewhLxuEOq2IvTnDY1fnMVUtPG4bpfjT/4QMcHiNWkC7ELfvyRR2mRg6oxhbt
	StYdpxkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWm-0000000DFoL-30NS;
	Mon, 06 Jul 2026 17:54:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWi-0000000DFh7-13d0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Jul 2026 17:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zboxgN5bMNXSf6lrUmEWx4BFr4AoapL6ahNKlrvd4RE=; b=q1p5sOflw1tF70jtE1SEdtKLZi
	WExttkWMpLc9B1p3B0be/I3/vDldo7AapNehPgbthTJ0z+YRNoNxs1qGrArIiqs1UBOucDLNfyR/U
	6vdPNPmnm8v4HW7oet7ORi3MHjry4swXcIsaHnc1vVFwY6WGpjqDqAi0Pfge8Uxpm1Gh9pJ5MCPJg
	ZTdILyW+jXbhqveto9qpp4I6Zhmt6OsrR7rb64RypvsJ0bDMH34iEt37c9gUQzRf6T/vOXUutjVNe
	az9O31D3tR+B4n7EcgFgbBFix8/egLy3niOF1Wao/Q+RL/4r9Mi3eBTsnBIQW+A8l8+offcqFoJ48
	p0mLZW1A==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wgnWf-00000006p5Q-1d0s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:54:39 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-493a7fa8481so294185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360476; x=1783965276; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zboxgN5bMNXSf6lrUmEWx4BFr4AoapL6ahNKlrvd4RE=;
        b=LFgYt4LgVIGB0dEewJyGmdWk4MJZCyrXnXi/E8tgRaOglvtIrVYx2h/jgfr39S/RcO
         FAjxkc1VzXgpFuDKXMpmOEWid0qRzMVsy4MWTr5gyEfnrc1LhH1JMxjdxwDeubBVnH19
         5TRJ5BMzq36cSa+k7kywmw8l6nyDIjWEG0WL6uaM6TSh8EjDn3Nyg6SA2I2auG3R1nak
         sdzYyULwdCQXNzPbt2QkwqQdjE61cEQJkS+F3KChuXJYai9mnhO1GDgfAGpx4/7PZqeJ
         7u+2I/LQfMgAz/AP4RISrpAkJBRYFB6ZfJuh+oSDPM+eL+oV5WCIjFzOJGlY5ajW9Llu
         3lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360476; x=1783965276;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zboxgN5bMNXSf6lrUmEWx4BFr4AoapL6ahNKlrvd4RE=;
        b=oeZm69XGG1cn3B1uELhkwFEfdTSLeo/hZMgfwFGUYcayVtpu+4eCHd5+BdCUukGFVi
         DIhJKmqnUnIDSWqzTG1X1d2p2t2HX5x/OaSHBGAVEv1Isu71Gzb2rKpOz+uuMkSI+t4U
         o6NUDwvMzQ1E68XFmlbd9w9nZG3OqpSKxGz/Lh7BTunTnO+aRlq5zFKcpqVDnNCt1FZM
         iRhviOUT7HiQjoTIGuTY90BBpAxDxBi48/N4hXvIt0IDsGvBSjbYRWuoW9xwEltKOYrb
         fdFCFX1ukpLXWCrPW4N2OQnVqroOax0KC80Eeb3uKShijy7N0D9nTzI+e1bHbEUcGUgY
         PSnQ==
X-Gm-Message-State: AOJu0YzcPYGzxa7g9jZvYtRRRIaJSR7rJHJFBq4SbW4b8IC/HOR0jUDE
	PA+EuFsE+ubzoSou0N04i4ozgI4J/dfdYqYuRQTYeWmnRWN0IQvZAPK/BBfRO3ox37GHdTgMU1C
	Bz5vvmHn8BVi0a/1enzJ0aw==
X-Received: from wmbfp12.prod.google.com ([2002:a05:600c:698c:b0:493:bc2d:feac])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1993:b0:492:6f5c:fd8c with SMTP id 5b1f17b1804b1-493decec719mr17728345e9.15.1783360475525;
 Mon, 06 Jul 2026 10:54:35 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:54:09 +0100
In-Reply-To: <20260706175415.2604046-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706175415.2604046-13-vdonnefort@google.com>
Subject: [PATCH v2 12/18] KVM: arm64: Filter out non-kernel addresses in kern_hyp_va
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_185437_588521_8D7993D7 
X-CRM114-Status: GOOD (  10.15  )
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

kern_hyp_va() is idempotent for the hypervisor linear space. This is
handy for nVHE hypervisor callers handling kvm_vcpu or kvm_arch
pointers. Those pointers can originate from the hypervisor space (when
protected mode is enabled, we don't trust the kernel and the hypervisor
uses its own copy) or from the kernel space (we do trust the kernel in
"non-protected" nVHE).

This idempotence does not hold for addresses within the hypervisor
private range, like the ones you get from the pKVM heap allocator
(hyp_alloc()). To resolve this, filter out non-kernel addresses based on
PAGE_OFFSET.

Leave the assembly version untouched as it has no current users.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 6eae7e7e2a68..d60e5f2de10c 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -126,6 +126,9 @@ static __always_inline unsigned long __kern_hyp_va(unsigned long v)
  * replace the instructions with `nop`s.
  */
 #ifndef __KVM_VHE_HYPERVISOR__
+	if (!is_ttbr1_addr(v))
+		return v;
+
 	asm volatile(ALTERNATIVE_CB("and %0, %0, #1\n"         /* mask with va_mask */
 				    "ror %0, %0, #1\n"         /* rotate to the first tag bit */
 				    "add %0, %0, #0\n"         /* insert the low 12 bits of the tag */
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


