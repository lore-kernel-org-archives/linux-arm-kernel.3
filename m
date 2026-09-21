Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A9EC982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 08:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMQoUbFbkBmtg2Op/ssogbW7S871P7MvOsFe4ikx5pw=; b=Z1lE3dyTH2qCUyuo86aQyhzQ7k
	YdD2dth1SqWTOtKaofUC5VdjXXAu4ZR3SAESKbS9SNmGmCGIOY9ssNGG0IcmmjtLiOIRjw3Jiyzgu
	IHbsacymwjiK3tZ2Kmu1hfznM32buT4lTZdTEmm/zyFuPhRHT5XVoPXVKt0rfSoYkIVkrerKIrVwO
	maFarbAWU6wwZ0lCgVJIR1gZcwzIxyc8ZcCfXgT2rdBP+OQqdexHy6gf37kp6008vPuu3sdwHv7Sy
	4G/T0IcIuw4Te6Erv+BJ8zahdu5JWLcvSuPf38gTVpkYaCBZgOYANv/q8Ej6rPHiSBzlmhKPOYjw6
	RNXSFujw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zce-00000001NlM-30mg;
	Mon, 21 Sep 2026 08:43:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zcd-00000001Nl9-3KYw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 08:43:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3847A43ED1;
	Mon, 21 Sep 2026 08:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3631F000FF;
	Mon, 21 Sep 2026 08:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789980215;
	bh=kMQoUbFbkBmtg2Op/ssogbW7S871P7MvOsFe4ikx5pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mILJ6K+/4ifQWXrg46EePjbXVwCVVBln1I3gCIIpwWmKkdN0eUKdRIQyvWulys4iz
	 3I+CsOokgKWic5PEpnTGd5C1ZYgzUqTjd+jyICJGcHP7Wmfcm/6Qh20/gEwq/Pg/Uy
	 gw6jE/RQva9tBf/RPRv8GjMJGxOQ1e/WPGk/Z+L8HYcf4umTCfIAL/vByuTQwpoSlJ
	 HYa4OyQ9TsdpHR5b8K7ptXwufSOr6yIJBhREVTj9IUMKD+s5AW+/PuBvSKY7Ir5zZB
	 IEMWt/pxaYs/lPJxhmE+xtNBQsCjfxWeM58OLusdaTx56koqRHmk2bCiDvF8iVOVBc
	 SyXXt0nrpJkrw==
Date: Mon, 21 Sep 2026 10:43:32 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] i2c: xiic: preserve PEC byte length in SMBus
 block read setup
Message-ID: <arDgdyG0QsNerDH5@zenone.zhora.eu>
References: <20260909-i2c-xiic-v4-0-218df31e9d3b@nexthop.ai>
 <20260909-i2c-xiic-v4-1-218df31e9d3b@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-i2c-xiic-v4-1-218df31e9d3b@nexthop.ai>
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

Hi Abdurraham,

...

>  		xiic_read_rx(i2c);
>  		if (xiic_rx_space(i2c) == 0) {
> +			/*
> +			 * If the setup path padded a short SMBus block read up
> +			 * to SMBUS_BLOCK_READ_MIN_LEN for the HW exit
> +			 * workaround, trim rx_msg->len back to the number of
> +			 * bytes that are actually valid so the SMBus core's
> +			 * PEC check reads the right index. Must happen before
> +			 * the rx_msg = NULL below.
> +			 */
> +			if (i2c->rx_msg && i2c->smbus_actual_len)
> +				i2c->rx_msg->len = i2c->smbus_actual_len;

We do need to reset smbus_actual_len at every xiic_start_recv(),
otherwise this would be true for every rx_msg. Right?

Andi

>  			/* this is the last part of the message */
>  			i2c->rx_msg = NULL;
>  
> 
> -- 
> 2.54.0
> 

