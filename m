Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A5EF46449
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 10:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRRRs4qimCTCE8Va18dDnA4j+s5nPgtPWnWIVGfsSG4=; b=FXsyczDOpst4lzmmWVJGuCe+Tx
	V/Yw/dia8N+YQh2z9DlCjR7fTe6uhBoFofAkXnTLMrOG2+bO91tPB+YDfqqBahm6WvTIyCm9C5ufx
	uVPM73aFWhel+kzG9eaYQE18/RHPbP91f9Yu1CmyNPw6pjGU1X560sj698L59gI7bMXvwCibCQDej
	qOvzv0B6osUXZ7Uy9AIxyGShojqpF7oicO4qOU+pw0Kml6opi+dP4De6hJCnqAEkqtFhVIjZMjHLl
	hpwrHDCAJvrmOh3XndK8gI1eNAqjeFo7xL+zO1nJyRa1uUYJfT+FmHxi6VFik5LdnNobsLrwOdVTH
	jpwGFMhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25Td-00000003lkb-16Zt;
	Mon, 16 Mar 2026 10:47:13 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25Ta-00000003lkD-1t5b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 10:47:11 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50906a98ffeso915651cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 03:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773658029; cv=none;
        d=google.com; s=arc-20240605;
        b=fREE8CiC0DfzPjLUg47uRPQGKLh0zWNUgfJdVLAiXeLhpZWUIYK9KTNCqzZHqIeZ1q
         Wi7pj9IzERHfCKYldZEzRtFwJ1CFii13Nfd2Gd/e5+B8MptbZ5Lh03f2UPbt9rfhu+Vk
         27uez1aTV+UXnzX145WqzWmZ/lEoydozTmm3nsx3G7NK7yqilEBfswwJ1JlCBosLrNrK
         ldhAyaei5/MJItYaDzmMJRMZhC89yxIeaoW6+jUjIay4YMukovazWnP9kRnJLVcLQdj9
         Hx1hHCAnnlagAZrjWxLUOdoMzXju0joV4nh3f6FvwH8ECfJHr5Dcjpbs+NwbVd1emnsl
         Ho1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aRRRs4qimCTCE8Va18dDnA4j+s5nPgtPWnWIVGfsSG4=;
        fh=4qqmP0DQC753TctPYv0G7m/Pw6ZB4hosAfJVa0HtIu0=;
        b=jfhNIvFp0wesRppiqyZjZBg4GtfgsRQ+xuYmTI810S5cgUaTnJ9MYa9Z25Tbs0R+JL
         eZ6CCDc9OXalgz4WCLSnaqgztdtkKvSAh3tXm7tittwfY87FrkRERNLAKaQflEIY46O5
         LUoI2xmMwajUYnbwObtWjpK5a+DnScmt+YdXgGefj5OR2UEQQF5GNLbyU1NM1W0l/Psd
         asf3z5dFFfTu7o6mPWKcpe2Y5uOp+qWmgfo5HZVPffdxwU9dDsQYTsQBslessM1srTd1
         Ih5gOeKdnYZfHOOmCJU8t+guN6X6UF/RyRaRc6hNz404I1zZeLFu4t8hPTxYXCCJqqmv
         iFPw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773658029; x=1774262829; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aRRRs4qimCTCE8Va18dDnA4j+s5nPgtPWnWIVGfsSG4=;
        b=sO9UHAD/kO1AAYlpp0yqDdr7r6sER0ArVWfJ+YuaiVDIg+b9xxpaplz6asmX8nPcZx
         yiugEoC61l65JtUnotfbUDvJtlvhOp8HchejBMQh+/JJUQIfu7nVbSddhIOoTKUbPs9V
         tNRexAf242B0+o3zOWYvUvd8oA7Cj2d439z+ddiRD/k/sH20w2J3ds2Nns74EXMgzKB7
         zM5QxN68nMf44F3/GDGvazSaQYhbKsnDtuM7t5gHgsDJxC0O6KuzEFoIm90amuu/XeLE
         T5Sa2HAdVDKGdzEkDf0wFagAbiW0M1rxgKa9dOZ0wlpDpufc+U8GI7VKeT2bmIVuYKA3
         YS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658029; x=1774262829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRRRs4qimCTCE8Va18dDnA4j+s5nPgtPWnWIVGfsSG4=;
        b=ZL9loi/xWAC6gctkLm10l/9QRAn3CPm+VQN2e6mbtMMHDJgy4dCadYSm4slDiR2iV9
         Pda3Mkf8SZ514nSzbXLGoteBam82lZ6Aq03Wn4OgFl02cuhWmPfuxrdd1pYpYMCUpGMg
         Rglxh841NAekIx98TEpPuJOyTynJ1El1xEQUNtO7czCtqt3Gh3l2GboIvrQDz0OZkpHX
         /JITaG+zzHd01ltBAtmdWfdD8xG++4La99l3bGi6H1qcs5jNh8RyfJKZKj6GdEGMOfvm
         UNWyxQ0bpTBPF8BNOr/yy11m7F+P2Vf8+kRjb6SkDka/q2NLJB0Mv2WOhd39jWf/Lflq
         UT/A==
X-Forwarded-Encrypted: i=1; AJvYcCVd9VNH1gLhErT97JYRW3ykO8J7CZ5A23gkH7rO/5HNivtznr7m3a+QqXo+BkS3vJWQ0T14+LwByT0qA0nGd8Sx@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv+VaXEUwkp2Bg9gA2KuKiQD86yh72sTdLDw0kqsPgt8QEN3Y8
	sMtfU/GOfGyh/L2/Ecjhb0bY2fD5KpNEzAJh5dWaV29+Soy3x2Y6h0hOuMgFE5fPavppQI2ocLN
	0srxcMwznsRz5jc/JOkIChP/bvUfHeDT/Mr0V0wnO
X-Gm-Gg: ATEYQzx+LuDvPb75XNmKMzO/brPF2ZkrOszUi2JK0747FxNp7oLN5nWlJBsbYPQ0uBg
	yt9PLmucazu8Y6KUCZaG2gDldQtm/2L3CEKc/rnJpJRlzBS4OJQ0tGU2de/e1/kzXiDdavsRaQ2
	kiGM7PLJ40JPKUc4ejUvsvcAq8vCFVq3ADiT+yidJdRKt/JKod/4iF3H4lfPK5vil1JPayTk/Sx
	Ao6W262Rd8zVxdpOeESK0ct42wz9Q9FS4emVGdzCc0CBm31iqR8OP99sGDONzwP6wIeA+JDBS9v
	Sz8lB9GS
X-Received: by 2002:ac8:5f0a:0:b0:509:25c5:42b4 with SMTP id
 d75a77b69052e-5096aa55530mr23893861cf.13.1773658027808; Mon, 16 Mar 2026
 03:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com> <20260310124933.830025-7-sebastianene@google.com>
In-Reply-To: <20260310124933.830025-7-sebastianene@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 16 Mar 2026 10:46:30 +0000
X-Gm-Features: AaiRm53ElvHYKjfLrl7nWl4xmBUKgFzAjMTvGSFCPR2uvvRXE46QBT-Rj-OBovQ
Message-ID: <CA+EHjTy051kjdReuESmk3HpMsBEW=s3DxhJXa8vQJFHz--wG2Q@mail.gmail.com>
Subject: Re: [PATCH 06/14] KVM: arm64: Add infrastructure for ITS emulation setup
To: Sebastian Ene <sebastianene@google.com>
Cc: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, catalin.marinas@arm.com, dbrazdil@google.com, 
	joey.gouly@arm.com, kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, 
	oupton@kernel.org, perlarsen@google.com, qperret@google.com, 
	rananta@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, will@kernel.org, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_034710_563084_FD2AB6B5 
X-CRM114-Status: GOOD (  39.73  )
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

Hi Sebastian,

On Tue, 10 Mar 2026 at 12:49, Sebastian Ene <sebastianene@google.com> wrote:
>
> Share the host command queue with the hypervisor. Donate
> the original command queue memory to the hypervisor to ensure
> host exclusion and trap accesses on GITS_CWRITE register.

GITS_CWRITE -> GITS_CWRITER

> On a CWRITER write, the hypervisor copies commands from the
> host's queue to the protected queue before updating the
> hardware register.
> This ensures the hypervisor mediates all commands sent to
> the physical ITS.

This commit message demonstrates why we should be careful about
naming. This patch series is pretty complex, and having clear and
consistent naming would help. What I mean is, here you're referring to
protected vs host queue, earlier you were referring to shadow (which
now I am not clear if it meant the host version or the hyp version).
Maybe we could have a discussion about naming, but the most important
part is consistency.

>
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/include/asm/kvm_pkvm.h             |   1 +
>  arch/arm64/kvm/hyp/include/nvhe/its_emulate.h |  17 ++
>  arch/arm64/kvm/hyp/nvhe/its_emulate.c         | 203 ++++++++++++++++++
>  3 files changed, 221 insertions(+)
>  create mode 100644 arch/arm64/kvm/hyp/include/nvhe/its_emulate.h
>
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index ef00c1bf7d00..dc5ef2f9ac49 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -28,6 +28,7 @@ struct pkvm_protected_reg {
>         u64 start_pfn;
>         size_t num_pages;
>         pkvm_emulate_handler *cb;
> +       void *priv;
>  };
>
>  extern struct pkvm_protected_reg kvm_nvhe_sym(pkvm_protected_regs)[];
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/its_emulate.h b/arch/arm64/kvm/hyp/include/nvhe/its_emulate.h
> new file mode 100644
> index 000000000000..6be24c723658
> --- /dev/null
> +++ b/arch/arm64/kvm/hyp/include/nvhe/its_emulate.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __NVHE_ITS_EMULATE_H
> +#define __NVHE_ITS_EMULATE_H
> +
> +
> +#include <asm/kvm_pkvm.h>
> +
> +
> +struct its_shadow_tables;
> +
> +int pkvm_init_gic_its_emulation(phys_addr_t dev_addr, void *priv_state,
> +                               struct its_shadow_tables *shadow);
> +
> +void pkvm_handle_gic_emulation(struct pkvm_protected_reg *region, u64 offset, bool write,
> +                              u64 *reg, u8 reg_size);
> +#endif /* __NVHE_ITS_EMULATE_H */
> diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
> index 0eecbb011898..4a3ccc90a1a9 100644
> --- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
> +++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
> @@ -1,8 +1,75 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>
>  #include <asm/kvm_pkvm.h>
> +#include <linux/irqchip/arm-gic-v3.h>
> +#include <nvhe/its_emulate.h>
>  #include <nvhe/mem_protect.h>
>
> +struct its_priv_state {
> +       void *base;
> +       void *cmd_hyp_base;
> +       void *cmd_host_base;
> +       void *cmd_host_cwriter;
> +       struct its_shadow_tables *shadow;
> +       hyp_spinlock_t its_lock;
> +};
> +
> +struct its_handler {
> +       u64 offset;
> +       u8 access_size;
> +       void (*write)(struct its_priv_state *its, u64 offset, u64 value);
> +       void (*read)(struct its_priv_state *its, u64 offset, u64 *read);
> +};
> +
> +DEFINE_HYP_SPINLOCK(its_setup_lock);
> +
> +static void cwriter_write(struct its_priv_state *its, u64 offset, u64 value)
> +{
> +       u64 cwriter_offset = value & GENMASK(19, 5);
> +       int cmd_len, cmd_offset;
> +       size_t cmdq_sz = its->shadow->cmdq_len;

Prefer RCT declaration order.

> +
> +       if (cwriter_offset > cmdq_sz)
> +               return;

Off-by-one:
+       if (cwriter_offset >= cmdq_sz)

> +
> +       cmd_offset = its->cmd_host_cwriter - its->cmd_host_base;
> +       cmd_len = cwriter_offset - cmd_offset;
> +       if (cmd_len < 0)
> +               cmd_len = cmdq_sz - cmd_offset;

This relies on unsigned underflow. cwriter_offset is u64. If
cmd_offset > cwriter_offset, the result is a massive positive u64
(e.g., 0xFFFFFFF...). This works but relies on implementation-defined
behavior and is fragile. UBSAN might flag this, and if someone comes
along and "cleans up" the variables by changing cmd_len and cmd_offset
to size_t (unsigned 64-bit), which is the correct type for buffer
lengths, cmd_len < 0 will never be true. It's better to explicitly
handle the wrap-around using safe unsigned logic (which is the
idiomatic way of doing it):

+       size_t cwriter_offset = value & GENMASK(19, 5);
+       size_t cmd_len, cmd_offset;
...
+       if (cwriter_offset >= cmd_offset)
+              cmd_len = cwriter_offset - cmd_offset;
+       else
+              cmd_len = cmdq_sz - cmd_offset;

Also, cwriter_offset should be validated to ensure it is 32-byte
aligned, as the ITS commands are fixed-size packets.

> +
> +       if (cmd_offset + cmd_len > cmdq_sz)
> +               return;
> +
> +       memcpy(its->cmd_hyp_base + cmd_offset, its->cmd_host_cwriter, cmd_len);

I think we need a memory barrier (e.g., dsb(ishst)) after the memcpy
to ensure the writes are visible to the hardware before ringing the
GITS_CWRITER doorbell.

> +
> +       its->cmd_host_cwriter = its->cmd_host_base +
> +               (cmd_offset + cmd_len) % cmdq_sz;
> +       if (its->cmd_host_cwriter == its->cmd_host_base) {
> +               memcpy(its->cmd_hyp_base, its->cmd_host_base, cwriter_offset);
> +
> +               its->cmd_host_cwriter = its->cmd_host_base + cwriter_offset;
> +       }
> +
> +       writeq_relaxed(value, its->base + GITS_CWRITER);

You should sanitize this to

 +       writeq_relaxed(value & GENMASK(19, 5), its->base + GITS_CWRITER);

because value contains the raw 64-bit value written by the host. While
you extracted the offset correctly using GENMASK(19, 5), you are
forwarding the raw value (including any garbage in the RES0 bits) to
the physical hardware.

> +}
> +
> +static void cwriter_read(struct its_priv_state *its, u64 offset, u64 *read)
> +{
> +       *read = readq_relaxed(its->base + GITS_CWRITER);
> +}
> +
> +#define ITS_HANDLER(off, sz, write_cb, read_cb)        \
> +{                                                      \
> +       .offset = (off),                                \
> +       .access_size = (sz),                            \
> +       .write = (write_cb),                            \
> +       .read = (read_cb),                              \
> +}
> +
> +static struct its_handler its_handlers[] = {
> +       ITS_HANDLER(GITS_CWRITER, sizeof(u64), cwriter_write, cwriter_read),
> +       {},
> +};
>
>  void pkvm_handle_forward_req(struct pkvm_protected_reg *region, u64 offset, bool write,
>                              u64 *reg, u8 reg_size)
> @@ -21,3 +88,139 @@ void pkvm_handle_forward_req(struct pkvm_protected_reg *region, u64 offset, bool
>                         writeq_relaxed(*reg, addr);
>         }
>  }
> +
> +void pkvm_handle_gic_emulation(struct pkvm_protected_reg *region, u64 offset, bool write,
> +                              u64 *reg, u8 reg_size)
> +{
> +       struct its_priv_state *its_priv = region->priv;

Due to arm64's  memory model, you must use
smp_load_acquire(&region->priv) here to guarantee the struct fields
(base, shadow, etc.) are fully visible before dereferencing them.

(and a similar issue later on below... I'll point it out)

> +       void __iomem *addr;
> +       struct its_handler *reg_handler;

Prefer RCT declaration order.


> +
> +       if (!its_priv)
> +               return;

This breaks bisectability. In this patch, you redirect the MMIO trap
to pkvm_handle_gic_emulation, but the setup HVC
(pkvm_init_gic_its_emulation) isn't called until a later patch.
Therefore, its_priv is always NULL here, causing all host ITS accesses
to be silently dropped. The device appears dead.

 You must fall back to the passthrough handler if emulation is not yet
initialized:
+       if (!its_priv) {
+               pkvm_handle_forward_req(region, offset, write, reg, reg_size);
+               return;
+       }

at least until you setup the hvc...

> +
> +       addr = its_priv->base + offset;
> +       for (reg_handler = its_handlers; reg_handler->access_size; reg_handler++) {
> +               if (reg_handler->offset > offset ||
> +                   reg_handler->offset + reg_handler->access_size <= offset)
> +                       continue;
> +
> +               if (reg_handler->access_size & (reg_size - 1))
> +                       continue;

Is this deliberate? If access_size is 8 and reg_size is 4, 8 & 3 == 0,
so it continues and allows the 8-byte handler to process a 4-byte
write. Use explicit length matching (reg_handler->access_size !=
reg_size), but there's more later...

> +
> +               if (write && reg_handler->write) {
> +                       hyp_spin_lock(&its_priv->its_lock);
> +                       reg_handler->write(its_priv, offset, *reg);

The GIC specification requires support for 32-bit accesses to all
GITS_* registers. If the host executes a 32-bit write, *reg contains
only the 32-bit value. However, you do not pass reg_size to
cwriter_write. The handler assumes it is a full 64-bit value, which
will corrupt the other half of the emulated register with zeros. You
need to implement Read-Modify-Write logic for sub-register accesses.

> +                       hyp_spin_unlock(&its_priv->its_lock);
> +                       return;
> +               }
> +
> +               if (!write && reg_handler->read) {
> +                       hyp_spin_lock(&its_priv->its_lock);
> +                       reg_handler->read(its_priv, offset, reg);
> +                       hyp_spin_unlock(&its_priv->its_lock);
> +                       return;
> +               }
> +
> +               return;
> +       }
> +
> +       pkvm_handle_forward_req(region, offset, write, reg, reg_size);
> +}
> +
> +static struct pkvm_protected_reg *get_region(phys_addr_t dev_addr)
> +{
> +       int i;
> +       u64 dev_pfn = dev_addr >> PAGE_SHIFT;

Please prefer RCT.

> +
> +       for (i = 0; i < PKVM_PROTECTED_REGS_NUM; i++) {
> +               if (pkvm_protected_regs[i].start_pfn == dev_pfn)
> +                       return &pkvm_protected_regs[i];
> +       }
> +
> +       return NULL;
> +}
> +
> +static int pkvm_setup_its_shadow_cmdq(struct its_shadow_tables *shadow)
> +{
> +       int ret, i, num_pages;
> +       u64 shadow_start_pfn, original_start_pfn;
> +       void *cmd_shadow_va = kern_hyp_va(shadow->cmd_shadow);

Please prefer RCT. There are multiple variables declared on a single
line (int ret, i, num_pages;). Please untangle.

> +
> +       shadow_start_pfn = hyp_virt_to_pfn(cmd_shadow_va);
> +       original_start_pfn = hyp_virt_to_pfn(kern_hyp_va(shadow->cmd_original));
> +       num_pages = shadow->cmdq_len >> PAGE_SHIFT;
> +
> +       for (i = 0; i < num_pages; i++) {
> +               ret = __pkvm_host_share_hyp(shadow_start_pfn + i);
> +               if (ret)
> +                       goto unshare_shadow;
> +       }
> +
> +       ret = hyp_pin_shared_mem(cmd_shadow_va, cmd_shadow_va + shadow->cmdq_len);
> +       if (ret)
> +               goto unshare_shadow;
> +
> +       ret = __pkvm_host_donate_hyp(original_start_pfn, num_pages);
> +       if (ret)
> +               goto unpin_shadow;
> +
> +       return ret;
> +
> +unpin_shadow:
> +       hyp_unpin_shared_mem(cmd_shadow_va, cmd_shadow_va + shadow->cmdq_len);
> +
> +unshare_shadow:
> +       for (i = i - 1; i >= 0; i--)

Please use the standard while (i--) idiom for cleaner rollback loops.

> +               __pkvm_host_unshare_hyp(shadow_start_pfn + i);
> +
> +       return ret;
> +}
> +
> +int pkvm_init_gic_its_emulation(phys_addr_t dev_addr, void *host_priv_state,
> +                               struct its_shadow_tables *host_shadow)
> +{
> +       int ret;
> +       struct its_priv_state *priv_state = kern_hyp_va(host_priv_state);
> +       struct its_shadow_tables *shadow = kern_hyp_va(host_shadow);
> +       struct pkvm_protected_reg *its_reg;
> +
> +       hyp_spin_lock(&its_setup_lock);

You're not releasing this lock on any of the error paths. Please add
err_unlock and goto err_unlock to release the spinlock.

> +       its_reg = get_region(dev_addr);
> +       if (!its_reg)
> +               return -ENODEV;
> +
> +       if (its_reg->priv)
> +               return -EOPNOTSUPP;

I think you need to add a check:

+       if (!PAGE_ALIGNED(priv_state) || !PAGE_ALIGNED(shadow))
+              return -EINVAL;

since __pkvm_host_donate_hyp() expects page-aligned addresses.

> +       ret = __pkvm_host_donate_hyp(hyp_virt_to_pfn(priv_state), 1);
> +       if (ret)
> +               return ret;
> +
> +       ret = __pkvm_host_donate_hyp(hyp_virt_to_pfn(shadow), 1);
> +       if (ret)
> +               goto err_with_state;
> +
> +       ret = pkvm_setup_its_shadow_cmdq(shadow);
> +       if (ret)
> +               goto err_with_shadow;
> +
> +       its_reg->priv = priv_state;

Related to above, please use smp_store_release(&its_reg->priv,
priv_state); to prevent the compiler and CPU from reordering the
struct initialization below this pointer assignment, which would
expose uninitialized memory to the lockless reader in the trap
handler.

Cheers,
/fuad




> +
> +       hyp_spin_lock_init(&priv_state->its_lock);
> +       priv_state->shadow = shadow;
> +       priv_state->base = __hyp_va(dev_addr);
> +
> +       priv_state->cmd_hyp_base = kern_hyp_va(shadow->cmd_original);
> +       priv_state->cmd_host_base = kern_hyp_va(shadow->cmd_shadow);
> +       priv_state->cmd_host_cwriter = priv_state->cmd_host_base;
> +
> +       hyp_spin_unlock(&its_setup_lock);
> +
> +       return 0;
> +err_with_shadow:
> +       __pkvm_hyp_donate_host(hyp_virt_to_pfn(shadow), 1);
> +err_with_state:
> +       __pkvm_hyp_donate_host(hyp_virt_to_pfn(priv_state), 1);
> +       return ret;
> +}
> --
> 2.53.0.473.g4a7958ca14-goog
>

