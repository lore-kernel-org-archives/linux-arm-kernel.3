Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DABC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 02:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VP/IQdT2nGS/s+RGboroFvF7fX6MZ+U9ZwH4o4Nlc4Y=; b=IoTfJJUqtLe7POPr/S85VE11b3
	Mm1Or8/SzNU+90PlZfkaVrvh6t41qY2qXqGjuH5uVijxrfFthXP2pt9pPjUdO6b0ftxvAwlioV4hR
	bGLsYYbbqmb6wdfrbaQSHfDpcI0yhYJATaWxm12fAxKIppsz3JQDyamdzt8srTW7+e95TteoF7rpu
	b8QVO8w2xGoia4I/SXOD4DsS/4fDnSNJBYvAqvNGXIqRm9gaMFJoF5CGg4fxvreL264tJBltyGbXM
	vWjIvu/DGQIW7P2Y2HKfDT2+y6pFLvtPkCkhsULjJanUvia7F1sCVP+LT6M3usSVCAAioGfySWFv2
	CnZpypIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKSqa-0000000Ejaf-0BgL;
	Thu, 29 May 2025 02:18:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKSoS-0000000EjMj-2Row
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 02:16:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98AC1614AC;
	Thu, 29 May 2025 02:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39DDC4CEE3;
	Thu, 29 May 2025 02:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748484967;
	bh=VP/IQdT2nGS/s+RGboroFvF7fX6MZ+U9ZwH4o4Nlc4Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iUJX5dXw3a9NowbtG9QFD71irkXCZh7CBN6jIJVPGflF05BtdPBfQWEAZFhl6G7Kh
	 DwjF6+Lyuc+vXaa6Y3SJ33rGHopC6CArMOeXebJjHE4mZpqLYZ0iOwxebMp8Cb/xGV
	 wmAUy1QJ0HnWG3CNveRLvaMCdP/LaBI1IKkdWo9LbTM1W3YiDS5MmZVBWkeuHl/HX5
	 6zJ0W5VPWgkj9M5Vi8tYn4gpUKGFHmeUJNV/ZMkWM0jQuDw0SzSBjCvmAVAGmIQOMH
	 66Yj8lsujPYS6EdiAY3NuVUkRsszgOlp4Tz90XeEIkgPPyrl83LcjrEhIkI+JaDBja
	 ltk+hdZUgSvsg==
Date: Wed, 28 May 2025 19:16:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, Phil Reid
 <preid@electromag.com.au>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jose
 Abreu <Jose.Abreu@synopsys.com>
Subject: Re: [PATCH v3 0/2] net: stmmac: prevent div by 0
Message-ID: <20250528191606.66034ab3@kernel.org>
In-Reply-To: <20250528-stmmac_tstamp_div-v3-0-b525ecdfd84c@bootlin.com>
References: <20250528-stmmac_tstamp_div-v3-0-b525ecdfd84c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Wed, 28 May 2025 10:29:49 +0200 Alexis Lothor=C3=A9 wrote:
> Hello,
> this small series aims to fix a small splat I am observing on a STM32MP157
> platform at boot (see commit 1) due to a division by 0. This new
> revision add the same check in another code path possibly affected by
> the same issue, as discussed in v2.

v3 doesnt apply cleanly. Could you rebase on latest net and repost?

