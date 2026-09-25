Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5787CC98325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDj9ZLoDuXLeZ+ESPsWzwz0ze3YEaXzdQ65mT9PQEa0=; b=Slx4thT9o90nZKZwW/ndwmIUBX
	Bj59q9HYFaOakJJcXagKbOuVmWBVyv8TWhM829NJLXqPlZcVozLOvr950Nf2o2iVGAAuM96rHPXZU
	Y3vV9EfTqXxiwGGJ+Ko65PORH8KsfdkfcuMHx7ULA/LqiMgFiIhdZ6HLtGW3LwgOiBszDpcPjkM4d
	a0SvWKIuwzhVxsNilQ1sAq4Q4j5aTcONdmQT40A37kGdZDun/ReQTGP2t69uo6wZ2WOjtz0hKPZly
	Yo6mVyDaxj2JFimyY4LiuE9UnPo1c6LApIjuTcBlqp3+Eg5bZhx1Jp2SkM/BRGHzEKtedB/56Ldis
	1tZbE4jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8J2-0000000DsHk-0XBy;
	Fri, 25 Sep 2026 15:57:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8J0-0000000DsHc-3N89
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Sep 2026 15:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JDj9ZLoDuXLeZ+ESPsWzwz0ze3YEaXzdQ65mT9PQEa0=; b=Rhx1+hIzj8uqveXl4TqaY0yGDY
	523gR2M0dQKzUiQO6LOxrlQWmK9S70aabmrvFexiSUrKP44nMqRKEZAfzbhg0OftTtCVFSib3+44P
	nVPXiOLkQbswzCYrthCJf7GPzzsoZZzPGPWKI3ZNYogT5TGvrhDW1OPJELCyQtZzfZhz9tfR/d9Lf
	zQNmLllUHXzufjOcJwePQwiFXFccpwowgliP4CrRoG2XLTCpfiI0Un7uH4cAHTi+E7yGqGJDB0x5A
	Yre6epQxSXdwfRHfJLlciI2D8aIwrdgqFEJZbvcF8sXZFO7StX7rVbU0FmXQ+T8h5ppEutUQPSYwF
	q/b2uzCg==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA8Ix-0000000H67a-2zUf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 15:57:45 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843cedd129so617234f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 08:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790351861; x=1790956661; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JDj9ZLoDuXLeZ+ESPsWzwz0ze3YEaXzdQ65mT9PQEa0=;
        b=Q1/Oe3PPw+r3t9OiRlovLMKBd4TE3sTh4JR7Lx/XYPyP/nGuFiALrm+FQJ17lwgdfF
         b01IXmVS1iIPePPkCOlmqd8rb+mbfqeYqICoT5SUvLHS3JX81Su6kKBw3Em2/PQ5Cfpj
         8cxt2Y68oSVDQsARcgGum3iKSrYYsHVWNh9eGHXzrPDkgYGNw0U9ZY4pHaI2kiN4vGb8
         wNoeFczN3JJQOKOKg1qrt4pFEYiL9wPumS2ul0u6lyDhvsmpp0OOlqLTl/I4Jq68slUV
         zKd7wBxvdFFdAXAdJKPiDwiUxbpn10itTL6tP70Aw8fPeL8H7kn+3BefY5OTIvKXb6k9
         /cKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351861; x=1790956661;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDj9ZLoDuXLeZ+ESPsWzwz0ze3YEaXzdQ65mT9PQEa0=;
        b=tIntte+IBgm+5cYjnMbnCLlAgdFy7cQNdH7tzMEji6qxmRqY/ZfNVTGSwjgSd1nyUl
         GxX7st5LTrkSUaS98I4KxjZEMXL4rR8u/0pNg1xeGGLwIgf+SuvL294XBYyYpI7WmPqS
         E2iHVr+FJtFsBTj9ftQyL/LnzOHQMPjcMtKToZ/7i4rtEtUoRjtTeFfl50yOiCj3bmB7
         wKxD+TPEKZ0lCQ9MOQQ6Fw/bzA9+LwoDzV8OlapzDjX7JJu/qC7iDhgpZU456ie38WBn
         vxqUMLRWGaJSuoT8qXwB+oxvVqmbg0go/LHNAIY7BtiAsHoUuwq0M4fREkOI/vBj65Kc
         DrXA==
X-Forwarded-Encrypted: i=1; AKwUvBycNbbZGtLQgYw57yR3IXE4NfNnWV5uFI5fTtVWyb9DKq5DVBEsiLsWltXmn6yFUcd5umUygGy+u+oB0ZIzy5KO@lists.infradead.org
X-Gm-Message-State: AFuF++meOV8A+/lX9ClkxLBKFbdE1kl4qDiYeu6mGWBb+IyhaZplI+yU
	Wjxyz4o8ksU91Zr2uRFjJysBgK8aToN/Z0rjHrsX5kyn/Zl+rV2JPsom
X-Gm-Gg: AYBFou2l6iEsdnskbV8HyoH/f4uRWUvULW38tqeuHXgxDXjQRgwmtOP/pvbD/QtVNoT
	kvzZEvDsqvFmaP3V/JKyNpwlYCK9H+0g94Jkas52vJnxIBQ+vB1FxEEcVPKukNKjLVpWf/0HcHs
	R+XTNoYuQN9897s5mEUc0PfihaxMpG4X1CawlgT2bdgOsiwYyICq737Vxp4XLpEsOjFVGBb7CKD
	QsunZipBxPEfKJk920IrVWHfeUnyCKfh0EcbIjTQLEV5ugOTnJI9whh8ipmrfhfLH1ZRWmffbEs
	NGYjj5HqPFr8tZxEwTHuwyb8IVSxgqbQifqAUbgQF9c5j8CiLfUX87j3Yz4JDbnHlF5/uDXysW9
	ATDb4+SYnXArMwbgXhLbLDZwHameVxKDZX/EsswIk1xe301qxToxtewG/fhouUcNH49PSo8jiam
	V1pp/FBLcvUElTSsBUixfUwDP+rNNI5ugjC6zigR2w/i3T0wnNaqESS9KKA9SKbdhVwX+MBWZk6
	dI6z95/kuQbKTr+GDp3pviCswhZQ5k81e4T3IJ15FvzDNVFHyHEXNbpMPjPltPlZ6yGP1QiWBWK
	AXKWULQPERuHbleOwtanzNtrj5mZ
X-Received: by 2002:a05:6000:2509:b0:487:27f6:a4d7 with SMTP id ffacd0b85a97d-488716b0361mr12527019f8f.39.1790351861320;
        Fri, 25 Sep 2026 08:57:41 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3627a8sm8964225f8f.23.2026.09.25.08.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:57:40 -0700 (PDT)
Date: Fri, 25 Sep 2026 17:57:38 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v1 04/11] ARM: dts: imx6ul: Add Variscite audio codec
 files
Message-ID: <araZ8pJGmDVXMjvE@Lord-Beerus.station>
References: <cover.1790344389.git.stefano.r@variscite.com>
 <ef56f98137eb9d1e0af3aa1b801186d829dba521.1790344389.git.stefano.r@variscite.com>
 <araMJFirhP86Dcb6@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <araMJFirhP86Dcb6@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_165743_823316_F0E8E139 
X-CRM114-Status: GOOD (  16.77  )
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

On Fri, Sep 25, 2026 at 09:58:44AM -0500, Frank Li wrote:
> On Fri, Sep 25, 2026 at 04:02:21PM +0200, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > Add separate DTSI files for the WM8904 and WM8731 audio options on
> > VAR-SOM-6UL and DART-6UL modules.
> >
> > Put each codec node, the SAI2 setup and its pinctrl in the selected
> > audio DTSI. This makes the WM8904 option explicit instead of placing
> > it in the shared module base.
> >
> > Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> > ---
> >  .../imx/imx6ul-imx6ull-var-dart-wm8731.dtsi   | 71 +++++++++++++++
> >  .../imx/imx6ul-imx6ull-var-dart-wm8904.dtsi   | 88 +++++++++++++++++++
> >  .../imx/imx6ul-imx6ull-var-som-wm8731.dtsi    | 71 +++++++++++++++
> >  .../imx/imx6ul-imx6ull-var-som-wm8904.dtsi    | 85 ++++++++++++++++++
> 
> what's difference between imx6ul-imx6ull-var-som-wm8904.dtsi and
> imx6ul-imx6ull-var-dart-wm8904.dtsi?
> 
> Frank
> 
Hi Frank!
Thank you for taking the time to review this huge patch.

The difference is in simple-audio-card,routing:
on DART-6UL, the microphone jack is routed to IN2L, IN2R and MICBIAS;
those routes are absent on VAR-SOM-6UL.

Best Regards,
Stefano

