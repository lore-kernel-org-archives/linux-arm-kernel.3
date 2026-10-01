Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83C3CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vGROxTAoiBlO/qGW7LpK0wVm5fz+qLqAH2WB+gf4z8M=; b=Ilbjf02wOam98WSyY1RvggCIoD
	zZqmD7VM0uOEJIYxAKvVALniFXJCQsLajFt9bw0qXWso39Ndo6sofzzCDrkiH7e2Am5+/8UGECOE+
	xbJN5JvsFoTEMgJr70Ubg/n3FqUK/LxSMbjS+qqy1O0H7qgMw9nSuLlvy6OuF2jmWcP5JeSaLIv0X
	nSku7mlm5UALtfK9T2KqDzVDAAskY/dwe3G2riLtq5piruoQ8drZXhEnRVyTNQ67YP5ASTmBo+OZO
	p9woKJ3k+TbNufu9a3nydmmzYeUSTgxjclw7FtAw/0UyME9ZJUSSgxDn1xpDTMNL2y+fr9DT2w9w6
	jAxUyW3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHnb-00000009OJS-1kEh;
	Thu, 01 Oct 2026 14:30:15 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHnW-00000009OEK-37QW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:30:13 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a021b1b561so5776535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790865009; x=1791469809; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vGROxTAoiBlO/qGW7LpK0wVm5fz+qLqAH2WB+gf4z8M=;
        b=H15OAghHTHG+cWgOvm5FnGgd4I6+QeAqYdZgQG8DssskaoGsJHbFfOrWNLiAIwmmne
         jW0t60jtSyD/OsyUwPANImXiCfg//c3QHPsqpIHfoHfFZKx84E27WR8Yfk3Kd+4rJLvt
         iXnrsUT+Xz5A+YLOqJ+K+/ExygCSiGHz51bvszYMViuilW4Rhdw7OPqfr3PO53wJ7CjF
         RdrDp7quuGa8NkM6ZH2RQuwOnzc0pPxA3ZbEKhM2sIb6/9Pp9A8v7+gQSMvwXXr7kgxn
         4I/g0YPxNOIiqQfn+a2XeNhg8ECjdO1WhpMcQ2I+v1QB74nbbiCygNbdsMg+IBYLSmvO
         3qaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865009; x=1791469809;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGROxTAoiBlO/qGW7LpK0wVm5fz+qLqAH2WB+gf4z8M=;
        b=ObuqpdUy/RQYHw+tW/3FacYdd8h7MrW6oem26UTpU+nwAyMYzmuc/xK61HLqNgUzrW
         ezs9DBpv6ouT/IjLIp3BdcrV+QrH+OjXiSiAAIDC3ds2rfkBES9ZfbfTMyC/DXPxmNgx
         1pN4jzE1EZ+sYWqpCn9bEiTnZjjOZ4J6e61i16SdNleyJ4VdgphaGejjVeIbHHNkGR40
         EY3YdTxAosJYnekKn9dW/PiixoFwY4OGbF+tf5CLNQndJKbTE8KNEYxPcPzxv2Ce8BgD
         JO0WVlDeXbbTHI5gdsqBwkOhuq81xXIr84EtBcyZK6sVXvGmEe6FDRLL1uSO0p2UUy7E
         Mkkg==
X-Forwarded-Encrypted: i=1; AKwUvBy1a2jaAcjMvennannS+eI63tGEHke7pZKErrW4wA45Y5IkVfblx9vUg9qrF9AHuIuZT/zWiU61Iyc1oDQfBHKd@lists.infradead.org
X-Gm-Message-State: AFuF++m4P/lb4IgYovK9ZKd97GtAdTDoBStGM20gCgOOETZw96yA8/Ge
	ASZZbMuvGwvYkHYbdiYawmIOD4ltUy55gc1FEgSY4/GY5Y+JiDkotzSpVg9rvYwbnFePsnoeUBQ
	YA4QJF8Fb7YpMJsYlavXbyw==
X-Received: from wmbje22.prod.google.com ([2002:a05:600c:1f96:b0:4a0:7fd:46])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3152:b0:49f:ce78:356f with SMTP id 5b1f17b1804b1-4a01b13286emr78459645e9.32.1790865007673;
 Thu, 01 Oct 2026 07:30:07 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:29:56 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001143000.3371786-1-vdonnefort@google.com>
Subject: [PATCH v5 0/4] trace_hyp_printk() for pKVM/nVHE hypervisor
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_073010_861189_CB1F1B73 
X-CRM114-Status: GOOD (  14.39  )
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

Hi all,

This series adds a hypervisor event "hyp_printk" which enables
developers to log pretty much anything into the hypervisor tracing
buffer, just like the kernel function trace_printk().

This enables rich logging from the hypervisor, while leaving all the
string parsing burden to the kernel. This has been the main way of
debugging pKVM in Android.

Even though not strictly related to trace_hyp_printk, I have added the
following two patches:

  * KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp

    This one mainly intends to support one of the new features I have
    posted here [1], which allows to enable tracing as early as
    possible. I have added it here to limit cross-posting.

  * KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/

    This one is just a cleanup.

[1] https://lore.kernel.org/all/20260605163825.1762953-1-vdonnefort@google.com/

Changelog:

v5:
  - Move hyp_string_fmts into its own output section (Sashiko)
  - const hyp_string_fmt declarations and definitions
  - Guard trace_seq_used() before indexing seq->buffer in __hyp_trace_printk() (Sashiko)
  - Fix format string quoting in REMOTE_EVENT_CUSTOM_PRINTK() (Sashiko)

v4 (https://lore.kernel.org/all/20261001084909.2937943-1-vdonnefort@google.com/):
  - Store nr_args in struct hyp_string_fmt instead of using
    ring_buffer_event_length() (Sashiko)

v3 (https://lore.kernel.org/all/20260930153505.2144559-1-vdonnefort@google.com/):
  - Collect Steven's tag
  - Rebase on 7.3-rc3

v2 (https://lore.kernel.org/all/20260708075435.47419-1-vdonnefort@google.com/):
  - Collect Fuad's tags
  - Rebase on 7.2-rc2
  - Warn when trace_hyp_printk callsites are exhausted (Fuad)

v1 (https://lore.kernel.org/all/20260612142245.1015744-1-vdonnefort@google.com/)

Vincent Donnefort (4):
  KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp
  KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/
  tracing/remotes: Add REMOTE_EVENT_CUSTOM_PRINTK() helper
  KVM: arm64: Add hyp_printk event to nVHE/pKVM hyp

 arch/arm64/include/asm/kvm_asm.h              |  4 +-
 arch/arm64/include/asm/kvm_hypevents.h        | 14 ++++
 arch/arm64/include/asm/kvm_hyptrace.h         |  9 +++
 arch/arm64/kernel/image-vars.h                |  1 +
 arch/arm64/kernel/vmlinux.lds.S               |  8 +++
 .../define_hypevents.h}                       |  0
 .../kvm/hyp/include/nvhe/define_events.h      |  2 -
 arch/arm64/kvm/hyp/include/nvhe/trace.h       | 66 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/events.c              |  6 ++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  2 +-
 arch/arm64/kvm/hyp_trace.c                    | 63 +++++++++++++++++-
 include/trace/define_remote_events.h          | 19 +++++-
 12 files changed, 185 insertions(+), 9 deletions(-)
 rename arch/arm64/{include/asm/kvm_define_hypevents.h => kvm/define_hypevents.h} (100%)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


