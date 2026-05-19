Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD323CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4sIM5W7sb+vgXCeGk89INhm5L5HYFz3xkdbbX+NpWs=; b=Aj5XCUP5Mie9nZSU3OHtjdpR2h
	CWza1t4xBDNqqfQNXRRo2Qs9Cl8fpX+49oO/C9SmNITpbwQ78GXNyrhMo0YAyueUFrihtWm35f4Pf
	fWWFbiu8YU3dEc8oDG+xPVaJh80XsAZQGed6IIuM8UkIqzuppTTSh9P/8R50AHCbw4p+wC3IxgPVy
	tn3vdSMvd4fTjMTZp/fakpg0nb48RyrTBhkAJshxlwrRmTKuK6AnUaHZi/CVjQNgeEoTnZodZm3nX
	117eUHyhIvXaotpsjP1VgueRsaqUhGdqev9oeE9RrsRBdgoUrguVF3SkV2Sc72YZ5dKj68vc0P+Je
	cIM4iJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJam-00000001TwW-1RDh;
	Tue, 19 May 2026 12:30:36 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJaj-00000001TvK-3mXz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 12:30:35 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-515548f390fso101cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 05:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779193832; cv=none;
        d=google.com; s=arc-20240605;
        b=lPSaHA/A3PZ8+Kmw5iaHuzlVKwTNinxIXIHFJp2mlwQDdY04b9b0V/ZVZ/Z1+gq+uy
         pTwGiS6H8y5Wx4ZTdNUYEW5/2yDXBfy1jhcxa2Z9tU8zDrXK2WSWzHi5BdBXNDfU48pM
         xDIaODPqqSLjcZfXEbzNZp4NfrrVYkUS24I3FIIwDW/pVWOhfHvtL3KU++zLvPKXkuaE
         qWcjfW+UQN/gp3wzrHLk6sGHjiDJ2s2syEtfGTEJ0wLYAkIzaezR3VUw0hOUELA7blUx
         w6dzqPMN0FwUjdmgOX2BPZTohlb4lO9Dj5UBYaKKD6K3fc/56IxFsEkvq2RmnMVeJ+Yv
         QqjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T4sIM5W7sb+vgXCeGk89INhm5L5HYFz3xkdbbX+NpWs=;
        fh=b1FzLiJ9rLZ05wiEd1vgjPMYSz6q23+zb4LpyKCoxeE=;
        b=DdEN0toJN0IGoO/4eOllVMZ4/aD+fQuGDDb85cbKiaXQCK3qmJLWcVUhCyzkTcADY/
         dFg7Vm71V6Ig7yfgnf8t71XSlcpllTOUXoKO60aO4MU+cPOLwseZhM8XtLDZpsgrQsct
         gOnBCy4SQ06jm4W+1svqts4X2hsPEKjRVU9VraJ0KUGcRmNFNMTbxa8rGPkMyuOWe8cp
         oo71yHAWUkcT+zWkLvmWzBSmMdtAAE+ly3sts6EwlZSdswCpHXgr1tyPqd4AS0anFGDb
         99C8l2Po7PJl2itAl/J5rK+C4v1DFj7mlFU6okz/rmn4rknmJzgyO5lUw0fIWrIUVE+G
         jqDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779193832; x=1779798632; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T4sIM5W7sb+vgXCeGk89INhm5L5HYFz3xkdbbX+NpWs=;
        b=bxs0y4isggLNqbPZA8CumnSFB4sA+bkaagRbJNzEk/WQv5Txr3xnq2TfexUyoT3tfB
         kFqvOBxD40Qca1Jy5oa4U+Mujk33stri8xT4HERMCcMLia2FZCJJq0Bs3IsYLD2xzkSg
         8XNdfMtn82bDBYhWMw1zF9fZSd3w0ANpqJrhjj1t8msCaSJZFxrRcGfqsAq41+M0oCSD
         lgkkeOrPEDH04RJS/49m+Qd5yYldo7Ek28AONiddSxFfWh3ZZh/ikEE9ZjE/Ud8UkeRo
         DBxe6YfU5UWExCfGrzyZoUCR34vpLJhnt6IbuHWVB6SDUZmvfGQOmnln6D1cw2GmBzts
         xXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779193832; x=1779798632;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4sIM5W7sb+vgXCeGk89INhm5L5HYFz3xkdbbX+NpWs=;
        b=c2a4+2xldL+it+/QcqoQiDZJG3NDUXZFLbWEAAPo5KCDwDj99BU3O7H5SOeGbkZt+K
         vdM4sncmXnzVPYT9DM4qWGna3mUwd6syXFCRPlAKFGmJhmBCxmvGUQplwWdDm8RfxZrX
         jUUFX492ta+cNpa88MBSymc8mmlZOl1QZVccr7F1kk11M55MkhtnbLhdjsW6wgM5kqCV
         hZmdqp3bTlxw/uT4kBaBBXM76DOnQjX3+9UZGcAQp7jg9lHSEzn8318+ErTk7Lq/4UEp
         xzp8DBK9H6RyeS9xYYdt8g6EYa2Rxdt4m7EPp+FiiqPeZwmBKfZPbmZRSxlGRqbbm2Iw
         fIaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GszD6TtAYff80fwa+2GdOnuaSXZ4IJasVhv4JLNOPX9ZN9eDQnXb1xOD84S4bVuQA7rtqicWFf7SK8lp6nzyk@lists.infradead.org
X-Gm-Message-State: AOJu0YwspGDiihUULFK27gQiC4ZvAV/RMyv08F0f9NouA7qrHzxLi7OJ
	7MwYlqg0Pj5y8GEEKJO9NEC2vGknhc3SSHHf0+ErG7MA2Z0g3ORKuUjqJqO1G0sc1V2OrfEqpQ6
	4oD8gLTJLmILgzyQIJMe8oY4WxvJaNzabYNKBTApk
X-Gm-Gg: Acq92OF14LSeGjFdqRsSwTwupL/may8mGm4gXFfvo+HNrdjSCHUyv25+u00BjpjCFj0
	T9t92dXkPO+shCjvZzi8k6cFZMZbm0UfVl337rNK9nmEjedf33dmpvubs+cbgiiqP0mP9yRndW1
	b1HWaLQ5BacQH/P+QuEnxK1H9HUB9BcYNnIf+Cz8Ln+B36xS2LcW+2+qju+580AXGG2rebb9FBn
	us3K3VI4FldDt4CdON71ddncH90fOZMZvB59IcWasQa/5u4VeIiQ9fE0kraKg0z4+Pe70/ofCcA
	DJay0k28qCrOEX5ibRTOtwe+svKhIm5v5wfmInI5yeh7nWYP
X-Received: by 2002:a05:622a:258c:b0:516:4f62:85ef with SMTP id
 d75a77b69052e-516794623e8mr5463001cf.20.1779193830947; Tue, 19 May 2026
 05:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260501-host-direct-messages-v6-0-3f4af727ed85@google.com> <20260501-host-direct-messages-v6-1-3f4af727ed85@google.com>
In-Reply-To: <20260501-host-direct-messages-v6-1-3f4af727ed85@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 19 May 2026 13:29:53 +0100
X-Gm-Features: AVHnY4JCKN8u315XEm5-PkCtuH_gksQn8y22bEYloMMa3Htlz66vFU5m6nvVvsQ
Message-ID: <CA+EHjTyvc=cmx9pv34govtbxJ1TDd6RPDoCfMR-dxO-R1jzNMQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in
 host handler
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Armelle Laine <armellel@google.com>, 
	Sebastien Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_053033_953112_CA7AD3F3 
X-CRM114-Status: GOOD (  23.69  )
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

Hi Per and Seb,

On Fri, 1 May 2026 at 06:34, Per Larsen via B4 Relay
<devnull+perlarsen.google.com@kernel.org> wrote:
>
> From: Sebastian Ene <sebastianene@google.com>
>
> Allow direct messages to be forwarded from the host. The host should
> not be sending framework messages so they are filtered out.
>
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 26 ++++++++++++++++++++++++++
>  include/linux/arm_ffa.h       |  2 ++
>  2 files changed, 28 insertions(+)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 1af722771178..3a58e01d255f 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -862,6 +862,28 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>         hyp_spin_unlock(&host_buffers.lock);
>  }
>
> +static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
> +                             struct kvm_cpu_context *ctxt)
> +{
> +       DECLARE_REG(u32, endp, ctxt, 1);
> +       DECLARE_REG(u32, flags, ctxt, 2);
> +
> +       struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];
> +
> +       if (FIELD_GET(FFA_SRC_ENDPOINT_MASK, endp) != HOST_FFA_ID) {
> +               ffa_to_smccc_error(res, FFA_RET_INVALID_PARAMETERS);
> +               return;
> +       }
> +
> +       /* filter out framework messages and validate SBZ/MBZ bits */
> +       if (flags) {
> +               ffa_to_smccc_error(res, FFA_RET_INVALID_PARAMETERS);
> +               return;
> +       }
> +
> +       arm_smccc_1_2_smc(args, res);
> +}
> +
>  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  {
>         struct arm_smccc_1_2_regs res;
> @@ -920,6 +942,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>         case FFA_PARTITION_INFO_GET:
>                 do_ffa_part_get(&res, host_ctxt);
>                 goto out_handled;
> +       case FFA_MSG_SEND_DIRECT_REQ:
> +       case FFA_FN64_MSG_SEND_DIRECT_REQ:
> +               do_ffa_direct_msg(&res, host_ctxt);
> +               goto out_handled;
>         }

The commit message says the host should not be sending framework
messages, so they're filtered out. That filter is only installed for
REQ. The RESP side is asymmetric: FFA_MSG_SEND_DIRECT_RESP is in the
reject list, but FFA_FN64_MSG_SEND_DIRECT_RESP isn't. Should you add
that too?

Sashiko [1] also flagged two issues here. Took a quick look and the
tracing one seems to be worth a closer look. The upper-bits question
is judgement but plausible.

[1] https://sashiko.dev/#/patchset/20260501-host-direct-messages-v6-0-3f4af727ed85%40google.com

Cheers,
/fuad

>
>         if (ffa_call_supported(func_id))
> diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
> index 81e603839c4a..f47d4bd51b2d 100644
> --- a/include/linux/arm_ffa.h
> +++ b/include/linux/arm_ffa.h
> @@ -269,6 +269,8 @@ bool ffa_partition_check_property(struct ffa_device *dev, u32 property)
>         (ffa_partition_check_property(dev, FFA_PARTITION_DIRECT_REQ2_RECV) && \
>          !dev->mode_32bit)
>
> +#define FFA_SRC_ENDPOINT_MASK  GENMASK(31, 16)
> +
>  /* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP} which pass data via registers */
>  struct ffa_send_direct_data {
>         unsigned long data0; /* w3/x3 */
>
> --
> 2.54.0.545.g6539524ca2-goog
>
>
>

