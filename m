Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DD5C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 12:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4iGM2ITegptFt/GB57XpVHMLcIR82cp74UJOaNlV0sw=; b=CYU5PFOJlUwko8X3urcahCjZhN
	7US/X90XUuiKqzJdaem8D6V/aYrSuXr5nQRuj2cCXbZZviHpGh62txR2rch54GfIX5PUAqLXIgJnM
	M5hsLRjC5OEAeeOHRPmpWXeLiCIByQWprb0/H7kP+G9eznwoIPsIMUPkrOcailbU8BgJ+P8xkAfoq
	n1y+kT6YA0oxShuuYtToqZboE0lL+OBhLGq7pimQHqmcrODT+gcLaos7FfPL4KEfxi3U8nXiQauVJ
	QXqA1GD1VgFANn9e3KswuTSZ8riVcNBL81+FGYs3H5QUH3ckc+OrzoxQsnfOKzFGUXYSHuYKVvWVe
	lHjsCNlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulRvR-00000007iD2-0zD4;
	Mon, 11 Aug 2025 12:46:53 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulRpf-00000007hOo-23YX;
	Mon, 11 Aug 2025 12:40:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1754916021; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hteRfCRvkd67/Dx+dfT1KUe3zys+bioiMiINKAoqpiTvtPDlOOPKcNB/4tVKwVwFvHMX+zLzcvvN8ipbV5MQRiobOr64LC+LtReoaHmoo8FIaaicTy36wtcJ3j88Dxzd3G+4Uy6pQ12JiteUW9OgU0u5XMKeMWuH/5ZDs4BwGTA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754916021; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4iGM2ITegptFt/GB57XpVHMLcIR82cp74UJOaNlV0sw=; 
	b=VcAWintDg6coTqlLrgPMr08CdjQAmkSsel+lKpq6Kh8IF21WYFLkuRKepDSDUD0T9aN9C5rVcu7rKoVqRt7JdTvX3VNtS1etNT5Df0aW3kz0XwsIDOJmw9+H77SZwdWzUjr3CdXD0lmxRPnbCLMGS7dgvUUk4n2dGelta4xYlWU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754916021;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=4iGM2ITegptFt/GB57XpVHMLcIR82cp74UJOaNlV0sw=;
	b=gX/CWJyQm5KR7h1N2KyiPRq8MQNw2pzdjNaWcZe8wF+RXthtgRjx22s8MqNdJdiz
	bJJPv4dtcLip+KRMuOEv1uYh6uOFoWtkGR9PW9gofTrl+kAMhB4SA0YLWH2lO20DIsW
	qMX4h73cw6RxpBErFYkaYYQ4PmiEOWRenASXbqns=
Received: by mx.zohomail.com with SMTPS id 1754916019156141.85896495716338;
	Mon, 11 Aug 2025 05:40:19 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Niklas Cassel <cassel@kernel.org>,
 Damon Ding <damon.ding@rock-chips.com>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Alexey Charkov <alchark@gmail.com>, Patrick Wildt <patrick@blueri.se>,
 Chukun Pan <amadeus@jmu.edu.cn>, Diederik de Haas <didi.debian@cknow.org>,
 Chris Morgan <macromorgan@hotmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: Add the vdpu381 Video Decoders on
 RK3588
Date: Mon, 11 Aug 2025 08:40:16 -0400
Message-ID: <2793168.mvXUDI8C0e@trenzalore>
In-Reply-To: <aJjxjgG1gEaKBVwE@desktop>
References: <20250808193602.142527-1-detlev.casanova@collabora.com>
 <20250808193602.142527-2-detlev.casanova@collabora.com>
 <aJjxjgG1gEaKBVwE@desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_054055_591987_1EEAFF7D 
X-CRM114-Status: GOOD (  16.98  )
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

Hi,

On Sunday, 10 August 2025 15:22:54 EDT Link Mauve wrote:
> Hi,
> 
> On Fri, Aug 08, 2025 at 03:36:01PM -0400, Detlev Casanova wrote:
> > Add the vdpu381 Video Decoders to the rk3588-base devicetree.
> > 
> > The RK3588 based SoCs all embed 2 vdpu381 decoders.
> > This also adds the dedicated IOMMU controllers.
> 
> Back in the VEPU121 enablement series[1] it had been decided to not
> expose multiple identical cores yet, because there is no infrastructure
> yet in the kernel to schedule multiple userland processes on multiple
> cores, or (more relevant for your usecase) to even combine two cores to
> reach 8K support.

That's right, but the device tree still defines the hardware as it is. The 
driver, however, will  make sure that each instance after the first one is 
ignored (at least for now).

> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> > 
> >  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 74 +++++++++++++++++++
> >  1 file changed, 74 insertions(+)
> 
> [snip]
> 
> Thanks,
> 
> [1]
> https://lore.kernel.org/all/20240618183816.77597-1-sebastian.reichel@collab
> ora.com/

Detlev.




