Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07369CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 20:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LK9z00ubzec0E/FSX4Kl4K5PC+aZIx5IC8zFGof99gs=; b=mAVmb7TxhAVqiArg7eo3btqwlN
	p9yQ9KOjP65KPtBf+AMAczKaPV9TQG7CdUNt73kNhvYTa7ajKVrkI1EPMIZpe21u08TGV51pUAAwa
	B3B3EenTNXHz88GaHdGId3nEIG6t791iS5QGkDcnV8AMChNHe6Pa4ERGpheEyx/wm7KQbc1Lzyooo
	qTSQid/x6Lj1FI0VvQrUtJf64MjN9ohDjvpqolUO8FW3khzjkgD40aS2RNolkQ/qQjNU9/xJIH/Dl
	Z/Q32klnMSIZbew3PI7kX6Xn0tir2fvy3lrLYy3VRsRu8zDhI51MVnzhleVsz46ncfVLUtjkgl2cY
	y5JC4wBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wblUw-00000005NBH-0Ytq;
	Mon, 22 Jun 2026 20:44:02 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wblUr-00000005NAf-2aWu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 20:44:00 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6974f511dd3so4970769a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 13:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782161031; cv=none;
        d=google.com; s=arc-20240605;
        b=QrUIcOjn/QFE6DI14oQsCrFt2sxw1cv0+n7K3QuOqkjzCnG0ZtcZB/WSE6portMeq3
         mJm91GfsGJJa6DC/Xpf2ZiqfFur9z/oF51V8myvIFUu8+wWMWKrLcw5KzG9dgcmpjNnT
         zvl+sbGbqP6bny7po+VwRv/BGjtqJ/tl1Nyawh4A51NMSAa7ea1QcwRZ1EkbtDajJxsJ
         rVpVUIzajsuMad0pjSR5/5PeXfATdesXL++R3AkW+fPYXE8MvgtqWha5OP++CqVhGtfG
         pwID/DDIdkko+AyTw58CGHJHNj3Vdx+GTFt8gvgx2yBTaO3ISEE6Mg21Cpjt6p1ZwuZ4
         +uIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LK9z00ubzec0E/FSX4Kl4K5PC+aZIx5IC8zFGof99gs=;
        fh=rTDTkPgri/YRCg9uNV1XH1UTAQ3pwbxiuCCW0i+2+JA=;
        b=JJRozAmYhDXjhax/2qazDd6dsKSAhhm4CSqXCeZnNJKGU/8BcupFO0zYkGdquDGfHN
         jJJ7CI+P3/Ae3CDEcnI1bzrtl2hFdUVk/CtBxXzOKG1rPYNtOSVuF4CAz2z0qpPgjjic
         UNJBUkxMtzygcQhMcBqVuBeY3+uUdyrdgP9cng9lXW0DgZ3hiaRcG5jyRTWQ0e45olqh
         qWhl2x8ZMo94Atbk8BvzT5ug7k/iwMYlXqUBLhvhERowOy11H9pDxw3MtLs1ZYahwsDL
         A9l223ICYsl+xIJ9jY/EHBRrBSQfSODyyV3g9aIM+vCSjFzFyH00QUGOK87ds0iSJMJV
         E2DA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782161031; x=1782765831; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LK9z00ubzec0E/FSX4Kl4K5PC+aZIx5IC8zFGof99gs=;
        b=QNM+29naEkgfHoU+0gb5As9cDI2anwWOlXyPuSTZy95F17uNld9uT4imuveSP3zEng
         7PHiEYSMjSTzwKTbPcG1fQPnwDObnSmG4LtBXcQXe5iA/BwxutyTHpo/RB/dUNmp9esD
         7QKcxYIT7FgtNCgvbzBWOSsk6CP/ZjQiiuWcMxltzrLiVEK6lapjoocAAQSIkkkb3JSu
         oNoUfz1yybvbwW9qeLB2HHKKcmShRxEWKAq2Xj+9omHf4NQAKpQAg6T5ruQRHZb/CI/6
         j5ncpuPqbDyUIWajhHTBlmUNiUT1Iy1WogbVR4QpIDcLDjN9cukwWunis8zWHAEMiorH
         TLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782161031; x=1782765831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LK9z00ubzec0E/FSX4Kl4K5PC+aZIx5IC8zFGof99gs=;
        b=gcECg3JhiRHf5rRtUPy1PHcVSwDBk5XolWVcuwzpodugmGnlYcJxGGjQgHkMq4rf4f
         XqviIL+NbsffBUOo56cjVkrRS7CgHqXg1txdWVmDAVWbE/KTvVzDWoXPvRjqVx5ICcSy
         9UFK2Kl8WAMa2WuRrxI17XVM+/saAvCOnPaJPi8Ny2SPrSQFK3cxihBTELtHV/Alojsj
         H0MKgrFnIGDESoBvTS7rjZVUV0x2E4DBrAV0eAHvgX2S5mNnjsMeMbWbo2CRXNP6osd4
         zbVGPvvuySHZhFRQQumG/TRXxXulJdRpms/9aARGRuqlRU+C7nGsw1kMuZoi7t6NpeyR
         ejag==
X-Forwarded-Encrypted: i=1; AFNElJ+lUBGZwC7aM5+IXnaDbihBKn1Q1lJZMM4qVu63NikNgLBIC43k6RmZnInifiegLH4XXl5WumXLo0VM4jPJ4H9V@lists.infradead.org
X-Gm-Message-State: AOJu0YzyaRBtzg4GpUxE+4ezMC0rOLE8TErvfOfnF0IkTBnTHqykTSBz
	JsLQcGnFjI4H+jcmlesDA80H96JCjqX6jNNi9aszNFFLo+QkpVfNizIIGt78JHGQhA89Ei/3s2B
	bHUORQ+cXjJKkqBZhTurqwGpYKgt5U6c0jJi5dy2K3g==
X-Gm-Gg: AfdE7clbtBWa00fBEoNC3yHOSVDWNb/kgvIR/eu8AvId1WHHAM0C3QvkhSaecdKDCH0
	zmu2NxjFu3YC064677h7rKK9E3HBT9mSJNmBlKkb6au2D83ugyv8v8h3MWujZhQ44uXL8GNTbRz
	cCq46C4Rv5iHzB1PDs+kObSpeIKto7BPK3fftTjZsjSUQFuVhhJKY3aaxIs8ki1/XmRDxVdW4dD
	cGlZ22MWSfJUnKwdnf12XJ5j7oGMQEGw+DII0YRGsiCcrefUGmCFzDHM3pEcsRmwlOliNetlhHU
	Xn4L55FgifKHH12DUJGRjb1X7RgM3sA=
X-Received: by 2002:a05:6402:5203:b0:68d:d511:4a9f with SMTP id
 4fb4d7f45d1cf-6970f7bb394mr10422389a12.18.1782161030519; Mon, 22 Jun 2026
 13:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
 <20260605-exynos-pmu-cpuhp-idle-fixes-v1-3-0cd05c81a82d@linaro.org>
 <CADrjBPq4fou5KWh4T=oNkUVPz5Jk-821OVe3j5sWrKnCtHYM6w@mail.gmail.com>
 <DJ5GP6VQJDHL.2V30K56ME95DO@linaro.org> <CADrjBPqF6GPRLNUZtzkGUHTUQ6NOPoaRvVvF1mUUj_DJ9As1dg@mail.gmail.com>
 <DJFT3TXC0OJA.1ZK17YA2RSQXK@linaro.org>
In-Reply-To: <DJFT3TXC0OJA.1ZK17YA2RSQXK@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Jun 2026 21:43:39 +0100
X-Gm-Features: AVVi8CcSJhlsiEYo8DbJV4KtarpnAeTWxw-4zzSg6pxbzuPPjnCW8fducZqtX0Y
Message-ID: <CADrjBPovA8Kpzjqwr5w0UvqYhpdGyBwpv=xkBLcGGuwZZoocPg@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_134358_942025_A3CC4F73 
X-CRM114-Status: GOOD (  21.60  )
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

Hi Alexey,

On Mon, 22 Jun 2026 at 19:57, Alexey Klimov <alexey.klimov@linaro.org> wrote:
[..]
> >> >
> >> > I originally made the failure non-fatal because the system still boots
> >> > without the notifiers registered (and all other Arm64 Exynos SoCs
> >> > upstream don't register notifiers and AFAICT have broken cpu hotplug
> >> > and cpu idle).
> >> >
> >> > In hindsight, that seems like a mistake. I think your patch to fully
> >> > unwind everything in case of failure makes more sense.  See small
> >> > comment below about destroy_cpuhp_and_cpuidle()
> >>
> >> Wait, setup_cpuhp_and_cpuidle() should be non-fatal and shouldn't
> >> return any errors?
> >
> > I suggest you re-read my above comment above ^^
>
> Could you please clarify what specifically addresses my question about
> notifiers?

Sure, I was referring to this part of my previous reply:

> >> > In hindsight, that seems like a mistake. I think your patch to fully
> >> > unwind everything in case of failure makes more sense.

[..]
>
> If c2 idles are used during reboot/shutdown then they fail or what?

This followed similar logic to the Samsung downstream kernel drivers.
I have no extra information about it beyond the downstream kernel
source. It seemed reasonable though that CPU's will be hotplugged
during suspend and reboot so you may wish to ignore these.

The proper solution of course is a fully PSCI compliant firmware,
which doesn't require these side channel hints.

>
> I am not saying that patch is correct and some rework is needed but I don't
> get why we should completely ignore errors from hotplug states registration
> and should not check registration of notifiers. At least warning should be
> shown to user that pm functionality might be unreliable.

As mentioned above, and in my previous reply, I think your proposed
patch is a good idea.

regards,

Peter

