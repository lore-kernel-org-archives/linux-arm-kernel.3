Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E709C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 14:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jb3WMc7I3EjeyDChxpxmp2z3Ge1ULEmUo6kS7KQbLBs=; b=SkQIUzEng1wTFevdh717LI4S5q
	k5txmhLFZLrmAIHE5fw/6AiVako//IEJ4ZM29sZgP7AN3DmWQAoqFlJT8p8GCncCld/eE0V4wyOve
	0rZyqDwGIImP0MPneJQC2udnpUCJaRExbTsl5kr9cQOuMtn20kdTAkY8a6lJtYzsL6VLWyo+w227O
	7a+kPpQ0+7t/z6lE5eVTPNc1ZBCX2dU/coqnbhbGmWkx52tD8kZSa20kPFvfq0yOU20RHvKDw9RMT
	ck1n2AhbuqYIWGhNT25SuDtlQJI9gej10+/RvbyCXB8LY8eGgu49uLZiCw/4AwX39TcvmRsLzB602
	SEORbf0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4je-0000000CBeV-3toE;
	Wed, 15 Jan 2025 14:51:10 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4iM-0000000CBOm-2ETe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 14:49:51 +0000
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85c4d855fafso1354265241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 06:49:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736952588; x=1737557388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jb3WMc7I3EjeyDChxpxmp2z3Ge1ULEmUo6kS7KQbLBs=;
        b=Zna6V5+9fCOFff9rz+5gVc1qiO4qYOsOcPLe+5HOGszhBlmSbjW3RkkkJ2koas5TGl
         FeGNFNWopkKY9mw0S0SaiGeK9afYX0S+qhXbeRw4njQCRd2X7j0orjo6zVboOmu+QnzM
         WFkJi7dhXeZpzEiAPh5gmZsv0ZIxVGKSXULVvsl7+PPe2LoQxAGhNbJhaKm7gMu89v9N
         w+7W4+vjB1z/FEYJffXu10FuUYKLalQMUOMT/RXeQY6/aDc4mysizrpyoWxJWEx2ufVo
         pUdKWeSZ9qRuE3PsFAwax3B0FIFi+SwvMU764KcPpPsYmsLOj373xDTLKqy0j/Qg3+ra
         ujmw==
X-Forwarded-Encrypted: i=1; AJvYcCX8VD3t5zE6TJhbp2w0oV/KiplUispzuy98P9gBDEiqpoMGzYjd45fpgyT8cHrSVv9n3zLq7ykWPwZUhbewVpyo@lists.infradead.org
X-Gm-Message-State: AOJu0YyavGy9asBx/2SKZ6M72vBymegU7Bb9bcjopVKnwGiB3PH0vkpa
	NKge0mzi8eO6yaiE+Dfqt4e6VeyLvKUvd1ppqX5k4iD5geAGNNJSKhm47ar16qo=
X-Gm-Gg: ASbGncsKDRm7TAVhh8KSI+tAMl4fn/2v0W+lZJ1eU1pwFZgf1mMKXpn64P/yd6HNdxc
	DCobqvNmihbdWJqLXVS2uhmQ8YDHPisfFZFDgWxb3/hPaZGHxWsjUC5Dz5U9FKCSvJSiStVjYw8
	4WQ+9RdPP5KqqPeXENe4wMaq4Qm0BkuLAUV2pCVTsz3pIM9XhyiJt1oV0VfEb+EyOEIGqoClfOC
	b7d4fehDUGQAftTYpBXgHNmPMSlxJyKIAG6wInaDgvN1Fb9r7LU2X6Gmq/zqxErPNUnqV9AN2cN
	fS3zcxCP94yFeDF9/Lg=
X-Google-Smtp-Source: AGHT+IEZoYQsC52CcIQlGjG8GSVx0ifno8LSdIz/ogiJFEfbeQTa44xArYBpZ2xfCf3LL7mmn3gRMA==
X-Received: by 2002:a05:6102:80aa:b0:4b6:44ff:415a with SMTP id ada2fe7eead31-4b644ff424amr10625042137.21.1736952587688;
        Wed, 15 Jan 2025 06:49:47 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8623154b10fsm5813421241.23.2025.01.15.06.49.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 06:49:47 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4affab62589so2125948137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 06:49:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgeyNcYmIn2SCvlzuvQO3Bf5GhH96jH2o/Y30E//dWGCUweNOrkmOumyMJj3PNM9uQjj9gkmsYn7mAAxoRjRfY@lists.infradead.org
X-Received: by 2002:a05:6102:b09:b0:4b2:cca7:7d51 with SMTP id
 ada2fe7eead31-4b3d10482d8mr26088574137.19.1736952586805; Wed, 15 Jan 2025
 06:49:46 -0800 (PST)
MIME-Version: 1.0
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
 <20250115-xilinx-formats-v2-4-160327ca652a@ideasonboard.com>
 <CAMuHMdXwsdP3_3b_OWFZ8J=kuNCga0h5Vo+wR0fdquQjZNuzEw@mail.gmail.com>
 <b7b8cdde-c189-4b9f-8423-c8ab4797b2f0@ideasonboard.com> <CAMuHMdVnDBt9QbR2bPdKHWgQ7i-OYYJ14ndc270z-hejY=bUdA@mail.gmail.com>
 <6b084e2c-100f-4563-8797-9fd6c862ed0c@ideasonboard.com> <CAMuHMdX8EeKnV8et81i3UdOexhO3Ry5TTKqp18OvCpJpWT2CtQ@mail.gmail.com>
 <0b0decd1-6f19-424a-84e5-fc71dceb983c@ideasonboard.com> <CAMuHMdXrdV4YRo1nMCVMTga=M+16GT8GkWe+Rk1DkgDZ=abGag@mail.gmail.com>
 <0004c685-b8c6-4df1-acb4-7c80a9d3255e@ideasonboard.com>
In-Reply-To: <0004c685-b8c6-4df1-acb4-7c80a9d3255e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jan 2025 15:49:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUSqiwGynNTCs7eVcr5EL4Toud90AVRb=85egWfDAc6Ew@mail.gmail.com>
X-Gm-Features: AbW1kvZ8qLbNDg2ifMBzJCr-rfWERpWGg5o-Lh1utJkoLEP54a_Q-fpkYR4VlV4
Message-ID: <CAMuHMdUSqiwGynNTCs7eVcr5EL4Toud90AVRb=85egWfDAc6Ew@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] drm/fourcc: Add DRM_FORMAT_Y10_LE32
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_064950_566184_21DB22D7 
X-CRM114-Status: GOOD (  17.92  )
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

Hi Tomi,

On Wed, Jan 15, 2025 at 3:34=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 15/01/2025 16:08, Geert Uytterhoeven wrote:
> > On Wed, Jan 15, 2025 at 2:46=E2=80=AFPM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >> On 15/01/2025 14:52, Geert Uytterhoeven wrote:
> >>> On Wed, Jan 15, 2025 at 1:42=E2=80=AFPM Tomi Valkeinen
> >>> <tomi.valkeinen@ideasonboard.com> wrote:
> >>>> On 15/01/2025 14:33, Geert Uytterhoeven wrote:
> >>>>> On Wed, Jan 15, 2025 at 12:11=E2=80=AFPM Tomi Valkeinen
> >>>>> <tomi.valkeinen@ideasonboard.com> wrote:
> >>>>>> On 15/01/2025 12:33, Geert Uytterhoeven wrote:
> >>>>>>> On Wed, Jan 15, 2025 at 10:04=E2=80=AFAM Tomi Valkeinen
> >>>>>>> <tomi.valkeinen@ideasonboard.com> wrote:
> >>>>>>>> Add Y10_LE32, a 10 bit greyscale format, with 3 pixels packed in=
to
> >>>>>>>> 32-bit container.

> Well, this is all somewhat beside the point. So is "_Y10_32" (or
> "_R10_32" if we use R) fine?

IAARDD[*], but "10_32" makes me think it stores one 10-bit pixel in a
32-bit word (i.e. a 32-bit variant of R10). So [YR]PA4 would be better.

[*] I am a rookie DRM developer...


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

