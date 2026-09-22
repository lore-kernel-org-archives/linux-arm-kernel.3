Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4045C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P59QfpE3GHnfbSvYljbknL7udhz9I4QHMk1BVsCN34E=; b=jhdJMkYTNHrdZoIpA/WZVCLp/N
	OVVMqviksdZ8aQfBGPdRxFKgozvRnWqUHzhPEvtVBrRSHA5i3XTbjlXNiYs50mgYUfvwQ2YarlsOB
	uDCBqyS/W7nHzXUwvEIlU5+OxoHtZ8Tz3PsRZ+dNxPqLGNn31/QQUQ/He1Dw0jSu94JO0psevhdFv
	Bt9QZMVyjMxDtckD/JT4qfc5mKBNmzvKeAIrZnd0i/nuK1TMQNaHcIVZj+C+YkwRGrW6k9/rhdQp0
	Gr2PTigD+9Zj3D1h0bXEBaTsq+n6q16aQLfP8gFvSxafjjklHw8L+epFpSrcTOMNeXkHb1tiBjpqo
	6eqFBk3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xBc-00000004yq6-3OYu;
	Tue, 22 Sep 2026 09:53:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xBb-00000004ypa-26yy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 09:53:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 80B1C60DEF;
	Tue, 22 Sep 2026 09:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC531F00893;
	Tue, 22 Sep 2026 09:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790070794;
	bh=P59QfpE3GHnfbSvYljbknL7udhz9I4QHMk1BVsCN34E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ioEiBwWxtFOnnrc8m3NVjge5vzs2I9+zc1FxbUKPw5eNUYjDniudO7GcHVIuEsxsq
	 iP84J/MCS6vHp6wC0dRnjCto3SgkwS7KFt3pgrbYhjIXyFhrMJZm2DKeQgoqFCNR/Q
	 2QEpkHRHsd3PSwJoumlRB/mk5l1zd4YoJS7nIJMnnxhEOYIbBaQWdUfI2FyQBJy0uT
	 OOe1ikKjLGjhCrq8NCgk2NEKK29+o5gKmExnrQrWIUKYxl8vFRsR1MNqO9A2F4Eu4W
	 PP/Gqyfj63d+QdcV9LCyn0m3YnIvjkgUxjzEe9uXwAnn+IGh/n0wGwutOpPgOw3bWy
	 JANualluSkX9A==
Date: Tue, 22 Sep 2026 10:53:05 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux ACPI <linux-acpi@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
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
Subject: Re: [PATCH v1 17/17] ACPI: bus: Drop acpi_get_first_physical_node()
Message-ID: <20260922-inscrutable-mussel-of-popularity-ca2afd@sudeepholla>
References: <7995179.EvYhyI6sBW@rafael.j.wysocki>
 <9732391.rMLUfLXkoz@rafael.j.wysocki>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9732391.rMLUfLXkoz@rafael.j.wysocki>
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

On Mon, Sep 21, 2026 at 09:56:41PM +0200, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> Fold acpi_get_first_physical_node() into acpi_primary_dev_companion()
> that is its only remaining caller and drop its signature from the
> header file.
> 
> No intentional functional impact.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

