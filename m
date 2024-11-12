Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E3ED42BA2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 15:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvLeNnoi9Q/2tIEpsYYZ7QLjjHPm2C2yqmvXawnq7e4=; b=IYSIkKq9h1ZgBX6XWPGfkg+fec
	3/7EPfI+yPvTBM0HD0o6hfsN2PUoXGhvZYkt9GjmFaQi8hbfKXem+yiwD4jllFI7A2d2mYp7MSCY9
	AJ3B1VHYMR+1K7LNrSzs7ZSKh629R8UBIn5BOEMN8KR3ESqf6kaf4RKRSAzAQ1QxYpt6tsMVL/fFR
	dR76QKvAezgsMrBYmSiOHmVP+I3S2UctqbnFSne6f9qVjYOAt2MBmcnIF8r5CRCkvuQ8BfahHflcr
	dKtMO/2kg1+vjWXX4heOeYXoHqLd5HCVsR9m9pQ9EFJ280qyFRXK3TNMbad+2Jqs12+G23vrNhILg
	2q0z9B9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtIU-000000042qx-48Xv;
	Tue, 12 Nov 2024 15:59:18 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtGK-000000041xp-1Ds3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 15:57:06 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e30d212b6b1so5434872276.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 07:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731427022; x=1732031822; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LvLeNnoi9Q/2tIEpsYYZ7QLjjHPm2C2yqmvXawnq7e4=;
        b=V5sByrniUTQ/1fV7irS1zaZrtYkd2O2l9ZdBXl4GDv+HIDxBUcu9bkJp5z6k+s/7kB
         WeE9rLygu7/ynVigoy2Sg/45Df8GodNlHYlc00+YhJA1QROd2aLEckL3SFcq21Ke4/5h
         0D+Rr1Rh7Rcwh+AEdrNP1Ze2nloaLubRf35SC1CimgYH8LkTW8eNEBNdoVBlQK2il7xx
         PtcxICjttRkT+9KSYrPL/yjHOxDYroMrqJy5W14NlBj/K0BgtJa9eqR3g4N2TTVxDFlk
         zchsZy1RkC6ens7fhHMLLSAlgehyyYgydxekofxEqOY/HPTP8WBnhHn/tZga3nU3hX7k
         j1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731427022; x=1732031822;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvLeNnoi9Q/2tIEpsYYZ7QLjjHPm2C2yqmvXawnq7e4=;
        b=J1BnUFkd88uuh/dK0Ovh8BvtncFGyE67H2AfP8YQbVRfMiUI9A5JdUHXpRTC/NJain
         CPl7oIEnJ0Qacqu5i1iLVdgfTqDRh6Zl1wtBgBMDo1Uokh0RpWl6KLWDxtbB/cx2Xzx5
         BXhKZQzUl/lDnXo56pYusgA2Yu87Z6hnj9qAWV1QB7AqVokMEj8MBxY40SiLq/mzn8J+
         8ZFFUEx7vJ4geW2bLyB7AP0ePMVtKFmIAxy3lfNLg9tQhADrD5XqMt4SOCTv9Y3NLuFV
         DdzIQQpcXbMYC0HXLZJVS0S3LTR5exU7knn2c1X18XjMkEHFPlqLsYpW7HUptBN8ZnQr
         fLoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3q9ZsU3NEQ7YHyXnrh32CJPgBdtEa1Jp7ssDZkFmyxnJWFtvuL83vCkiInPVAbfRzZkP4L7pbnffxx3A4/bZu@lists.infradead.org
X-Gm-Message-State: AOJu0YxA58IYH70en6kc4cjsly7uf8PN1I6ejpPj/7ipVZJDp72eHYM9
	a7LBkjl/yXy6M48c0kUVTHTb9MTg/IWMQ4FgkXMTV2mluNW6eAjISPTxF+EVtPuULWHdPdS7lJT
	kDe1/jaDgPy07mrckFre/3DSB6M3RhP4Ec73B6A==
X-Google-Smtp-Source: AGHT+IH5CCJQlrbtWhzwNwEuVmBy3c+bpgonBaiqCiIcyBRut8a95C/Hq3VyL3SXBBf4iw9gPiN+f3nxmL1sUxWUun4=
X-Received: by 2002:a05:690c:c96:b0:6ea:85ee:b5d4 with SMTP id
 00721157ae682-6eaddd86d12mr164461237b3.6.1731427022576; Tue, 12 Nov 2024
 07:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20241030125512.2884761-1-quic_sibis@quicinc.com>
 <CAPDyKFoY8CnxF7JXzkT9_WXyM-TJhW4kmTw=H8NEzch32N1_7Q@mail.gmail.com>
 <ZyJeuVIbWkohymW5@pluto> <20241106071215.jhnzcn4vkdfr3peg@bogus>
In-Reply-To: <20241106071215.jhnzcn4vkdfr3peg@bogus>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 12 Nov 2024 16:56:26 +0100
Message-ID: <CAPDyKFr-pmXEhgUgCapzQX3Hn_UAM632TaG8SdkQXaCn5-y42g@mail.gmail.com>
Subject: Re: [PATCH V5 0/6] firmware: arm_scmi: Misc Fixes
To: Sudeep Holla <sudeep.holla@arm.com>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, johan@kernel.org, jassisinghbrar@gmail.com, 
	dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, konradybcio@kernel.org, 
	linux-pm@vger.kernel.org, tstrudel@google.com, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_075704_366616_6983A12D 
X-CRM114-Status: GOOD (  30.54  )
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

On Wed, 6 Nov 2024 at 08:12, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Wed, Oct 30, 2024 at 04:28:41PM +0000, Cristian Marussi wrote:
> > On Wed, Oct 30, 2024 at 05:19:39PM +0100, Ulf Hansson wrote:
> > > On Wed, 30 Oct 2024 at 13:55, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> > > >
> > > > The series addresses the kernel warnings reported by Johan at [1] and are
> > > > are required to X1E cpufreq device tree changes to land.
> > > >
> > > > [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> > > >
> > > > Duplicate levels:
> > > > arm-scmi arm-scmi.0.auto: Level 2976000 Power 218062 Latency 30us Ifreq 2976000 Index 10
> > > > arm-scmi arm-scmi.0.auto: Level 3206400 Power 264356 Latency 30us Ifreq 3206400 Index 11
> > > > arm-scmi arm-scmi.0.auto: Level 3417600 Power 314966 Latency 30us Ifreq 3417600 Index 12
> > > > arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > > arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > > arm-scmi arm-scmi.0.auto: Level 4012800 Power 528848 Latency 30us Ifreq 4012800 Index 15
> > > >
> > > > ^^ exist because SCP reports duplicate values for the highest sustainable
> > > > freq for perf domains 1 and 2. These are the only freqs that appear as
> > > > duplicates and will be fixed with a firmware update. FWIW the warnings
> > > > that we are addressing in this series will also get fixed by a firmware
> > > > update but they still have to land for devices already out in the wild.
> > > >
> > > > V4:
> > > > * Rework debugfs node creation patch [Ulf/Dmitry]
> > > > * Reduce report level to dev_info and tag it with FW_BUG [Johan/Dmitry]
> > > > * Add cc stable and err logs to patch 1 commit message [Johan]
> > >
> > > Patch4 and patch5 applied for fixes to my pmdomain tree - and by
> > > adding a stable tag to them, thanks!
> > >
> > > Potentially I could help to take the other patches too, to keep things
> > > together, but in that case I need confirmation that's okay to do so.
> >
> > SCMI patches in these series are all reviewed (all but one even by Sudeep)
> > so it is really up to Sudeep preference...(who is travelling now so it could
> > take a bit to reply)
>
> I have added my reviewed by now.
>
> > ...moreover I am not sure if the SCMI patches in this
> > series could end up with wome trivial conflicts against the scmi patches
> > already queued at
> >
> >       sudeep/for-next/scmi/updates
> >
> > (at least the perf related ones 2 and 3 probably not)
> >
>
> I did a quick check and no conflicts were observed. Let me know if you need
> a branch with first 3 patches, but I need to do that today or after Sunday
> as I will away from my computer for few more days again from tomorrow.
>
> Let me know ASAP.
>
> --
> Regards,
> Sudeep

Sorry for the delay. I have picked up the remaining patches from this
series. All applied for fixes and by adding stable tags to them,
thanks!

Kind regards
Uffe

