Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCBB109C048
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 17:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/4H+DiadOiRTmHuIYarcBMDL9Ll/NZemGNAQE+FIEk=; b=TKWdLgizyyU02aPyXueeugCP6j
	gqoj1aLwnSjV/3kXnQJjmxFYzcG/v9fTmbEVkM1AmKkmonwicWIrUreGL02CYNCc6opHDZc4dJpxF
	fy1+GT+UNon0I9ETB0H/XCrndmtb0p83nEilbJ7PGBHWmXHRyjCqG0SPpU9G14HqchvLqPIPcxSH3
	xmd8P4npQqJ1dbphEAb8jd16SreN6yUHttIPET9rzzFibGObT2zzWpoOiD3TQI+NrC+38aPlKho0t
	pKZfX9pRGGQPZ+vjAUu1qdKUe9oEvB5sw8VyMFPup1MOhq2rVVTtM1K7Z1xEMJYsbGHKSqxvb5viR
	VC4PrRqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Rrp-00000003yOy-0F0s;
	Wed, 25 Mar 2026 17:18:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Rrn-00000003yOs-3dd4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 17:18:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0786460123;
	Wed, 25 Mar 2026 17:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281C8C2BCB0;
	Wed, 25 Mar 2026 17:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774459082;
	bh=cFS0jVgZrx7xu2C6f50P2frIPGlrT8eOzJuFuNpwFjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IcX6HqEa9DILb3F2zUR/6AhM0A/9PKp4cV3eA9+fWgQ8wT+lQxqy0PTE3FfiypTqH
	 kBadxVFjuUA6toZFjYMdCn53aBHhdTO597fzrhBxuOE6/rZeeF3a7Y2EKJYa/LoRR9
	 ohKbB4ztRSpm4likC02IDT8SHbff4ssAecKdQZZkWaWY1yaVsezERg+tOS0qh2A26u
	 7ExNBYswAZTmtZiZthye+wrBnmcKgAGkFK5mgc/AQE6BaaaVSb1wIqBm5xNjw5ciWl
	 PNWZBbkTPlFhL99q7kGVlsvVExGHf7KrsIUjvnYUNIYGQ12Z9U93LxPBckW0aJDnQb
	 22v+ZUU+bbFCQ==
Date: Wed, 25 Mar 2026 18:17:58 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	stable <stable@kernel.org>
Subject: Re: [PATCH] i2c: s3c24xx: check the size of the SMBUS message before
 using it
Message-ID: <acQYnURilS0_fTvS@zenone.zhora.eu>
References: <2026022314-rely-scrubbed-4839@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026022314-rely-scrubbed-4839@gregkh>
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

Hi Greg,

On Mon, Feb 23, 2026 at 06:05:15PM +0100, Greg Kroah-Hartman wrote:
> The first byte of an i2c SMBUS message is the size, and it should be
> verified to ensure that it is in the range of 0..I2C_SMBUS_BLOCK_MAX
> before processing it.
> 
> This is the same logic that was added in commit a6e04f05ce0b ("i2c:
> tegra: check msg length in SMBUS block read") to the i2c tegra driver.
> 
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: stable <stable@kernel.org>
> Assisted-by: gkh_clanker_2000
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

merged to i2c/i2c-host.

Thanks,
Andi

