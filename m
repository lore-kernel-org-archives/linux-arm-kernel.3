Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45499C98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 08:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKB7jX/87a5ucU2dpPAfqks2hCkBhkpECERSJJpQMwI=; b=BSxIYqlgMnQjqM9RAQqVDCVoT8
	u7iLL+Q9Heksb73Huqi0JqaJIMUbTbsGGa77V7qwT1WvVL3ZuU8T71b26Lhs1j8uobkkRfk7exs0k
	tpACdWeAAk9EcmzoEN8EGtN4QI1WDm+VxC3yZw5UM174Njmouo9jrh9soQ0POuhOGjMJ9qI7TDjbt
	jdQuTb36obpqSdjl+gV7aa5WrSatSNdsGe60vnkuqdwrywYFvH4Sjgp+vTO0GjKNSgVa9QcIWX0Jd
	jSeoz1KO97WQ1B6p41cjiedLepiomkP1GmKGRFJvdF4XSm6PT2YmEiXDpSjFA64Tiph36k6PC9Oi/
	zYgEZKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANxq-0000000FAY8-1qck;
	Sat, 26 Sep 2026 08:40:58 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANxn-0000000FAXJ-38WF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 08:40:57 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843cedd129so879812f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 01:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790412053; x=1791016853; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GKB7jX/87a5ucU2dpPAfqks2hCkBhkpECERSJJpQMwI=;
        b=TU2hK7wjB+D71wb9QxsLW9q49B0zD+YPHWuul15NBE+4fOgPCSmbqy3d30uh6zRXQI
         DuMNoHaw6UR6vpuP0kUTpvsm0+1QUzwEHfzc8xvhFyoCW6cmAHg9UGswayag33A03j/7
         fkkBiBSG6AUcZAC6h9s9g2yjQHoybBXlVnV0xciUoKfnPYtFIvywsnaY8+gnn2mfPdnP
         dV1u8999ZbEeYke+arv23yoRBNW2PZXrJQ1CdVjfTsB0m2MDm10npwIXM55T8UUHS1fH
         5I9twMcgcWZcziGE7WozTLyD3L3mOQsN9ty8AoDx2SZGzayJuUVn3kGxi6RO5reZOgeX
         cMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790412053; x=1791016853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKB7jX/87a5ucU2dpPAfqks2hCkBhkpECERSJJpQMwI=;
        b=ZvvkHOiD/bqiJH1KyuW0eB2NgfOkMMgy2zECO+589Lq3pnat/OxPi+h11jT9a9uGlL
         gGb1itd+xwh/fIq1LXbMUBGLyFmFscI+pgPvPtKYR1tmtx74SwkM8CereE7MOo9+zoQk
         /3tOmL3AWGG3kZgxveV28KAb91WVOti+kKnn16NtxS4ZdmmCzp05SNzyKw1Zh2rXQAQn
         ZukscGJC5BcJArFOKuMYp1vsa7D/6u5RHPU2cQ1rjDFv2KO+w9Acl5WBxUhAIdl940uf
         aT5nB7lkCOa7DKuEQY9iHPgCaI5AOISdJ9c1ssIt9aeP54vuSxjwM8Wzyao9+qfikn4y
         LJMA==
X-Forwarded-Encrypted: i=1; AKwUvBzsK+C417UlmqyeuU7knMoNH0J5G5i0lk9LVv0NdrPyO0BjdPlX/+Nk0sxUhdog8E40ZGjtkVEjkdUTceFLJBn+@lists.infradead.org
X-Gm-Message-State: AFq9FYJT4siWur/gAAkOuh6k8T3uGa6svbNaeyjz1T9g03cZYQYqxG1b
	XtZlyGsaMjS7n3imcDNSxza0kDwHiaKEqi0+JzqGoQ4q5QEox6pSjEiW
X-Gm-Gg: AYBFou3LN0rdNCn6jb/GMqGyNW/5AwX/lhCn34ql89U8W4YBuWVvaHxxZe+F5qf0pxP
	82QJY6pQGzhsdZjRlHYb3lBBMSJ6OYY+UXjov+/fGL8FY1/C8pVoqVFmY5MphLWYAQ5JXFUdI6/
	2nMt5A3EjM1AAsNnw32R6W04mkuyQLFvOn4T1hn0pZLgHIJeTHAhkq69vsO8+KVQUhZZJemzgJW
	h+xYaCheWUxNa7HWVDfeLgJS5JuNpqiBjj4E3AAJjnxjg27xvmPyh0Gu8u4RlOyTZ+R31pk88fD
	CwggYZ7t+aEO8L7Eh7UJzF7jFI+7D3F6dbVe107amlTYauFRitOEgZQ18DT2zSW3HoXDXy6ANOK
	lylMvjOEHdCH6Dmns2LuBn4DjBE7NImIyHECeRLjsKzNRpvgvNFfahU3hOLMyMHTk6BVi199/LJ
	VAx4K5l4thQfO2uyFrF+E/2fLKUduNXKzxBtwqHogCy3vYA8uLLNA0tahWYMzhV2dV3tbhMLpjO
	m0ahfStAN73LEzOC4TCsrXksJWj+/3MxjveSoOtR7yLL3SAM4GXXdI6zXDnix+eJX+KM03Pmmll
	+gCT1bpTFA5Lk3Ebt0JE0FigmPX5
X-Received: by 2002:a05:6000:40e1:b0:487:62d:37d9 with SMTP id ffacd0b85a97d-488716a5e3amr14226748f8f.27.1790412053273;
        Sat, 26 Sep 2026 01:40:53 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349a0esm18313534f8f.10.2026.09.26.01.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 01:40:52 -0700 (PDT)
Date: Sat, 26 Sep 2026 10:40:50 +0200
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
Message-ID: <areFEuHcyziU2xXx@Lord-Beerus.station>
References: <cover.1790344389.git.stefano.r@variscite.com>
 <ef56f98137eb9d1e0af3aa1b801186d829dba521.1790344389.git.stefano.r@variscite.com>
 <araMJFirhP86Dcb6@SMW015318>
 <araZ8pJGmDVXMjvE@Lord-Beerus.station>
 <arakXE94ZONxduMU@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arakXE94ZONxduMU@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_014055_804696_64023CFF 
X-CRM114-Status: GOOD (  21.41  )
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

On Fri, Sep 25, 2026 at 11:42:04AM -0500, Frank Li wrote:
> On Fri, Sep 25, 2026 at 05:57:38PM +0200, Stefano Radaelli wrote:
> > On Fri, Sep 25, 2026 at 09:58:44AM -0500, Frank Li wrote:
> > > On Fri, Sep 25, 2026 at 04:02:21PM +0200, Stefano Radaelli wrote:
> > > > From: Stefano Radaelli <stefano.r@variscite.com>
> > > >
> > > > Add separate DTSI files for the WM8904 and WM8731 audio options on
> > > > VAR-SOM-6UL and DART-6UL modules.
> > > >
> > > > Put each codec node, the SAI2 setup and its pinctrl in the selected
> > > > audio DTSI. This makes the WM8904 option explicit instead of placing
> > > > it in the shared module base.
> > > >
> > > > Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> > > > ---
> > > >  .../imx/imx6ul-imx6ull-var-dart-wm8731.dtsi   | 71 +++++++++++++++
> > > >  .../imx/imx6ul-imx6ull-var-dart-wm8904.dtsi   | 88 +++++++++++++++++++
> > > >  .../imx/imx6ul-imx6ull-var-som-wm8731.dtsi    | 71 +++++++++++++++
> > > >  .../imx/imx6ul-imx6ull-var-som-wm8904.dtsi    | 85 ++++++++++++++++++
> > >
> > > what's difference between imx6ul-imx6ull-var-som-wm8904.dtsi and
> > > imx6ul-imx6ull-var-dart-wm8904.dtsi?
> > >
> > > Frank
> > >
> > Hi Frank!
> > Thank you for taking the time to review this huge patch.
> >
> > The difference is in simple-audio-card,routing:
> > on DART-6UL, the microphone jack is routed to IN2L, IN2R and MICBIAS;
> > those routes are absent on VAR-SOM-6UL.
> 
> Is possible to share most part?
> 
> Frank
> 

Absolutely! I'll do that in V2.
Thanks!

Best Regards,
Stefano

