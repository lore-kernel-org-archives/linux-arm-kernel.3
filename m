Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E8AC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 16:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlZgkHsxN8ZXtcGrfVzgc7A5zah0HXAJABQ2cFxyfyc=; b=PU/wcT3Fpm3xT7DeZtKYzoGvss
	ovw0DO3MhDwWxxC256D4y5KBHdYbLnk2R9NOeydV8OanmTE4o7JTxq72HazZvdVbE4PD7P3C0mcvD
	1VJCwTQQhxE/YtzCOmr2C/GCyfqb6WTe96y6J/YtZHdFWZryWYzVHOky0YS+Q5sf4a4PwWcg6IYmc
	RRHk5f8BjgrlOyrAVf81uxLHLDdGEUTDhj+eRRGBS6dPqBEDQeQ+mRdJlFBYGUBIIfzGONbRHhXGn
	uy1luViF3gMCh679qB7s0Z5m4um5+7MaVXdn9pTkQAEnlZqtn9ZyDayvejOrJZQ0X7l2taaG7BS6N
	eFwvhiNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuB5-0000000CSId-1NtZ;
	Thu, 10 Jul 2025 16:31:19 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsSu-0000000C9Ik-39KY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 14:41:38 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-717b580ff2aso10234497b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752158496; x=1752763296; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlZgkHsxN8ZXtcGrfVzgc7A5zah0HXAJABQ2cFxyfyc=;
        b=UhMOw9A69W2cPmzgt06BW+M3T5ybqqplhrN4Cz6BJ+A5e2V9FqbGS/xWiVMPVUAX/U
         w/M0a5In60YQXGlBkan5LF+znm6dIBAhJwAMcfhMpALkIHpJkyVTPaeOQKxZAuEVz8x0
         +4xVtF/2q4pNydowreeWl/JZuQbBdLbJ4yCbcokA91k3Ik+DcD9zQpYD6mc3rS3lgUtR
         jzRlTtiAsYc+Ivs67JnDSuPPhcWbWLlzOooNojcZhSbS0+kxYVfUSe01kL21T/jOxypm
         44vj1wAVUjZnfyK6/0f+lqtH3wga6SvJygx6uaAXYkr63BfbsdQ6eUqTiL4j8oBQNfnR
         FtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752158496; x=1752763296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IlZgkHsxN8ZXtcGrfVzgc7A5zah0HXAJABQ2cFxyfyc=;
        b=jk/l/b0/Kg5C8vs9luU9hDu+O0rwo9Fv8mjD69hVqPpb5PGawzLen4uDIAsiFd3da/
         RoCYttfmUhXlix4+TTCfL6RCQoHQbuwEPGVqO3R5MZR1Tk2q7Puf2RVpefDwD9Y2XpZv
         pBfxqvPZ8Q/MJXXtgwqyHNKtCZsWX0ffJwI8y0Mut6zzbA3OEe0An3T7Htn4OLkonnHX
         6wpwuHgF38X9UChP7zv6LqEIFj4b4MphUxmBkXfQz2EDv+fsSx1tPSletB28pZh6rFqY
         E7xfuN2MmHGSxNm04yLESrW027BbBJxzN5fSZhZmLrgDVJXZE6zcok1G8+V+CqGnLuyG
         0q6g==
X-Forwarded-Encrypted: i=1; AJvYcCXK3NPlsS81QGkM2YFonJTfdVpfSpp5ieDhCcDWd5zgkJozOqGsxByWteIu+h/d92JsH86rO1f9IJcC2/ZaJwID@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh8Mn6fY2QLwTg81hx14B0JVQZ97E8NbQoFKGN7NH/sMPGzPLe
	hP8WfMEHKW+76OGxDS/NfiJPjxY1wGodAbUzpTIx0EB+fL7eZOPO+zwO3E5ZASuugA7yc3xfefO
	y0k249ZITayS+edNhbOij0ofbaI7bAALI+7Ia7+VNYg==
X-Gm-Gg: ASbGncvZjn8XyiibRT7Tmpcdi0M86dV1N4ntmlOlVlkSDhPdEvCj8fO8HDXb1X6174V
	YhOTeQohoEcP5TtWJRD88gKhvdmYwKf8tTOo4m0E+Gv0YbtmLT06iZRwQ3KSs9pxkafLvuBuV4Q
	zs8lGJM+9dmoTtRU54mTEvlUKttO3MMZpTUezfRcpCaPY=
X-Google-Smtp-Source: AGHT+IHVD6gPsHq+Dexvu9tOsagl+k20PpDSEAg/CCtZ6R9oh9y4FIYINC4cgMj3d0zJYPGC/y7DQa6nR8qkXx9Q06g=
X-Received: by 2002:a05:690c:d90:b0:6fb:b8a1:d3bb with SMTP id
 00721157ae682-717b19cb233mr100039137b3.17.1752158495634; Thu, 10 Jul 2025
 07:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250709154728.733920-1-daniel.lezcano@linaro.org>
 <CAJZ5v0ixk5hZPPQc_1rDLMTzjh=KpMQF_A2U=HehMTuNSMQwtQ@mail.gmail.com> <aG-40INpi05v3-fQ@bogus>
In-Reply-To: <aG-40INpi05v3-fQ@bogus>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 10 Jul 2025 16:40:59 +0200
X-Gm-Features: Ac12FXw291rGaeQnkKGBJOE99wWaDDVeGF-LGyRZrV90PjOPwqUc_kzJDb-fgDQ
Message-ID: <CAPDyKFqS9fawvgxEhk9W=o3oUpA_HGc71-5siw8AGqenQegrLA@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: psci: Fix cpuhotplug routine with PREEMPT_RT=y
To: Sudeep Holla <sudeep.holla@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, 
	linux-rt-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Raghavendra Kakarla <quic_rkakarla@quicinc.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	"open list:Real-time Linux (PREEMPT_RT)" <linux-rt-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_074136_794686_4FADBDC9 
X-CRM114-Status: GOOD (  21.07  )
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

On Thu, 10 Jul 2025 at 14:57, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Thu, Jul 10, 2025 at 02:43:10PM +0200, Rafael J. Wysocki wrote:
> > On Wed, Jul 9, 2025 at 5:47=E2=80=AFPM Daniel Lezcano <daniel.lezcano@l=
inaro.org> wrote:
> > >
> > > Currently cpu hotplug with the PREEMPT_RT option set in the kernel is
> > > not supported because the underlying generic power domain functions
> > > used in the cpu hotplug callbacks are incompatible from a lock point
> > > of view. This situation prevents the suspend to idle to reach the
> > > deepest idle state for the "cluster" as identified in the
> > > undermentioned commit.
> > >
> > > Use the compatible ones when PREEMPT_RT is enabled and remove the
> > > boolean disabling the hotplug callbacks with this option.
> > >
> > > With this change the platform can reach the deepest idle state
> > > allowing at suspend time to consume less power.
> > >
> > > Tested-on Lenovo T14s with the following script:
> > >
> > > echo 0 > /sys/devices/system/cpu/cpu3/online
> > > BEFORE=3D$(cat /sys/kernel/debug/pm_genpd/power-domain-cpu-cluster0/i=
dle_states | grep S0 | awk '{ print $3 }') ;
> > > rtcwake -s 1 -m mem;
> > > AFTER=3D$(cat /sys/kernel/debug/pm_genpd/power-domain-cpu-cluster0/id=
le_states | grep S0 | awk '{ print $3 }');
> > > if [ $BEFORE -lt $AFTER ]; then
> > >     echo "Test successful"
> > > else
> > >     echo "Test failed"
> > > fi
> > > echo 1 > /sys/devices/system/cpu/cpu3/online
> > >
> > > Fixes: 1c4b2932bd62 ("cpuidle: psci: Enable the hierarchical topology=
 for s2idle on PREEMPT_RT")
> > > Cc: Raghavendra Kakarla <quic_rkakarla@quicinc.com>
> > > Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> >
> > As per MAINTAINERS, this is for Ulf/Sudeep.
> >
>
> LGTM, so
>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
>
> I still prefer to hear from Ulf who has more knowledge and hands-on exper=
ience
> with s2idle + PREEMPT_RT in case I am missing something.

Rafael, Sudeep,

I will pick this patch via my pmdomain tree, but will run some tests
of it first to be sure.

Kind regards
Uffe

