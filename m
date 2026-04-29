Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2259BFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 01:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TL2tkeFOgMZcOO+5OqeSu09okkedmEhoLbRE8Fw/jV4=; b=bC5RYBB8mD7prif5im6cT+R8vP
	XXt/xF1GXFaF+LQ5A8nBEphCRwd3qZTb2Lr4CyGEMtO6L/gNRIvBkhGPwtSCo1vuktgHGk+kE1g5w
	WBBpJLgBkI/SKNNxNgclBKLO+JvwVgSz586sKqHNIS5xNTa8X8Ky01aYBfQkwvQ3n3ouxsNZjT7R0
	EVc5KW+FDH22HZBHugDMiVsvINMphbzAc1f2hXJXCZcb4KdjOw+XfC4YQtlL0CChD9LroJPuiaK2u
	Sc/wYdv+BztFXGZspiUjul4S3dZZLVhgvCl8n7d8G9qXYPrJJe3NMmzJvxKVUKdKHDPLJQw34XGo7
	u8LZrQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtsP-00000002iwq-2lSF;
	Wed, 29 Apr 2026 01:38:09 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtsN-00000002ivz-1llC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 01:38:08 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5a746f9c092so425887e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 18:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777426684; cv=none;
        d=google.com; s=arc-20240605;
        b=VMIG2TaiRUtV6GmnJjOg6150jcey+SLKRzhfJ3tb79osiJpfjcbq/W+NsRYGKbUyyB
         exJ/fipBHxmLFKwDKmOjAf3FLW+BgFrEm1bg2KopzxjT7Cb92BgphHxUfkF21fh3suyl
         XuH4xm6gFhNFMSjjH/SPyUtDaTE4jApn5mbRmO+LhjBJGObzSEKcaLqJKe7mCw6ieYVH
         ZjrS26rxN/BkAhgKNGGdQd2D2tWyVKBTDsABpa9ZWyzr/56wh1uL7WnLFbRydAyGRmKI
         7s8YooR6CgWP9/oy1y50Iow9d5RfZjsViKARnplLoPxiBsc1Ulne1+prbMar8q2eJevy
         IjQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TL2tkeFOgMZcOO+5OqeSu09okkedmEhoLbRE8Fw/jV4=;
        fh=eIi3pVUt9GGDuWjHWkbDXO8WdQ8hmlZ3yBJk6uuNmaI=;
        b=TawqHMOW4HEw+niEbKf8Cgkv3WcPBYNh8hvlQFd42bkbfNTv8IgYwet6fkX0+9xZpE
         wGpLhJcPmY/V0uLpjyLVO/XrC9XV2wCKOhXYRbyKgVgZ5F9vmqiG68Hen686caOhpE+P
         MaH7F/+AmyCil7vaPZR/kABoVA/Zr42E2R9UjnmfVdfnjAC1kBMF3QbZroKTeU5lSTkT
         lBE1LU3n/6VHESYTLw5PqBe26dH4FgNBxVWeRntYN1vYwmrLl8WJe7FAgXFzFgATpR6P
         3YBEZsEYxq8jlx7ejs8MxQzH8HGWgxgFSkCwBMOJoNmNSHBPutsavKqxjXcEGpvnAosg
         hKvA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777426684; x=1778031484; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TL2tkeFOgMZcOO+5OqeSu09okkedmEhoLbRE8Fw/jV4=;
        b=d41UjTKkH3Rfceg49eBHHjZc7stCIebt0gAG1yb40cCQW0/XdvD8ZBK+NMwp6ObbyV
         dyW1mHWZdG+h40taokArv1pj1Ze6/5mAuqpJM8PYOaKUFHBudvOZ2xA0ixeAJaWA/twY
         acQk1kqabgGc3GO15ziwagxCcgg0u4IRK8IzPH7/BQTkgxMkkva1BuIo2tZAf10wGLS2
         Eg74wHbiq84MZqao3SPSDoComnqodTWk4XQhL1hGTErmaCaOjwqZaxfqQSOQwrpYa645
         wqv8oguLQIKAtpqzCSE3c+ZET1OAQ+UMFE7n68GMdK/69YOslIHFPwvv10sn3Qf8pwE/
         +orA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777426684; x=1778031484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TL2tkeFOgMZcOO+5OqeSu09okkedmEhoLbRE8Fw/jV4=;
        b=B8lnsWyTrp3OqKgpGVZfL7wp5xoOxe521IEob5+eGeT0sggmVdQRXL4gAI6fhEryj/
         XSAP49eZIHoMSEoJhS6FSRHEIC2o6Dg5ipq5sbR/+xzWpgXWjOT2eQeiDQame/tbLGkK
         wGmQQCSEBBw4RJhmBLTVGLFDBgiMP6vnQtHTNwLfQAQGlIw6EXfJrCSGDezq/dRE9KzC
         ie3aE4RamWRc3BHW1IqzegXQkMfz8lI2aOQnkS78eqj9Dv9sHv0q5sicqIqWyoFrTOWQ
         z0xTu3CVFT2q0wLEpxVqePNOBOfQVfSLrQlP3Pf0vlnZ9z2YsdooYLAa8zwoGmwNaFP1
         53xA==
X-Forwarded-Encrypted: i=1; AFNElJ9J2tGdn1qRCLNMhrScKT2siZVvDAFuH1JlVpY44lAO4kIMxvBGCehdPVi6hzWBidtUzgnkU222GgVMUlxllppD@lists.infradead.org
X-Gm-Message-State: AOJu0YyrRhXIdwRUAhFQkCUhOR6Oit206Hx2p+F18IyJ6XnxMvsEEYbT
	2YWEw872R8+vJcLgcVhR7o8vx8OJYsSxZLPEga0FTIIjN7Jdr9GpEVTFRxlvc6oWDBaSRjRNPCl
	BBfKnEXL80/3k5zMZc/Mhx6LmwFKVtF0=
X-Gm-Gg: AeBDievsG+WJ1B7eZPeVhyfQGR9ykQ3yWRVsx1nCi9Z67XwRqxciL2caXAgPtfJTWta
	O7Z9hNJdY2WmybUmTWkKFMyKRyZHx9Fzi7xe54t5qZVyCtoFEdXcjeFNQlBQ+7FkWEA2a/SDs3g
	lrsSq8wMWEvtwqsY5iEQnH1KOXlY+SNGPBWQZPJArhaJ5hxLcE7hNQiFyjQJHPMmMBigJykANz1
	06OFd3KdBGu7nJ71IUnQulDiV9DtqoW3cTqjkwRgYsc5/nMcmuh3Icogf2MGck+YYkr1yDV/SpV
	EnSZngT+8H6C0tsd1I1RTcCUI9synAo/nUMbWlM9MGLXXzp+Us/xK0mtnESn3ltXPVHsyi/C13o
	a83jYVw==
X-Received: by 2002:a05:6512:15a3:b0:5a2:a70a:a9e with SMTP id
 2adb3069b0e04-5a749fb8b0amr382100e87.3.1777426684004; Tue, 28 Apr 2026
 18:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260428-imx95_frdm_pro-v2-0-434240b652f4@nxp.com> <20260428-imx95_frdm_pro-v2-2-434240b652f4@nxp.com>
In-Reply-To: <20260428-imx95_frdm_pro-v2-2-434240b652f4@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 28 Apr 2026 22:37:52 -0300
X-Gm-Features: AVHnY4KSxb_H5o4trd0JTtQb0bsTzoHjYoluGAlKyA5vbmz4I0-kLq2-xvoMmcw
Message-ID: <CAOMZO5DV4Nnc+7DfAZT-VYDqxniz=ROR4-DnH3x9NbU4E8d9mQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add i.MX95 19x19 FRDM PRO
 board dts
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, xinyu.chen@nxp.com, 
	qijian.guo@oss.nxp.com, justin.jiang@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_183807_478461_14D5766E 
X-CRM114-Status: GOOD (  10.10  )
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

On Tue, Apr 28, 2026 at 5:03=E2=80=AFAM Joseph Guo <qijian.guo@nxp.com> wro=
te:
>
> NXP i.MX95 19x19 FRDM PRO is cost-effective with extensive
> expansion capabilities based on the i.MX95 19x19 SoC.

It would be good to explain the difference between the i.MX95 FRDM PRO
and i.MX95 FRDM.

Also, does it make sense to share common nodes in a dtsi that can be
used by the two variants?

