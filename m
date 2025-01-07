Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8989E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtY/dTGdpigf++m9/HYVL1sEfcqNn5ZD1yZ5BGh2v6I=; b=CsSu0Dy0jKYQBxj9vlVoqrgEGs
	dVaOAAH55B47swosuoEmeRrgNkNkFrInz7qMrgM1mWNE0gCuvZBi9QXgVh0xgZHrJXCrWpHcPdP87
	bRTQTQLsnPq7XEuGehYHWJgI0zptNQqpeF717z4u8FSl3PQJDeg5bmfaknisJGruhdS+4lv5BfoOV
	KkEyOHJzYDitNhZumuGwCvfek/4nQ554neXZ59dUFdAug04X8u1rFeTHoYjN08VWU+aH7967mcaS9
	jZPQNP0NXASgpuN61ugSCurMthwn/cchtvtx7QNx72DY1lVkaRQGMg5kbxF2QpWcsqEyR5gzZQW/w
	+ZZytZng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVB1T-00000005KWi-3QN3;
	Tue, 07 Jan 2025 14:57:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAwZ-00000005JGN-1LB7;
	Tue, 07 Jan 2025 14:52:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C2E35C6331;
	Tue,  7 Jan 2025 14:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB03C4CED6;
	Tue,  7 Jan 2025 14:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736261550;
	bh=WxQAHvKNDf1t1y8WP8kQLuS53Cn56vM/HgaXsAHmZu0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DJ5a28p5C1p3qCfa8LQJ394zZ/jabUsHQ9XSSnPY6jxqQjGkXKBNrLbl5sPl1Pitn
	 f20Uxn92kTDumq0VBTngaUAIK0G17qi1lCrL+ztyW/bV13vHfbuVOwxBxhMhZ8a6lw
	 ugnObBQzN6unU3idmrKZnnXPImvquLAWlG4c5DZW1cEJuTrlvbLnlKwar+lal66IAM
	 WvPCehI17rTQ+M5FsSmolNp0pm/VkSzcgGU47LQqUaJQn01r4Q/VSN5CwmSxCZBWil
	 tsNTk4s8VZuG9K8PIlIA4vOrDon6IFavxkSzotHbTbkj6gVLk5FIKt7ihCdc8+eNSD
	 4P7F8SrHOZjVw==
Message-ID: <02896f96-57dd-47d5-8fa0-8a8aed30fa9a@kernel.org>
Date: Tue, 7 Jan 2025 15:52:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 1/8] page_pool: introduce page_pool_get_pp()
 API
To: Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com
Cc: liuyonglong@huawei.com, fanghaiqing@huawei.com, zhangkun09@huawei.com,
 Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Saeed Mahameed
 <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Simon Horman <horms@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, imx@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, bpf@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250106130116.457938-1-linyunsheng@huawei.com>
 <20250106130116.457938-2-linyunsheng@huawei.com>
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <20250106130116.457938-2-linyunsheng@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_065231_401708_827D8A20 
X-CRM114-Status: GOOD (  10.25  )
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


On 06/01/2025 14.01, Yunsheng Lin wrote:
 > introduce page_pool_get_pp() API to avoid caller accessing
 > page->pp directly.
 >
[...]

> diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
> index 543f54fa3020..9c4dbd2289b1 100644
> --- a/include/net/page_pool/helpers.h
> +++ b/include/net/page_pool/helpers.h
> @@ -83,6 +83,11 @@ static inline u64 *page_pool_ethtool_stats_get(u64 *data, const void *stats)
>   }
>   #endif
>   
> +static inline struct page_pool *page_pool_get_pp(struct page *page)
> +{
> +	return page->pp;
> +}

IMHO the function name "page_pool_get_pp" is problematic. As calling it 
"get" indicate to me that we are taking some reference on the pp object. 
Is this you plan in later patches?

If it is simply a dereference of page->pp ... then we could call it 
page2pp ?
... but I'm uncertain why we need this change.

--Jesper


