Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8C8C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 10:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fT0yy7k6aVn8xwuYBWmP3Y+ZHenzu63FaqBq4B3FSs=; b=mhX3teA2vFM1+/D3Syc1PLZIxi
	1mDRofAxw4ptAP/y8nrXe48LaWMlaAHr7RXqEYsWzygPZD3JATt6HhPtz0tU6mBoorKBTVpDhzfqC
	MySn169vvGp8UXYPyC75z7ZtnaZcRcxj9JZVLoBsLyrI24ipIxynbcpZLjm2u3U/VtNw7na/s9E40
	OxZqXCVY4sSmrVJcyH6TLNFnAZdLST46eQEMx72+q515ej9PWeZsqfbP31Aq636+74eAWp0AYO/Yj
	pRNSkmkw7EUzP5lIh4CRr6YX5m1SHHPfFyYi08VXbc5b/TOxqnYfHGiYNz8Bh1JU2nZwzlhxY7e5E
	Rj8KOzGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrC7x-00000001WU9-3guq;
	Tue, 04 Aug 2026 10:12:05 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrC7v-00000001WTp-3uZ3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 10:12:05 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c1c52d920b8so626475066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 03:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785838321; cv=none;
        d=google.com; s=arc-20260327;
        b=f2jA7FYEBn1zW0QyX8LWNAtYDW1nAery8AehUGhrxCXK/zKX0lCpBhHX78vIIfr4+O
         1C3Ty5bgpZSBJD/U3VrwPNwjaqNbCUFJjlbBmcNQSRQnEvWk/ZgaQjflC8mq1xMSCbRC
         tk0IHOea2K/OKZ4np3jRL6577RasqubK8MqEItIT2aZt0v3NoJHkM5PUW0LD6XvOKAN5
         BQ2iggKKbuJf92LxuzwxaGEPu5X/WocTQZC1b855a0ObRnKq4/Y2YCk4N4jus/bSNwbV
         JifrdMi7wyIty3mEyCrIWb9QqP7cpkRrxZjfWsRt9fUWua5/JzXDWsW2ygQH1diLoFQS
         zObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3fT0yy7k6aVn8xwuYBWmP3Y+ZHenzu63FaqBq4B3FSs=;
        fh=El1qNuFE9CCiptZq2PUv3yOa7R+QKilu8f3vYCjrELc=;
        b=PezAOVgcu21pfHPcXgC8zIGU623LunLvptGY19uNrEpzAueg06blPTLskQnnPI58YG
         aslrCrEq5hUbG/314vxEpi1lY/+eFF9Y6RFWL45wVDnylZoVQe8o6wSPtMKas3g23FCP
         pHkM0MA+F8H8IMKTVdOrRJP7mEERTQx+3dFoDcQg79J6CzezuvGBaJAGpPlDOLs7G5zq
         VRf6ksmG9K/9sZWEtU1ii+x8QRWumqvNIjDRzGrDwT8uXL3Tj4j8yNMBpFd+b0uSV3jv
         gorT49sFCnHtmEj+ivgOj2/UmTXCfI0ZiuuDWHW/8Ihg3BDi7Ksz+vbrwrZXT6E+SSTD
         N6Fg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785838321; x=1786443121; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fT0yy7k6aVn8xwuYBWmP3Y+ZHenzu63FaqBq4B3FSs=;
        b=YLO7owXDOWwyQnlg08sMzcZE362eBMApoQyKiiseDCEOvoF0KuYpFUInKDqaVMfKiM
         MHltTXJU8U6x/2PbYAnJT6M/Jg/sPGo/o23shBoqtG8Tw/JyG4/abQmLSR99SfnDSfAg
         ozeEJaEA23LAHMUnd7KOSsUGS+RDYidtcUO8gKhTWubCCTYNWbjzaKyxRnFcSoXNZSGk
         ZBJhC1Lv3QWtC4jFMDnEX04oOSLBe9YxkpcE979GnhUaAXTdEgPvhl8OrhHyX1d5BDRn
         OcufwIhmPNI0i8UMERMt+g/hx7aHNAJnDRk2bZ8BDncDpCd0NFGY+km7tKOAs3GWtXl+
         AsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785838321; x=1786443121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3fT0yy7k6aVn8xwuYBWmP3Y+ZHenzu63FaqBq4B3FSs=;
        b=p6YJz+3ZFy+c1Tph3wsOc05PjoWivXSMn9QcgJNfmfbQuymTv2FIxSoiZcgDstlOUS
         jRbWWZV/Ai4r8vspQkHvtgQRpUercjyHrLvcvZrbLbOFJbdxsiH6uNr94SsdznuHtyh5
         LRFz0G6dThxaWo/JRqVRmghtY8pGcPug1UmuoapegesJDuaNJvnm56qU/LC4yEvQTPkH
         4jnm5v5Iko/C7c1soB39IlTu/9GOy7+vWPJPQ2R2DCVG7bFU2inNvoQZiZkg/NZZdWXn
         EymrOXn64wS+/nrO/sEzcPSjrRLmfxnbX6lywKPZOaxt9Jo7t14w03FSTCyrRmWjvAEV
         PNSA==
X-Forwarded-Encrypted: i=1; AHgh+RrETDwVaSe10jZn6mMzrk4/k0/PuM9jCbSM0pVn6yd2dBX8hkRwJJaozN2RNDZoupQqzU7WXfDVpKeYeXSNAzOP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4M6zHplHCofaoLf4F26RxcqJjryhBVnWO6g2bUmpArdbThfeg
	m2e0gv2vZPqhgKjWwva25XM6yG1qniqm7hdKfMHZOL9/4OZTAJYTG0R6dSEgds45SW/67M2FIpD
	dxo/epa7IazCDNu+pAT2Ct3k+g5S1ygU78e6YYwaPLQ==
X-Gm-Gg: AR+sD13AuLu2jB7MmYL4XvoVVT3dL1tKdN8GTpmixQhNn5Cg/yVhv9A464fKKeAiVPF
	Szc02T5HUMNEzGlPvJZHqnEK/zCfIJB4EEYsCFwG00kwYbsKuCu71FWZiVvtCFvQfnaztcxtMT2
	QpObFGWp/H6CnHUXaISXf3XRvVx74hG0vN/0pt82zXG0QqM5CJb0+V2YvfFWnYg58LVsmumSHvg
	L/meVlp6mBXRKWv/a77xUdZ8MCrMVEjj0zlP1jra35uMx3i9EY0+ltDF6knNTrbwLmTOmm8xLHa
	KcoGBCtJtt+FZQAa42L8Unx1uaJF0GJ/uZFT9s63DuizJwbou1luPsy33jbSbi6oo/oMDQPPjqM
	xq44=
X-Received: by 2002:a17:907:c007:b0:c15:dcc6:d06d with SMTP id
 a640c23a62f3a-c1fe7d11095mr1281460266b.0.1785838321130; Tue, 04 Aug 2026
 03:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
 <20260605-exynos-pmu-cpuhp-idle-fixes-v1-3-0cd05c81a82d@linaro.org>
 <CADrjBPq4fou5KWh4T=oNkUVPz5Jk-821OVe3j5sWrKnCtHYM6w@mail.gmail.com>
 <DJ5GP6VQJDHL.2V30K56ME95DO@linaro.org> <CADrjBPqF6GPRLNUZtzkGUHTUQ6NOPoaRvVvF1mUUj_DJ9As1dg@mail.gmail.com>
 <DJFT3TXC0OJA.1ZK17YA2RSQXK@linaro.org> <CADrjBPovA8Kpzjqwr5w0UvqYhpdGyBwpv=xkBLcGGuwZZoocPg@mail.gmail.com>
 <DK00H7RT3OUP.6XS03TKMIU34@linaro.org>
In-Reply-To: <DK00H7RT3OUP.6XS03TKMIU34@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 11:11:49 +0100
X-Gm-Features: AUfX_mz5t_Pe04iy5Urjl5FLntfM2UaJUBsRQk-xp7uJxfwmN41IPr1rHKikzkY
Message-ID: <CADrjBPpk1beXfAJ7uhKHwYKo1wDPg+qxwfc-PQgZL6dcAN1CDA@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_031204_020993_67FF1FF4 
X-CRM114-Status: GOOD (  48.03  )
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

Apologies, I've been on vacation 2 of the last 3 weeks, but I thought
we had this all sorted.

On Thu, 16 Jul 2026 at 13:57, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Hi Peter,
>
> On Mon Jun 22, 2026 at 9:43 PM BST, Peter Griffin wrote:
> > Hi Alexey,
> >
> > On Mon, 22 Jun 2026 at 19:57, Alexey Klimov <alexey.klimov@linaro.org> wrote:
> > [..]
> >> >> >
> >> >> > I originally made the failure non-fatal because the system still boots
> >> >> > without the notifiers registered (and all other Arm64 Exynos SoCs
> >> >> > upstream don't register notifiers and AFAICT have broken cpu hotplug
> >> >> > and cpu idle).
> >> >> >
> >> >> > In hindsight, that seems like a mistake. I think your patch to fully
> >> >> > unwind everything in case of failure makes more sense.  See small
> >> >> > comment below about destroy_cpuhp_and_cpuidle()
> >> >>
> >> >> Wait, setup_cpuhp_and_cpuidle() should be non-fatal and shouldn't
> >> >> return any errors?
> >> >
> >> > I suggest you re-read my above comment above ^^
> >>
> >> Could you please clarify what specifically addresses my question about
> >> notifiers?
> >
> > Sure, I was referring to this part of my previous reply:
> >
> >> >> > In hindsight, that seems like a mistake. I think your patch to fully
> >> >> > unwind everything in case of failure makes more sense.
> >
> > [..]
> >>
> >> If c2 idles are used during reboot/shutdown then they fail or what?
> >
> > This followed similar logic to the Samsung downstream kernel drivers.
> > I have no extra information about it beyond the downstream kernel
> > source. It seemed reasonable though that CPU's will be hotplugged
> > during suspend and reboot so you may wish to ignore these.
> >
> > The proper solution of course is a fully PSCI compliant firmware,
> > which doesn't require these side channel hints.
>
> It seems there is some misunderstanding, where we are not getting to the
> point.

From my point of view your proposed patch looks good, as I mentioned
in my earlier replies. The only reason for not sending a reviewed-by
tag was the outstanding piece of feedback regarding only calling
destroy_cpuhp_and_cpuidle() for platforms that called
setup_cpuhp_and_cpuidle(). Currently it is only gs101 that calls
setup_cpuhp_and_cpuidle() but in your patch you call
destroy_cpuhp_and_cpuidle() unconditionally. Will that cause issues
for other SoCs?

> I think I still do not see any comment about failed notifiers
> and question about c2 idle states is kinda misdirected.
> I also don't see any answers that clarify this from previous emails:

As I understand it your proposed patch fixes all the issues you are
asking questions about? Is there some outstanding point that your
patch hasn't already addressed?

>
> >Why do we need to have notifiers (say cpu_pm_register_notifier())
> >registered if, for instance, cpuhp_setup_state() fails?
>
> Let's jump to the details then to move it forward somewhere.
>
> If one of the cpuhp_setup_state() fails and in the current sources
> (without this patch) we don't check if it succeeds or not we may not
> have properly working hotplug notifiers =>
> {set,clear}_bit(cpu, pmu_context->in_cpuhp) may not be updated
> correctly.
>
> The if-check logic in cpuidle callback:
>
>         if (test_bit(cpu, pmu_context->in_cpuhp)) {
>                 raw_spin_unlock(&pmu_context->cpupm_lock);
>                 return NOTIFY_BAD;
>         }
>
> relies on that and may not work reliably. As a result c2 idle states
> may stop working or offlined CPU may be put into c2 idle state.
>
> Going further, if register_reboot_notifier() fails and we don't
> check its return value then
>
>         /* Ignore CPU_PM_ENTER event in reboot or suspend sequence. */
>         if (pmu_context->sys_insuspend || pmu_context->sys_inreboot) {
>                 raw_spin_unlock(&pmu_context->cpupm_lock);
>                 return NOTIFY_OK;
>         }
>
> a CPU can be put or at least attempted to be put into c2 idle state.
> That's why there was a question:
>
> >> If c2 idles are used during reboot/shutdown then they fail or what?
>
> If it is fine to use c2 idle states during power off or reboot,
> then why the code blocks them during power off/reboot?
>
> >> I am not saying that patch is correct and some rework is needed but I don't
> >> get why we should completely ignore errors from hotplug states registration
> >> and should not check registration of notifiers. At least warning should be
> >> shown to user that pm functionality might be unreliable.
> >
> > As mentioned above, and in my previous reply, I think your proposed
> > patch is a good idea.
>
> You mentioned, so far as I understood your replies, that _only_
> destroy_cpuhp_and_cpuidle() is useful and setup_cpuhp_and_cpuidle()
> should be non-fatal.

I don't know how you reached that conclusion from my replies, as I
never said either of those things. The only outstanding point for me
in your patch was about calling destroy_cpuhp_and_cpuidle()
unconditionally for platforms that never called
setup_cpuhp_and_cpuidle(). I was expecting either a new version or
some justification as to why that's OK.

Peter

