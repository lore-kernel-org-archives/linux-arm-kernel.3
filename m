Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BCBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGgN2/HFGqb9sJPIBobkAavwHd6m6iCcZaCrbIb56A4=; b=hf9azrZHIKZ7T/CEi25FwvRmYk
	k5F6QgVRzhVRQa+komF/oMwO891rPosXgrj325/S/Oq3zh5tVmXS87FY31Vim85zMFkLhZ/sW28MP
	GzjjDEio/ef+zxCAC3CCpMlo8RfZhs+eU4DVtXSj8mBiKeQcPD6D5wGfGeSAM94IXm6oDcpBP4EU7
	DauNm7IMEChK0cbQ5LTcFwMKEj8CrjaMOHRsRNy7rQawSrTITC1NceQ4Z2u55yOrC/iJLTmg6K7Br
	EkNAx+umsrEyADge8Gsog8FlsKMGdeRTvFsT4tRM+46AV5AE8CxQnGc54g4QpkUQOU5SijTOIxtgb
	Vy8+KK4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1who0V-00000002R2m-02zC;
	Thu, 09 Jul 2026 12:37:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1who0Q-00000002R1O-3U5u;
	Thu, 09 Jul 2026 12:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783600648;
	bh=8yyJEbIHI2mkuZBKd8+eqb/esgh9Y/d8wQDBk8sgJeg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bILNGBKVnYxOwqyfBhm9l4O+SEleUGbT1RuohSDGjgux6kPL6NhAJDnR0UE3AXNFN
	 WD/IcfHv6DhjbOlZKc8xRe/tUzhZT54m9UTuXWrYjz8to9q3gqaczIm7KnQOBzfRbw
	 enJvAZvVHpiEo1QjZUBlHcFo0jjzpnZXRoVBTmUFZWUHXk2MPVuiiyN2WK/uoXvBTQ
	 FgUvLGP1fpQGZfVKKabsniJEgwUQ5fPdx6sDXMUIOUGmwxXquBnloZhnLDY9J+cT7c
	 sLVrQxVpLITaWSYbRH3OHCW9CusnPb59BlJxIdRWlAQU06ouMyqfULUykW5D6JN4VO
	 CBLnLflspAz0Q==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3284A17E079B;
	Thu, 09 Jul 2026 14:37:28 +0200 (CEST)
Message-ID: <ed27cde0-2a52-49e2-b4a5-a6fbb4be2112@collabora.com>
Date: Thu, 9 Jul 2026 14:37:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: mediatek: pllfh: Fix IO remapping leak in
 register_pllfhs error path
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260709-clk-mediatek-pllfh-fix-v2-1-a235078fe9d5@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260709-clk-mediatek-pllfh-fix-v2-1-a235078fe9d5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_053731_020965_DD2A90E0 
X-CRM114-Status: GOOD (  12.45  )
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

On 7/9/26 14:23, Louis-Alexis Eyraud wrote:
> When mtk_clk_register_pllfhs function fails to register a PLL, it
> unregisters all PLLs and cleans up itself in its error path before
> returning, so the function callers don't need to do it.
> 
> But contrary to mtk_clk_unregister_pllfhs function, that does almost
> the same sequence, it does not free the IO memory mapped on fhctl node,
> leading to a leak.
> 
> Fix this leak by factorizing the cleanup sequence in a new private
> function and use it both mtk_clk_register_pllfhs and
> mtk_clk_unregister_pllfhs functions.
> 
> Also, change the loop index start value to avoid the -1 operation on
> index at each loop.
> 
> Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL hardware")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

