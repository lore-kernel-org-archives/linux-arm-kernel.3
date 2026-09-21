Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE93C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 16:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wFHA1uhtwa0uaPPbQchvbVnkxkm1bjsmx5CIxWxkScA=; b=KeBRreij6Qliedq+7LbFmUqzKC
	ERz6HjNklIdRNAoiGx1yru8o92Qdab+3fyftNmp+9Yhpfs69/LipsTcGAqh6UZ7Z0HJdgPA2pvsN+
	jyE8kNwCecaM+4ahmLUBXHbDP88ZdfVxIjUehKwVSlp+MY5Bwn3BM+Nv/3HuYjsAStAcIr83735MQ
	KRyPJmPsvz44g+N51EGabnU9qtVv3jNBKw0PytrpfvyHtwfPL6pocRc/1oyPgoi0hIFbOr4ppfii1
	gmS+SHCDtsliaTMQ1Qb27ko4X33oK6SsrcIVZV1ZeYA7IyCfL+8ix6faPXfhzhMtV25qc2qmvcdBN
	JRvi7mIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hBU-00000002sIu-2WWO;
	Mon, 21 Sep 2026 16:48:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hBS-00000002sIM-3xeO
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 16:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=wFHA1uhtwa0uaPPbQchvbVnkxkm1bjsmx5CIxWxkScA=; b=OuvH76DkktpTelXjgDICt9/Bw0
	Tddn43EZ8DX81azSlnJiOGXaAmEmY+11uzIW/unuVnO7N+vBSakauxEnYVHokKs//nIxrLFGA4cC3
	WJP+Y1lx5fYV4PsQ8mQtUceIN18EZHvrpVNGjGFc4hkkPYuICJpKKMbamGDOpwNo93YQ5KcVWX3JN
	BJD7Hzm60+ADhXGX3Rh0xQiAlNCw50Z7TDgJhppACsRGVq6om+c5Fb+DhMIYDrz3DBtxYXt4yhsei
	/ptHkpiknc9rbUNo1TgQ317qpgQ52Lvty+BhcRVINqESW1VJibfGV8TbOTmll8oFC5o8XQWi06S/B
	L2laOADw==;
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8hBP-0000000Ca1J-32mS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 16:48:01 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c252b87e9a2so270424366b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 09:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790009278; x=1790614078; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wFHA1uhtwa0uaPPbQchvbVnkxkm1bjsmx5CIxWxkScA=;
        b=pI6WfvggkK0nJo+J0VRoQxe5nqBizPgLnatl1H+b35zJ01RKgGL7wGnHFsnCUBPX1h
         YqjwFonDdGjBp6RYpsHQzvn07MpK4w7wHT05oPUdIynAe1+Gz1Yyn5YHeZIxMvkt7JIf
         ZZAqRbiiSO/hZrYvUCZfw2AXZ6eUpheDMxfR9utxcKq38QiPwFfyXtRYuI7rp0nRbO2/
         FbuCvoLkGmFiKW1yKXM0DZFarHV39849HYG58ghCYY2nIH4OFng52klJ/VockK0UbiRt
         yH14ISiNoZ3kAEfUyDqm3PS+gT1k/jZCtLuY8zZyF6YJFARi44kXEnp6y91HSmfrGEqa
         tfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009278; x=1790614078;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wFHA1uhtwa0uaPPbQchvbVnkxkm1bjsmx5CIxWxkScA=;
        b=ILqAxWwKva6JugQQ4n4cWVBoZod4BiWY7vEDl//SpMrTzhuxI+russ5EB49SfkHB5w
         DAsJdj5qcySX3hD6W5/Y8dYXkgq9pfSEDAl0DZ7SMFHJjklXrbe9hKFQzauIZkVBy7YB
         MLMFPU9HDIKkRlOqH3zLiVccEnsddOHPyBeahKNkO+GjmwMijAPDiaBe4tlNlLKN0vCB
         2CBxIpxm4TiNxt/j95bnXSOi0v+BYiH036Sbg14JHmYW4jIHUPGsRAdv+2Uh3kpqgh6Z
         gSkpsH0btwz4xi3VgwdrdPpeyzDYyXLKjAzGTEo1tAU0slzoTtEEf1EopeFGfSbdlpkf
         Rc+A==
X-Forwarded-Encrypted: i=1; AKwUvBxuU+k4D0u8qODtifz3+TMW8erW2SoCA4iIkdVv2c3bo8fKUZpuZIrOt7ggEmhlG67JFuCVetgXQZ/wO0DvdzMd@lists.infradead.org
X-Gm-Message-State: AFuF++nKt13Yuc43r2RTwKGCsP3ZeXiiElUEB4G7TVVdZT3qko8yhvza
	4VJ/iylHMgXK0mJndAeSZaDaX8EiDutMZxe8RivZaXtSzByxHMsXae4TckwaQHKpCghCWZzFROM
	JvlrUslJtn68Bnf3r7hQ8rNozeg==
X-Received: from ejrs22.prod.google.com ([2002:a17:906:6c96:b0:c25:19d1:3b10])
 (user=snehalreddy job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6d06:b0:c21:9b4b:2690 with SMTP id a640c23a62f3a-c2a156a963cmr1038418866b.17.1790009277272;
 Mon, 21 Sep 2026 09:47:57 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:47:46 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921164748.2958578-1-snehalreddy@google.com>
Subject: [PATCH 0/2] KVM: arm64: Support FFA_FN64_MEM_RECLAIM2 in host handler
From: Snehal Koukuntla <snehalreddy@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Snehal Koukuntla <snehalreddy@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_174759_807636_B3AEAA84 
X-CRM114-Status: UNSURE (   9.66  )
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

The Arm Firmware Framework for Arm A-profile (FF-A) v1.3 ALP5
specification (DEN0140 rev J) [1] introduces the optional
FFA_MEM_RECLAIM2 (0xC4000091) ABI.

Reclaiming large memory regions with the existing FFA_MEM_RECLAIM ABI
can take significant time, or relies on a stateful time-slicing
mechanism in the Relayer. FFA_MEM_RECLAIM2 allows an Owner to reclaim
exclusive access to a subset of pages from a shared or lent memory
region by passing an array of constituent memory region descriptors in
its TX buffer along with a starting descriptor byte offset and initial
page index. The Relayer returns the number of 4K pages reclaimed in
that invocation without maintaining intermediate transaction state.

This series adds the FFA_FN64_MEM_RECLAIM2 function ID definition and
implements host proxy support in the pKVM nVHE FF-A handler, unsharing
the reclaimed pages in the host stage-2 page tables upon a successful
reclaim response from EL3/SPMD.

This series is based on kvmarm/next, as Patch 2 uses
ffa_check_unused_args_sbz() introduced in commit 3e9df0b0ebd5
("KVM: arm64: Enforce strict SBZ checks in the FF-A proxy").

[1] https://support.arm.com/documentation/den0140/j

Snehal Koukuntla (2):
  firmware: arm_ffa: Add FFA_FN64_MEM_RECLAIM2 function ID
  KVM: arm64: Support FFA_FN64_MEM_RECLAIM2 in host handler

 arch/arm64/kvm/hyp/nvhe/ffa.c | 117 ++++++++++++++++++++++++++++++++++
 include/linux/arm_ffa.h       |   1 +
 2 files changed, 118 insertions(+)


base-commit: 23ddf997ab16b5f4aa9f948f5a68f5b35e4e398f
-- 
2.55.0.1082.g2b9226bbc0-goog


