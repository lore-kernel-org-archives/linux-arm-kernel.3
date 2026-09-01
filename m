Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC204C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 20:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvTXiWu/bItfCARpRA0b3rATqvTSL8ODsEPyVemaOF0=; b=wutHEogHTKO21mP5S7ytl8a0t0
	FjVrBRrn5AyYT9ptS5yJA6yGRRJ8Ffy/ZwBUzA/WEP9yZho5BSbb6dgvCxxir7TFUKHmFZEDN2iLV
	BjziqyhX6fM1n2KO7gcEU1XbMnstNjLXgcXy5+GV6g5cL1R6XpBxO6OzMKTbrWNEhIMpneBAZJKIo
	ooC4uuURE/Me2J4IAqz8KEasQ8cWAsAXZxSpk54oQhg5h1UFZKXnEqIVLwOG+diPyxVi6/oszIar/
	Wcd+TRr5IuC05KRuIF08GMDybJvBMdBkrTaAJu3JCSyqUwna95qndWtH/aTajKOqhEJXIMt0Kh431
	1xhxajvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Uq1-0000000DIcl-129S;
	Tue, 01 Sep 2026 20:12:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Uq0-0000000DIca-0BG8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 20:12:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BF696022E;
	Tue,  1 Sep 2026 20:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543B81F000E9;
	Tue,  1 Sep 2026 20:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788293526;
	bh=DvTXiWu/bItfCARpRA0b3rATqvTSL8ODsEPyVemaOF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WM2N7lrjPxJ1DhG0v9z4XllQeGB7wDmCo9H5eQugxtozEiOiK/XKhjDtgeSTFCM/h
	 hDj8MvkL0bj7/UyK/C4l/2bIK9f0J/lZh8Y96EV4fs8GInMi+dUrElML02gGCBtJaX
	 nanKfArkiZIQnGx0gInO4JS26MsZqc/iG4DZSt+ipx3aRO5pIXm9a8F054cZI9t7AZ
	 dG/XhLpx3xeZIV4/bP/PvrKOogxatb//m8ELpkuDdsYjEoTi8m+7aAlq6hfENHq1DG
	 NRkbQYDEIV4gMD50NuxmYpW+yk5Ei3v0FUBy3D3cfdEPCEOpyWLuh5+wnIRn3NimoG
	 HsicGnEIfLyzw==
From: Sven Peter <sven@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: (subset) [PATCH 0/3] Enable shared GPIO for Apple Silicon audio support
Date: Tue,  1 Sep 2026 22:11:37 +0200
Message-ID: <178829346733.46626.4826048578689802871.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
References: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
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

On Mon, 31 Aug 2026 21:32:38 +1000, James Calligeros wrote:
> On Apple Silicon Macs, every speaker codec's software shutdown pin
> is connected to the same GPIO line. This line must be pulled high
> whenever any codec asserts it so.
> 
> This makes power management impossible. When we goe through the list of
> codecs and call each suspend/resume, the GPIO line is asserted low or high
> by the first suspended/resumed codec. This causes issues for the subsequent
> codecs; they are already shut off by the time we try to cache the register
> state on suspend.
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/drivers-7.4), thanks!

[1/3] arm64: Kconfig: Select HAVE_SHARED_GPIOS for Apple Silicon
      https://github.com/AsahiLinux/linux/commit/a416a347931f

Best regards,
-- 
Sven Peter <sven@kernel.org>


