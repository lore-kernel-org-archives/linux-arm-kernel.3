Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CEFC44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 16:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDfqLI3RfxmSiaSDiydNo7YcWiprzsWXHzTIYi3ikUo=; b=RRUeGI5LQ0XPciYU+dE93NRwom
	LVk1ON0Qt3JseZwvPTl1fzZJiOwa/JDu9V/hh9D7C/QBaWPDoeFDf6Xg4qKD+xnWMjJ3QoucCMgdv
	oJ+TWhaap+RQ5yH9ytAGa5ADsLer/+k76g++oY/UdrZxN3kiM0S6UJeAlNsGRwHUAJYy8T7UH0Y5Y
	3IjH8VoxhvJbGCQd1Kt+Ucj0narzYBxgLge91VLXcrkXOcBiQZeAemPXJw5CmT6c1X0eRdFeEjRgb
	Av4PU6YbG3Qtu/Tek7hhlLc1dwpfQhysyCzFYELXmUPjw4W3z2jDUQmT9UGWje0tA9yxFOID7W5Jh
	7WdCrVCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjg6v-0000000Cf9Z-2uJ9;
	Tue, 14 Jul 2026 16:35:57 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjg6t-0000000Cf9E-14mE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 16:35:56 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84861fc51f5so2670925b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784046954; x=1784651754; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mDfqLI3RfxmSiaSDiydNo7YcWiprzsWXHzTIYi3ikUo=;
        b=F17CSw58mOx70GBOVmYiQR30Kpr5L+1ePlgRaKGEK/P6Ot0BtKxUxO91F2G2PSMPj/
         9y+rmqOh76EkQmKbB1REkGTJscypMx1dPttcVGSvCG9geBeucMo6N6X3mau/ilXoIkhv
         YQTOcu2XzuSOKfGdSqNaby1oMW4c2Nvu7jBDlQ3Q8o2EyoRXRiGGI1dMrJRIsNArsR5H
         gf8+d/iFRrFom4prx0okBdI9m6wT11COe2XL21yD9ca9gImagWFdpCd7NOw9pOwbQrRG
         MWLGjWKP6F0CUCR8DqrUDIfIwcIItqUqIoBhbfNTaJREbhGlLUo9I6ProT8daMM7cwCw
         N2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784046954; x=1784651754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDfqLI3RfxmSiaSDiydNo7YcWiprzsWXHzTIYi3ikUo=;
        b=Wsy1YW9KvFnm4xt6P2aEGCQXKwwIWkABk7U/hMPibT7eko0Z0cXnthSrPrs17PT+k2
         TGmhOQPsgDN+8/69eH4NBSGQdA8m9fniKMqe14B0JMKik3/8A890OtVaPiFwsqdiGk8f
         +bgf+In8CZ4hEPHzzat11LwsCMMVN25WXETvAG6/O6etQNZ9UtdpIeIDeew0UYVXgRsL
         XYG41rt4d8T/IlXNDfg1Ley41h+rDms8je7QPHmCbiOlCyKbztek8t415j2A+OcI4JN3
         X8qdPMajSJ8TSwn1f5KDnlqxX8AC7rOlE3C9cqhbmSnPK0Hs2FMd5a8RV0qohaJdD5co
         WQIg==
X-Forwarded-Encrypted: i=1; AHgh+RqH4LtpKKJXc3acndBn9j2dYm/7C9XJVOFewh1hx7XciqqJe83DzvobN9mmnGzAd29qVuusb0BEZ8wXdPaWO1io@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5YPJStAc32zTn4DJ2JCK8AJfbcFGdyt1G4P3OnCH+Ty50RWHj
	oR5ceVES/ls/1aKB74eQN3FYCY20H26Ib65RGhQC2Ud3DjIt9TGNfXdd6PAexe6C3jw=
X-Gm-Gg: AfdE7cmhWMmG+iXK3uc7JLvtsGrn8dwnqPq4nqSOZ5W/NwJC776W1WLvk3NEP9drJPu
	4XoYuBbLW1d27IvXlXlIMfcjegrA2/ItU41spx4X6fyCd+aw2YoOkMMwCKW3zc9n2bdY53svOFk
	+j9lRWeB1uQlqWCE8ZJzG6tXhNZPzNhwIPBL17Z3MSkbgx3oZIbiNTSEC4yezZh0xwMHaDVrigp
	3eFbeROf5nfAup/FWC8fbdrnXkuxWd9G49pNLrIfNNhIcNqReJhG2Yn2BOJwrkGUcIOqiyajkiU
	KAEMbw8+6g4AuGeh4TAF6GBWse0DzcftSNvh57eJJUtoLD1J0YXwe2GYPGgxu7f4asqfdm1lTG8
	AmOlGwK7fWQtLZ7YUwrYi1/5r2E7lhrMcSKvbfdkU/Bg3sln4H8vbj0uyMK3lYn+9WCoYvsZ79a
	JMZ43nqwmYAqEVZMGl
X-Received: by 2002:a05:6a00:124f:b0:846:7507:4e07 with SMTP id d2e1a72fcca58-8488975aac2mr12250820b3a.39.1784046953503;
        Tue, 14 Jul 2026 09:35:53 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:24cc:3af8:4244:12fe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7dada6sm1772036b3a.42.2026.07.14.09.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:35:52 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:35:50 -0600
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
Message-ID: <alZlZvQQwq-g6VL3@p14s>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com>
 <alUdg9iTysXCFUa5@p14s>
 <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_093555_332173_206BC341 
X-CRM114-Status: GOOD (  45.49  )
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

On Tue, Jul 14, 2026 at 02:29:12PM +0000, Shenwei Wang (OSS) wrote:
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
> > On Thu, Jun 25, 2026 at 10:54:26AM -0500, Shenwei Wang wrote:
> > > From: Shenwei Wang <shenwei.wang@nxp.com>
> > >
> > > Describes the gpio rpmsg transport protocol over the rpmsg bus between
> > > the remote system and Linux.
> > >
> > > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > > ---
> > >  Documentation/driver-api/gpio/gpio-rpmsg.rst | 271 +++++++++++++++++++
> > >  Documentation/driver-api/gpio/index.rst      |   1 +
> > >  2 files changed, 272 insertions(+)
> > >  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
> > >
> > > diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst
> > > b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> > > new file mode 100644
> > > index 000000000000..7d351ff0adb0
> > > --- /dev/null
> > > +++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> > > @@ -0,0 +1,271 @@
> > > +.. SPDX-License-Identifier: GPL-2.0-or-later
> > > +
> > > +GPIO RPMSG (Remote Processor Messaging) Protocol
> > > +================================================
> > > +
> > > +The GPIO RPMSG transport protocol is used for communication and
> > > +interaction with GPIO controllers on remote processors via the RPMSG bus.
> > > +
> > > +Message Format
> > > +--------------
> > > +
> > > +The RPMSG message consists of a 8-byte packet with the following layout:
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |     cmd     |    line     |           value           |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +- **cmd**: Command code, used for GPIO_RPMSG_SEND messages.
> > > +
> > > +- **line**: The GPIO line (pin) index of the port.
> > 
> > Here and throughout, please remove any mention of 'port'.  This is handled by the
> > endpoint device, i.e one GPIO controller (port) per endpoint.
> > 
> > > +
> > > +- **value**: See details in the command description below.
> > > +
> > > +
> > > +GPIO Commands
> > > +-------------
> > > +
> > > +Commands are specified in the **Cmd** field.
> > > +
> > > +The SEND message is always sent from Linux to the remote firmware.
> > > +Each SEND corresponds to a single REPLY message. The GPIO driver
> > > +should serialize messages and determine whether a REPLY message is
> > > +required. If a REPLY message is expected but not received within the
> > > +specified timeout period (currently 1 second in the Linux driver),
> > > +the driver should return -ETIMEOUT.
> > > +
> > > +GET_DIRECTION (Cmd=2)
> > > +~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |      2      |    line     |             0             |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +**Reply:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+--------+--------+
> > > +   | 0x00 |  0x01  |  0x02  |
> > > +   |   1  | status | value  |
> > > +   +------+--------+--------+
> > > +
> > > +- **status**:
> > > +
> > > +  - 0: Ok
> > > +  - 1: Error
> > > +
> > > +- **value**: Direction.
> > > +
> > > +  - 0: None
> > > +  - 1: Output
> > > +  - 2: Input
> > > +
> > > +
> > > +SET_DIRECTION (Cmd=3)
> > > +~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |      3      |    line     |           value           |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +- **value**: Direction.
> > > +
> > > +  - 0: None
> > > +  - 1: Output
> > > +  - 2: Input
> > > +
> > > +**Reply:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+--------+--------+
> > > +   | 0x00 |  0x01  |  0x02  |
> > > +   |   1  | status |    0   |
> > > +   +------+--------+--------+
> > > +
> > > +- **status**:
> > > +
> > > +  - 0: Ok
> > > +  - 1: Error
> > > +
> > > +
> > > +GET_VALUE (Cmd=4)
> > > +~~~~~~~~~~~~~~~~~
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |      4      |    line     |             0             |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +**Reply:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+--------+--------+
> > > +   | 0x00 |  0x01  |  0x02  |
> > > +   |   1  | status | value  |
> > > +   +------+--------+--------+
> > > +
> > > +- **status**:
> > > +
> > > +  - 0: Ok
> > > +  - 1: Error
> > > +
> > > +- **value**: Level.
> > > +
> > > +  - 0: Low
> > > +  - 1: High
> > > +
> > > +
> > > +SET_VALUE (Cmd=5)
> > > +~~~~~~~~~~~~~~~~~
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |      5      |    line     |           value           |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +- **value**: Output level.
> > > +
> > > +  - 0: Low
> > > +  - 1: High
> > > +
> > > +**Reply:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+--------+--------+
> > > +   | 0x00 |  0x01  |  0x02  |
> > > +   |   1  | status |    0   |
> > > +   +------+--------+--------+
> > > +
> > > +- **status**:
> > > +
> > > +  - 0: Ok
> > > +  - 1: Error
> > > +
> > > +
> > > +SET_IRQ_TYPE (Cmd=6)
> > > +~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |      6      |    line     |           value           |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +- **value**: IRQ types.
> > > +
> > > +  - 0: Interrupt disabled
> > > +  - 1: Rising edge trigger
> > > +  - 2: Falling edge trigger
> > > +  - 3: Both edge trigger
> > > +  - 4: High level trigger
> > > +  - 8: Low level trigger
> > 
> > I'm in agreement with cmd 3, 4, 5 and 6.
> > 
> 
> How about cmd 2?

Yes, I forgot cmd 2.  

> 
> > > +
> > > +**Reply:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+--------+--------+
> > > +   | 0x00 |  0x01  |  0x02  |
> > > +   |   1  | status |    0   |
> > > +   +------+--------+--------+
> > > +
> > > +- **status**:
> > > +
> > > +  - 0: Ok
> > > +  - 1: Error
> > > +
> > > +SET_WAKEUP (Cmd=16)
> > > +~~~~~~~~~~~~~~~~~~~
> > 
> > I already commented on messages that are not part of the virtio-gpio
> > specification.
> > 
> 
> I don't believe virtio-gpio needs a SET_WAKEUP command.
> 
> In the RPMSG case, SET_WAKEUP is required because it performs an operation on the 
> remote processor, so the remote side must be explicitly notified.

What operations would that be?

> 
> For virtio-gpio, however, everything is handled locally. The other side does not need to 
> perform any action, so sending a SET_WAKEUP command appears unnecessary.

What is "everything"?

> 
> 
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |      1      |    line     |           value           |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +- **value**: Wakeup enable.
> > > +
> > > +  The remote system should always aim to stay in a power-efficient
> > > + state by  shutting down or clock-gating the GPIO blocks that aren't
> > > + in use. Since  the remoteproc driver is responsible for managing the
> > > + power states of the  remote firmware, the GPIO driver does not
> > > + require to know the firmware's  running states.
> > > +
> > > +  When the wakeup bit is set, the remote firmware should configure
> > > + the line  as a wakeup source. The firmware should send the
> > > + notification message to  Linux after it is woken from the GPIO line.
> > > +
> > > +  - 0: Disable wakeup from GPIO
> > > +  - 1: Enable wakeup from GPIO
> > > +
> > > +**Reply:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+--------+--------+
> > > +   | 0x00 |  0x01  |  0x02  |
> > > +   |   1  | status |    0   |
> > > +   +------+--------+--------+
> > > +
> > > +- **status**:
> > > +
> > > +  - 0: Ok
> > > +  - 1: Error
> > > +
> > > +Notification Message
> > > +--------------------
> > 
> > "Interrupt Messages"
> > 
> > > +
> > > +Notifications are sent by the remote core and they have
> > > +**Type=2 (GPIO_RPMSG_NOTIFY)**:
> > > +
> > > +When a GPIO line asserts an interrupt on the remote processor, the
> > > +firmware should immediately mask the corresponding interrupt source
> > > +and send a notification message to the Linux. Upon completion of the
> > > +interrupt handling on the Linux side, the driver should issue a
> > > +command **SET_IRQ_TYPE** to the firmware to unmask the interrupt.
> > > +
> > > +A Notification message can arrive between a SEND and its REPLY
> > > +message, and the driver is expected to handle this scenario.
> > > +
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
> 
> Interrupt masking and unmasking are handled entirely on the local processor.
> 
> When an interrupt occurs, the remote system masks the interrupt and then sends a notification 
> to Linux. After Linux processes the notification, it sends a SET_IRQ_TYPE message back to the 
> remote system, which then unmasks the interrupt.

This is the kind of information that should be part of this documentation.

> 
> Thanks,
> Shenwei
> 
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

