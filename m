Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBB8D41C35
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 13:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATH4Gg6w1rZmrC11/iAIWnrEEpvY40NWpwaW65dF7vY=; b=itTYqidwWljdiwv2CKc2F7OAWs
	RzQy/KCD9KPrO7xiQufiYViU8MykI33Kb4tZxBf0KKL7yBjklKJvv1RPLgrFSNlomkltSHtY2fs9f
	k5YWNYSSm2hFeyah891po+8zBlB4GZV7y/onTyxHwlc4jiB/DCgvfaaMmr5ZlMeN9Fl6+EzGENxU8
	d9vg+w+D3svZNxhrP6PCLWF8Xd8uJaoDoPnxI/efWumBh85H1nDirSGQeHLcY35JzUXrE4bxJ7ehe
	WTlIGschR31G0B0e63mTrHXeG96yITVvzO4yjQjyIos20kCAaoSSXaH2H6HLwykhV++iaogGhYgb6
	iloGbT9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgsK-0000000GenT-2hqN;
	Thu, 11 Dec 2025 13:38:32 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgsH-0000000Gem8-1jjN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 13:38:30 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4ee147baf7bso408401cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 05:38:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765460307; cv=none;
        d=google.com; s=arc-20240605;
        b=NgR0Ry5+xZuG9MLXQwOwOIKHOzE/jQyYZDrOvUzmsMXnjGpBzqYcmx3Ad1v+Z2YNXk
         QjqXCdhBlkKPnB6oPmCOac4C/9qSWkNV39ORoSRgD8q0DBFyarj3fvyUkfPaCBd/D5+K
         mVToj8ph5hawfAIlPMEuHvLM4xmTvt2WuhI7Gwt9/pOlr7cmVk72Y88aR+L/8dLy1Z5V
         hzFqXzF8s4xUKkdewGhmZCViU60fQNdyO3A2crI6zBLv0eY4W+TCc6Geg2MDT7InHmgU
         U2gFgQDV89x+lpv38olHxK+JmGOBrK6gya+zKFiXM8auyrlrDqNL4Spv5pVtWruZXTjd
         y4BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ATH4Gg6w1rZmrC11/iAIWnrEEpvY40NWpwaW65dF7vY=;
        fh=56nwHjAG9UoGIcl4QTFFGuuyo4tnznOYoanfURXDYvw=;
        b=VaECcxoHQ77PP0x0WtVp3crUlKpCOOY3AXVUBSpyD5yo5EMqwkwZOb/FvcPD05W1PX
         qODERYMQBP+KEJWjPSRVfE9jzbj1XpcmzEbstNXHL5UQo8wa4ryOrYWmiH4pabMrXbcO
         n9eeuQGeZaoiJd4NUbBDLumf6P5iaEmqbg1v+X6kX6qZDwedATeWOr2tqjp1wYX5fcmY
         VwXrUoiHw7hWfqWgAJl0MgG7Win3/vvbpeucT4VDRyk6lF9BsU/vLswoexjwxdfLJlok
         mb2dqsAMHAOrfquxRQNl87WTOAk2izh/oosqNyMTe+e1T1IbhNwgl8OacRiuKPg7Z4Uq
         UACg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765460307; x=1766065107; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ATH4Gg6w1rZmrC11/iAIWnrEEpvY40NWpwaW65dF7vY=;
        b=nMwp0jV54b3WvZQP38TjomS461o8XaECgyBlwA+L6J4v+c2W8YeK8U3XDHTVtRQqor
         rKj5vjD3RbQZkmeF11EaSf68Zhpa5XBr7/XJDm6xNcF+UEMl6PIq4Iw5tYIl0CKOkLA+
         DIbr3KmXJ/xh+4HVh31YktCKaYdCemAyFBG1uAx3R2q9an50dpD9ZgGJnvU7T28msayj
         Wgvx5KjSAaeJUdWOFMkEhRCCNbYWIXH3Vz1rb22dRsqr3UOct4n2EoGwU9F810by/BAh
         OIHMt74cf7Y6Dljqbvuc30Rj3K2bzDePyPCnXaeZty8JAV6U/63nZ1teLnV1eqfHSaZx
         14TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765460307; x=1766065107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATH4Gg6w1rZmrC11/iAIWnrEEpvY40NWpwaW65dF7vY=;
        b=e72GHJOhWrr1svDMg0/uQNMvfWXE+o8FDsxMn1ElwwSZu3Osl7WarfrsSWLTuxxxOx
         Kw/eRtnXNW062t9xbWT/x2pTWWtYlh9vgr358B/ClNy+SFIXjyb7Xwejk+qCz4MuwTP5
         n2P1XT2X3lE06OH7HEakskzBHMUbVO0ZbKe7G0mcHu1WwAulq5DXtevS1n8WoXFkGeEl
         oj2DahMk7dM9kzAdZ2DVE7druK5g3FMUdwKHns1e8riBO3xwaRKYuuc6o+tRDHsApLWJ
         b94u8lkSfyvmz+d6T2Aj+B5dP7C3L5hAtV31yl4puARIYcZqq40z4Zno1p3eCp7Cb5Mx
         kArQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh+CwDLnJDZE/Pg80YmGwjeY92ZF7yxbqh7Se6zb4nDDbN8I6gB/xJMzubqoNc1JBtwwwGTFaVRDnqMfvPFAcc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5+53ePdszA+5R5EKMs0NdGfD000kDnwu7whQ8eiFT80RmCxfD
	wyKvdL0/HnsF2j9EcFHQt+S9iybWP1/d3hNq+xp5C8plDkC6Q/IobBJ8Nn7nRztUs1YZolQv6KW
	zMClSL7BxSJcLSWtt/C8qYkkA4z/24RPdHpMABEsawd4dVrT5N6b4HZDO
X-Gm-Gg: AY/fxX5Bap5mntNsiPjLnAxLqmNUk18n3UIZKIIP/v5UwfUQYuoSepxE+MobMQVEAc9
	0vxY2+KULXJsTo2M419ggB7cOuiC3LSISPS4dBd+PEw2P8iEkQopvXZnmJEvbMFoq5PXkzJLLuj
	IPzrgF3MEOEHDVEJUj2H2TulnMi6ntd1uU0ul5bUTiKrxFtTiLIbGBsVvl7YLBv1Clfvr5zmnQZ
	wMWkv46OKIOvgRfj6JSUAUz8eYySwDAS9vbLlJp2eGGffye3mdjBC74ncC8LVCgOQ+ac8vE
X-Google-Smtp-Source: AGHT+IHBNLZXUtBWlYCMhaz48//h3NT3a97dTmms6v9GAdwjCupUlBdtKCU9vgSfcoVTwxvogMmesy8WxjYwyhWFLco=
X-Received: by 2002:ac8:6059:0:b0:4f1:bf1a:f040 with SMTP id
 d75a77b69052e-4f1bf1af253mr7198561cf.2.1765460307167; Thu, 11 Dec 2025
 05:38:27 -0800 (PST)
MIME-Version: 1.0
References: <20251210173024.561160-1-maz@kernel.org> <20251210173024.561160-2-maz@kernel.org>
In-Reply-To: <20251210173024.561160-2-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 11 Dec 2025 13:37:50 +0000
X-Gm-Features: AQt7F2oIVnn0zGnmHiuvEME1EKDfc3M1hrNZuxqGEx_qeLODVk3FAHpDGjocJ9Y
Message-ID: <CA+EHjTwh=Vop_v5+2_wj57Y-Wg=Q12aw7hUYdNB2CGA4Kq0ZKQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] KVM: arm64: Fix EL2 S1 XN handling for hVHE setups
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Sascha Bischoff <Sascha.Bischoff@arm.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_053829_458634_C425A434 
X-CRM114-Status: GOOD (  17.02  )
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

Hi Marc,


On Wed, 10 Dec 2025 at 17:30, Marc Zyngier <maz@kernel.org> wrote:
>
> The current XN implementation is tied to the EL2 translation regime,
> and fall flat on its face with the EL2&0 one that is used for hVHE,
> as the permission bit for privileged execution is a different one.
>
> Fixes: 6537565fd9b7f ("KVM: arm64: Adjust EL2 stage-1 leaf AP bits when ARM64_KVM_HVHE is set")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_pgtable.h | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index fc02de43c68dd..be68b89692065 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -87,7 +87,15 @@ typedef u64 kvm_pte_t;
>
>  #define KVM_PTE_LEAF_ATTR_HI_SW                GENMASK(58, 55)
>
> -#define KVM_PTE_LEAF_ATTR_HI_S1_XN     BIT(54)
> +#define __KVM_PTE_LEAF_ATTR_HI_S1_XN   BIT(54)
> +#define __KVM_PTE_LEAF_ATTR_HI_S1_UXN  BIT(54)
> +#define __KVM_PTE_LEAF_ATTR_HI_S1_PXN  BIT(53)
> +
> +#define KVM_PTE_LEAF_ATTR_HI_S1_XN                                     \
> +       ({ cpus_have_final_cap(ARM64_KVM_HVHE) ?                        \
> +                       (__KVM_PTE_LEAF_ATTR_HI_S1_UXN |                \
> +                        __KVM_PTE_LEAF_ATTR_HI_S1_PXN) :               \
> +                       __KVM_PTE_LEAF_ATTR_HI_S1_XN; })
>
>  #define KVM_PTE_LEAF_ATTR_HI_S2_XN     GENMASK(54, 53)

I was just wondering, is this patch really necessary, considering
patch 6/6 redos the whole thing and fixes the bug?

That said:
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> --
> 2.47.3
>

