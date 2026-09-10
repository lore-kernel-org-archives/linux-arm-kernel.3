Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777EDC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3XsBirz9OWD8wxGJkEUU97/T5rMCjKQL5F2/+Kyzn4=; b=EeRhQSORfizBVAm3uLSTMW62In
	bLNWFbEcPhTronRyxOGf285KEqZbZciJ4lxANNwi4/4jYazOHIGk+bkk0FQ8dZDTbWy66KXQDSzbF
	XrGnvTjcNyTbGtuPJI6TkYnvBegdHvqMjhYRuEX6lPnKgMuzYDAD7eJv9rtxHfSe8TlSgThu/cwtX
	gWWX87f+jmH7tnGJiBG9zomrfgeWMDHgH7IzMUiI7h+HWuDgpxFcvgFDcg4n7g2zTdIbvLgP9uXbr
	er8vBsEaS6QTfyQB+OJ2yI/gsoCM7QX3H8XfhyKNl0tM0+CYEFMJ6e2ama1rIL23JdDy7gRvj3K4o
	mlljquMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g8R-0000000EgqM-3TNZ;
	Thu, 10 Sep 2026 14:52:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g8N-0000000EgpP-2hVx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:52:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 08EF9406AF;
	Thu, 10 Sep 2026 14:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BA51F000FF;
	Thu, 10 Sep 2026 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789051934;
	bh=p3XsBirz9OWD8wxGJkEUU97/T5rMCjKQL5F2/+Kyzn4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fAxuq2KHHppscY4WjUklPWJypduF1+x+nenA1H4pWVi9MXtyBKoMz6Nt1KnUUT+jt
	 xfpGg05LPRVLjxgWuV9M2IaM78gx81uRPq1xqvWmXUlNTu4TOJWsHCVfuEClKtrAJ+
	 Y7/VLs2kSqRuFu8Q+d5iafy/NEf4SJpgSoFuyH9BbEu/kcP7fU/cXlg/hhRtRdt7vO
	 5+irLpBDFRTb2biEa6AxvqlVTm0xBYrpnQcdBZo9mwuE8m8B7wdS//31juX3bynSL6
	 Z+xaTOgvLbwDjquNsLKXLXvqGSRks5ngH57ELsQrPSiWjRhfcWiGwo33K/vtGmS7C/
	 nCfT/1BycneNQ==
Date: Thu, 10 Sep 2026 07:52:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>, Thierry Reding
 <treding@nvidia.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: propagate PTP init failures in
 __stmmac_open() and stmmac_resume()
Message-ID: <20260910075213.1c9aff98@kernel.org>
In-Reply-To: <20260907-stmmac-ptp-error-propagate-v2-1-4a2e8e41e860@oss.qualcomm.com>
References: <20260907-stmmac-ptp-error-propagate-v2-1-4a2e8e41e860@oss.qualcomm.com>
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

On Mon, 07 Sep 2026 13:50:46 +0200 Lorenzo Bianconi wrote:
> stmmac_setup_ptp() returns void and swallows both PTP setup errors:
> the PTP reference clock enable and stmmac_init_timestamping()
> failures are logged but never propagated. When they fail, the MAC
> system time counter is left in its post-reset, non-running state,
> while the driver keeps operating as if timestamping were up.
> This matters for TAPRIO/EST qdisc offloading, which derives the EST
> base time from the hardware timestamp counter: arming the gate list
> against a non-advancing time base would leave the schedule permanently
> stuck.

pw says this didn't apply at the time of posting

