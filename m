Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777F2C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 05:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GPiiOWg2WcilvsIQa/HwiogYZD85OO9PHBPobF64+M=; b=3/aKw5sOhgiIz9hmVUlHrrubhO
	SW1De77BQDmFhoC8VQ3xPBhk4YN2tpSU/duYAOQADr2nV74dacB1KKpffEDIDri5nq2m5s4nI6q41
	a7rGxd6ggz9+wp/ZMP77VvbgXYaZHqjqRNFD4EkzY4vUV25Ebo+ZE/AP2zAq2nVxV9PLCC5wlm0Zq
	yzJ3fsDzL5XZhT1lr9ig20M0iuE/rt2EgJu/3jBR8DK/8cF+y9m3u2q1HdiyHJnKK+fL3tkn++c/F
	OPFP6UHjwojMJTMIr3VYh27VwJnYolCXTzCaNdWJ1O0W4/sXvJhS92xGFPAbeV1sHwFHoYFQNU/16
	V2e3AW0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9Jl-0000000CDIa-3MKw;
	Wed, 28 May 2025 05:27:09 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9Hd-0000000CD1d-25Qa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 05:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748409898; x=1779945898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=17rSp5U/xGeglZ8H7tF6/G2owk/7blSgg3sqoGfP+0U=;
  b=W9NwoCpYcVxQ0/KsEUl2ATeUMqloDrH38h6ssOel7WqyU56SH7YGpMfg
   3x1vzMJF44tFdfdV47F7ZLiVwk3opwXEUraslNchQYxZr/dZvbR93tjzO
   g3+I0ZYTvYLyLZDClus+FvpKAY9jRyLO0miWVVT26vBL0kCSJXmusTQ/X
   bFkb+fhNyEqZtZGGckI9gUeu9NIPdu7UbSCpHot5SXgakwkDjNWkbo+zI
   XkFZzE0jQR6MUy/wcf+rAi16fY2jYowQ5jVcuGsUp7V+dpLwCnZXX36x3
   DdiS5ju7H3rESBpnkg8F8hfpU37ZBBKfpz3t/oFm2qlxvk1AR4mCzRNEJ
   A==;
X-CSE-ConnectionGUID: mmdMXZVcQz6eWk3A4byT1w==
X-CSE-MsgGUID: lCwC28fRRyKmMZ02aLMkhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50576511"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="50576511"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 22:24:56 -0700
X-CSE-ConnectionGUID: 43PRHqaxS/iGGHO6XHx9aA==
X-CSE-MsgGUID: 9VBCuzvETsG4GSy2PbL5cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="142947801"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 22:24:50 -0700
Date: Wed, 28 May 2025 07:24:11 +0200
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: weishangjuan@eswincomputing.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	vladimir.oltean@nxp.com, rmk+kernel@armlinux.org.uk,
	yong.liang.choong@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
	jan.petrous@oss.nxp.com, jszhang@kernel.org, p.zabel@pengutronix.de,
	0x1207@gmail.com, boon.khai.ng@altera.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, lizhi2@eswincomputing.com
Subject: Re: [PATCH v2 0/2] Add driver support for Eswin eic7700 SoC ethernet
 controller
Message-ID: <aDad+8YHEFdOIs38@mev-dev.igk.intel.com>
References: <20250528041455.878-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528041455.878-1-weishangjuan@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_222457_547498_5A25AF94 
X-CRM114-Status: GOOD (  20.52  )
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

On Wed, May 28, 2025 at 12:14:42PM +0800, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Updates:
> 
>   dt-bindings: ethernet: eswin: Document for EIC7700 SoC
>   v1 -> v2:
>     1. Remove the code related to PHY LED configuration from the MAC driver.
>     2. Use phylib instead of the GPIO API in the driver to implement the PHY reset function.
>     3. Align with the latest stmmac API, use the API provided by stmmac helper to refactor the driver,
>        and replace or remove duplicate code.
>     4. Adjust the code format and driver interfaces, such as replacing kzalloc with devm_kzalloc, etc.
> 
>   ethernet: eswin: Add eic7700 ethernet driver
>   v1 -> v2:
>     1. Significant errors have been corrected in the email reply for version v1.
>     2. Add snps,dwmac.
>     3. Chang the names of reset-names and phy-mode.
>     4. Add descriptions of eswin, hsp_sp_csr, eswin, syscrg.csr, eswin, dly_hsp.reg.
> 
>   Regarding the question about delay parameters in the previous email reply, the explanation is as follows:
>     Dly_hsp_reg: Configure the delay compensation register between MAC/PHY;
>     Dly_param_ *: The value written to the dly_hsp_reg register at a rate of 1000/100/10, which varies due 
>                   to the routing of the board;
> 
>   In addition, your bot found errors running 'make dt_binding_check' on our patch about yamllint warnings/errors,
>   it looks like the validation failure is because missing eswin entry in vendor-prefixes.yaml. 
>   When we run "make dt_binding_check", we get the same error. We have already added 'eswin' in the vendor-prefixes.yaml 
>   file before, and the code has mentioned the community, but you have not yet integrated it.

Usualy description is above the changelog. Please try to follow 72 line
length rule.

net-next is closed, you should resend it when open (after June 9th) [1]

[1] https://lore.kernel.org/netdev/20250527191710.7d94a61c@kernel.org/T/#m0bc90575288f5f1bcf5e50ecff59fb904b79505c

> 
> Shangjuan Wei (2):
>   dt-bindings: ethernet: eswin: Document for EIC7700 SoC
>   ethernet: eswin: Add eic7700 ethernet driver
> 
>  .../bindings/net/eswin,eic7700-eth.yaml       | 200 +++++++++
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 410 ++++++++++++++++++
>  4 files changed, 622 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> 
> -- 
> 2.17.1

