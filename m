Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC114C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Q7bxwJNCvq8bg2MwJK2kdA3pNJuhT9mZBUaAlfBwAA=; b=T1uR/PnbNrgMiMXJdWU/WN3B7Z
	tlr4oJyhAgG4cedKrrmqt1I+3Cy86zIc+MJUxGSprqgEhlqZwMPmpCC4zrwQqLZ1GYtxVNGN5MdOu
	bOG5vTckFn5JzmodqVTeelF39TRUR8Dgy9PyFbfOyja11Jrq/r7873Mz1xi1TsPT/OoqHg6ZL93vU
	0tKt1eNqcMDsdjTyysXV23BzkLzX+s35RY1A/L7gYtMK705cSXjV4qw3TRKroZ0SAQj0KQL7gOebW
	ftTKQIwq7TUpiR7ePWG6OCYPtgYqJRfXfafEJeIgQJgMSGWjjf7Vv/6DcOlMVA+MrtVYHAYz9WM3i
	PzmfIFkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2A9x-00000004RCQ-2XCC;
	Tue, 08 Apr 2025 14:42:41 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2A5l-00000004Q9V-1Ufs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 14:38:22 +0000
Received: by mail-lj1-x242.google.com with SMTP id 38308e7fff4ca-3061513d353so62999321fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 07:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744123099; x=1744727899; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Q7bxwJNCvq8bg2MwJK2kdA3pNJuhT9mZBUaAlfBwAA=;
        b=CprqC1kseauXrkxguag/QHwQ91mM9S73Elv9avoIGbnxn8zL7cs0E8yXd+RZcJ3J0p
         QkNAl6IitlkpcP078F9yoCDXaYqFDpZRQHG+b4T6ylj8pDsvHUa2RNOv7cUqBg3xD6O/
         H4azvgyTaSiB3gdlQ7DZ2u6XD1KaVGCF0fDdgVbQs9UWol3n+dIgVwQT5r6k/lMIXXuM
         2y2HMUk1q0yZFxNf8Ke4t/KiU4KsHBM6zxLUzrmI9ETr4Fopynu5YnzoVvU496JwFmUx
         yIBIxd0LQTwYDvCrU5VYJfsYus5f4Fr7QsBfqS4LbRnVy6+d7mqpVw8xIklXv2bRXQnd
         /lHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744123099; x=1744727899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Q7bxwJNCvq8bg2MwJK2kdA3pNJuhT9mZBUaAlfBwAA=;
        b=HLof2DpMxEz+BKtJFtWj8td0tWNKPVfCF5lXEYpS57vx8d9fWjJ6IP754LVmY/2k39
         7aVp1DBYLr3KUSe38NnR1EjqU3trZu4tw0/4mXT2LUMV8R6vyfsi11aj35V0i8o+5HiK
         h79Nf+C+vZjqcJZUcRpssR9+ElmLhkOWduAPq5YgC+XTX+5NSVniOoQk0ViGWLPGlKns
         zRAuITpmpqP3Ary0zSF4Luy8pIEp7WslWgD0lbFRlumCpi4ZO7WheiQplaUbt51G23n3
         ktgJTiK2cTDlj7rbKXRwTDY3UVfZmD7FLgm6rVTayoQykWvzeyOvIa57N7OXIVrNhIKN
         L7WA==
X-Forwarded-Encrypted: i=1; AJvYcCVtm0h8xLPku8heCbs52i7m87OUfERsFPcxJHo5vlMKQjYwpF6LrlAdxTXNu4RmX22OXRVHaeKAYRTkDP1/jG+G@lists.infradead.org
X-Gm-Message-State: AOJu0YxD2rv1lbVyWrxXZ7w00l46f+7sHWEuz5NOY272zyuMu/F8gYyS
	0bMRchwlTgxSRUNDcy7oNb4iNDPNoYFut3AVd9kU63H9wY4jx7rCTGki+8l+c0dbdCm/L9245fK
	nczXo3pMnfOBmmtJZebmyqDplql8=
X-Gm-Gg: ASbGncvjWKUA1z3zpVQ4w/z+YDD3fLYCEOSs/3uWkqbQnabtsmGNwP3oV9chuJ3ZLvJ
	RoU9tG4Kf8mEQ4indus9MjAFct+matBUJZIpTgk1Bv4Kv5anVElHwrg5Oc2UV9L8c20yCkzkHJD
	tfXk9F6dRN8Ljroor8bxXsYncI1w==
X-Google-Smtp-Source: AGHT+IHU10fpaX9Y+BK0PT1SISRH+YFkz7nb8FFJqSdolPlNMzG1qkWD7zj329MmOVdStqbKBKnJK+oXqDOOT6sYTtk=
X-Received: by 2002:a05:651c:1442:b0:30c:6f3a:dce9 with SMTP id
 38308e7fff4ca-30f1650c370mr35717131fa.10.1744123098278; Tue, 08 Apr 2025
 07:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250405055447.73925-1-bsdhenrymartin@gmail.com>
 <20250407-wondrous-turtle-of-foundation-e92250@sudeepholla> <20250408055505.oked4a3drsym46wz@vireshk-i7>
In-Reply-To: <20250408055505.oked4a3drsym46wz@vireshk-i7>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Tue, 8 Apr 2025 22:38:07 +0800
X-Gm-Features: ATxdqUGy8OGeNNfaWbovLbK4n8MBpz3d2_OV8hx-iHgIR4LNXqu-6gTdwL3S9-4
Message-ID: <CAEnQdOo8CUe5Xpdo=qkCtv-E9gs-BvxUAgVa1Hvptp-2iFX0_w@mail.gmail.com>
Subject: Re: [PATCH v1] cpufreq: scmi: Fix null-ptr-deref in scmi_cpufreq_get_rate()
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, cristian.marussi@arm.com, rafael@kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_073821_391105_BB4CFB2D 
X-CRM114-Status: GOOD (  22.54  )
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

> How about `if (unlikely(!policy))` instead ?
Agreed, unlikely() makes sense here since the NULL check is for an
exceptional case.
I'll update all relevant patches accordingly.

> Henry, this change applies to all the patches you have sent. Also please =
send
> them as a single series, as they are related changes.
Noted. I=E2=80=99ll consolidate the patches into a single series with a pro=
per
cover letter and
resend them shortly.

Viresh Kumar <viresh.kumar@linaro.org> =E4=BA=8E2025=E5=B9=B44=E6=9C=888=E6=
=97=A5=E5=91=A8=E4=BA=8C 13:55=E5=86=99=E9=81=93=EF=BC=9A
>
> On 07-04-25, 12:30, Sudeep Holla wrote:
> > On Sat, Apr 05, 2025 at 01:54:47PM +0800, Henry Martin wrote:
> > > cpufreq_cpu_get_raw() can return NULL when the target CPU is not pres=
ent
> > > in the policy->cpus mask. scmi_cpufreq_get_rate() does not check for
> > > this case, which results in a NULL pointer dereference.
> > >
> > > Add NULL check after cpufreq_cpu_get_raw() to prevent this issue.
> > >
> > > Fixes: 99d6bdf33877 ("cpufreq: add support for CPU DVFS based on SCMI=
 message protocol")
> > > Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> > > ---
> > >  drivers/cpufreq/scmi-cpufreq.c | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cp=
ufreq.c
> > > index c310aeebc8f3..c735f39245bf 100644
> > > --- a/drivers/cpufreq/scmi-cpufreq.c
> > > +++ b/drivers/cpufreq/scmi-cpufreq.c
> > > @@ -37,11 +37,17 @@ static struct cpufreq_driver scmi_cpufreq_driver;
> > >
> > >  static unsigned int scmi_cpufreq_get_rate(unsigned int cpu)
> > >  {
> > > -   struct cpufreq_policy *policy =3D cpufreq_cpu_get_raw(cpu);
> > > -   struct scmi_data *priv =3D policy->driver_data;
> > > +   struct cpufreq_policy *policy;
> > > +   struct scmi_data *priv;
> > >     unsigned long rate;
> > >     int ret;
> > >
> > > +   policy =3D cpufreq_cpu_get_raw(cpu);
> > > +   if (!policy)
> >
> > How about `if (unlikely(!policy))` instead ?
>
> Henry, this change applies to all the patches you have sent. Also please =
send
> them as a single series, as they are related changes.
>
> --
> viresh

