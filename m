Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C87D5E12D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 05:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCTltMBUOe3yPWk3k2ae1sCDON4I33qScm5ujUxlfMY=; b=HgCXzPKHxlrw1LioWSyvjI4z6/
	RmO8KkBEMCWi+yU3zKB8FoCPgmKyqTjSiNjjuQ3MElD9HDPqy7rctZYVqvqopgoDIFboFagD1lmYm
	d6+C0vy0TK0CwQ6n7lDTCOJvaIUSAmDVb5Nszb9pAxEFOKd+U1NA9Goua+9/etpv2SOZ4m4SQVAJ3
	VbUQ8P+nqveDTNEv2q8Y7+R9VO8d9DuFqvEIvUSFwsiRVpoHlsGoU3EqcVxst9zY7mNzH8k196wOb
	8uRqCo9FQhW8Igg3XP0z42BaBxutjM9uobr9PP60p1y7P40M/hA6cI+Ja3vrLgYfzI+H/bZKEW07o
	tjCbVIeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9HHq-00000009MRP-2ceE;
	Fri, 08 Nov 2024 05:11:58 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9HG5-00000009MBY-28Vo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 05:10:10 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43193678216so16029015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 21:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731042606; x=1731647406; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCTltMBUOe3yPWk3k2ae1sCDON4I33qScm5ujUxlfMY=;
        b=eEdTW5/H3BeqVjZSRUrpupjhPA9JyktQSk7AgrgczkN+ULq3rM9eGAROJLQuUcWORY
         YjoNXocw2ZFHMEnzBHwNjMdTZ+R/pq9fll/SsOaDRGFy6N5XHJ02isBhoND756YKKi85
         JhC1OnOlL5cL5iHrZsuZ1T+hHip5ehAtQaTh00Fq0HLrQYR9bFe7rgi96Gizxlq0I7Ix
         k4CkvvS/m+Ny+oCv/9uows3cNO/94AgSTFZMyR1TLdPQkQW6TRk/Orvh091eRJaLrKju
         FSpu8kQ+QZFPCASFaW8H4yxVLa0r3tx4czFe8srLeinkdDpIg6j0CmuwQ2EoLPjh/mcr
         z3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731042606; x=1731647406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCTltMBUOe3yPWk3k2ae1sCDON4I33qScm5ujUxlfMY=;
        b=NcAAIcruACaYY/ZSds6fDUDEmqhJR4LJwFX6/GRcHveQOXCPTeShVq8hNNMZQcbdXi
         C3Za70WAlenpIL9ipla7M96nGArgqZgUIvnj3Tin8phFf/PAeioujYhtxRPx6PcToggk
         S7sgO1GnD0Vn9YISAm1pKPtuKI730NrBfg8aLXJlLIIk4nLsxoOTjKGwogoTFOIf4gdZ
         TbmYD0EiMBTjDwq8MoW31pxKoV7ukw1tNhyUY6So5g74Kwsu38fVmeoe14HBT+VaRO0p
         8IE0oiemjt293HPuiqCXqfzVl5vWidxLQmK9OA2qb6ytfU7/Y6HU9Gw2CPY7mNsmOJnE
         tvqg==
X-Forwarded-Encrypted: i=1; AJvYcCVPh4qJDwINA7jH7QDSr9z9OteNxWgfwXgk6g1Gvt23zUVbNavRfrHwxSP02WQC6lj2URN9y6t5iHf5p9cYa2Dy@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbc3xyU2SsriJvlS7yOsxMMmHl+NeptpXto9ieaAUB4fVbr/NR
	Nj+l9t2RlLBQz+typu48YWff5Lns8JsNLXI5xkksVVOsOtRoAHE+Dsc9/FyKTuOB4HGkEz3kUix
	aObA5uSPjCiAwp/UVWwXiUwYddEBLaw5V/828
X-Google-Smtp-Source: AGHT+IEV2dzAqmw7gBPSZr2rfVz9Av1LIMYf4LLsc4fX52nHbzut1u1+/GxLTeCi31l8asrJgGvOR6vcFDh71vEYuU8=
X-Received: by 2002:a05:600c:5488:b0:431:9397:9ac9 with SMTP id
 5b1f17b1804b1-432b7507c16mr8129645e9.15.1731042606199; Thu, 07 Nov 2024
 21:10:06 -0800 (PST)
MIME-Version: 1.0
References: <20241107215921.3518636-1-ctshao@google.com> <Zy1oBfroZLBwN6Jf@google.com>
In-Reply-To: <Zy1oBfroZLBwN6Jf@google.com>
From: Chun-Tse Shao <ctshao@google.com>
Date: Thu, 7 Nov 2024 21:09:53 -0800
Message-ID: <CAJpZYjWy_c=Yhs-YnMyUM0BJvjmUGE57FTu66iSf3E02vObyyQ@mail.gmail.com>
Subject: Re: [PATCH] perf/arm-smmuv3: Fix lockdep assert in ->event_init()
To: Namhyung Kim <namhyung@kernel.org>
Cc: linux-kernel@vger.kernel.org, Greg Thelen <gthelen@google.com>, 
	Robin Murphy <robin.murphy@arm.com>, Tuan Phan <tuanphan@os.amperecomputing.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_211009_581703_2988165D 
X-CRM114-Status: GOOD (  24.20  )
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

Thank you for your feedback, Namhyung! Please see my v2 patch:
https://lore.kernel.org/all/20241108050806.3730811-1-ctshao@google.com/

On Thu, Nov 7, 2024 at 5:23=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> On Thu, Nov 07, 2024 at 09:59:20PM +0000, Chun-Tse Shao wrote:
> > Same as
> > https://lore.kernel.org/all/20240514180050.182454-1-namhyung@kernel.org=
/,
> > we should skip `for_each_sibling_event()` for group leader since it
> > doesn't have the ctx yet.
> >
> > Fixes: f3c0eba28704 ("perf: Add a few assertions")
> > Reported-by: Greg Thelen <gthelen@google.com>
> > Cc: Namhyung Kim <namhyung@kernel.org>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Tuan Phan <tuanphan@os.amperecomputing.com>
> > Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> > ---
> >  drivers/perf/arm_smmuv3_pmu.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pm=
u.c
> > index d5fa92ba8373..09789599fccc 100644
> > --- a/drivers/perf/arm_smmuv3_pmu.c
> > +++ b/drivers/perf/arm_smmuv3_pmu.c
> > @@ -431,6 +431,11 @@ static int smmu_pmu_event_init(struct perf_event *=
event)
> >                       return -EINVAL;
> >       }
> >
> > +     hwc->idx =3D -1;
>
> I think you should update the event->cpu as well.
>
> Thanks,
> Namhyung
>
> > +
> > +     if (event->group_leader =3D=3D event)
> > +             return 0;
> > +
> >       for_each_sibling_event(sibling, event->group_leader) {
> >               if (is_software_event(sibling))
> >                       continue;
> > @@ -442,8 +447,6 @@ static int smmu_pmu_event_init(struct perf_event *e=
vent)
> >                       return -EINVAL;
> >       }
> >
> > -     hwc->idx =3D -1;
> > -
> >       /*
> >        * Ensure all events are on the same cpu so all events are in the
> >        * same cpu context, to avoid races on pmu_enable etc.
> > --
> > 2.47.0.277.g8800431eea-goog
> >

