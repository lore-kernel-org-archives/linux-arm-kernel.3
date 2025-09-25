Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2190ACAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 22:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPqIzxxCqz501l2T2BaB2Nu2Wi0UoMZvzBbrRhIgFq0=; b=qTvmfGa3586xY1eOvo1dOB8XCL
	dnqz0IpFRysN7W+j70rhqw56YkCh0tTciIdezoqBavYfoirp1vC9miESBjoKzmVMuaWLBgeobLkHe
	Wi0qR0E6zC7W9oumzctqlbisrP4/Esgly4Wg+kH3b3uGHoGlBv8/Z98jDkakpZLR5FUrlZzqGpA0v
	kEyrBSKU7Aq63woYd1SXcrHYNvP70s1T1cj5dtCU7xOR+h0mYT4F2zrfMCMyK5ZyV0BRlnz+Z4nPV
	JR4N0y+CFBcLAO1mSQTtfTNX/skywMnhm0BkCWg8EN/8fPTDjXqxmeuXXxpriLYOPIS84+jq3J49A
	XN0wCW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1uDF-0000000DTsV-1zBt;
	Thu, 25 Sep 2025 22:13:17 +0000
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1uDD-0000000DTqe-1ikJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 22:13:16 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.stl.internal (Postfix) with ESMTP id 8C3A213000D4;
	Thu, 25 Sep 2025 18:13:13 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 25 Sep 2025 18:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1758838393; x=1758845593; bh=NPqIzxxCqz
	501l2T2BaB2Nu2Wi0UoMZvzBbrRhIgFq0=; b=hPknQP7Ib8/dPKgJghAIwp4B+e
	GO7CW9zWOtcNILi4be6e55oGgFUTpWvR91f8FYrGYH6D0AaJI5X1DT3+vHeq/bTN
	k+xqthJl8cN9iKWAyZI2BDaO4dGv9fmxmrq7b/ELLHhbAqihZmWbeMKScqkMDct9
	Z///nzLybxNkdsvCPd7ukjb27YKSKejLBL+82e+XpodPuy43xS+RVJNroSfSWeqT
	GYvfWJb/blVYudeDWF9qDNFTHYSO2lSFGfJM+nIdEVBglverRidfMtUqUsFqJL+n
	N0VUG9G/Bozo25Ppm1pjKkG/b4UF/s9UPW4wjkpr9XXPLxOGd97gAt0ONVMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758838393; x=1758845593; bh=NPqIzxxCqz501l2T2BaB2Nu2Wi0UoMZvzBb
	rRhIgFq0=; b=lA61YFTeMGQD7SdfAE6TX9ix5Dogy+/Vzn22MXRJ+1iTL7+V86V
	yAvixanKoJ9B+n+tDTiGYgvWeZBFKZ2H8luAfHvoOsuiTNXQl2tU04Ca//ulvUUw
	p3cYfT7B+Dq6uw5b+M97eFiPGDQEjU5CAKrQqEp5EB8fxEc6QO5dkIOE8xJNGtpr
	/jPFrZ7Dow9XjPTj/SNko15jtEdvktp52T1dIbaOWy4KJHXz0S5iWiLLdxrUNZpZ
	FWnfAvmzRt4vWoOYfMHZVp75E6+18Rm0eUcgncaF8NHcZpHCjLO0N8c8XJvSfYBg
	u4TtP8YnD3L3D8DzfK1b6C/BPko9T5gjBfA==
X-ME-Sender: <xms:eb7VaB0ijrXjuFef8Vf9O1Dsq4ghbiCEWJMFi4xPA4d57S3hE80EHQ>
    <xme:eb7VaObXpG2WMgVZ4kSTlMnM4VCYnQQWcWojc3N8LPy_kaW8hICzBF65zMdsFmpeM
    iVjDuZZgmSdh1pbgr14_abVU17A0D13NVuAxXwNFyVqCq44GGYw4vs>
X-ME-Received: <xmr:eb7VaOnnaFtJv44_4RBhYi4JllU-xDK2C56vB_wjQ8hxKq1UH2yMvlAptAourvs-0GutvDcHCEVsw_vMED23BnEAvARAoLgqbx4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeijeeiiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfdvff
    evleegudejfeefheehkeehleehfefgjefffeetudegtefhuedufeehfeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
    hnvghtpdhnsggprhgtphhtthhopedvuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepjhgtrghllhhighgvrhhoshelleesghhmrghilhdrtghomhdprhgtphhtthhopehsvh
    gvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiif
    vghighdrihhopdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtoh
    eplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrghn
    ughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomh
X-ME-Proxy: <xmx:eb7VaNeMifx9zoubpJ2MYKko2bR9KdfdCrVsJJ9xpTEXQ0RlB3w8JA>
    <xmx:eb7VaM0oF3mL2R-0udCW5d6joZNd2Ai7eo3lODJTJ_9lW93NXM4EGw>
    <xmx:eb7VaKlyQic6Ai44_2MWDWfS52YpDq74sZ1QYqwmrRzKcQqNCYJgnQ>
    <xmx:eb7VaNZOLHJGXlyMaMMyqnEul-lrsNw-iNVnF_bPmBWQ4jTPlqWWLg>
    <xmx:eb7VaCBOG2XJmnt2zIs-X1lUBxCkSQJMieXer_VDjdSwiLq7ArbSxPPx>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Sep 2025 18:13:12 -0400 (EDT)
Date: Fri, 26 Sep 2025 00:13:11 +0200
From: Janne Grunau <j@jannau.net>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
Message-ID: <20250925221311.GF637503@robin.jannau.net>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_151315_497041_1EFD76C5 
X-CRM114-Status: GOOD (  10.28  )
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

On Wed, Aug 27, 2025 at 09:22:34PM +1000, James Calligeros wrote:
> Hi all,
> 
> This series adds support for the remaining SMC subdevices. These are the
> RTC, hwmon, and HID devices. They are being submitted together as the RTC
> and hwmon drivers both require changes to the SMC DT schema.

I we would instantiate all sub devices via MFD_CELL_OF macsmc-hid (or
-input) and the omitted macsmc-power would require SMC dt-binding
changes as well. I'm conflicted on that since both use SMC to determine
if they are present.

Janne

