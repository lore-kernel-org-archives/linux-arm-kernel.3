Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F49D42BBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 18:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLfb7kUGJLjR3dpRxNjHUX8zNIZ2DpFKhaioXvi+P10=; b=t75IoqZ9HeDFpC+q0HHbyzwCC/
	TQ5fDwztipOQAT2iHf9qlYW5a+0+EC3HSQ9M9Z5fgSRHzlN2Yw9dqbNB92CeIL/GOhCItZinoaZwJ
	hx5kdDsNILkK3V58KyupkFtsyDc+AMWFUOnnnGqC4cI+86lV2MKEsmrMX4DmFcyF3H6MBBxLo27MM
	6JTXCT5Ffzvt+p0F1TWudGH+tG0XxizUKngPKr4+e0abRL4rjHMBkaXfShE+iHGmJGnMFNFIcN84J
	OTRLLtqjnk+zomeW5+JMc86WyML7Oag/dofvMiVMw3AMIi4Vd8vadCspt9DfnGG2RUHh5mV6mj20P
	INee7mXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAw3S-00000004d5D-2qoI;
	Tue, 12 Nov 2024 18:55:58 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvwL-00000004bxT-0fSh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 18:48:39 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-6e5cec98cceso47332157b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 10:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731437316; x=1732042116; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vLfb7kUGJLjR3dpRxNjHUX8zNIZ2DpFKhaioXvi+P10=;
        b=HRGOCvig5ZIASkP6qg/B/w8ZJbCOHh3QbyR0lwf8/Zz0EqT+1u2jS8jm8DpYMRPjMO
         f9njzNuKc4wwHKiqcqcXxOyWos7q4UvbpdrLJ+lLL5JKfoOj2AKuTq86YUTVisDfHiwO
         W7FhvxEwP7w8XL672pCTPCr8OIoC3TicC6XWEVPdo18xSaTgfMS/LyrOPPC3keqtUsCN
         R07ZZQ/0MYmOfT3zwztkGPFj+gNDRVpATxrR6dEiSuSPtM7BfyHiX+/0bp3xpkYyawye
         cy6Lo8qqYD1s3AOCpXl9u8WqNupfZNGK0Woero55e6QJu4PHVaUGZWi8ic57wf1Ay3gm
         WmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731437316; x=1732042116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLfb7kUGJLjR3dpRxNjHUX8zNIZ2DpFKhaioXvi+P10=;
        b=WDklY31KwyYo8Z3VHFRQFxbRWP1wfV2lJv8u406MCMzlG5I016u0WDQiVSX/TlNEAb
         U+b2ZSWpPI9O+q9IFPIkT1PdLUFgk9BVHWlxEVPF2OGb5NRNKv54Ietl0ZFV2teHn4KP
         zNrVI8sMsVbsbqisszlsD8b4LbNWCmVhcCq2VEuKrqqsMijVC8N8N/EugqaxGT6qBFpR
         LYIDlFxU77krfhDcsT6S5apAovtSNpT/QVJqTUIVeo7jViOsWwsRmTcBY0ufDmIHXxxX
         Yo9d93DbzdQZjM/zQXXQsIC3iWEVIDsFrDvVTJYE32ThPeNqCmuUvmciSZdIutLweYa3
         ouew==
X-Forwarded-Encrypted: i=1; AJvYcCV5RQeAQYQcMGZMl58rT9R1I2zldnGIT4ZLwGoPo1a6eOe5TqG2P/SMplRxa5ccCmAXR4BTydCAtSm8RaXqFji5@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ+wEeISaz3BYMjw9vrk5E4UFn00Y24Nobb5/Vdhu7bQ0lFLW1
	AIaRK8LRYaFEeAoIZ4dOXOBpRRGkQOLvD5tpeprsU55XWdomR5X2ShyFJN/zdUjCMRCkK0Cl4l4
	e9jKCQD07zmt+PvDbx9uxYOyv2YCWgFfIm8TTfw==
X-Google-Smtp-Source: AGHT+IHU1F4In8hSy3BHO7PzehPnwak0Jka/B7VCySs0mHPl9uCBdzOrrdhGUm0wtjc2hrnl2RWBoqNBIdeikfPQLfY=
X-Received: by 2002:a05:690c:6d10:b0:6be:54e1:f1f3 with SMTP id
 00721157ae682-6ecb30a5145mr1527607b3.0.1731437315975; Tue, 12 Nov 2024
 10:48:35 -0800 (PST)
MIME-Version: 1.0
References: <20241030125512.2884761-1-quic_sibis@quicinc.com>
 <CAPDyKFoY8CnxF7JXzkT9_WXyM-TJhW4kmTw=H8NEzch32N1_7Q@mail.gmail.com>
 <ZyJeuVIbWkohymW5@pluto> <20241106071215.jhnzcn4vkdfr3peg@bogus>
 <CAPDyKFr-pmXEhgUgCapzQX3Hn_UAM632TaG8SdkQXaCn5-y42g@mail.gmail.com> <ZzOOPJ_gI9TGadzV@hovoldconsulting.com>
In-Reply-To: <ZzOOPJ_gI9TGadzV@hovoldconsulting.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 12 Nov 2024 19:48:00 +0100
Message-ID: <CAPDyKFqnnw1A+R_wohpV7orKV4oGJNyxD+QL667iWq9d_odmfw@mail.gmail.com>
Subject: Re: [PATCH V5 0/6] firmware: arm_scmi: Misc Fixes
To: Johan Hovold <johan@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, jassisinghbrar@gmail.com, 
	dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, konradybcio@kernel.org, 
	linux-pm@vger.kernel.org, tstrudel@google.com, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_104837_229476_747DCB80 
X-CRM114-Status: GOOD (  25.27  )
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

On Tue, 12 Nov 2024 at 18:20, Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Nov 12, 2024 at 04:56:26PM +0100, Ulf Hansson wrote:
> > On Wed, 6 Nov 2024 at 08:12, Sudeep Holla <sudeep.holla@arm.com> wrote:
> > > On Wed, Oct 30, 2024 at 04:28:41PM +0000, Cristian Marussi wrote:
> > > > On Wed, Oct 30, 2024 at 05:19:39PM +0100, Ulf Hansson wrote:
> > > > > On Wed, 30 Oct 2024 at 13:55, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> > > > > >
> > > > > > The series addresses the kernel warnings reported by Johan at [1] and are
> > > > > > are required to X1E cpufreq device tree changes to land.
> > > > > >
> > > > > > [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> > > > > >
> > > > > > Duplicate levels:
> > > > > > arm-scmi arm-scmi.0.auto: Level 2976000 Power 218062 Latency 30us Ifreq 2976000 Index 10
> > > > > > arm-scmi arm-scmi.0.auto: Level 3206400 Power 264356 Latency 30us Ifreq 3206400 Index 11
> > > > > > arm-scmi arm-scmi.0.auto: Level 3417600 Power 314966 Latency 30us Ifreq 3417600 Index 12
> > > > > > arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > > > > arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > > > > arm-scmi arm-scmi.0.auto: Level 4012800 Power 528848 Latency 30us Ifreq 4012800 Index 15
> > > > > >
> > > > > > ^^ exist because SCP reports duplicate values for the highest sustainable
> > > > > > freq for perf domains 1 and 2. These are the only freqs that appear as
> > > > > > duplicates and will be fixed with a firmware update. FWIW the warnings
> > > > > > that we are addressing in this series will also get fixed by a firmware
> > > > > > update but they still have to land for devices already out in the wild.
> > > > > >
> > > > > > V4:
> > > > > > * Rework debugfs node creation patch [Ulf/Dmitry]
> > > > > > * Reduce report level to dev_info and tag it with FW_BUG [Johan/Dmitry]
> > > > > > * Add cc stable and err logs to patch 1 commit message [Johan]
>
> > Sorry for the delay. I have picked up the remaining patches from this
> > series. All applied for fixes and by adding stable tags to them,
> > thanks!
>
> As I reported here:
>
>         https://lore.kernel.org/lkml/ZyTQ9QD1tEkhQ9eu@hovoldconsulting.com/
>
> I'm seeing a hard reset on the x1e80100 CRD and Lenovo ThinkPad T14s
> when accessing the cpufreq sysfs attributes.
>
> Sibi tracked it down to the first patch in this series ("firmware:
> arm_scmi: Ensure that the message-id supports fastchannel") and
> reverting that one indeed fixes the reset.
>
> Unfortunately this was only discussed on IRC and was never reported in
> this thread.
>
> Ulf, could you please drop the first patch again until we've figured out
> how best to handle this?

Done, thanks!

Kind regards
Uffe

