Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA852CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 19:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8DW58I56k4HGq4dRxVuBEHA+ztABtCu6lkTMHWYRCo=; b=VaOhACrXilk/rbXJrP6KJAaW+G
	2wHZ7l5yt8QgkSJOZpsnREMyMNHvLqq6SmNlPDqm8MhS0AtpflbQXBQbZqGiplWaBNVTEYNuCYzLA
	TxuiKSJh+SCsFGIyZ+PhtisCU5bjVWTzFuod5zn91PmgmCnKLE7Fguk19m1Nxxul4FgOwuf6nGwaZ
	QWDxba2AE/y5lz9+mrsdhNcSf99iaE0jyPHi6bY5IPa0+T89Npy4vxSrg9rV/iYbYbT7qgEQX4Fw1
	OCkIfWf9E790w+AP39dEfLW3YTwt+1LS9aYJI2Cm4U3uLK0x9tP8wktPleJrvVxmf7IEKENMYPix4
	8ioserKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJysx-0000000E9NL-3SWt;
	Mon, 04 May 2026 19:23:19 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJysv-0000000E9Mj-1Chp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 19:23:18 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so3456508a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 12:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777922596; x=1778527396; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F8DW58I56k4HGq4dRxVuBEHA+ztABtCu6lkTMHWYRCo=;
        b=W7gmKqLtXZAVjYPUibSCOQ8YAvWqvKbFDuRw8ZCY38ZKdbfjfBe5FttJ9QMVi3ZPlt
         pYf5q/R8Fl1JQ8tS4vMGzDlyIYG/LHgu7YjUGH7SNT/P5EOdNCMvuCkVMWTGINpJ75l2
         pfVeAHX2CdhBkGHR2cXqa91deFHI0JGHS4Ng4oB+HQZaXiEqOgsei8632tZBTYP+BY4P
         m45cOCYO6oZxtYwVDy3o7SWwiUyqyiH+UlcA/yO7KupJTP4F4pDHllqTS0t84/EJiW7K
         pLmElqHP86D1RSTK0yoJ0M1L+JpEZS9+gqElyQnJkdqv36uT/rxbBmSwn0Uf6pdiHqU0
         u9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777922596; x=1778527396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8DW58I56k4HGq4dRxVuBEHA+ztABtCu6lkTMHWYRCo=;
        b=cJa3WdeFNL46bUIQ+IrGa5pjZc+e2puAdot/UK6U0OfZrlK/RWADtV3ut/ECAzxNg4
         DeG9Mg45jNH3mdiCskgNRxWCyZN3kb5CkQwQca187138Hky783rDfjPajQppG6Y5vMkz
         nC6UBP5K479aM+bOC8oew5Uw+yiqzcC3oHhIJK0zkkOcHOdeE7ErwJfWCj3fzZqk8RS/
         /FjDBYPRdRQJxqL8dVC/XSS5boipJ5KK0Jo8SULBKyfFjqlaUFIQ7riR2l6BfhLewBJ+
         DvOwLUWkNjHuNYbH50doGg/sPeFPmuhCG4++h1Eqtw/riCJaeTwIU4Z5iCKoFKTltCU2
         Mtng==
X-Forwarded-Encrypted: i=1; AFNElJ/H3q6WxjeTovKG+2KiXw9TqdEES9J+QWCyJ9ORsqC/71ONXKkInWspVd/8tfq+2fj2LNWFGz0LXHyngCYACED4@lists.infradead.org
X-Gm-Message-State: AOJu0YxiT6we8wzgByhMez//pvkAQ30muo3qy+t3geEfPVWSv6NHCcCL
	C2WdftbPQA6l2yC/KbxH7HrFvRETwdLCj/XTUyhkb0jMg6Cwfid/p623zjeMLdh6DpA=
X-Gm-Gg: AeBDietCoXdbBVph8v2FK31NpF5TnIgQgG1mb8TIoNSim+ovEV8FTdg9rPntvvGWvQ8
	Bfa4Era5VxbyVkzcC0RZ5kXqYNgkdh58cfqxtXVRQs/IzNyP1v4DlXlHoJh1SIco7kR3ZjZpROK
	5oP1oqquDZsyDYolGN5To+eezYJ1VI70ne2qeR9XcPT50WI//13/QHxGzMD4nB5usdZjhHG6+BW
	UiIpTpEG53rILIwRJIu2SkIBsAgE97jP8uL7MDTfOWx6Xfv0wmYC6itvIe29OErdMumq+xbWdON
	5yzOcdJpglB9HD4OvEQJ+TZ4tdvcy0v6VyZ3euIBSW1VnzitjEB1LqQakwQlDB+tIzoPWkeBvMb
	tnnxH74S3rfmxG/+4XYVOal1b9+aeyDw85aaflXQh/PQeKLH7LXr9Rq65rSL5Mp0i8U/tVK59S3
	JvIA0KR9OlnNyB0dX+Ct7cdjdQ050UT14FeagYS9T6vai6et/w
X-Received: by 2002:a17:90b:4ec5:b0:35f:be11:b3e0 with SMTP id 98e67ed59e1d1-3650cd0818cmr11105828a91.2.1777922595178;
        Mon, 04 May 2026 12:23:15 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:6e2e:a9d7:64d6:25af])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36575dee1fdsm108101a91.1.2026.05.04.12.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:23:14 -0700 (PDT)
Date: Mon, 4 May 2026 13:23:11 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v13 1/4] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Message-ID: <afjyH5JT0JS2j0L5@p14s>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-2-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422212849.1240591-2-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_122317_383335_37A26F18 
X-CRM114-Status: GOOD (  45.79  )
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

On Wed, Apr 22, 2026 at 04:28:46PM -0500, Shenwei Wang wrote:
> Describes the gpio rpmsg transport protocol over the rpmsg bus between
> the remote system and Linux.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  Documentation/driver-api/gpio/gpio-rpmsg.rst | 266 +++++++++++++++++++
>  Documentation/driver-api/gpio/index.rst      |   1 +
>  2 files changed, 267 insertions(+)
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
> 
> diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> new file mode 100644
> index 000000000000..abfde68c9b0a
> --- /dev/null
> +++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> @@ -0,0 +1,266 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +GPIO RPMSG (Remote Processor Messaging) Protocol
> +================================================
> +
> +The GPIO RPMSG transport protocol is used for communication and interaction
> +with GPIO controllers on remote processors via the RPMSG bus.
> +
> +Message Format
> +--------------
> +
> +The RPMSG message consists of a 6-byte packet with the following layout:
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   |type |cmd  |port |line |  data    |
> +   +-----+-----+-----+-----+-----+----+

I will take a final decision on the 'port' field when I'm done reading the
thread on how endpoints should be created.

> +
> +- **type (Message Type)**: The message type can be one of:
> +
> +  - 0: GPIO_RPMSG_SEND
> +  - 1: GPIO_RPMSG_REPLY
> +  - 2: GPIO_RPMSG_NOTIFY
> +
> +- **cmd**: Command code, used for GPIO_RPMSG_SEND messages.
> +
> +- **port**: The GPIO port (bank) index.
> +
> +- **line**: The GPIO line (pin) index of the port.
> +
> +- **data**: See details in the command description below.
> +
> +- **reply err**: Error code from the remote core.
> +
> +  - 0: Success
> +  - 1: General error (Early remote software only returns this unclassified error)
> +  - 2: Not supported (A command is not supported by the remote firmware)
> +  - 3: Resource not available (The resource is not allocated to Linux)
> +  - 4: Resource busy (The resource is already in use)
> +  - 5: Parameter error

No.  The virtio-GPIO specification does not define any of these.  We are not
re-inventing the specification, we are only using it on top of RPMSG.  The only
value for 'status' are VIRTIO_GPIO_STATUS_OK and VIRTIO_GPIO_STATUS_ERR.  Modify
the virtio-GPIO specification if you want to do something like this.

> +
> +
> +GPIO Commands
> +-------------
> +
> +Commands are specified in the **Cmd** field for **GPIO_RPMSG_SEND** (Type=0) messages.
> +
> +The SEND message is always sent from Linux to the remote firmware. Each
> +SEND corresponds to a single REPLY message. The GPIO driver should
> +serialize messages and determine whether a REPLY message is required. If a
> +REPLY message is expected but not received within the specified timeout
> +period (currently 1 second in the Linux driver), the driver should return
> +-ETIMEOUT.
> +
> +GET_DIRECTION (Cmd=2)
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 0   | 2   |port |line | 0   | 0  |
> +   +-----+-----+-----+-----+-----+----+

'line' should be 16 bit followed by a 32 bit value.

> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 1   | 2   |port |line | err | dir|
> +   +-----+-----+-----+-----+-----+----+

Same as above, 'line' should be 16 bit.  'err' should be 'status' and 'dir'
should be 'value'.

> +
> +- **err**: See above for definitions.
> +
> +- **dir**: Direction.
> +
> +  - 0: None
> +  - 1: Output
> +  - 2: Input
> +
> +SET_DIRECTION (Cmd=3)
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 0   | 3   |port |line | dir | 0  |
> +   +-----+-----+-----+-----+-----+----+


Same as above, i.e 'line' is 16 bit follow by a 32 bit value.

> +
> +- **dir**: Direction.
> +
> +  - 0: None
> +  - 1: Output
> +  - 2: Input
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 1   | 3   |port |line | err | 0  |
> +   +-----+-----+-----+-----+-----+----+

Same as my reply for GET_DIRECTION.

The same for all the other messages below.  There should be a direct and obvious
connection between this protocol and virtio-gpio.  In fact I'm starting to
wonder if we should have two endpoints per GPIO controller, one for the requestq
and another one for the eventq.  That would make this entire protocol
unecessary.  I will elaborate more later when I read Beleswar and Arnaud's
conversation on that topic.   

> +
> +- **err**: See above for definitions.
> +
> +
> +GET_VALUE (Cmd=4)
> +~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 0   | 4   |port |line | 0   | 0  |
> +   +-----+-----+-----+-----+-----+----+
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 1   | 4   |port |line | err | val|
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **err**: See above for definitions.
> +
> +- **val**: Line level.
> +
> +  - 0: Low
> +  - 1: High
> +
> +SET_VALUE (Cmd=5)
> +~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 0   | 5   |port |line | val | 0  |
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **val**: Output level.
> +
> +  - 0: Low
> +  - 1: High
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 1   | 5   |port |line | err | 0  |
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **err**: See above for definitions.
> +
> +SET_IRQ_TYPE (Cmd=6)
> +~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 0   | 6   |port |line | val | wk |
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **val**: IRQ types.
> +
> +  - 0: Interrupt disabled
> +  - 1: Rising edge trigger
> +  - 2: Falling edge trigger
> +  - 3: Both edge trigger
> +  - 4: High level trigger
> +  - 8: Low level trigger
> +
> +- **wk**: Wakeup enable.
> +
> +  The remote system should always aim to stay in a power-efficient state by
> +  shutting down or clock-gating the GPIO blocks that aren't in use. Since
> +  the remoteproc driver is responsible for managing the power states of the
> +  remote firmware, the GPIO driver does not require to know the firmware's
> +  running states.
> +
> +  When the wakeup bit is set, the remote firmware should configure the line
> +  as a wakeup source. The firmware should send the notification message to
> +  Linux after it is woken from the GPIO line.
> +
> +  - 0: Disable wakeup from GPIO
> +  - 1: Enable wakeup from GPIO

This is not part of the virtio-GPIO specification.  Again, modify the
virtio-GPIO specification to do this.

> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 1   | 6   |port |line | err | 0  |
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **err**: See above for definitions.
> +
> +NOTIFY_REPLY (Cmd=10)
> +~~~~~~~~~~~~~~~~~~~~~
> +The reply message for the notification is optional. The remote firmware can
> +implement it to simulate the interrupt acknowledgment behavior.
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 0   | 10  |port |line |level| 0  |
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **port**: The GPIO port (bank) index.
> +
> +- **line**: The GPIO line (pin) index of the port.
> +
> +- **level**: GPIO line status.


No.  In accordance with the specification, the only thing a device sends when an
interrupt occurs is VIRTIO_GPIO_IRQ_STATUS_VALID, or
VIRTIO_GPIO_IRQ_STATUS_INVALID to return the buffers back to the driver when
interrupts are disabled.


> +
> +Notification Message
> +--------------------
> +
> +Notifications are sent by the remote core and they have
> +**Type=2 (GPIO_RPMSG_NOTIFY)**:
> +

No.  Once again, we are not re-writing the specification.  Virtio-GPIO doesn't
need this so I don't see whey virtio-rpmsg-gpio would.

> +When a GPIO line asserts an interrupt on the remote processor, the firmware
> +should immediately mask the corresponding interrupt source and send a
> +notification message to the Linux. Upon completion of the interrupt
> +handling on the Linux side, the driver should issue a
> +command **SET_IRQ_TYPE** to the firmware to unmask the interrupt.
> +
> +A Notification message can arrive between a SEND and its REPLY message,
> +and the driver is expected to handle this scenario.
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 2   | 0   |port |line |type | 0  |
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **port**: The GPIO port (bank) index.
> +
> +- **line**: The GPIO line (pin) index of the port.
> +
> +- **type**: Optional parameter to indicate the trigger event type.
> +
> diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
> index bee58f709b9a..e5eb1f82f01f 100644
> --- a/Documentation/driver-api/gpio/index.rst
> +++ b/Documentation/driver-api/gpio/index.rst
> @@ -16,6 +16,7 @@ Contents:
>     drivers-on-gpio
>     bt8xxgpio
>     pca953x
> +   gpio-rpmsg
>  
>  Core
>  ====
> -- 
> 2.43.0
> 

