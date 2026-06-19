Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16C8CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwzW1YZuf6s0XgJIN78yCoG6M9J094IzLAb0cLlAQno=; b=nDOiFCVDjtazSCk723/tg2Vro+
	VT+Qf2B6dD1J7NjhgtACjwss5xFCMrcJ7Tr3MioDjhSiSZ4XuJ8hCWZE15Xlzg4ka5sWyfFZHIQ4c
	UCsZnNt1My7ryQeaIE15D1MwiBXb8hiffSn4UTq2nC35lePTqnclPiErpEP2r7SrLnGvYyOyI8fUo
	5YkqknE4SZaVdcWsabwfnlYixMrw+db+Bp2v6pFuTWNxzPpYxOKTumexvTw9dlIL4y5FVfE+2BFD5
	W2YU2Oj9EjpLkQRMZfrMkVTb6PdDMNKW5+PypIcWJVhmG4zq4m0rjPH1QJ608GhfMhDXp2jONd3Kr
	7HwfsNGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabQz-00000002ide-1jst;
	Fri, 19 Jun 2026 15:47:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabQy-00000002idI-006i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 15:47:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 89A7640AAD;
	Fri, 19 Jun 2026 15:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE721F000E9;
	Fri, 19 Jun 2026 15:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781884027;
	bh=jwzW1YZuf6s0XgJIN78yCoG6M9J094IzLAb0cLlAQno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jxNlqYdRPylC2g7Igqwh+Q2DuBxkAUPv2MPJRAuOoGOM+AFwq1YBi/LhXFPhnATTn
	 1k7rsbW1i6dzTVtwsooWn6P/qd1HGvykH3Vr/4jZs/FXngf1JQWO00dET3HrZqbwNn
	 KU3s37Z0yU7mW4Z0JLqpd+Id0Exmi4zghbIadQqJWG0SwQ0MIJ7XEQk7zaZVn1VLJR
	 n/PEDLrAnpAdCDx4ldx4x90okkjxjsAqsKDX3nOfmSSENOpVDWXe4HkbDVKGILeE+g
	 bzDrvDcdOultCSo02l7oGeDqiWnA3nwl5nCzc+utCUo+T+MFszwdYqolfiBtPEbcfH
	 l9LjXQ65aLIJg==
Date: Fri, 19 Jun 2026 17:46:56 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
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
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Song Xue <quic_songxue@quicinc.com>,
	Sebastian Reichel <sre@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	John Stultz <john.stultz@linaro.org>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v22 00/13] Implement PSCI reboot mode driver for PSCI
 resets
Message-ID: <ajVkcD3pPIRcEPks@lpieralisi>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <0c6636b0-f6c7-49dc-b335-2b4fac16b848@oss.qualcomm.com>
 <f0336ce8-e5e0-4629-ac51-f3c42bf3d9a9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0336ce8-e5e0-4629-ac51-f3c42bf3d9a9@oss.qualcomm.com>
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

On Wed, Jun 17, 2026 at 10:30:21PM +0530, Shivendra Pratap wrote:
> 
> 
> On 29-05-2026 19:00, Shivendra Pratap wrote:
> > 
> > 
> > On 14-05-2026 19:55, Shivendra Pratap wrote:
> > > Userspace should be able to initiate device reboots using the various
> > > PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> > > patch series introduces psci-reboot-mode driver that will induce
> > > command-based resets to psci driver for executing the device reset.
> > > 
> > > The PSCI system reset calls takes two arguments: reset_type and cookie.
> > > It defines predefined reset types, such as warm and cold reset, and
> > > vendor-specific reset types which are SoC vendor specific. To support
> > > these requirements, the reboot-mode framework is enhanced in two key
> > > ways:
> > 
> > Hi Lorenzo,
> > 
> > Can you please review the if its aligning towards the suggestion in v20?
> > 
> 
> Hi Lorenzo,
> 
> Was planning to address the mfd, and other comments, for re-post. Any
> feedbacks, that we should take care in next post?

I glanced over the code - it is better than it was but I could not find
time for a proper review. Go ahead and repost we will take it from there.

Apologies for the huge delay in reviewing it.

Thanks,
Lorenzo

