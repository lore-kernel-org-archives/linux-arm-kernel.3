Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F89E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 15:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOK+EabcLART//wNWq/2bx90ZPHXhDUCyx5nSPtp/mo=; b=ff8Gdr1Qzaq9KI+BTKDzq8oCo1
	y276o3gRTy1ImGjpGKnIsadLqsGWoLDXqc2KowaeDSENSkC9Sqj9zPzK4fm/gMB+Wv6ckCQVHNrfV
	foxfi32lw/UjGL13+bpEO4LCmETQjIlbpT13mm4qfdnTGtMG8VktL80eXLULTJX6ImCZDAVSqCJre
	L7m/XyvYy9CWce47Ww55pOxmbOf/nz/Sy+uXZ0cUNu4JRKDU2XPkFA4qt1EeL18r3zKLIuwV3cTLA
	UgDk8sWYphoxefzFu2XY4gL1T+pK2G9Bl4xocq4XJevKqfskM/YteZ6CyjDCz+/7XlqzD9Z8CSInB
	e3RokQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM7Iv-00000004E6L-3Vux;
	Fri, 13 Dec 2024 15:10:09 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM7G2-00000004DJo-049P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 15:07:11 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2163affd184so114785ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 07:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734102428; x=1734707228; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOK+EabcLART//wNWq/2bx90ZPHXhDUCyx5nSPtp/mo=;
        b=OYRpgGcb9H/1GDW0CJ2wqEe9GKTqdQz8Ku5Ib1b4mVlVKnVHvR8bay11Ka3jCk4ATt
         rZ2bwxZQ2uLPb18D5SpAJJGBq73caivxANeil3oT4rxvZI6laWH8VqxoOQmQ5Dz22rp+
         f02tghCNqnQHU0j+zfzsS73B/ZAT5zXNVMXAR4y6cgQInLBh5oxgL4scxgvBk92fBf4C
         P/Qb/DOxPsuQkrzKX8rJhhgQY6gbg7naqmj6OMftw6TSZ79gWPGRzv8XCIFhturbdEAv
         cF3JEGvz+6MwgdMOLG91X41Ltm0F5FJTVEpQ7seSDEkSfmoyPEDwNSOTaVKF1y+l9lNw
         maSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734102428; x=1734707228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOK+EabcLART//wNWq/2bx90ZPHXhDUCyx5nSPtp/mo=;
        b=F2+ANkl/AxquD7L0+K67eTx/Qaf8+rInH5XaZcTkY58ZILqfb+I9Et3SIBiza1LUlV
         Qy4XUfOTQ17TIExhAwrvX9bL6a6lUYsrYRK5a0Y48eqqBpWOynP8fRxUr0v+Kf69zNE4
         ZC1sGt77BBv1rpdzYdfJ2MIVCLcmsgr6pjhN4QEMG3En+fxsXy0YrBJh/6Txp9DlQVxI
         6Yjz2UnZMP1SpP6o9Hy1gp8IySxM1KqN5ZXFEAwzQuI0NYv34ZikdvwIUJmfmFPJ7DE7
         8Af4ldLg8WkQng4xBWAtanvTJheXXKlw5hgGDMtczJ2M0+W6y7pw1CC/+hFaSdRz/JHV
         znTw==
X-Forwarded-Encrypted: i=1; AJvYcCVvw+Mpo68Rvw49qgkKE7t8tL+5OSRtZ+Ew1flOyhZ/vtfTTilrunWT2tT0SmF8BEZhdZqj8Cw6dgrlqMyHjhia@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/yhdmaABK0fIRS0lAuFdsOcaOsOZcMIaXsYTB2jyDhcc0u35X
	/hghkTnmhhfudgsSA0pAV2cqbSGC1zDMtR0EsEKAqbTdLh/e2pqfYOMzycAREcfq0lHmcVwPAtz
	Ug9/iS3Sq3wUAEELWTvV/lv/otiCUWJr8//Mt
X-Gm-Gg: ASbGnctVtvnNsqtPKm/D/mzeUH7uVStyMQfVc0u0oZ++kw29+TviK6suFEDSpmmEweb
	ga+DODQKQF3XWK+ktZ0t0L0ryY4i6jnZjSa7sfg==
X-Google-Smtp-Source: AGHT+IEFkkLrbUVuE/cQvOQQfUpzDKI51xwKn+aUa2wuLKN/e2/s4qkcLn7DHuV9QVymd56Ir4cx8C6BN8kJhz8qssU=
X-Received: by 2002:a17:902:da82:b0:215:44af:313b with SMTP id
 d9443c01a7336-21891d3ead6mr2786695ad.0.1734102427757; Fri, 13 Dec 2024
 07:07:07 -0800 (PST)
MIME-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
 <hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
 <1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local> <20241212173609.afd41d1dffbefe0d731ed4ed@linux-foundation.org>
 <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local>
In-Reply-To: <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Fri, 13 Dec 2024 10:06:55 -0500
Message-ID: <CAC_TJvcdz854DmBoVRkb_B5j+u-t=4zHkLtHVeB5RJ=bXcBJag@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, vbabka@suse.cz, 
	yang@os.amperecomputing.com, riel@surriel.com, david@redhat.com, 
	minchan@kernel.org, jyescas@google.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_070710_050754_6C4791BC 
X-CRM114-Status: GOOD (  23.14  )
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

On Fri, Dec 13, 2024 at 4:00=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Thu, Dec 12, 2024 at 05:36:09PM -0800, Andrew Morton wrote:
> > On Thu, 12 Dec 2024 22:51:34 +0000 Lorenzo Stoakes <lorenzo.stoakes@ora=
cle.com> wrote:
> >
> > > You've fundamentally violated kernel process and etiquette. I'd be mo=
re
> > > forgiving, but this is at v2 and you've not cc'd KEY people. Twice. T=
his is
> > > totally unacceptable. See [0] if you are unsure of how to do so.
> >
> > This feels excessive to me.  linux-mm averages a mere 140 mesages/day
> > and it seems reasonable to assume that key people are spending their 5
> > minutes to scroll through the email subjects.
>
> In practice we did all miss it, and I don't think it's unreasonable to as=
k
> people to run get_maintainers.pl to avoid this.
>
> In any case, I truly do think this series works better as RFC, I mean Lia=
m
> has already voiced the kind of disagreements I share with it, and we need
> to rethink how to approach it in general.
>
> So if this is simply sent as RFC with the correct cc's (and ideally with
> some review feedback applied - a better cover letter, etc.) then it makes
> everything easier.
>
> As mentioned the timing is unfortunate here, this is a series we really
> want to make sure is properly reviewed before any chance of merge so agai=
n
> this points to RFC being the way forward.

Hi everyone,

Sorry for the delayed response -- I was traveling and didn=E2=80=99t have
access to email.

Thank you for the feedback. I realize I missed some key reviewers in
the CC list for this patch.
When I ran get_maintainer.pl, it returned a large list of recipients.
To avoid over-CC=E2=80=99ing people (which has been an issue for me in the
past), I tried to trim it down to maintainers and a few others I
thought would be interested. Clearly, I got it wrong and missed some
key folks. That was not my intention, and I=E2=80=99ll make sure to fix it
when I resend the patch as an RFC.

On the technical side, Liam is right that the copy-pasted arch code
has inconsistencies (missing checks, order of checks, ...). I agree
there=E2=80=99s room for further consolidation. I=E2=80=99ll take another s=
tab at it
and resend it as an RFC with an updated cover letter, as Lorenzo and
others suggested.

Thanks,
Kalesh

