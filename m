Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4289BC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4YERp7rCkWR0FwgtUmpj4e1aNXbGEWJTkuD46nopFqE=; b=bGEe6WvyVsEbW9EE47Ebo8cpqL
	g3QnVHZgBg8LBUOG/VecbxWlLupmi0LG1prBOmEiJFR7GihZrPqh3W91IIqo2PRU6vK+c0tDSdBQM
	DBxghs2aRBO8Pd58nYYqxLMk2HL0bk5bFXQyrZSJBBr7bLMzGX3gH1b+xlJ3V7mmWj/HV5muBHUz/
	anTT3LSGjXJWV2aEiH0agExEVzKH5oK0029gOLjHAALAAjy6A6/pQXg/YphEQHEF1BfUSSOnmr0qD
	WUwKz78GOrZD1xdZX5KqoAhkmKeEkz7XpH2R/WWQy+c/oaqV2G/BCSPqps0B2R6YXYCJikteN38P2
	UFT1ml7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tduKR-0000000B3eW-0LI2;
	Fri, 31 Jan 2025 16:57:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tduJ7-0000000B3Tu-2kI3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 16:55:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 052C5A41E0D;
	Fri, 31 Jan 2025 16:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0782EC4CEE5;
	Fri, 31 Jan 2025 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738342552;
	bh=9sfX6hltXIEpM8CfQHUqmXVgOqI4/WhaFSfB01kyVac=;
	h=Date:From:To:Cc:Subject:From;
	b=uzIiXLKgnwQQzh785A5uZb4CZPgPN+LhirEhwE9K3HVIzsGpVF43ppZ+r9vWaBEFT
	 sVHdBbQLJoal2Vo0RGDRVfo/7wnaMRiGFF3fsOKlUJg37AlNa5d5ou7GeMia1jhzeW
	 ufmZqOWTxT9CFiMn6Gn+/E7uGMJl5Qzo5hX8CJbKcpyHJLqvImiPagokxHGGLzRxB8
	 +1S433Ca5pEaR+Cht09spyWis2k+QWhU0R+MNJAeDxRm6n9J+S5fa4c0kHnzddE3Pw
	 yw0DFFbI5pBWTkc95gHenWvLTcfdBTAVGoTgHHxp/HqJNpZHQxn2MuJb1+4jOpN9F1
	 lQch1VwbARJsw==
Date: Fri, 31 Jan 2025 10:55:49 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: wait_event_timeout() usage in decon_wait_for_vblank()
Message-ID: <20250131165549.GA684322@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_085553_765744_75AF1551 
X-CRM114-Status: UNSURE (   7.11  )
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

I don't know this code at all, so this is likely just noise, but the
wait_event_timeout() usage in decon_wait_for_vblank() looks funny to
me.

decon_wait_for_vblank() waits on wait_vsync_queue for wait_vsync_event
to be cleared.

But decon_irq_handler() only clears wait_vsync_event and wakes up
wait_vsync_queue when !ctx->i80_if.

I don't see any i80_if connection in decon_wait_for_vblank().  Does
the wait always time out if i80_if is set?  Is there some reason we
don't use decon_wait_for_vblank() at all if i80_if is set?

Bjorn

