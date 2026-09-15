Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C7AC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 09:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BlLytoK9U9ANYNy4BNoi6wfDwQEe5v70EmA8BH9Piw=; b=eit6Z4p4v2urHZIucSgtq0m373
	qaSj7y9LUCWQqROJgtD6h8DFhD++rbwSRkl755sogzPWxEVJpqD46RZYw2lqbB6SxN2tf8U3FiMC9
	qiMmTTZYTeciJQsL4g+KGuxh40U/U2nIQCOQLgAVoCQSpg1uJ8CN9F3HARvoMd15OHbGs3VQBJnUM
	dvR8WxZr5hdyOOF5+lpaBADtJSAgYMXLkHcf2F92cAx+VtZ/JZurx3axjy2Ll9CIQIv3dqtqFaowU
	4CrAVHcK9b0XJBPgEgKLAidDGPpYSGOOFM9gnSjgB5UkS95A1EdXDL8BBOrYQVwre166x5hLYSHAH
	wKcY2SyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PBS-00000005kai-19kW;
	Tue, 15 Sep 2026 09:10:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PBJ-00000005kY9-2wLf;
	Tue, 15 Sep 2026 09:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789463423;
	bh=AO60Q3QxQLSX5nGXdAEMjIA905O1ARI+jXUSfoFnJrM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xwylx1WJsWjs7MjUahl3hMJgjNdBKksZVvff0H5iHgLG5qB45ZPQlYCiwXIMsK3lK
	 EZp6eOzWoCZpPaNUCvLR4bCpYogaJMmvRz1qFtf4/PskWxVaX21htGMHxQp2fnDg6c
	 bfeXSw8W/FbRrf1NIL/bjlKtvBJCme4aAAgrh5HC7rr04ntAe4n30GLO+92SP1MmoH
	 xvb3SrMRi3GdCxxpR3mNL9QMvMjJRBGO/IAdmt9mTstkO9gafUbmkwEeYCMGzaDTam
	 ZNVW+AO4KMoS442wy7WVDoAo2fzyuStsm5Uj16yFQ5YIQWN6B9wW2kjhusekqCAbam
	 7Z0o+5N/YlAyg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 70E2017E090C;
	Tue, 15 Sep 2026 11:10:22 +0200 (CEST)
Message-ID: <2506620b-a89a-43c2-bb86-ee4a136d3719@collabora.com>
Date: Tue, 15 Sep 2026 11:10:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] usb: mtu3: add missing
 pm_runtime_dont_use_autosuspend() calls
To: Joshua Crofts <joshua.crofts1@gmail.com>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
 <20260915090223.1346-6-joshua.crofts1@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260915090223.1346-6-joshua.crofts1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_021025_916882_A8428F52 
X-CRM114-Status: UNSURE (   8.06  )
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

On 9/15/26 11:02, Joshua Crofts wrote:
> The comm_init_err label in mtu3_probe() and mtu3_remove() both call
> pm_runtime_disable() on error or device teardown, but don't call
> pm_runtime_dont_use_autosuspend(), causing resource leaks.
> 
> Add the missing pm_runtime_dont_use_autosuspend().
> 
> Found using Coccinelle.
> 
> Fixes: df2069acb005 ("usb: Add MediaTek USB3 DRD driver")
> Fixes: fa6f59e28c61 ("usb: mtu3: support runtime PM for host mode")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

