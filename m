Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCE7C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpKeGCK87szjoNyGISCstPHlTshXz1Y1JnVLiGLvX08=; b=jn0A3zDMrTK4vjq5f9+26v1pzo
	kM1DHh4bwC4w2lQm0F6/UtysUtTe8KOni9lHezSEt82DNNHPhj0ejPcLmttKkBGBUSMA3rQw74KLg
	N8l4J2Sit1mlJ+n5n5OH7kT5OCmfgv/jccYLsgQQvP17fKDsTCiiCC7gBaPJ4oCSA6VEogQsYM8Tx
	amsLNJqBlaOInqr8rxmrf1Vd3DYaqKXPMMqAi4Atj8Xsncgp+E60E6hkQMMJT70qytemwXxMNV44g
	Ps0zUNW0T5xTscucDzbE8+ttMszlC2NOMALtdNZJxNgxIMTrEBUsy1ceuzyYPrB5eAKpwnRCZXdoN
	w1kMlHoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OiM-00000008g98-1fDD;
	Wed, 23 Sep 2026 15:16:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Oi9-00000008g3j-1qZL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 15:16:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DpKeGCK87szjoNyGISCstPHlTshXz1Y1JnVLiGLvX08=; b=XoE7IOBw0/SiObY8wOLyhPDsMf
	fTdHRR3FPBRSrVtSIxLiBFPJkBVnwEVltZHD7C3lra+9wkPvBcl2nHzWLFiYNIV2HEePYgQ+GfuJX
	UUal6gtX5PY76Mh8+5yt7EfBTExrw5h/pRs0Qu5zeJ5YYHww2xakzPciGfcvuzZZW+yMlt8XFA352
	TtpDGu72GCuyIqcAKQCuSRQMqHend0WhZavbMrOYJ/0fqoJBKlROnGn+lkmtsstyJIkDmMnGGxDH+
	kwn+WFgVVfLT+CBdmcs4tqDFzXsmgWy4St9YncAa+3PNKvrvky8C82OJ3zm5ySeQ9oBi9lAFbB1gE
	cQN/naLQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Oi5-0000000Ev5H-3qje
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DpKeGCK87szjoNyGISCstPHlTshXz1Y1JnVLiGLvX08=; b=mAps+FK/IKHLGJ6ryyNEBZvMiy
	bcob3AzJv2CKb4NGjVgsMdiqL88mKJMrEMrOitydGxlvnFVAH7TAL0K0g5ZmX0seI42XjRW1qWwFs
	9Z2qzk2hlUukq5g+5UsTbSlX/yXgea5nXAmrpo2fjnbSub8+8MUOwkdr6Ko4Dq9tAF7Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x9OhO-006pZU-S5; Wed, 23 Sep 2026 17:15:54 +0200
Date: Wed, 23 Sep 2026 17:15:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Cochran <richardcochran@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support
 and add Nord Ethernet plumbing
Message-ID: <5e6dc1ec-3602-4cbf-95e8-58e2b94feed9@lunn.ch>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <CAFkd8hsUzJEsDYjGSM3tsJzzwByuEkA+G4k1c75uYD-y5qU3iA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFkd8hsUzJEsDYjGSM3tsJzzwByuEkA+G4k1c75uYD-y5qU3iA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_161638_009380_87C540B3 
X-CRM114-Status: UNSURE (   7.80  )
X-CRM114-Notice: Please train this message.
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

> Good Job, Mohd
> 
> Tested-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> 
> Tested on both IQ10 RRD and Ride

Thanks for testing, but its a bit early yet. You might want to wait
until we get to version 5 or more, and it is no longer RFC, code the
author no longer is requesting comments on but is Mainline Linux
production quality. And after the AI reviews have stopped pointing out
issues.  Only then does a tested-by: make any real sense.

Reporting your test results internally is probably appreciated as the
patchset goes through revisions.

	 Andrew

