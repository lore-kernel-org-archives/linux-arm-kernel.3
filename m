Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2BCD73E84
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFkUGWSSI69uP0vyiVno+p+O/XXB1AsOCXVbUdPg2U0=; b=0+f8e9k8brpme768IjMdkQDPiO
	ziVFswv/INpRDAu/khmSMsx5bfI6cjVtRyV0BWl5RtpXybT0RRC/KHn9rxRuTHOC98t8sXTdjxrtQ
	B5j0+xmb0lsdaDkZFJPD6r9iHmPcvlVuaA1o0wMb+5GBkzzDYLQCIS545jxQ5fLOnKOk7dCyF2thv
	FqDvWa276QepFXTRid8IA8Gqz4V0o5xWe3K8mYo8iBz+LdwqyRsjn/3SfhDyI3pkww5qVeSHwx0+B
	PZXAlq+29Jt6+6LYl58ixzZdMXBfAw74D62wqkD/HbD0+dPh/zbpVpQT08LL4sT/eSEiT3bGKdQSa
	1r9Kb9qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWBj-00000000TPt-1DwO;
	Thu, 29 Jan 2026 17:52:15 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWBg-00000000TP0-3zMK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:52:14 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5033b0b6eabso8081cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 09:52:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769709131; cv=none;
        d=google.com; s=arc-20240605;
        b=ZmkIPs4S63dmGsSnO5CzMGFBb8OcSZVLpfDm/0vIh2waxljtSq4lWOsKP2qqSE03AO
         hc1VTkP0lHkvGydGYIPbx1Oe0tUhO1ig6fp+SMySgqK6aZa0OMYlK4KBhxAhgq6bhn6u
         JpYQ6PbW999o3MzsqNAFHjs5oG7qKDeycVOcDOg1nqStb4YsS7wLdzPmnQB4MGbqhhiL
         2qNbquwo0QeDVxaezlHhs19oLJwTGtKU+5d7tr8pB5ttmhAMlF4lHUB7YgVNCy0RF374
         +R3P6TsER3NmN4atMXqsVLiOT6wCFYZcePuv+I5iIJgUFjLsXH7cpe2qrveYpYtCT7+L
         Cz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rFkUGWSSI69uP0vyiVno+p+O/XXB1AsOCXVbUdPg2U0=;
        fh=KWGfOQUG0Vj+loal4ZfWNb7mWrM0p6yTD4oX9zWbKGg=;
        b=Mh+YwZvgQFRHw9PseShCUdz1gvd/SUtsv6e8PH540RfXHccBpAsdcFKWkOfC8Bs9DD
         uujZPyujGfmY/qGI21CXyoiD7wci9zeOPoaCTq90uxDY3Xx517hf4V03MOf7oPB9b72+
         Nam5dfsSEf4Bab/qlY6zXCb0SVRsNE42cNXmTjJKE8+HqRn9Odpu+r2HLdOqLkzXQ65O
         VO4ibOI3w7vqGyh/lZH/6PRt3ZUpxJMa+blFhSYZ3k4V3EYklq8TYCNT2xV46+SEhRcF
         sJfDPUJcMPt9j8tUOuSdr33SKzANz8kTIwMjWbRvSY5QQ+JKJ5ptCNPQW5MzTsSTtByY
         /URw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769709131; x=1770313931; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rFkUGWSSI69uP0vyiVno+p+O/XXB1AsOCXVbUdPg2U0=;
        b=d6JJCqwupoaL3MD9CFCnQRUbKFnmhqi7E4+8QTLpO9z4Jm0URxOxoMhUgL5XrIa8IO
         jUytsidgMoCM90JGj5BvotM8YIEEtzbMe/W/+JqJQg+AtrgzLefRM3ISHBk8/AL/tTs3
         zRJ/LmLDjWlI6S2PRgxJYCw3pb3/sGoQIoo55W52HFfANAD9FVWlIr4Srr+VaErzDJci
         Wj/l3bd5GvwlqS2/3D45UKGW7NqlO+YQGSJEFGCfaRNSTAyNz8jx9Z4+c7ljWqRWXN48
         /6unw3JHCjFuPBsbvIPVZ6IvwnRwBHXMvqKp5DyJLU1NEmO/mcKvSic7zxtzKR3Oa1oH
         HBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769709131; x=1770313931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFkUGWSSI69uP0vyiVno+p+O/XXB1AsOCXVbUdPg2U0=;
        b=dQ4hKuArRChExhpmIXbenfHB67nOgCzfD6am2Pc/OZ9OuGMqFGOc6w2CQsgiGL3lxN
         a8d+sp0eg4QfzZve8VF30orfF7vQ4daWAdZ5dhJk7byC/jEWdFDbNhNeDD4QaJN3EnQI
         F+wHureWme38IZ+eCo8VlB+yR65/zp+vaAfNyAf5ftsEoJ3giYL0LTCB9kbYNv5xU79N
         3gpgxpSBZiW5XojB0JQfMqP7Iwzv93VwVjBFgICHZNIFRILEmtnoKX7x2sVgOEYoCIs7
         cOPHxYcuTw7hYsWeNMYyPSJwrhjAr1qLc3V+jAAFKYBKEXLtFLNEF/IeDj3R4kj2O5vr
         f41Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIcqPupVpUzNeeNTlLGPEMQdqoIAcCFXihGasEqS8RpfE/OLHW48A4Hl/3AAsGTnDLrmxIkWXANJs2gQbzMlTl@lists.infradead.org
X-Gm-Message-State: AOJu0YxKRbgCu2QhY/7uZwo+mp/PV8/D6kMqgRduXBwtr5CVfVtl3k2z
	1TgNeV6N6V7Y5YhDhW/t8GN/apXCX6RCgZzgmEjPE/+54pOFGjEB+0i98mCh1yZoKLlhrbI8br9
	krK0gR44eYqcs5y9unYMu/yXlZRvt2mRh3EUZMReL
X-Gm-Gg: AZuq6aKFmYWuUyO9lmJ4jFH0jTwZdXpWfx1tavuFu/WaSOLF/EwI3Wl3PUHvVDgimDg
	9LZQjL2B/tjBjWfPc2E899RGhElU8aKCUaNQMDjIB4G86Gd7heelu+m8WlJGn785OiKBEVcqUs8
	x9GCwtP4LI8Hv152iPjECjd4S+wFN4HnWrcwFBR8xAaNRG85OQ3w86E/nAsdoYR8MIOYtvNi/Nj
	Ik82tvws6k1saPig561P2o0dicmLoIiaAmV7u1hbOjjWTwzObO0JYl2fGJxqlbjwyiHQsIU
X-Received: by 2002:ac8:7fcd:0:b0:4ed:8103:8c37 with SMTP id
 d75a77b69052e-503b6705a55mr15283421cf.12.1769709129198; Thu, 29 Jan 2026
 09:52:09 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-19-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-19-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 29 Jan 2026 17:51:32 +0000
X-Gm-Features: AZwV_QhPQvIsUhtu0m4Xb8tRLlQCeNpAfaZsDAJefW0mGcGoCi3YrpM0LthDHFU
Message-ID: <CA+EHjTxJbWkCcNimSGYHSgjYSp4xGuEk1cwf4Dc5giQAM74Bhg@mail.gmail.com>
Subject: Re: [PATCH 18/20] KVM: arm64: Remove all traces of HCR_EL2.MIOCNCE
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_095212_995506_9323A736 
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

On Mon, 26 Jan 2026 at 12:17, Marc Zyngier <maz@kernel.org> wrote:
>
> MIOCNCE had the potential to eat your data, and also was never
> implemented by anyone. It's been retrospectively removed from
> the architecture, and we're happy to follow that lead.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

The field HCR_EL2.MIOCNCE is deprecated and made RES0.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad






> ---
>  arch/arm64/kvm/config.c | 1 -
>  arch/arm64/tools/sysreg | 3 +--
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index f892098b70c0b..eebafb90bcf62 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -944,7 +944,6 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
>                    HCR_EL2_FMO          |
>                    HCR_EL2_ID           |
>                    HCR_EL2_IMO          |
> -                  HCR_EL2_MIOCNCE      |
>                    HCR_EL2_PTW          |
>                    HCR_EL2_SWIO         |
>                    HCR_EL2_TACR         |
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 650d7d477087e..724e6ad966c20 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -3834,8 +3834,7 @@ Field     43      NV1
>  Field  42      NV
>  Field  41      API
>  Field  40      APK
> -Res0   39
> -Field  38      MIOCNCE
> +Res0   39:38
>  Field  37      TEA
>  Field  36      TERR
>  Field  35      TLOR
> --
> 2.47.3
>

