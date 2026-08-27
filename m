Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B5DC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhxuzSSCiA9yo+vWB5G26kPpXv6+d3Y2XXAaEPMMCxs=; b=qP8c5Ih7R+/01bI5JrXnwmDWL7
	vN6yLs7XwLiR7xLRhCyAzXMt6PodlFG1bbabbzXQGqk515MP6VVp+YyjiQLppJcJb6gGII2dxKw82
	C1PSM/c1ZSrjbBMC418obmmD49u6qsCTHe5Z0S70jbUGCh9LSvEH4UWah8EeckjoN1sruUnDZzkV7
	Usu4MbMZf5p36jS+T1WQdIj5NB3Bm3XloXr6mBiz4YFnYWo4gvPph5h40Gb4S5rJGsbCdm0sSDs/8
	6y4CwTx9xBgzyLt/0qxOWtdpMhuBPZHgvo9jUzSk7RQEyXUaoeDaeOz05x8F3nxccGppaKPYJoXBH
	5sJTwSRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVkr-00000003g2T-25rX;
	Thu, 27 Aug 2026 08:46:37 +0000
Received: from mail-106113.protonmail.ch ([79.135.106.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVkn-00000003g0T-0kg6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 08:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1787820387; x=1788079587;
	bh=lhxuzSSCiA9yo+vWB5G26kPpXv6+d3Y2XXAaEPMMCxs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=fxufw8H0rYVX0gljTC5cW7Dhns3IVfsPfCCEX1pNfUN5a1WWscThCRevNWLM+blBu
	 2Y7742Ge+XrsVrn+G1pej7VUnDqTSK1o2blfkGefEnFIzA2Fnfb+ggkxb6+ehs5rYm
	 b7FiXHXj3p25EI4kHmzNuuU2DnvhDH1K0zjzXSIPHuuHu72pgTaM5VSO45b40jwB+4
	 h6g6YaGVA9de+tlnbIHT1aLQSL4mwGLHJmJ9Dd/4iJoSFJME/mlioSrA71of3NfjOn
	 RGpvgf6aG+QUU4ZhreRtk6M+Ebdwlzo7icT6MsTj/gcSPtJEZWrNanj48OfaxFbEVJ
	 WPM/frx12sBuA==
X-Pm-Submission-Id: 4hVw9F285Pz1DFFg
From: Esben Haabendal <esben@geanix.com>
To: "Rosen Penev" <rosenp@gmail.com>
Cc: <netdev@vger.kernel.org>,  "Andrew Lunn" <andrew+netdev@lunn.ch>,
  "David S. Miller" <davem@davemloft.net>,  "Eric Dumazet"
 <edumazet@google.com>,  "Jakub Kicinski" <kuba@kernel.org>,  "Paolo Abeni"
 <pabeni@redhat.com>,  "Michal Simek" <michal.simek@amd.com>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: ll_temac: Return actual error from
 of_get_mac_address()
In-Reply-To: <20260827012439.162651-1-rosenp@gmail.com> (Rosen Penev's message
	of "Wed, 26 Aug 2026 18:24:39 -0700")
References: <mWYTdXJIk1gD3_qHzfnWHAAyTs0Hh4I5P02_nisIqJdxRWM6DIMgOL9bIxaQqDTx37ldTpEm-0MsQQ3BWkTs9g==@protonmail.internalid>
	<20260827012439.162651-1-rosenp@gmail.com>
Date: Thu, 27 Aug 2026 10:46:24 +0200
Message-ID: <87ik4wymqn.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_014634_289975_BADBC5EF 
X-CRM114-Status: GOOD (  16.60  )
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

"Rosen Penev" <rosenp@gmail.com> writes:

> When of_get_mac_address() fails, return the actual error code (rc)
> instead of the hardcoded -ENODEV. This preserves the original error
> information, which may be more specific (e.g., -EINVAL, -EPROBE_DEFER)
> and helps callers handle the failure appropriately.
>
> Fixes: 8425c41d1ef7 ("net: ll_temac: Extend support to non-device-tree platforms")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/ethernet/xilinx/ll_temac_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/xilinx/ll_temac_main.c b/drivers/net/ethernet/xilinx/ll_temac_main.c
> index 711ed9c2631b..81ec73e6e4c1 100644
> --- a/drivers/net/ethernet/xilinx/ll_temac_main.c
> +++ b/drivers/net/ethernet/xilinx/ll_temac_main.c
> @@ -1581,7 +1581,7 @@ static int temac_probe(struct platform_device *pdev)
>  		rc = of_get_mac_address(temac_np, addr);
>  		if (rc) {
>  			dev_err(&pdev->dev, "could not find MAC address\n");
> -			return -ENODEV;
> +			return rc;
>  		}
>  		temac_init_mac_address(ndev, addr);
>  	} else if (pdata) {
> --
> 2.55.0

Acked-by: Esben Haabendal <esben@geanix.com>

