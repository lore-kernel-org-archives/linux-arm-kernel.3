Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AFCC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 09:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TV0FE2GNI/NjTuPPZBCSl4b/181TO/jsYtqVMyKlwQY=; b=0TjF+ZHZfVfQry0hNj6hRM4jxz
	w08EBSxJT8CLY/Ni7NvXgrSaEAr7aQ2QBC+9Px3OL19va+AehE54L/s4GvcQzEwZCEmjHgf3ENuMA
	wTh7PgGlbf0CHd5ED7fm4LBq4tzyAvsqiPMf4h1DWR40VECr/Plk7kKx+GCbJqnXri1b8t8+nN4Fw
	kCU/WcHeaO3iCwpijBB/SC24htBQRVj34SsNERaUTsC29SDD1YJSApiRGY4s2CY/TrHiLwiB7Pyb5
	ZMHL+I16rtsJUg8gUY2LFDlqxjlbLZflpd/WGgmQKzUEQAuptCbtfXyP8CSy4DMvmV+C9xUaFsSgV
	z2jz1HNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYM0t-0000000ELQE-3IVl;
	Thu, 16 Jan 2025 09:18:07 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLwy-0000000EKhr-0eRw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 09:14:05 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-218c8aca5f1so15283395ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 01:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1737018843; x=1737623643; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TV0FE2GNI/NjTuPPZBCSl4b/181TO/jsYtqVMyKlwQY=;
        b=a1H+ZgV/Z0Bp1ObnBA7rjjrlgpOgqdHbEh4QijqohspzwQhRZfPXSSWnv4fvxK1l/f
         7+TJwiZ3Zhnvehxz9uMaKYw8KfN88/GggMf3VbuGpOKbOdOuVpa7s4jIupZ/jARiy8gF
         JEJh+oTgmoFRgCWvuLq720/ySzofYvm/kg0qCvdjsfaJZiKgyxihYyGydyNwtCu8Ku57
         JMoWVu4EFl7/5AUe6XFlXiC7NmP8uUvJISyhHCM2p+/qiVwhwpJPjrrL3CiDM58DOh6E
         EN0S7ikg/qqvZk3ga0JZUTiYPC6LeYTCyJQyIOROP1L0xUcyRaTh/xl/AQajrBWG5ld9
         bZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737018843; x=1737623643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TV0FE2GNI/NjTuPPZBCSl4b/181TO/jsYtqVMyKlwQY=;
        b=vzBWfxf6gbwUkVTO9KxIoUqssY2nuZ+/r9mtKFi8CDLJ9JCqD+ZppPJ1LSS0ezVlb4
         bkV5rXHDP9QCMMRhuanLHeDucne/ZuBpBSUZBd6FNXYzc/bhUDzPY+vsVegZVrBY2yDt
         IzYeTUV/X2NqtrW0Tu3YpjVmbZSXKvSMIo3OQILbVthVWpZ1/23SO6QVEPi2+wQk34Bs
         bLyOsuQex6afoi7RZYSurK3q8GHt/Ku8+ncS57iXUqwFHBC3r3G/b2QC1BJCzRHMDiwN
         LpNr5XXYf+YKVZ+SHZbtO63J9q0KRmpZlPbux5+arhMEZdNRYUPIW4R1DiRToN9LZlUZ
         3MUw==
X-Forwarded-Encrypted: i=1; AJvYcCUtfCPamOSYbQZr7N6qGqSi/RangtdcM929tURz0ZwNZMp8V0IfcQHgB1ySjtZMCPluKfCQTfBELNo6W26VA9kM@lists.infradead.org
X-Gm-Message-State: AOJu0YyOBFk/LL1RhjQ8LJwOWtn17E0aa3wL+4Tm7aeL5pNxqWj75o7/
	V3lAdLNrTIM0OSvuzpiHrKAp8LUy2GmewpHiHCdCd0A11Z/luNq3qTVrEifDjS102Y/xj3dlgeK
	oEX/c8ZQkFUqhif51c4ElkfL819DiIUVSADF2FiDL3Ppzwh0Ac9I=
X-Gm-Gg: ASbGncvlPe2w9NotUI2qI+QtReSQxGtRUcypIO7WKhHlag9wPep6gpsRmyukYeHKCRe
	DKHze9arHFvBw9M7VOOpZWQcG3md/ILkzfd6UUig=
X-Google-Smtp-Source: AGHT+IEjZmLnlSrM2c9tJMzrCQEX+VT7/9poFZl5CaNTLm4Gep2OpQ9AnG0xm/tqxK9P21RK1G0vXhdV9Pjz15wyMWA=
X-Received: by 2002:a17:90b:248b:b0:2f6:f32e:90ac with SMTP id
 98e67ed59e1d1-2f6f32e9102mr18527641a91.11.1737018843058; Thu, 16 Jan 2025
 01:14:03 -0800 (PST)
MIME-Version: 1.0
References: <20250114160630.1122885-1-robert.marko@sartura.hr> <Z4h4WePiB7G0BZj-@google.com>
In-Reply-To: <Z4h4WePiB7G0BZj-@google.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 16 Jan 2025 10:13:52 +0100
X-Gm-Features: AbW1kvb6Wbch-_SDtQBSBmayQ1PiWkForCyaBaSp3jeUes4jaRjU4HfPWWZB49o
Message-ID: <CA+HBbNHia9X+9LcR2oOJ+q9RhCaknTH+EZOu44FNo1TS9o9VhQ@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: add missing header
To: Pranjal Shrivastava <praan@google.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, luka.perkov@sartura.hr, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_011404_198638_2311647C 
X-CRM114-Status: GOOD (  18.93  )
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

On Thu, Jan 16, 2025 at 4:09=E2=80=AFAM Pranjal Shrivastava <praan@google.c=
om> wrote:
>
> On Tue, Jan 14, 2025 at 05:05:56PM +0100, Robert Marko wrote:
> > str_read_write is currently undeclared and thus compilation will fail w=
ith:
> > drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1911:25: error: implicit de=
claration of function =E2=80=98str_read_write=E2=80=99; did you mean =E2=80=
=98sb_end_write=E2=80=99? [-Wimplicit-function-declaration]
> >
> > So include the missing linux/string_choices.h header to fix compilation=
.
> >
> > Fixes: f2c77f6e41e6 ("iommu/arm-smmu-v3: Use str_read_write helper w/ l=
ogs")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202501111926.qOpnlK9J-lkp=
@intel.com/
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iomm=
u/arm/arm-smmu-v3/arm-smmu-v3.c
> > index 0e4cbb2c64d7..a0e395da8a88 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -26,6 +26,7 @@
> >  #include <linux/pci.h>
> >  #include <linux/pci-ats.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/string_choices.h>
> >  #include <kunit/visibility.h>
> >  #include <uapi/linux/iommufd.h>
>
> Hi Robert,
>
> This fix has already been merged to the arm/smmu/updates branch [1]
> which should appear in -next when Joerg next rebuilds the branch.

Hi Praan,
I looked for an existing fix but couldn't find it before sending it.
Glad that it was already fixed, please ignore this patch then.

Regards,
Robert
>
> Thanks,
> Praan
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git/commit/?h=
=3Darm/smmu/updates
>
> >
> > --
> > 2.47.1
> >
> >



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

