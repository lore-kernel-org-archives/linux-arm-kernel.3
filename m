Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718B6CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 07:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEpk5nvUQrP2hOPNfotCvTIhHCWOPoRQlVlTaAX6Z7w=; b=JHoXSu99CjXzr3HnifrvnrhSsY
	23rXEeOVV4lar+S/k0oxWC1/rke5jXSoQpaws/sM4wFiO1N02FEYCoVQTOFe07kSl5SdOjwSLHj8O
	5uyNQoBjSIfmDtuADShBjN2DPplbpGM6lIYrhHdIyBlCNo0qqYFb0NeVUdPu/HaHYQOY9z1l0Q7XD
	M0bf5Bzs0pAIw1c8SLzRWVOcHgUHGdMVDb92cF2spSLLQPs7dzm99v+q2Q4cjsTZG857EVgzxjMKG
	Gf95VL+a2rI1YBeg8XAxGopY2iuKvhv+tU0j6VBPSdLhKmpNKRE67BgD8X/fsEzbRLygMS9QOqwas
	EWR0i1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZVc-00000008qwt-1axk;
	Thu, 11 Jun 2026 07:07:24 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZVZ-00000008qwM-1FoB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 07:07:22 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-68bac6e24fdso10208552a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 00:07:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781161639; cv=none;
        d=google.com; s=arc-20240605;
        b=Jmyfgsjw4vGujlU9uIh2PfURVT0JWmMxQOpTCOKGJbd3iJCMCEy5gaQdlLlsWOF9VL
         CDZMC53/LjYxdUx7wDD+gPIcy6IMLBQ8R4sfppuUl5yvYQDF0kT5kC0ltvhy30Fojtrj
         tRS/RGESHWxKCEuMdW1B54zgvHmcsWkKSm0LSaFSxaxea64R2+lh8gmNtPNjnSKcPta5
         MKzzoXz7gdzigJvKC6k+P5qYZODMNoI7LDpYXHMavjerQSEkrwZNVrvMbjSbXnp0QGel
         p2Fwlr6Xtk861v9nbNBscGKHE5o/FsUl/Melcpbsg9mTSXtTA5Q1CclkNd9lMtyrDq2G
         Bbfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AEpk5nvUQrP2hOPNfotCvTIhHCWOPoRQlVlTaAX6Z7w=;
        fh=bhIcX/MhcIO5btrijcTmyDeqmQZKgbrnPtSHtGMknaI=;
        b=lgQcfMih2OLYWT9XJNqM2P4rhaVrP+oplOpKxBIcoZt7tsIMT3jEQaumZf7/rhXEZr
         RbOlt6JbzX2cDJsR6r1SngP10OfGmyLwnLwlcfq3sc7kIc+rRsZFL8lM8cihpseBIiNG
         aBxCX4XoRW8uVJJeR9YMnEtSv8eK2GAKekg0k2eSVg/ST3rOwDMc9TH8ZedVe9m2zxGy
         BNIfAotxFbpbAhYjsskUc3xi/Q6zBjoBLI+DvSTZcJ1cr1ncl6/qaAQA6xgKuqnLC/e/
         AN9noGiVEDvtX7inqnAYerNQoEN+OnAer5JO0eLiMJD0R7froMlYtdyT35i3zl0v3e90
         GU1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781161639; x=1781766439; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AEpk5nvUQrP2hOPNfotCvTIhHCWOPoRQlVlTaAX6Z7w=;
        b=S7cUeX68dcBV+ESdX7yhT5ZCR6ANGhanX6FrN/9wLUDfVp/7/pXRqizAHvJirKVF7V
         ElOHv0UozI59lX9dsaAYiCITyD07rK3qrIC/zD/hFlLDDctoydg3fbCISUBoZAEcHNqB
         LysZWckReKTJrgo7ZFISwv632ccsmzZMc9IE4gBc/0bSACd6w33GIWSKN9oU7e+wI4q9
         fJCIkC/pMIlZLH+7df2HE1v4OWNTlz0JDDK9Z8d9FUfc2uQ3lYjeoGw5Wg9fZIZ3NMKe
         udO+1X4dZ2ren2xxPedVf+Wg1a971IGiDd+qFXRQTGJpM6ohBKaCMWZa2yfjD3hxGW0D
         bpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781161639; x=1781766439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEpk5nvUQrP2hOPNfotCvTIhHCWOPoRQlVlTaAX6Z7w=;
        b=l2+JF1kU5kfvpshlt7ITlc5swoZaC5v0DYGN8ybQOjVo8dZLUk2QyGYwehXnVbmJot
         mJjoORdMbwPPBhXQra8Ga2rOsVP9B2JXFeAqqgTPFdWEOMRqactd5LlGtm7IBMfSGbgd
         1zKXb6ilF19RSbMx3wfZNewBkoUgxXl9m0JUnktJ3TwnrpTk1EUjtW8VafXBNnaxHo+J
         bJggB5aNsQMCHyoQZvvPAfx32m4kHhA7Yi2AOVcA+QRB+D/dpDnBdrZnkVNob8t7NBIW
         eAyZqCYSG8nKs3bneqkNQg5raj6x/IUD+EPzOUTNYGJOtzHG/aCQIvnve/YZyD9q/XjC
         rMgw==
X-Forwarded-Encrypted: i=1; AFNElJ/ECnIzeO3pnCcMAOrtf4plAVe6s4AWVPTle/8seCZUL7sKAljQQamoWiUaHUMTzpV1JjCrw5PSfiQxsfMpCb43@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1wXXiRHQC8fJKQ3vfn37apuyXldWqEOwt4Y5M6dCPbX/kZATp
	JyFTlO1SkL9V7G8LtVsEoD64GpBT5WCsglau07rtd7uF2cY2Ei8c9SzVQjkVd51JFsr/fP4L2nl
	jB19T/TcOhQ9Sbf39QzDuk3AiqD0dDOABD7UCSIMneA==
X-Gm-Gg: Acq92OGgxgg61y7JuSfgsEcw+dfybCV1AhKE1LTKJUARf1zDGl+VE+cuKuDVuIp8YoW
	U0MtsOZGcBSKOtfdHSpHn5uKp33xb6zGBkT1/xK3ASbHK5Z+onW+/biG6y4Nmj81LgOq7/hTVyv
	VInfiSmVyiGd6Ol3rVWWKH2jDgWIQfGQIWOQiSHon9bvv6jmUE0QYhGiW6qD+zcN3IX09VobxxU
	K5OF1VIiyNcaEjisIlsVh6DVZHQKQdbLlRiJ409Mx180bVirpxueDCNXv/A1L4xVsTbycx3HHnY
	S5BaANSefK5sjkLjZmQWniTnatPICxH2rGCJWQ5nYYCQFHBwkMwd
X-Received: by 2002:a05:6402:440a:b0:68d:623a:bc77 with SMTP id
 4fb4d7f45d1cf-6930e282296mr669421a12.8.1781161639285; Thu, 11 Jun 2026
 00:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
 <20260605-exynos-pmu-cpuhp-idle-fixes-v1-3-0cd05c81a82d@linaro.org>
 <CADrjBPq4fou5KWh4T=oNkUVPz5Jk-821OVe3j5sWrKnCtHYM6w@mail.gmail.com> <DJ5GP6VQJDHL.2V30K56ME95DO@linaro.org>
In-Reply-To: <DJ5GP6VQJDHL.2V30K56ME95DO@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 11 Jun 2026 08:07:07 +0100
X-Gm-Features: AVVi8Ce9AFTdn5GgI4FGeBsq66vruRZqhouaV1W8cJvhIjXpfYGWOCqf13Hq8Oo
Message-ID: <CADrjBPqF6GPRLNUZtzkGUHTUQ6NOPoaRvVvF1mUUj_DJ9As1dg@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_000721_370484_C972FFAC 
X-CRM114-Status: GOOD (  18.62  )
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

On Wed, 10 Jun 2026 at 16:07, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> On Wed Jun 10, 2026 at 2:34 PM BST, Peter Griffin wrote:
> > Hi Alexey,
>
> Hi Peter,
>
> > Thanks for your patch!
> >
> > On Fri, 5 Jun 2026 at 21:19, Alexey Klimov <alexey.klimov@linaro.org> wrote:
> >>
> >> The setup_cpuhp_and_cpuidle() initialisation sequence currently ignores
> >> the return values of cpuhp_setup_state(), cpu_pm_register_notifier(), and
> >> register_reboot_notifier(). If any of these registrations fail during
> >> probe() routine, the driver returns 0, leaving the driver partially
> >> configured.
> >
> > I originally made the failure non-fatal because the system still boots
> > without the notifiers registered (and all other Arm64 Exynos SoCs
> > upstream don't register notifiers and AFAICT have broken cpu hotplug
> > and cpu idle).
> >
> > In hindsight, that seems like a mistake. I think your patch to fully
> > unwind everything in case of failure makes more sense.  See small
> > comment below about destroy_cpuhp_and_cpuidle()
>
> Wait, setup_cpuhp_and_cpuidle() should be non-fatal and shouldn't
> return any errors?

I suggest you re-read my above comment above ^^

Peter.

