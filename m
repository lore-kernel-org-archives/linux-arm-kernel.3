Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F420CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 16:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=en35R6sc2ImIXJjSfKNTDeODIfFRRIXQVjpIv7bHdmk=; b=oqXBP1isuI5hpaHNzLSBAxSHmo
	MxULKqsLLT2aRpOqHCUElxJ8Fk/HydZSCLD6ulcL/E9tpbBhDPxdEHN1v3c9O6c80773c9KHKbxYz
	4jo9HABeSSOoBsRjPKeENCh6mjh4jnSARnDQg3g1kbD7yohuLQBm8YF1cT2jlLqMrjMkGpFU6r2VQ
	6z1fF2VgR2CLDcQhtI7NNxKVTKjxu1HzdK19rK6moHlxQ4qgkyw51kyyNvTZ05dvoa0eNPtxLdOmb
	m1vZIjEbWLQa+Ydfc3NJjY0+wdd9X0pOV2sBYzwxAmmgP0fhpYG4YI5uOQcJTVumt+Ydo1CqC3Rhr
	aOc7w7lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6Eu-00000008UUA-0iOt;
	Thu, 21 May 2026 16:27:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6Et-00000008UTx-0GHW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 16:27:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 693EA60122;
	Thu, 21 May 2026 16:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F61F1F000E9;
	Thu, 21 May 2026 16:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779380834;
	bh=en35R6sc2ImIXJjSfKNTDeODIfFRRIXQVjpIv7bHdmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DuOoRKBO6Y1Oqrq2sJVjpuELojujcFM80db44IMaa6rdCsVyxoL2s+9M7w0kvfCxY
	 WCW3FPjEQbdO3j0DQ1pU/39D2T4/mSgwGY/XxIKOZ99G52iza5+52jIdv/FZfUwWIi
	 TKQELjriOStYA3QCfXpiFucHhhGpZQeGtMu3ZBtbfP5D+Mh8Zt2LZ1PGhN+qPrI0aw
	 6xkmpJjoMLOWpnx9ml1tKtw54ghGgcDQUD309KlAWUMHkk31otLpmnySG1nt0I98cR
	 ccI4arI3xtm1COLpzPFvlggMBVkYkf2XDAzZguFVzH0ETgrlum/YGVLx6H8Y1F9dOB
	 BCKRbLLME2zqQ==
Date: Thu, 21 May 2026 17:27:05 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	Sebastian Reichel <sre@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	John Stultz <john.stultz@linaro.org>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
 cells
Message-ID: <20260521162705.GH3591266@google.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
 <20260521112638.GD2921053@google.com>
 <CAMRc=MfqaCjiALZyVBHQs=Taft1M9xmNTFvQHWPrd5PgcTfJDQ@mail.gmail.com>
 <20260521132419.GA3591266@google.com>
 <CAMRc=Me5QS4xA3PJWXNuRP1N_C+w3sP9ZvqH36GNh2Ebc9hwcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me5QS4xA3PJWXNuRP1N_C+w3sP9ZvqH36GNh2Ebc9hwcw@mail.gmail.com>
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

On Thu, 21 May 2026, Bartosz Golaszewski wrote:

> On Thu, May 21, 2026 at 3:24 PM Lee Jones <lee@kernel.org> wrote:
> >
> > >
> > > I suggested it because of its flexibility. The alternative I had in
> > > mind is something like a new field in mfd_cell:
> > >
> > >     const char *cell_node_name;
> > >
> > > Which - if set - would tell MFD to look up an fwnode that's a child of
> > > the parent device's node by name - as it may not have a compatible.
> >
> > Remind me why the chlid device can't look-up its own fwnode?
> >
> 
> Oh sure it can, but should it? I'm not sure it's logically sound to
> have the child device reach into the parent, look up the fwnode and
> then assign it to itself after it's already attached to the driver.
> This should be done at the subsystem level before the device is
> registered.

Leaf drivers reach back into the parent all the time.

-- 
Lee Jones

