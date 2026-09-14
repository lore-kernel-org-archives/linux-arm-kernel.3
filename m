Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C53C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 17:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqWAug7PIA7vvHXFXzzJ6C7IaIzD7MK50jLrp6AsEY8=; b=q4FEITYHdmRGnkcckjf0JnhsBw
	eVkKwdLvsR5wR5jEa0nFVZ8TJ9xWbpJVWwTovFJo+GJj7SpxrUorsGMz/74QiebJJajq45LyuzDcq
	JN1SO44UqLa7OEqfHgq4NoqvXRcsa6vOVa7R3F77jInJXsZakegHoz9Le6G6QTIzBofXr0Twnx2z+
	YXl3iFDDWdl+7WhMGt/6Po5qPKNvyt+a3tl0RXGD2sdfe+1RUfDJjqkKnWID2EnYPfoXoH/QwWE6a
	HdRWscM65MxlFT71rPfAUWuQ6oPrl/LU70d5hkKX3KPfBA3xKuGSKTeO8tQqPnhVT5qEqUevknvYI
	DIe+xcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ah8-00000004Oh8-3Ix4;
	Mon, 14 Sep 2026 17:42:19 +0000
Received: from out-32.mta0.migadu.com ([2001:41d0:1004:224b::20] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ah4-00000004Ogb-45qs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 17:42:17 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=H3NkHegXyGUlyjvPCAtBxAqpQZBuP5a+mlCVvVxrsTg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789407732; v=1; x=1790012532;
 b=LF2EXt3sn4I8J2IqH7lKoPkNDgzSHNIBCufAC4obfwBl2w7tlhPBylLFYGCSPknWLTIoZu+R
 dU1U5Zq9NiTKEKgDx1ZGFQFN/QbJeNldLYc2GwvFHVigJUoU+WQKLoltZGf/joJJ6WFAHJktbIt
 TTpRuIJ939L3h0TvDvQZQw8k=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id be952ab7f5db3e16;
	Mon, 14 Sep 2026 17:42:12 +0000
X-Mizu-Trace-ID: be952ab7f5db3e16
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so10825e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 10:42:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzOlJ+JcY7uvuo3RLWOZbsTxZ/PhmfphLNspZLoGooXyi+yRkz+VdGCNyHr7OjFccajaWMD4qOSGpF5Dt8ld6UD@lists.infradead.org
X-Gm-Message-State: AFuF++k2vJRooFFQJRSqGGn74WLLEj79Jh7k0XDGuDASrq7Ii0eUL39n
	kYiPJ7c07AZVspIP4tj53HNeqyCdr8i0+oxQdpHk4NoBr3etjkOcyvWmTgkpPYIrPAbChx9xnWU
	BLrlDsBsLvEDJGP/ZEu8icpVzv6P5QsdTC+hOyRo7
X-Received: by 2002:ac2:5b83:0:b0:5b1:571f:715f with SMTP id
 2adb3069b0e04-5b8b2d5efccmr7429e87.3.1789407727631; Mon, 14 Sep 2026 10:42:07
 -0700 (PDT)
MIME-Version: 1.0
References: <20260830-host-direct-messages-v7-0-45f6e6db72c2@google.com> <20260830-host-direct-messages-v7-3-45f6e6db72c2@google.com>
In-Reply-To: <20260830-host-direct-messages-v7-3-45f6e6db72c2@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 14 Sep 2026 18:41:31 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzqCTc_8Y3jmR2R4c=SfBCpJ0pDy+4MCO-UHLbaxNW8rQ@mail.gmail.com>
X-Gm-Features: AcwNN1WgO8h5j0RDDssCnFHMWznF85XnD9prWGY6qwmWeeRWnJoBTvrMxsiCagc
Message-ID: <CA+EHjTzqCTc_8Y3jmR2R4c=SfBCpJ0pDy+4MCO-UHLbaxNW8rQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in
 host handler
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Sebastien Ene <sebastianene@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_104215_633375_B057BB7A 
X-CRM114-Status: GOOD (  13.37  )
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

Hi Per,

On Mon, 31 Aug 2026 at 00:08, Per Larsen via B4 Relay
<devnull+perlarsen.google.com@kernel.org> wrote:
...
> -static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
> +static void do_ffa_direct_msg(const u64 func_id,
> +                             struct arm_smccc_1_2_regs *res,
>                               struct kvm_cpu_context *ctxt)
>  {
>         DECLARE_REG(u64, endp, ctxt, 1);
> @@ -894,8 +896,12 @@ static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
>                 return;
>         }
>
> -       /* filter out framework messages and validate SBZ/MBZ bits */
> -       if (flags) {
> +       /*
> +        * filter out framework messages and validate SBZ/MBZ flag bits.
> +        * FFA_MSG_SEND_DIRECT_REQ2 implies flag-less partition message.
> +        */
> +       if ((func_id == FFA_MSG_SEND_DIRECT_REQ ||
> +            func_id == FFA_FN64_MSG_SEND_DIRECT_REQ) && flags) {
>                 ffa_to_smccc_error(res, FFA_RET_INVALID_PARAMETERS);
>                 return;

flags holds x2, which on the REQ2 path is the UUID's low half, so the
name reads as if REQ2 flags had been checked and found zero. Could it
be w2 instead?

Cheers,
/fuad


>         }
> @@ -961,15 +967,20 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>         case FFA_PARTITION_INFO_GET:
>                 do_ffa_part_get(&res, host_ctxt);
>                 goto out_handled;
> +       case FFA_MSG_SEND_DIRECT_REQ2:
> +               if (!ffa_call_supported(func_id))
> +                       goto out_not_supported;
> +               fallthrough;
>         case FFA_MSG_SEND_DIRECT_REQ:
>         case FFA_FN64_MSG_SEND_DIRECT_REQ:
> -               do_ffa_direct_msg(&res, host_ctxt);
> +               do_ffa_direct_msg(func_id, &res, host_ctxt);
>                 goto out_handled;
>         }
>
>         if (ffa_call_supported(func_id))
>                 return false; /* Pass through */
>
> +out_not_supported:
>         ffa_to_smccc_error(&res, FFA_RET_NOT_SUPPORTED);
>  out_handled:
>         ffa_set_retval(host_ctxt, &res);
>
> --
> 2.55.0.897.gb25b4bd76c-goog
>
>

