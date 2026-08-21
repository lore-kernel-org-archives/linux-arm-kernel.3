Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1550FC5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/rYJ4fZhSilGNwmY064VfngAr4dpwpsHUyeKwyptvc=; b=V1cwl+wfwaPLzQdC8vUXZMRNuC
	bewPzfX3iWYDS0WAwIOx1h0Gxns1ZJwetbTc/OIJynbg5LE3CJqd8s+EgmZAdnnjs34C06gH2dg/T
	ZuCAvUE4cti0FzI0lrjrFExJKViGVMH+mnboe4gTNw5LzPpCsddfTKHneB/W0Cz1RcRVpqJvVxfUQ
	rsM+2ELsRTvJ86Pl2e9knEDW4MCT2i/B55G3z23ErKq6o5grfhVJqd08/zy8ca/01SYfl5KdXOS4q
	ZwuSNeuhYXGON6awzKd0jgO/yzxd9mxsiI8dc/E//1b/CKbDtHjinKlH58SDCHox9nLiSmmhdH7ME
	SiMvoVVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPZD-0000000DSA9-48lz;
	Fri, 21 Aug 2026 13:45:56 +0000
Received: from galaxy.gendns.com ([66.235.175.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPZB-0000000DS8A-1eUi;
	Fri, 21 Aug 2026 13:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=K/rYJ4fZhSilGNwmY064VfngAr4dpwpsHUyeKwyptvc=; b=sr6TMcnTl9qCh5RSZeO4vRlT+X
	26RoI97MTXcN3SRY64DN/xA0Nwk7zu0JS2bjkEEBU/cQ2GPOUxh2ekSdZ0RPQOtgpdJYt8rVCQhKS
	SSgN0Kmfqluqi4UksUSVNSKmV7TvNXM3pAQAI8mFQh0lZtOer/oG2tuWInECxCFn7pPbCIFuGwDCX
	WLRCP6iR1pWx5I0ckApDokkrsqs5/s2Kz8FPVOkhR9cy0ROjkwFjMlw7Gcy9I5IIm38VZmIo5KV3k
	tVUHnkY+AdMXJLCRlYFetWU5YLuUayVw3L4gcoPPbYvXMYFfRfIjB4xpWO+8s6cNyWLnjZQdN8Oqm
	CAuI31wA==;
Received: from ip98-183-112-25.ok.ok.cox.net ([98.183.112.25]:62589 helo=[192.168.1.169])
	by galaxy.gendns.com with essmtpa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.5)
	(envelope-from <david@lechnology.com>)
	id 1wxPYU-00000001l1l-0zsN;
	Fri, 21 Aug 2026 09:45:08 -0400
Message-ID: <1f791d6c-48c4-4266-87d0-c70438ec793d@lechnology.com>
Date: Fri, 21 Aug 2026 08:45:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/45] clk: davinci: Make sure clk_init_data is fully
 initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org, imx@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 soc@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <cover.1787239813.git.geert+renesas@glider.be>
 <f3b503ff3fda049988c3e16071bbbfabf1b04629.1787239813.git.geert+renesas@glider.be>
From: David Lechner <david@lechnology.com>
Content-Language: en-US
In-Reply-To: <f3b503ff3fda049988c3e16071bbbfabf1b04629.1787239813.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - galaxy.gendns.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: galaxy.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: galaxy.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_064553_558257_C863FF73 
X-CRM114-Status: UNSURE (   5.44  )
X-CRM114-Notice: Please train this message.
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



On 8/21/26 3:53 AM, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

(had to trim the recipients to get my mail server to let me send the message)

Reviewed-by: David Lechner <david@lechnology.com>

