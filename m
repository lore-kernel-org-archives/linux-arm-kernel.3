Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C12FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 23:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjWhdLhvb0FszGpH90J6XLMquCgsKBrnq0AI/bOZ75g=; b=dhf5PfIe15r0GjRcKqey9MODnp
	Z9Vut69Qe9ms7w1mr+LQ2QraGcw24S8E1sNeb3Nc50FobMERQCvt4bRu4gsH1dfX+8QWETejQfF7S
	ESWjod8zDJZmQUjnEJRA5S412Gj7lMRsvj1kLbxgRJXjsdwk7TbkOHUW1meHHnfFUD+o2ui5/DvhS
	u9F5dTMr+2CZ/7GsYzlJ0Kc1rsthJHGJ54Pjzr4b9fFCKx2eyFETou/M7W1TM9FpFl54PCGkqdQ5t
	BPkTZ59wwSERe8CW8ASEzoOINr50mUt13f3ayD/HqPaVJo9YS6VELYkp9D/10ASwzDMdy1TFFiIpe
	Uf2lL3Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIavG-000000067aZ-0rlt;
	Thu, 30 Apr 2026 23:35:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIavD-000000067a9-0omC;
	Thu, 30 Apr 2026 23:35:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C51942B72;
	Thu, 30 Apr 2026 23:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA394C2BCB3;
	Thu, 30 Apr 2026 23:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777592154;
	bh=UOaPDNLQb+DWXRX86NYkdWJLMQr/Dt6uSVxCr2qRPOw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZaefObiUhiS06GyO2ZPam7v+xKSz/xj6dDyzgiFyYF5vwMapPmxw1tjLpeku4NLqC
	 MNemy1d3JrJcOG0Jk6NNf+6YhMUlpqGil4LcSSlKqyMAfYs1D2uso3FiUdlp+smO/v
	 XDZtnFLVXIgjhIMQGDxFxXhJa93t5Z12b7KOm5uOpZaFN/3PlwFZQty9JQr//W2vqL
	 Vq054sIidcx3nsS2/NxotU3HYGyHQmcfz2fSk/UXIx19WufrApEtG037RRolFUxlTG
	 mayqczXLjYDszlo6fCq5NDr1S/jjjhfzeFH0Q2VuF9eMDultmmSXbQg3mPEEmemBHz
	 lDzLMIcnrmfEg==
Date: Thu, 30 Apr 2026 16:35:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: andrew+netdev@lunn.ch, devicetree@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 maxime.chevallier@bootlin.com, ningyu@eswincomputing.com,
 linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com,
 horms@kernel.org
Subject: Re: [PATCH net-next v7 2/4] net: stmmac: eic7700: enable clocks
 before syscon access and correct RX sampling timing
Message-ID: <20260430163551.7491407a@kernel.org>
In-Reply-To: <2117464.7991.19ddd2125d1.Coremail.lizhi2@eswincomputing.com>
References: <20260427072353.1114-1-lizhi2@eswincomputing.com>
	<20260427072508.1151-1-lizhi2@eswincomputing.com>
	<20260428180625.738223cf@kernel.org>
	<2117464.7991.19ddd2125d1.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_163555_257890_97933D46 
X-CRM114-Status: GOOD (  12.92  )
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

On Thu, 30 Apr 2026 14:43:50 +0800 (GMT+08:00) =E6=9D=8E=E5=BF=97 wrote:
> > Why Fixes? If eth1 never worked this is not a fix but new functionality
> > If you want to make this a fix to prevent incompatibility - cut it down
> > just to the eth0 changes.
> >  =20
> Thank you for the suggestion.
>=20
> You're right that eth1 never worked at Gigabit speed, so this should
> not be treated as a fix.
>=20
> In v8, I will split the changes into two patches within the same series:
> - Patch 1 will contain only the fixes affecting the existing eth0
> functionality, and will keep the Fixes tag.
> - Patch 2 will add the eth1 support (RX clock inversion workaround)
> as new functionality, without a Fixes tag.
>=20
> Please let me know if you would prefer a different split or ordering.

If you want to consider some part of this commit a fix it has to be
posted separately to the net tree (rather than net-next).
Once it's merged and makes it way over to the net-next tree (each
Thursday) you can post the net-next chnages for eth1

