Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D1DC624CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 00:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myrc9Gil2RJrqCTse2ZhaV1wha3SGUMFTBi/a0DM/mk=; b=P+Xw1q0XsWmmwKJbfxj2xvvcm9
	7TYZnE9qBF6B6PQ9bJkFrHqKytJOhhBhXAp5aQf/j3nJ+TVW1Q/KqJrzruzpRfAAHsDCCiGbZwOqf
	w2gNuUue7GiTvCqOv+l8dY6DUPwehQGTKOJg41V6NmqsLxMNGWTHS9pPaWg12p7/aeGsstyfW7D0M
	8/GjjLleZeZu8H6CUL1WeQMJhRFDCfBWsPP8GsSfdcAolMeabQa4WP12HLQ3P+zPN+x4xtZ/0rEAk
	UgHfjhH6d3Q3PRdxMkSec+4Nn61kAaOQzWjAu2nd/F2Bb98Itw6kp42KZVmWKedHgqXuByalITv3r
	pPs7pB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1CKi-0000000AiqB-0q2M;
	Tue, 01 Sep 2026 00:26:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1CKg-0000000Aipr-3Fn9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 00:26:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D97C2602C3;
	Tue,  1 Sep 2026 00:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5741F000E9;
	Tue,  1 Sep 2026 00:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788222393;
	bh=myrc9Gil2RJrqCTse2ZhaV1wha3SGUMFTBi/a0DM/mk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=czZWZeIxlf3GT6/1dh47dSkMckpF0/fGbH+d4J4dghB10s7jtVgZl3KdK5FBfAi3C
	 7l78CVIMF+dyf9/SlsZE1QmM3loIj4F8aM3wzjaDeirj0pV1u1co1qwkhZ8gWFbx/W
	 O/nplxd2GNTF+gIpKW8eZq9i8Dk6pXKDtsbgTtxDyI+80PaJ7Xdcs+ZUD2F7kWmFeO
	 3GjvM/klpJ0sxk7ttC+4PLO9VpX979BvyZJ2HIEpweA3X49sBSVqHrJrVFatbm85nk
	 pRh8jXfo+22Xp7K5iTUQgJpzxP/VmFR73iDoeb+4h4Ku1wHyNAwqsD4kKbfDEicmsY
	 yQsk/qt1Yn/jA==
Date: Mon, 31 Aug 2026 17:26:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v2] net: stmmac: hold runtime PM reference in
 setup_tc
Message-ID: <20260831172632.64aadc2c@kernel.org>
In-Reply-To: <apWVBrXNt74gtUd4@lore-desk>
References: <20260827-stmmac-setup-tc-enable-pm-v2-1-a9b8a5948f41@oss.qualcomm.com>
	<apWVBrXNt74gtUd4@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 31 Aug 2026 16:51:50 +0200 Lorenzo Bianconi wrote:
>   - This issue is not introduced by this patch and it needs to be fixed with a
>     dedicated patch

Looks like the driver has multiple bugs in handling of TC callbacks
while down. Please fix all of them in one series, otherwise we may
end up changing approach.

Can you also confirm that the device programmed while down retains
all the necessary configuration thru the open path, and everything
works as expected?
-- 
pw-bot: cr

