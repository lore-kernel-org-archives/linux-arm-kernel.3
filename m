Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB067E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 07:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s95hxNS6GtC/Rq6I7d0DUMwyF0BG1XDuUN59XWNErcw=; b=eKJm3laFIIZxkmCZhIKdCmcEme
	51PFC3M3bqkoCcUsADgIQriDXv+AZWA4LWUroSIBmM++UqNPZWwxHMQrhTAfd+xXz8cGJ0pF8Zl0w
	zMVticxOeajtQuOjHFELrfmOo8Lg3rT78pBT7x2Y/jP4V4p7doqqi3vaLjGTWZTXaNYdEeB/wORko
	DRJrIatkUQdWstgdl1vZbQEdmwtkgiSUGkhUO45ol9EqhTj3wTjFifCryd63RrARjZENEwzZ3A+r0
	zjHFJDrWEjv3ylyu6IA949fd8K1Z+7CX+lj5ieXz8/PWNMgBgPLkedM2KCExeEHmXPd/NlW8Y/VjM
	1b98EQMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQwR-00000007UQt-0pOS;
	Wed, 08 Jan 2025 07:57:27 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQvE-00000007UHW-0yr6;
	Wed, 08 Jan 2025 07:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736322972; x=1767858972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/QcfGI/qmLmQrg3iSpWplrD8SEdcAMM2P3QcElzS3Ow=;
  b=DZ51fpL7VFaz1cqoOnIF1OxepxnhMvLbuZsAegptTrlTT6Sus4ISjRMS
   MGPBrF+0iTijEPWb4ipsSXw8AHfdNUBr5VlZW21+Oo0RKLGnQpz2dXZZl
   J67Yxn42dIGdgO1UbwoGZltzHANLEJwP2ijuSI+YC2kP9onU4pOZX/UBt
   MZ9rsu0GXUojaeVzb3Y1j7XJB4YZUj+jzrmoyhtUKdHMOsb1R93r5zhFv
   7nmD5J1Ye+FFz7JrdKdyAGzSNR7GX4ntUEZp9Fy4BrViA9+qe3laOTST8
   1j+S124yJFwKeI+AvywDuJ1sGcRzvzFR+tWRJSiUgaNsquS7tVRUJoVxN
   w==;
X-CSE-ConnectionGUID: qKne6AzwSH+wWPVkbh0jNA==
X-CSE-MsgGUID: C5VyPWG3SDWqyOKGngtfqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47111396"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="47111396"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 23:56:07 -0800
X-CSE-ConnectionGUID: 8llnFxfZSNiF/vYvIByBGw==
X-CSE-MsgGUID: MBrq0LQsSbezJ3pnLT967Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108072980"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 23:56:04 -0800
Date: Wed, 8 Jan 2025 08:52:46 +0100
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Fix channel configuration for ETS
 Qdisc
Message-ID: <Z34uzoVY0exNKw8c@mev-dev.igk.intel.com>
References: <20250107-airoha-ets-fix-chan-v1-1-97f66ed3a068@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107-airoha-ets-fix-chan-v1-1-97f66ed3a068@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_235612_290312_55AFB3A2 
X-CRM114-Status: GOOD (  17.53  )
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

On Tue, Jan 07, 2025 at 11:26:28PM +0100, Lorenzo Bianconi wrote:
> Limit ETS QoS channel to AIROHA_NUM_QOS_CHANNELS in
> airoha_tc_setup_qdisc_ets() in order to align the configured channel to
> the value set in airoha_dev_select_queue().
> 
> Fixes: 20bf7d07c956 ("net: airoha: Add sched ETS offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/airoha_eth.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
> index b9f1c42f0a40ca268506b4595dfa1902a15be26c..a30c417d66f2f9b0958fe1dd3829fb9ac530a34c 100644
> --- a/drivers/net/ethernet/mediatek/airoha_eth.c
> +++ b/drivers/net/ethernet/mediatek/airoha_eth.c
> @@ -2840,11 +2840,14 @@ static int airoha_qdma_get_tx_ets_stats(struct airoha_gdm_port *port,
>  static int airoha_tc_setup_qdisc_ets(struct airoha_gdm_port *port,
>  				     struct tc_ets_qopt_offload *opt)
>  {
> -	int channel = TC_H_MAJ(opt->handle) >> 16;
> +	int channel;
>  
>  	if (opt->parent == TC_H_ROOT)
>  		return -EINVAL;
>  
> +	channel = TC_H_MAJ(opt->handle) >> 16;
> +	channel = channel % AIROHA_NUM_QOS_CHANNELS;
> +
>  	switch (opt->command) {
>  	case TC_ETS_REPLACE:
>  		return airoha_qdma_set_tx_ets_sched(port, channel, opt);
> 
> ---
> base-commit: a1942da8a38717ddd9b4c132f59e1657c85c1432
> change-id: 20250107-airoha-ets-fix-chan-e35ccac76d64
> 
> Best regards,
> -- 
> Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>


