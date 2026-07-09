Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F63FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsqWHUD3fknq6kvMOwmLLRy83GwDAJJfDfHuuECn8nM=; b=epR/82pA53NQ2J3pfZWL9oMGX3
	DGrGOnMspjXnmPYrZkVlzkgvtz9bK0T9qBkk0bKVkensYPN26s++T0XSTC3hE4tcgbmrvCfKpkTvc
	SzL5LlvQyNmHq/7TIFEm+MkunFKsIkgRRMbntmNI842PKy2dldGkGTYkdSJYdHNqp4ADY/l+GPkWd
	UogHpNHDswnSQrKpRFS0+/O9ouVuI2EYe/UgXujlEQmJfhhwoj9b6o4C+FzPqto1bkH5snfLyP6i/
	lfui3X96He5oT5/rnG9IB7PhbxkQmpJR58Yd3fSQZpDEDJf6vmvpY8c9zt/JQOV/ZjQv9N/G9X9D8
	JEZEW6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whktI-00000001kOI-098k;
	Thu, 09 Jul 2026 09:17:56 +0000
Received: from mail-106103.protonmail.ch ([79.135.106.103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whktF-00000001kNR-2iw4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1783588669; x=1783847869;
	bh=AsqWHUD3fknq6kvMOwmLLRy83GwDAJJfDfHuuECn8nM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NOdoSogqN9Ttm5QfIS+N4RKsilr9voDeQP0u6TF7B6VrOVbUItIv3Teyj/xgNfWwS
	 5vL1lVjWDKQc9maV0a0BNWi86CbbRoH6dUujnykoI4hl3Q1UiiSciKITJwMWKGrwWL
	 HcBCdbAV9AqVapiduJ+dx1KZVrpZcadK2vo5NAuf9Dfp4t7mrjALM880PnPMFkVqxs
	 yD4dSpQNlFXwXJee2Ed4I3ym0CfcqUzcYMYKcoZyh1VYqxHf/NS+9iGfH3nBwqetIQ
	 Ak6hTkFb5E7bS/rRCAKYIiG0nlCmmy6zjPUvbFtrsmJIohVVamvFEKp0LjXbCuly0/
	 P3CwOWp9c+LYg==
Date: Thu, 09 Jul 2026 09:17:43 +0000
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, rva333@protonmail.com
Subject: Re: [PATCH] i2c: mediatek: fix WRRD for SoCs without auto_restart option
Message-ID: <G11ljKsJ1-XZySyKn1d9mfw2Wwr4ip3RpX5HfqIPp0602tRxHV-1SG2L0VCEJHfEQ3WDlJ41vjMgd6Dy2ktSTa-QIWuE7RGkkGpVIYwtd0M=@protonmail.com>
In-Reply-To: <20260624-6572-6595-i2c-v1-1-9155cebaae20@protonmail.com>
References: <20260624-6572-6595-i2c-v1-1-9155cebaae20@protonmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 12ce95e755351267cc6fbf3031b57ccc2bbe842d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_021753_842254_F1B2406A 
X-CRM114-Status: UNSURE (   3.99  )
X-CRM114-Notice: Please train this message.
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

Hi everyone,

Just sending a gentle ping on this patch. It fixes broken I2C
functionality for mt65xx platforms.

Please let me know if you have any feedback.

Best regards,
Roman

