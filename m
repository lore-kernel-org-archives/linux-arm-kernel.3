Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C8EF4645E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 12:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrpGwU7qrBLflsSEF7JnYoUZan3t/CY9j9+fProo7sk=; b=1r7jVq1o6cke5RbLSPFOEFLfii
	UmG/jPTOI/e+YRhtc89iTUSxhl0sa2djWXhudN2FCODFM6vUsuLLKnQYyRhmYgmSaaEaX5Fw7jYn5
	dYbJqqUBL3HdWOTnaT+8bei1LD0dudLNB+xa6Q4kdvPtEUIYK4xWJ0dW2QfrOKnDC4llmQM+KUvR/
	SPd+SeSEOf8YyzjyVhiywmkfHGj+x8TuByjab3Y3PER2SJfd13NtmqO8QYIvLoRTHQYbplxBN4gFo
	uRepvq98pinS6znjCuifR0A2oh1skL1kacI59h3A1cKmSWy1ThaEv1X19iHxZI2fdrKJYagOtaoTI
	ONKuhKHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26rh-00000003wSI-3jL5;
	Mon, 16 Mar 2026 12:16:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26rh-00000003wS0-1H4h;
	Mon, 16 Mar 2026 12:16:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4E5860008;
	Mon, 16 Mar 2026 12:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2F9C19421;
	Mon, 16 Mar 2026 12:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773663367;
	bh=SrpGwU7qrBLflsSEF7JnYoUZan3t/CY9j9+fProo7sk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=HrIPuqZYfyTJ3andYiQHAdrtH8kzZiFG88qcY+ELNkubu62Llcr9ZVZFNtt8v0qcq
	 RdlmnW5kd13VgRJROzamTV4kVbEOpBIN+ie8hG23WgnPFaq2M2pEySYvGTIDGFajnv
	 BISB0DucckMfUh2TwOndhUCxeX7Wf3kFg019VZh0n/11vzhJQGPdpt0KAmiM1cDOwA
	 BrclieRQpNlS4YqrCF0pnU+kIy73105BFaog7ON9k+sQc0U0Hb5YJMCaQ5d7Fcmtdt
	 1G4Tf2gFbEIRrnK2lLUQxC9gqZGisd9Cy1tZbo0b0+WdIy72WidvN/EsnZvU8Zp09H
	 OSkKh82p8nEOw==
Message-ID: <86d314a03d1597390adb850789501cb9@kernel.org>
Date: Mon, 16 Mar 2026 12:16:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Subject: Re: [PATCH v7 1/5] clk: bcm: rpi: Manage clock rate in
 prepare/unprepare callbacks
In-Reply-To: <20260312-v3d-power-management-v7-1-9f006a1d4c55@igalia.com>
References: <20260312-v3d-power-management-v7-1-9f006a1d4c55@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Chema
 Casanova" <jmcasanova@igalia.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "Florian
 Fainelli" <florian.fainelli@broadcom.com>, "Iago Toral Quiroga" <itoral@igalia.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Melissa Wen" <mwen@igalia.com>, "Michael
 Turquette" <mturquette@baylibre.com>, "Nicolas Saenz Julienne" <nsaenz@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Stefan Wahren" <wahrenst@gmx.net>, "Stephen
 Boyd" <sboyd@kernel.org>
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

On Thu, 12 Mar 2026 18:34:23 -0300, Ma=C3=ADra Canal wrote:
> On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> actually power off the clock. To achieve meaningful power savings, the
> clock rate must be set to the minimum before disabling. This might be
> fixed in future firmware releases.
>=20
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

