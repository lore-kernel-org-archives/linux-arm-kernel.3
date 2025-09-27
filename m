Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298D5CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 00:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJMrzmD5MFJD4MGOjpCyk4PwB1/vBYtNRNWCCwJXMj4=; b=WaGLk8kg/XQowb1nOr4LyfVjKA
	3M8bFUeWqLjMdPu5UyKuABcQIT+o6Y2wvjYkEzC+UF5QsHD2SS95MGCL4Mzcl+Q7oAoi7cNopif/l
	caIsBppPmWF6kMH+vz5sbFop75JryrQ0gr3xiZ11PP7fPa+NMEPc1Niwu5zSrBsezZSi8f/kT9i9T
	daLxTfOq5WMkDKrgmhlPlln7mocJlk8vn/1TKbzv8TBEzanYk8h+6kfoPmvb0V65f/EyoysqBz6iY
	OJGV4MN+84SCzImgbDQjXsgdH9L5j68aedOCXd+/dz+lSPqcBB+Ii1rGbfdAnellrcUOGn5e/a6iR
	8OYel+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2IlV-00000005fkD-1SzP;
	Sat, 27 Sep 2025 00:26:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2IlU-00000005fjP-07be
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 00:26:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9719061FAB;
	Sat, 27 Sep 2025 00:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A27C4CEF4;
	Sat, 27 Sep 2025 00:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758932773;
	bh=ldQkQDaE7kzwJlWbrIdbMhU3peP+xUqWXqOsC0kAejY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bJmDaiJA3Sy8PeR9f0QUdQK3FN51BDqZafta3nVKF/8ArMCpUJyzulo+fcR6GHF1X
	 D2dFWz9JPOHN2yUo7K1owfpk4OOiVicLQ1AI6T7vC5lakv6jYXe8hDY7FVcdGxqRk1
	 rI/WWrwib7y1xCQTcHiBh24N9OzKd0Vi1JpOIG+GSIA6B1JMQn7TytisiJdZbmJK5y
	 +0M8K9eSkfj5bxCR7RBrnFbgzPQBXMreZN8ywTTYUGpM7Pm5WPnFZv3KTkv90b0Kvc
	 mTXgvW/6DgXEuambGU9TFbYw0xy1ZZgmm95nP5+0i8/roPnOMp7BiQ1+wD8DD5V+rB
	 5JNNKW+YlNSyg==
Date: Fri, 26 Sep 2025 17:26:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, xfr@outlook.com
Subject: Re: [PATCH net-next] net: stmmac: Convert open-coded register
 polling to helper macro
Message-ID: <20250926172611.32d60205@kernel.org>
In-Reply-To: <20250924152217.10749-1-0x1207@gmail.com>
References: <20250924152217.10749-1-0x1207@gmail.com>
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

On Wed, 24 Sep 2025 23:22:17 +0800 Furong Xu wrote:
>  	writel(addend, ioaddr + PTP_TAR);
>  	/* issue command to update the addend value */
> @@ -144,23 +143,15 @@ static int config_addend(void __iomem *ioaddr, u32 addend)
>  	writel(value, ioaddr + PTP_TCR);
>  
>  	/* wait for present addend update to complete */
> -	limit = 10;
> -	while (limit--) {
> -		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSADDREG))
> -			break;
> -		mdelay(10);
> -	}
> -	if (limit < 0)
> -		return -EBUSY;
> -
> -	return 0;
> +	return readl_poll_timeout_atomic(ioaddr + PTP_TCR, value,
> +				!(value & PTP_TCR_TSADDREG),

Why the strange alignment ? I think you can start the continuation line
under the opening bracket and still easily fit in 80 chars?

> +				10, 100000);

You say in the commit message "no functional changes intended"
but you changed the frequency of polling from 10msec to 10usec.
Seems like a reasonable change, but the commit message is lying.
-- 
pw-bot: cr

