Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A23C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 17:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuqM/WGdWAvxoUzLdKyoVNyv6lEuaBibG/phSEzTtl0=; b=iRZIwdcVk0jPaDjLNUJmBCX+EO
	adPSVuNEGNiY81CP3FXWJVaQrA8ak3XYl/8+QJJjWbb/OstgbhfEXCiuj1euIfZbWFILYdhe2M8ek
	34gLuBRtBvK4+skfN6pp6x8unrTatf0L0uFhSpunFcbHDoaPJxSE39RpmO27q8Ois+c5xSIEk0lSt
	f6xZknUMeNrI6SKea7SmLgcGfiN2V3wBiv4C1izLy3FLZ8BBI7dlMn0jxzNMPw1mX1r6jgrpowljQ
	y8L2mFH4HkaZ7ToPtBb80GL9iNaVrxBORQaHZ9UN5FNwVP99PeHAyp7ZNPg1mtaAyfOvfZ/Iyj7EV
	U8d8HgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx8Ph-00000006ekX-1eQu;
	Tue, 25 Mar 2025 17:50:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx8Ny-00000006eY5-2VS4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 17:48:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2B3F43826;
	Tue, 25 Mar 2025 17:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CD4C4CEE4;
	Tue, 25 Mar 2025 17:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742924892;
	bh=LDYDrMN1yw3dnPT5hqTvwo1DrKrUFNcyLxotDaZ19As=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eEg6jeoqkTApxk+g4qxnWkA2KZibY5XwiIYqCjJZeLAETwp8dhdDtijH7GCzFgJvH
	 St2ItRLskRowiJQlKKLQhyOj9uZ5iHyWFshM3dluJDgXBWsgi6RZHh+lUDIIH4++ZS
	 cceOkMcfkOPi7Quu1HTfAra7Kh1sNY90JJ0FTeClpMsnzEKZPlPBJkZ98SScn3qnj1
	 4IwL723MoY4UCa5sMvlGD/3OY9Ki6oxQglZdMAePjZnNokrLy/K1Q4jYV+rBTaTALn
	 nsGL756qYeF5D8+Gr51gjx7f/qfPLP5PIOdJZ2AHQP0IyaNdNERUDgAa7EwtINAvJ6
	 fdiDLSGOJF5Ow==
Date: Tue, 25 Mar 2025 10:48:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <pabeni@redhat.com>, <edumazet@google.com>, <davem@davemloft.net>,
 <andrew+netdev@lunn.ch>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <kory.maincent@bootlin.com>,
 <dan.carpenter@linaro.org>, <javier.carrasco.cruz@gmail.com>,
 <diogo.ivo@siemens.com>, <jacob.e.keller@intel.com>, <horms@kernel.org>,
 <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
 <ast@kernel.org>, <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH net-next v2 3/3] net: ti: icss-iep: Fix possible NULL
 pointer dereference for perout request
Message-ID: <20250325104801.632ff98d@kernel.org>
In-Reply-To: <20250321081313.37112-4-m-malladi@ti.com>
References: <20250321081313.37112-1-m-malladi@ti.com>
	<20250321081313.37112-4-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_104822_655211_C791CE3C 
X-CRM114-Status: GOOD (  19.50  )
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

On Fri, 21 Mar 2025 13:43:13 +0530 Meghana Malladi wrote:
> Whenever there is a perout request from the user application,
> kernel receives req structure containing the configuration info
> for that req.

This doesn't really explain the condition under which the bug triggers.
Presumably when user request comes in req is never NULL?

> Add NULL pointer handling for perout request if
> that req struct points to NULL.
> 
> Fixes: e5b456a14215 ("net: ti: icss-iep: Add pwidth configuration for perout signal")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> Reviewed-by: Simon Horman <horms@kernel.org>
> ---
> 
> Changes from v1(v2-v1):
> - Collected RB tag from Simon Horman <horms@kernel.org>
> 
>  drivers/net/ethernet/ti/icssg/icss_iep.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
> index b4a34c57b7b4..aeebdc4c121e 100644
> --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
> @@ -498,6 +498,10 @@ static int icss_iep_perout_enable(struct icss_iep *iep,
>  {
>  	int ret = 0;
>  
> +	/* Return error if the req is NULL */

code is trivial here, explain the 'why' not the 'what'
Why is this called with NULL?

> +	if (!req)
> +		return -EINVAL;
-- 
pw-bot: cr

