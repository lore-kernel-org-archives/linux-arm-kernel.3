Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8F8C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bluJB05dMB2jV3Y6fJ6wm8ws1q2ZyISwGm5FF9gkYIU=; b=W20YzjRryh3cicByPKb596EkPS
	VXtFJ0sDP3KBM7G4CEJljw2ONyJctK8ykoPlcT9umaFoxuEAmKbJE4DcdOL/YW5B41i8sJGvj4JE0
	+6J9yg+uA7MoV06zft3rj8idkV3HBnd0zecOfP7M3KC++WpkM5EN3YajYhJmm+ICXv2a4CtTW6Ngn
	4WHu4HgfDnD0PMyWElBpQOOdkQXBCS0f2ij890pMdwPjf8ky5Jps3DswaTPwAlk4t3T520k+e4XQj
	i95vQytt8Nszt+0/+qTvpilBLIoQGPrPYYo4B+t0IeFLipYv5v/nrJeKcNYHr8z0Lxeg2nQnXfWLj
	7pHmE1tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8x9Y-00000004yJw-321x;
	Tue, 22 Sep 2026 09:51:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8x9X-00000004yJe-42Yx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 09:51:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 73D8A403F6;
	Tue, 22 Sep 2026 09:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C61D1F000FF;
	Tue, 22 Sep 2026 09:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790070667;
	bh=bluJB05dMB2jV3Y6fJ6wm8ws1q2ZyISwGm5FF9gkYIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D3fHZaw7Nl8F58LiaT1FS4IcwtpHChTuSO0a7tIJqVvw8hqUBj1tygbfSikWcBzwm
	 dnv4LcQJt5S26njBaX6+xsZsJJ4bL67N/7NAWoGkM+FNwibvIeHWXNub6khFdheAx0
	 8doSkK+QfUddRYgxZ1+j8howiCXMpNN3P09QScNRy3gOE1/cLLXYD3n32bLj8U4BOn
	 V6pJM9DIjH2QJHA6gV+AbCsOwvd6HZbsfyRkbQHA+IcKRnj83Ofn/J9cEMsjsYewo9
	 bvSv1sCyUDORess5rRIjQAs7VUGR7mJzg0Rn2ny+MyTSaXnOl0fBDR8OMjW9ZVwWl0
	 TIfXjHGGp1dHg==
Date: Tue, 22 Sep 2026 10:50:57 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux ACPI <linux-acpi@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-efi@vger.kernel.org, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: Re: [PATCH v1 01/17] ACPI: bus: Use acpi/acpi_bus.h without
 CONFIG_ACPI
Message-ID: <20260922-quiet-heavy-lyrebird-b245ad@sudeepholla>
References: <7995179.EvYhyI6sBW@rafael.j.wysocki>
 <3717753.iIbC2pHGDl@rafael.j.wysocki>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3717753.iIbC2pHGDl@rafael.j.wysocki>
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

On Mon, Sep 21, 2026 at 09:45:59PM +0200, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> Corrently acpi/acpi_bus.h is included in linux/acpi.h only if
> CONFIG_ACPI is set, but it contains declarations that are useful
> otherwise too.
> 
> For consistency, modify linux/acpi.h to always include acpi/acpi_bus.h
> and update the latter to avoid exposing too much when CONFIG_ACPI is
> not set.
> 
> Since acpi_has_method() is called from some code build when
> CONFIG_ACPI is unset, add a stub for it to the !CONFIG_ACPI
> block in acpi/acpi_bus.h.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

I was planning to just pull acpi_device_hid() out so that I can get rid
of CONFIG_ACPI in [1]. This looks much more elegant. Thanks for doing it.

-- 
Regards,
Sudeep


[1] https://lore.kernel.org/all/20260915-acpi_scmi_pcc-v5-4-298579e9f359@kernel.org

