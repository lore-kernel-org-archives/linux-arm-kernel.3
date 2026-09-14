Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EA2C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 19:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7W1JQUgpVP8WG7yrSZEne6y0PuCA3L0Z3SfDNS5qy0=; b=kiNrIggbJEMiBDzcHxEkk/k3XM
	SKeT8TQdz0v+i6v17NZLRFPOpbobo1YKZ4EOKhsv1GE4aQ3rMHJuoViJNHH3Zy/jW6NbskmGtagnW
	YO6oNDDp5P5SL8ZyP+7SgffAVi/Gu9sWlg2CgOdUv9IjRLjsGr0wcxprYwXvWfwQiryCn/wsiYhoW
	B2tOkQyn4TN26osT5XL08LDXjgF63G+TdPBxKQqQT8QkOOg4gY+LXaYD7AlLgU46avUMpWXeBWqbu
	FBayJJV3lclV17sjIODjFMM2UuFPsNv4x5IiluPuaHB1qBbybsc1WNka/KO8JgbOUWb/LAEyDcjlq
	45PsHCQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6CGV-00000004WRF-0AwC;
	Mon, 14 Sep 2026 19:22:55 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6CGO-00000004WOs-0jY0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 19:22:50 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=eDFirMPJbX9WM/Op3OEh05AcBJvqZLOwI3SXpiBzFp8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789413766; v=1; x=1790018566;
 b=BSwOj9JpLCh2gywBGirXJUkrYj8dOcqK3ta70fBQDe+av3mSgEsmJmtfby5702WOHEDLWnyP
 TLPjxKbQ3oWE1b66dW2uWflUpKKXRaQ052NPnhSgeOcF5HiWlUPCOeIXcov1uflKvm0F0simBe0
 tz2jJzlNYnRv0iiJ48aGbB6A=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 19d4edc4ce0b1074;
	Mon, 14 Sep 2026 19:22:46 +0000
X-Mizu-Trace-ID: 19d4edc4ce0b1074
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so11302e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 12:22:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByIKQQWXbDzXK1wzerGW1wwjCcniBSQhdNAj5BAhGo2f5d7SlBHaOkxZ68f3KPJXTO66AOb8QjBUxsBl3G8+0l7@lists.infradead.org
X-Gm-Message-State: AFuF++nwzvezAjYDRQhNr4TziJns2kRbB7LrAkUmtkOxhmuxDAKRmRTA
	xVHrhg4eFQ2TjhcBtOq4lL6v2AsExX8bjXXQi7W0SZCMZWfLldslG8lTT1FKp+0vw++4UhSXZzg
	L0k73a59zWmcrPcO4I2bGpUkFg6CGRotX1MCvGQjG
X-Received: by 2002:ac2:5b83:0:b0:5b1:571f:715f with SMTP id
 2adb3069b0e04-5b8b2d5efccmr26320e87.3.1789413761083; Mon, 14 Sep 2026
 12:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260830-host-direct-messages-v7-0-45f6e6db72c2@google.com>
In-Reply-To: <20260830-host-direct-messages-v7-0-45f6e6db72c2@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 14 Sep 2026 20:22:04 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw-iodDGuw85xkHuP-bd9PF11CKksrefDx2bYJye0Johg@mail.gmail.com>
X-Gm-Features: AcwNN1XDCubtx9v-awCWFHNEeN2PLorMsfdS1rYt3jcM-E22UzhLX6sxMNkQT5I
Message-ID: <CA+EHjTw-iodDGuw85xkHuP-bd9PF11CKksrefDx2bYJye0Johg@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] KVM: arm64: Support FF-A direct messaging interfaces
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
X-CRM114-CacheID: sfid-20260914_122248_366357_422F2F8B 
X-CRM114-Status: GOOD (  22.68  )
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
>
> Block host-initiated FF-A direct responses.
> Support FFA_MSG_SEND_DIRECT_REQ unconditionally.
> Support FFA_MSG_SEND_DIRECT_REQ2 if hypervisor negotiated version 1.2+.
>
> Framework messages (FF-A control plane) are filtered out. For
> FFA_MSG_SEND_DIRECT_REQ, we look at flags in w2. Messages using the REQ2
> interface are always partition messages.
>
> The third patch was part of a previous patch set [0] but was dropped
> since the use case was unclear. A clear use case has now appeared: use
> TPM device with CRB over FF-A when kernel boots with pkvm [1].

tpm_crb_ffa already uses sync_send_receive2() for partitions that
support REQ2, and on a pKVM host that returns -EOPNOTSUPP today: the
FF-A driver sets msg_direct_req2_supp when either FFA_FEATURES(REQ2)
or FFA_FEATURES(RESP2) succeeds, and before patch 3 the hypervisor
answers NOT_SUPPORTED to both. Patch 3 lets the REQ2 query through to
firmware, which is enough for the OR. Worth citing that in the cover
instead of [1]?

> Tested by booting Android under QEMU.

Which firmware was that, and what did it negotiate for FFA_VERSION?
The proxy doesn't initialise unless firmware answers that call, so I'd
like to know whether a REQ2 in particular round-tripped.

>
> Best Regards,
> Per
>
> [0]: https://lore.kernel.org/all/20250730-virtio-msg-ffa-v9-0-7f1b55c8d149@google.com/
> [1]: https://lore.kernel.org/all/20251027191729.1704744-1-yeoreum.yun@arm.com/
>
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
> Changes in v7:
> - New patch 1/3: block FFA_FN64_MSG_SEND_DIRECT_RESP. Only the 32-bit
>   variant was denied, so the host could send unvalidated 64-bit direct
>   responses to EL3, including a forged sender endpoint ID
> - Use hyp_smccc_1_2_smc() so the call is bracketed by hyp_exit/hyp_enter;
>   the pass-through path already traced these calls
> - Declare endp/flags as u64 and reject a non-zero x1[63:32]: these are
>   w1/w2, but the raw 64-bit registers are forwarded to EL3
> - Pass the canonicalised func_id to do_ffa_direct_msg() rather than
>   re-reading x0, which still carries ARM_SMCCC_CALL_HINTS
> - Link to v6: https://lore.kernel.org/r/20260501-host-direct-messages-v6-0-3f4af727ed85@google.com
>
> Changes in v6:
> - 1/2: validate that bits 31:16 of w1 is HOST_FFA_ID.
> - Link to v5: https://lore.kernel.org/r/20260121-host-direct-messages-v5-0-2c1614c94e80@google.com
>
> Changes in v5:
> - 1/2: do_ffa_direct_msg: validate that sender is HOST_FFA_ID.
> - Link to v4: https://lore.kernel.org/r/20260109-host-direct-messages-v4-0-95da4221d186@google.com
>
> Changes in v4:
> - 1/2: do_ffa_direct_msg: check that flag in w2 is zero; drop unused vm_handle parameter.
> - 2/2: ffa_call_supported: simplify logic by reordering cases.
> -      do_ffa_direct_msg: switch polarity of check and update comment.
> - Link to v3: https://lore.kernel.org/r/20251119-host-direct-messages-v3-0-c74d04944b26@google.com
>
> Changes in v3:
> - Filter out framework messages as suggested by Will Deacon. Update cover letter accordingly.
> - Update trailers: Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> - Link to v2: https://lore.kernel.org/r/20251030-host-direct-messages-v2-0-9f27cef36730@google.com
>
> Changes in v2:
> - 1/2: Drop support for FFA_ID_GET interface in host handler.
> - Link to v1: https://lore.kernel.org/r/20251030-host-direct-messages-v1-0-463e57871c8f@google.com
>
> ---
> Per Larsen (2):
>       KVM: arm64: Block host-initiated FF-A direct responses
>       KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in host handler
>
> Sebastian Ene (1):
>       KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in host handler
>
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 44 +++++++++++++++++++++++++++++++++++++++++--
>  include/linux/arm_ffa.h       |  2 ++
>  2 files changed, 44 insertions(+), 2 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20251029-host-direct-messages-5201d7f55abd
>
> Best regards,
> --
> Per Larsen <perlarsen@google.com>
>
>

