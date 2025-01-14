Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28E8C02185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80y0ZD2DqPk4N5CYZbDl0WM8yXhgHTstPGSnJZeMvKg=; b=N+zLNk05ACXIoNkqLq7splQeo1
	bR/yEVb6z1BrsPs2AwQ7c6l4ryzMd2J05zA5enlQK+Sva/M/C8+uvtjJbgXJWl3GzGaGh1QdPkCVT
	DMbq3H17+LxLgC3PPNF51ZTnW+1JNMMLAy+GqzI80oZfhnpFcBWCgqqIYaP6+KWIu4WDymGyTDbAI
	sqOPcR3L1m1O5x/H7LdQnCqHys+s5sdJ/kxUrZdf4mtQUi3cTelCeDe3D1CbdqNkFAAF7Qeskg9Mh
	7/0c3OZGmiDs9yQNvns8NmZx3qXxibQAUJCGMU3Wx2YPGEfcZmBm956T/VDRko7UeHN0EPolo9Nl1
	czf6eAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkCt-000000096Cw-2dVE;
	Tue, 14 Jan 2025 16:55:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkBd-000000095wP-3NYF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 16:54:43 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43626213fffso41329025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 08:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736873680; x=1737478480; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=80y0ZD2DqPk4N5CYZbDl0WM8yXhgHTstPGSnJZeMvKg=;
        b=qayvh7cXaL2HRDifWgZ5641H5mlfVEjBGOwAklBX593DpwxTtBx1Ru8nGlrSUNA+fU
         eJAZ9RwLdztFaPmxNn4fVXmWQSg4yRYNMEl9UPPWEb/McwNmTe5HtVv9Wf86+N0foZ4R
         vHLTrbcv1gFHkhsId9+X9LInMc0nERbB4oiXcohm96iRz0UX42qP8FpavDzYsudNM2Q0
         az/XIfT1WjPME64h0M4fHvX0p3iR54FuWsOzA+qUoY3s6J3wumsS0pC6vObfH4RdkMYh
         LkKWXE72BelpCDvwx/hC7/mu3ZgiGXxHmTOOskXhQX3AvZ34vdhFLiZlpXUK5UZwyZ0m
         gEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736873680; x=1737478480;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=80y0ZD2DqPk4N5CYZbDl0WM8yXhgHTstPGSnJZeMvKg=;
        b=eRIlmyTcL+IFjABn7Hzn1+oFVMRbw7utOh5x1a/Pur6f1zCF1++fD2rHawiIVv/RZ0
         uC6Utq3HoM4qwqvGmNve0l+FJsh7bDuWunvq+6aIIQ7rHHiSHZAJ6sP/Ag2MNAQXCkfp
         exVDC7z6tiiRWRTAJVvSN9h3vbQ+/e4suzENikk//JAKvFhYMa5P+M8VxG0oEY3528wt
         wdXE7LTEqJfznyRGHYTEXdaKzGj/1QkHdo7fW1X2dRHKJvHr2nZZ7Tb0lYtLUpiJTBpR
         bi7E2Q48hFx9jLgqgmU/adEZaz4Ul4YYaloBWac1D4L1jutujJwHySWHOnPzo8zwEd6P
         214Q==
X-Forwarded-Encrypted: i=1; AJvYcCXM1Y0ibVWhzGO72Qy5OFbaevVO5s1cMn90ZEs1EmF2HaE0PGBrLIYMd5AZVV8ebY6uKYh2Bg6eP97Lu+yjDI8V@lists.infradead.org
X-Gm-Message-State: AOJu0YzJH4dFrAXWbwdCTL2FMSTHKykNGXLZ6DGiDz8VyGaNBuOS1Wop
	EkBIeSpdv2pLeLsmopY/OgGMqXSrvL3PrvASf3pefEJMq/B+mFurbQ+T1avQ3qk=
X-Gm-Gg: ASbGncvGEAwkJ8/gT3cppw7fBmAZhIwd9V5s3e0OBhsAJ6XIMqRel0X0C3iyuLOx8VZ
	WwYXYjqfos+CRyoW//BSjSaOirSXJ06qCSmLrCDGTwGlaXWYNgreObx06AbpgLR3cIaVRSYDUw2
	uKWLT8mL5+Xqpmgv4HHIBnZ5O5w70vqrSPIwJjVNHcGObgRZHBcfZnp3FxH5q4+X/qIPqkpOXb2
	+T1t1UGIMeQYgUWL+ZsFgdblNnBpgJDnG8c9gV3VgzcFhNlGJ9L/gS25Fw4HIW331I=
X-Google-Smtp-Source: AGHT+IFiSz9B8Y/tFYQ0oTGPiQrOjEXpcMKzTOAox1qutsuyH4237qdiFg4uxD6I3EHJ58Yi2W/NwQ==
X-Received: by 2002:a05:600c:3d0c:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-436e9c9c052mr164758145e9.0.1736873680089;
        Tue, 14 Jan 2025 08:54:40 -0800 (PST)
Received: from [192.168.243.26] ([80.233.75.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc0bb7sm213674845e9.16.2025.01.14.08.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 08:54:39 -0800 (PST)
Message-ID: <98bc4711aaf8d35f36435da8901e2805d3984db1.camel@linaro.org>
Subject: Re: [PATCH v2] scsi: ufs: fix use-after free in init error and
 remove paths
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>,  Bart Van Assche <bvanassche@acm.org>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Eric Biggers <ebiggers@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, kernel-team@android.com,
 linux-scsi@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org,  stable@vger.kernel.org
Date: Tue, 14 Jan 2025 16:54:37 +0000
In-Reply-To: <20250114-ufshcd-fix-v2-1-2dc627590a4a@linaro.org>
References: <20250114-ufshcd-fix-v2-1-2dc627590a4a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_085441_856764_B95EA983 
X-CRM114-Status: GOOD (  20.13  )
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

On Tue, 2025-01-14 at 16:16 +0000, Andr=C3=A9 Draszik wrote:
> devm_blk_crypto_profile_init() registers a cleanup handler to run when
> the associated (platform-) device is being released. For UFS, the
> crypto private data and pointers are stored as part of the ufs_hba's
> data structure 'struct ufs_hba::crypto_profile'. This structure is
> allocated as part of the underlying ufshd allocation.
>=20
> During driver release or during error handling in ufshcd_pltfrm_init(),
> this structure is released as part of ufshcd_dealloc_host() before the
> (platform-) device associated with the crypto call above is released.
> Once this device is released, the crypto cleanup code will run, using
> the just-released 'struct ufs_hba::crypto_profile'. This causes a
> use-after-free situation:
>=20
> =C2=A0=C2=A0=C2=A0 exynos-ufshc 14700000.ufs: ufshcd_pltfrm_init() failed=
 -11
> =C2=A0=C2=A0=C2=A0 exynos-ufshc 14700000.ufs: probe with driver exynos-uf=
shc failed with error -11
> =C2=A0=C2=A0=C2=A0 Unable to handle kernel paging request at virtual addr=
ess 01adafad6dadad88
> =C2=A0=C2=A0=C2=A0 Mem abort info:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ESR =3D 0x0000000096000004
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EC =3D 0x25: DABT (current EL), IL =3D 32 =
bits
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SET =3D 0, FnV =3D 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EA =3D 0, S1PTW =3D 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FSC =3D 0x04: level 0 translation fault
> =C2=A0=C2=A0=C2=A0 Data abort info:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x=
00000000
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =
=3D 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, =
Xs =3D 0
> =C2=A0=C2=A0=C2=A0 [01adafad6dadad88] address between user and kernel add=
ress ranges
> =C2=A0=C2=A0=C2=A0 Internal error: Oops: 0000000096000004 [#1] PREEMPT SM=
P
> =C2=A0=C2=A0=C2=A0 Modules linked in:
> =C2=A0=C2=A0=C2=A0 CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 6.13.0-rc5-next-20250106+ #70
> =C2=A0=C2=A0=C2=A0 Tainted: [W]=3DWARN
> =C2=A0=C2=A0=C2=A0 Hardware name: Oriole (DT)
> =C2=A0=C2=A0=C2=A0 pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS =
BTYPE=3D--)
> =C2=A0=C2=A0=C2=A0 pc : kfree+0x60/0x2d8
> =C2=A0=C2=A0=C2=A0 lr : kvfree+0x44/0x60
> =C2=A0=C2=A0=C2=A0 sp : ffff80008009ba80
> =C2=A0=C2=A0=C2=A0 x29: ffff80008009ba90 x28: 0000000000000000 x27: ffffb=
cc6591e0130
> =C2=A0=C2=A0=C2=A0 x26: ffffbcc659309960 x25: ffffbcc658f89c50 x24: ffffb=
cc659539d80
> =C2=A0=C2=A0=C2=A0 x23: ffff22e000940040 x22: ffff22e001539010 x21: ffffb=
cc65714b22c
> =C2=A0=C2=A0=C2=A0 x20: 6b6b6b6b6b6b6b6b x19: 01adafad6dadad80 x18: 00000=
00000000000
> =C2=A0=C2=A0=C2=A0 x17: ffffbcc6579fbac8 x16: ffffbcc657a04300 x15: ffffb=
cc657a027f4
> =C2=A0=C2=A0=C2=A0 x14: ffffbcc656f969cc x13: ffffbcc6579fdc80 x12: ffffb=
cc6579fb194
> =C2=A0=C2=A0=C2=A0 x11: ffffbcc6579fbc34 x10: 0000000000000000 x9 : ffffb=
cc65714b22c
> =C2=A0=C2=A0=C2=A0 x8 : ffff80008009b880 x7 : 0000000000000000 x6 : ffff8=
0008009b940
> =C2=A0=C2=A0=C2=A0 x5 : ffff80008009b8c0 x4 : ffff22e000940518 x3 : ffff2=
2e006f54f40
> =C2=A0=C2=A0=C2=A0 x2 : ffffbcc657a02268 x1 : ffff80007fffffff x0 : ffffc=
1ffc0000000
> =C2=A0=C2=A0=C2=A0 Call trace:
> =C2=A0=C2=A0=C2=A0=C2=A0 kfree+0x60/0x2d8 (P)
> =C2=A0=C2=A0=C2=A0=C2=A0 kvfree+0x44/0x60
> =C2=A0=C2=A0=C2=A0=C2=A0 blk_crypto_profile_destroy_callback+0x28/0x70
> =C2=A0=C2=A0=C2=A0=C2=A0 devm_action_release+0x1c/0x30
> =C2=A0=C2=A0=C2=A0=C2=A0 release_nodes+0x6c/0x108
> =C2=A0=C2=A0=C2=A0=C2=A0 devres_release_all+0x98/0x100
> =C2=A0=C2=A0=C2=A0=C2=A0 device_unbind_cleanup+0x20/0x70
> =C2=A0=C2=A0=C2=A0=C2=A0 really_probe+0x218/0x2d0
>=20
> In other words, the initialisation code flow is:
>=20
> =C2=A0 platform-device probe
> =C2=A0=C2=A0=C2=A0 ufshcd_pltfrm_init()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ufshcd_alloc_host()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scsi_host_alloc()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allocation of stru=
ct ufs_hba
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 creation of scsi-h=
ost devices
> =C2=A0=C2=A0=C2=A0 devm_blk_crypto_profile_init()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 devm registration of cleanup handler using=
 platform-device
>=20
> and during error handling of ufshcd_pltfrm_init() or during driver
> removal:
>=20
> =C2=A0 ufshcd_dealloc_host()
> =C2=A0=C2=A0=C2=A0 scsi_host_put()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 put_device(scsi-host)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release of struct ufs_hba
> =C2=A0 put_device(platform-device)
> =C2=A0=C2=A0=C2=A0 crypto cleanup handler
>=20
> To fix this use-after free, change ufshcd_alloc_host() to register a
> devres action to automatically cleanup the underlying SCSI device on
> ufshcd destruction, without requiring explicit calls to
> ufshcd_dealloc_host(). This way:
>=20
> =C2=A0=C2=A0=C2=A0 * the crypto profile and all other ufs_hba-owned resou=
rces are
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 destroyed before SCSI (as they've been reg=
istered after)
> =C2=A0=C2=A0=C2=A0 * a memleak is plugged in tc-dwc-g210-pci.c as a side-=
effect
> =C2=A0=C2=A0=C2=A0 * EXPORT_SYMBOL_GPL(ufshcd_dealloc_host) can be remove=
d fully as
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it's not needed anymore
> =C2=A0=C2=A0=C2=A0 * no future drivers using ufshcd_alloc_host() could ev=
er forget
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adding the cleanup
>=20
> Fixes: cb77cb5abe1f ("blk-crypto: rename blk_keyslot_manager to blk_crypt=
o_profile")
> Fixes: d76d9d7d1009 ("scsi: ufs: use devm_blk_ksm_init()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> Changes in v2:
> - completely new approach using devres action for Scsi_host cleanup, to
> =C2=A0 ensure ordering

As mentioned, I am not sure if this approach has wider implications
(in particular if there is any underlying assumption or requirement
for the Scsi_host device to clean up before the ufshcd device).

Simple testing using a few iteration of manual module bind/unbind
worked, as did the error handling / cleanup during init. But I'm
not sure if that is sufficient testing for the changed release
ordering.

Cheers,
Andre'


