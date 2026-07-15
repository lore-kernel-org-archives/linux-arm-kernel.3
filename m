Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F131C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 17:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1fLH5vkVlaT9TAQEnaHfQcEDTexVsSO83pCVpu+qHI=; b=hwU3uxvzI6VHZh5z9sUv6wkvG/
	M+MYEKpppkw9A9LXoDT1uZ6GRvNQFNDPPtit9zwIyXxXMpgG2/NehZKOBmJR3WNl5TH6FKfMiUi8l
	lD8cSxTL2iJKKYvNevmnSR96jYKd3p3uGmV6DIfdOss+2SeJ3QPaanOuuaBY5PUww27Cn0bVeWZyJ
	A0pRKN6gyIAmma9G/UAHx2ayTgVulvAPvO7zt5SKeg66/UY+790+bnEg8aReJUf7r/R/qBAMwPN9q
	nFhfeGMQJQ7+l/nDU/vs5L5pssIGYIWHKwiB7X2Ph+exwPAZXHfmT5DjHkm2wQVg0FI81d6yDbldf
	84HOQcqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3pk-0000000FbQ6-2sbC;
	Wed, 15 Jul 2026 17:55:48 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3ph-0000000FbPg-48Kd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 17:55:47 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-69c5eb6dfd3so7531307a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 10:55:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784138143; cv=none;
        d=google.com; s=arc-20260327;
        b=MtyMfyyG3uu6zcHjxom8vm+0uzjpOfsliNMlg1eodjz6TkAeUsn5TdXdjJpeLeso6W
         p6cWtNuGSNVKSpU4A1CHaM7bmcTdpfb/Mdu6jQLbHeeXjMNqfy6+dVeXMHmXq+g6+xBY
         Xp8bve+8+vdel+yRr7HQ290LBJj2tHBw0ZOHdHvqzf7stsrrM3YMZ2173Kq+dwf4P2FW
         TcgPhm1JVTtq6VFLemF9316tFboyHynPs7HxD91aBe/IbRz3Fz0X6zlbHqK5+y38qxcd
         mF30jTQMw6JpD7sHoPu3eTtCKDHXUfTaA5sWxcUf0zcmf97zxBwztZY2ywPDPVklvhuG
         RRbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B1fLH5vkVlaT9TAQEnaHfQcEDTexVsSO83pCVpu+qHI=;
        fh=A3Um3jGc25kzPmjqeKIhcZUDpd5APbGaXXGrCDPOpAc=;
        b=M9ta3uDLhZeG0FVXhCqJNWVaPfQxg4d1VGA9+m4lyZQoCmM5saePfmFO+V2L8Y8gwL
         lc/T7P3X9M78ot+9jwbpn4bjvZWeVgvvpcmKw6sKmRL8I+HEZX5B9alrSTp6GB/n6OxE
         NRYsUrF1JJLDRqml9QejQOkbstEHafTkXEL/GLOeFNu9Tf7sObvf/0VKfnB3vOa9/i/0
         jx2MriDewjFyR3eDNNsUYZJ4B/y9VEhu4jxWYbpBtIGIGzRJPRhEzTlx3l2Pm63EpAS7
         dmo1e89hhjQ+JAOZVqdBkz4kfaxF5l8omO+bG5vZUAm4P5RvN8hekoHUmE4+bkgWhyiW
         YsCQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784138143; x=1784742943; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1fLH5vkVlaT9TAQEnaHfQcEDTexVsSO83pCVpu+qHI=;
        b=k9UrxhEs6mxxSwQk/lTQNs1jvnC+auk43bwhiHP6/9WODW7Dr018pYybV6tHuRuvn6
         DP+WT+RzURVMjJXdhfObVOvhSDkzSt8gaGxw7UDnrzN3cWSFXqRYycN+TmCG9F/oNlsj
         zyQmLOP1IlJ7dPaI4N/Q+S4o5fHbwfKEmRvnDH7jt/vNnImn+kkk5btVD+1IV+el3wii
         qn9CwaNlfqW4KotmLYEeZE8pnWmeAuQ/soVvhr5CPbJGG31m68jUFh1ATK8KRHUGqbQo
         Oeej1P0eifEMjpGyAlR2CmIUGla78XJxkB0QcF0Ag9M+x0KvcOtF375WFjjwmM0BpYuY
         cw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784138143; x=1784742943;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B1fLH5vkVlaT9TAQEnaHfQcEDTexVsSO83pCVpu+qHI=;
        b=OYz1mFBSE+jjlqQRS9HindOUeP/z4ZrZFIwiladF1tQXhWXovcRH5d5Uj0csdTsVMp
         sL0V2wsq6oK/NTUYn3C+SijKpXJWacADcvGgN7marAq3YgXk8VZSdroefifAeFY4udy/
         aHo9exFAZuX4xqsFmG86Fec39KAqd399pKZ8lnM4lLrz8HMgN1goK6u/r/HTLvrTqi94
         Jas285XhBnNeGKEnf3opkVhrOUtGt3U97z+4vGO54qtqnqyqrX9udBV0sFzdJxGaZ5vG
         uzlRSgz156h0GUWk8Xg2n9FkRVMf7ka6ghi/eX1+xIsCimgLC5D9znuVdN5MMdCiMBNx
         J/pA==
X-Forwarded-Encrypted: i=1; AHgh+RoE+LJmacFrQzS8NCeibNeIPgvycZgnXyC2lHtNhE8yqkPydNnYva62VmUlmgBnCtwDTFMXjAk+wRt8etIx2EIc@lists.infradead.org
X-Gm-Message-State: AOJu0YzPzbpL2hjQUe9CGTjCCGdDtcUeJVrP+iADeKWaCRuBOnH8S1+4
	sHhaeVan/Chji8nCG54NwcWLcEP8WS3WmKez+E81ZSQ72R9b95M/rwsTqb8mRUYDLTLEeZuZOc+
	AvakBSarqB5KjXXtl1sIIOVN6Da+KesKt3/vSAJ3hQw==
X-Gm-Gg: AfdE7cknYLmAgKdV0XQ+gDLPD5GZXtNSUI4k3e8nXLSEbomgA5IjHIyjAo86kUJ5TEe
	OMbP4cm3usUGVmmBRiTRGH5eKU7C6iN0mz0t9ASeGs32OKi2A+ODLOrMOKk7wsoj8x7ggLdU01I
	l2I0vE94f7yVDSCFZqKd7+oKdPFykx3jybhvyZPjJyqjgIiB3do90nG0YNfCTPIGGrXsUmoWgFM
	DLARhaPKgEEH8M1vtxamqcx1PwkOTMcNBx7PUf66Lb0mCmqy3iKispxxhgQM9KYoDLkCPjxdYFI
	2EIJ0yCf2jriEhdhPPVJS7zZ+bVncxM=
X-Received: by 2002:a05:6402:1588:b0:69c:7567:cf5c with SMTP id
 4fb4d7f45d1cf-69cd6ddfb91mr4781134a12.41.1784138143408; Wed, 15 Jul 2026
 10:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com> <alUdg9iTysXCFUa5@p14s>
 <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <alZlZvQQwq-g6VL3@p14s> <PAXPR04MB9185B1A3F16D82E8C0C76EE689F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <alemgbM2ktRLE9wT@p14s> <PAXPR04MB9185DC31980327326D289C4C89F82@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185DC31980327326D289C4C89F82@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 15 Jul 2026 11:55:32 -0600
X-Gm-Features: AUfX_mzC-pSYEjUJ9BYRTa4GlO7TcNO2B0DY7O1_KieZEYL7x6Ya_ZTaPmF0Y3w
Message-ID: <CANLsYkww_2d_eFGCTrTvoSavdkfOh41joKHypDnW-z0XUonR1Q@mail.gmail.com>
Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, "b-padhi@ti.com" <b-padhi@ti.com>, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_105546_114269_4A618892 
X-CRM114-Status: GOOD (  49.30  )
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

On Wed, 15 Jul 2026 at 09:55, Shenwei Wang (OSS)
<shenwei.wang@oss.nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Wednesday, July 15, 2026 10:26 AM
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
> > On Tue, Jul 14, 2026 at 06:43:30PM +0000, Shenwei Wang (OSS) wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > Sent: Tuesday, July 14, 2026 11:36 AM
> > > > To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> > > > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski
> > > > <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Rob Herring
> > > > <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor
> > > > Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > > > <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > > > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>;
> > > > linux- gpio@vger.kernel.org; linux-doc@vger.kernel.org;
> > > > linux-kernel@vger.kernel.org; Pengutronix Kernel Team
> > > > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Shenwei
> > > > Wang <shenwei.wang@nxp.com>; Peng Fan <peng.fan@nxp.com>;
> > > > devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> > > > imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> > > > dl-linux-imx <linux-imx@nxp.com>; Arnaud POULIQUEN
> > > > <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> > > > <andrew@lunn.ch>
> > > > Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio
> > > > driver over rpmsg bus
> > > >
> > > > On Tue, Jul 14, 2026 at 02:29:12PM +0000, Shenwei Wang (OSS) wrote:
> > > d
> > > > > > > +  - 3: Both edge trigger
> > > > > > > +  - 4: High level trigger
> > > > > > > +  - 8: Low level trigger
> > > > > >
> > > > > > I'm in agreement with cmd 3, 4, 5 and 6.
> > > > > >
> > > > >
> > > > > How about cmd 2?
> > > >
> > > > Yes, I forgot cmd 2.
> > > >
> > > > >
> > > > > > > +
> > > > > > > +**Reply:**
> > > > > > > +
> > > > > > > +.. code-block:: none
> > > > > > > +
> > > > > > > +   +------+--------+--------+
> > > > > > > +   | 0x00 |  0x01  |  0x02  |
> > > > > > > +   |   1  | status |    0   |
> > > > > > > +   +------+--------+--------+
> > > > > > > +
> > > > > > > +- **status**:
> > > > > > > +
> > > > > > > +  - 0: Ok
> > > > > > > +  - 1: Error
> > > > > > > +
> > > > > > > +SET_WAKEUP (Cmd=16)
> > > > > > > +~~~~~~~~~~~~~~~~~~~
> > > > > >
> > > > > > I already commented on messages that are not part of the
> > > > > > virtio-gpio specification.
> > > > > >
> > > > >
> > > > > I don't believe virtio-gpio needs a SET_WAKEUP command.
> > > > >
> > > > > In the RPMSG case, SET_WAKEUP is required because it performs an
> > > > > operation on the remote processor, so the remote side must be
> > > > > explicitly
> > > > notified.
> > > >
> > > > What operations would that be?
> > > >
> > >
> > > The operation is enabling the line as a wakeup source. In practice,
> > > this involves configuring hardware-specific wakeup settings (e.g.,
> > > register bits) on the remote processor, so the remote side must be explicitly
> > notified through SET_WAKEUP.
> > >
> >
> > As I said before, we are not enhancing the virtio-gpio specification.  If the
> > functionality is not part of the specification, it is not part of this protocol.
> >
>
> It's about the functionality, not the specification.
>

No, it's about the specification.

> Without SET_WAKEUP, a virtio-GPIO line can still be used as a wakeup source, but
> an RPMSG implementation cannot because the remote processor is never notified
> to configure its wakeup settings.
>
> So both implementations may follow the same virtio-gpio specification, but they do
> not provide the same wakeup functionality.
>

No.  The kernel treats rpmsg-gpio the same way as virtio-gpio - they
need to provide exactly the same functionality.

> Anyway, if you want to drop the function, the command can be removed.
>
> Shenwei
>
> > >
> > > > >
> > > > > For virtio-gpio, however, everything is handled locally. The other
> > > > > side does not need to perform any action, so sending a SET_WAKEUP
> > > > > command
> > > > appears unnecessary.
> > > >
> > > > What is "everything"?
> > > >
> > >
> > > I mean masking, unmasking, and marking the interrupt as a wakeup
> > > source. All of these operations are handled on local processor.
> >
> > There may be enough capability in your remote processor to do all that, but we
> > can't assume the same applies to all implementations.  rpmsg-gpio is not about
> > inventing a new protocol or delegating actions to the remote processor.  It is
> > about carrying virtio-gpio packets on top of RPMSG.  It needs to operate
> > _exactly_ the same way as virtio-gpio.
> >
> > >
> > > Shenwei
> > >
> > > > >
> > > > >
> > > > > > > +
> > > > > > > +**Request:**
> > > > > > > +
> > > > > > > +.. code-block:: none
> > > > > > > +
> > > > > > > +   +------+------+------+------+------+------+------+------+
> > > > > > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > > > > > +   |      1      |    line     |           value           |
> > > > > > > +   +------+------+------+------+------+------+------+------+
> > > > > > > +
> > > > > > > +- **value**: Wakeup enable.
> > > > > > > +
> > > > > > > +  The remote system should always aim to stay in a
> > > > > > > + power-efficient state by  shutting down or clock-gating the
> > > > > > > + GPIO blocks that aren't in use. Since  the remoteproc driver
> > > > > > > + is responsible for managing the power states of the  remote
> > > > > > > + firmware, the GPIO driver does not require to know the
> > > > > > > + firmware's
> > > > running states.
> > > > > > > +
> > > > > > > +  When the wakeup bit is set, the remote firmware should
> > > > > > > + configure the line  as a wakeup source. The firmware should
> > > > > > > + send the notification message to  Linux after it is woken from the GPIO
> > line.
> > > > > > > +
> > > > > > > +  - 0: Disable wakeup from GPIO
> > > > > > > +  - 1: Enable wakeup from GPIO
> > > > > > > +
> > > > > > > +**Reply:**
> > > > > > > +
> > > > > > > +.. code-block:: none
> > > > > > > +
> > > > > > > +   +------+--------+--------+
> > > > > > > +   | 0x00 |  0x01  |  0x02  |
> > > > > > > +   |   1  | status |    0   |
> > > > > > > +   +------+--------+--------+
> > > > > > > +
> > > > > > > +- **status**:
> > > > > > > +
> > > > > > > +  - 0: Ok
> > > > > > > +  - 1: Error
> > > > > > > +
> > > > > > > +Notification Message
> > > > > > > +--------------------
> > > > > >
> > > > > > "Interrupt Messages"
> > > > > >
> > > > > > > +
> > > > > > > +Notifications are sent by the remote core and they have
> > > > > > > +**Type=2 (GPIO_RPMSG_NOTIFY)**:
> > > > > > > +
> > > > > > > +When a GPIO line asserts an interrupt on the remote
> > > > > > > +processor, the firmware should immediately mask the
> > > > > > > +corresponding interrupt source and send a notification
> > > > > > > +message to the Linux. Upon completion of the interrupt
> > > > > > > +handling on the Linux side, the driver should issue a command
> > > > > > > +**SET_IRQ_TYPE** to the firmware to
> > > > unmask the interrupt.
> > > > > > > +
> > > > > > > +A Notification message can arrive between a SEND and its
> > > > > > > +REPLY message, and the driver is expected to handle this scenario.
> > > > > > > +
> > > > > > > +.. code-block:: none
> > > > > > > +
> > > > > > > +   +------+------+--------+
> > > > > > > +   | 0x00 | 0x01 |  0x02  |
> > > > > > > +   |   2  | line | trigger|
> > > > > > > +   +------+------+--------+
> > > > > >
> > > > > > 2 things here:
> > > > > >
> > > > > > 1) You did not include messages that mask and unmask interrupts
> > > > > > at the driver side.
> > > > >
> > > > > Interrupt masking and unmasking are handled entirely on the local
> > processor.
> > > > >
> > > > > When an interrupt occurs, the remote system masks the interrupt
> > > > > and then sends a notification to Linux. After Linux processes the
> > > > > notification, it sends a SET_IRQ_TYPE message back to the remote
> > > > > system,
> > > > which then unmasks the interrupt.
> > > >
> > > > This is the kind of information that should be part of this documentation.
> > > >
> > > > >
> > > > > Thanks,
> > > > > Shenwei
> > > > >
> > > > > >
> > > > > > 2) We are carrying virtio-gpio messages on top of RPMSG and as
> > > > > > such, this whole protocol should be about thar:
> > > > > >
> > > > > > +------+------+--------+--------
> > > > > > | 0x00 |       payload         |
> > > > > > |  Q   |                       |
> > > > > > +------+------+--------+--------
> > > > > >
> > > > > > Q = 0 requestq
> > > > > > Q = 1 eventq
> > > > > >
> > > > > > The "payload" part is simply the format of the messages as found
> > > > > > in the virtio- gpio specification.  From there, the only thing
> > > > > > left to mention is which messages are not supported, i.e get line names.
> > > > > >
> > > > > > > +
> > > > > > > +- **line**: The GPIO line (pin) index of the port.
> > > > > > > +
> > > > > > > +- **trigger**: Optional parameter to indicate the trigger event type.
> > > > > >
> > > > > > Not part of the spec - remove.
> > > > > >
> > > > > > Given the refactoring work that is still needed, I will not look
> > > > > > at the implementation.
> > > > > >
> > > > > > Thanks,
> > > > > > Mathieu
> > > > > >
> > > > > > > +
> > > > > > > diff --git a/Documentation/driver-api/gpio/index.rst
> > > > > > > b/Documentation/driver-api/gpio/index.rst
> > > > > > > index bee58f709b9a..e5eb1f82f01f 100644
> > > > > > > --- a/Documentation/driver-api/gpio/index.rst
> > > > > > > +++ b/Documentation/driver-api/gpio/index.rst
> > > > > > > @@ -16,6 +16,7 @@ Contents:
> > > > > > >     drivers-on-gpio
> > > > > > >     bt8xxgpio
> > > > > > >     pca953x
> > > > > > > +   gpio-rpmsg
> > > > > > >
> > > > > > >  Core
> > > > > > >  ====
> > > > > > > --
> > > > > > > 2.43.0
> > > > > > >

