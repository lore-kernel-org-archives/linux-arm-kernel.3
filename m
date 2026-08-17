Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25F2C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 07:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHaiYM/y/snjrD+pBdi2eiWOhp1MMx3lZzj8PlHwRPw=; b=DcywNguZK5LzPgjcKv+uimGrM2
	L5MPawnyo34cRnYqt0URJ0rKZtXR7+p4gWEmOkAgz/wFFXa2scvYu8+mBg/i84C/dYzUY7YqxiRDU
	bw7Qc4zPedhZIpBf68O7muVdLe9XDq/yyDLM0anUOPwz+9jlPljwgJXE53L25lQn6L6D8OO4wgB1/
	prJWEfDdLq9CrT5pNw+F9zNHhOFTQDm8BJdi6SKAZfnK9SmCFM+wL0419+/k17r/yMmQTkdC51dUD
	mSu+xhf8Ik6MYoptDwA+pjRJhZgEpNMpiCvkMnIVGdIYqeGx2vQ3AsyDj4fOOxUgehsdeqyAT5GaJ
	QjvsaQIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvral-00000005Www-2nv5;
	Mon, 17 Aug 2026 07:17:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvrak-00000005Wwh-1eb0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 07:17:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CB4D601E0;
	Mon, 17 Aug 2026 07:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E6B1F000E9;
	Mon, 17 Aug 2026 07:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786951025;
	bh=nHaiYM/y/snjrD+pBdi2eiWOhp1MMx3lZzj8PlHwRPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dcPIl2uhgtsnkT79J9hFbkIy7Mwr63n7Und+fNsaJpQpPcO/OnUn/GA64X6FzwknS
	 r0TubGF/Wi7V1cB/Q7S0glps0hlBdTd08JwkZ3tLgZ7LQuMbqf+IP5Xh92wfROU3Xc
	 cKTOxuuT7MEns7rO3QJ1H0xtOQJjoq/H5QFZb9v91YqX7q8xVUvHX7IQDD6s9UkzHs
	 2kMzCcR2EfN/sJQXl4shY/+mMRbt7IfpDsm2e23eJzOaadhzzgzK5OnGP/LjsdDZl7
	 hGaOUkxr5o4tyeirOAeBw++yZc7k/E7d2uNeejBlaHCuHIjm5nmP8C+lMKEzjEu2dx
	 pHHxhlLvbxHmQ==
Date: Mon, 17 Aug 2026 09:16:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Corey Minyard <corey@minyard.net>, 
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, jammy_huang@aspeedtech.com
Subject: Re: [PATCH v2 2/2] ipmi: kcs_bmc_aspeed: Support multiple LPC
 controller instances
Message-ID: <20260817-hissing-beaver-of-potency-994d0f@quoll>
References: <20260813-upstream_kcs_multiple_lpc-v2-0-775b1db3fe95@aspeedtech.com>
 <20260813-upstream_kcs_multiple_lpc-v2-2-775b1db3fe95@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813-upstream_kcs_multiple_lpc-v2-2-775b1db3fe95@aspeedtech.com>
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

On Thu, Aug 13, 2026 at 02:42:32PM +0800, Yu-Che Hsieh wrote:
> @@ -526,6 +528,17 @@ static int aspeed_kcs_of_get_channel(struct platform_device *pdev)
>  	return -EINVAL;
>  }
>  
> +static int aspeed_kcs_of_get_bank(struct device_node *lpc_np)
> +{
> +	int id;
> +
> +	id = of_alias_get_id(lpc_np, "lpc");

NAK

You do not get custom aliases.

Best regards,
Krzysztof


