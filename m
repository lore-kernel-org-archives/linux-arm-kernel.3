Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADBEC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 20:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hs0BCzAcMdmg/2IuD/yqkyZ4uXNT7Lvbg77vbPufmLA=; b=hnvoXcw/ntl1vYebGZmhWJNUay
	Kx+LFdVvQ/Rl6icJ3r/KZCgOy0XDbj1fN5hB5HetZuxs2wPovmFzw7gQMewLUIxVgpUfg91Wk9xbV
	nWEU5HB64pB9NFCPUKJVLlTKMSb0nGbCCe6vLeYcB5WwJ9aTLO1AtwPnZrqNCG4HqNUunfdLTp58i
	YzRssz9bXO5hPOs464Embye2UTrFwuvprTnhHbIxXmCMplxRM/5GeXwXMp2mxD7thzCqqb99mMmRV
	yYtcDzT9KvsxiK732iTrTPAirbU8rJAHdLYTpZKuOt0+2tG5NFNcZEjhD4PCSWMfroHVp40dgOAnh
	ulZYdUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pl2-0000000C6wf-2DGT;
	Thu, 24 Sep 2026 20:09:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pl1-0000000C6wU-1Fn1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 20:09:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BE3CA600D4;
	Thu, 24 Sep 2026 20:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0CB1F000FF;
	Thu, 24 Sep 2026 20:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790280566;
	bh=Hs0BCzAcMdmg/2IuD/yqkyZ4uXNT7Lvbg77vbPufmLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=THlq8f9Hl62x4ls2dnUjMGhrSNes8l8s0YvvCZd69ctiIPvfrl84s8BWLONgNX3Om
	 Y41uD0ZJup5HtZVPKuEDfPPu16HveN65LgndtH65a4N4x9/EOZ1Kf5lgI0wpV3I13L
	 YUeKarcmAO4vivCopo0vV7/kwtcC8YVwax3AtlZFgL9vbnOuYpf/kVujCdXf4lWWQJ
	 VC3YYrUN6B8YbxWlIo4ZQCm2iM0DbKmp0/QE+djN2MPei5KkNPvF0XxRr4/9yZw1Wx
	 cEjg4pJ2zeS2rxkUFCo/TzENjw9LOf5PuuOuWc/DB6GyJGA0qu2UzmZM+YvSAMRy4B
	 NLwNNMuZei1vA==
Date: Thu, 24 Sep 2026 22:09:22 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Raviteja Narayanam <raviteja.narayanam@xilinx.com>, 
	Wolfram Sang <wsa@kernel.org>, Manikanta Guntupalli <manikanta.guntupalli@amd.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v6 1/3] i2c: xiic: preserve PEC byte length in SMBus
 block read setup
Message-ID: <arWC6PFh3YVgU1Pd@zenone.zhora.eu>
References: <20260923-i2c-xiic-v6-0-3a15b6397f5a@nexthop.ai>
 <20260923-i2c-xiic-v6-1-3a15b6397f5a@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-i2c-xiic-v6-1-3a15b6397f5a@nexthop.ai>
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

there is still another issue here.

...

> @@ -546,23 +552,26 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
>  			 * Receive fifo depth should set to Rx fifo capacity minus 1
>  			 */
>  			rfd_set = IIC_RX_FIFO_DEPTH - 1;
> -			i2c->rx_msg->len = rxmsg_len + 1;
> -		} else if ((rxmsg_len == 1) ||
> -			(rxmsg_len == 0)) {
> +			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
> +		} else if (1 + rxmsg_len + pec_len < SMBUS_BLOCK_READ_MIN_LEN) {
>  			/*
> -			 * Minimum of 3 bytes required to exit cleanly. 1 byte
> -			 * already received, Second byte is being received. Have
> -			 * to set NACK in read_rx before receiving the last byte
> +			 * The HW needs SMBUS_BLOCK_READ_MIN_LEN bytes on the
> +			 * bus to exit cleanly: by the time the ISR reads the
> +			 * length byte the second byte is already being clocked
> +			 * in, too late to NACK. Pad the drain target and record
> +			 * the real length, trimmed back on completion so the
> +			 * PEC check sees the right byte.
>  			 */
>  			rfd_set = 0;
>  			i2c->rx_msg->len = SMBUS_BLOCK_READ_MIN_LEN;
> +			i2c->smbus_actual_len = 1 + rxmsg_len + pec_len;
>  		} else {
>  			/*
>  			 * When Rx msg len less than Rx fifo capacity
>  			 * Receive fifo depth should set to Rx msg len minus 2
>  			 */
>  			rfd_set = rxmsg_len - 2;

what if rxmsg is 1? Before this could never happen because we
were checking for rxmsg_len == 0 or 1 and we were ending up here
for values greater than 1.

In patch 2 you fix things, but we don't want to have dependencies
between patches.

Andi

> -			i2c->rx_msg->len = rxmsg_len + 1;
> +			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
>  		}
>  		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);

