Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD9EC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 13:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdWKg3Z14pzkjiIKFnBBxrtOl91QbWJYbzd6e96ktA8=; b=4wsAQNf//tbRWRriSnII7kHNM7
	VhBCkkHmDAAm6fwZfaJ2CnhZfBiGxE38fzGqjG1CQ2GqFXulxlg3rAmJH+MaXSpBFsYPhhqOELjBa
	2hs+S9R52Ajq2ZkF20JzmSLHOA9t6d+6Ld9zyuzGYTfE4NzzuL1cIXFfA+02Ze4NPyGeosn4hwfax
	zPENT6BJ0XvBC55a2pj780TS95QgOrrcTBnE7vIpmuPNJtl3aNGLq5O0etD7ROvs0gGVCHvM7ql7r
	mUF8SblnRXuQPH/Mf3QcXooQGTQpj7idpYEuyWeivmWW7Y3CBUOT2xoElr14IbRPZ88AKUlAkM7r2
	b8PtZLNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8xi-0000000GH1T-1m6j;
	Wed, 12 Aug 2026 13:25:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8xh-0000000GH1M-27fL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 13:25:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DB1641A14;
	Wed, 12 Aug 2026 13:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8BF1F000E9;
	Wed, 12 Aug 2026 13:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786541141;
	bh=XdWKg3Z14pzkjiIKFnBBxrtOl91QbWJYbzd6e96ktA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JkyjbaKQcvZkv8h6FOccIz/vgPW5PWA50Jru9v74xeCJrCWHuwDvkzSZtawDpWsTl
	 fa3pz2SueGRrasjvZ9rsaVVRPEALCEqUOP6/s1zeKosF6z4kxae8rUOA/AgT5SbqEz
	 gDPizQVq14lxbVrg9YUbSX6to0qe9QtIbnquZ1XUYh50+qlQlcPCybCohbTHrG0n37
	 myvuGH2exrgu00cOgcLjIpKmR2DJl8SgB6sLo25rrDEKpOKQSZhppe997YixQRgviL
	 /2ic0KDVFJ0kQeSEAvXDk3IfI3Dm5UdHJdc+WoV53B853PuyKftMqNl660d1ruqgJB
	 ZBlLKEUkXXSBg==
Date: Wed, 12 Aug 2026 14:25:31 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	John Stultz <john.stultz@linaro.org>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, mfd@lists.linux.dev,
	Srinivas Kandagatla <srini@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: Re: [PATCH v24 08/12] mfd: psci-mfd: Add psci-reboot-mode child cell
Message-ID: <20260812132531.GS1072730@google.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-8-889281373870@oss.qualcomm.com>
 <20260812081856.GF1072730@google.com>
 <CAMRc=Me7Nua8xgKA43rCH9SV2DQoCyAuOqb+KNDTuPxv_H5y9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Me7Nua8xgKA43rCH9SV2DQoCyAuOqb+KNDTuPxv_H5y9A@mail.gmail.com>
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

On Wed, 12 Aug 2026, Bartosz Golaszewski wrote:

> On Wed, 12 Aug 2026 10:18:56 +0200, Lee Jones <lee@kernel.org> said:
> > On Mon, 03 Aug 2026, Shivendra Pratap wrote:
> >
> >> The PSCI "reboot-mode" node does not define a compatible because it is a
> >> configuration of boot-states provided by the underlying firmware. With
> >> the new firmware-node based cells in mfd-core, this node can now be
> >> exposed as a proper child cell.
> >>
> >> Add the psci-reboot-mode child cell to the psci-mfd driver with a
> >> named_fwnode. Add psci-cpuidle-domain cell first to isolate it from
> >> reboot-mode failures.
> >>
> >> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> >> ---
> 
> ...
> 
> >> +	if (ret) {
> >> +		if (ret == -ENOMEM)
> >> +			goto out;
> >> +		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
> >
> > Okay Yoda, but why is this okay?
> >
> 
> Hi Lee,
> 
> I'd like to call you out on this because making snarky comments on a non-native
> English speaker's syntax is really not OK. Please don't do this. As a native
> speaker you could have just proposed a better sounding version.

It wasn't supposed to be offensive, it just made me chuckle.

I unreservedly apologise if any offence or ill-feeling that may have occurred.

-- 
Lee Jones

