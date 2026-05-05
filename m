Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE01ACD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mx10RFm2VbKGi60P1ByLYAwwUUKZhzhPZIKANt76f2M=; b=gWdqiE6i+s35SrU4uGw1V1uIET
	MiQ/psIQ5Taxlh/KzuHZWX590lJ9Mx6XA72pOjEIQde5eLDNDEOJ9YyRishlFIQVePx/YLp3Khrod
	6d+o01N4yFv80CED/7TuytLqwI+FBewXjSwo9snxT0j4EaDm95ToI7LUoo2RYiCb4lOEvWVVyukBy
	RNAWDFMJ0yAMPfM7cVNZc3MsTrTAtiGMlw0q3GS+imMPMZMmRKY2ZXw1cm7YuAM1IiMm0fX6rXhEM
	MNn29bZFjUWhXsms0wft1KAumn+XiyBp1thZB8vth/enYDaLq/UNcMUGtaKXxODhGWuzgR8weJlfr
	nYZjstEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEiv-0000000G9TB-29qt;
	Tue, 05 May 2026 12:18:01 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEit-0000000G9SQ-0FHT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:18:00 +0000
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-62f33bad185so1315787137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 05:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983477; x=1778588277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mx10RFm2VbKGi60P1ByLYAwwUUKZhzhPZIKANt76f2M=;
        b=GDvxiBDFdbCQUzaOu6zUOL1tPdH71gjHqMHG2Szbzlun27V+jivH9XLBbwt4wlj/7g
         iZfDyxx8Wz42s66tXTGD6M1TMgLDSuFPos7Fk1Vkg8e0L7AnDHh8oXaUHe8Tl5eNHCMM
         9PCCLq6K9Xo+GYSDhPtaIh18axkgiZnxG/mrdr5myxXPsIiTwyv036SnN7QA1WtA7V1y
         2Jp3DYPCkF4MHcj7iqq/pZ//BZ7WkN71H/tcFuiUarR926sEbo3x8KzPvGCJvih6SDBY
         i9Y76cOZi87wwGR4Bv7UdGthCdUqI1NS+SEPgztUdpvm8BwxnlDCiNP2aEVkbF5ZYQHD
         ru4g==
X-Forwarded-Encrypted: i=1; AFNElJ+RDG7+gYJgI47Lb+o1DgeqdILxUAw1O6zfzvWh/tuaIZAvlCzhtXPt2DSU7iKzfA50TpBcv6xc8vZWyboXo0Jw@lists.infradead.org
X-Gm-Message-State: AOJu0YxUWjt6zGcS5iNzNLBK4rD0wbytv0CUZPxCKkyPAbjIQoIRRHgt
	Z2tqCMVedrZ9e/41TI7ZKtdBIwzumoSnhE/9iSzgjLe54BzB09EJXlwFSTS7ygpf
X-Gm-Gg: AeBDiesxd0RSADhezzgdexZWSlAcryOdE/LMIAg2GsThwzE8syzfcpr0AV89Ncgu36Q
	d5DrMALd5CowwT4u0OHIltdFjkJ3Qw/Vty62IUVxDi7I53s5t9PHCzR5qrTd4baeVJHoNh2Ok8D
	B/cbim0b+o3V13UAm5bI7/AIU3Dg0c/LUTCzNVuz+jvz0jw2h6W6ZQ9sTTyyVR5T9F7pzE1ZIGh
	bx2sqvGl+MQarjFcOx93NpnkG8BoT3RRQohH8sM7XzaqyEceh46zi8O5hHX82VQP8veRNVPbiQG
	fQAWTB1N7yel/YlkVECzvIhYAklbHJ1XnxFNfssiyP5NrvK1JLG8+pqd2nUNeuQPNkfTe058y81
	3nLBsG93la+U5mziSkL7KpVZGveogK8CWTr1LlXS+p1Ao/Dbb/v4Hau7q9rbY5Hy95bRboNhud8
	yCMYLEwjb1NGD+ZYneIw4NEn71z8LyjMevYE+T3LmpRhvG6LPgzjl0J7hpdlWc424gV6PVATm9Y
	4U=
X-Received: by 2002:a05:6102:2912:b0:62f:3abe:907f with SMTP id ada2fe7eead31-62f5903ac4bmr1439120137.4.1777983477392;
        Tue, 05 May 2026 05:17:57 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62bfbb75140sm7011421137.5.2026.05.05.05.17.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 05:17:56 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso5278564e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 05:17:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Wap90JuiiThGiwiooHMJycGSIlDDdnqyNpeKOKuvg27t2ZyDNRZW2z4jjTIlwNi0x1UD/xSDOwyU7cu3/0mmh@lists.infradead.org
X-Received: by 2002:a05:6122:3c44:b0:56f:7c7e:f33a with SMTP id
 71dfb90a1353d-57547fd53a0mr1268108e0c.0.1777983476537; Tue, 05 May 2026
 05:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260428201522.903875-1-cristian.marussi@arm.com> <20260428201522.903875-5-cristian.marussi@arm.com>
In-Reply-To: <20260428201522.903875-5-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 May 2026 14:17:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUF1dW0hR-UZMVVqTnpWbMcv1D41jfL_4rEj6Vzj9wGSg@mail.gmail.com>
X-Gm-Features: AVHnY4JwQvUlXCNsMN5caeA9aMIeCzl1Epu5sphmxX2UtNuOS2ulpV9OaCHfntE
Message-ID: <CAMuHMdUF1dW0hR-UZMVVqTnpWbMcv1D41jfL_4rEj6Vzj9wGSg@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] firmware: arm_scmi: Simplify clock rates exposed interface
To: Cristian Marussi <cristian.marussi@arm.com>, sudeep.holla@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com, 
	james.quinlan@broadcom.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, 
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com, michal.simek@amd.com, 
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_051759_132619_F499F070 
X-CRM114-Status: GOOD (  24.03  )
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

Hi Cristian, Sudeep,

On Tue, 28 Apr 2026 at 22:16, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Introduce a new internal struct scmi_clock_desc so as to be able to hide,
> in the future, some of the needlessly public fields currently kept inside
> scmi_clock_info, while keeping exposed only the two new min_rate and
> max_rate fields for each clock.
>
> No functional change.
>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch, which is now commit 83fd9d34b6b75be5 ("firmware:
arm_scmi: Simplify clock rates exposed interface") in scmi/for-linux-next.

> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c

> @@ -457,14 +466,14 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
>         flags = le32_to_cpu(r->num_rates_flags);
>         st->num_remaining = NUM_REMAINING(flags);
>         st->num_returned = NUM_RETURNED(flags);
> -       p->clk->rate_discrete = RATE_DISCRETE(flags);

This removes the last setter of scmi_clock_info.rate_discrete.
However, it is still used until the next commit cd73d1bfaa8d34bb
("clk: scmi: Use new simplified per-clock rate properties").
V2 did now have this issue, as the patches were ordered differently
in that series.

After both commits, there are no more users of
scmi_clock_info.rate_discrete, so it can be removed.

> +       p->clkd->rate_discrete = RATE_DISCRETE(flags);
>
>         /* Warn about out of spec replies ... */
> -       if (!p->clk->rate_discrete &&
> +       if (!p->clkd->rate_discrete &&
>             (st->num_returned != 3 || st->num_remaining != 0)) {
>                 dev_warn(p->dev,
>                          "Out-of-spec CLOCK_DESCRIBE_RATES reply for %s - returned:%d remaining:%d rx_len:%zd\n",
> -                        p->clk->name, st->num_returned, st->num_remaining,
> +                        p->clkd->info.name, st->num_returned, st->num_remaining,
>                          st->rx_len);
>
>                 SCMI_QUIRK(clock_rates_triplet_out_of_spec,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

