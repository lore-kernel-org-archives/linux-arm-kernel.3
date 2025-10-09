Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9B8CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 08:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jn6qdmmZzbeZkCHTFy0w5HJ0t78UwXb78wNH8/0pEG8=; b=YjvbusTKUjTo6hDDzdo7u31WKz
	f8SXN4vHBkA4kksrvGy91+7pM9Ke0zswvYdosHZyCYE3s+vWz71B3dVLZGDdDeVTc07kzX52cqFb4
	RHoDidadZ1wTWACIhnnqUG6PqpkgzgvJGiu8cPsg2v3tXj90mu1fSTpdpuyfk7AuaDUKk3qwIYmKt
	9l5L1WhokTVhT44djF2Zf529tJWLxRF41k3GLcI81LSNJMyeqofBjqoXKqTmQ1EwydYjo6+x6Uv5P
	3lxZ4U8ctemebFgulVKzbmR7gyHtvoI2axAdgq8jymE6qbu0Boc689tzNi+UWjUUgKYI4v1eEz4ED
	9pBINd0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6laN-00000005QqF-0Ls6;
	Thu, 09 Oct 2025 08:01:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6laJ-00000005QnP-0T2T;
	Thu, 09 Oct 2025 08:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759996867;
	bh=DqlFY+zfg6KeRhIUsiMUfsKdx6WZau+HnPPKOGqJT/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HraFy0Jq12QWJzCAJx0MZgvEv+7d0nrcabfSHjL/SqWVQ7Epcrobd0lWV6FM2IQmR
	 Huivx/Eu6nvWBbFkTSVrdBEdCznxgZc5ySyA8bwxQnZpm0ZvuAEljijPVma2jEHg/B
	 7v+myiidksIx+pA1rXWr2KX/EvyiObJQxQLtzAKYcw9k5sDuL9Odu8q19GBjavKefC
	 kHXbKVM9rlSgBD2/8oO9VKPBjni7r9phgpNVc/JVaY2ew+dIVL4cvpjFYHwlboWY1K
	 337eRRqWiJlrzRbI0KqhipLMlDzgAUfzt6yZhBE8PB453ST4A55RiSbhPfZAKIwujC
	 yXxWwIvI1tJ5Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 49AD217E0CF8;
	Thu,  9 Oct 2025 10:01:07 +0200 (CEST)
Message-ID: <602158eb-472c-4443-9dda-aadf2a6c9f6d@collabora.com>
Date: Thu, 9 Oct 2025 10:01:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Laura Nao <laura.nao@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com>
 <20251008-mtk-pll-rpm-v2-1-170ed0698560@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251008-mtk-pll-rpm-v2-1-170ed0698560@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_010111_338710_85FE44A3 
X-CRM114-Status: UNSURE (   7.27  )
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

Il 08/10/25 18:05, Nicolas Frattaroli ha scritto:
> When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> operations, such as setting the rate or switching parents. However,
> another operation that can and often does touch actual hardware state is
> recalc_rate, which may also be affected by such a dependency.
> 
> Add parent enables/disables where the recalc_rate op is called directly.
> 
> Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents enable (part 2)")
> Fixes: a4b3518d146f ("clk: core: support clocks which requires parents enable (part 1)")
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



