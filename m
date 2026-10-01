Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDF0CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UudBeT5MtTtLRJzGKTgVM/EBUgESY13lKxlTXfP+GNo=; b=A0CCev0HG3nY5RnMdQm3/XFNqn
	xVhpExLYKSYJgpBM2Gbcla3hNESmS/BD0/vFAbBXA4M+p752/XXJ5vQjfGTyKaWkV9SLlX36/MKUu
	z7+dGX4JeoAgtaLIIPteq3aAbFZeuOFEE3B8sNebQz4oUz50sTf4i3SUJTXLFExks30l8Iez1Gswb
	CSZKqQc64wC47LRqTZowAn3jfcNiGjnM9svyU4EVxmbKFVWYctfsW2uMbPmGRbXYNKQElnpYRfAIA
	D0BOoY7Rc5XTYFpPitHMboBukjL/mXKnEug7O2185iLAKzbda1B1Rp1XyvuMK4bdS1/lijH8C6N+s
	mA1r25iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCoS-00000008K4t-2QjQ;
	Thu, 01 Oct 2026 09:10:48 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCoQ-00000008K4K-0Qmr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 09:10:47 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c2e2050feb1so278374766b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 02:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790845844; x=1791450644; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UudBeT5MtTtLRJzGKTgVM/EBUgESY13lKxlTXfP+GNo=;
        b=X0A55ykg3OCo1bMQghqguT3lyXuIfI6ew2UQDY3tJaw1cXljjJGx7tSx0SfSn3dY1x
         T9CMz3xLQUdrpio5pYfi9KfdGJ+ZYwuWlr24pGnRGorgdemiTmJz9n2RUJEN4fVAQIEU
         IrR9bSfm+8iiU3SyiOX3XClIeQLT6E1gd3lqkRB7chMODhNLrCUUCJ9d7jEjwrgs+fdz
         oVHwjG6Ewg/U03X7hB90mHpE5ypjdFc8K7vOf9nKF1wvARj+DuVIaOSWy91TIIS2NxP2
         VoxecR7RLq4uyUACQOZme/7iRoFv5bQ3ynvTsh3/aHjlEsSuzOy9edcgDorLDIVzxmx/
         8LYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790845844; x=1791450644;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UudBeT5MtTtLRJzGKTgVM/EBUgESY13lKxlTXfP+GNo=;
        b=vbF8F8rFTNjzCPBZuLx9IJ8zHOpnE3rpmRG9+bMvnNtJokHVjdSV4alDsi8VVj3601
         XcR+n/Vz7Ad6ZoosmC5GxfgbcMtoWXHXr2iq/5u7/mjlduJUxHqFOK/d1W+73L3CcnYx
         Xl0nytazzkWnPz1O5gshBovqNT752lEZR6NZaAT07M8OFRWuHX/IKeJIpQDg3LEq0D/P
         un68/SbdXxmE1DxapyIJ3TVF90c/gN1Q7xz7KIEJOjx3Qj838wkxC8EJ/O+XsKomud9d
         oH6S8OAkInjrIECtaylGAJhQIUQWQUZPrpQ50BArCC9jBwEp4Wnifv0bjRGDz4AYK70O
         sMmA==
X-Forwarded-Encrypted: i=1; AKwUvBzuxTHyTgkqlge2Dcur+0zHz7LhUvyYM/IU41AGwAy09v/RRMCLvsL05FX5G0/R7TWRTaTNhDYthNDTV3nzKVor@lists.infradead.org
X-Gm-Message-State: AFuF++nzAs624nGRX3XJ1G8YmduaIDnLTpoauTzvnLpzXsvb/G+y97Y4
	mYmlS2hAPcV4ltZN3Czm3buj/wNZzMTXsCqlNocaDblsfUsqAKTfwUDl
X-Gm-Gg: AYBFou08mOTilqueI/nGp7XFT7cAMS5S6WlGDIGyFeTbrTmr54++ePE8cRdRJ2GETjv
	2c1JPhjLkjrGJ2N/dAcV+UJ09VXeevXG5oLDFiZsD7MmXmsDSlHJcCSflCKOn+uj120u1mmXnVP
	KCK62/IFUNRxjSOjseKGa8cNTc2moJRkbFXqZnNnEMsx65TMCq+p8iA/7A22T6ZzxisQyi1iw3w
	1m+y6q0wZJ0uAkMiXMl9vOKEmowFWPgmCKNjj3oKSCEFk/pJuC9azvZmTSX/EM2yD+YVTiPwg3w
	GoQz2BQMkeqwE1lO2kAlnFXY/nzZwKiZKDoiAjHt+Yap8RcpB7mFIEoCOj58di6ke5QHi6r4awx
	60yBL2jvAXU9bB+wugmBoXSYVrKtyBud0qNpCEyU1SmakrdDjMy7rg969nCIHxuSHLGqTCIVQde
	NnlxG6U7ZrAk/eP/zQpfz62L9fGn9DEoaqOTfHQzUYi/9nxkZ3/OWHyasQk6V4YTPGgUu2L4V0P
	uoPgRduyUJe4bLcl9SE1+YF+RHTqIZ/SQ+xwqjdlwm2HUgNU49OVyObfG954mAQ3f3QhMh9xZHq
	UnH80po76pyNny94bcAFsbIVfW9w
X-Received: by 2002:a17:907:3cca:b0:c29:4cdf:dd70 with SMTP id a640c23a62f3a-c2e23e5d1fcmr349826766b.44.1790845843677;
        Thu, 01 Oct 2026 02:10:43 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d80d5csm116136266b.51.2026.10.01.02.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:10:43 -0700 (PDT)
Date: Thu, 1 Oct 2026 11:10:40 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>, Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v4 03/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULZ
 board variants
Message-ID: <ar4jkNZc0eoF-EhL@Lord-Beerus.station>
References: <cover.1790693249.git.stefano.r@variscite.com>
 <1e6f9e01bd9e0e0801b18ddc9eb44bde200ea984.1790693249.git.stefano.r@variscite.com>
 <20261001-immortal-wild-wallaby-23de50@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-immortal-wild-wallaby-23de50@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_021046_160828_FB9750FB 
X-CRM114-Status: GOOD (  15.10  )
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

On Thu, Oct 01, 2026 at 10:09:22AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Sep 29, 2026 at 05:17:30PM +0200, Stefano Radaelli wrote:
> > +          - const: variscite,dart-6ul-imx6ulz
> > +          - const: fsl,imx6ull
> > +          - const: fsl,imx6ulz
> 
> Is this the right order? Which one is superset of which?
> 

I followed the compatible order used by the existing i.MX6ULZ EVK
and had also noticed the comment questioning whether `fsl,imx6ull`
should come last.
On review, I agree: i.MX6ULZ is the reduced-feature variant, while
i.MX6ULL is the more general compatible.
We can use `fsl,imx6ulz` followed by `fsl,imx6ull` for the new
Variscite entries. I can also propose a separate patch to update
the existing EVK compatible order to match, what do you think?

Thank you,
Best Regards,
Stefano

