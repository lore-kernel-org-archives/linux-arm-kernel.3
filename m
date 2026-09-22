Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2459EC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POCBszzJ6nkzw018YthAIP9UAGivRig8NSCLZQdHPKc=; b=4KG2E0RiX1flYuXjqvNp8Ixthe
	bhPjXy5sqaA2MBkI3uSEw8QRGJEAU/OEdozYPU+wvhw+gHs5fgtLDVUFnbLOu3k7GLfKGIU31eclR
	aLqA0rzmn5FP6jVvCu/MD6Fdm/GezUg9DFRarMWG90WsD29nfphu2kSK4B9H72/WwnYKlCySlK1PA
	t4FTeVTfHtYjUG40aw3JVxLCKK7slf0WILUs2Fcb+WMLiuys5PdJCnG+d4+ekCPiCQ2nmjsMAuRN9
	6Z7+hZ2bjco4CH+puAi7u7dbKoPE7/n/9zqECbX5bvTSNXu2TTrHbSyWVOrX6zlKVKRqBHD23VHGM
	caL4H5HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91Vu-00000005h7N-07jj;
	Tue, 22 Sep 2026 14:30:30 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91Vr-00000005h6e-197S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790087427; x=1821623427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mXahkIv2RJHhzfh7U3pfRJZ3jKnnu9sUzp7Ckf7hw/I=;
  b=QFVdFZvArxDHLhszpG+nCtTENeoeKfs6AMnKkTeWosgPRgBHOP62hn1R
   ZfHGX/q5oDm7vrIYAYUlTsLhqKCRqgOOAuzUKh1oPqkT7P0IObM13LAnl
   Q76q6VuiEzgDyFkNncRyVmYlKQZs+s8gD5XBQyNTbtbO/aI3YGTqawBKY
   unwVohvECyFT8pcWyfirvusOrHXv/yux3Byc1xJGb0fjq4Ntq7RwQkSld
   UkIJehU1KL0GZMzOkuCc34eeFXZJvve4wxak+K/syLQdmuZ+u0GA8s+R4
   xs0neN5qRBMi34wm7oigkTmPTsf+Z/qpJ/a1oG6Gf6Y/S/8Ehk/GbYn5G
   g==;
X-CSE-ConnectionGUID: OguGJVMwSJu4+Z/fLGWbkA==
X-CSE-MsgGUID: ceSJmf38S5OSmpgs7beZ4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101282192"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="101282192"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 07:30:21 -0700
X-CSE-ConnectionGUID: I/VCzjL/REmW6DwByGaEEg==
X-CSE-MsgGUID: m5yp+WLeSfWV6BjZ7FzIOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="299420640"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 22 Sep 2026 07:30:14 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id AAEC199; Tue, 22 Sep 2026 16:30:12 +0200 (CEST)
Date: Tue, 22 Sep 2026 16:30:12 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux ACPI <linux-acpi@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-efi@vger.kernel.org, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
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
Subject: Re: [PATCH v1 09/17] thunderbolt: Switch to use
 acpi_bus_get_primary_device()
Message-ID: <20260922143012.GG106095@black.igk.intel.com>
References: <7995179.EvYhyI6sBW@rafael.j.wysocki>
 <1941270.atdPhlSkOF@rafael.j.wysocki>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1941270.atdPhlSkOF@rafael.j.wysocki>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_073027_375333_A5E2B86C 
X-CRM114-Status: GOOD (  13.46  )
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

On Mon, Sep 21, 2026 at 09:51:06PM +0200, Rafael J. Wysocki wrote:
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
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

