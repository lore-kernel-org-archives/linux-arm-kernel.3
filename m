Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA885CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 12:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeqLkT6YmhpaIvM6KqI+mX2KVKU2AF95h98UORdYbio=; b=TcRekLW04DENkBtEmSfqTNlg9T
	p/s+S6SJBQEjr3yoU9ZoAaMV2a0TQw0wuG7WJSV383Adah8ReKUCDRZtbFJYff/7im4Q+U986hoJe
	1h+zVK3zxZgicnyaxF1yLwdwVY8FWZ/jC/eRsNPfc2n9T/IWZYn9fvSWGUXvZYo54oFOBIJW6WFQa
	0tjiihLrBukATPqEZ4i7L10ye+b1QsR6p8+xRwlPhdoNg6jStmivoPgacvhkJSLoQRJk90y/zzP6z
	TW3jyid4ibDDuewN8SDEGxWSiTZ0morSUQsN6Z7SEkc5vWjAF92MsH40VxIL7F6JUt315ngJLJqbQ
	WOAXPAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrDj-00000008Gbf-1RUJ;
	Fri, 15 May 2026 12:00:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrDi-00000008Gay-2dra
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 12:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OeqLkT6YmhpaIvM6KqI+mX2KVKU2AF95h98UORdYbio=; b=kaQIV3VmGPgEB53cvHQ/Y1oAwX
	LnAY8I7yeyrq99GWeaEiIXovSuz4wqcnYuqMsOARl29e9FLFgIwEhoVArEC7QuTGNIg2JBNknDY5+
	Kv3CjOZwAdA6n1rRbep4IzRzQjAHQORkCegxpzI3Q1X/zT4KlwGFYjqlvJUpteDQOiV5wqRug1gS+
	bZaNdR+/F0cdu2nvjKfaI4i2P2AZVTGkdkqekzZ2FjRS6Qt4uLbk3FNkDajApUNxDEFljvuzna24w
	OVbTFYKNOZF1UAEx1Ls5GnTBbFpSje8SJBIqFi3Tqtv7Fwf5D5Dmvr9tyzsUycfWN0ZPpH9aJckAo
	5Zq8xKUA==;
Received: from mail-vs1-f53.google.com ([209.85.217.53])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrDe-000000056vG-1aQK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 12:00:45 +0000
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-6314d2e31d6so2401383137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 05:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846441; x=1779451241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OeqLkT6YmhpaIvM6KqI+mX2KVKU2AF95h98UORdYbio=;
        b=E5hkMrQywf33/p+v6qIE66XAImzmBfWDv/Wajf1TVA0+YPnwAxrrl8D09LlTrc3ZSq
         c53yXarcTy+6JigALGvcCXRm2zyIQ8nO7WsldEJsz31F0vAN7UY1OJxzNGTu0Ps87j6E
         IdrbKSIEoPsb8X0s1as6/o1cPn6CZFL2DVZSkgGN4TvFNtRdq/owOUWkMic2UaupHKXk
         NKhcmN24WdUYHYw2saD5GDugoeRWaqJBWk98wLOQeFK5FhBHVvORmD3m1UQAeMcf3Bxv
         RlRl5BH3pTSgGH84pNGHamvlWzmNTjQo6c7lSWPQ1mmQPr7aCM1qG7A9dBKvc91nyKUK
         JZdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DcSflXlXLRGZPb8BTU0ex4WwkCGF022auovwaSYvmEr33Bqb7JpWoRJo8sR07/hkjsFSNE7pi0QJUA9ASL4OH@lists.infradead.org
X-Gm-Message-State: AOJu0YyE3z5qsN2nNIGgAXJIp0L+Ja8yAXAkjbOczK8Z59K5zxgCu6Fw
	0ZMgHPp/QjFhyo3xqFW9I2deYa1EoOHw9QpYQ/lI1Qj0W0vGv8sqNE9N3AdzTkU6
X-Gm-Gg: Acq92OFDd1FOqQd2sl4SUa2QtJ6CLm63h9ncQbRYbbrpzeDFYZNXnqqvbGCFoeVaFYm
	xPN/iSI5x4hQLB/ouCB/SyGAko6FQy+aSlgHxZkTxeWWPyR2JO/jrMF7+Qt6KUeoRdiYNT7DLPb
	Tj1KCAeU2uOvJpKDD7Y9YO1JwDRZrlKwYWMp2g4jZBsPm+y6nmlJ6yuKlYBpDrTZU0CLAKSN45s
	8atU7+PvVclCppaw5XspkOLjmnK6lQv7swX6HwyT6EaT/9UJlmZj0lWKV94vwxqFT5YROyH7Mv0
	hpXn2BqM2DubtaEXpfq8EjdZMWNqJE851l58NOOYqt+qpdffMouctzDxWIBkGzbb0o26CliBtEJ
	beqr5EKwDHmFkoPKTw7MOSDC8eCEZpaw4SZcvKMPuZhcnzCxXdzkyB7fWHt/JUWbtt9mgkF+chQ
	7R0CNhHv7S01MyUm3jI/7llSsKmLTWt4hfsbeouKbXv2UlzHtq581m45VlFVnHVQSs30zwtoY=
X-Received: by 2002:a05:6102:6a8c:b0:639:3b08:d64b with SMTP id ada2fe7eead31-63a3d42d09bmr1644446137.9.1778846440576;
        Fri, 15 May 2026 05:00:40 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63cd19df5f5sm613203137.5.2026.05.15.05.00.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 05:00:38 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-632a055fa9fso2357678137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 05:00:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/yw7moCltT4XxDD/yMxXKiQNCDheHLo+1iT8keATFZg6hMIsZM/r6uBULo0CXaXOIJ9K1B94O0mMBhMeOvzZzB@lists.infradead.org
X-Received: by 2002:a05:6102:304d:b0:62f:2f1f:599b with SMTP id
 ada2fe7eead31-63a3d21f6e7mr1529435137.7.1778846436927; Fri, 15 May 2026
 05:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <agb1Q6mrGyDwFdmO@stanley.mountain> <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
 <agcHnzzdhV36j9eH@pluto>
In-Reply-To: <agcHnzzdhV36j9eH@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 14:00:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVAioAk_3K4y-7T0MCa7L++sVcWGRfdj_ESHau0ov9eA@mail.gmail.com>
X-Gm-Features: AVHnY4J92Za9USCx0Iqrdp0VKNlh7Aqvg8Y1zHpQUS0Wj660oR8QKip2za8oQmo
Message-ID: <CAMuHMdVVAioAk_3K4y-7T0MCa7L++sVcWGRfdj_ESHau0ov9eA@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Dan Carpenter <error27@gmail.com>, Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_130042_999931_DE03D913 
X-CRM114-Status: GOOD (  32.47  )
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

Hi Cristian,

On Fri, 15 May 2026 at 13:46, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Fri, May 15, 2026 at 01:29:27PM +0200, Geert Uytterhoeven wrote:
> > On Fri, 15 May 2026 at 12:28, Dan Carpenter <error27@gmail.com> wrote:
> > > On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > > > scmi_power_name_get() does not validate the domain number passed by the
> > > > external caller, which may lead to an out-of-bounds access.
> > >
> > > Is an external caller an out of tree caller?  So far as I can see this
> >
> > I meant a caller outside drivers/firmware/arm_scmi/.
> >
> > > is only called by scmi_pm_domain_probe().
> > >
> > >         scmi_pd->name = power_ops->name_get(ph, i);
> > >
> > > where i < num_domains.
> >
> > You are right. But this seems to be only API implementation in
> > drivers/firmware/arm_scmi/ that does not validate the passed domain
> > number.
>
> Yes we tend to validate protocol operations calls even if apparently
> safe from teh caller perspective...indeed I have this fixed locally
> since ages in an horrible patch, that does a lot more, and that I
> never posted :P
>
> Usually, if it is worth, we also build an internal domain get helper to
> reuse across the protocol unit...but here really there are only 2 call-sites.
>
> What I am not sure is what to return: "unknown" is safer as of now than NULL
> for sure, but really, what happened is NOT that the name was "unknown" (which
> by itself would be out-of-spec behaviour) it is more that the whole domain that
> was referred to that was invalid and NOT existent...
>
> ....mmm I suppose we are opening another can of worms here :P

Like scmi_perf_info_get() returning ERR_PTR(-EINVAL) instead of NULL,
and scmi_perf_domain_probe() never checking the return value anyway?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

