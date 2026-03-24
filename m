Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEA1F532E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 07:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OLOycf39/aNOeJnNC0qRC/hLgeyWr7ry5aUV0rUsGY=; b=H1nE2KhwLV1oD57UhwIxmqA3Kl
	w8JOIT5HRoU3MRZkiKjIptIDvnMk4T8ayhIK1AHLm84dP+l9hslNq/5Wa/MkoPj3mIfkZEbrKwlAY
	hBRWhzIPwh1Z38rYBYMm6bAJwNWy33pgdFZh+Aa5m1FS2UDnCq0kri8gM2fJ6b2dMkoSeRwmk/Z+9
	x9Q164OjNaRkg8yPAPS0IC2++GOlN6cL2tKFJdsTawDv62D5Mch4bfnbGoA9cQFOO185jgMsooXU6
	tmIGHERS4h/aP1UioK+q0TtUxLXNfXReSVCOaUj58UM6tUvF/MKZcD6jM/CQyq0merOpzusY9Drl0
	3SnFz7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wW2-00000000vMm-2gtM;
	Tue, 24 Mar 2026 07:49:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wW0-00000000vMK-463d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 07:49:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E843960103;
	Tue, 24 Mar 2026 07:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BB2C19424;
	Tue, 24 Mar 2026 07:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774338566;
	bh=WjVMjQuHxIzGaW30gU6dOjv/9JEiFarwE8HCOIl6ENI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4BDSsGgwt/m35S1WVgZF+4KdcrHCPVhK0YaLM6ZYaayy7Jm5f3eHzoeaoGuZQBqW
	 gS1orJx6dE2iChoGomcXXQer96JAwd4fOIyt/bbf4QCCYTWnRyFqdZKHFN0kUoiJjc
	 EmnqVazUjUB6wmif407Kp3DfTh6x1EzueVl8RZxRyk44TtM7wu+Bsey/tebMzon5Df
	 HfI37IA7Bv9bdf6ZjxcneCzVi+OttstfaAGBqykhF6RAjASaq/5fYNjYdkihoagYSV
	 aJj5BFlJBy4MxzLjtuNGiqthAI2TfcCrPDxH+Btzn2fG4m6GVeKQqjVg5Kjw4VY6mm
	 jcJLBudOzF0SA==
Date: Tue, 24 Mar 2026 07:49:22 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: clock: Relax check in
 scmi_clock_protocol_init
Message-ID: <20260324-lean-bobcat-of-reputation-6628b5@sudeepholla>
References: <20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com>
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

On Tue, Mar 24, 2026 at 02:24:14PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> On i.MX95, the SCMI Clock protocol defines several reserved clock IDs that
> are not backed by real clock devices
> (see arch/arm64/boot/dts/freescale/imx95-clock.h).
> 
> For these reserved IDs, the SCMI firmware correctly returns NOT_FOUND in
> response to the CLOCK_ATTRIBUTES command. According to the SCMI Clock
> specification, NOT_FOUND is expected when a clock_id does not correspond to
> a valid clock device.
> 
> The recent hardening added in scmi_clock_protocol_init() treats any error
> return as fatal, causing SCMI clock probe to fail and preventing i.MX9
> platforms from booting.
> 
> Relax the check so that -ENOENT is treated as a non-fatal condition.
> 

I understand the use-case and the fix here, but still wonder if this
should be treated as quirk or handle it in the core. I am inclined to
latter as reserved SCMI clock/resource ID seems to be trend in its usage
and hard to classify as quirks.

Cristain, agree or have a different view ?


-- 
Regards,
Sudeep

