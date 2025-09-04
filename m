Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833FCCA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ps0O7+4QAd8ZPsjC+XlmtSAuEwLSI/hp1jScWS1y0uQ=; b=TPhMBzmEJvvNdATcEkBZ/i7YFP
	aBXPsmpMMJ/yX3soyhiTqgGLizcYkfk/pIkpWAJobMFsJvsPyTTrAoEm2TmKAYjziRq3sb4F1HKCp
	Lg1f+w5XQQ2idm7Q4dTGQD7qBa10/cVcVxX4r9ghK8IKrU1fXaG+PmQOMMYvF1TVwJUf88B85/sg9
	fGvZ5MX4W/u+TcWydBgtYYno/wjcz0p/VHyvz0CeYJwfBoI+MfsGDNw/BGVMd9jdLchjE+CHsY10+
	Z864JwAnmZ2b/4ipjDxe5lRyNhoyIEEvTqGzK5vx0Z3rT/ijOtXXJSD7H4i5om4Ui8fJClBdNs4NG
	xsMekPXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFzx-0000000E1zT-1PhB;
	Thu, 04 Sep 2025 19:51:57 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuB7U-0000000CH88-1Hc6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756996764; x=1788532764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ps0O7+4QAd8ZPsjC+XlmtSAuEwLSI/hp1jScWS1y0uQ=;
  b=fmq/Uo/69V9d3rQuwJHbXdG5DX7hMAuuDUA8KdxbDjo1+H4m7R48izC7
   me0oL4VxGd2iT6sz88pIU/3wvLS/AN8NPKXdrjNLSIkM5HzCgMFXdpj34
   uUY6UCWvu3cyYDseZKqi133qL9SvPUbfEakfXZXiQD/wUo1CXLijndVN8
   E0MhK6VmN3P0LTNW8vAeFjqStVvmHSoWy72AG7FVQDwVMovbt4h3vyDKR
   Led0AFK27j6fGrBq+nlIUtIBwQ4gRE+ksFeN+8twR2PeLishM2BePFwvn
   vLz7nQqVNWolAaEpZMiHj4eYcOCoN5i0FMYWOPJLWdMyxNBCIYQcoXeQz
   w==;
X-CSE-ConnectionGUID: ZUNtD6joRBO5U+tPGeVMdg==
X-CSE-MsgGUID: fz5wvPgRRIWdooSDi1AZkw==
X-IronPort-AV: E=Sophos;i="6.18,238,1751234400"; 
   d="scan'208";a="46080766"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Sep 2025 16:39:21 +0200
X-CheckPoint: {68B9A499-11-AD8F5F64-F0EACAA5}
X-MAIL-CPID: E3008ABF7ED2178689814A7AA6E161E5_1
X-Control-Analysis: str=0001.0A2D031C.68B9A49A.0051,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBC21161344;
	Thu,  4 Sep 2025 16:39:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756996757;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ps0O7+4QAd8ZPsjC+XlmtSAuEwLSI/hp1jScWS1y0uQ=;
	b=MXowUIlr1cezGYBd7yCnJDooczCfeW/6PrA8HFwKnJU2o8ZgQ0wQCAoFlyUoGw1iDkxHsj
	1oBEHJWR5OFCPQ+UetaAZBDjcYB45m+oAcT74o5pOvIaYQTwAHlO/CKIqR+39UEcuKH6dW
	SIZt0pebReDu0nFmUM5/qf+plrzLN44amwR+3Q1/Oe+RtmQ0MCfWUglXz0WRtNQwHMYil7
	kFAbEjCeKQaY63Y2I2ZxpyfQmNwf3drdxgs2n4XGuvvrRvbKIlNDtB0UQvZ08Ad3iLXo+p
	ik7MRMPEaTovGMmBM+zu/FzWM5luEpgUBxhbK5/oIK2KAkFhH1qeboTDLU6/nw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
Date: Thu, 04 Sep 2025 16:39:06 +0200
Message-ID: <7020337.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <52e3c5dd-6952-43b5-94f9-43f30734680e@mailbox.org>
References: <20250321200625.132494-1-marex@denx.de> <3372501.aeNJFYEL58@steina-w>
 <52e3c5dd-6952-43b5-94f9-43f30734680e@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_073924_677014_6B8588F6 
X-CRM114-Status: GOOD (  18.20  )
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

Hi,

Am Donnerstag, 4. September 2025, 15:52:38 CEST schrieb Marek Vasut:
> On 9/4/25 8:36 AM, Alexander Stein wrote:
>=20
> Hello Alexander,
>=20
> >>> Maybe the GPU remains halted because
> >>> setting the GLB_HALT stops command stream processing, and the GPU nev=
er
> >>> samples the clearing of GLB_HALT and therefore remains halted forever=
 ?
> >>
> >> Exactly that, and that's expected.
> >=20
> > FYI: in a new release of system manager software (starting from lf-6.12=
=2E3-1.0.0),
> > the GPU reset is reasserted in SM software already [1] and access to GPU
> > block control has been removed from Cortex-A [2]. Starting from B0 step=
 this
> > version is required AFAIK.
>=20
> I don't think the SM is involved in this, because if I do the following=20
> test, the MCU also fails to boot unless I do a reset:

Is this some other reset than BLK_CTRL_GPUMIX? If so, it might be required.
Don't know much about internal details though.

Best regards
Alexander

> "
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c=20
> b/drivers/gpu/drm/panthor/panthor_device.c
> index d4d73eebca49d..fd81cd2654111 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -642,6 +642,18 @@ int panthor_device_suspend(struct device *dev)
>   		panthor_fw_suspend(ptdev);
>   		panthor_mmu_suspend(ptdev);
>   		panthor_gpu_suspend(ptdev);
> +
> +
> +panthor_gpu_soft_reset(ptdev); // needed, else panthor_fw_resume()=20
> below fails
> +
> +		panthor_gpu_resume(ptdev);
> +		panthor_mmu_resume(ptdev);
> +
> +		ret =3D panthor_fw_resume(ptdev);
> +		if (!ret)
> +			return 0;
> +
> +
>   		drm_dev_exit(cookie);
>   	}
>=20
> "
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



