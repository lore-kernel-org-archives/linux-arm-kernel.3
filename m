Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF28CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EHisNFyKc4RDoQIbb7dFN77BBMtRwURYpatGZmAWVM=; b=xZcaia5O5jpymQ3y8G4EbjXfFI
	p+f/OfopnuA4kus4WoHb4pGHIhe4a64aUnGokY0bBYHZi/KWGY0Y8mHv/umz4gQdrlmYMsfJFjYXt
	jhOVus1CjelIyQVc7i2gxx+NLV6pseQ9T1wcljIvdH6o/omdrLA+KWBPMX/bCUFwP2Hn6rcPmqgPJ
	AkpHrzkg4Ol0mUC2ocLG7IZx3KOcGpleLoLexaTA4bxYwZ3q3J1WfyldxB/xwnbd2UgQcX3nXbwAU
	eFMrGvyi8WlS89t6/XZPOhvxCk5l3HGt9cuP74IKUAX0QzjWORy69LImfuxqsvy7SgUK5K2ByeleZ
	iEGHNPdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJ6y-00000001OqZ-1cfN;
	Tue, 19 May 2026 11:59:48 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJ6v-00000001Opn-3H7n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 11:59:47 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50d864c23bdso16981cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 04:59:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779191984; cv=none;
        d=google.com; s=arc-20240605;
        b=NWD5kbCXOxEx79cdx3y4CByryj4AHXQBWOWB8D7nU6yrwPlmSW3TjOjj0ceRK3HgqH
         IrXAUv1td4D4Vf70PbV73zA+iC/QN7/3LvU2VzL4VdXbqMXpA1aFeeyBCj9guajMDw+1
         590S7ZurVcWmMmWSX+ztIc8lqtKdO0AuoPxcu8SObnheEBI3mLu8Yeb8jAwH6aAP7Fqj
         32Mxh/azZLgY0/1+E4fD9Pz1B6CduwyOFJQrxp9nhy8b0MIMnpHPW8Itc98GryYqVmNM
         5jyob8b7xqusM1j9sPoT8gDjmoZee03ZwVCEu0BSrel9b8v+PI+te8FQqd+GL/272t9j
         3EMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5EHisNFyKc4RDoQIbb7dFN77BBMtRwURYpatGZmAWVM=;
        fh=ralYBd206bqwmNnQlCR7zFERoQ4JxSVqyx3CE5HucOc=;
        b=cRtD+aRN4DpZRiqrYamYy0CEmSFgoSVA+7nl561UexB69SstmkfCFnpS/MXr+xMPMU
         VaaAr43sVigvzfnzmFjFQDUXn7uugUaQQkMb3pbH+YtZ9Cm8VbVpeuHd8EKmJTKaWgQd
         fQKzukyUdIG3bN4ReIn9t7xOG9yMdM6KpTJKhMlb2VWvfdwmI64boPV8bZ6R34y+clHn
         9sANG/eUxsPx+RBAgMeSN26n+Y45zZJAtDDIhnvAavIewY5kvK9OGW6hMNpz+iy5V04W
         PpEHZPKtdnohTG/NyyiR2jk9rjiNc61fEl2Q2W0nqTd2bcivTmrnaSiEwtGhSjYZNlQD
         75Mw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779191984; x=1779796784; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5EHisNFyKc4RDoQIbb7dFN77BBMtRwURYpatGZmAWVM=;
        b=DCzLEg5wyKFyJ6agii0cZO93ZOLtwuIV/dzXGoORSsBZCxfUxjXRF/75lNUOGMv0mK
         b+zDSQRKiM7SLYcPiC7tLYQRib0FpyKSKG8nI7cq18kpUYNr41T6vPM8MAM+xMu7TqMT
         j+fQaEX1Wj/BwDfSbVb0toYxkRkJm6/4sahEX6TqkXuhHDYuNHgkbkDKgcrMkEMN6QQC
         EHMNG+febdJa/ED7wMmlo/vFVy5OQlRX/yfYua76G2rlwsh/t4UmjB7Z7qh72tWobruK
         lsz2b0O85skzb0TshosJ8HbnzWElputvC4OJdIWWLh0Z3N7xvidfzS/V4xRX3oCtS/c3
         wkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779191984; x=1779796784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5EHisNFyKc4RDoQIbb7dFN77BBMtRwURYpatGZmAWVM=;
        b=C6T7U7jpXHrOLpTeezSOzthodkThOeTBYHTt9o9I10BOZs5JMuSvCRS7xstgFBtcYn
         KDi1RoEyI8qOgwbBZdSHZkSnnAB2KCCvxiy2OoBwy5r5t2M0jrOegKb/Uqi1gvorw3Iw
         s1sgxkRn+0e9WlHiGLpJjBLQ6JMJNKdj2uR4dKanef69abuOKn56A5M2o8gOhvevODkv
         pp70iSXs66qxvi2GPkZni2B75qu7x2uxyQ2u6WLFslhqj0unJJMawmQMNZzpaQy+hlJ7
         +MambGPZ1erm/EVT5UJ+THYOnu2OVio6Gu3g3N90D9iIJ0G7/ZvfqsIELpRNqicm5e9b
         yNoA==
X-Forwarded-Encrypted: i=1; AFNElJ/MrVs0oiQPYA0FPP7XRBYbI3hEZ63oEVagdxLW/wiAXPQgx7m68XFJ03s2mCQmtp0LuW+05acSvJD3vuARDsFV@lists.infradead.org
X-Gm-Message-State: AOJu0YwWD8eMv5wc7+qOKGNSUhdrWazjW6hCZSoJYFQZ7NGWA8/QPheV
	VNX0lu7AJA1MRA/cGjn+bDpu8xLrC80nY6cpNWm4hZ/vuMaitwqO3P0KNtpnuhLL3XwIDA8aI84
	Va4BLoKxH+kP77CldNj+QGso69S+2YnlTUsOSsDZwxfTKKTNKKhWMtKWJOK8=
X-Gm-Gg: Acq92OFz65JafDG9UIcd3E9Qcvj1lG6X0vXzs5MtANhP+Ifm1r3swokTICPi6GvdT1y
	Lkc2xsv12ENwsumk1t3ojYl6klCUhyRPi+X62A/xLA4fbJK28wj5AAHk6BWOFS0OBRAP1TXWVUf
	dWGgBn98Tm06LQiddipFc+dQBFcwNHLcOcZQ424XRVcYpRFt7QfWTpDICEOtHmF5N6pShIkYeqK
	29yLt6V26rNRcLI9LvKcmrpDSuG86kF2cVyxHUE0FEzeR0t8F0rHQ4r8+8+ClI8dbAA/eXdckjF
	4YaYVtPkaznO5rgkmJ4wshAX+MWIM6NKRtH79hdfZFtObIZZ
X-Received: by 2002:a05:622a:1f0c:b0:4f3:5475:6b10 with SMTP id
 d75a77b69052e-5167937eeeamr27627991cf.8.1779191983904; Tue, 19 May 2026
 04:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260501-host-direct-messages-v6-0-3f4af727ed85@google.com> <20260501-host-direct-messages-v6-2-3f4af727ed85@google.com>
In-Reply-To: <20260501-host-direct-messages-v6-2-3f4af727ed85@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 19 May 2026 12:59:06 +0100
X-Gm-Features: AVHnY4Ig1N0dpqVbGvtdmXRoPPpkiLAJ97bxEVMStEvo9zlm0QSTSGFeCOzGZhg
Message-ID: <CA+EHjTyXHG05nGy5-7629vSmnctvMw0GDvjqYCMr_DisLaJewA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in
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
X-CRM114-CacheID: sfid-20260519_045945_837704_170DFD9D 
X-CRM114-Status: GOOD (  24.24  )
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

On Fri, 1 May 2026 at 06:34, Per Larsen via B4 Relay
<devnull+perlarsen.google.com@kernel.org> wrote:
>
> From: Per Larsen <perlarsen@google.com>
>
> FF-A 1.2 adds the DIRECT_REQ2 messaging interface which is similar to
> the existing FFA_MSG_SEND_DIRECT_{REQ,RESP} functions and can use the
> existing handler function. Add support for FFA_MSG_SEND_DIRECT_REQ2 in
> the host ffa handler.
>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 3a58e01d255f..e5718c0f1c31 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -684,11 +684,12 @@ static bool ffa_call_supported(u64 func_id)
>         case FFA_NOTIFICATION_GET:
>         case FFA_NOTIFICATION_INFO_GET:
>         /* Optional interfaces added in FF-A 1.2 */
> -       case FFA_MSG_SEND_DIRECT_REQ2:          /* Optional per 7.5.1 */
>         case FFA_MSG_SEND_DIRECT_RESP2:         /* Optional per 7.5.1 */
>         case FFA_CONSOLE_LOG:                   /* Optional per 13.1: not in Table 13.1 */
>         case FFA_PARTITION_INFO_GET_REGS:       /* Optional for virtual instances per 13.1 */
>                 return false;
> +       case FFA_MSG_SEND_DIRECT_REQ2:          /* Optional per 7.5.1 */
> +               return hyp_ffa_version >= FFA_VERSION_1_2;
>         }
>
>         return true;
> @@ -865,6 +866,7 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
>  static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
>                               struct kvm_cpu_context *ctxt)
>  {
> +       DECLARE_REG(u64, func_id, ctxt, 0);
>         DECLARE_REG(u32, endp, ctxt, 1);
>         DECLARE_REG(u32, flags, ctxt, 2);
>
> @@ -875,8 +877,12 @@ static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
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

I don't have much experience with FFA, however, Sashiko flagged this
[1], and I think it found a real issue.

handle_host_smc() in hyp-main.c clears ARM_SMCCC_CALL_HINTS from its
local func_id and rejects calls with non-zero x0[63:32] before
dispatching here, so the upper bits (u64) aren't the issue. The issue is
that the hint-bit clear in handle_host_smc() only touches the local variable.
host_ctxt->regs.regs[0] still carries whatever the host wrote.

The DECLARE_REG() you added re-reads the raw X0 from ctxt, so the
SVE_HINT bit (0x10000) reappears. With the host setting that bit,
func_id becomes 0x8401006F and the equality test against
FFA_MSG_SEND_DIRECT_REQ (0x8400006F) falls through, skipping the
flags check. Note this isn't u64-specific -- u32 would capture the
same bit.

I think it's safest to pass the canonicalised func_id from
kvm_host_ffa_handler() rather than re-deriving here, matching the
__do_ffa_mem_xfer() style.

Cheers,
/fuad

https://sashiko.dev/#/patchset/20260501-host-direct-messages-v6-0-3f4af727ed85%40google.com



>                 ffa_to_smccc_error(res, FFA_RET_INVALID_PARAMETERS);
>                 return;
>         }
> @@ -942,6 +948,10 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>         case FFA_PARTITION_INFO_GET:
>                 do_ffa_part_get(&res, host_ctxt);
>                 goto out_handled;
> +       case FFA_MSG_SEND_DIRECT_REQ2:
> +               if (!ffa_call_supported(func_id))
> +                       goto out_not_supported;
> +               fallthrough;
>         case FFA_MSG_SEND_DIRECT_REQ:
>         case FFA_FN64_MSG_SEND_DIRECT_REQ:
>                 do_ffa_direct_msg(&res, host_ctxt);
> @@ -951,6 +961,7 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>         if (ffa_call_supported(func_id))
>                 return false; /* Pass through */
>
> +out_not_supported:
>         ffa_to_smccc_error(&res, FFA_RET_NOT_SUPPORTED);
>  out_handled:
>         ffa_set_retval(host_ctxt, &res);
>
> --
> 2.54.0.545.g6539524ca2-goog
>
>
>

