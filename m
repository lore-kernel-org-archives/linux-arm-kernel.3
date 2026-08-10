Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC4EC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 02:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfZ6cJyn3c2CEMtcULkA0SC7xIsKUiNypkInBkKfxDA=; b=DH94zz8L40LUEEFph/2TBv15Hz
	es2Vsj2i5Y5r24C1UTwTYREIKT6xBkFawKsp+ykLoUe27ePy7GoktCA74oLzBQsJ/rFlVjsh74DjB
	s1DqpANAFvR4U+LWRd3y1u5L7IPmEm0/aNHe07bk0678WsW3iTKi7vmi3Mo4LLkz0sKtVaBVca06f
	KHQF5aqv7WyzkDm7tUff0WDdRufbNLnVwqmB8THYtWSga6CL04ppY9GuWJxMiJYyAkvIHXlX6FmkL
	OXTmz9QZrOu8rg7t9/IpBztco/OwRbw0EmWWK7DAmkGlvZPHz+9bhlTm7SlngQs161lTXh2Yw/oQR
	WUkK0L0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFRw-0000000Au9G-38gR;
	Mon, 10 Aug 2026 02:09:12 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFRt-0000000Au8w-38iD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 02:09:11 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-51bfad59921so8146391cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 19:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786327748; cv=none;
        d=google.com; s=arc-20260327;
        b=MpriihPYPJgXzxwtUU9ZRf6bZWn6pVRJ2SxreDuLSGjFQfcyBFV1VTfD2KeYE/XbbE
         RWMCuI1OOMC3bJ4I1DoKkCCTWfou7CpZJgJXRNkvF5p5UKJmikdVQvCojT2dTMpg+zCl
         NJkUtNbRwEMjoArwS9qoQaLYbRuDissJpvnX8Yf/3Qn/T1I0C/hAWiV7Z9YfEuy7SMgI
         pNEN2xt8IYEnbl41WwoaQu6oLutIA2X9O+3LfLOOmR/WWV1bFVnCCOHsIB5h2tpC3Yu0
         XvOOXlRSq3mdHUtQYqKwWmfqzO3AgGCNEqsj0psi7T6B5el11xmyyZGXj2dxhZzTPLup
         FgKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VfZ6cJyn3c2CEMtcULkA0SC7xIsKUiNypkInBkKfxDA=;
        fh=SMxDNWYQOIS4r6dNpHEnGIiTmoZL2qK2nSteZgRCDJY=;
        b=Kh0jKTndelJnfJ3K3xuNfUUpEXiqDRtAVkiUvYyo2Z9BJdpcCEt3Pkbg8XXz4ZFzBE
         AnG+AiCEhx5CpuGPSv5/KmVu7BJOyFQfPRQ+7RvFWjTv/X7HaWm3mRzccA3PoNiEtWvI
         gcp3JA2hXm5B6Ze82uB6gxAb8CTAv/FUyd8kH0F8pKce+bAIQn6SW663MEUNFeFgYQTH
         1okPirIQIpCxuxyU7zpNAUGWh2x/OXsUM40vsDJjsrreDUFvkzXS0H/La2cxp++IgAey
         HsTBiK5hvYNR1pcWKw5klKHnrP9hYAPRUuyC8pi+TXM+Veyq2LLd82m1Ofu4tCO+w15x
         4Y9g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786327748; x=1786932548; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VfZ6cJyn3c2CEMtcULkA0SC7xIsKUiNypkInBkKfxDA=;
        b=IcfHV7mJQBEg/K77FBwXoTIl73pSRSt47wiy/48iTB4C12Rud6zyxvCuVNUIsG+q6w
         +9TNY0ZIRQMBXkYKwMUpw3M4i5uoz1+/m+Pcn9lDbdleygfRW5qD0GbjkoWRNEwvh32s
         zG5wYsiug0AZdaSalAMn7KKEQLVimlXPM+E1yJidfjpQle+9I03/KlCfulyCvsqs90KP
         n9ypyaTwXLUVXCRa1Ba5BNesPkFxolC+TbLCXlLDhSn4iCZZPgsAUvscSJI62Bcyg+hp
         jNFKYRbYrKTKT/XBmpClzui+M2iVm6nIO8A69Tkf6zC8DjHRirv4AmAOnelXfb6uuaRV
         iQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786327748; x=1786932548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VfZ6cJyn3c2CEMtcULkA0SC7xIsKUiNypkInBkKfxDA=;
        b=Iy+OtcSc5fHVfrMT/gn1V+uMonRpsX4ey4oJPCfTZ7GDt1hszEcqQu5spfbE6EpfS9
         qWealbNFWGAYBwtZbeP1+7mTo5oI+t0PT8m7gQdlYYTVFBWjn6RvFgPhVVd+d/ZLF6d0
         3quBjB/0z2oeud8DE43Y0dvAAvh77bFZqRkEwaBGXxWOIZLE+C11CgcOwrqqXif6D5PG
         c+34WuMfSkrTA21Vz4DSDWoDAh0uCcR1MO6u0tDMqJ/L41YoC6rTULbWvf9/F6HFv+oR
         sZS/0AQ9Eie52hw69TveSvcg3ccW46r7tubiI0ZwHsAJP/+w+x7wJ2kFYm3K2kEQu8C5
         x/Gw==
X-Forwarded-Encrypted: i=1; AHgh+RoWkNc48Sro/bn2PSan86+/lopV9wZcODb7sPllKe5py0Hcqh44fX4SHudVOUJv8pRYY9bjJ7RTtxAYBX0kl3JC@lists.infradead.org
X-Gm-Message-State: AOJu0YxFanbeMuaiKJzaMPYK8PXyDHRyq9mjncDt8PTpKRWMqXVk4MMk
	3HkdRb/0J31X+b96xpMLlJLFjoaHKN5LWbFHAL/WNkAihYafXYEA7P7YoadzNjU5KPIIMNupICP
	PNoIBIrlUuvPDeGtitcZtO/Lx4/a1Ccw=
X-Gm-Gg: AR+sD12P7ZVMr+bVBjyi/iyemtS7Ps+f0Hh8BlzRpQR+QK/TNQty6iH8PDmspaPhII3
	K4gHyTLhgfpqbWgsdZXF/67zxfXp9xH0p1FpU+34NiK/5eC1lLasMXONzqd3n74u+zKocnFr1YW
	SZDwAopQGBYn8tlX39mMeaSgVfG98J4mNNa1zgCqFfEcfhsQklyIeOzATZMGiuE5RArgkIc7jPa
	8wYcCL5/MtXQBwL+eqovf6hoMvWEMCK1UH7q41KdXer58h2fLG1QnYlmvWSaMA1bITyFX3MnLW4
	Mtjf1lF4QOJCCKGIkyxYAHujbmNTZ5w+ht9zLQlIJcJTc+wrZlp8fTnY
X-Received: by 2002:a05:622a:481a:b0:516:dbf6:f8e7 with SMTP id
 d75a77b69052e-52ce6035cf4mr443173941cf.17.1786327747787; Sun, 09 Aug 2026
 19:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260807135216.9919-1-seanwang1@lenovo.com>
In-Reply-To: <20260807135216.9919-1-seanwang1@lenovo.com>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Mon, 10 Aug 2026 10:08:56 +0800
X-Gm-Features: AUfX_mx5N7Mx7QA4a4CPxwDVUcMJKitsLB9wwBGg-il33P_4tPQOPeuk-RM4krQ
Message-ID: <CAB8ipk-qZ+MjSyuUu57pB5uMmzC9sv5=9t4z5quC43_N+QBTPg@mail.gmail.com>
Subject: Re: [PATCH] arm64: topology: fix arch_cpu_idle_enter()
To: seanwang1 <seanwang1@lenovo.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Beata Michalska <beata.michalska@arm.com>, Lifeng Zheng <zhenglifeng1@huawei.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Sumit Gupta <sumitg@nvidia.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Xuewen Yan <xuewen.yan@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_190909_791244_9B5F249A 
X-CRM114-Status: GOOD (  18.95  )
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

Hi sean,

On Fri, Aug 7, 2026 at 10:07=E2=80=AFPM seanwang1 <seanwang1@lenovo.com> wr=
ote:
>
> arch_cpu_idle_enter() directly calls amu_scale_freq_tick() to update
> arch_freq_scale when CPU enters idle state. This bypasses the sft_data
> pointer check that topology_clear_scale_freq_source() relies on.
>
> As a result, even after calling topology_clear_scale_freq_source() with
> SCALE_FREQ_SOURCE_ARCH to disable AMU-based frequency scaling, the
> arch_freq_scale value can still be modified by AMU counters when the
> CPU goes idle through the arch_cpu_idle_enter() path.
>
> Fix by replacing the direct amu_scale_freq_tick() call with
> topology_scale_freq_tick(), which is the generic interface for updating
> frequency scale and properly respects the sft_data pointer state.
>
> Co-developed-by: Xuewen Yan <xuewen.yan@unisoc.com>
> Signed-off-by: Sean Wang <seanwang1@lenovo.com>
> Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> ---
>  arch/arm64/kernel/topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index b32f13358fbb..f617ef5c9903 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -176,7 +176,7 @@ void arch_cpu_idle_enter(void)
>         /* Kick in AMU update but only if one has not happened already */
>         if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
>             time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_upd=
ate, cpu)))
> -               amu_scale_freq_tick();
> +               topology_scale_freq_tick();

Need we add rcu_lock/unlock?

>  }
>
>  #define AMU_SAMPLE_EXP_MS      20
> --
> 2.25.1
>
>

