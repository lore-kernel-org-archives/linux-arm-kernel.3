Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D21C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 21:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gfnyz3PgXS2yl17b/BX36yhHdEa/B9+KYiJScEfgx4I=; b=lbrWKkJaG9fkFW0zfTug7Zkoyp
	pFzqyYr/IBijo0TnjT+5qAvITu/uWuxGIu/4Myl6IUpojl0iZbD75T1nYxt701JPLwFuCB6YWGstQ
	9zlHShOJB0SMW4sWFgGG6Q22eHt4hIPrBEWsg4O+w4vcW/w1YySSpjN0ifAGKoLGmJGnRSiPSEyVN
	veOvwAi5GOu0bohTd+azUHxMNOQUz7jePueePQ8Dj7dASEV4QQx44QmcqBg26v75iD1IiDsy1MNR7
	Rc+nxeE4PtY8hmBKfWAJDUJpv+nWL1UBZZi87745yjB9rBOHd8DW02LUyVZZVwG73g1TxFI02C/wC
	LSpifBBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlao7-00000006wTi-1OZL;
	Fri, 21 Feb 2025 21:43:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlals-00000006wBa-240z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 21:41:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DBCC613B8;
	Fri, 21 Feb 2025 21:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C381C4CED6;
	Fri, 21 Feb 2025 21:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740174079;
	bh=v/SnGzcx/eJMMDRtXAJDI041OLygL1homwL+H1J7zik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KYGip4rxDmQyH7aQXu+iG9aeJNld3pXpDWP3s2+vbrAuZT2ifOoC6rEkPdTaPSObk
	 EWa6Cep/KYehSBuvj2FoGKJQBbcCB7hqAO24VFEdgZVcYXa6jcQbTLOrsccpVyA/y2
	 vuJrQl9cJGqr77is6sZ7RO/KBFNVFNe75Mdx2F6jKhKSgY10Mv+Ri21iSgfKV3YwMr
	 gXN+9qZ3tn9y7ezxuCq/gJwgotcNmER7dFPTpXOvTLPNDUg+kPWBYWwM2lnlmBMuaD
	 4zP/LDWnktt2NGVhjCWQafUR3sIF9JOZYPPomIvgiNWLZb8OcmxB2Lv5TFNnwMIhH2
	 iXtW28jAwc3lQ==
Date: Fri, 21 Feb 2025 15:41:17 -0600
From: Rob Herring <robh@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/5] dt-bindings: power: apple,pmgr-pwrstate: Add
 force-{disable,reset} properties
Message-ID: <20250221214117.GA119777-robh@kernel.org>
References: <20250219-isp-v1-0-6d3e89b67c31@gmail.com>
 <20250219-isp-v1-1-6d3e89b67c31@gmail.com>
 <400d64ed-670a-4297-b43b-cdf4e8599c7b@kernel.org>
 <CAMT+MTSb2gdkfCZE3i+0ah8AgE_G8mH2MFTms=QgFwd-nbA8Ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMT+MTSb2gdkfCZE3i+0ah8AgE_G8mH2MFTms=QgFwd-nbA8Ag@mail.gmail.com>
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

On Wed, Feb 19, 2025 at 10:43:17AM +0100, Sasha Finkelstein wrote:
> On Wed, 19 Feb 2025 at 10:34, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On 19/02/2025 10:26, Sasha Finkelstein via B4 Relay wrote:
> > > From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> > >
> > > Add properties to set disable/reset bits when powering down
> > > certain domains
> >
> >
> > Please explain why and what problem are you solving. This looks too
> > close to SW policy or really arbitrary choice. Background would be useful.
> 
> The ISP block has some weird requirements where some of it's power domains
> will not power down correctly without using the "force disable" or "force reset"
> pmgr feature. Basically a hardware quirk.

Add that to the commit message.

Rob

