Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C14AEB3640
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 23:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVWBSsCyek5kDiWlToVHMui4A2oLpZYjRFP61uW/p+c=; b=AIwfnZYI8JWW2ogOyOfYfebUO+
	cgmOg/4eCqQkupFjnY21ZC6/n4S3p1SGfsVFrfLdbTSoCde8UK92uChOQ/ENMEvwJhqh9wmx7Rqbm
	brPoiyt7/bpH9Nze12MbrEA7jzxcHiTLKCiH+EnYRx6c0qaociAo4SFO4WIlJicM2nBPhlExvW/lw
	1ghq534hS9lQnqzQkluENI/9EN8gf3kodrmTkPeQ6Ao0isnqHdLuqUtW+zEGYlZ8Hbp+hd9bbN7Fl
	BTJQN9g7kcEyHWbS3I7Zwy0goQPQoLaq6CmGfHDCzL3zVUaSeXHfjkikbeqbXFjCDJaM+Qyo+OT9m
	kiHxS+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCto-0000000EDTs-3DmW;
	Mon, 02 Mar 2026 23:42:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCtm-0000000EDTR-1pTB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 23:42:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6411443D83;
	Mon,  2 Mar 2026 23:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B8FC4AF09;
	Mon,  2 Mar 2026 23:42:00 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 3710F181258; Tue, 03 Mar 2026 00:41:58 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Michael Reeves <michael.reeves077@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>, Joey Gouly <joey.gouly@arm.com>
In-Reply-To: <20260217-b4-macsmc-power-v7-0-4a4d63664362@gmail.com>
References: <20260217-b4-macsmc-power-v7-0-4a4d63664362@gmail.com>
Subject: Re: (subset) [PATCH RESEND v7 0/2] Add Apple Silicon SMC power
 driver
Message-Id: <177249491821.606802.13655015043720076680.b4-ty@collabora.com>
Date: Tue, 03 Mar 2026 00:41:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_154202_521328_8C326F12 
X-CRM114-Status: GOOD (  11.99  )
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


On Tue, 17 Feb 2026 21:47:24 +1100, Michael Reeves wrote:
> This series adds a power supply driver for the Apple SMC found on
> Apple Silicon devices. This allows the kernel to report AC status,
> battery charging status, and power metrics, and modify the charging
> behaviour.
> 
> The first patch adds the driver itself, and the second patch wires it
> up to the MFD core.
> 
> [...]

Applied, thanks!

[1/2] power: supply: Add macsmc-power driver for Apple Silicon
      commit: bb7cd531f275cd643da6f26af0a25acdef6f26c7

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


