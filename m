Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3558DC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kgwyk0OObBT++oiW1zqAAqUnSr/tbzGEYYjYm7Tx6U=; b=RHkxzOFNNv2T+VI2k8EdgkNhZe
	o336Ck/pEXT43gZ2qN24j7JtFw+zP718fWlhkzWyvC22D5BoUFN7He7zIdHe4NooIHLOpIXzkmtxo
	+rOY7eZncSDpqkswlaSRYCiUQSZ3lu5B2is55OjOqwaxjThxEwvQckmpgDLMdJ3IB8/VhAjmH16hl
	8SPe80xsUeYXwiQnx3QhUobT7xQjOS03fAUCYPX+S+mU0/YWqD/Yq1VJpZBzAkV6n/1To/bn+URAE
	Ec1W3d9A2yJTsPN/Iq/HFmBdth68eMTK9Bne4zhbJD212qFwZqp0dBfLc5E6A8ycBeoSRyUQkEqt9
	mNdB9CRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1Un-0000000FIzv-1e1K;
	Wed, 15 Jul 2026 15:26:01 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1Uk-0000000FIzC-3Ntm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 15:26:00 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cc6dd436c6so27426685ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 08:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784129158; x=1784733958; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2kgwyk0OObBT++oiW1zqAAqUnSr/tbzGEYYjYm7Tx6U=;
        b=NB01IJX3eEICUvTjDqgGpBcAss/Bqoqzj43WMwJV97slWDEBsd09GvibJuSpP449KV
         yWfGxG2BFjPFPgfgKzLEul/CPzayinR0AA2LDoGLBrhchCXWCTxlYJz8ff1QfVYFqwWr
         QNzFXRgbMWGn3dEW56Bi0nyhtSY9s6GvgL8o28urslSQkvjQxWRg+//EgqnlIGFc/sRr
         Xhx/gDp0vSUvpid12WYe4+lv23iGWj4eV8HkMabFr2Qw6weDyZ/u4eTflzTPnJBp6L0j
         Tt8HpuhWhzyPchYJclHUZmqJQauzaosqW+IWt6znRYcdOMyY8KG5NrAWja5Mm3hqhwqZ
         T6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784129158; x=1784733958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2kgwyk0OObBT++oiW1zqAAqUnSr/tbzGEYYjYm7Tx6U=;
        b=OAVcvXQInG+Xd8o36LIXTSvPikX7TcuggkFIfcpQzfBSIgUJg0Y0goAmgvpCk7cgqm
         w5W2LOiUiOJXakABrxvcZ/CL2f/VN7zNuOfxCxSCgmbpfe5xVrdNXoDJVQQspVJ0x6B9
         b+cJMRaVsRu5ShQFuYgxPqfHhUX21hWz/hwGiW6IBKJtSxCkSEez8VuUxVolCRokfGZF
         b07xpgMPc6XZtmlgUuRwG7zIVkIufVqAaM7ne0kIU1rmIiVYyUlrRhnq32CI7IHQHYXU
         6oJv5JuKIOy7Ztk8+wtdYFsRg8pV3UFO8QgYPGxXaROigXS1N6fHaLJHqZ6r5vfo4yaQ
         rccQ==
X-Forwarded-Encrypted: i=1; AHgh+RousM5oAe8ag2PSHecDlJbVUqEETTRuDRcAhZPscewr8IBlGFOry25MHVwPVczSwg1Tu/u3cIMaQU51P6ubmWzL@lists.infradead.org
X-Gm-Message-State: AOJu0YyAgI+wL4R7oSPQ1I1RnO91OG4TbGAnNEB4G+OxCLdAOR9CQChQ
	Qrkh/N3McECpoNPhDDqrhjciwIwy8Tg/sh/H8KD3rBr0fSJv6Clbj71bkTzTk1IEVuQw0O8LRFz
	KXpFl8cM=
X-Gm-Gg: AfdE7clTO/EiqJPFzaHknecpBE5uW9lvbdN2JYZjwLosFc51itWFVMejn++4YJHP8Fv
	CmqrFsJXPS8gZlsDpHdcy1mTdxkv5hAJ7Ya+5VmCUBe2AjFcMBg5sxR7oIPWMFkx56wh46ePrm+
	IBfE+iFF8Jj9t2tHSWuWtpMhjcFcyBJ91fi1YOv6llXOzXsRRz80cmi5DM7ZeZjSrGRBFPx9nmF
	7LNNHZV2lITA6lPUdXlSklt2EMXy839AhxJnhhPAReMqwNzsoS/XePbgSgX/ruCWnjp1TAuaWOr
	3h99IJ4aIHrdSbi2zsVJV5qRhRMDXAcvATYq06w8zd6XwOMHMjNkN4RNf1OuTeedsnN04n1FvrE
	PMYP5h7c2HoSp7ZZZQihHiAE8SBNqA3G/pxk//TY4nPMLlpel6g3daYLmNquxQUf3dFWH2ZI5jv
	w7JbiiCTqSLXe8FXI3
X-Received: by 2002:a17:902:f787:b0:2ce:d957:59c4 with SMTP id d9443c01a7336-2ced9575addmr115795235ad.6.1784129157763;
        Wed, 15 Jul 2026 08:25:57 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4f38:9a5e:fd18:7a9b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf10156d29sm4394455ad.30.2026.07.15.08.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:25:57 -0700 (PDT)
Date: Wed, 15 Jul 2026 09:25:53 -0600
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
Message-ID: <alemgbM2ktRLE9wT@p14s>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com>
 <alUdg9iTysXCFUa5@p14s>
 <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <alZlZvQQwq-g6VL3@p14s>
 <PAXPR04MB9185B1A3F16D82E8C0C76EE689F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185B1A3F16D82E8C0C76EE689F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_082558_867964_936B6304 
X-CRM114-Status: GOOD (  48.86  )
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

On Tue, Jul 14, 2026 at 06:43:30PM +0000, Shenwei Wang (OSS) wrote:
> 
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Tuesday, July 14, 2026 11:36 AM
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
> > On Tue, Jul 14, 2026 at 02:29:12PM +0000, Shenwei Wang (OSS) wrote:
> d
> > > > > +  - 3: Both edge trigger
> > > > > +  - 4: High level trigger
> > > > > +  - 8: Low level trigger
> > > >
> > > > I'm in agreement with cmd 3, 4, 5 and 6.
> > > >
> > >
> > > How about cmd 2?
> > 
> > Yes, I forgot cmd 2.
> > 
> > >
> > > > > +
> > > > > +**Reply:**
> > > > > +
> > > > > +.. code-block:: none
> > > > > +
> > > > > +   +------+--------+--------+
> > > > > +   | 0x00 |  0x01  |  0x02  |
> > > > > +   |   1  | status |    0   |
> > > > > +   +------+--------+--------+
> > > > > +
> > > > > +- **status**:
> > > > > +
> > > > > +  - 0: Ok
> > > > > +  - 1: Error
> > > > > +
> > > > > +SET_WAKEUP (Cmd=16)
> > > > > +~~~~~~~~~~~~~~~~~~~
> > > >
> > > > I already commented on messages that are not part of the virtio-gpio
> > > > specification.
> > > >
> > >
> > > I don't believe virtio-gpio needs a SET_WAKEUP command.
> > >
> > > In the RPMSG case, SET_WAKEUP is required because it performs an
> > > operation on the remote processor, so the remote side must be explicitly
> > notified.
> > 
> > What operations would that be?
> > 
> 
> The operation is enabling the line as a wakeup source. In practice, this involves configuring 
> hardware-specific wakeup settings (e.g., register bits) on the remote processor, so the remote 
> side must be explicitly notified through SET_WAKEUP.
>

As I said before, we are not enhancing the virtio-gpio specification.  If the
functionality is not part of the specification, it is not part of this protocol.
 
> 
> > >
> > > For virtio-gpio, however, everything is handled locally. The other
> > > side does not need to perform any action, so sending a SET_WAKEUP command
> > appears unnecessary.
> > 
> > What is "everything"?
> > 
> 
> I mean masking, unmasking, and marking the interrupt as a wakeup source. All of 
> these operations are handled on local processor.

There may be enough capability in your remote processor to do all that, but we
can't assume the same applies to all implementations.  rpmsg-gpio is not about
inventing a new protocol or delegating actions to the remote processor.  It is
about carrying virtio-gpio packets on top of RPMSG.  It needs to operate
_exactly_ the same way as virtio-gpio.

> 
> Shenwei
> 
> > >
> > >
> > > > > +
> > > > > +**Request:**
> > > > > +
> > > > > +.. code-block:: none
> > > > > +
> > > > > +   +------+------+------+------+------+------+------+------+
> > > > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > > > +   |      1      |    line     |           value           |
> > > > > +   +------+------+------+------+------+------+------+------+
> > > > > +
> > > > > +- **value**: Wakeup enable.
> > > > > +
> > > > > +  The remote system should always aim to stay in a
> > > > > + power-efficient state by  shutting down or clock-gating the GPIO
> > > > > + blocks that aren't in use. Since  the remoteproc driver is
> > > > > + responsible for managing the power states of the  remote
> > > > > + firmware, the GPIO driver does not require to know the firmware's
> > running states.
> > > > > +
> > > > > +  When the wakeup bit is set, the remote firmware should
> > > > > + configure the line  as a wakeup source. The firmware should send
> > > > > + the notification message to  Linux after it is woken from the GPIO line.
> > > > > +
> > > > > +  - 0: Disable wakeup from GPIO
> > > > > +  - 1: Enable wakeup from GPIO
> > > > > +
> > > > > +**Reply:**
> > > > > +
> > > > > +.. code-block:: none
> > > > > +
> > > > > +   +------+--------+--------+
> > > > > +   | 0x00 |  0x01  |  0x02  |
> > > > > +   |   1  | status |    0   |
> > > > > +   +------+--------+--------+
> > > > > +
> > > > > +- **status**:
> > > > > +
> > > > > +  - 0: Ok
> > > > > +  - 1: Error
> > > > > +
> > > > > +Notification Message
> > > > > +--------------------
> > > >
> > > > "Interrupt Messages"
> > > >
> > > > > +
> > > > > +Notifications are sent by the remote core and they have
> > > > > +**Type=2 (GPIO_RPMSG_NOTIFY)**:
> > > > > +
> > > > > +When a GPIO line asserts an interrupt on the remote processor,
> > > > > +the firmware should immediately mask the corresponding interrupt
> > > > > +source and send a notification message to the Linux. Upon
> > > > > +completion of the interrupt handling on the Linux side, the
> > > > > +driver should issue a command **SET_IRQ_TYPE** to the firmware to
> > unmask the interrupt.
> > > > > +
> > > > > +A Notification message can arrive between a SEND and its REPLY
> > > > > +message, and the driver is expected to handle this scenario.
> > > > > +
> > > > > +.. code-block:: none
> > > > > +
> > > > > +   +------+------+--------+
> > > > > +   | 0x00 | 0x01 |  0x02  |
> > > > > +   |   2  | line | trigger|
> > > > > +   +------+------+--------+
> > > >
> > > > 2 things here:
> > > >
> > > > 1) You did not include messages that mask and unmask interrupts at
> > > > the driver side.
> > >
> > > Interrupt masking and unmasking are handled entirely on the local processor.
> > >
> > > When an interrupt occurs, the remote system masks the interrupt and
> > > then sends a notification to Linux. After Linux processes the
> > > notification, it sends a SET_IRQ_TYPE message back to the remote system,
> > which then unmasks the interrupt.
> > 
> > This is the kind of information that should be part of this documentation.
> > 
> > >
> > > Thanks,
> > > Shenwei
> > >
> > > >
> > > > 2) We are carrying virtio-gpio messages on top of RPMSG and as such,
> > > > this whole protocol should be about thar:
> > > >
> > > > +------+------+--------+--------
> > > > | 0x00 |       payload         |
> > > > |  Q   |                       |
> > > > +------+------+--------+--------
> > > >
> > > > Q = 0 requestq
> > > > Q = 1 eventq
> > > >
> > > > The "payload" part is simply the format of the messages as found in
> > > > the virtio- gpio specification.  From there, the only thing left to
> > > > mention is which messages are not supported, i.e get line names.
> > > >
> > > > > +
> > > > > +- **line**: The GPIO line (pin) index of the port.
> > > > > +
> > > > > +- **trigger**: Optional parameter to indicate the trigger event type.
> > > >
> > > > Not part of the spec - remove.
> > > >
> > > > Given the refactoring work that is still needed, I will not look at
> > > > the implementation.
> > > >
> > > > Thanks,
> > > > Mathieu
> > > >
> > > > > +
> > > > > diff --git a/Documentation/driver-api/gpio/index.rst
> > > > > b/Documentation/driver-api/gpio/index.rst
> > > > > index bee58f709b9a..e5eb1f82f01f 100644
> > > > > --- a/Documentation/driver-api/gpio/index.rst
> > > > > +++ b/Documentation/driver-api/gpio/index.rst
> > > > > @@ -16,6 +16,7 @@ Contents:
> > > > >     drivers-on-gpio
> > > > >     bt8xxgpio
> > > > >     pca953x
> > > > > +   gpio-rpmsg
> > > > >
> > > > >  Core
> > > > >  ====
> > > > > --
> > > > > 2.43.0
> > > > >

