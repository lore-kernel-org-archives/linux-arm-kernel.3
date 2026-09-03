Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371A0C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34B4My/cbYwbtAzKOspc3winfsWdZIxqEygPDUSPYD0=; b=ah+fqj0ULm+vAj0f4Y/DXqAJnr
	vW5UOhYjCM2w03d8HTddQBOmsjLbNE2ep/l/7N3FDt0cTksMernvcf4xuoRcZsNAUlCcnwpbS0xpd
	6bTw/2xx0Cr3j1ehFs6Kmc0xvNtO7x27hjOhIcP6veTDOGFKBiYTmGWKswNxkMJkO11UWYEJjgaLv
	/WRwYa0KsgRVgYORLVQqRo2TJiga7l6hYoIt/oZ+7JxD3vhQHuebZYKfXEpzBRvO/b8C2zBSd05Ap
	NF4uusda10bfaZXo6f9m+4pD+IErUYx/StG+60+LyFCKM3KdxiHc3Tc8lEE1M9c+iamhoYHHWf6YQ
	JIxXob0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29vB-000000004hp-2LOQ;
	Thu, 03 Sep 2026 16:04:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29vA-000000004he-2vRX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:04:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 27A5241ACA;
	Thu,  3 Sep 2026 16:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A373C1F000E9;
	Thu,  3 Sep 2026 16:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788451452;
	bh=34B4My/cbYwbtAzKOspc3winfsWdZIxqEygPDUSPYD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dOcHz2MR31TbbywskNQft623blEIeUxWttP2DBiARKBZXIU3JdIijX4vtEnljPQnw
	 CrrRCXGWasXWHIetOo3KsHvcq1lk54maLbm5Xs8jvhaQ0CHmW75Pqr5AAwlDkB1IQW
	 vlbecwzMeDmXvlUI4cHYIC4Id63naNfF+KXS0P7z02RCfVGCV9PdpIM0mRnFo09VzT
	 w6Gkw20lPK+4Op8OK9TesUG2FCQDKPwK3HYsciSbsmg7iqePGlI+51ynazj/pROlbF
	 xxofXU0/FttKpzxDCW+aJRBX5d28HmRPgxCLMuFIw5q0vOLfWhxoyZq8wtJH4kBvgh
	 acEEHHN8vmd0Q==
Date: Thu, 3 Sep 2026 17:04:01 +0100
From: Lee Jones <lee@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
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
	Bartosz Golaszewski <brgl@kernel.org>,
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
	Song Xue <quic_songxue@quicinc.com>
Subject: Re: [PATCH v24 00/12] Implement PSCI reboot mode driver for PSCI
 resets
Message-ID: <20260903160401.GV2133376@google.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
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

On Mon, 03 Aug 2026, Shivendra Pratap wrote:

> Userspace should be able to initiate device reboots using the various
> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> patch series introduces psci-reboot-mode driver that will induce
> command-based resets to psci driver for executing the device reset.

The more I read through this submission, the more convinced I get that
it does not belong in MFD.  This is a potentially nice "architectural
workaround" if it a) didn't break some of MFD's fundamental "real
devices only" rules, of which cpuidle and reboot-mode certainly are not
and b) didn't require a massive expansion of what the MFD core is
designed to do.  I am more that a little uncomfortable with the 150
lines being added to MFD core support this workaround.

My best suggestion so far would be to base these changes inside
drivers/firmware/psci and use the aux bus to communicate with the
various components.

-- 
Lee Jones

