Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1AEC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 22:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M08vr5V1FFY/VGEPTRbay5obQntnMHNlP/FtNo6AK/I=; b=SR9PbuaJGMXd7KQ/ffSxz3SsFQ
	N214KXZG+2jI3wcRBlBvzVFtBqGyVDgSFZE2fpDLydauOCigLkjAKE7rXltuFlJoCUv8iaA5FoNMy
	VrbE10hXh1OY8m6aCb+luNhvudRNhyRyRh22Tl0QFLz6RNII4ISYi1hBEqohaQa+T4kMn67kCCtsf
	qutuyKfoInFLtraXyddg+gpGDEkjwhfyEtofHNmpsxal+Y4xLypROsYZ02b7Tlxv5CF9kLlkjX94A
	E4WRypBnZZiF8jz3rFj9Ac/wy5WUAfUclkZqsqb1ADBFsThBZE/KyJA/tjdatLJlwdJNUMQ26jpDW
	EMxUp9DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujPi5-0000000Dste-0ErJ;
	Tue, 05 Aug 2025 22:00:41 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujPeu-0000000DsW2-0ntV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 21:57:25 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-71a40b3b639so4996687b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 14:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754431043; x=1755035843; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M08vr5V1FFY/VGEPTRbay5obQntnMHNlP/FtNo6AK/I=;
        b=YXontZ2Z9Pv68UF0Z2wCzrn/CYk66vEqbODBZ4YKV0myqRudG8m2b5OwAH/Vn2+Ebv
         0LQmv4wNdV8+AzIGZ7eH8weMBll3MJRyo0DBmm1ZYjM4+lxX/kR6lujpDg8lfr7EKEN5
         vzqrdL5QWb01UTmolf1tWwvAGjAJb+rKnhg0LUkcus2FSgFSCLPQ9DMY+agynOAKnxRO
         7mSNLoiy5YGLjy1KEboHl8Fiz2KtAziCHyKuKYz/aAClSMd5qHOX5holhLGRecgEcIll
         U/k7j6iurAOFQHaFzFPZ5JS8YMusT+i45nnLaHWpiuGWoXIpnzggdl0/pT79U3TPfyFA
         jTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754431043; x=1755035843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M08vr5V1FFY/VGEPTRbay5obQntnMHNlP/FtNo6AK/I=;
        b=voGlXWMgUcd1BOiyrz3+D+u9MElo9AYA/o9eRPYQmQ0WgdmsfYrCR9fdpSdH8SCAHH
         BIf3Fdcu7F4NuOClBCVttKaQZLwoHbIH9Lx1/j0fGiw9cZMZibJ6M0JkHRZEBSG0t9Eb
         yoqRmauYtXyI36kog7KiD6g+CSaXV5FRKidga023edTPmskJbXO+qIx7VrU/hesz7mWn
         YKvXx6nuEPArL5BO0drqzBTtbpjSwBaaN3/4D9oTEvAXtDhWqQ2BO7fcBtNLV1FTuNDq
         Zo2ltV2YitREiohGZwuXdxFB6rQLpo1lFsZG94N+FPw3hIbCuRJ2BrePtj6EOVwt9p1q
         O6Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWN7SlCQHGKheuf1kzYWk4cXvTDkcgmIpQonPhiWoynMHEXfKxKfExzDa1nicU9BGQCOgghLnhQKilj8DJz8gSY@lists.infradead.org
X-Gm-Message-State: AOJu0YxfsCm0dCAg/l4jOe3a2m6mZizlCg+KPBbgsArPFpZg0IdpP+Hw
	/f+k+wSlwzfw6uRrxibmB3y7pnekmKx/5t4fEddw6534RR5jcBCWuNUV9M8DFIQeqmLFXmMLT1E
	VOyvlg34U2rV2N10gNPOft0nIO30I8DA=
X-Gm-Gg: ASbGncvD6UbA8RCxoglHAgqcaN/ceHKOPd0XWeJmmJnA1DRfFRBJ+Ul1APwYl4Ry8VC
	HxPIXXikgLBauT5Y8piyC5UPDSdEBHAujqX6k8fZ1+bgnBvY46fb9gNqrxOTJN3VQ0krj/JpK7f
	yepOxxu9jI981iZ22/g+7PTyq4RClcWIJMVtG9FOY06QQsOZEVwY+33W+e2g6x2U27nC9kqEOo6
	D+5TXM=
X-Google-Smtp-Source: AGHT+IE0oDRKuT0yAxsfT5jR5C0o8KKHh1UoiOgUv9rrLYqZECBGuX0jYG/xbWF0ozPl1SXB/hqGYK2Fiq5iUVoCZ5A=
X-Received: by 2002:a05:690c:968f:b0:70e:53:676c with SMTP id
 00721157ae682-71bc9856e1dmr6469677b3.5.1754431042722; Tue, 05 Aug 2025
 14:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250804154750.28249-1-l.rubusch@gmail.com> <20250804154750.28249-2-l.rubusch@gmail.com>
 <20250804213213d4844d4e@mail.local>
In-Reply-To: <20250804213213d4844d4e@mail.local>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Tue, 5 Aug 2025 23:56:46 +0200
X-Gm-Features: Ac12FXzrW0QiDUGsuXzTSQ12buyuMB-0wmKeue68n0tCbDeLbdVTvyciEvta-Q4
Message-ID: <CAFXKEHZn0XQMe6RBHDJzcGZy+JPpNpfidD1mT2MBmZ_WamFQKQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] rtc: zynqmp: ensure correct RTC calibration
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: michal.simek@amd.com, srinivas.neeli@xilinx.com, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ivan Vera <ivan.vera@enclustra.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_145724_238083_B473A2F1 
X-CRM114-Status: GOOD (  28.11  )
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

On Mon, Aug 4, 2025 at 11:32=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 04/08/2025 15:47:50+0000, Lothar Rubusch wrote:
> > From: Ivan Vera <ivan.vera@enclustra.com>
(...)
> > diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> > index f39102b66eac..0c063c3fae52 100644
> > --- a/drivers/rtc/rtc-zynqmp.c
> > +++ b/drivers/rtc/rtc-zynqmp.c
> > @@ -331,9 +331,9 @@ static int xlnx_rtc_probe(struct platform_device *p=
dev)
> >               if (ret)
> >                       xrtcdev->freq =3D RTC_CALIB_DEF;
> >       }
> > -     ret =3D readl(xrtcdev->reg_base + RTC_CALIB_RD);
> > -     if (!ret)
> > -             writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_WR))=
;
> > +
> > +     /* Enable unconditional re-calibration to RTC_CALIB_DEF or DTB en=
try. */
> > +     writel(xrtcdev->freq, xrtcdev->reg_base + RTC_CALIB_WR);
>
> Doesn't this forcefully overwrite the proper value that has been set
> from userspace and so trashes the time at each reboot?
>
Yes, it overwrites the calibration, i.e. counting 1sec in about 1sec.
No, the time/date is not actually "trashed" (I double-checked that
with timesyncd disabled, having and not having register content and
over several reboots keeping a bogus date/time - it psersistet in the
same time space. The current patch always overwrites the calib
register content. So, a manual userspace setting will be lost after
reboot. That's true.

Would it rather make sense to extend it, say, instead of merely
checking whether the calibration register contains any data - which
could potentially be incorrect - also check for the presence of a
calibration property in the devicetree (or a similar property, since
'calibration' may be deprecated)? If such a property exists, perform a
re-calibration based on the devicetree at every reboot. Otherwise,
retain the current behavior of checking whether the register is empty?

> Isn't the proper way to reset it to simply set the offset from userspace
> again?
>
Hm.. I'm unsure if I understood you correctly. You mean the way as
described in AMD's link to perform the reset by executing the devmem
from Linux manually? If so, why is it preferable to adjust the RTC
calibration manually every time this happens, rather than to simply
put a correction value into the devicetree properties for problematic
setups? Or do I miss something, is there a config file for RTC
calibration for doing this persistently from Linux, that I'm not aware
of?

Before, the devicetree properties seemed to have generally priority
over userspace settings. Now, after the calibration rework, this
priorization seems to have changed and a devicetree calib correction
for such problematic cases will generally be ignored, with a
recommendation by Xilinx/AMD (see link in cover letter) to execute a
devmem command from off Linux (...). I mean, can't this be elaborated
a bit more to allow for a persistent correction method?

Just, let me know what you think about. Thank you for the feedback.
Best,
L

> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

