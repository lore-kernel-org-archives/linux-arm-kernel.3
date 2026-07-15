Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1E2C4450E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 15:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0f1V+XLP/pNL55h1xnCAtGPJkQJwQhVW+vGDr0a9svY=; b=vxh3t19vvnFdslWuw5MccKK6i7
	QVdgOa/Ut7lCuJw+M/0hAFG410q27kDoK60D0bbM4QQWaoukGD3wSV9ZUGfKhjTSHBhcxaHY4fsnr
	te3xtTCl4KLb0U/Ln2YsAJ4R06Qmm+iL6aDmajW6uD8SDCBIyDaNZUK7KF7Mnn5KIDBRcTmgozlqt
	wWVwF6PwnciyqU8XJjPDSS6mJ1iBhoIrTUz54wJzCQDBsXxSi2q6V6s8ESI4tk2W589O71knKYbI/
	cUu9IM0oZxWCUeaqu2q7q+/KeKvjR7OEcP/KPu5PX2cvEcVP8vRrP5FiQ4arUHjFuUtW8s4sIF+t1
	e0mUi49Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1GD-0000000FGW1-18mD;
	Wed, 15 Jul 2026 15:10:57 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1G9-0000000FGVP-3c89
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 15:10:55 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cea3004256so59970715ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 08:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784128253; x=1784733053; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0f1V+XLP/pNL55h1xnCAtGPJkQJwQhVW+vGDr0a9svY=;
        b=IlZtm0SdGuU2rL7Q2qgymnBdB1A004UfUA2V9UCnQxhNkRetymTpP19a4N/HbMfgqN
         e5C9YnUtmkCtUlO5EA1YaXIzG8wLtdmXNFfuwuprMnaabDT5QwG4dZRnQLTdPTJsqauv
         ke0tk5rHGYxrhjG0gOL2EgryAnweC7vtW/jFW26zNhJL+ri4x6GYqIpgKZjl1BgYlM3c
         ARAzBMsw+X0MsV//3CBesJ+n7NRn0FDFLcMZqESRRqFoDQXrX3Bk+bDdVC5xYxyiD34b
         PlK1SraaUYwLbYQWKmwUCShHDUx63aP4z4MMC3s1tZH6lpcNPeaj6sU3qgSDZUrLPI0Y
         avpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784128253; x=1784733053;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0f1V+XLP/pNL55h1xnCAtGPJkQJwQhVW+vGDr0a9svY=;
        b=MDtzuXMCvnOz5RzP97PR6u34m3Nv9ygnDBauaGqW6UM6OD8oKOpn72jf8JgrYWnBjR
         4CwVNOCK9B2GgxXQ5gEAT7IanVJcs2fQSEdW7DVSzeWz1ZerokgDp+cKiRkV5oUCr2bT
         zf/qqEqU99GlZWJnNzv2jRPyKuBtW8OS9OVHwnI3YCBfZiCzsMh8YNo0RpgUuJ05UqcS
         LfMT5alHaJrbrbtYtI5YPpO/ICtF3nLbx8kdSJflHSUoVYdbgIcfMbJLqFNLksb8Eh+9
         qJ9b565nuFiUWeOhs9yQq1TU9I1Ukui0IMnxy8tImQ50WmSzZ5bNXLDu1OJ4Bx246cKc
         DqwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGnAaaAmgu2f1nPBBxdLvMvlF00APAumj6gAwqjakjQXQt7WNw3wPeGSCmXqnvMD7XYGL4sT2/o99ZkWMmRKQC@lists.infradead.org
X-Gm-Message-State: AOJu0YzEkr5dZ5qLMOPzlacguEOvsDBhtwHxWTJv4KnNfHtmtwlf1tQJ
	u18fX+mVYvaLj73pFGUPFLuE6/pSWlWnhZle5P3LLyUlJKScWiWIk7zPpRUdCI7sSsA=
X-Gm-Gg: AfdE7cnW2aPo/6aip9Km68uWTBlsRSOZASrBhO6Py3ZHQvpoXyT5vjpVw488WUJp2LT
	UC6/073jRaSIEJvGPUuT/XY8vR8jyLEhBJJBcRBCx1LYLltjDkKwM34Gqwz3/ptptY5j6uKtIpc
	YNw8GMEW+0dJwL7E0ed+Bgw/outkC+vrzC/XU2WkK3AndbzFx8akEbdO/p0ul6iA20/c9dVBWEa
	+g0u2P2mNU5JntxnkrzcfZkxxDAWQiBeBJH8ccCpBBwcHg7m/Cw3LVoKCEmz7mkJA7mHaiTNJBJ
	9qyMNx4Ya8xQXUmZFdBha47oCPIeQRE1IV6k0zOAFEqemlIb17yIRmbzQW3WFDrvxx7XBv7Tbfb
	aNvnXNqQI2ldt96lTPobWu6X1RxoCrYTT38SeAp9uhwvkXjuQe4WJOZWJi8o3mZ28nckN3QXOzV
	FGRg4zQc3eyXaMpFgL04YrRfvHgGE=
X-Received: by 2002:a17:903:1a2e:b0:2cc:eec6:558 with SMTP id d9443c01a7336-2cef14ad047mr75726665ad.39.1784128252771;
        Wed, 15 Jul 2026 08:10:52 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4f38:9a5e:fd18:7a9b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf0fdb3a0asm4417715ad.0.2026.07.15.08.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:10:52 -0700 (PDT)
Date: Wed, 15 Jul 2026 09:10:49 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	"b-padhi@ti.com" <b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Message-ID: <alei-dNIXo7Z7uT1@p14s>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com>
 <alUdg9iTysXCFUa5@p14s>
 <PAXPR04MB918568AE7B2364EC9D16427689F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB918568AE7B2364EC9D16427689F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_081053_941133_2AF169A4 
X-CRM114-Status: GOOD (  29.05  )
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

On Tue, Jul 14, 2026 at 07:04:08PM +0000, Shenwei Wang (OSS) wrote:
> 
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Monday, July 13, 2026 12:17 PM
> > To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> > Andersson <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> > POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> > <andrew@lunn.ch>
> > Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over rpmsg
> > bus
> > 
> > > +
> > > +The RPMSG message consists of a 8-byte packet with the following layout:
> > > +
> > > +.. code-block:: none
> > > +.. code-block:: none
> > > +
> > > +   +------+------+--------+
> > > +   | 0x00 | 0x01 |  0x02  |
> > > +   |   2  | line | trigger|
> > > +   +------+------+--------+
> > 
> > 2 things here:
> > 
> > 1) You did not include messages that mask and unmask interrupts at the driver
> > side.
> > 
> > 2) We are carrying virtio-gpio messages on top of RPMSG and as such, this whole
> > protocol should be about thar:
> > 
> > +------+------+--------+--------
> > | 0x00 |       payload         |
> > |  Q   |                       |
> > +------+------+--------+--------
> > 
> > Q = 0 requestq
> > Q = 1 eventq
> > 
> > The "payload" part is simply the format of the messages as found in the virtio-
> > gpio specification.  From there, the only thing left to mention is which messages
> > are not supported, i.e get line names.
> > 
> > > +
> > > +- **line**: The GPIO line (pin) index of the port.
> > > +
> > > +- **trigger**: Optional parameter to indicate the trigger event type.
> > 
> > Not part of the spec - remove.
> > 
> 
> The two fields above are required for rpmsg-gpio, but not for virtio-gpio.

I agree that the line is required but not the trigger.  The driver (using the
same terminology as the specification) knows what trigger the pin has been
configured for.  Adding the trigger information to the interrupt notification is
redundant.

> 
> In the rpmsg-gpio case, interrupt detection and handling occur on the remote processor. The 
> interrupt information (such as the GPIO line and trigger type) must therefore be sent to Linux 
> through this notification message.
> 
> In contrast, for virtio-gpio, interrupt handling is performed on the local processor. Since Linux already 
> has all the necessary interrupt context, the information is not needed.
> 
> Shenwei
> 
> > Given the refactoring work that is still needed, I will not look at the
> > implementation.
> > 
> > Thanks,
> > Mathieu
> > 
> > > +
> > > diff --git a/Documentation/driver-api/gpio/index.rst
> > > b/Documentation/driver-api/gpio/index.rst
> > > index bee58f709b9a..e5eb1f82f01f 100644
> > > --- a/Documentation/driver-api/gpio/index.rst
> > > +++ b/Documentation/driver-api/gpio/index.rst
> > > @@ -16,6 +16,7 @@ Contents:
> > >     drivers-on-gpio
> > >     bt8xxgpio
> > >     pca953x
> > > +   gpio-rpmsg
> > >
> > >  Core
> > >  ====
> > > --
> > > 2.43.0
> > >

