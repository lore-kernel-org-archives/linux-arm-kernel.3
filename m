Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01052FF6E85
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 21:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=+zDOo7rF2svLONbcePg3JdNrKG6WS8SVJGbglt3nfMA=; b=tlkLC7ToZfbszK
	+yhwHu86S7XY3Env878eQxVHW8iaxgGNcDJ+RMhlc1g0fjaivYv4ElTdezRmj90eTKg2vAeR38xOm
	KZ119uJVvr3pTejQ4RPTXfcQLrmiugGlx+3eg3Gw+5h4NqborarOuCfixyqPalI8rza5z6vLlg2fc
	A9nGG2puASJ+Ws0h6VRxOGaseoCGqiCO8B9lsrnY8INtl54ngTcUtIgZbPxfxZxPkfbk32q+mb+N6
	1l/LbFgf3NT09SiU3ze7OBbKo4O2jLS+0yBPPvZTR7a6gM1osqFjqYBl40gp6BD28Z9SH+WgDia9w
	QDduKoRKRAkAvQawP2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bqP-00000007FFC-2x2B;
	Tue, 17 Mar 2026 21:20:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bqO-00000007FF5-1Y3n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 21:20:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CB3F6057A;
	Tue, 17 Mar 2026 21:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51F5C4CEF7;
	Tue, 17 Mar 2026 21:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773782451;
	bh=oFrY9te7uqPD8r7EoBSwCYXSO4S7zmyO1OhSMocepjU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=q5odKayzjo5syOlp9BN34RbHpBgiFjSAmPmi7ffpUCMXDlxP2tw/egyM+KoebDMuP
	 zQa1x/HY+VyZ5qo5ahCQB6rsLfOWNPEuQrQu5njxWVZPf/4JNE56ObG427+K72Bb4D
	 HOwIbNaO6n1wfMTX/RqQXQZr8/5Outs8FB+6e6dvOTVCTkzoMbE2l6BRQpJUBHvHoz
	 U0rJDSKdcEwnBW2RWJyTi2K8YvLXeD44RT5XXUrf9t0e+Eq/qXLBQ/Ocuxato+CRkd
	 ka2ZEvdOgckG/8HxFwcA/h8nm7egRakuJyIxc/Gbh7+IiYCHpI3DtbxKNRwlg8SpTz
	 q01W7SmxZ83AA==
Date: Tue, 17 Mar 2026 16:20:49 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v2 3/4] PCI: pnv_php: Simplify with scoped for each OF
 child loop
Message-ID: <20260317212049.GA108913@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317133322.266102-7-krzysztof.kozlowski@oss.qualcomm.com>
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

On Tue, Mar 17, 2026 at 02:33:25PM +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied patches 3 and 4 to pci/hotplug for v7.1, thanks!

Mani will take care of patches 1 and 2.

> ---
> 
> Changes in v2:
> Tags
> ---
>  drivers/pci/hotplug/pnv_php.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
> index 5c020831e318..ff92a5c301b8 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -215,24 +215,19 @@ static void pnv_php_reverse_nodes(struct device_node *parent)
>  static int pnv_php_populate_changeset(struct of_changeset *ocs,
>  				      struct device_node *dn)
>  {
> -	struct device_node *child;
> -	int ret = 0;
> +	int ret;
>  
> -	for_each_child_of_node(dn, child) {
> +	for_each_child_of_node_scoped(dn, child) {
>  		ret = of_changeset_attach_node(ocs, child);
> -		if (ret) {
> -			of_node_put(child);
> -			break;
> -		}
> +		if (ret)
> +			return ret;
>  
>  		ret = pnv_php_populate_changeset(ocs, child);
> -		if (ret) {
> -			of_node_put(child);
> -			break;
> -		}
> +		if (ret)
> +			return ret;
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static void *pnv_php_add_one_pdn(struct device_node *dn, void *data)
> -- 
> 2.51.0
> 

