Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F37F103E168
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 12:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V46uq1gIonA11FIl2YA34cg/6cf19A3UTojwMYo+WeI=; b=CfH9xnbG5T77CGY2yeTJFfO/mC
	U6Q/KZZAK467E1rvjAEGS9cAEvwyGQOKZZNufPqiTJvRId3ZKDtK72eY0IA/osyT5P80qT4BARsK0
	DGkD7NjaTXrO9Xjhf5lYJJMQsqBfI2w578fMxe4EFZJrvY6qIhsEY59uroUbORc0r770BhRb/7Sss
	LN51tDkcp8Zcl2xgRhMYtjHyyaCjqmYS4CgDADdyvQtoh0Ncs7HVrqwT//s2gvFV3IlQqrd+AKeaz
	SBrzdEhFTMqXZO6BoNuMDQ4LnfAuEdR31BBP5q4e75jvoDX4dh9WXFXIaMcpbGTEj2tCSNbE9A7mu
	VZj/O6eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2q87-00000008OV8-1Jkp;
	Wed, 18 Mar 2026 12:36:07 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2q7v-00000008OTV-1Zyu;
	Wed, 18 Mar 2026 12:35:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773837347; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CBxN97Qi19FNhuvIfPGCePkR+Vur/noh/3S3UvtMbpsVRDjLf6VDzcHgk/WhS339vaDil74464iYL4jCd9Cx8p6znZJe/Sf4KGF/XJLvw9bXd9GtLBvKU7vHfBoJDrrWFGdElDLLtvE3uE1MIskAZlwUQjQXzM9MVYdcFzyD4kA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773837347; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=V46uq1gIonA11FIl2YA34cg/6cf19A3UTojwMYo+WeI=; 
	b=SiLEBhTbUzdDS9z8Ibt9cxreqzfEaJDt+8L/R8kpFwQaNxSwIK5J1Yd53CbjVQa3Exrfr1V6fJip/6DLybYTZuokNLHU/gTB8yYVKtFhM2P1ILPP/WyZVo73DHTgjwPICUFJkOB2CwAWhJTFXTY98qNA1C8b3+GNH+HIjsI+XQ4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773837347;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=V46uq1gIonA11FIl2YA34cg/6cf19A3UTojwMYo+WeI=;
	b=Z+jonyyeWBANmIkrXlBQ4qqJ6EKmGlg2pFvrpCxdhKC/Lowhjv1xXCFNwsB/GKAA
	YZE1D53DdLBz/mJRvwohVEMgY8Qx/jSDLGp1vxFO5gRTyFL9hcxnF4kSqJkyTng7xfV
	M5NTXun2HvxzEnDMX0N/W4DY/FlGkcMu1qF8KNqE=
Received: by mx.zohomail.com with SMTPS id 1773837345790539.4413022581078;
	Wed, 18 Mar 2026 05:35:45 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Daniele Briguglio <hello@superkali.me>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniele Briguglio <hello@superkali.me>
Subject: Re: [PATCH 2/3] clk: rockchip: allow grf_type_sys lookup in aux_grf_table
Date: Wed, 18 Mar 2026 13:35:41 +0100
Message-ID: <13714918.O9o76ZdvQC@workhorse>
In-Reply-To: <20260316-rk3588-mclk-gate-grf-v1-2-66fb9a246718@superkali.me>
References: <20260316-rk3588-mclk-gate-grf-v1-0-66fb9a246718@superkali.me>
 <20260316-rk3588-mclk-gate-grf-v1-2-66fb9a246718@superkali.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_053555_578109_7C0EFC2A 
X-CRM114-Status: GOOD (  19.35  )
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

On Monday, 16 March 2026 14:06:32 Central European Standard Time Daniele Briguglio wrote:
> Remove the grf_type_sys exclusion from the auxiliary GRF table lookup
> in rockchip_clk_register_branches(). Previously, branches with
> grf_type_sys always used ctx->grf directly, bypassing the aux_grf_table.
> 
> This is a problem on SoCs like RK3588 where ctx->grf points to the
> PHP_GRF (set via the CRU's rockchip,grf phandle), but GATE_GRF clock
> entries need to access the SYS_GRF instead.
> 
> With this change, grf_type_sys branches first check the aux_grf_table,
> and fall back to ctx->grf if no entry is found. This is backwards
> compatible: on SoCs that do not register grf_type_sys in the
> aux_grf_table, the behavior is unchanged.
> 
> Signed-off-by: Daniele Briguglio <hello@superkali.me>
> ---
>  drivers/clk/rockchip/clk.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
> index e8b3b0b9a4f8..911e6b610618 100644
> --- a/drivers/clk/rockchip/clk.c
> +++ b/drivers/clk/rockchip/clk.c
> @@ -509,10 +509,9 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
>  		clk = NULL;
>  
>  		/* for GRF-dependent branches, choose the right grf first */
> -		if ((list->branch_type == branch_grf_mux ||
> -		     list->branch_type == branch_grf_gate ||
> -		     list->branch_type == branch_grf_mmc) &&
> -		    list->grf_type != grf_type_sys) {
> +		if (list->branch_type == branch_grf_mux ||
> +		    list->branch_type == branch_grf_gate ||
> +		    list->branch_type == branch_grf_mmc) {
>  			hash_for_each_possible(ctx->aux_grf_table, agrf, node, list->grf_type) {
>  				if (agrf->type == list->grf_type) {
>  					grf = agrf->grf;
> 
> 

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Kind regards,
Nicolas Frattaroli



