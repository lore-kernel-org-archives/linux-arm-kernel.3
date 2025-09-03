Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FA6CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 07:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=En2W+hPUiVIc0l1BQLH8vAPb/+q7zcp7yOavO//Np4Q=; b=RQ+FvTrEljbwduIPWwNq/0KSk0
	coiyzhi4tcpkwkAvKW3fS1UaC1j819PZ4+VDpnTZMHC61pmtQJ9IXkAeVkTTtRsnnzKx6lfrRs7oe
	LXO8wRhy21Kp/C1H1GkSj4eziAAH5/O920tLWuc/Ht2IunSZYAWjuir+RMbDeSY8jaaGQ0pmPb/Ur
	bGsjsJjDbszBpncmIUwFhRRK4sLYy4c1vTVLlBqUitRwVJGZ66xUS+sCoddEQMosbEhnZKUmn7AbZ
	TyJdN0tbIFDnQ7hZtkY0TiC0MX8kYeaHBvkvJ8LEDqOhSOJoH41Ng56ZHEfvWEol4LQ9V2vx99l7/
	srHAm1YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthyk-000000057cM-2p0H;
	Wed, 03 Sep 2025 07:32:26 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthmj-000000051NX-1fXe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:20:02 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-327ae052173so3894519a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 00:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756884000; x=1757488800; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=En2W+hPUiVIc0l1BQLH8vAPb/+q7zcp7yOavO//Np4Q=;
        b=cvcCcsSEjO8hk0Xxgqhpoj11BTv0PF3kOfLAhCXVVr/WFin6bd/sgynialrxFeGcwZ
         +UCm6aEv+P6PHk0Sjj/6ZlB4bJaSlKmsXTVq4+VTqvXlgbJt753bAiNMWxtOd0XAsxiy
         6/Q/eMecjJwJ7iaICA24kx9Bs8wf6BCChxztDDbNxXgF8sc7BMJvPJe8NVCX77y/24o6
         GsmVj/wEFh9S/twwkVyokTiNjSY3nI9B0POaiiLnwx1QSvIxcD6LZ2tWhzaQjkJpIfL7
         vmwL0VOKIbsAH5faTSIK3NVv1oXJBd1iUEO0lI9IgRVemEnR5egtVM11Sqn2/f0PfZix
         OJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756884000; x=1757488800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=En2W+hPUiVIc0l1BQLH8vAPb/+q7zcp7yOavO//Np4Q=;
        b=CSV6cxtv7Y+TE7Chfr3rVTWQQdeCle3dwwzSKwLFgZkN/Bl1+PP2fxBAC0IBOmg6ar
         toMIUg+CApLXsY7K9x1wMT+jR+YqgdNEXL09PemTnmuoOiy0OxtVguLqB5n48FarQmmA
         R+GIsvDcZMnnFM2Yo56bNEnXOduLUec0G3nYndGbqcewI4Qdb9bDMFDbDIucFS2v03vI
         BT6ksCdVZ1DJfT0g5u09Po7R7yAikQDFPQNXnd/qz7PeTx7RYqGRj0ibdli87sWNaimW
         Uj9ZE0Im1+meFNXBG1yC07c9jc+vfWfDA6Nh/MCMM1PDtwDzieKBDUNO8O8PJKZPJygp
         T8Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVR0xBIAPZTcUKrPtZRAOd+LNQCTvkGGPNMEF26QSqj+WUeaitOwnYgVec1Aq9WAzKjLP4ND9vPCWm5FU28Mr5Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzbW71jIgd5ebMWEp+v94dYP4H6WdESY5Gc+U9hgwIjRPF4r8Mk
	bL/pIx7+n9xI2l5ypvWEwjpTvSQxYp+FHJx4kvy9RzFgbG89+Fawr3zY9OutwhOl6RApUTopGOJ
	5F29e46KzFpmnUQ/nTDqbkj6Ukrkim6M=
X-Gm-Gg: ASbGncvpgDe75iboztTMkcOBMtRG2H+TTYrmYJP6XA8sbTkvZP9pi7G9yNXezQBc+8A
	BpZYk4bbQdZjQfginlouDs0yGOQRlYKFvobcUHA3duo7+XqGhscdd+GMcsAssKNEFXQ5NM000gw
	wUwVBT0FzN5x4ZPLVEyCbZBHSsrY7pOb/Us6tjdKBMtuvri/ZWm7fSfwcaX0sZzKXwVe2V0cGjC
	WPWjhTDZ4sTyEyWq+MK30qJpiL+ZLi6ttpj
X-Google-Smtp-Source: AGHT+IFgXEs9NteFHdZr1OCmOw5SCukuxyKq+mxKrX1PC589u8zK1b13OsCdHiT3Ob0jVHFeDF/+Ra11+ZAP+EwLTBM=
X-Received: by 2002:a17:90b:5190:b0:324:ece9:6afb with SMTP id
 98e67ed59e1d1-3281541225emr18498018a91.3.1756884000281; Wed, 03 Sep 2025
 00:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
 <20250821-imx95-rproc-1-v5-2-e93191dfac51@nxp.com> <aLHOhKpAQbVCC76-@p14s>
 <20250830125208.GA22718@nxa18884-linux.ap.freescale.net> <aLcdmY-gqd5cFOYc@p14s>
 <20250903045611.GA8860@nxa18884-linux.ap.freescale.net> <20250903063915.GA18615@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250903063915.GA18615@nxa18884-linux.ap.freescale.net>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 3 Sep 2025 10:22:14 +0300
X-Gm-Features: Ac12FXxuv1frbjT6JpqFVSJ0lAsIa-N1aZl19LOvbbQz194JtJV08sWoT5Y27zE
Message-ID: <CAEnQRZBCxp4rT=es3fDh2w1Ut=i4u3GCnyoOFjqJEMj3CLWPWA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Peng Fan <peng.fan@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_002001_445585_09F3F3E0 
X-CRM114-Status: GOOD (  14.07  )
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

<snip>

> >Please give detailed suggestions, but not a general comment.
>
>
> @Daniel, @Frank =E2=80=94 since you've reviewed and R-b'd this patchset, =
do you
> have thoughts on the latest feedback from Mathieu? Would you agree that
> further simplification is needed, or is the current structure acceptable?=
=E2=80=9D

Peng, please trim the message when replying so that you keep only
relevant part of the text.

I think you are both right here. I understand your frustration :)
but also Mathieu's point of view is reasonable.

For a person who doesn't know the internals of IMX remoteproc the code
is a little
bit hard to understand. Peng I've given you my R-b because even if the
feels like
it is getting complicated it is still manageable and you are the
maintainer for it.

Allow me a few days to see if we can simplify the logic.

thanks,
Daniel.

