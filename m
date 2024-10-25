Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5C6D0C5F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkf9nRBkB80Bq3MKpjBngWsWTtl6Rx4Rgdt86QJ7P7g=; b=XBPVlVonVm5OYg6zrK5iRKSyiw
	XxO8SE0za65RJ1J/NjVtZKWLb4m9dA5tUGBWvuEtr086uSxpoEvuqy3eVxZZhUpcXicKqmNuLwK5q
	4ko8/feiBu+fIREn8dloYsUMIw/YyVI0jyLalbPT3/eP+3tGXCqqBYQhD4Pj6McTZQJwQo3xeCMAU
	dNX6Uf9rw69+T3vVvV6KjEttOyeoNUZQWQWRYdN1kUbsWekf3jEp4nHHkniwC9QQmRZypI7ba68Ri
	btGsWyQ7wyVBsL6bB4DECbFgJeNWPlDhXbw4qglAx1VIoKYXR+Uwc/qqav8R4pU9QHWqvneqoIKaY
	4HLmSDNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HK1-00000003KeU-3UeW;
	Fri, 25 Oct 2024 10:13:35 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HIK-00000003KBD-3UGx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:11:50 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e2e2baf1087so2021653276.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 03:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729851107; x=1730455907; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pkf9nRBkB80Bq3MKpjBngWsWTtl6Rx4Rgdt86QJ7P7g=;
        b=r3W65zm/uDSEeC8gAIUansn0XhyvbLzcjoXTDZndCozMZLp5+7g7Bm3HsJF32ei1tE
         e+XbOq89VNz95Y6LXwasK98OUx6qzLdBwO6jcOvxBajYA3s43xQIyNq+VaKV5vdhYJWN
         jyvxnYiqn4yyjgLtmUb5mGMkrfBCWv1YAAibMYReuElSth5epLvQlfNBjqJFXYs1FaZY
         Qs7LaXAxknn2nW21n/Aa1VilZDnvmiG50GHmC0gqGowwAr70ty2aFYgiyhHhAbXMQ7/0
         /mhWuf+rDWo/5EQdQFZpXb4JwakSDk0SqWlMlZxDOMzaOtfb2yVeVSmatfUTP/3il5Vu
         tvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729851107; x=1730455907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkf9nRBkB80Bq3MKpjBngWsWTtl6Rx4Rgdt86QJ7P7g=;
        b=sHQ/mMgFUaCyGavo33Y/f60OeRmomGOqjQgX82+AVIQzliG0Qm4q740xraUz/oPaDo
         wjlb6zWUeW9Ut8NqrLjYmKpG+c0yUaeO+nLf4Kq5+lB0ooQfG2yWsXp79YJmFd/8Cb1F
         sJjnU4JEpvxthnV9F3ZK6jcyM7dCs+9ggj/2/peEGXk8kV8hD5+C+5wpIxu3UPWTHTnH
         9A78OfASfJ7O4VFJB7TxIOIVQbwDB6pzCoCpST45MZdJAl3GqDwcKuN8mPu72uU/guig
         sMhR+5CrILs1F00WsV6kC5dgEpNi+8LVcjaToPdfL+qvu/xGxVMbT5GKvkDGrGIKssxQ
         kLsA==
X-Forwarded-Encrypted: i=1; AJvYcCXSNxAWFZqLbhTVGtHNfE+fevAGJ8DYStqPsi035chJuEi6wdIkMfVXY+lejrbvXFCRK4HIUMqsx102AoblEUtN@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvpgau+trfyw3y10ZXcsGYWv5Ea5YnvXkl/fKcdou6SABzwksf
	s/q3C8kuZ99Tx8ECH1WeWOVh/2sadugMtUMSjwWmDuBmOAh63eXaUVd7pu6+d44QXESmPjUNn5d
	Jsv3KDcwJAf6/k4v7sivGQIgW2F+708r7C6PFYnr1levlEzW3
X-Google-Smtp-Source: AGHT+IFhzLcgcs/L0Xo5eHIlOxVTVTCvGQpIJ8zLoYotZJwVqJXphpuLV/3wEhh+Pt3fgM55yJPxDK0IR2Fz1nW32AQ=
X-Received: by 2002:a05:690c:dd4:b0:643:92a8:ba00 with SMTP id
 00721157ae682-6e7f0c46d68mr94570857b3.0.1729851107335; Fri, 25 Oct 2024
 03:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20241007060642.1978049-1-quic_sibis@quicinc.com>
 <ZwfsmqInJlqkQD_3@hovoldconsulting.com> <ae5eaef9-301f-7d3f-c973-faa22ae780ee@quicinc.com>
 <ZxkjqEmkBAsC6UkL@hovoldconsulting.com> <c8e7420b-a7b4-89cd-1b6e-c1f6693c062d@quicinc.com>
 <ik4dyfbphm7lkeipm2dbr7cmdfxewxd4jtuz2jfnscfwcyo2r4@lrin5hnsqvyd> <83b635a7-fc69-7522-d985-810262500cb3@quicinc.com>
In-Reply-To: <83b635a7-fc69-7522-d985-810262500cb3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 13:11:37 +0300
Message-ID: <CAA8EJppx1OmYnfSsMDebRRTbNb3dfAE_MM55T1SpLccP=s_K1A@mail.gmail.com>
Subject: Re: [PATCH V3 0/4] firmware: arm_scmi: Misc Fixes
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, sudeep.holla@arm.com, cristian.marussi@arm.com, 
	ulf.hansson@linaro.org, jassisinghbrar@gmail.com, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	konradybcio@kernel.org, linux-pm@vger.kernel.org, tstrudel@google.com, 
	rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_031148_913923_AC8FB4F0 
X-CRM114-Status: GOOD (  39.26  )
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

On Fri, 25 Oct 2024 at 09:46, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
>
>
> On 10/25/24 11:44, Dmitry Baryshkov wrote:
> > On Fri, Oct 25, 2024 at 11:38:36AM +0530, Sibi Sankar wrote:
> >>
> >>
> >> On 10/23/24 21:56, Johan Hovold wrote:
> >>> On Wed, Oct 23, 2024 at 01:16:47PM +0530, Sibi Sankar wrote:
> >>>> On 10/10/24 20:32, Johan Hovold wrote:
> >>>>> On Mon, Oct 07, 2024 at 11:36:38AM +0530, Sibi Sankar wrote:
> >>>>>> The series addresses the kernel warnings reported by Johan at [1] and are
> >>>>>> are required to X1E cpufreq device tree changes [2] to land.
> >>>>>>
> >>>>>> [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> >>>>>> [2] - https://lore.kernel.org/lkml/20240612124056.39230-1-quic_sibis@quicinc.com/
> >>>>>>
> >>>>>> The following warnings remain unadressed:
> >>>>>> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> >>>>>> arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> >>>>>
> >>>>> Are there any plans for how to address these?
> >>>
> >>>> Sorry missed replying to this. The error implies that duplicate
> >>>> opps are reported by the SCP firmware and appear once during probe.
> >>>
> >>> I only see it at boot, but it shows up four times here with the CRD:
> >>
> >> https://lore.kernel.org/lkml/d54f6851-d479-a136-f747-4c0180904a5e@quicinc.com/
> >>
> >> As explained ^^, we see duplicates for max sustainable performance twice
> >> for each domain.
> >
> > If existing products were shipped with the firmware that lists single
> > freq twice, please filter the frequencies like qcom-cpufreq-hw does.
>
> That was a qualcomm specific driver and hence we could do such
> kind of filtering. This however is the generic scmi perf protocol
> and it's not something we should ever consider introducing :/

This depends on the maintainer's discretion.

>
> >
> >>
> >>>
> >>> [    8.098452] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> >>> [    8.109647] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> >>> [    8.128970] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> >>> [    8.142455] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> >>>
> >>>> This particular error can be fixed only by a firmware update and you
> >>>> should be able to test it out soon on the CRD first.
> >>>
> >>> Can you explain why this can only be fixed by a firmware update? Why
> >>> can't we suppress these warnings as well, like we did for the other
> >>> warnings related to the duplicate entries?
> >>>
> >>> IIUC the firmware is not really broken, but rather describes a feature
> >>> that Linux does not (yet) support, right?
> >>
> >> We keep saying it's a buggy firmware because the SCP firmware reports
> >> identical perf and power levels for the additional two opps and the
> >> kernel has no way of treating it otherwise and we shouldn't suppress
> >> them. Out of the two duplicate opps reported one is a artifact from how
> >> Qualcomm usually show a transition to boost frequencies. The second opp
> >> which you say is a feature should be treated as a boost opp i.e. one
> >> core can run at max at a lower power when other cores are at idle but
> >> we can start marking them as such once they start advertising their
> >> correct power requirements. So I maintain that this is the best we
> >> can do and need a firmware update for us to address anything more.
> >
> > Will existing shipping products get these firmware updates?
>
> They are sure to trickle out but I guess it's upto the oem
> to decide if they do want to pick these up like some of the
> other firmware updates being tested only on CRD. Not sure why
> warnings duplicates should block cpufreq from landing for x1e
> but if that's what the community wants I can drop reposting
> this series!

No, the community definitely wants to have cpufreq for X1E.
But at the same time some reviewers prefer to have a warning-free boot
if those warnings can't be really fixed. I don't have such a strict
position, but I'd prefer to see those messages at dev_info or dev_dbg
level.

Also, can we please have some plan or idea if somebody is actually
working with laptop vendors to get corresponding firmware updates onto
their hardware?

-- 
With best wishes
Dmitry

