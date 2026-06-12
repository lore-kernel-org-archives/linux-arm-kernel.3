Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D0BCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 23:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+1wquOFgnZ8oMjOpJ6cj1f/PMKc50p9NZzPSCkIK6k=; b=fPWjuDAHcM37cew9h3RjD4KSyL
	DrSyBlr7BTlUouH0rrAjRVgzfT46cKv229xKgFbKdw8qaqzpBIBENG1BJnbSgwXpmRvLxbAr25rtJ
	Wx0TMZw1u0efC/OszAMO2kyhj0CRhXEsqgE9XkjwssiNq+lNoPSL3zfuGfKOn4pFTG29Gm8hqg4yr
	B8VkJzo2sArTsxmm8++dfQeRDSb5/riiBpK/olaI0nmhfAEjst4XQ99xGapr/XOUXes9kEtzhgRXB
	G2gVrAQZAmuM9msWIfumdMtOm7GpaEt4BSoxlPg6ZGmXZkZ+L5i1yyomrDjAlYToEd9XJRM2rbuNn
	GynAsyQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYBel-0000000BmNF-29A6;
	Fri, 12 Jun 2026 23:51:23 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYBei-0000000BmMq-3rhA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 23:51:22 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-4863cd41330so1119392b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 16:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781308280; x=1781913080; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+1wquOFgnZ8oMjOpJ6cj1f/PMKc50p9NZzPSCkIK6k=;
        b=UTyTOGHpRX4zLVJdo8us+DjdgH+jUdglaSmcUVtm4ID0FjmNSYO2ec8xDIV0R/nqa2
         FOoanKUcvILXlPHQZiVbqeYsLjSJIMCQZ1X6ybA5QI1H1FeyTfJQ5RylFo5lCJlcj5zY
         EFpRA6yhz5lZM2G1tTTrsoG7D6cKDKe1Lfx50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781308280; x=1781913080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9+1wquOFgnZ8oMjOpJ6cj1f/PMKc50p9NZzPSCkIK6k=;
        b=YFQMSdAFhzBIGk+j/aLbeZIDNUbrUE4wx0X2db696uYVIkWU08iZA0LIqFJHegU69Z
         wfsrsb9u1rpfC16fxhkRs/8JEJqf0hzoDTOSWQX8FUEQ+eMd3+2OJxkdsFUrW/MFydyg
         uO8EjhW1utsgIii4ExGOloRZrLiO+UEYIdwcjDyo9csBDTolIQIijV3E5rOe5RbIh+a/
         Qxr2asJUVlETgRbj5Jar6bf//jla6GulpXJ05HrXOKSVRd3MKHTGdmbt3yaQTYl1UP2E
         QKuQJp9WQvTy9565cQp39+WiW1n4NJRKaeXHBBPJxyc+f5Oe2vbNw0dnR2dZuS9X8CHM
         hOow==
X-Forwarded-Encrypted: i=1; AFNElJ+U5zbewTJIXcGFgyURL1arhDqXUrZ7wbyp3L1KJDbgpaEgzCwBldGr0iW3/MccnRO3N6UmcKzdjd//BTzlZCLG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6P7fJhC67DjvS+buNB0Zb5VnWMzRJHJIbjHkKhQ1uhTnbqVUH
	tJlIMany6LiysVq+pNbT+Ane+WieEdQHoycn8+ytbOV9jlmdujV3byo34sezZ97wUTzcsVft/h1
	ZEWg=
X-Gm-Gg: Acq92OGYN7ogxISLqpXMo8/1VUJWZa2pbsgAYBgmw/XnccTfuTO0e4Wju+kOxtA9iMB
	1idq+73+8+tDg/4gmEwSy+HH/U8yA72IDjex6Ldfr25WtPeE4MNdpEnYMAAZ8pXvioGF3uZfEGV
	REQeY3z7NGlEZzjk+jc9wYlT+S1fCakuW7mcY4YxwHBz/VTyMPiq5+OEcws/fsGu/jHYt0pG7iB
	1HfFDAxRZIpXNLZuFv3w3GeAcsjTeICxS0svPvRpWdLXGZK/TRy7JutIM12mxrmJNsBPfz6YGIu
	oLsQrvAWz9lSGnN6dj2bbjGwPuv0PwPO5Y+UvvM0RlVDsfNTQ9VQYHn/sItXYI0gwNGQpO6vBmB
	C6hVS/xst0sqvhmPov9lDjpPfjrJHfLxJIB5RpCuKAidxhICDCYlXzHuOrH3TkME4Zq6IBCDtqd
	3nWpKLAlm6y5mhFNxKiRy4rc7SkM3r4Y1JJcX0HCUyB9xV1Tj3YBTavixQz0kovw==
X-Received: by 2002:a05:6808:1920:b0:486:3537:2177 with SMTP id 5614622812f47-487313e2f7amr2062134b6e.16.1781308279667;
        Fri, 12 Jun 2026 16:51:19 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-487315a6eb4sm1868180b6e.16.2026.06.12.16.51.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 16:51:18 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e6b5c374e5so1715086a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 16:51:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/lqq3wf4Bn9TnpqV8TpI9+hCgWtzGifAzlEyQUl6epJlNXLIIfJmIy1jufXMZ43e38X6UfHwzwozoNTkINGIZb@lists.infradead.org
X-Received: by 2002:a05:6102:44:b0:6cc:e6b1:7f84 with SMTP id
 ada2fe7eead31-71e672df42dmr1922971137.17.1781307855477; Fri, 12 Jun 2026
 16:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780496779.git.kas@kernel.org> <cover.1781013134.git.kas@kernel.org>
 <a7ed093b78e6966c049bacc7644a8a00a9a52720.1781013134.git.kas@kernel.org>
 <CAD=FV=VLoJBMhDjb=3XAOCZWDBACn_=KdnkL0J6-Ch4uKrHjNA@mail.gmail.com> <airhxVP7vAVehIXQ@thinkstation>
In-Reply-To: <airhxVP7vAVehIXQ@thinkstation>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 12 Jun 2026 16:44:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WVvhTY9NC3jZirrkfCMCs-=fFv2T3G1TxJ7cDat0jENw@mail.gmail.com>
X-Gm-Features: AVVi8CfEd7n3wE6upMh5NdkDiiKerL0vNvKO0G860TyCtWMeiQp0kfSDQmZ7IEI
Message-ID: <CAD=FV=WVvhTY9NC3jZirrkfCMCs-=fFv2T3G1TxJ7cDat0jENw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: escalate smp_send_stop() to an SDEI NMI as
 a last resort
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Petr Mladek <pmladek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Usama Arif <usama.arif@linux.dev>, 
	Breno Leitao <leitao@debian.org>, Julien Thierry <julien.thierry.kdev@gmail.com>, 
	Lecopzer Chen <lecopzer@gmail.com>, Sumit Garg <sumit.garg@kernel.org>, kernel-team@meta.com, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_165120_993263_16E14059 
X-CRM114-Status: GOOD (  30.64  )
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

Hi,

On Thu, Jun 11, 2026 at 10:47=E2=80=AFAM Kiryl Shutsemau <kirill@shutemov.n=
ame> wrote:
>
> > FWIW, I'm not totally sure I followed the logic for why "die_on_crash"
> > needs to be "false" for the SDEI case,
>
> It's not about kexec mechanics, it's about the SDEI dispatch state.
>
> The SDEI stop handler parks inside an SDEI event that it deliberately
> never completes =E2=80=94 completing it makes firmware resume the wedged
> context, which is the opposite of what we want. PSCI CPU_OFF from inside
> that not-yet-completed event silently wedges EL3 on at least one
> production firmware (still root-causing on the firmware side), so the
> SDEI path saves the crashed context and parks instead of powering off.
>
> The only consequence is that an SMP capture kernel can't re-online that
> CPU. The dump itself is complete. I've left "power the SDEI-stopped CPU
> off too" as a follow-up and called it out in the cover letter. The IPI
> crash path is unaffected and still does CPU_OFF, exactly as before.

Ah, OK. This makes sense. I read the cover letter, but I guess this
part of it didn't stick in my mind. I wouldn't mind an explanation of
what's going on being included as a comment in the code. Then someone
down the line won't be left wondering.


> > Do you have any reasoning for why you don't pick a separate EVENT ID
> > for "backtrace" vs. "stop". If you absolutely have to share an ID
> > because they're a limited resource then I guess it's fine, but it
> > would make the code easier to understand / reason about if they were
> > separate IDs.
> >
> > If you had a separate EVENT ID, then it seems like you could
> > completely eliminate the (potentially large) `sdei_nmi_stop_mask`
> > variable, right? Any time a "STOP" event fires you can unconditionally
> > consider it to be a stop w/ no globals needed, right?
>
> Separate event IDs aren't available: SDEI_EVENT_SIGNAL only ever signals
> event 0 =E2=80=94 it's the one architecturally software-signalled event. =
Every
> other event number is an interrupt-bound event that firmware has to
> define and bind, which is the firmware dependency this series is
> specifically trying not to add. So backtrace and stop are stuck sharing
> event 0.

Oh well.


> But you're right that the mask should go =E2=80=94 just not via a second =
event. A
> stop is terminal and system-wide (sdei_nmi_stop_cpus() is only reached
> from smp_send_stop(), which never returns), so once a stop is requested
> every later event-0 fire is a stop too. I replaced the cpumask with a
> single write-once flag the handler reads; a backtrace that races in
> after a stop has begun just stops that CPU, which is fine. So the
> (potentially large) variable is gone.

Yeah, this sounds much better, thanks!

