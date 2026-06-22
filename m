Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934F9CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 18:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brZs3+MH5gJMBhPZfGjHt4FXO3H2ccunenuS6LTLrkg=; b=kCGw02UH8mATJFL4+nH7clVPUy
	Cy2D+1/4IiK8hKzWSkp3Faz1BvMo61eQFLcUHV+sUxPlqOYttGW1hy6D/odKhEUtmgFg8X2joxj9M
	LfP0uKRbkdV9JDRAPMP+wQYPpdJolxsa4vza9pGwJLHdQ0I+lJR+4nfhDcuJW3DiGRxuFJem8sfWm
	fxxs9ZRVmGjwWfpTxOUk6/UtI8fYWuTcLD7SmpHyUsOYHK9XlTP2xHH7FVMAc3bYOBJ/As5LL8Sqv
	lUSf8pk7+NEvclne1j2L9FFJpn6CeszRGfqaoEOHviCKmGumRu8tAE5NCJ2syiZo9f6iJMo1b+ScD
	p8j9+XNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbjqH-00000005K2t-2idC;
	Mon, 22 Jun 2026 18:57:57 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbjqF-00000005K2G-2yp6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 18:57:56 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4631679f204so113573f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 11:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782154673; x=1782759473; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brZs3+MH5gJMBhPZfGjHt4FXO3H2ccunenuS6LTLrkg=;
        b=F1KyqZQG/sGghaJvkYFLxQRd/UDOXkmD3fwub+w0d0humxC8GjVTTRdE7FJNfQi7ZI
         MrS78G4mmDUXkDxXN2H0pnnttl4mqnEjI3E5XA8DfYiD0C2IvCqJbWdPpOq9jOlHVW6r
         ZEGhS7oOBOwxtZKyf51wQohfRcJLXPzojPqrihsqb9DzPY5GZg8AD8l5O6L9vmX9sz7j
         Msvogn559GfP+cnpbsPcjThfVvvonoJJB11+oymz9rJl4OZ9cjQFPjQeamkby72Sg4lO
         Z9T+O324SW7BPDBuT9ulHoz7Lm9Rn/WFQvY/9Dxe49fLj5zyaGvtUtWBV2k6a5h+NA/W
         MPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154673; x=1782759473;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=brZs3+MH5gJMBhPZfGjHt4FXO3H2ccunenuS6LTLrkg=;
        b=WFOurVJu7sZlRkktYi/GQsuoPpibGCs8z8kUTQPzuYF5WsKHrWH0IBhpQKkPukHrBc
         J5yIl/u/SmTnaxI/MdzZMiLKEVgZVJAqeX2go3ES2OkFBboKBe2wEhLod+BO0xenQuPa
         nkSoaBhpNdyxdSdvMSDp/aVLPWb4Ka9PeHZtfAdfE0ciTKROSxqhVcCr82wOQO6OgtR5
         fnYnFU+73c9FpUYL9kMFWTOoYRzjxCIkrfTB9Pa9K/hE/2ar011z5okrDtQdax72edi2
         1mAmFIjkuvAlxIkilfYfJD8Q2jev5cDab6UsiabAKFJLjm7jenDw7fRgcMwndCp/RIrL
         uFqw==
X-Forwarded-Encrypted: i=1; AHgh+Rqm9zXPKYTfK2BziQZYeioZGS4vlE5IecDMXtvOldJq6amiNTqIgcDZX8FkIpv+FLtwxl4zj2IVLRXsu3nybBo/@lists.infradead.org
X-Gm-Message-State: AOJu0YxlGW+Ll4OGGK8/tFTZbEWP7HrQk5UdJhe62IU/YiYsdinmEkKQ
	1tUIi98wNiLR+oMOHU0M51uIZ01DwPOWQOHZlw+gNPVflpLIroEfJ40rc8SPoZ1kgv8=
X-Gm-Gg: AfdE7cnQVcNEj0oEbfuY2SJNC2dXBI4JxpoKuNDPLBry//4Ky/2LA8SZMDoogKCdqoN
	Kix0f5Pboen0jP+rH7/0tLTbwSfOvZtaM/tDHOjqq/6Upa7OLM6CXC2X94yEp4GMMf3f6cH0b6+
	LC1cSl4zH+79otCW7yPVIU68F/nurTx9UldJyqH8nWwyshzr+PHAg2oXdOAoixJyoyIzKOF5wDg
	Gol0EHsA/D0jM1RKjeLN66ZZsERuE6W+HaxH542T9felM1Uksx8t6NANSOYktjNxCFLRiccdOsq
	TQgzo9vIU78uZR/H2VC7eOHY/88oBcctrwc8hXttp9CEnsVXoK20BXVfBBaUshCTXR8PWTrNILo
	thAyD69heCsnYf9KwVdfCD7wbeAkDYzLB4qwvt97/RQjG8FUvr9f6g1hFKKS28ZAGsPmfG30aOT
	wXTmOAA2B4EiuaDTNaIfsbnmAHy23WrXshJu1qwC2SEwrjFFF+VL19E+9LE5Sy4ifxLaKKeFu38
	kt2ZaI1w/9/
X-Received: by 2002:a05:6000:220b:b0:46a:6474:839e with SMTP id ffacd0b85a97d-46a7e9f3eb8mr1087064f8f.4.1782154673472;
        Mon, 22 Jun 2026 11:57:53 -0700 (PDT)
Received: from localhost ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5413sm29609719f8f.11.2026.06.22.11.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 11:57:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 19:57:52 +0100
Message-Id: <DJFT3TXC0OJA.1ZK17YA2RSQXK@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH 3/3] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org> <20260605-exynos-pmu-cpuhp-idle-fixes-v1-3-0cd05c81a82d@linaro.org> <CADrjBPq4fou5KWh4T=oNkUVPz5Jk-821OVe3j5sWrKnCtHYM6w@mail.gmail.com> <DJ5GP6VQJDHL.2V30K56ME95DO@linaro.org> <CADrjBPqF6GPRLNUZtzkGUHTUQ6NOPoaRvVvF1mUUj_DJ9As1dg@mail.gmail.com>
In-Reply-To: <CADrjBPqF6GPRLNUZtzkGUHTUQ6NOPoaRvVvF1mUUj_DJ9As1dg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_115755_787254_03BAB850 
X-CRM114-Status: GOOD (  21.20  )
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

Hi Peter,

On Thu Jun 11, 2026 at 8:07 AM BST, Peter Griffin wrote:
> Hi Alexey,
>
> On Wed, 10 Jun 2026 at 16:07, Alexey Klimov <alexey.klimov@linaro.org> wr=
ote:
>>
>> On Wed Jun 10, 2026 at 2:34 PM BST, Peter Griffin wrote:
>> > Hi Alexey,
>>
>> Hi Peter,
>>
>> > Thanks for your patch!
>> >
>> > On Fri, 5 Jun 2026 at 21:19, Alexey Klimov <alexey.klimov@linaro.org> =
wrote:
>> >>
>> >> The setup_cpuhp_and_cpuidle() initialisation sequence currently ignor=
es
>> >> the return values of cpuhp_setup_state(), cpu_pm_register_notifier(),=
 and
>> >> register_reboot_notifier(). If any of these registrations fail during
>> >> probe() routine, the driver returns 0, leaving the driver partially
>> >> configured.
>> >
>> > I originally made the failure non-fatal because the system still boots
>> > without the notifiers registered (and all other Arm64 Exynos SoCs
>> > upstream don't register notifiers and AFAICT have broken cpu hotplug
>> > and cpu idle).
>> >
>> > In hindsight, that seems like a mistake. I think your patch to fully
>> > unwind everything in case of failure makes more sense.  See small
>> > comment below about destroy_cpuhp_and_cpuidle()
>>
>> Wait, setup_cpuhp_and_cpuidle() should be non-fatal and shouldn't
>> return any errors?
>
> I suggest you re-read my above comment above ^^

Could you please clarify what specifically addresses my question about
notifiers?

Looking further into this, it seems that, for instance, if one of the
hotplug states fails to register then tracking of pmu_context->in_cpuhp
becomes broken.
If reboot notifier silently fails to be registered, then it is unclear how
this from gs101_cpu_pmu_offline() supposed to work:

/* Ignore CPU_PM_ENTER event in reboot or suspend sequence. */
if (pmu_context->sys_insuspend || pmu_context->sys_inreboot) {
	raw_spin_unlock(&pmu_context->cpupm_lock);
	return NOTIFY_OK;
}

If c2 idles are used during reboot/shutdown then they fail or what?

I am not saying that patch is correct and some rework is needed but I don't
get why we should completely ignore errors from hotplug states registration
and should not check registration of notifiers. At least warning should be
shown to user that pm functionality might be unreliable.

Best regards,
Alexey.


