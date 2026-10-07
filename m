Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB04CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 14:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73Rc7Xyk0TkvSBDIIvRfJgmkqJQeM9qYU791G4cfac0=; b=1iAWa6zBgmzQgeHcPlivJr+JIE
	95eDXv4QOjU2FdhY/vsrOkpQzaTZKQ9Ctcb+gcw/kon+8E8oVoFBEXUIB0PiYBGANAWp9nnrEUJT2
	t1HNRKfxSY9UUE9GJmheia+0dfOXGLR9Ascp7ND3ydMxSYKR60HwXyHEXbWLXfplfu92o/yB3nb7s
	NV9vkNQBNmIwIj9dqUjVvZJ7WowjWT0+xCP1MbJwsxqiP7QDPTWUnMSRZF0cvuGC0Ozjx//oKCDwx
	FqhHFvdY6xHOFYxQjQIXEOaBxQux2P/2rAMLf2tNsVoLXbMjs8zzJ5HA485ZzbYPzqiYGH+gxuVDk
	No9jhFIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xET1p-00000002esJ-0aW1;
	Wed, 07 Oct 2026 14:53:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xET1n-00000002esD-2Py9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 14:53:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 495E443E8A;
	Wed,  7 Oct 2026 14:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404881F0089B;
	Wed,  7 Oct 2026 14:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791384835;
	bh=73Rc7Xyk0TkvSBDIIvRfJgmkqJQeM9qYU791G4cfac0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GRmLCEJWGPpSBYJLSIU+dq9wowD0PK4K9IVCe2vkwWUzBnr92m8i+K9IYgX/EMb60
	 ykLvTt83o8zTFLfn4pY4Yx1xgQj76OQcBx425ZW24jW8Ar9RGwQNO/C7ZP2Kk1Sz76
	 p+wNmTflWgOvvY91FfkE+J1HHCR8Xd/ehgtzcqWlfS/cG9XccxH6LnkIa8Af1KAx4J
	 2K1MbDCOh2nywkQAUEcBTZ7GZO6KtIXIsDA7DErQDpYGDK3G3rZilFztlVSgquVOvX
	 lLQ0DfQoBKjAqHK8nXsRqH3MF8zAAGCkhqxIZ1LkPalKn2YgDtkFrWHfCQs/OHHNAG
	 aJQSOeMVlJm9A==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v3 0/4] firmware: arm_scmi: Some fixes to address conflicts with fw_devlink
Date: Wed,  7 Oct 2026 15:53:49 +0100
Message-ID: <179138477746.621195.11974347414199051085.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005-scmi_bus_fixes-v3-0-d9bada32ed38@kernel.org>
References: <20261005-scmi_bus_fixes-v3-0-d9bada32ed38@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 05 Oct 2026 10:53:09 +0100, Sudeep Holla wrote:
> Peng’s [1] identified the problem of multiple SCMI devices sharing one
> protocol fwnode. His [2] shows the consequence: the first device owns
> the fwnode but does not bind, so fw_devlink can leave consumers deferred
> even when another device binds successfully.
> 
> This four-patch series reduces those cases within SCMI. It prevents
> protocol device creation in exclusive raw mode, stops treating core
> created standard devices as driver owned requests, and makes the i.MX
> pinctrl driver match the standard `pinctrl` device instead of creating
> a second device for the same fwnode. It also omits the `perf` device
> when the firmware node does not describe a performance domain provider,
> without changing `cpufreq` device creation. IIO/HWMON don't have any
> fw_devlink dependency and having two devices shouldn't be an issue.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/4] firmware: arm_scmi: Avoid protocol devices in exclusive raw mode
      https://git.kernel.org/sudeep.holla/c/3b0c8dd5a8d5
[2/4] firmware: arm_scmi: Skip requests for standard protocol devices
      https://git.kernel.org/sudeep.holla/c/00e304131509
[3/4] pinctrl: imx: Match the standard SCMI pinctrl device
      https://git.kernel.org/sudeep.holla/c/685e05f664d6
[4/4] firmware: arm_scmi: Skip unused performance-domain devices
      https://git.kernel.org/sudeep.holla/c/59d22f7a4dfe
-- 
Regards,
Sudeep


