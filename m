Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF86C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 19:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tg/3WwMFcmfwvtgPm/S+I3H7ynZIUHFvyD3k8HjH5+E=; b=OWfivHMk+SbpCeNtKzg8+/vYr5
	+CW5GGDTn7AlS4ndamV2dn0lPj37x6ABkNkIfiXd4Sfq+qinrfyGFg7dhysPjeaU2MvI+L1LRPhTd
	ZvHXaMnK+G17QIVLInfrvDZiCiscVwwNw2HKQqralGSaAQac1H4dJ99VB1gX+99Rk9F/fqBU1AaWU
	jdN1r/E76HNRl6enbs7VLiNYdmzm/Dj/Ddrwhd/96ZEJPCULLjXmOg+8UJLaBL1zHXQvGxj+VKNw9
	EHlxvMXN9uPA2FV417W+rIAXjEWlYjEGCicdpy6CQ+YF8snI7CA8mY1Usa+XxhDHvwFykEwr7AwMo
	HJEOZN5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ8J-00000006Nxo-2EfD;
	Mon, 13 Jan 2025 19:29:55 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ6V-00000006NNs-2cAp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 19:28:04 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4361f796586so49066555e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 11:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736796482; x=1737401282; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tg/3WwMFcmfwvtgPm/S+I3H7ynZIUHFvyD3k8HjH5+E=;
        b=p/xPdAKy/QKQQIrJ8PWtQufRkVDnm9zbzkBjLWqcg0r8Yz2zpsyx66Ug+0tNOSNJ5w
         Jh7o+J621U0f42anr6JBxdw2smK1vPKjPPOygp64cdDz8mfDX+BgA1PQgadgdtkwqcOO
         MgCh48IKwMKbwfVi3OlIp5zWtRgUX3kY9QyFWxbVkg0QA6FFKL53ry6IICphNy5z85jx
         gwIOktBVEdtQVcbJE97KuaSCqmges5s/F7K0Zifry5XJJLx7/HY8c5noN10Zc+tTJvG8
         x1mznFTaMNF268l7ucQRWf8RLFVq6m2+19HstHQRmRQEZlqOy0dZdijqWhfdyHb8M60g
         WCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796482; x=1737401282;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tg/3WwMFcmfwvtgPm/S+I3H7ynZIUHFvyD3k8HjH5+E=;
        b=T0aCVFIt2tNqUj0Y4asL1YUtygBhEXWg3qGfzYDueo8IoNgCzJ2KlRPYqTzpHwISb6
         nrmK0RlXAn8IhxU4yF77zYFAENlioiCTVt0L5SG3E78QgwXSv6nqz6Kk7IHdlHcmpnVL
         ZOR0wyBuf5vjTLy6yax3Gp9lSy+UdsxOCz34c14BjNTx38MDMDpXSG/qysEsZvVEcKAU
         tISvMoOkM17DiUgkftFdwnH6lWKkyvbnzoqwRdCqML5jlfpf33lW88TwQP2NqHDLj6q1
         r6Kq/I/RJ4HQT7nSVEsV62YcOaCTOnGDZG/yc/q3hkq0o6ga+uJOEU/o4jbTJkD1ZHMt
         GNxg==
X-Forwarded-Encrypted: i=1; AJvYcCVqruZ4OeeL0BcXWfUSNvjU40RVVcDlybVZh5wpKXYiOU+KaihKKVsuTczDt59qraIgWBzUbJd/sppz4/R0+kWY@lists.infradead.org
X-Gm-Message-State: AOJu0YzMwU565sppCrnWYKZd3pUi/eG/ugTruAMpOwB70v7YbYN4f+D0
	5kLEi3fTGZefrE8Vf1Ilq7aHMRiKkH/zPeCMuZ2xBOqG8C35YnYIAkVz7Nl79KE=
X-Gm-Gg: ASbGncvBLCq64XQMJrVeMgKHNegdDSo/LJVV3s7RL+ImWqeuxmR1l4kD7yGhRVW2gfr
	0WCo254ZgUIMZ2AXOilvZThfY8MxFy/40pvCMQvmJR6GWq0QrDbW6UMIxTBKeSf8A2zMXM1OvmK
	JQTQfnAtHxNhpxKai0sr2oiAj1gDXfhIY6FIS5jx5pWZAzOwm4dlNn2hBLIyro1gHtYxLfW3vTD
	HcCzw9fMWqJNDXPmDkJex9cHWNoN/iC0DPwdYkhZm/b/o//Vw9kn1Qk2Yvmrw==
X-Google-Smtp-Source: AGHT+IGgOtxMNv3w2gTeOb0up6Yoa5r9Qms3B50WLanCUjQpoi+Zyq7SDjeMqsGVbHa9eNw3ZYp4yA==
X-Received: by 2002:a05:6000:186e:b0:385:dc45:ea22 with SMTP id ffacd0b85a97d-38a87338d84mr25061674f8f.39.1736796481789;
        Mon, 13 Jan 2025 11:28:01 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d012sm12885602f8f.8.2025.01.13.11.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 11:28:01 -0800 (PST)
Message-ID: <c4129ea9da39badb3a686f7f93c334ecbc6d83f6.camel@linaro.org>
Subject: Re: [PATCH] scsi: ufs: pltfrm: fix use-after free in init error and
 remove paths
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>,  Bart Van Assche <bvanassche@acm.org>, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>,
 kernel-team@android.com,  linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-arm-msm@vger.kernel.org
Date: Mon, 13 Jan 2025 19:28:00 +0000
In-Reply-To: <20250113192235.GA1800842@google.com>
References: <20250113-ufshcd-fix-v1-1-ca63d1d4bd55@linaro.org>
	 <20250113192235.GA1800842@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_112803_667041_68E3FAE4 
X-CRM114-Status: GOOD (  29.00  )
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

On Mon, 2025-01-13 at 19:22 +0000, Eric Biggers wrote:
> On Mon, Jan 13, 2025 at 07:13:45PM +0000, Andr=C3=A9 Draszik wrote:
> > devm_blk_crypto_profile_init() registers a cleanup handler to run when
> > the associated (platform-) device is being released. For UFS, the
> > crypto private data and pointers are stored as part of the ufs_hba's
> > data structure 'struct ufs_hba::crypto_profile'. This structure is
> > allocated as part of the underlying ufshd allocation.
> >=20
> > During driver release or during error handling in ufshcd_pltfrm_init(),
> > this structure is released as part of ufshcd_dealloc_host() before the
> > (platform-) device associated with the crypto call above is released.
> > Once this device is released, the crypto cleanup code will run, using
> > the just-released 'struct ufs_hba::crypto_profile'. This causes a
> > use-after-free situation:
> >=20
> > =C2=A0=C2=A0=C2=A0 exynos-ufshc 14700000.ufs: ufshcd_pltfrm_init() fail=
ed -11
> > =C2=A0=C2=A0=C2=A0 exynos-ufshc 14700000.ufs: probe with driver exynos-=
ufshc failed with error -11
> > =C2=A0=C2=A0=C2=A0 Unable to handle kernel paging request at virtual ad=
dress 01adafad6dadad88
> > =C2=A0=C2=A0=C2=A0 Mem abort info:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ESR =3D 0x0000000096000004
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EC =3D 0x25: DABT (current EL), IL =3D 3=
2 bits
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SET =3D 0, FnV =3D 0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EA =3D 0, S1PTW =3D 0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FSC =3D 0x04: level 0 translation fault
> > =C2=A0=C2=A0=C2=A0 Data abort info:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D =
0x00000000
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CM =3D 0, WnR =3D 0, TnD =3D 0, TagAcces=
s =3D 0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0=
, Xs =3D 0
> > =C2=A0=C2=A0=C2=A0 [01adafad6dadad88] address between user and kernel a=
ddress ranges
> > =C2=A0=C2=A0=C2=A0 Internal error: Oops: 0000000096000004 [#1] PREEMPT =
SMP
> > =C2=A0=C2=A0=C2=A0 Modules linked in:
> > =C2=A0=C2=A0=C2=A0 CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 6.13.0-rc5-next-20250106+ #70
> > =C2=A0=C2=A0=C2=A0 Tainted: [W]=3DWARN
> > =C2=A0=C2=A0=C2=A0 Hardware name: Oriole (DT)
> > =C2=A0=C2=A0=C2=A0 pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSB=
S BTYPE=3D--)
> > =C2=A0=C2=A0=C2=A0 pc : kfree+0x60/0x2d8
> > =C2=A0=C2=A0=C2=A0 lr : kvfree+0x44/0x60
> > =C2=A0=C2=A0=C2=A0 sp : ffff80008009ba80
> > =C2=A0=C2=A0=C2=A0 x29: ffff80008009ba90 x28: 0000000000000000 x27: fff=
fbcc6591e0130
> > =C2=A0=C2=A0=C2=A0 x26: ffffbcc659309960 x25: ffffbcc658f89c50 x24: fff=
fbcc659539d80
> > =C2=A0=C2=A0=C2=A0 x23: ffff22e000940040 x22: ffff22e001539010 x21: fff=
fbcc65714b22c
> > =C2=A0=C2=A0=C2=A0 x20: 6b6b6b6b6b6b6b6b x19: 01adafad6dadad80 x18: 000=
0000000000000
> > =C2=A0=C2=A0=C2=A0 x17: ffffbcc6579fbac8 x16: ffffbcc657a04300 x15: fff=
fbcc657a027f4
> > =C2=A0=C2=A0=C2=A0 x14: ffffbcc656f969cc x13: ffffbcc6579fdc80 x12: fff=
fbcc6579fb194
> > =C2=A0=C2=A0=C2=A0 x11: ffffbcc6579fbc34 x10: 0000000000000000 x9 : fff=
fbcc65714b22c
> > =C2=A0=C2=A0=C2=A0 x8 : ffff80008009b880 x7 : 0000000000000000 x6 : fff=
f80008009b940
> > =C2=A0=C2=A0=C2=A0 x5 : ffff80008009b8c0 x4 : ffff22e000940518 x3 : fff=
f22e006f54f40
> > =C2=A0=C2=A0=C2=A0 x2 : ffffbcc657a02268 x1 : ffff80007fffffff x0 : fff=
fc1ffc0000000
> > =C2=A0=C2=A0=C2=A0 Call trace:
> > =C2=A0=C2=A0=C2=A0=C2=A0 kfree+0x60/0x2d8 (P)
> > =C2=A0=C2=A0=C2=A0=C2=A0 kvfree+0x44/0x60
> > =C2=A0=C2=A0=C2=A0=C2=A0 blk_crypto_profile_destroy_callback+0x28/0x70
> > =C2=A0=C2=A0=C2=A0=C2=A0 devm_action_release+0x1c/0x30
> > =C2=A0=C2=A0=C2=A0=C2=A0 release_nodes+0x6c/0x108
> > =C2=A0=C2=A0=C2=A0=C2=A0 devres_release_all+0x98/0x100
> > =C2=A0=C2=A0=C2=A0=C2=A0 device_unbind_cleanup+0x20/0x70
> > =C2=A0=C2=A0=C2=A0=C2=A0 really_probe+0x218/0x2d0
> >=20
> > In other words, the initialisation code flow is:
> >=20
> > =C2=A0 platform-device probe
> > =C2=A0=C2=A0=C2=A0 ufshcd_pltfrm_init()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ufshcd_alloc_host()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scsi_host_alloc()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allocation of st=
ruct ufs_hba
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 creation of scsi=
-host devices
> > =C2=A0=C2=A0=C2=A0 devm_blk_crypto_profile_init()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 devm registration of cleanup handler usi=
ng platform-device
> >=20
> > and during error handling of ufshcd_pltfrm_init() or during driver
> > removal:
> >=20
> > =C2=A0 ufshcd_dealloc_host()
> > =C2=A0=C2=A0=C2=A0 scsi_host_put()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 put_device(scsi-host)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release of struct ufs_hba
> > =C2=A0 put_device(platform-device)
> > =C2=A0=C2=A0=C2=A0 crypto cleanup handler
> >=20
> > To fix this use-after free, register the crypto cleanup handler against
> > the scsi-host device instead, so that it runs before release of struct
> > ufs_hba.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > In my case, as per above trace I initially encountered an error in
> > ufshcd_verify_dev_init(), which made me notice this problem. For
> > reproducing, it'd be possible to change that function to just return an
> > error.
> >=20
> > Other approaches for solving this issue I see are the following, but I
> > believe this one here is the cleanest:
> >=20
> > * turn 'struct ufs_hba::crypto_profile' into a dynamically allocated
> > =C2=A0 pointer, in which case it doesn't matter if cleanup runs after
> > =C2=A0 scsi_host_put()
> > * add an explicit devm_blk_crypto_profile_deinit() to be called by API
> > =C2=A0 users when necessary, e.g. before ufshcd_dealloc_host() in this =
case
>=20
> Thanks for catching this.
>=20
> There's also the option of using blk_crypto_profile_init() instead of
> devm_blk_crypto_profile_init(), and calling blk_crypto_profile_destroy()
> explicitly.=C2=A0 Would that be any easier here?

Ah, yes, that was actually my initial fix for testing, but I dismissed
that due to needing more changes and potentially not knowing in all
situation if it needs to be called or not.

TBH, my preferred fix would actually be the alternative 1 outlined
above (dynamic allocation). This way future drivers can not make this
same mistake.

Any thoughts?

> Please also include a Fixes tag in the commit message.

Will do.

Cheers,
Andre'


