Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DA3C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCu96evxf20Dg31cvROXcpI/yYmId/Hxgeu4N2f5f2M=; b=bFW9I/99d1q3ONMp8dpSGJunO4
	X4YAkaks4BR4jvWD0PQhZrS/RX9AfR5e7UlpgXa+xXsrmXrak+6fhruThtHVlB7sHKCZdn13A1Xb+
	5tYg+5l3otIh+CzRaUiszJQSkbdxyipy4jB1lbeRVu9K/bgRRp2D/8SyqfVVRHLRDziem4MCBu1JJ
	GJ9Nwi7ZU5GCQn77oEnq03FdAuBvYxWhuS/qwX5WYZSFgh/7uMQvc4sxeww61gRvZpxvAFaxvqoCe
	zpsegBfwMfc6z2xCUXkOea+JDZzb5eohtwtKAydl8lXWUECkADewv1xRRpCMnf1eLDw37ksaB+hqZ
	Ayud2ZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xBM-00000004yj4-0YRL;
	Tue, 22 Sep 2026 09:53:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xBK-00000004yii-2OSt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 09:52:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0241744DEB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 09:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFF71F000FF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 09:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790070777;
	bh=XCu96evxf20Dg31cvROXcpI/yYmId/Hxgeu4N2f5f2M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ch6DM0hAWaNN27ZcRB5nchnPoKUpglKze6AoelpakUm1Eal73BAMd+5rGz3RdAJaf
	 J1Quz/+Kj+BGL+lGgT9gmzGzRTtwXgBO7no73bL5xE8HxQREtk44PyzqQ/jVmhbw1Q
	 qv0g1F7BmZnTMzwj1msR6U1RXPC530DEr0Mm0wyKnxz1JNbUk9XhwKxbyiP3z1SoZg
	 T0uuvUVCXFmzuu+w6TcDFMQdjcv5NaU4e7LsKqYEB/OBkzljXsTIpZJl/I9xNxACTM
	 j5JisIIzAf/Orw+g/SnQtd1vYdOgSXKwX026rogbPOibRXsaGaiByYOxPo00KdsaKG
	 JAFYs2xmPgGCg==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5919af2eeso35671761fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 02:52:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByKVV2jAduc+o3F3Xhcf3SRwFrFMrBNOwQuLZ08ddzAyDLS+3yQL/SJ200nzRKTkNWpwhuSLATIuP6IVu+lTVv4@lists.infradead.org
X-Gm-Message-State: AFuF++kVJmBSy4k9l9wc2UfkRsDCYlat0Rf9Lk2Pj1cfLtZot5CIL95F
	lGc29a9zLvdFt49I7gsFj3p3CDj9zTnF5FxrASIHKP3SGkBqEdX5QLwXaDaZ+0ml2j85/iCo0tf
	Z5cHQuMHZhUxkIkDAPL+xMe9fSMTj6KM=
X-Received: by 2002:a2e:bc02:0:b0:3a3:364:f797 with SMTP id
 38308e7fff4ca-3a5fbf024acmr29953651fa.8.1790070775724; Tue, 22 Sep 2026
 02:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <7995179.EvYhyI6sBW@rafael.j.wysocki> <3717753.iIbC2pHGDl@rafael.j.wysocki>
 <20260922-quiet-heavy-lyrebird-b245ad@sudeepholla>
In-Reply-To: <20260922-quiet-heavy-lyrebird-b245ad@sudeepholla>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 22 Sep 2026 11:51:23 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gcejDUREsJF9W5yCCU1=rBbJ1HtowzB-Y-i0rsyGvRgQ@mail.gmail.com>
X-Gm-Features: AcwNN1UEF627YybvGpJxDdUgnswJyEKtbD1EyeT6OeXpLE6q86oktnId6WHtw0o
Message-ID: <CAJZ5v0gcejDUREsJF9W5yCCU1=rBbJ1HtowzB-Y-i0rsyGvRgQ@mail.gmail.com>
Subject: Re: [PATCH v1 01/17] ACPI: bus: Use acpi/acpi_bus.h without CONFIG_ACPI
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Hanjun Guo <guohanjun@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Sep 22, 2026 at 11:51=E2=80=AFAM Sudeep Holla <sudeep.holla@kernel.=
org> wrote:
>
> On Mon, Sep 21, 2026 at 09:45:59PM +0200, Rafael J. Wysocki wrote:
> > From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> >
> > Corrently acpi/acpi_bus.h is included in linux/acpi.h only if
> > CONFIG_ACPI is set, but it contains declarations that are useful
> > otherwise too.
> >
> > For consistency, modify linux/acpi.h to always include acpi/acpi_bus.h
> > and update the latter to avoid exposing too much when CONFIG_ACPI is
> > not set.
> >
> > Since acpi_has_method() is called from some code build when
> > CONFIG_ACPI is unset, add a stub for it to the !CONFIG_ACPI
> > block in acpi/acpi_bus.h.
> >
>
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
>
> I was planning to just pull acpi_device_hid() out so that I can get rid
> of CONFIG_ACPI in [1]. This looks much more elegant. Thanks for doing it.

Anytime, and thank you!

>
>
> [1] https://lore.kernel.org/all/20260915-acpi_scmi_pcc-v5-4-298579e9f359@=
kernel.org

