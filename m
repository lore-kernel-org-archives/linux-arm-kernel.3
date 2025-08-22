Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A5ACA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmggs7RjLJziF9Jhj9Okr/khr5ZhLBgBneq+FasNT/Q=; b=E3un6PB3EbT3ncwACsQY5Mr3+j
	+iwqb+WfcjAYLoU+BsGtp2SFUtupgbL0ZBnWV6EPBGubPRo5Vvbmb1l/Ioqr59sm8eUi9aVtRxH92
	ij5v4W1/pmkoptm6Yg9m8VIvPZgE2il+jFKVxqQZEHVJGZhg/JfTqE4i4z51TERBhCwJSpyLRrYep
	3LOFgKERnEBs6GmwYT6L3G5Y0uo5TDS21LVfS63uLq8SO9Df6L7DBtqBfnqlAJszhyMvi1yAx/a5A
	tlOJX95qJNEr6XVzMahvCm4JXjNHPUDffe1ieX/k1hE3bxa9kuPI+o4XSUsPdNxsTKVp57ywqOsuB
	hoGtviPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQyE-00000002Ufj-3M6F;
	Fri, 22 Aug 2025 12:34:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIeV-00000001Q9G-0iMa
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 03:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kmggs7RjLJziF9Jhj9Okr/khr5ZhLBgBneq+FasNT/Q=; b=lp51TTWc7IcY/xPNyzjOjC9Lgl
	AXEUTQFdiu/T9fM2xvkrQ6m0vY+6LPWrO42bPyMTzfe/m3EJiZdlvAtEP9NpFUHgWcuPfjtO5w6XS
	b1jZO7lBa5hKcMvsweLDdmQZcGAJS5VDj+UCwZ80m7PvIi3cDPMuGyrxHh9mPS5lp6OBo1u+QidJU
	6dx63IYWqyKxMQMUdJoufcZCGVJBJ8K7MUPkRuER+MChqkA2prCrFlCQACeQYLwLccCKtLSeoCYBm
	tOUxyFiSCcAjK/63QOeUTRwRSIKpTBMaP6otgmj/xT+UaTaeeOZf2DgrIjUxV5jxU0U6BjZN1S3Cb
	uKkpvs3w==;
Received: from mail-m16.yeah.net ([1.95.21.16])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIeR-00000000n7D-1gi6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=kmggs7RjLJziF9Jhj9Okr/khr5ZhLBgBneq+FasNT/Q=;
	b=TwkOHTzkXUOQm9WdVDvOaxVO7M7yC6n0AyT63IVL+3LYBbiLpmaZkzFTvW8tK8
	OQaNwmF+OQGCF/BRf7tJB3fUfNPRe/DujglbY044tEI3AxV1joBDdcSgimnqYVWQ
	Xoe0vVN/9lhYkTuqz0Zdffi/9izIV6Ekd75SyDIhNTmGQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCnrvbA5qdoifskAw--.6822S3;
	Fri, 22 Aug 2025 11:40:50 +0800 (CST)
Date: Fri, 22 Aug 2025 11:40:48 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Rob Herring <robh@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: add TQMLS1012AL
Message-ID: <aKfmwG55ajC5Q-AC@dragon>
References: <20250725062454.271191-1-alexander.stein@ew.tq-group.com>
 <20250725195628.GA1747130-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725195628.GA1747130-robh@kernel.org>
X-CM-TRANSID: Ms8vCgCnrvbA5qdoifskAw--.6822S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYJPEUUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQPtU2in5sMEsgAA3U
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_044116_143115_18852979 
X-CRM114-Status: UNSURE (   8.10  )
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

On Fri, Jul 25, 2025 at 02:56:28PM -0500, Rob Herring wrote:
> On Fri, Jul 25, 2025 at 08:24:50AM +0200, Alexander Stein wrote:
> > From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> > 
> 
> The subject could use a 'fsl: '.

Fixed it up, and applied both.


