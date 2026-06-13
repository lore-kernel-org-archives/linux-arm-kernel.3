Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B900CD98D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 18:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gF727nZWftSXwKewt3391E5lZl87wD+IcPkpef8dLKo=; b=q4q1kii+9ub/0yfQGwUkwSdn+b
	tXLa0od7zM4phVvlc0uLKbrF2VcpifyawvoBBJXrqByfy8AltbweqhycGztz0gCy7/e8ZvNcA3I5e
	gbUjEEEqammhDOLu1rjB4TrUr2Hj2bZQM6DIKH8iVJ1ZnBkJgHhKE0SGEssCWsO+xYW+rq19ehUPI
	+IFdIcV5Wzgws+TXhPwLn4TPHOTvtJbMIkN6Jbh3er74e+R/TNUlLVQzSpG4eaIAuvLaGcWi0qIx8
	vKnFtmDoFtsKGr2vH1+wNdJR4Lt+GIXiUwXq/PbRfdKkBXV4rW6ZsimJM/g2SqhWFjct8WtxC1LEC
	8UjI4e0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYT72-0000000CTrT-0jDh;
	Sat, 13 Jun 2026 18:29:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYT70-0000000CTrL-3ToQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 18:29:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BCD643FA0;
	Sat, 13 Jun 2026 18:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13E01F000E9;
	Sat, 13 Jun 2026 18:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781375382;
	bh=gF727nZWftSXwKewt3391E5lZl87wD+IcPkpef8dLKo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Tu862N2vey18lzZiVIY/QTNjsaZBal0RR7RihTnqySWxoBrIMd1TjUVkkUDUZwDat
	 ZU3fZZExDDkv/AbRRxlGUrkbjZgbF4sNfOnc/SjM+/kXM4S3rN7Jl2mzclMSQCW3fy
	 RrnvTs+gPHbXqlznjLp4srmnWmrdphsSg5TjCXU6PL/FWYO7BN6tnt7HfQeHv9nhjg
	 Jt8S+ivOUZiLUTzamQocQ1dyemo2dpLKW92K7OUkallGqUg5M2yVWnlUFfIcIOdJGb
	 TFsGoGjNknkpFTeK7DEwKrNGuU4YVylQQWrc1iiRSG8SqOFD3GAENhN7arY4WwRljl
	 0c+O1/WJJ3+gA==
Date: Sat, 13 Jun 2026 11:29:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 sdf.kernel@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 luka.perkov@sartura.hr
Subject: Re: [PATCH net-next] net: sparx5: change ndo_set_rx_mode_async
 return type to int
Message-ID: <20260613112940.05bba5ff@kernel.org>
In-Reply-To: <20260611101151.426050-1-robert.marko@sartura.hr>
References: <20260611101151.426050-1-robert.marko@sartura.hr>
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

On Thu, 11 Jun 2026 12:11:13 +0200 Robert Marko wrote:
> Commit ("net: add retry mechanism to ndo_set_rx_mode_async") changed the
> ndo_set_rx_mode_async return type to int, however it did not update the
> SparX-5 driver.
> 
> So, simply update the sparx5_set_rx_mode return type to int, propagate
> return from __hw_addr_sync_dev or simply return 0.
> 
> Fixes: d90b85c23b3d ("net: add retry mechanism to ndo_set_rx_mode_async")

This commit does not exist, as I said in:
https://lore.kernel.org/all/20260507091012.7eeb17f5@kernel.org/
the first two patches of that series were _not_ applied.
-- 
pw-bot: reject

