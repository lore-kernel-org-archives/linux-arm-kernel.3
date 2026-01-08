Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE10ED0D17F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbEIwAU7GAA+mXs67rDkwlR9RhYSgRbcLQjq1Ae4a+8=; b=cz5WezYFKAEtvSXcMQzq/BhRwp
	Dn/eyUWwcxcP9m8KpV46J7jcU8ysA5uFbPvFhHyXzZrO06eJoUvC4sc6hEmwdnE7mfIJ+jaVcEMQs
	9aWC9jAnzbMot5MHQ2MQ6C6dRnuWljRs4ZhNWgpJ6PVVr2vd3Nw3lNlQ5a+fIxvMyvNze1o85u23U
	bQTaGnZ4P0ggkWwhgQHc+d+Q6/lWY8KDuyvKA3R80aLA6EAcwa1haft3z7Ost4pNIAs/8PybvPNqH
	ehrZB9KnxvXmF84L2iODC3G1y/JAP4saj4bg66orAFQeudF6HtBJG7ogIuopmSHnklFyR3YvLvcvE
	PlML1lZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqvf-0000000HKsL-3NnD;
	Thu, 08 Jan 2026 14:24:00 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqvc-0000000HKr0-40kD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 14:23:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso29469635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 06:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767882235; x=1768487035; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CbEIwAU7GAA+mXs67rDkwlR9RhYSgRbcLQjq1Ae4a+8=;
        b=mRxw0FO1M7pRBDBXKGKCZ6GykbP8waERK47F0oDOTciwXhcDg85/9SO3k83sAeAB73
         Pt5aCv0kjOPkLKjfZyfmQLECy724aTbkNahw23SXtNtVtpnZJlCbxMH0DhW1gCxMEkpD
         fR3DFgwC7fBBPY7jibfpXSYFrP9WH2cX/rhiv8tGtu6OgwuZBAXwI6g5RAudbUhfBvz5
         K70XXUF16+gJPEw0y/TRlTtquIxxe9QOXe4mRGh+6EVwM9X8zigStt1hEv4kmqpGRNn8
         tgcyy0oLKbRDH0a+3wzBDWkAtBxGKjJW27w+9z/7qDQKZHLfN5FUgOB3GjreP3Rs7l4P
         8tDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767882235; x=1768487035;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CbEIwAU7GAA+mXs67rDkwlR9RhYSgRbcLQjq1Ae4a+8=;
        b=KL8++HPNEZP3WT30Qcs/PmYr7eKXyaerfM4lFxQsSd2QDrAY/ZCuyGUY0Jx4cAymJf
         jhL81mukKvoGiWA1pe35Oj0rS2opoKWg6+bJukUN/pZCmu+RfRH8Bi+pW9f4HfEmoafS
         82l23rOod3vEtRjHE8RfnTng6nvdZV+tqZhmQBeAL4DBUUFHB/ptilLOH7f7GT5lBVh4
         Jc2WWtPGbsuM3AGBac8LB91UdgoLKwTHiQbVxVVICavjHDgaDzkMNxkfSxg41BuaG+4P
         E5FSuB4XnnJ4HLYnwyHAV4lrnRhX3lsLfZn5hO4+MolwQ/NsWvlH9lL+M05Vusk4OYdR
         GINg==
X-Forwarded-Encrypted: i=1; AJvYcCX53MeXWfGDMLlBIApMOFMegsERZrFFtwnMmvEqIep3UxYAG9ofivT+b/iK714k3Vbo32dKoBASmSR7vO3o72CL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1E1o40UXNB2GrKkkQxC1CeGMJHV3oPKmO8ezo9DB72mwao4qY
	un8eowaPRqx5IfVUcJM0WRTGwUkT+4ERvoy5vuSalG8+Ou0JPrwuc4wm
X-Gm-Gg: AY/fxX4KOZB0e4Trk/a2B2lA67g4SR8UPsla0e29O/8aMQQJubQxLNnVDWfrzoRuP1I
	OBNKxFRhhmCILYc72FCyUyge+csg1hZcPHAhanoVqK7ZcgxEpDMLgOkepTYDB/9l1oaboIsysc0
	aF3WSxFS/qvrOaB0ES1l7ZnM6HOzbeBMc/yCcglJstHPBAKugp7O45xwB3ckQn40iwwlaT8QO27
	MSvbn2wK5z0H1WNl9zNXVq46eh0+cCpQeJLG7mCPcm4G/NnnXIgIOqDpSCLmNMhaAtKsf72lhBA
	y25lSLbdKAOaSx0BcI2oZOtRQ724ienY+ZwxvEHgYmLSm/XXeVpl42vhzDbgEpjP+ngKTmx/Ygq
	x0Zi0M464cHI7pTuBAkFloU2iltUEZ5mTX07UgW+jGIhxzq3MjkEehrzTiwzZY6aEo8e+TSRIsm
	w6peT/hidtBjxQhomH1TFUssPDTRwld0s=
X-Google-Smtp-Source: AGHT+IGrAIR3h5+3+2bI+Bm/hEmtepHzSEt6BlpptTcw9DQdznBeg4xrAZSGuCIhCP/cnLqZ7xIjVw==
X-Received: by 2002:a05:600c:5490:b0:471:1717:411 with SMTP id 5b1f17b1804b1-47d84b33bc0mr87200465e9.24.1767882234857;
        Thu, 08 Jan 2026 06:23:54 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8715b5f7sm40594805e9.4.2026.01.08.06.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:23:54 -0800 (PST)
Message-ID: <a47ca860adb760ad2bf9e3e0d233b0b2b6f73200.camel@gmail.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt
 Trigger
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Vitor Soares <ivitro@gmail.com>, "Markus Schneider-Pargmann (TI.com)"
	 <msp@baylibre.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	 <vigneshr@ti.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, Kendall
 Willis <k-willis@ti.com>,  Akashdeep Kaur	 <a-kaur@ti.com>,
 linux-arm-kernel@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 08 Jan 2026 15:23:55 +0100
In-Reply-To: <49bfb30f71eae0844676e6b545d67739b6d79539.camel@gmail.com>
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
	 <49bfb30f71eae0844676e6b545d67739b6d79539.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_062357_011533_9CA52CB7 
X-CRM114-Status: GOOD (  17.46  )
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

Hi Vitor,

On Thu, 2026-01-08 at 14:07 +0000, Vitor Soares wrote:
> On Tue, 2026-01-06 at 17:22 +0100, Markus Schneider-Pargmann (TI.com) wro=
te:
> > Remove Schmitt Trigger from mmc pins. With Schmitt Trigger enabled
> > u-boot SPL is not able to read u-boot from mmc:
> >=20
> > =C2=A0=C2=A0=C2=A0 Trying to boot from MMC2
> > =C2=A0=C2=A0=C2=A0 Error reading cluster
> > =C2=A0=C2=A0=C2=A0 spl_load_image_fat: error reading image u-boot.img, =
err - -22
> > =C2=A0=C2=A0=C2=A0 Error: -22
> > =C2=A0=C2=A0=C2=A0 SPL: Unsupported Boot Device!
> > =C2=A0=C2=A0=C2=A0 SPL: failed to boot from all boot devices
> > =C2=A0=C2=A0=C2=A0 ### ERROR ### Please RESET the board ###
> >=20
> > I bisected this issue between u-boot v2025.10 and v2026.01 and found th=
e
> > devicetree merge to be the problem. At a closer look I found the
> > k3-pinctrl.h changes. Disabling the Schmitt Trigger fixes the u-boot SP=
L
> > failure to read from mmc.
> >=20
> > Fixes: 5b272127884b ("arm64: dts: ti: k3-pinctrl: Enable Schmitt Trigge=
r by
> > default")
> > Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
> >=20
> Hi Markus,
>=20
> We're seeing a similar issue on Verdin AM62 with U-Boot 2026.01. The
> board has complete SPL boot failure with no output at all.
>=20
> This occurs in the same version you bisected (v2026.01 failing).
> Could the Schmitt Trigger changes also affect Verdin AM62?

they do affect AM62, even though not not every HW, I have one HW variant
working properly and one where I observe the problem. Maybe a revert
of 5b272127884b for now would make more sense than just fixing AM62A7.

I unfortunately do not have any reply on this from TI yet.

--=20
Alexander Sverdlin.

