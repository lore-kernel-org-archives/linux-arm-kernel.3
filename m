Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9836CFD7072
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+G3k2rqZ2vXMSBMpnYGO0MAWxRn6Tt+kQK5k1SVAz4=; b=HuYUH8+LBrh8/+26gNxYt0tvmN
	42AGpkdnkzxoSz7dqk/4jS9n40xf/cuQnv26uF3F1GwYC9VOAeXz3OAiwGhwwXwszGB9KU1g7WdHl
	8GpbzCqn46sxGf30tAzlCAI70kaGs1jXWKTOJNtD17EBsJR0SW9CumJ2/A2J2tkHQiE5N6RV56NO0
	a8NHbS1tXKWfE3LG0jrCJnh95CpaabUjzcy5B1kJ4VFHdppmsWlbabJvYQpmhMl/vWe/ONxKpfM7S
	TcInFzyQ7h84I0sa+DOgL2cRehw7HzU7VVomj2fhFwaZ4odvqpgZc/6/u9mMsMzx7OvOHrxQv3GIR
	KAL9K1tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RXj-00000005ybE-2c5l;
	Tue, 17 Mar 2026 10:20:55 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RXh-00000005ya0-1Stb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:20:54 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-509069a7a7fso464961cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 03:20:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773742852; cv=none;
        d=google.com; s=arc-20240605;
        b=K2g1qY3KKE7px7S1LOboa5Gdd5oKxqO1pCkXqFDGiS10FXGWxSYjYGyHhfaoKx4xqa
         IKFyFONbuS3i2qo3pQRONJqhUeKS/sFJ+hSMcx6N70JaAwbNHYASy+0yvRrapwT4kwaD
         eSUsGFYNV6K5mXFWtDjXw4JzQzC3eNLxVf6iCvtwZ+rRudr8OdA/MJ5kkEbBk7UXUK2x
         FMdS/Fr8AoWwUOR8G0UgL/fjQc3oLuBSD+ClQWgv7IogTA7nH8flXU84cPvWh3Nbz1eR
         vZWcbeSWW5hHALvZx+IaeA2TJuXgf6DPJ2bng1Ou8PZxytBA5QZrSWeCrNoRR7FeSa3G
         ULSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f+G3k2rqZ2vXMSBMpnYGO0MAWxRn6Tt+kQK5k1SVAz4=;
        fh=sm6Yzrwri3GkG5myqDopy7duhp995ZhekUDsp/DzFC0=;
        b=Q32LCFZzB4cMrph1NShzTMY+6mrXmifg9KEtRko6kVSwYwQG9QUr9eoXJSjv1Ij6it
         iBk56U8TRwyYQOYNqnLFbVT6fnuZ0o2d+keRq4LXr/jrzieAa4OHI0/ItRq/95JV8L1w
         56ptfjd3cayb3yPw/P2OHGS5PBcUI9X8cqguBNeTaPJ5aQHZgfnxLmF36ZCDkvg1CtW2
         7K05cie+lK/5RL8iADSWw/wQ55GbtxjORfrQTB/FC2PTY8fm+gOdyHu6AJey++5wwAQF
         vOtSJCf4tr+BC8YzseB6fZ953coG+xUDRbrNacdYoG+cM44WLQ0Z6+tJokIS3WZS9O4p
         wGCg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773742852; x=1774347652; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f+G3k2rqZ2vXMSBMpnYGO0MAWxRn6Tt+kQK5k1SVAz4=;
        b=DDYD4EaaucFGPUyC8phxMPIgq0ZpNbBXfreE4lwz63X+zC/ON+sD3Pbf23yyo8QDfl
         4SdrFAXZSbx/BRJpTVMKF/L9oRtoHIZl/039BFtPlDlyoyKZ6TNaMNmBwYQWUs9QDQje
         Og4XKAkUkP2KQGpPwOe2GlNic4hXPT3VTM3hckfAOTj8aTqVjpC/mj8Mq00jjOQ0ZC31
         BORw5XB0aQ0vvLDb/T38w174CijVRpMcURJRdcMyht/5lPTSm95IDLK0LAdc+r6VQdOc
         3XmabA0MoOzsjAtGi5f80D/1gRc5xLumqOLipajD2HVzjwek2AuhpEiqM2trvwQ6xZxr
         h5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773742852; x=1774347652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+G3k2rqZ2vXMSBMpnYGO0MAWxRn6Tt+kQK5k1SVAz4=;
        b=bRkNsJjrkaDljct7M5hbnXuhZrEwo9zvvJKgEuygkrprsz29BVHVecvIoh1T1QMMLt
         rxEoPr8j9oks77sfgyeM13+yBaWLg60TnOMT8poki9U4ll4RnWrebQ7NnCDOWLOeEU77
         nxTcsV+4V4pfh5PeOFECM2fDOpL9i0RdTUAOnuFhzfzmTqGmlzkp8p8zBELTbM6ZvYh3
         VMEkZ3m4Xx1CAz5fTrO/cHsLoaWhrIbRxKkibrLdWK/N0u8xLLpFs+mtS6njVJmjINp6
         Hi3cudIQ9a6WQRPtxAPkWligSTGPziWUkV01xn/IcQQTkoczLQZBqFmvN9gyt1AjaeUm
         0c1w==
X-Forwarded-Encrypted: i=1; AJvYcCX0sX0sEiPLDvj6xdHFIlJ7D4mGJPsbLwPPi0JnlBkgo8wMFX3v9UJSqcQ8H6TVAfgISKsiR+n18vDd1tWjS3eB@lists.infradead.org
X-Gm-Message-State: AOJu0YyCGPtmNOksQ+n3zivrewbqB3s6fIhCu0hJ8qzrkENSE7F9D04Z
	345Hzb3dlZHxJw1T59EJz8uWEs+aPRc4Ph6bfu0NOgnJa5PZD0weYGzxSgs6i7rctABKLgTwS7U
	pJW5Py2yhlxJj9VV6xMJP3xlMoI16bngtqF1DcJ+e
X-Gm-Gg: ATEYQzzEqKrI4qy4K8IBOh7pGB0AkhfODM31gloxhXHE9GjNI87xow63tZ5VJFZaljF
	mVhT+NzkP7yvwcd8QCsxE0LuIE9+UpYgp7P4RAZQHBXCFvNQQesWuDGa2foGypG2cJtQNOBPNrG
	e/SAOwPfauM8worhVcSyo6FjFLeWIDe3/6LdIK33BRQIBsrBXFKSb2xVljp6TtaPw6pKnsFmzSd
	4EALquAijXoEH3a8PwfTnP997JiBEQSar8RnDXReeSkpIukzyqFSzjD5DcvjNJcu+icOpAUtR3O
	GPyUaZNDThayc493MXTKu+PuG1p3rDv3F1i3e7l7QlPZa7U=
X-Received: by 2002:a05:622a:1ba7:b0:4ff:cb72:7c03 with SMTP id
 d75a77b69052e-5099ac6cce6mr10382591cf.3.1773742851259; Tue, 17 Mar 2026
 03:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com> <20260310124933.830025-9-sebastianene@google.com>
In-Reply-To: <20260310124933.830025-9-sebastianene@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 10:20:14 +0000
X-Gm-Features: AaiRm50TPE0FIw-7TUW05xg8zVnIiwfm0n7O_Lk2IR6hWpuMOCIItnRIP8yL7co
Message-ID: <CA+EHjTzfoRPvfe-SNW_e=-p+3Yy2UPu90y0bsvSJ9OOgnc7C6g@mail.gmail.com>
Subject: Re: [PATCH 08/14] KVM: arm64: Trap & emulate the ITS MAPD command
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
X-CRM114-CacheID: sfid-20260317_032053_458461_D93FFE1A 
X-CRM114-Status: GOOD (  35.86  )
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
> Parse the MAPD command and extract the ITT address to
> sanitize it. When the command has the valid bit set,
> share the memory that holds the ITT table
> with the hypervisor to prevent it from being used
> by someone else and track the pages in an array.
> When the valid bit is cleared, check if the pages
> are tracked and then remove the sharing with the
> hypervisor.
> Check if we need to do any shadow table updates
> in case the device table is configured with an
> indirect layout.

Same as the previous commit message, could you please clarify the
"why" rather than only the "how"?

For someone without deep context of the pKVM ITS isolation model, this
message does not explain the threat vector.

>
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/its_emulate.c | 182 ++++++++++++++++++++++++++
>  drivers/irqchip/irq-gic-v3-its.c      |  12 --
>  include/linux/irqchip/arm-gic-v3.h    |  12 ++
>  3 files changed, 194 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
> index 865a5d6353ed..722fe80dc2e5 100644
> --- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
> +++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
> @@ -12,8 +12,13 @@ struct its_priv_state {
>         void *cmd_host_cwriter;
>         struct its_shadow_tables *shadow;
>         hyp_spinlock_t its_lock;
> +       u16 empty_idx;
> +       u64 tracked_pfns[];
>  };
>
> +#define MAX_TRACKED_PFNS       ((PAGE_SIZE - offsetof(struct its_priv_state, \
> +                                 tracked_pfns)) / sizeof(u64))
> +
>  struct its_handler {
>         u64 offset;
>         u8 access_size;
> @@ -23,6 +28,178 @@ struct its_handler {
>
>  DEFINE_HYP_SPINLOCK(its_setup_lock);
>
> +static int track_pfn_add(struct its_priv_state *its, u64 pfn)
> +{
> +       int ret, i;
> +
> +       if (its->empty_idx + 1 >= MAX_TRACKED_PFNS)
> +               return -ENOSPC;

Why +1? This wastes the final slot in the array. It should just be: if
(its->empty_idx >= MAX_TRACKED_PFNS).

More importantly, doing an O(N) linear array scan to manage empty_idx
inside track_pfn_add and track_pfn_remove while holding the raw
its_priv->its_lock needlessly inflates host IRQ latency. Please
replace this array with a  BITMAP.

> +
> +       ret = __pkvm_host_share_hyp(pfn);
> +       if (ret)
> +               return ret;
> +
> +       its->tracked_pfns[its->empty_idx] = pfn;
> +       for (i = 0; i < MAX_TRACKED_PFNS; i++) {
> +               if (!its->tracked_pfns[i])
> +                       break;
> +       }
> +
> +       its->empty_idx = i;
> +       return 0;
> +}
> +
> +static int track_pfn_remove(struct its_priv_state *its, u64 pfn)
> +{
> +       int i, ret;
> +
> +       for (i = 0; i < MAX_TRACKED_PFNS; i++) {
> +               if (its->tracked_pfns[i] != pfn)
> +                       continue;
> +
> +               ret = __pkvm_host_unshare_hyp(pfn);
> +               if (ret)
> +                       return ret;
> +
> +               its->tracked_pfns[i] = 0;
> +               its->empty_idx = i;
> +       }
> +
> +       return 0;
> +}

If the PFN isn't found in the array, this silently returns 0 (success).

> +
> +static int get_num_itt_pages(struct its_priv_state *its, u8 num_bits)
> +{
> +       int nr_ites = 1 << (num_bits + 1);
> +       u64 size, gits_typer = readq_relaxed(its->base + GITS_TYPER);
> +
> +       size = nr_ites * (FIELD_GET(GITS_TYPER_ITT_ENTRY_SIZE, gits_typer) + 1);
> +       size = max(size, ITS_ITT_ALIGN) + ITS_ITT_ALIGN - 1;
> +
> +       return PAGE_ALIGN(size) >> PAGE_SHIFT;
> +}
> +
> +static int track_pfn(struct its_priv_state *its, u64 start_pfn, int num_pages, bool remove)
> +{
> +       int i, ret;
> +
> +       for (i = 0; i < num_pages; i++) {
> +               if (remove)
> +                       ret = track_pfn_remove(its, start_pfn + i);
> +               else
> +                       ret = track_pfn_add(its, start_pfn + i);
> +
> +               if (ret)
> +                       goto err_track;
> +       }
> +
> +       return 0;
> +err_track:
> +       for (i = i - 1; i >= 0; i--) {
> +               if (remove)
> +                       track_pfn_add(its, start_pfn + i);
> +               else
> +                       track_pfn_remove(its, start_pfn + i);
> +       }
> +
> +       return ret;
> +}
> +
> +static struct its_baser *get_table(struct its_priv_state *its, u64 type)
> +{
> +       int i;
> +       struct its_shadow_tables *shadow = its->shadow;
> +
> +       for (i = 0; i < GITS_BASER_NR_REGS; i++) {
> +               if (GITS_BASER_TYPE(shadow->tables[i].val) == type)
> +                       return &shadow->tables[i];
> +       }
> +
> +       return NULL;
> +}
> +
> +static int check_table_update(struct its_priv_state *its, u32 id, u64 type)
> +{
> +       u32 lvl1_idx;
> +       u64 esz, *host_table, *hyp_table, new_entry, update;
> +       struct its_baser *table = get_table(its, type);
> +       int ret;
> +       phys_addr_t new_lvl2_table, lvl2_table;
> +
> +       if (!table)
> +               return -EINVAL;
> +
> +       if (!(table->val & GITS_BASER_INDIRECT))
> +               return 0;
> +
> +       esz = GITS_BASER_ENTRY_SIZE(table->val);
> +       lvl1_idx = id / (table->psz / esz);
> +
> +       host_table = kern_hyp_va(table->shadow);
> +       hyp_table = kern_hyp_va(table->base);
> +
> +       new_entry = host_table[id];

This accesses the entry based on id, which isn't sanitized.

> +       update = new_entry ^ hyp_table[id];
> +       if (!update || !(update & GITS_BASER_VALID))
> +               return 0;

This assumes any meaningful update must toggle the Valid bit. If the
host issues a MAPD that changes the Level 2 table pointer but keeps
Valid=1, update & GITS_BASER_VALID is 0.

> +
> +       new_lvl2_table = hyp_phys_to_pfn(new_entry & PHYS_MASK_SHIFT);
> +       lvl2_table = hyp_phys_to_pfn(hyp_table[id] & PHYS_MASK_SHIFT);

Should this be PHYS_MASK?

> +       if (new_entry & GITS_BASER_VALID)
> +               ret = __pkvm_host_donate_hyp(new_lvl2_table, table->psz >> PAGE_SHIFT);
> +       else
> +               ret = __pkvm_hyp_donate_host(lvl2_table, table->psz >> PAGE_SHIFT);

Similar issue to the one I mentioned in a previous patch regarding ITS
page size vs host page size.


> +       if (ret)
> +               return ret;
> +
> +       hyp_table[id] = new_entry;
> +       return 0;
> +}
> +
> +static int process_its_mapd(struct its_priv_state *its, struct its_cmd_block *cmd)
> +{
> +       phys_addr_t itt_addr = cmd->raw_cmd[2] & GENMASK(51, 8);
> +       u8 size = cmd->raw_cmd[1] & GENMASK(4, 0);
> +       bool remove = !(cmd->raw_cmd[2] & BIT(63));
> +       u32 device_id = cmd->raw_cmd[0] >> 32;
> +       int num_pages, ret;
> +       u64 base_pfn;
> +
> +       if (PAGE_ALIGNED(itt_addr))
> +               return -EINVAL;

This is inverted, right?

Cheers,
/fuad

> +
> +       base_pfn = hyp_phys_to_pfn(itt_addr);
> +       num_pages = get_num_itt_pages(its, size);
> +
> +       ret = check_table_update(its, device_id, GITS_BASER_TYPE_DEVICE);
> +       if (ret)
> +               return ret;
> +
> +       return track_pfn(its, base_pfn, num_pages, remove);
> +}
> +
> +static int parse_its_cmdq(struct its_priv_state *its, int offset, ssize_t len)
> +{
> +       struct its_cmd_block *cmd = its->cmd_hyp_base + offset;
> +       u8 req_type;
> +       int ret = 0;
> +
> +       while (len > 0 && !ret) {
> +               req_type = cmd->raw_cmd[0] & GENMASK(7, 0);
> +
> +               switch (req_type) {
> +               case GITS_CMD_MAPD:
> +                       ret = process_its_mapd(its, cmd);
> +                       break;
> +               }
> +
> +               cmd++;
> +               len -= sizeof(struct its_cmd_block);
> +       }
> +
> +       return ret;
> +}
> +
>  static void cwriter_write(struct its_priv_state *its, u64 offset, u64 value)
>  {
>         u64 cwriter_offset = value & GENMASK(19, 5);
> @@ -41,11 +218,15 @@ static void cwriter_write(struct its_priv_state *its, u64 offset, u64 value)
>                 return;
>
>         memcpy(its->cmd_hyp_base + cmd_offset, its->cmd_host_cwriter, cmd_len);
> +       if (parse_its_cmdq(its, cmd_offset, cmd_len))
> +               return;
>
>         its->cmd_host_cwriter = its->cmd_host_base +
>                 (cmd_offset + cmd_len) % cmdq_sz;
>         if (its->cmd_host_cwriter == its->cmd_host_base) {
>                 memcpy(its->cmd_hyp_base, its->cmd_host_base, cwriter_offset);
> +               if (parse_its_cmdq(its, cmd_offset, cmd_len))
> +                       return;
>
>                 its->cmd_host_cwriter = its->cmd_host_base + cwriter_offset;
>         }
> @@ -357,6 +538,7 @@ int pkvm_init_gic_its_emulation(phys_addr_t dev_addr, void *host_priv_state,
>         priv_state->cmd_hyp_base = kern_hyp_va(shadow->cmd_original);
>         priv_state->cmd_host_base = kern_hyp_va(shadow->cmd_shadow);
>         priv_state->cmd_host_cwriter = priv_state->cmd_host_base;
> +       priv_state->empty_idx = 0;
>
>         hyp_spin_unlock(&its_setup_lock);
>
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 278dbc56f962..be78f7dccb9f 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -121,8 +121,6 @@ static DEFINE_PER_CPU(struct its_node *, local_4_1_its);
>  #define is_v4_1(its)           (!!((its)->typer & GITS_TYPER_VMAPP))
>  #define device_ids(its)                (FIELD_GET(GITS_TYPER_DEVBITS, (its)->typer) + 1)
>
> -#define ITS_ITT_ALIGN          SZ_256
> -
>  /* The maximum number of VPEID bits supported by VLPI commands */
>  #define ITS_MAX_VPEID_BITS                                             \
>         ({                                                              \
> @@ -515,16 +513,6 @@ struct its_cmd_desc {
>         };
>  };
>
> -/*
> - * The ITS command block, which is what the ITS actually parses.
> - */
> -struct its_cmd_block {
> -       union {
> -               u64     raw_cmd[4];
> -               __le64  raw_cmd_le[4];
> -       };
> -};
> -
>  #define ITS_CMD_QUEUE_SZ               SZ_64K
>  #define ITS_CMD_QUEUE_NR_ENTRIES       (ITS_CMD_QUEUE_SZ / sizeof(struct its_cmd_block))
>
> diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
> index 40457a4375d4..4f7d47f3d970 100644
> --- a/include/linux/irqchip/arm-gic-v3.h
> +++ b/include/linux/irqchip/arm-gic-v3.h
> @@ -612,6 +612,8 @@
>   */
>  #define GIC_IRQ_TYPE_LPI               0xa110c8ed
>
> +#define ITS_ITT_ALIGN                  SZ_256
> +
>  struct rdists {
>         struct {
>                 raw_spinlock_t  rd_lock;
> @@ -634,6 +636,16 @@ struct rdists {
>         bool                    has_vpend_valid_dirty;
>  };
>
> +/*
> + * The ITS command block, which is what the ITS actually parses.
> + */
> +struct its_cmd_block {
> +       union {
> +               u64     raw_cmd[4];
> +               __le64  raw_cmd_le[4];
> +       };
> +};
> +
>  struct irq_domain;
>  struct fwnode_handle;
>  int __init its_lpi_memreserve_init(void);
> --
> 2.53.0.473.g4a7958ca14-goog
>

