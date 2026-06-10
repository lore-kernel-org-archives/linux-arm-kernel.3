Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBC8CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 12:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azyBFXRis6dP0BPR2dlcgvxJnAOONu2IfcqBRv2/uQs=; b=hqfN48xdC7smL0C3rTwRaUY8C3
	GqX4dPx8wYtO+chvZWVRwf2pMimxeQlGeMgWh5E8N8tXsho3DAPJjRJEnBJNg9AfHQPEtt/K2ClIw
	c15W2KgPOYP4qQZCHpIFiFXWPtm1SncL6wxAvl7J1nmxxlvWwm4y7cOMIRsIbufZPsyIuTlC+SQg9
	MJBh3Z41W/K3THGkf6ctJwwyWodoBrBHKfE5SQaQciOVDT2Ku3r53lRulA40taO8Hci8Ece+yCL3Y
	VDNQW/rxxPLhba0HSEpMwffiyOKEd58RFP1o8K0rCiAkHFB7y1MkaKCz4ihPCz3wqp/XKOwaDhU4s
	G34WVEYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXID4-00000007ecM-0wQi;
	Wed, 10 Jun 2026 12:39:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXID1-00000007ec1-2LGH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 12:39:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73596353E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 05:38:55 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DE57E3FDE2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 05:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781095140; bh=HrSqzNTnR4WRNRS8bUmISNB9c7Wek/Bkm+ZmnpD9ACI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UoUdrkuCZKW8VTd5YagldYt5tdT2V/atjQFvWStXb1LC76tabeWixRVLV4ClrFY4l
	 ycmC1MFrMlVJ81CanxvsDTJO9TM8uPQ6ouIIMUMwSz0xwvM+IvwPtpW3P6OYiraCBU
	 R/SIGduM+3YOTKIiBF4kki8CNMG3WDiEkUHl2gec=
Date: Wed, 10 Jun 2026 13:38:55 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Weigang He <geoffreyhe2@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: vexpress-config: fix device_node refcount leak in
 vexpress_syscfg_probe()
Message-ID: <aila35cYkBES4rbu@e142607>
References: <20260610033054.2117363-1-geoffreyhe2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610033054.2117363-1-geoffreyhe2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_053903_777820_4E641DDA 
X-CRM114-Status: GOOD (  25.33  )
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

On Wed, Jun 10, 2026 at 01:30:54PM +1000, Weigang He wrote:
> vexpress_syscfg_probe() iterates the "arm,vexpress,config-bus"
> compatible nodes and, for each one, takes a reference to the bridge
> phandle via of_parse_phandle():
> 
> 	bridge_np = of_parse_phandle(node, "arm,vexpress,config-bridge", 0);
> 
> bridge_np is only compared against pdev->dev.parent->of_node and is
> never released - neither on the "continue" path when it does not match,
> nor on the path that calls of_platform_populate() and falls through to
> the next loop iteration. Each matching iteration leaks one device_node
> reference; the leak repeats on every probe (driver bind/unbind, module
> reload, or EPROBE_DEFER retry).
> 
> This is a regression of commit 557e37c05f28 ("bus: vexpress-config: add
> missing of_node_put after calling of_parse_phandle"), which fixed the
> equivalent leak in the predecessor function vexpress_config_populate().
> Commit a5a38765ac79 ("bus: vexpress-config: simplify config bus
> probing") removed that function and inlined the loop into the probe
> routine, but did not carry over the of_node_put().
> 
> Use the __free(device_node) cleanup attribute on bridge_np so the
> reference is released automatically at the end of each loop iteration.
> 
> Found by static analysis tool CodeQL.
> 
> Fixes: a5a38765ac79 ("bus: vexpress-config: simplify config bus probing")
> Signed-off-by: Weigang He <geoffreyhe2@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Thanks for the fix!

Best regards,
Liviu

> ---
>  drivers/bus/vexpress-config.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/vexpress-config.c b/drivers/bus/vexpress-config.c
> index 64ee920721ee7..cc247483d3823 100644
> --- a/drivers/bus/vexpress-config.c
> +++ b/drivers/bus/vexpress-config.c
> @@ -390,9 +390,9 @@ static int vexpress_syscfg_probe(struct platform_device *pdev)
>  	}
>  
>  	for_each_compatible_node(node, NULL, "arm,vexpress,config-bus") {
> -		struct device_node *bridge_np;
> +		struct device_node *bridge_np __free(device_node) =
> +			of_parse_phandle(node, "arm,vexpress,config-bridge", 0);
>  
> -		bridge_np = of_parse_phandle(node, "arm,vexpress,config-bridge", 0);
>  		if (bridge_np != pdev->dev.parent->of_node)
>  			continue;
>  
> 
> base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

