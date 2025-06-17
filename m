Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF884C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4qIjKv64QX2jw7VIEYqNxMf0f/VbTLT5xCqq3EJoWzg=; b=AVOk7738gTsAAVdSWaan5hRAeY
	gVI/3WJ8DHFYaBYNyRpaFBci0epBtasTUXuKxWDnG9jXpEXlws5nkCXF60/zJDhMHe1waH5PHFbrB
	OUnLOkvvAKCGND1xg7/Uy5kGRKSiIEDXurHgfArCWXVjCiEgG7mdioW5ilK+/c1PxRvfgSylqc/wr
	sHMEX8A5D/nXL5Vr1ivm0ghacQNjWEEV8PXQoH81JYm5RfDo/bwsfS+9A6ZQb6yNw+7paeS6Y2ksr
	vXaqd6ADMxOjtnUWDrO04r+vIjzQlWVPVnYlUDwe0C+Z7f9qixgeNHLK1X7H6V9W9zvwaWzuqbS1b
	l9wKYVBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZqa-00000007yz9-3CWj;
	Tue, 17 Jun 2025 17:11:44 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRY51-00000007idp-2i6d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 15:18:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so50510045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 08:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750173510; x=1750778310; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4qIjKv64QX2jw7VIEYqNxMf0f/VbTLT5xCqq3EJoWzg=;
        b=xDB52gmmtbDnUcp1qxarezsddWXRMMwqdDB3qQFedCStie8CzENgZMKhT9uPc949W1
         JNfovI3F+HiR0FT4SM7HI9/4cNZu3RzrnIQ+wZ+zXY8kUfzTVkcRM/N2TNJGrngB3YZ5
         /PaH0D9SGJ60jufWiO/g/BB1iLQaJUBMQDdxCZJfd5zpqc9k+A3hTtlDS6NKx3S8TTMC
         6Mm+wMs71ha9J4flK0cKZGgq7lpMulipBgdSoW8MqV+zMnnEWvVTJCr6uTuqj2msbs3N
         y+mXCbuiKy0U16EZDNZMWS0WcN1weepVd5zwYBYMRjpGB3iInYzz1zdUuINyZU8N1E5R
         EkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750173510; x=1750778310;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4qIjKv64QX2jw7VIEYqNxMf0f/VbTLT5xCqq3EJoWzg=;
        b=J0PGBtz+mpeWJ9SenUKtrhcmYDmz9ldywUg7I7iIcsTGgCsp6+6YFWA0kjk84Y/VAk
         BxgBvXaFZCskEfv0jGcE2pbDu9tEFr5i1cE74jiOWAYmvAKpGZRpAH3CaRupbZzaCAEW
         oEnW61akLRWB1eWaVmknV8ABrDCyLGZugz4f8Qr8J1H1WDE+TNP/Sf6kIxvaCDdV/W3h
         kf26FnmM5T5rhqZtVZirABuW7AvpAiStWSwN7Cyf6GYoKrarnpEzRVHrN+JSSiUy+BFj
         TqLuWFAityvXtsb3/gIMF+uejawclVcwS64NOMoCsn5Q2p4XiELO4No8P6iSOAvM6S7Y
         cSXg==
X-Forwarded-Encrypted: i=1; AJvYcCWP1uv3IqsPQGwCz5bjky7g6Y2J92sKRERNpjdLvxh0CBTg9MrWSYLsMkMsC+eQ04f8zAr9rJ3XQ+kkTzRRfKFX@lists.infradead.org
X-Gm-Message-State: AOJu0YzZoyeHcz+gt3t3sjabb8tMjvtXQazs+4uMuTW3rS6muTCLlnAd
	VHAd33ZTgK7Ev3mmToAnP+4Z1laCKCOjORMZhEXP3Zw+g0Zb2iRe/LvGes7kTPHvESM=
X-Gm-Gg: ASbGncuomBpwZdlS6nNTjyXFhgzscv4KM9WnHhzmtUoNgV3LWvB6mggZcnM5iAVf+n0
	KnkDSZIvIzP5UyCXiveCXgHkTar2dSH58U1rHO812MIICbOgYlUx1gxYYfNfMSe4LD7g9hRRoi+
	0I8TOt0fJTeFAunWzqtddaRSBLQbL21PXeaZHw34uj9OZsSuL+Ko+2se/0nPVx6XyWQnvDAD4GJ
	OQXhTIh6uTHlDULNemQ3uP8xT4mKqwxcXpXiNRJHXQGKOsEtEk5RmYTBdTYPfu0X3mafMPqaone
	uHx3LLWiB8rTcAlaZ2gliOlO0CgpAimkSOetLeFVM+VBh+oHVqPJ1AcmvYpwZUjHbIVnCi54Pb4
	2/5YNHv0t6DgdIzu4LLucqX61AjPG
X-Google-Smtp-Source: AGHT+IEGqP+XF7cBtsAwsctJmNMgOG6/k52Urqe1D4uJ7rpESPeLobG3JBmwQyYd/0m8AMGKD6iXGw==
X-Received: by 2002:a05:600c:1da8:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-4533ca6762cmr136153155e9.14.1750173510060;
        Tue, 17 Jun 2025 08:18:30 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4532e24155bsm176796975e9.17.2025.06.17.08.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:18:29 -0700 (PDT)
Date: Tue, 17 Jun 2025 17:18:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: NULL pointer exception in drivers/memory/mtk-smi.c
Message-ID: <allge3h2abtjfj77idsnwccurxi2jnbcv6qcxar5f5m3jjmpvs@a4mmfghdhtv4>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qcjybkmo7hdyx7gk"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_081831_793762_FD1C393F 
X-CRM114-Status: GOOD (  10.15  )
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


--qcjybkmo7hdyx7gk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: NULL pointer exception in drivers/memory/mtk-smi.c
MIME-Version: 1.0

Hello,

on a 6.16-rc2 kernel running on an mt8365-evk I occasionally hit the
following during boot:

[    6.304796] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[    6.305069] platform 1400d000.rdma: Adding to iommu group 0
[    6.305924] Mem abort info:
[    6.307867]   ESR = 0x0000000096000004
[    6.309032]   EC = 0x25: DABT (current EL), IL = 32 bits
[    6.309731]   SET = 0, FnV = 0
[    6.310126]   EA = 0, S1PTW = 0
[    6.310189] platform 14016000.rdma: Adding to iommu group 0
[    6.310532]   FSC = 0x04: level 0 translation fault
[    6.312001] Data abort info:
[    6.312144] mtk-iommu 10205000.iommu: bound 14003000.larb (ops mtk_smi_larb_component_ops)
[    6.312381]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    6.313433] mtk-iommu 10205000.iommu: bound 17010000.larb (ops mtk_smi_larb_component_ops)
[    6.314112]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    6.315156] mtk-iommu 10205000.iommu: bound 15001000.larb (ops mtk_smi_larb_component_ops)
[    6.315812]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    6.315822] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000046fde000
[    6.315829] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
[    6.315846] Internal error: Oops: 0000000096000004 [#1]  SMP
[    6.315852] Modules linked in: mediatek_drm(+) drm_dma_helper drm_display_helper drm_client_lib drm_kms_helper mt8365_mt6357
[    6.316909] mtk-iommu 10205000.iommu: bound 16010000.larb (ops mtk_smi_larb_component_ops)
[    6.317563]  mtk_mmsys mtk_mutex
[    6.318471] probe of 10205000.iommu returned 0 after 19235 usecs
[    6.319221]  mtk_cmdq_helper snd_soc_mt8365_pcm snd_soc_mtk_common snd_soc_mt6357 pwm_mediatek
[    6.324638] CPU: 1 UID: 0 PID: 112 Comm: (udev-worker) Not tainted 6.16.0-rc2-00015-g44a5ab7a7958-dirty #27 PREEMPT
[    6.325964] Hardware name: MediaTek MT8365 Open Platform EVK (DT)
[    6.326732] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    6.327563] probe of 11201000.usb:connector returned 517 after 6627 usecs
[    6.327609] pc : mtk_smi_larb_config_port_gen2_general+0x9c/0x1e8
[    6.329228] lr : mtk_smi_larb_resume+0x90/0xd8
[    6.329792] sp : ffff80008219b650
[    6.330210] x29: ffff80008219b660 x28: ffff80008219bc20 x27: ffff000002fd6938
[    6.331112] x26: 0000000000000000 x25: 0000000000000000 x24: ffff800080f9b8d8
[    6.332015] x23: ffff000005aa8e90 x22: 0000000000000003 x21: ffff000002fd6810
[    6.332918] x20: ffff000002fd6810 x19: ffff000005aa8e80 x18: 00000000ffffffff
[    6.333821] x17: 74706164612d6c76 x16: 6f2d707369642d6b x15: 6574616964656d2f
[    6.334723] x14: ffff800081b8b0c0 x13: 6c766f2d70736964 x12: 2d6b657461696465
[    6.335626] x11: 766972643d4d4554 x10: ffff800081c8bc7c x9 : 0000000000000004
[    6.336528] x8 : ffff80008219b578 x7 : ffff80008219b630 x6 : 0000000000000004
[    6.337430] x5 : ffff80008219b5b8 x4 : ffff800080f9b8d8 x3 : 0000000000000000
[    6.338333] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
[    6.339236] Call trace:
[    6.339546]  mtk_smi_larb_config_port_gen2_general+0x9c/0x1e8 (P)
[    6.340318]  mtk_smi_larb_resume+0x90/0xd8
[    6.340838]  pm_generic_runtime_resume+0x2c/0x44
[    6.341426]  __genpd_runtime_resume+0x30/0x7c
[    6.341979]  genpd_runtime_resume+0xd8/0x288
[    6.342522]  __rpm_callback+0x48/0x1dc
[    6.343001]  rpm_callback+0x74/0x80
[    6.343445]  rpm_resume+0x468/0x63c
[    6.343889]  __pm_runtime_resume+0x4c/0x90
[    6.344410]  pm_runtime_get_suppliers+0x60/0x8c
[    6.344985]  __driver_probe_device+0x48/0x12c
[    6.345539]  driver_probe_device+0xd8/0x15c
[    6.346070]  __driver_attach+0x94/0x19c
[    6.346558]  bus_for_each_dev+0x78/0xd4
[    6.347046]  driver_attach+0x24/0x30
[    6.347501]  bus_add_driver+0xe4/0x208
[    6.347977]  driver_register+0x60/0x128
[    6.348465]  __platform_register_drivers+0x60/0xe8
[    6.349071]  mtk_drm_init+0x24/0x1000 [mediatek_drm]
[    6.349736]  do_one_initcall+0x58/0x268
[    6.350226]  do_init_module+0x58/0x238
[    6.350705]  load_module+0x1db8/0x1e84
[    6.351181]  init_module_from_file+0x84/0xc4
[    6.351723]  __arm64_sys_finit_module+0x144/0x328
[    6.352321]  invoke_syscall.constprop.0+0x50/0xe4
[    6.352919]  do_el0_svc+0x40/0xc4
[    6.353342]  el0_svc+0x48/0x1a0
[    6.353744]  el0t_64_sync_handler+0x10c/0x138
[    6.354297]  el0t_64_sync+0x198/0x19c
[    6.354765] Code: 39400025 35ffff05 f9404a60 371805a6 (b9400000)
[    6.355533] ---[ end trace 0000000000000000 ]---

I think this is larb->mmu being NULL in line 277 of
drivers/memory/mtk-smi.c.

Does this ring a bell?

Best regards
Uwe

--qcjybkmo7hdyx7gk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhRh0EACgkQj4D7WH0S
/k6o/Qf/XFOvcEG4nKJyRhsolxLKRLfGq2ceccm1OdtSFSH1GAIJt6PSewGgevEQ
lVGT/McnT68PuFi3P3GY7is5YrmDEwBG0X3UxjayqpNHOIOh3JdQvnVIRufuF292
/v0tKXBubBwoNtNNCEK4uAqx5Aqx4L6Pwl3aANRFOOUnKlPLjc2k59qPMXjYuv27
m0YIgnrGiJ14IzXf8qMiQntfOzVv4FoObMvzESFnTTMjb58q02fRx4IulmzehhGr
3H53lsA6WJHuGSiasX8PH7KPso3N5LLh+PPPGHY+877iPro8URlvNsE2B7wxAmZV
M+jh6X74zC2aizZKZ0nK3cTT8l5d3g==
=PoQM
-----END PGP SIGNATURE-----

--qcjybkmo7hdyx7gk--

