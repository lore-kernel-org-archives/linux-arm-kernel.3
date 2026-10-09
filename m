Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB7BCA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 12:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OY3eyr88UOoi31ujLDL22lAHYnxm/3v8qtMFCYMwKco=; b=wNV2y6WJmqRfOL+Tgi0qVnLKBC
	orN6ZE9vdE9PLRzirGTc+5rVASdwslxgBdzrCxwjXrEQa9m+MF9uUNy2i5cR3spNnO+jSmlB5pon+
	heqmDK6WqOTkogEg0TVXeJRX8v1Q+Xft5KTRahanXE6AfvieWVwdPZjMBeYjZFMHADoNNGyWm1ivT
	ZjkZKjksPnFQ/k5R2QxqT0gnZq0PsTby/wTflHR071J0XDHSn5wcUmgJKqlENwvWMeHWd2snLGJdl
	4eMsGAjcwuml504B+snLrRX7JpGHjrJ6mswcuGODPlVxtVUOOrhCOLsHryPikDTajYsOr2w9hKobO
	QFKOJ/dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9NE-00000006G77-1VPD;
	Fri, 09 Oct 2026 12:06:52 +0000
Received: from out-113.mta0.migadu.com ([2001:41d0:1004:224b::71] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9NB-00000006G6g-1Lw5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 12:06:50 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8QpueOoSu8dlWDzU2ovo4g2tq4XyDape3DzAzPS1hLg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791547606; v=1; x=1792152406;
 b=bF+gKuYhjRAaiS9C3HRXID5GS7wCf0nzAjeZz4gr+aWRNLN3tFAw+Tl62wAZQxrjKlQGi4J9
 iLmbxZ65qmehqh1Eyy1oSy0RMzamOSczqEHOY7oNA5cjDGCwhOpQEiWsiLamvF1p3PYtNhor5mZ
 XX+Kz4LXuG/zB7vFMbtEgXM4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 115ea1d26da0b5d5;
	Fri, 09 Oct 2026 12:06:46 +0000
X-Mizu-Trace-ID: 115ea1d26da0b5d5
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ba40832934so5841e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 05:06:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzPvVOQGfq4a+cS5YBpniz5JiZ3iGc2JnIqd07tL8707vb04yDjXlrowaz9dh5lG8XzzBKOgkjOR9eXtXW5bbxf@lists.infradead.org
X-Gm-Message-State: AFq9FYKb+FIYdfHXP4I4V8RrcW8le1fkGPXk9ACBVL5N6vnxDamTprhT
	q1iSvUTaQJcQ4RzIdwwIA9hnjnwvPZ4rEbbxDVOSmJVLLwaiHsTjz96BG/FaXDXNBybX4MMAJoG
	qqyVBSbJgg0AarxiWkd0ceaCN4yzhAjeWTT4h4Ynj
X-Received: by 2002:a05:6512:3dab:b0:5bc:b23c:f7e5 with SMTP id
 2adb3069b0e04-5bcdf91d57emr82402e87.9.1791547601556; Fri, 09 Oct 2026
 05:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20261009084529.462577-1-vdonnefort@google.com> <20261009084529.462577-3-vdonnefort@google.com>
In-Reply-To: <20261009084529.462577-3-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 9 Oct 2026 13:06:05 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxzBBDpg3B9Lw47tMWMK+VCjpeEQDgYNKvLUnmUYVJVcA@mail.gmail.com>
X-Gm-Features: AclHuK-OrizQjQ93TY0UAA_o6daR8H0aSQt1YkpepTx45oni65FNHe6Eup6oIrU
Message-ID: <CA+EHjTxzBBDpg3B9Lw47tMWMK+VCjpeEQDgYNKvLUnmUYVJVcA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] KVM: arm64: Add guest_hvc hyp event
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_050649_501010_698A4D97 
X-CRM114-Status: GOOD (  11.24  )
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

Hi Vincent,

On Fri, 09 Oct 2026 09:45:28 +0100, Vincent Donnefort
<vdonnefort@google.com> wrote:

> Add a guest_hvc hypervisor trace event to log protected VM HVC call IDs,
> return values, and whether the call was handled by the hypervisor.

nit: only the first return value is logged.

[...]
> diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h

[...]
> +HYP_EVENT(guest_hvc,
> +        HE_PROTO(u32 id, u64 val, u8 handled),
> +        HE_STRUCT(
> +                he_field(u8, handled)
> +                he_field(u32, id)
> +                he_field(u64, val)
> +        ),

remote_event_format_show() doesn't align the field offsets, so the
format file puts id at 3 and val at 7 instead of 4 and 8. hyp_enter's
vcpu is already off the same way, so should this be a separate fix in
trace_remote.c, with ALIGN(offset, field->align)?

[...]
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c

[...]
> @@ -1183,5 +1185,8 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
>
>          if (handled)
>                  smccc_set_retval(vcpu, val[0], val[1], val[2], val[3]);
> +
> +        trace_guest_hvc(fn, val[0], handled);
> +
>          return handled;

When handled is false, val[0] is the SMCCC_RET_INVALID_PARAMETER
initialiser, which the guest never gets. For example, a MEM_SHARE
forwarded to the host logs "id=0xc6000003 val=0xfffffffffffffffd
handled=0". Could this log 0 in that case?

Cheers,
/fuad

