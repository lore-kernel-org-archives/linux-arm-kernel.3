Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C429C55167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 22:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEd6hXttOvySEFhA8BB4g88telRNG8B5whgcgWs6ekE=; b=LGAVpMFecqSikQzLMv07J4WOlS
	a/Spss2cZzQRbVFOeH8CWIRpc2C0Z0J08br2wnTz5HC07dUE94eS22BGZulZl2rH/yL9P2WpXD2gC
	O49eaYvCqlE527twRTRMbxF+xDJNw7aLn6ybQHBpndtexN4kF6lL0nP6vexXvWUV/ctiGnO2EbCCb
	y0klUL+8ViSv5FNpzyhv+agIirbeOzeVA94WEBPYU/s32/VPHOMnmr/iKYZoTY11HyvRqI5yRkhnj
	D/Mgdd8AU4Qx0vs67tjCQhBm87qxZ9DhYfr1UN2g5uBlMRa64SNc0lC9U7rYdigIrG6229KmBfy+a
	3Pc6jx/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpZaS-0000000BSDh-3w5m;
	Thu, 30 Jul 2026 22:50:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpZaR-0000000BSDL-3xRz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 22:50:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 721AD6001D;
	Thu, 30 Jul 2026 22:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C711F000E9;
	Thu, 30 Jul 2026 22:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785451846;
	bh=XEd6hXttOvySEFhA8BB4g88telRNG8B5whgcgWs6ekE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HAOTyD4B8puIKieu5T5fmZPrOiCunXcFCu/RbkdR3cIIyYfh4FHH+tqt7J0ViTd+y
	 0qWN67PzI+lA973vWHy7s3tHObtMYDcPXhjdxVGQuOEVqs27+Nwrg7pgzBlCMX4IJu
	 n6Y5seAb3ieitQm7kd6BFSGeo2AR3TGN8hVVFbOogCcKKyPe3vwt8UBKIAJ9jBvqsV
	 h2ROiem8ZHHHq1nGrzXdea2fNxe9O1PlVNdOmgLxDogE+mMG0+TqcIK1JYTfJZJU8b
	 At07fPNAd13f7qq6Lw5j27VNmy8Y0zdLOoCJLlG753+wHr/1Hy0/Gzx1WtvZjT8ffa
	 CmK8fyOyLi0gQ==
Date: Thu, 30 Jul 2026 15:50:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Cc: Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, joe@dama.to,
 linux-arm-kernel@lists.infradead.org, horatiu.vultur@microchip.com,
 stable@vger.kernel.org
Subject: Re: [PATCH net v2] net: microchip: vcap api: Fix possible memory
 leak in vcap_decode_rule()
Message-ID: <20260730155045.49d7252b@kernel.org>
In-Reply-To: <20260728114253.196398-1-nihaal@cse.iitm.ac.in>
References: <20260728114253.196398-1-nihaal@cse.iitm.ac.in>
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

On Tue, 28 Jul 2026 17:12:51 +0530 Abdun Nihaal wrote:
> The memory allocated for struct vcap_rule_internal, keyfields and
> actionfields inside vcap_dup_rule() are not freed in some of the error
> paths in vcap_decode_rule(). Fix that by calling vcap_free_rule().
> 
> Fixes: 610c32b2ce66 ("net: microchip: vcap: Add vcap_get_rule")
> Cc: stable@vger.kernel.org
> Reviewed-by: Joe Damato <joe@dama.to>
> Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
> ---
> Compile tested only. Issue found using static analysis.

This is important information please add it to the main commit message
body.

> v1->v2:
> - Convert the error labels from "err" to "out_err" to avoid confusion
>   with the err variable, as suggested by Joe Damato.
> 
> Link to v1: https://patchwork.kernel.org/project/netdevbpf/patch/20260727125757.134611-1-nihaal@cse.iitm.ac.in/
> 
>  drivers/net/ethernet/microchip/vcap/vcap_api.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api.c b/drivers/net/ethernet/microchip/vcap/vcap_api.c
> index ff86cde11a32..376be059d662 100644
> --- a/drivers/net/ethernet/microchip/vcap/vcap_api.c
> +++ b/drivers/net/ethernet/microchip/vcap/vcap_api.c
> @@ -2427,18 +2427,21 @@ struct vcap_rule *vcap_decode_rule(struct vcap_rule_internal *elem)
>  
>  	err = vcap_read_rule(ri);
>  	if (err)
> -		return ERR_PTR(err);
> +		goto out_err;
>  
>  	err = vcap_decode_keyset(ri);
>  	if (err)
> -		return ERR_PTR(err);
> +		goto out_err;
>  
>  	err = vcap_decode_actionset(ri);
>  	if (err)
> -		return ERR_PTR(err);
> +		goto out_err;
>  
>  out:
>  	return &ri->data;
> +out_err:

Please name the label after the first action being undone

err_free_rule:

> +	vcap_free_rule(&ri->data);
> +	return ERR_PTR(err);
-- 
pw-bot: cr

