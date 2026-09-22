Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E90C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XsLswjZySdqIFqF2ilbCxdY4qgyZ6CXrVVKDQsk1y4g=; b=kbMAF8gOXyyKzHxUEkPXDgRFsV
	EGK2O8iwNGU6zGnopZt8snTP/E4KV92JWarz4I5RdvhPfgszUW+/Zfcvy6QXIrrtgmGpvTa8WNJmu
	Xgb2/RzAfkNWwpAPi0Xy/vfVT13c6JsMr3VmbV6ll9IKzqwj9gN3v4PDLahSYWz01t5+yyMkbv13C
	KmWiJ5QALRRR6Zdvq2wt1G2wNvl9KeBlLI/pLRl6tg+5dR6882VNgRcNWy0P7m/J6lo70KPKJox9k
	qxx4nXcRNBEfMdnwcfrTr5hajorUiHfRv280o4Dk3Or2uy0E3uBwMuDSGuK/94wwvQJhIlptF+7Ed
	+n37/4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xAQ-00000004yYb-46At;
	Tue, 22 Sep 2026 09:52:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xAP-00000004yYG-34EA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 09:52:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 791FF4377A;
	Tue, 22 Sep 2026 09:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C923A1F00893;
	Tue, 22 Sep 2026 09:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790070721;
	bh=XsLswjZySdqIFqF2ilbCxdY4qgyZ6CXrVVKDQsk1y4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LMT8gm1AoEFT7gGBv+UHvLcfX07spj9zLtsGDHX0ve90f6yq0SZFLZPQpvEq8/N4m
	 MI6iTv11VPAo1J4kauwU+6zLxtDIwXUC964L4C7g1YLJq8FrypYsPFmf/vUt/mVbiP
	 MnY6xODa9WZzv2IDSSTqS+KAbdW0T+BfhD8qMxdeGpLgGm79CWChCpiZXc+Kje8zYk
	 A0xGKSz8y/wbQdh3N8uwV8KtmAdX/bn+y57m6j7PtFH0CVrZsXlsUCIv38/XsRX0ff
	 mge0QwP7f3UNAjRSJaRSYzeyHBU9CEx6vTG2iVg+TMffw61IvtKlPc89c/3inA5WLE
	 9GcGsuZ/Emhhg==
Date: Tue, 22 Sep 2026 10:51:52 +0100
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
Subject: Re: [PATCH v1 02/17] ACPI: amba: Switch to use
 acpi_bus_get_primary_device()
Message-ID: <20260922-tiny-pompous-stork-30beeb@sudeepholla>
References: <7995179.EvYhyI6sBW@rafael.j.wysocki>
 <3362405.5fSG56mABF@rafael.j.wysocki>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3362405.5fSG56mABF@rafael.j.wysocki>
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

On Mon, Sep 21, 2026 at 09:46:37PM +0200, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> Replace acpi_get_first_physical_node() that is slated for removal
> with acpi_bus_get_primary_device() that takes a reference to the
> device it is about to return.
> 
> This addresses a potential use-after-free that may occur if the
> device returned by acpi_get_first_physical_node() is removed right
> after dropping its ACPI companion's physical_node_lock in that
> function.
>

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

