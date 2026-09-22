Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAB0C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+BJAVmqueRCG6zFCjOD7Eq+W4AZN/slK53nkPTLIzw=; b=FBfii74z3N8zeMJNseXKBrCwmD
	fZMZf15BdwUkyjSjZJsDusaWQneN+h9QvgbzlYo2irnGV5Nn8mDGqpE7b5I33GBVc56Exxj0Bfmt8
	U+R1rQ611KKujZL4U+FOalbCN1SO1tka8twLkqrf0dPNVUyH/prIYLznxQhQahUuDGv4Rz1XIKR98
	3h5Xlow4Oz5ZM/06LfHMu/FBsMl7ja9h2qf4eAHQEc7ucgMR+6h8b2Qb5+y9fKVvkKLTpdLJ9BieO
	AHwc+/2sr1w1drwwuVBonYclCIqQJ4vGSfMl/uf7p72Uo8174fCZ/SfcK1dWhP8ArCMh3ALta3gm2
	NyGj37og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92WW-00000005rUq-2t69;
	Tue, 22 Sep 2026 15:35:12 +0000
Received: from flow-b4-smtp.messagingengine.com ([202.12.124.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92WU-00000005rSU-0u3k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:35:12 +0000
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailflow.stl.internal (Postfix) with ESMTP id A43E81300129;
	Tue, 22 Sep 2026 11:35:06 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Tue, 22 Sep 2026 11:35:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790091306;
	 x=1790098506; bh=k+BJAVmqueRCG6zFCjOD7Eq+W4AZN/slK53nkPTLIzw=; b=
	vBHFQdATih6l3N7u8kgSaG6ewsD9JgZ06Ng97KLBVVY4J8D6jacpdSiKK+4im8ZS
	u9VmgAQFMskN57E4t27jHM2UV5j47xEyHitSw055TIgRMzVNfsIbjzSjZ39uZntv
	YCu/MCU1Q7yPSzNqZVJm5lwm4dADXHwy4KvQTuYP1EInG+nzTh/diV/dVqg96DRP
	ix8w4/cUUajZ/PV/H3udbOLDTh+JP0ZaMtjGlmHsGQRLVDb2CFP/X8MH1+eRhG99
	2QZnArTu/ZlbZknU5sE369648aFsvw8DjACMUSh0KoZ8z9jcAL81cgznOSvYSd+j
	ssMfR4wN5CIcYXWKgDz5Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790091306; x=
	1790098506; bh=k+BJAVmqueRCG6zFCjOD7Eq+W4AZN/slK53nkPTLIzw=; b=P
	ob5rp9KchqWFsAfq23R+f5NbH/N973omlKPujuzR8A5vBpVsppAzP7k2aakuEsUM
	dFFLYXhuzzk7Y9AzU9HQGE5NnzoBT6oZM7NWLByxyKKIYejQ+kvmaeNYNHQMCbs/
	iUVxP+nXDO9oEEWlWoWzxuAYAHNF/tsYmxjmywFMlwkGG7EIYUuN1lCv8qjoDvnr
	MfWyjDHsdvmFsrJw9q2U8xWy8GteZM/Ex+RvIm4XQmrWiGhUYSYmBjK5pglA4byh
	gFuyun2S1I6Fuih79yVBUZQ+T116X54O3DxYr6g3OT9+qCQfqB47C4SGeY5qaKJ8
	6s7nMEh93TuY+ecCimQcA==
X-ME-Sender: <xms:KKCyam5WgE9ZpY9gXIKLrQngKI2iwNYixA0jfDSr3poQ1N3ET7muhQ>
    <xme:KKCyaqt0QhS6pQbLBzJVoOJ5hsa19arMRnxx-Qj92ufAF2HPh8Edmiovpn7HEt9QH
    J74_WyVPC6vRxYuyp1-_d_vI43rh55Oox7D1mGNH9-RWurLMbe_PKRn>
X-ME-Proxy-Cause: dmFkZTFtO50sYQ5HQ9vqA43bq7Ik43gKK49C4hRnAlX9A2NcSc1pEt79yROnVZUKyvBN/Q
    PLC8lg14plyO8t93JRmwyuiDu+rSsldUqLFoRsqyyuw9x476BiFA1TJU/iKokRtmSagGho
    OOZcJCjyQPV1KsVkjZ/gVJdN71ywnrTmwTP9R9Thti3rf06sti9s+JYTC7CXXrspT9q17P
    zWokE2QYleDx84Xfx9mxpv3xUm5tz8HTKlWamE31/WQbKz22J+mgtXwqR1TS+0EQnuAwYN
    HL/qx7PGCVOuHBlM8MEJ2N5l4Ooh5pzkmkzmyY5lfAg3Mf/gsytQ7H3AAtIg+LMWZSZFPg
    7gGBz57Ll3xeJ3dlJj2ooyr7GnRfU0bw3vJ380NbqVLpjBwF5VPInv5bmQpDYD3xVISide
    F2xq26yalJCzsRfL5A9vA3YMUmHrY741Sp54Y+W71Y3JyBJrPyjbdGUOlzQ599SqoFtdZU
    kfdCxY4rTHRJqN3xNybcSpmYV2eX8cItJZyvos+ScMdOsZKukpimy3H5NpEAxLtQruJIkS
    espiz3yptdMvF/YFSjkfprbH93NBPLmJSvB44uQdeM/VP3AvBIfpprI8W4Bl5RSnsm+XEo
    rAQDJLlULngYuKc1Lp4bKXB7lQ8I7D6WYvr1ZiqFH9YYELj8UbIEVskfuVsg
X-ME-Proxy: <xmx:KKCyalSdRU9aYYdTZPvOHzfhOe4tMxxJ7yQhCudtGndj_4Rx2UUw2g>
    <xmx:KKCyahrX-BtlUl3tsOEfwfODrvx-BVtC0m7q13SfBKJfNzFXuARHWg>
    <xmx:KKCyarqRoDPJ8S7eNSjdk6YKVfzMq2S6b66tkn2oojiaJ9jHh_tXeA>
    <xmx:KKCyau39fxPH69-2x3g1g77GvHn-TFzVkDG_TsZihIhwUce3RgNqJA>
    <xmx:KqCyapS2ftzfib71AW2ALWop8XvH1ivIDUWl6S2DCU4uM3zT4Rc63xGx>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 647182C00067; Tue, 22 Sep 2026 11:35:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AVcutaJy7ROZ
Date: Tue, 22 Sep 2026 11:34:44 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Mika Westerberg" <mika.westerberg@linux.intel.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Hanjun Guo" <guohanjun@huawei.com>,
 "Sudeep Holla" <sudeep.holla@kernel.org>,
 linux-arm-kernel@lists.infradead.org, "Ard Biesheuvel" <ardb@kernel.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 linux-efi@vger.kernel.org, "Will Deacon" <will@kernel.org>,
 "Robin Murphy" <robin.murphy@arm.com>, "Joerg Roedel" <joro@8bytes.org>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>,
 "David Rhodes" <david.rhodes@cirrus.com>,
 "Richard Fitzgerald" <rf@opensource.cirrus.com>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 linux-sound@vger.kernel.org, "Shenghao Ding" <shenghao-ding@ti.com>,
 "Kevin Lu" <kevin-lu@ti.com>, "Baojun Xu" <baojun.xu@ti.com>,
 "Sen Wang" <sen@ti.com>, "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>,
 "Venkata Prasad Potturu" <venkataprasad.potturu@amd.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Cezary Rojewski" <cezary.rojewski@intel.com>,
 "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>,
 "Bard Liao" <yung-chuan.liao@linux.intel.com>,
 "Kai Vehmanen" <kai.vehmanen@linux.intel.com>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>,
 "Binbin Zhou" <zhoubinbin@loongson.cn>,
 "Andreas Noever" <andreas.noever@gmail.com>,
 "Mika Westerberg" <westeri@kernel.org>,
 "Yehezkel Bernat" <YehezkelShB@gmail.com>
Message-Id: <b4c3aab6-2ce2-41ee-a1ef-3e53234a5213@app.fastmail.com>
In-Reply-To: <1973238.CQOukoFCf9@rafael.j.wysocki>
References: <7995179.EvYhyI6sBW@rafael.j.wysocki>
 <1973238.CQOukoFCf9@rafael.j.wysocki>
Subject: Re: [PATCH v1 05/17] platform/x86: yogabook: Switch to use
 acpi_bus_get_primary_device()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_083510_724828_1052A466 
X-CRM114-Status: GOOD (  17.78  )
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

On Mon, Sep 21, 2026, at 3:48 PM, Rafael J. Wysocki wrote:
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
> ---
>  drivers/platform/x86/lenovo/yogabook.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/yogabook.c 
> b/drivers/platform/x86/lenovo/yogabook.c
> index 1a4b2ab1f35d..8a91d440724b 100644
> --- a/drivers/platform/x86/lenovo/yogabook.c
> +++ b/drivers/platform/x86/lenovo/yogabook.c
> @@ -353,13 +353,13 @@ static int yogabook_wmi_probe(struct wmi_device 
> *wdev, const void *context)
>  		goto error_put_devs;
>  	}
> 
> -	data->kbd_dev = get_device(acpi_get_first_physical_node(data->kbd_adev));
> +	data->kbd_dev = acpi_bus_get_primary_device(data->kbd_adev);
>  	if (!data->kbd_dev || !data->kbd_dev->driver) {
>  		r = -EPROBE_DEFER;
>  		goto error_put_devs;
>  	}
> 
> -	data->dig_dev = get_device(acpi_get_first_physical_node(data->dig_adev));
> +	data->dig_dev = acpi_bus_get_primary_device(data->dig_adev);
>  	if (!data->dig_dev || !data->dig_dev->driver) {
>  		r = -EPROBE_DEFER;
>  		goto error_put_devs;
> -- 
> 2.51.0

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark

