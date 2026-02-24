Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5E9E9B242
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhKdfKO/7s0CvWTtS6Na5vHU5m9o337GMZQWXqRgub8=; b=kDGs3eenATkrkuDcG/nEhXyQhx
	nZiDRVbHpEV9CmXixdxB9YItphc4EiUgh/PHcmCTP6spgcQWkyVeAq9eTaIObcqse+nqJnoAmb07a
	ao9NLLQJGYG8PyYXiGY25+TbVKgNdpUQBbZIB4zRS4O9eOJnvE0KxxNKUBy21aNmWA57/x36tqj+E
	J46Zyszew7UoKE3H0H5E4e34+rjk+M1RqnET+SOsMZ7xC9nsYjUGkfsHCS8RTiwFpqUo7lhOVAMQw
	mPjshMTX1YkU6hleJtZrkTjtMsaaQ1XBN0BWf9Pe3hoHo1GV0pjoTOTuwESGisOKiWVLowS8cPAB/
	d8gBJpqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuorM-00000001mSS-1rDr;
	Tue, 24 Feb 2026 09:37:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuorK-00000001mRk-1bW3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:37:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB69743E64
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 09:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83263C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771925857;
	bh=g8edeZSicPJhy++p3maHG8V56bDu+kyumjD/ZT9RxXk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ADBNcvUYlfljcYMUK1YXe6mWXiZyA0e20GKeaTNKWidPih5IS7X18yQ7xBzX4XR2k
	 YLo4ksg5UcaOfk9K/uUe1ZTeYPDFaVCb/xedtqh3u8m9AgfT4i2VqHgVS49GDCYOBi
	 7qx2tEPJyLOD/bkLqf+HNccjdkP5s8CmUbM+gsKtSChqWvpMCqYNku8h4pyHPh9329
	 zZ2jAXRogmpLvmoq48k3qr1njxCfKuTnCeijehPzXPelC2kZ1VeYWz6hTZIKNBnjwY
	 cNrlsiryUdVASp8/fn8bJ3eomuICcrx52MVBwgu4/dX/skjtXmHOIOcReWOZtYKzFK
	 hVdaitIlxrdkg==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-797ab169454so50328707b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 01:37:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdsjJewjukejcZiDnGpxR1y2zP3+jWUW8dxA3fgr72qmsHtsDqlmVnBxfbhHX0YFLhUl6+5ji0YnXthvA64vci@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0MO52ZmjVc9PVetfGkPq31Q6/HJHbr3LT9pIocAjS55wH7QjL
	PutbIs6dipcwiXKIJM/xu1yoo4FXfS8RukvXzA3cZe04eGdd0qaXuD5P4htdqPj72zRp+IsrCt0
	I4WkyXReUKx9IPP4Wa4aOGdwGXzv3YqM=
X-Received: by 2002:a05:690c:e3e5:b0:798:1b2d:4b6c with SMTP id
 00721157ae682-79828cde4bamr107400237b3.11.1771925856834; Tue, 24 Feb 2026
 01:37:36 -0800 (PST)
MIME-Version: 1.0
References: <20260212213656.662437-1-shenwei.wang@nxp.com> <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com> <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com> <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch> <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com> <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 10:37:25 +0100
X-Gmail-Original-Message-ID: <CAD++jLkHwKxcDu7oX+_+N00SSfEMrj4CBEKUYZTEmTZv5Gjb2Q@mail.gmail.com>
X-Gm-Features: AaiRm53tdO9PraGZNM_tmFUQUZSiJUlpqFoMJNSwiXKqWWTvRU2E_PWdBXxyRms
Message-ID: <CAD++jLkHwKxcDu7oX+_+N00SSfEMrj4CBEKUYZTEmTZv5Gjb2Q@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, 
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
X-CRM114-CacheID: sfid-20260224_013738_475197_E4F77669 
X-CRM114-Status: GOOD (  12.83  )
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

On Mon, Feb 23, 2026 at 9:33=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com>=
 wrote:

> Arnaud, if you agree with the points above, my proposal is the following:
>  - Remove the fields you mentioned in the protocol and update the driver =
accordingly so
> that we can establish a true baseline for a generic implementation we all=
 agree.
>  - Then prepare a separate patch to add support for existing NXP platform=
s by introducing
> the necessary fix=E2=80=91up functions.
>
> Please let me know if this approach works for you. My goal is to find a s=
olution that works for
> everyone =E2=80=94 even though I know that pleasing everyone is almost im=
possible.

This looks good to me, and Arnaud seems happy too so let's go ahead
with this.

Yours,
Linus Walleij

