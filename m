Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88451C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 22:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpxN0FnXQxciyH3X5jwUMqfgxSpDRQfoW65Rb7MG9Y8=; b=uelCHynH75DuHtADQArtC3JBkU
	aUpkkILJ0c1IrARt4DRsoQJ3cYrsBALaIg1pEi2RIdwtHjfos6XGNaFX0M38gBQlt5RSd7DbVncmH
	YrQ98aqX3v0kGuRlJRqw8UNJ+9Wbt6W9XRi4UCZXDnnPrPK6RlZqqFOBYJNo+D2lsn+qbboBGAVH5
	IoUOMrseiMuFsOIShPA9w8MpCLT3ROio4TaHXJHZPQIsftAatIaopA3qAV3LM95Iuq2HRpTRyLE5O
	MwipUSS6kUY/eEoBgeW/erJKyNX9DToV2tF63jQqteIMjKzo9hEgViYg4mmFDZavh7hJykqjebDhQ
	EMGFE+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAGB3-0000000EBRc-3cLj;
	Wed, 30 Apr 2025 22:45:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAG97-0000000EB8c-1Z6R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 22:43:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 353A668496;
	Wed, 30 Apr 2025 22:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9321C4CEE9;
	Wed, 30 Apr 2025 22:43:15 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id D2547180F6A; Thu, 01 May 2025 00:43:13 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20250401-syscon-reboot-reset-mode-v5-0-5b9357442363@linaro.org>
References: <20250401-syscon-reboot-reset-mode-v5-0-5b9357442363@linaro.org>
Subject: Re: [PATCH v5 0/2] support Linux reboot modes in syscon-reboot on
 gs101 (Google Pixel)
Message-Id: <174605299385.111219.3051568976508089270.b4-ty@collabora.com>
Date: Thu, 01 May 2025 00:43:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
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


On Tue, 01 Apr 2025 11:11:01 +0100, André Draszik wrote:
> This series updates syscon-reboot to support warm/soft and cold/hard
> reboot on gs101-based boards (Google Pixel 6 and Pixel 6 Pro).
> 
> Linux supports a couple different reboot modes, but syscon-reboot
> doesn't distinguish between them and issues the same syscon register
> write irrespective of the reboot mode requested by the kernel.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: reset: syscon-reboot: add google,gs101-reboot
      commit: 1495c1aa4447f64c1e2209a95b201cb6452bb775
[2/2] power: reset: syscon-reboot: add gs101-specific reset
      commit: 8c7cf0fc8cf5f5dee66d767655e06e190e6f2881

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


