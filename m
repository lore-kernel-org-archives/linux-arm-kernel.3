Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF0DC6369F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 15:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdzwZuG1QrazH/8Adb2q/4hXsnStMTv8CJdWUB84/8s=; b=LcQBvJIdF/bjsgAM0fo04BCreA
	YzxKurfYkuvu2mtKGKWwkhuB0gmOgegFeo7LJ0I8wImDIEf2CLYPMB5flhAKI12YGjjVTh59ElYbk
	zAenzQ8u1+nmQgOJdPEmaYgwUF7sNJTpv695ZlGwDx762iRkuKukRBBNckfjMOgpG6ydJO719rOFY
	NYK4QstYn1qVSjYg1IFnHdR/I7ginRk67+WJOwOWcRHzsBSR38iaU/5yBYkJiHhSrU/xKo1Y+P4dL
	fN9OT98yspEzXTAMRBJplc1TQChmvxWHztSZnAjzPeFljvxK6yFmzBM697qtHDtBoEB+TfSj7yAiT
	JPXYep5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuArK-0000000GlDJ-02NZ;
	Sun, 22 Feb 2026 14:54:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuArH-0000000GlAI-3KLK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Feb 2026 14:54:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB9E94045F
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 14:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F45C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 14:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771771724;
	bh=sdzwZuG1QrazH/8Adb2q/4hXsnStMTv8CJdWUB84/8s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cNNISCeuROU90CuCrmTiFGRaTDlLMJFNSq0MBg/edSw1kNJ5oBs0pXBZbG/9SLuq6
	 ThLIKAxdOeNMElpDGoKztMrFTY+lgJ/wNny8a1dtHRSlUvr+izV+mn34gbC971Hm5/
	 Df1D/bF4Dk1A9iSC3psm3f/FvmhUQ0o+lXveIbgVdcA8MXSmJodpXxOdWgNCOIgyF9
	 i53aXLPLNDeMUJPENRZjAqK0EEPjvGmFWx2NNdzFZGsD+xPez+iaV/5HE6H2hDSEKD
	 7+86yXza7aU85rgwcsG9orDXYBGR1HWBPQ7wdch6uDrjuq7CVqzAbq1GqouCDzv4WX
	 erVdwZKazLJvg==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ad8435f46so3059625d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 06:48:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXk8Osx+jiDgfEOyCkT55AjUJjgPSTB+SS4hmxdFCzWbGSbVzhLKZOHU3kPoM9IV2FtH7Z3shQA4lD2jwbiaP9z@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi7m9iYrWDGXwDYkGm5UuluhBUPyT64hKYMPEWiTIDDquNuOvn
	vH+FzfdTFkdoeD1ho9d9Du4Nz9okBoCSbZ1mzB1dPIlmOskRlPWZGkVEFZilXHruJU4Afb8PMkm
	IRiprAO0n935/m4UOD+UQ/aWZbpfZN28=
X-Received: by 2002:a05:690e:d59:b0:64a:d479:bfbe with SMTP id
 956f58d0204a3-64c789c6a7bmr4841631d50.11.1771771724015; Sun, 22 Feb 2026
 06:48:44 -0800 (PST)
MIME-Version: 1.0
References: <20260212213656.662437-1-shenwei.wang@nxp.com> <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com> <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com> <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch> <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Feb 2026 15:48:32 +0100
X-Gmail-Original-Message-ID: <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
X-Gm-Features: AaiRm514C7pGWVEcrMl_Px6Oy5MFEMWE4sZ-03YXonAepWinISuPyzCRs8cRpUg
Message-ID: <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_065455_868457_A2D84D57 
X-CRM114-Status: GOOD (  11.94  )
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

On Fri, Feb 20, 2026 at 7:57=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com>=
 wrote:

> Given that, I=E2=80=99d like to hear from the GPIO subsystem maintainers =
=E2=80=94 @Linus Walleij and
> @Bartosz Golaszewski =E2=80=94 on whether a driver that works with the cu=
rrent hardware/firmware
> design could still be acceptable for upstream inclusion. My understanding=
 is that upstream
> generally supports existing, real-world hardware as long as the driver me=
ets subsystem standards.

What a swell party this has become.

In this kind of situations I usually refer to
Documentation/process/management-style.rst

What is the message I as a maintainer is getting from NXP regarding
"gpio: rpmsg: add generic rpmsg GPIO driver"?

Arnaud, who is the only person in this discussion who actually wrote
a standard RPMSG driver (drivers/tty/rpmsg_tty.c), must ACK this
patch if it wants to call itself a "generic" RPMSG GPIO driver, if he
does not, then it isn't.

Is it generic? If it is not, let's call it "NXP rpmsg GPIO driver" and rena=
me
files etc accordingly. Maybe it can share code with the actual generic
RPMSG driver once that arrives, that is more of a library question.

Yours,
Linus Walleij

