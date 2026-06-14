Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DDACD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 13:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Ofr44S+ZyNvvuzy/mGDum3FtpyF4ahy6qr2J/oI/HI=; b=KSLiwXj4ZjVHdMi2zw3HzxgRiI
	S1olvNYM/R9C3yb7Ulm5tbWaV7Te9IDjHEwZDIHVVWybf+/hcgsJqB7CNALBu9HWck7VOx4pJ1L/c
	wl9Ggm5kZkrSGZsE7/3e8eNp1RxCPyObl9FGDfrh/XSwFvPIMijESge0cIeolxDIljeR8il87p0Lj
	VLigrBm4G7Xuis/eQjWkqTPyZnFxiZcMDRJgxJfYcxP49so6CuM2jM2t5iYYeZBlm4H9ZOYCnvYGh
	yiGXNEogdtqwyKW/03D8wcmkJybZ8mIUDtfWirOUYFNzSzdyQX3jwdTXnse06RizqwwxMAmjNb4yI
	mUcdcVpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYl4S-0000000D33n-3OgA;
	Sun, 14 Jun 2026 13:40:16 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYl4R-0000000D33S-00Ie
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 13:40:16 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5177d1ff061so518051cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 06:40:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781444413; cv=none;
        d=google.com; s=arc-20240605;
        b=bvqAYdjWMk7WABj0iDYVrrbnm8Zirs4U+NUWEIT+wL4GtHGUmO6FEMXldRHl9DmGRD
         vvJtYw2HGFCjsBQNzhCqQauzUDnumIwaZ9S8qmdQTkKxk/GzCHAoYNGJk8y6BOOfqYTw
         SpPFI13k9HbixmIleQS30ZrpJsR1oXfr3jr27sqV62DZdXvpw7xo/bn467eTo60s0rKg
         D3MyyyuyjEAZ0Y9TALRy+7G6FRc0cMcJqZP5F6kW9bxLPlcJtyv9wbXoTl3kCUaXuAtP
         kUjcDuy4mVqY5owsnAaHCqK168IUP4lI9dL7yD5AtE6Nsqyc2Ssbl+bU26PISAXebG8S
         9nzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5Ofr44S+ZyNvvuzy/mGDum3FtpyF4ahy6qr2J/oI/HI=;
        fh=/USbCE9Btx+5T1FeHPeRUX5OFN3GWPnt4wcQOFDvnRA=;
        b=h3IzzQXekq/4UIeqOq5BQJDVysE/oU/BTUH+UkOy92ko0ryk6GJdKj7KqtcxXR8xfT
         NOvNrpwYx+PFxQodJfy/i8/jvyE99JTKcNCGPDIy/b/H7pgvOwULzhXyeILwhjUgYJDQ
         uSVEa2M1XUn60tHJSRiVNxR3NB7gTirSdrUdkIf6vD/O2D80uS3XeEmBI+UVrFcVFw8r
         2/HocHO0wvRXfk2LDlU2LZP6DgpZJi0XMlbRNkpGG8TaWYV/QD5yaBTONHU7CjjSm0u4
         hCZa7Qn2vBPbpms3RX1lGENEqvEASMZLdXo7a+jdneEBZTdAmOmoDIXVguWLEdjbuiIu
         b5+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781444413; x=1782049213; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ofr44S+ZyNvvuzy/mGDum3FtpyF4ahy6qr2J/oI/HI=;
        b=QOEHOYXvpA+OeuUAjKwN6f06uPn6kburytMXLP3OuMGopSvZHGO2WQ/cYColSUFJv2
         1Khrow4Z/iJz6wUVArCNY/mVwpPo0P39VG6E+tnnh20i8w8dtaQQg1euxz1zc8jjhsws
         Se98hET89kq6b5sZK0OWuBfOo5UTk/cs7RXi2v3gAPJaaT9fe8cmKuj0z11Jqay56uZh
         uBaOOFDwmq3+lVllzVmy7Cpjw/MdUBRRFzJsJ++n2WMvf56Hf/aEC78wk2mMT2MrnlTY
         vkJGKrosJNn68i/QXBCgH7EPmGd1NacLql9mN9/5SaGlri28dlYu+q8UTqDTGuQJw9fA
         VDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781444413; x=1782049213;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ofr44S+ZyNvvuzy/mGDum3FtpyF4ahy6qr2J/oI/HI=;
        b=D7Y9TxZwVcJ8cQKtpiQnSAEvKaz33dl9I4Dys6zPXIv51aW3qPcTYHfHo4pajGwOUT
         HOUEHo+9nOqCqxhQBSwNHF5yOhXFyT7UuWIg8qZ6wY0w8GMUykuwtKR2kAyPgtePW+CZ
         CMwSNAJErhQ06XHfSQKMPE+FL6j00Q7bnjHb2KZy+Hvc5iy1HkXbMJBavfD0epjRxn1N
         maUB4qfgRUDd9oifS6a5EzdjVZe2KFLY/mACDD9rvK6rxV3nQ9yN9WNswo2izXJ+OHcv
         TqQUp/Zuwl6ld+SZM+pQpvUNdJvGFzh7CBIwycOTQu3fcM8+ROezEp0ODd/2wbhr7dy/
         p4kw==
X-Forwarded-Encrypted: i=1; AFNElJ9gR0GrF6CtIZTB0Zm5E+bphEpKzj0G3NAF8MyVTPqrGX3a3yYZtwyw3z1nlIh+zNswCbHccfaWRh6rKZ2GTNep@lists.infradead.org
X-Gm-Message-State: AOJu0YzmOlXXDBZfnJHDesnp3Vgn840UJfSGU4GN/zn0iRHdZRmNYLZ0
	weaHe7bTQ+RXiT5GsCRFC5S0bo9qCrqKc9MSkoEUqx7a2rsTNZ58LQIthsknJbP9RQjoxn2Mq1g
	uvpgti6rx/nNc0iCWVuP091wiEG4EY8E8yLOEtoIm
X-Gm-Gg: Acq92OF9HNiCCPYDvXi2ImJE2oH4uGFCLNSoGzu10oLjvy/t6fYLfdDb8lXkXet7jNu
	l5ZdzLsvqSoh0exhybH7aAiBVJAZmocLNvC9LaPVS8LgzEmhsuFvPQhqwruVDF5iPUrqOVoTuA0
	6ToT4gmWoAXtgVdH5ynBEB6gaVYNAOceG64XNnJ5hmO6xFXQd5DKUqET9B52A+hT3+QUliaQlgW
	lXEqKeN2pACOmVwtQeO7pu+yJeSlxbz2JcdXWHaQEJjfboFiG3lu2wqrejA9TSuwbD2iwtbt861
	/9AXMPu+
X-Received: by 2002:a05:622a:aa85:20b0:519:56a8:2693 with SMTP id
 d75a77b69052e-51956a836d2mr5146941cf.24.1781444407310; Sun, 14 Jun 2026
 06:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260612142245.1015744-1-vdonnefort@google.com> <20260612142245.1015744-2-vdonnefort@google.com>
In-Reply-To: <20260612142245.1015744-2-vdonnefort@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 14 Jun 2026 14:39:30 +0100
X-Gm-Features: AVVi8CflkMLWEmJ-bRb05G8DCa-vXiyFOZ98Tj68-B2uYheEBh2bKJRUC_TcnVk
Message-ID: <CA+EHjTwSU67aNdgWvgR3ZGSB07Hu7wt4rUBkVGhrhoHKa_S1vw@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, rostedt@goodmis.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_064015_076011_92CC8615 
X-CRM114-Status: GOOD (  14.65  )
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

On Fri, 12 Jun 2026 at 15:22, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> The hypervisor tracing for pKVM relies on the __pkvm_host_share_hyp and
> __pkvm_host_unshare_hyp HVCs. In order to start tracing as early as
> possible, allow those two HVCs before the host is deprivileged.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

To my good friend Sashiko:
https://lore.kernel.org/all/20260529121755.2923500-1-tabba@google.com/

The hyp_trace_load() issue seems legit though.

As for this patch itself:

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 043495f7fc78..fb049c40d04f 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -89,12 +89,12 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
>         __KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
>         __KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
> +       __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
>
>         MARKER(__KVM_HOST_SMCCC_FUNC_PKVM_ONLY),
>
>         /* Hypercalls that are available only when pKVM has finalised. */
> -       __KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
> -       __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_donate_guest,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
>         __KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 06db299c37a8..f0c52667cf52 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -721,9 +721,9 @@ static const hcall_t host_hcall[] = {
>         HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
>         HANDLE_FUNC(__vgic_v5_save_apr),
>         HANDLE_FUNC(__vgic_v5_restore_vmcr_apr),
> -
>         HANDLE_FUNC(__pkvm_host_share_hyp),
>         HANDLE_FUNC(__pkvm_host_unshare_hyp),
> +
>         HANDLE_FUNC(__pkvm_host_donate_guest),
>         HANDLE_FUNC(__pkvm_host_share_guest),
>         HANDLE_FUNC(__pkvm_host_unshare_guest),
> --
> 2.54.0.1136.gdb2ca164c4-goog
>

