Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF79C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 19:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sluWAJ7si51ldKO+IEOlj7IVd+xFNM1gnjjRPbQIZI=; b=Ij5Tm4cmq9IRivSXR3zRzAsGR1
	SSzVZDHVWkf8uv2XHKF5VMDj4SEmFel7aBR7qIdfafJVBHocrKIrZQIQN10t6UA0Ky6kzcfbRyGbx
	aqQK+Aeld+si7JQz37X6d3T0axwK4LoCuuAXK1awySvcVN8rN9DYoMxGBiI4WpmV30wE6+OWwvwLT
	cD62bINDZ+vpZfDNJY218ZljNVnazt0ZGRLTGLYNG5QpPRTzYmqZUj8ZJy+OLzMzsU4ONXxqrQEAA
	PqZlGlZJkog39u3Q79fxrM7JEObXb5akdsbmZcjCaJF2MfKm5zSh2muztGkhu2dSnLlQeKw6XW+7X
	+Ovxag7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YwX-00000007s41-1syk;
	Tue, 15 Sep 2026 19:35:49 +0000
Received: from mail-lr2-x12.google.com ([2a00:1450:4864:38::12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YwQ-00000007s2G-1WLb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 19:35:43 +0000
Received: by mail-lr2-x12.google.com with SMTP id 38308e7fff4ca-3a2ff174422so1451101fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 12:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789500934; cv=none;
        d=google.com; s=arc-20260327;
        b=Z49dDuiPdaWT9Tk/FXlGkDUtDarb6DeQJxqx6CqwQ8ASQrVJgAmIwUjQjjFSO2hUJ4
         veARJb+WAKPnKVkcbobk9vTlPZLFeSms+6otOtAtHsvbGIVvjFSKW4StbGc2o9PUuoxy
         eOh2hNMqK1wu83taPEp392XirGeRltlRueHjAezVziG8PK4MO/Py7M7vR4binIVMXaBE
         frTNHchVNRXR+T3pAqgATEk0rsCDxGGgqsgjkmvpKpuPwT5/hgVdQfUjmaXdRtdvhTVP
         Q7v3LLap3JxQF/xU3Qn1ImaP/O1D3vsunJsYl/P/p8rakSdPAhUSlyBzRWhvB4WBoeN/
         BqXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3sluWAJ7si51ldKO+IEOlj7IVd+xFNM1gnjjRPbQIZI=;
        fh=2lO3qQ8Bxe+sgDZoapqWXQ9mCoFYAWNVsD7UQfk+eb8=;
        b=PimooTNSce5FrBy3tOLqUMijtOQt5J98k9LBQ4OTOcAajioRs85DPiGFLUylEaV3mM
         21YhPcvf6UgcUHLT0C6TB13uHWc5gaIu9rLBbxuBwC0jfapILYu8kpgPo0KgNcYHXVK5
         s32W1+83DZ5DYRxRYRwj9CSvecKj20YClt5KhzrLxAZGvPLjIbeRntljSL1h7dAxg9tM
         xhg/rumb8QzjZ0m5OOam4cnyNIWoW/Jl6FFmpxWAo8rSce5/PlgYKTIEb4hTGaickzAb
         YUy18boZGTwI+i9peT5dik8+idHzKbO+1GU4eEDVzgYimzPU01WcEWLTh6aRaZj3k0hr
         RftQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789500934; x=1790105734; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3sluWAJ7si51ldKO+IEOlj7IVd+xFNM1gnjjRPbQIZI=;
        b=Fe9UILcoGffr4fpY4q0HzeSc6X0Gm9E+0hQRR5DE+wcH+wZ6VbpQ1Ot7xj6tzBeEYu
         cj1Vkfh9MK836Nke4VYfpo+P94GFw8iCydTg799qCIN/bWI6FwdeyNtVltWdRBy/JjHt
         3gY4bZHi7975lopiu8IxUANkqpsViRMv3lFg0jYY6x4UhWkCKKCbVyMIEYWEv/9HmnS4
         uCWIE6fwh1WTxXgCH19rtxfsEfdzvqTLhaUiZiiDf6QHAZtUrVKon1LHihzOKlopwK6/
         k31EQTLoVvH9d2KpUa9lSWm366AK/4QrY6tkrK2OOAyfxmGqxWD76eJaAJtIgL04pMZ0
         F0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789500934; x=1790105734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sluWAJ7si51ldKO+IEOlj7IVd+xFNM1gnjjRPbQIZI=;
        b=KdrloOn1bHJRDQTwJ5e4+GuuOYqLoKuzBA5g8vtdARcnSFLqOJ557ib2xJ2y9e2A2+
         quu7MtrwKB55VgbSu9NWgrw55ryM4eLx+ADtvshtIY9nqOHgb6kh4Lp9wOFwjA9klxxQ
         Ax5L57h3aTCxkzbNv2nU25aMplOM2u5NWYkWqmo1I0bKYEYHS103ymmizFurmSXWyyRn
         oAeMZnRORFjN/yZgFedOIzwbAI1WWWD00cc6YRCSSq8f+etXmaqfNcSoWJBiCO9GjLxi
         n8Eiwc/E3a+3N3K58lE16NZRJF3AacXeTk4N2OVo0jVsvkW+SZ/OwGJjxxfN8qZR8F45
         8HpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHZFL1KrB+AVULHeDMYybpBLxUWWAeYCcQ6JXXywc6X66yWWMAIO00qDtmvtX5Zox52WfHSocRtQAEbV2WYu+y@lists.infradead.org
X-Gm-Message-State: AFuF++lY8JlvAFSfTlJsy3pnJ7DT+0wFimqMZinMqTyVUVP0vBtXGVo/
	1AniLWREEOB5E3NoREit+0i6zQcWKkVlv53jaBKO5eYcn/HOR0qTzb8p4hGAaSWe/tapeKvLX5z
	yY9DVyR3wTlRi7WEWU086RQsTmkhCsUB2KICP+/FG
X-Gm-Gg: AYBFou3QROtRI6J1PVoJe2Dfnjw74dQ6esATkxrDH1Y7PnvN12+SejJJiSpSgvaVJJW
	J1rtK2rLQFcM0AVjsxHC4intBOuRwX3BCtLMm4mYLpQlHfyaxYgRy5pUjkcUr3rk7zBRadcu0ZA
	EMjoI17Ti65ieqYHRgqrJ2Wx35Xe4tEhOQXBsgAFeS9NSKJhRQOqdy9UBxYsMR/djiLNZnXVraG
	dlee21+Xe5K76sobeet5nnKc/IDdR2Ja/bc5GynUKlEdtoSfqkjg1znrEvJMY8VygJJsZM4sSnY
	ROOiQR1B1UXX07yHIwIgOI+JYn8OGbUyAws5PB1If4tdS6+0gs+UXXVRPX9RKXnG
X-Received: by 2002:a05:651c:a114:20b0:3a4:9e46:235c with SMTP id
 38308e7fff4ca-3a5c89b031emr21060911fa.14.1789500933920; Tue, 15 Sep 2026
 12:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260912083611.2513845-1-suzuki.poulose@arm.com> <20260912083611.2513845-8-suzuki.poulose@arm.com>
In-Reply-To: <20260912083611.2513845-8-suzuki.poulose@arm.com>
From: Alper Gun <alpergun@google.com>
Date: Tue, 15 Sep 2026 12:35:22 -0700
X-Gm-Features: AcwNN1VS3YvKKCCRg1vDnBVkoWj-7p2fofNqSox_wrQ014s5kEA5YUvjF8gr3LY
Message-ID: <CABpDEukTAc1m=g+rZRPPqaTwrvhUJPsFRWpFd0PxZsyWw5mR=Q@mail.gmail.com>
Subject: Re: [PATCH v18 7/7] firmware: arm_rmm: Add wrappers for Realm related
 RMI commands
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, 
	sdonthineni@nvidia.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_123542_428661_90932A0B 
X-CRM114-Status: GOOD (  14.45  )
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

On Sat, Sep 12, 2026 at 1:37=E2=80=AFAM Suzuki K Poulose <suzuki.poulose@ar=
m.com> wrote:
[...]
> +/**
> + * rmi_rtt_destroy() - Destroy an RTT
> + * @rd: PA of the RD
> + * @ipa: Base of the IPA range described by the RTT
> + * @level: RTT level
> + * @out_rtt: Pointer to write the PA of the RTT which was destroyed
> + * @out_top: Pointer to write the top IPA of non-live RTT entries, from =
entry
> + * at which the RTT walk terminated.
> + *
> + * Destroys an RTT. The RTT must be non-live, i.e. none of the entries i=
n the
> + * table are in ASSIGNED or TABLE state.
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux erro=
r code.
> + */
> +static inline long rmi_rtt_destroy(unsigned long rd,
> +                                  unsigned long ipa,
> +                                  long level,
> +                                  unsigned long *out_rtt,
> +                                  unsigned long *out_top)
> +{
> +       struct arm_smccc_1_2_regs regs =3D {
> +               SMC_RMI_RTT_DESTROY, rd, ipa, level
> +       };
> +       long ret =3D rmi_sro_execute(&regs);
> +
> +       if (ret !=3D RMI_SUCCESS)
> +               return ret;
> +
> +       if (out_rtt)
> +               *out_rtt =3D regs.a1;
> +       if (out_top)
> +               *out_top =3D regs.a2;
> +
> +       return RMI_SUCCESS;
> +}

Doesn't out_top (regs.a2) need to be populated on RMI_ERROR_RTT as well?
realm_tear_down_rtt_level() checks next_addr > addr under case
RMI_ERROR_RTT: to determine whether the RTT is missing or has child tables
that need recursive teardown.

Thanks,
Alper

