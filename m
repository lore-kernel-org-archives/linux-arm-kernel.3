Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682B8C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 18:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJnaPVXf7C5zD77/AWLmv25JpFX7qo5ZjH3DvCBibtk=; b=2zLrpvCJFtNrODqdXTpK8A4lLk
	Pqb+YpmSZhBiHkN1axJWJTIvpcAuLIjopyuCE4p9GOF3FFnDo7Fr7CJmX6d1i7c/+3D7+7DsX8WzA
	jcITY28U1twYbuG6+/jSMX/HYzXx1rWkO7Z3PbTE0urd/o/WlkB8cxQr2E8bVDuOto/CKihubKQCs
	n4r4ikUuwpPWampO54sNOH5TB+dEOgXvx35tarJCDzdtEnIUZnh4scjUO3LoBEDl2BkxfNZenmOag
	SZku5hvbb47J876+XjyWSlb97vbDNDzgggJVAF4j6gNfpYq8Lq+m6hKpgnnCXFVmkA6JqQJl72lef
	wSsa91EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiH93-00000008QKo-33mo;
	Wed, 12 Feb 2025 18:07:33 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiH7a-00000008QCF-1aX0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 18:06:06 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5450abbdce0so3785238e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 10:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739383557; x=1739988357; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJnaPVXf7C5zD77/AWLmv25JpFX7qo5ZjH3DvCBibtk=;
        b=j4KIJ6FBveNfWGfwwUl00hPTgeRuJtEJMvja4aaP+gFY8T6K3yYMwmtk0JsQsgl//s
         isTqUi2GnY5WliCL9oRZcn3DkHWHgFwIsmLq9GEHn+gwlkhkEGgUMK1xXyvYm7qcQXtR
         vQ9+NuQBvPF2d6cMfsI9t0rgfqjjwGI8im/2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739383557; x=1739988357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJnaPVXf7C5zD77/AWLmv25JpFX7qo5ZjH3DvCBibtk=;
        b=Dm5exsRIbI2NV66co5T3WV6nNpYeuZiYc9L+y/NfG2iThYGLKxYnd19CiuGBjZICB2
         XmaA6yv4hbQuqtIyYaJfoNMTFvSPN7YcOld4HQfOUMMJgaZdEOBj0aQKvIU7mEGTKqUh
         oNZ2k7X/5Hj8q7kYZLn/Y3i0P5KafTg12s0EE2fZwaoUz5W0mjouvOD4W2XSU0WUXAez
         vSNIXhFO3auTutNIHXbQaWJ+fiCuR9fxG0uMXCKnqwl7eS0ojiSzEOP/Ynf/hF6ItXec
         ZoQ1BiDpNYDhILJzm+YtEwHkQU4LrUiM3LUPNhNKzi+bind9pLxc7r+1cRl9ku13YRTN
         xNrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBYu5zrKv+ozUr9GBz7vxYARpdy2whxCnOAFu2WvfsNhnwONQYLL2bO146b0zOQl43WOGsPFv5hAna2BM4WWWp@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdw3Wc2yBsbg8qMytACWPdILzLUJZ9So31OLx6SIvN+0bSzlka
	m85nYVEwCzlaUqB5CyK+yNzeimPhAlOoQe10seUo8EjoTN4t90uSF6IJTqXy5azbJ+tMEVgcu4r
	+TdES
X-Gm-Gg: ASbGncu2kXcyO7ygUWt3d4tPF5oOqeyNhsiYLFl68winmq25eVOfNTkeJr4mbT+S8+F
	G4wdAIACL0Q0xJfzFC2OV92mdgcK+A/nx41Hm1L1wIEMZ16QG6lyZQxbrdN2ygoADWnJVwguM4c
	Hko+aSIj9S1zi3I18gWx9wI9mr7eS+QwGDypa0DTC4a4s+F4I9I6mw7DUUJ2AKOX4z2JTQkrARV
	NT0VDztE7xrBJLx3taworkcsfR5r/74TZY0lUY+BR9YyxzOrGT97APjjlvWP7yqrwa3dh5lfm1b
	fP911ZQzpApnE1OMwMazgmAhgOo4ZGf1gcAajO9xYatBw0u4+qMmnWc=
X-Google-Smtp-Source: AGHT+IE0NQ82O1Q7eN685f7hwZeHfVEcNbVz4MmTyhETqkbVNPAPvnMgPtDQAq1CSAoeek/IRs3akA==
X-Received: by 2002:a05:6512:3b87:b0:544:ee5:87b0 with SMTP id 2adb3069b0e04-5451826e9bcmr1846597e87.3.1739383556706;
        Wed, 12 Feb 2025 10:05:56 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441060400asm1971727e87.218.2025.02.12.10.05.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 10:05:55 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54504f29000so4566031e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 10:05:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSKD2OJl/FitCfu7X4Vz8CjL7gSg2bQYFdjOgYULdxjO6mbi95RJYefi77AtCsrdKmyqSps5E4N0BBF6tmbFZZ@lists.infradead.org
X-Received: by 2002:a05:6512:23a0:b0:542:29b6:9c26 with SMTP id
 2adb3069b0e04-545184bc10cmr1392880e87.47.1739383553822; Wed, 12 Feb 2025
 10:05:53 -0800 (PST)
MIME-Version: 1.0
References: <20250107200715.422172-1-dianders@chromium.org>
 <20250107120555.v4.2.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
 <e6820d63-a8da-4ebb-b078-741ab3fcd262@arm.com> <CAD=FV=WTe-yULo9iVUX-4o8cskPNp8dK-N9pKq6MxqrPX3UMGw@mail.gmail.com>
 <Z6zf3YJq6qqoJQRi@arm.com>
In-Reply-To: <Z6zf3YJq6qqoJQRi@arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Feb 2025 10:05:41 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XZnb-c+9LVYWmA0EZPTX0enpZQdwokRanKZ78RRQOAzw@mail.gmail.com>
X-Gm-Features: AWEUYZkYpo4ZdBFbmBIkTo_Y8VQo51FzREvP3YsId9scTLFHz9v6oyFYchRiLcQ
Message-ID: <CAD=FV=XZnb-c+9LVYWmA0EZPTX0enpZQdwokRanKZ78RRQOAzw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Roxana Bradescu <roxabee@google.com>, 
	Julius Werner <jwerner@chromium.org>, bjorn.andersson@oss.qualcomm.com, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-arm-kernel@lists.infradead.org, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Scott Bauer <sbauer@quicinc.com>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_100602_435587_1A234AD2 
X-CRM114-Status: GOOD (  25.25  )
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

On Wed, Feb 12, 2025 at 9:52=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Wed, Jan 29, 2025 at 11:14:20AM -0800, Doug Anderson wrote:
> > On Wed, Jan 29, 2025 at 8:43=E2=80=AFAM James Morse <james.morse@arm.co=
m> wrote:
> > > Arm have recently updated that table of CPUs
> > > with extra entries (thanks for picking those up!) - but now that patc=
h can't be easily
> > > applied to older kernels.
> > > I suspect making the reporting assuming-vulnerable may make other CPU=
s come out of the
> > > wood work too...
> > >
> > > Could we avoid changing this unless we really need to?
> >
> > Will / Catalin: Do either of you have an opinion here?
>
> Is this about whether to report "vulnerable" for unknown CPUs? I think
> Will suggested this:
>
> https://lore.kernel.org/all/20241219175128.GA25477@willie-the-truck/

Right. The patch in its current form is in direct response to what
Will requested and then subsequent feedback on the mailing lists from
Julius Werner.


> That said, some patch splitting will help to make review easier. Should
> such change be back-portable as well? I think so, it's not only for CPUs
> we'll see in the future.

Personally, I don't think the patch will be terribly hard to backport
as-is. I would expect it to just cherry-pick cleanly since it only
touches spectre code and I'd imagine all that stuff is being
backported verbatim. I did at least confirm that it applies cleanly to
v5.15.178 (I didn't try compiling though). I guess there are conflicts
back to v5.10.234, though...

While I've had plenty of time to work on this patch in the last three
months since I posted the early versions, recently my assignments at
work have changed and I have a lot less time to work on this patch
series. If breaking this up is blocking this patch from landing then
I'll try to find some time in the next month or two to do it. Let me
know.

-Doug

