Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567F6CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 08:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUUSNoULWEjWWqYr00clq36xtQTBfKE3t3CTBlrz17E=; b=xxJca/kLYwoUQCzrxvT4ZWMJx4
	V7u7w6Y7gZPT1jyMkY/MztCJ/RswjlJJvfpMNjGnLxiyzD0nb1gQ/dtuv5WXC/15M3mordvEws3CG
	FpjyLYQ4yxi00mCW38PE7nzl5FAMeCRkTyvd8UNMo6jAS6S/YJf1MglkInBsv/u2ONT8ZV4XA11ka
	LaFaqmNCiNTAVlXQqa/n12hJ5PHZrWXRmvtGsC2GwssyQydEg53FLezGFEWeqaKo6dzJwzaZxRvNE
	znJPJqmgOn4GFpSFVMxloSSA0OCIhYpDrlKR6xr2QG57qt5Lw5+JJQShyHGgfxYf1z5OhQ1qZCmIn
	PCxr4dQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lkr-00000005T6X-1xSN;
	Thu, 09 Oct 2025 08:12:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lkp-00000005T5J-2oJH;
	Thu, 09 Oct 2025 08:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759997521;
	bh=HDPv9WiPLw0BP2sEHt65AvFtVCCKpnVMmx2R3TRokFw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qMMCtFVP1sWWOUk+5CeBOOzafGdA4qTnk/fQMWxbXynXkpNO0nL5BubfKIMdNpxVc
	 KAArGrfvHAsJEl61czGEM3tTZl6UHqhGjUJjJ6WZ8ODhk68RXoOT7B7ozTVjLS/r77
	 mg0+MEPk+Rz+5mzJnVQYAJISKgcxs6R+ASXRAw33F5qBvl67a392L0vwxS3hKLkhxc
	 tSp0zcrouIM7qOdeoLAU7/zs6oNAAQtq/axnmzLzKZwH21CsQSWwxHhguX7+TQLlEA
	 FLAv03tjp7s3hzD8dhfbe+HC7kgpk3mUtLYxGav6K6x/r2tIrCS7m0MBx/dx8srLtL
	 ugefbML1wkDPQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF68117E04DA;
	Thu,  9 Oct 2025 10:12:00 +0200 (CEST)
Message-ID: <482eda01-e170-4f31-8d56-4f5b0b896dd9@collabora.com>
Date: Thu, 9 Oct 2025 10:12:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] clk: mediatek: Refactor pllfh registration to pass
 device
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
 <20251008-mtk-pll-rpm-v2-4-170ed0698560@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251008-mtk-pll-rpm-v2-4-170ed0698560@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_011203_890118_7BA81CBF 
X-CRM114-Status: UNSURE (   7.04  )
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
> After refactoring all of PLL to pass the device, it's now fairly easy to
> refactor pllfh and its users, as pllfh registration wraps PLL
> registration.
> 
> Do this refactor and move all of the pllfh users to pass the device as
> well.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



