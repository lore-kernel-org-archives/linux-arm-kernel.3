Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E171BE74AC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 16:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9lt53vsuFinYfQPPMtO0BSGgjTyTuTC1kRLkpQGt78=; b=exFYJJuU79qZBpaY9eqs2H6L8A
	OQXnAYCXlA+ThPeBwKcMpZIDhJyde+gy4IBTcpgC7IY/DEFI9pZVrPjB6Lt2r4SDWQG34NXZHqQpL
	8ehJna4hqsHpDbxBSH3VUNMKROUL+4mwxP5P2ob5KUTbgXOn05ouF5L86g4mjTA5mRigADq8hEj6s
	nvTvZ4nSRbN9opTaYBXm44eZA0hYFBlh4YhW4/8KHAJN/4d6FS01pFgq1qVu5juE6cDsuT/Bwyq8P
	wMS7VR4xXvYpRtgIboB0KkGfYhzs4yiHN95UYfdEdhYLcCO2/gv+oTjeCUJkCxfPQkAqcBuNxIvqD
	etxE15Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWBn-0000000AB05-1Q1M;
	Tue, 03 Dec 2024 16:55:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIW7n-0000000AA5z-1VB7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 16:51:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733244706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9lt53vsuFinYfQPPMtO0BSGgjTyTuTC1kRLkpQGt78=;
	b=UnfgvVIAE490iHJ/MPgclBJ0mB5ad5ps46K6umpG+aApeZjaAx44ItogauzAvm2NabtFwo
	TF9r861sN49ewW9BIBUX5Yn56scZIAkIRju+nzvnkDaqAmokfFaG6nAtTV94D9oJdktcQg
	O2AnfGYdO1/JPr9fQ9parU9iCKA3oN0=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-iHSKdb1qMLCDMVRNMJExxQ-1; Tue, 03 Dec 2024 11:51:44 -0500
X-MC-Unique: iHSKdb1qMLCDMVRNMJExxQ-1
X-Mimecast-MFC-AGG-ID: iHSKdb1qMLCDMVRNMJExxQ
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5f26520392aso22250eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 08:51:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733244704; x=1733849504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9lt53vsuFinYfQPPMtO0BSGgjTyTuTC1kRLkpQGt78=;
        b=G9p4VVU3WaL/ncaV0vizRsXzVn9PNLB3TWRalEfjY3TcMKqL4/bT3woQxSLN0zK4JT
         T1wyAr7BZnFaPTybBK4mY35AvT8u1zqxz0PQc17P1oFEERPHkHZj4KijKu0pSgKey+HX
         kdHNG2XHFU6HEn5V9Zgbo76c4WycjkgICV06TOBo+DziLXspnR/2J4+8puAEdvHVm5wi
         WPa4FUptow8Mblp1+E7pnxaMpxHldQRdG392a1+1Px+YVxCz2OcnHo4GiLrgjwFCUC7T
         7TGrjxbp7JMEOEEM4dGa5lCG7drDsR+adyKlLtV++O+gw2qd3R0YgLcnFTkQKRuD5fSS
         whYA==
X-Forwarded-Encrypted: i=1; AJvYcCXm9qY12r387dO8GZvCv2Y2mAXpFf/8/1CF/l2KFm4LIFOV8vR7N9r4KtAwx6HaDIrra/VQQUKpDKanOCaYAcPL@lists.infradead.org
X-Gm-Message-State: AOJu0YxRq09KBhJcV2lziK7FQOyNWzcvDDH/fnkEUFUczHP6ZF4CKHRX
	e0zHfUFZPFyYdJUzEKHO9g7FbHvoFTHrzx2mDMcDhmh+0T4OVdTUth+gDQ7/0X1KRNy3YLgOTj5
	DAN5JzsNpbRufVImKHi3Qzy9tMvspLJuZWGxujHgq49bCrotT922bRrhjoF+68rTqlwYZzDxVU+
	4Cm+/EsbPxFzP34/WItYMW65273Xpx0/vT9CqiU/q7b6JNCrY=
X-Gm-Gg: ASbGncs4JPJMwDNLoc1vAsmVa9JDMKxlWRhVE7w7C8VTbcuenNx/Wf0mxQWQ6yW1+2z
	N77ff105bdr3NI2wHGUaq10lnxqL49g==
X-Received: by 2002:a05:6870:b526:b0:29a:ea3b:a307 with SMTP id 586e51a60fabf-29e88852dedmr743626fac.10.1733244704095;
        Tue, 03 Dec 2024 08:51:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzceRUoX3DvEQufLmwTQCJTEwNRUOUtXnGjhdEjvUwvKuNpVXgMIpmPswi4qlPBGvFF8FPGxubxqQ5PeUM7BE=
X-Received: by 2002:a05:6870:b526:b0:29a:ea3b:a307 with SMTP id
 586e51a60fabf-29e88852dedmr743612fac.10.1733244703832; Tue, 03 Dec 2024
 08:51:43 -0800 (PST)
MIME-Version: 1.0
References: <20240615093433.3659829-1-s-vadapalli@ti.com>
In-Reply-To: <20240615093433.3659829-1-s-vadapalli@ti.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 3 Dec 2024 17:51:33 +0100
Message-ID: <CALE0LRssDPn2UAscbCdx2UsO3cQYuYHpBsdGxEWje9LCf4Hr4w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Enable PCIe Multilink and USB support in Cadence
 Torrent SERDES driver
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: vkoul@kernel.org, kishon@kernel.org, sjakhade@cadence.com, 
	rogerq@kernel.org, thomas.richard@bootlin.com, robh@kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LNKLH-EYu45aZZ0-2_uxUn9SKJ_rvdDUwWKwPOfySHo_1733244704
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_085147_484836_7BF30966 
X-CRM114-Status: GOOD (  14.62  )
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

Hi Siddharth,

On Sat, Jun 15, 2024 at 11:35=E2=80=AFAM Siddharth Vadapalli <s-vadapalli@t=
i.com> wrote:
>
> Hello,
>
> This series adds support for standalone PCIe Multilink configuration
> along with the support for PCIe Multilink + USB configuration in the
> Torrent SERDES driver.
>
> Series is based on linux-next tagged next-20240613.
>

Seems that these series didn't land, I think they are still required
for the AM69-SK board? There is any chance that it could be rebased
and resend?

Thanks,
  Enric

> Regards,
> Siddharth.
>
> Swapnil Jakhade (2):
>   phy: cadence-torrent: Add PCIe multilink configuration for 100MHz
>     refclk
>   phy: cadence-torrent: Add PCIe multilink + USB with same SSC register
>     config for 100 MHz refclk
>
>  drivers/phy/cadence/phy-cadence-torrent.c | 276 ++++++++++++++++++++--
>  1 file changed, 257 insertions(+), 19 deletions(-)
>
> --
> 2.40.1
>
>


