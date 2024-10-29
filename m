Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B3ED3A661
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfiQdLTsM4V8BHphb5DQhMwvFatwHGMvvsgf3NLzPQI=; b=I5SzR/PNzAqquEy88fXNTPewMs
	C/rtcZkRPoQbx13ivdASj4JuWpsRAqtTqsUoGhPqCq6PAVkyjX3kHvpaI5OjIPZzZLeX7IkKnJj6W
	6LMwhiLlN4Bmio/PKXhknpoWhMKF+h8kYhxHL8jAUb6DWPtaxnG0b+hcmmMTJtr+z4GzdcBZHaRm8
	R8f7RwXaeLejICG5ARD+477Z7zA2s8tzO75lcbOeSrvl5/b62FDERllC2S9OrgdwzktfZtCzApQOn
	G4rQ6Yvsv2LhL6bRAAN2u2iSx169z3WCQwhkUdE+lt9rxLtGcKHZdPiWb2rD0vJBDySEM3BuLe1Jk
	zCB3QhYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oni-0000000F4b1-0aVE;
	Tue, 29 Oct 2024 16:10:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oR9-0000000Ezge-2X3f
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 15:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sfiQdLTsM4V8BHphb5DQhMwvFatwHGMvvsgf3NLzPQI=; b=BVaBH5KEYF6bcdAidQYTffHvfY
	i3sZc4cSHytNHqKfkDBi365FJQ09QY22SZz0fteDBEKPhWucRQmg5E/tDP10d0H7iNQWyJQuJt0f2
	7vkimD5Tm5YIqw8oKEJKgcfc9NgHhKSN6u3wo96dLKCid6a8jTW4kRa8E+C4cVx6hTWNO58WFAKZz
	u9mNgjAcHeGdFtNmUu2v063ru8//lQ8fpaL/upB4OpXbc4nlbeMzK2Dr76QhvT8lXvErg8FL47edN
	UrUsqzt1UgNesTLIoGQ5Zo1Jc8KUo8NJa7PZj7MxjGOprTOmaEOPx8NtaMeppZzWW2WVcwuAUvfC3
	g7/Rt3Tg==;
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oR4-00000009vpG-3Rqb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:47:14 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49TFl3ie017388;
	Tue, 29 Oct 2024 10:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730216823;
	bh=sfiQdLTsM4V8BHphb5DQhMwvFatwHGMvvsgf3NLzPQI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TLm6H5hssuGhsb5EOrHm1dSzGe222cwCNim5S2xlzlKu5OB+7Uc00jLgNhdN0WVbe
	 nEzYzUeFH4l20SIq4PI9+frK5WIw6x+gBhvEDgBY+BlnwP8tmnq2YzA/Sr8A9h3LT4
	 I52kZ0jFj/sBko1HDXlvUJF/h83EQ4D5tjmk8QJA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49TFl379018252
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 10:47:03 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 10:47:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 10:47:00 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49TFkufT082870;
	Tue, 29 Oct 2024 10:46:56 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <d-gole@ti.com>, <lorforlinux@beagleboard.org>, <jkridner@beagleboard.org>,
        <robertcnelson@beagleboard.org>, Nishanth Menon
	<nm@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ayush Singh <ayush@beagleboard.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] arm64: dts: ti: k3-am625-beagleplay: Enable MikroBUS PWM
Date: Tue, 29 Oct 2024 21:16:53 +0530
Message-ID: <173021674666.3859929.3387135730934868690.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241016-beagleplay-pwm-v1-1-245ae88859bc@beagleboard.org>
References: <20241016-beagleplay-pwm-v1-1-245ae88859bc@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_154711_407428_7D998FC7 
X-CRM114-Status: GOOD (  11.86  )
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

Hi Ayush Singh,

On Wed, 16 Oct 2024 20:41:15 +0530, Ayush Singh wrote:
> Add pinmux for PWM functionality of MikroBUS PWM pin and enable the pwm
> controller.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am625-beagleplay: Enable MikroBUS PWM
      commit: 1e5e2ff46294d3a712a4a54ede7910a193ef2c35

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


