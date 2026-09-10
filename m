Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33373C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5qIrcJzme0NduXyrAvDrLG2NE3PhTF+gf/58fAEq9k=; b=Y+5YE4JFeciSK0xyKu6VXFJwvK
	5juWD22NjlabVkMp5T153nZ70TXvC2O10LQDhwIrNso0XMKEIQC0jfPT3AyyuumIIP5AshviQG9o3
	R7I1xc2/MZe4gPMrdzlusZZCIPbHEUKB1k7PZzdnJ4c9Jv4yXy3GLZIeUzZt9QVJS9BViIeY7d0TZ
	M0nhA9NxNVdjqxRBtYLlqTAoBkt93bGEOoDDAUItP2lr06/5bVDOy/bUIklGNlmRWhEoZp9McdE5A
	cm7StNdsypENBk+31u+k3SIYYl/qsqkh5aziVUK24aIfkDiNbIFEOFuW7XrNUSvIWx+xsdLzGIKdV
	epfvBbQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b5N-0000000Dspn-3Kwc;
	Thu, 10 Sep 2026 09:28:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b5N-0000000Dspe-0SLQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 09:28:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 77F4943B30;
	Thu, 10 Sep 2026 09:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B101F000FF;
	Thu, 10 Sep 2026 09:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789032528;
	bh=Z5qIrcJzme0NduXyrAvDrLG2NE3PhTF+gf/58fAEq9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M5qXhXMha99KD+SAUmY4c0ZGSM+OpKh9JL0zlPOoByw22ty92aTGlxTDK4x6rsicC
	 11f+PGVWnEHw8AxbzqmHqGscOSVN5PrAD1hwPqzZRdOTRtLUlslIgjNNB5SSPqdkHt
	 yIT5ZlIAQN1Eumg8FE/yJdhZ/k6Zfp0SRw5rD/ZhxUsMUz2sQEpaWYIssfGfqOx/jq
	 HDN1EmjYdpNIlpzldwiepJT0iQw7gksXVc6UI5aJl3iWQ83Ldd4ISafSmZdEIUMjeS
	 OFdO1Fqu+1bogKmLNNwGg+dz22+7iJeYC48wBW13enJnQZRT8kXDwvcKM6DNdF9V5U
	 hnVfXtMtzo8yQ==
Date: Thu, 10 Sep 2026 10:28:40 +0100
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Russell King <linux@armlinux.org.uk>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v3 07/10] mfd: wm831x: support software nodes for DCDC
 regulators
Message-ID: <20260910092840.GN2133376@google.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
 <20260711-samsung-kp-v3-7-b2fcaba77aff@gmail.com>
 <0306eaba-b59c-4f8b-9151-9f39685398ba@kernel.org>
 <aprLYn4VzSTnZWuw@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aprLYn4VzSTnZWuw@google.com>
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

On Fri, 04 Sep 2026, Dmitry Torokhov wrote:

> On Fri, Sep 04, 2026 at 03:41:21PM +0200, Krzysztof Kozlowski wrote:
> > On 12/07/2026 04:12, Dmitry Torokhov wrote:
> > > Allow passing software nodes to wm831x DCDC regulators via PMIC platform
> > > data. This is useful for non-DT/non-ACPI platforms that want to
> > > associate device properties (like DVS GPIOs) with the regulator devices
> > > using software nodes.
> > > 
> > > We add 'dcdc_swnodes' to the PMIC platform data 'struct wm831x_pdata' and
> > > have the MFD core assign these software nodes to the buckv cells.
> > > 
> > > Assisted-by: Antigravity:gemini-3.5-flash
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > >  drivers/mfd/wm831x-core.c        | 47 ++++++++++++++++++++++++++++++----------
> > >  include/linux/mfd/wm831x/pdata.h |  2 ++
> > >  2 files changed, 37 insertions(+), 12 deletions(-)
> > 
> > I still need Ack for this from Lee... and the problem is that you did
> > not Cc him.
> 
> Hmm, indeed. not sure wheat happened...

Always worth a try!  =;-)

-- 
Lee Jones

