Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC3DCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2jPlRyhxf5Js0wrvZhbEPMffqjEBHr4VMZy0F6mhfY=; b=NCkS6dV+gAYYfsrlTku7oYJT8D
	6XjTw+vrbcOsIo5KKviPzhKfhJgTA/TS0ebWvMxQdWyptSnF7oo4a8OOu0BrZTP+5k31XNtyvEx+O
	apmBb9U9xHP30loTN8YtebtdTzEIl4jDGZrq6GFMejT6GGSSp2KEkmXmVI9Krs1XHFKDVTyWKKdH2
	R91opNCvWPISiZPkcJ2fxB/+5ASuGq8IMoIHB94E8Yq1cermOnfUhRGgHMaJ+tRzMSRxrRnIaN2g2
	VCou9DG9VkVrmkW4ihxTGqgcqIvRRfW5s0oCVvyo7pw46rXqa0zbGjgTcP9HElU6GN9cjg3xj77q8
	xAiIAS1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnVt-0000000H3Im-2AXR;
	Wed, 17 Jun 2026 10:28:53 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnVr-0000000H3Hw-1Fn5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:28:52 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-51765531803so219831cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781692129; cv=none;
        d=google.com; s=arc-20240605;
        b=S64i/vQG8O7Rl9yNHPdQK3T5PgvXkx0dRJYyxONPTR9/0tF9Agn+uTNbibIln/HzII
         6jxKVg3rv7FcND0wuPW59Esj9gJNYUrv8uXQfVn7UmrL/uX5lE3pppMHuV9PZ3+g3qqf
         Zsia2umqqP268g6mRBLcYjZd/lPSAcgwglXGfNGitz4+Od/gALOasdldmyldM00EhMY0
         EbQr2iGBhuGd6TFpX7Lj0qoJ2O4G8Kk2G/R5GX1qXhdktGHgms3Exnoh7LX+jDBJxx9Y
         hDTH8E+/+cFKH7yz+AuJMN7u5F4bsTVO4Oy2kRh0FsT5Z35JutnphZafDx857eQqDw8U
         D9LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N2jPlRyhxf5Js0wrvZhbEPMffqjEBHr4VMZy0F6mhfY=;
        fh=f6Tct5pKIv63uJ5mlvw60eEGQMVBEjNyoaowK9cC184=;
        b=WMagP29pCugVS5SaDO6bBlV1LEoh0VdETMqCQLAmBbuI8lEajTN5i9eZQHPuweppPI
         CyNHNRxsZK5W1IdbCpnqRXwYXMTynULUGogyBolVOk4FFmeKpOlX3rxaKySl5Bl10JoG
         GN+qaVaVSJ/46GXW9xJDWrfH4ctHiaCvPxLqQYjYuDV/ZUX9O4EIrhG1ETnaFphpgCFZ
         I9M9qGVZd2u4wAqvYEPQCKpqxldCU3gfNXR3eCLbzcwm30ubjVSIIx1pnLvUTWavyQJm
         vCLBdBX2kWpFVLxn4zZU6YP7m980DpAvYHga/tKAU1s9iXVVbLa1xxhkgeNjfMR0KbPj
         zPvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781692129; x=1782296929; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N2jPlRyhxf5Js0wrvZhbEPMffqjEBHr4VMZy0F6mhfY=;
        b=QMT86sFLG30MWpdNv10A+vKhzABy93/KPIjSEstidwius5StdL3MCsfa8wuiswuK0M
         iOCSWbxAxMaAC/MKQL52RqPbO3VTfL/Z7Qk/4Ipqu+f1G5t6eUMltnj9H0ExeB5i24v/
         tgAaJQmX2IKUsjvqqGaeWX/hj/jdMGH9IBC/rcaHyigI08ZPkBiAWdMj9YH6SFJvVQ0B
         Dv1e01jUyu6e9iTLM9kWD+gwjhvLWSL8qy3V5lZ5RGmojF5UIXYnstqdpOYYa7D95nkX
         JemGJqE570TYV8ocdGYzpxjpI06sPvED80Dlv9JTLprRSI328jfWOa9PfFt+/nVOqVP3
         Hjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692129; x=1782296929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2jPlRyhxf5Js0wrvZhbEPMffqjEBHr4VMZy0F6mhfY=;
        b=U0gH9niXPKkuj5Q9CIRY7qbZ6Ac3Up8xgQ75PEihY/sWZ9H7B7K/cpR4nTsbUIH8tL
         GvnAthT451IhIBj6N5w8xkVBGdqRG23ydDxiIqqR5dwZuqsft8zwbJw26dGXizA4QiIL
         49g+yaUDl9ZmIBeOfvtldvNqmu2Y1jCMiqvTD5eXXSlFqJNEcq0a5xgmsy5PL2iYLQW/
         1ET9r+m2h43HCAXJm4279ekZQgPTOY1E8CV5cVDjOmux69vR8SCKnO/Cbg192qz2I5RL
         YAtq+hkw+M7yQ8xtdDAL/lB5Em2rVAmFhdMtXbd1XPNMXwI6CGXnNQJ8uxOoloMgE/P8
         F9yQ==
X-Forwarded-Encrypted: i=1; AFNElJ/j7QoaqzcrhyPatQiffmKVe7RoqdQYYxlMHoI7p4XTkWS4tkoBrjRxgeHBy8PTo85my7rwVWKf36yEGxXgq62q@lists.infradead.org
X-Gm-Message-State: AOJu0YwJxoSzaSYJpihA3k6czyaCmwungepd9AGWh/cAWaWsgH4YXLu1
	NiT0eSRFrbdxW3pFD8KjgX++scYpKEB81d8aKa9EMLXjwWKsNJKnSYPLUlqNj+teJPK6UBShGL+
	eSubAL5xGEV5Lz7pYF7rqaeF6wr4y3fxfOehcSK+Z
X-Gm-Gg: Acq92OHmfBWMtUURRCMYjHXggzXJTc24663cm5az71nYhJVYvkPqic2qFP0tD1kXWZw
	+cGhD9A9IMwE2ZVnwfqQcPXkxwClvxLGxaf9szA484kT7i4hwG2+fy6G2p3FatbwqmdOUKxhwA/
	SPJJw/vP08jebIpiCEqRQwAGYeLIlpWfI56Jq7rJWCEB9WU3Cu2H7fSSHZywOAXbMexLDtwSSxm
	ceTZ1DKz+T528BeWcyeSfTFhJAimeHDuBMBa6BaanIvE/mkKmM8HgQ2nl0L+RCkSoVzkzXVBzgF
	M0sV+nyzwmMdGdxfM1lnIGTW9PzRAuoxy4s1Zw==
X-Received: by 2002:a05:622a:5884:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-519aa962ed6mr8749471cf.10.1781692128086; Wed, 17 Jun 2026
 03:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260617095238.1530121-1-vdonnefort@google.com>
In-Reply-To: <20260617095238.1530121-1-vdonnefort@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 17 Jun 2026 11:28:11 +0100
X-Gm-Features: AVVi8CcmYvjIYllhBFKEFTxWmmEyw5Kb3hq8FaZ92P7SG3S3_sWI4gBOOlTgKqk
Message-ID: <CA+EHjTz2Hc-mCA4Q0ayw0KV6KJ9_-qN5oPahVqMeKKUs93xtZQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Add missing hyp_enter when trapping sysreg
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_032851_349789_66F520CB 
X-CRM114-Status: GOOD (  15.37  )
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

On Wed, 17 Jun 2026 at 10:55, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> Add a missing hypervisor event call for hyp_enter on sysreg trapping,
> causing an unbalanced hyp_enter/hyp_exit.
>
> The enum hyp_enter_exit_reason is not ABI, so we can keep the ERET
> reasons at the end for clarity.
>
> Fixes: 696dfec22b8e ("KVM: arm64: Add hyp_enter/hyp_exit events to nVHE/pKVM hyp")
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

One thing that caught my eye (as Sashiko would say: pre-existing, not
introduced here), __hyp_enter_exit_reason_str() relies on positional
correspondence between strs[] and enum hyp_enter_exit_reason, with no
compile-time check. Inserting a new value in the middle of the enum
(as you do here) silently shifts all the strings after it if the table
isn't updated in lockstep.

A BUILD_BUG_ON(ARRAY_SIZE(strs)...) would at least catch size
mismatches; catching ordering bugs is harder without per-entry
initialisers like [HYP_REASON_SYS] = "sys".

Something for a future patch, for now:

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


>
> diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
> index 743c49bd878f..5f6e6789d121 100644
> --- a/arch/arm64/include/asm/kvm_hypevents.h
> +++ b/arch/arm64/include/asm/kvm_hypevents.h
> @@ -12,6 +12,7 @@
>  enum hyp_enter_exit_reason {
>         HYP_REASON_SMC,
>         HYP_REASON_HVC,
> +       HYP_REASON_SYS,
>         HYP_REASON_PSCI,
>         HYP_REASON_HOST_ABORT,
>         HYP_REASON_GUEST_EXIT,
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 06db299c37a8..45a4abb9619d 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -913,6 +913,7 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
>                 handle_host_mem_abort(host_ctxt);
>                 break;
>         case ESR_ELx_EC_SYS64:
> +               trace_hyp_enter(host_ctxt, HYP_REASON_SYS);
>                 if (handle_host_mte(esr))
>                         break;
>                 fallthrough;
> diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> index c4b3ee552131..c84434e2349a 100644
> --- a/arch/arm64/kvm/hyp_trace.c
> +++ b/arch/arm64/kvm/hyp_trace.c
> @@ -398,6 +398,7 @@ static const char *__hyp_enter_exit_reason_str(u8 reason)
>         static const char strs[][12] = {
>                 "smc",
>                 "hvc",
> +               "sys",
>                 "psci",
>                 "host_abort",
>                 "guest_exit",
>
> base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
> --
> 2.54.0.1136.gdb2ca164c4-goog
>

