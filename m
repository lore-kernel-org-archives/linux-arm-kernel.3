Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF62DEC01A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 07:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3cJ44yM+NmRrca7V3uKaOczEtsL7ikYY/fGrJvDBzQ=; b=eoafhCyMLvZGkZi9BtvUHfP91S
	RZWjN5hfHN0hPmKdLksF4XWgPMy6+uzp0NBsOH8/jHU+mpbENYbycNcsGoR/I6Ib/+yILLh1RAMPC
	lShBSY+nEBNcaeVSQ4Ypnhnmujkx+/+HJ9iu1/ToxtCZUK50BkEUBZqmJSB59j+KQQEM0gY/hI8V9
	9WxiVc+bLl4N7bn/MribPI3IHqZumC5FnXIAMt1/YpR6q9BqFvgf/vs1O3ICaKraiUW99eYpWu4nt
	w7c/WroPeihAGnQKHrbvwPSi+90YjqWwAeJBnIto+A7hkE5n3laSwLVqSl/NC+/851QXGrcr1jBa5
	dn0JrvCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Zzs-0000000GDNP-0JX5;
	Mon, 23 Mar 2026 07:46:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Zzq-0000000GDMa-0yK6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 07:46:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 995A7600CB;
	Mon, 23 Mar 2026 07:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E54C4CEF7;
	Mon, 23 Mar 2026 07:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774252005;
	bh=Wio9gMPqHdSGHZEDnEngY8SYE39grryI9XLE6l3oDWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKBIV45SW7jYRmcJVtvHXKV3XffQQLnB0h0o4rBJ+x8MFpB7spa4sWYcUb9zxJtSR
	 Em44JRqOzEDzoaRis98/wG516c2uGmuUGklH9kmt1y1IzaLaijhkCMRZR2veXVcUH8
	 7h+YLi9Kq/iP4P8oYnFMQvWhEvy1e43lDIUJykhe4ZntsdfJkWZ3SmOMhIFan24bwB
	 gukcErCqbnAR2V2EpMabOvh9Ad7fw59C3pwWL1FmmrXRh9ODcfG/HpGb3wZHbqq2rp
	 lkEvMpfz7OZVB2Cno8KiSZNO83VNnlyJBs8OfPwRDrfysDNJIk0HcRDRB0rlIkbzdW
	 I55lgMa+UJkRQ==
Date: Mon, 23 Mar 2026 08:46:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Ryan Chen <ryanchen.aspeed@gmail.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] mmc: sdhci-of-aspeed: Handle optional controller
 reset
Message-ID: <20260323-glossy-industrious-dog-63b1e6@quoll>
References: <20260323-sdhci-v3-0-93555b8f6411@aspeedtech.com>
 <20260323-sdhci-v3-2-93555b8f6411@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323-sdhci-v3-2-93555b8f6411@aspeedtech.com>
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

On Mon, Mar 23, 2026 at 10:07:08AM +0800, Ryan Chen wrote:
> Get the optional reset line for the ASPEED SD controller during probe by
> using devm_reset_control_get_optional_exclusive_deasserted().
> 
> This allows platforms such as AST2700, which require the SD controller
> to be taken out of reset before use, to work with the existing driver.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
> Changes in v2:
> - use devm_reset_control_get_optional_exclusive_deasserted replace
>   reset_control_get_optional_exclusive.
> - add include reset.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


