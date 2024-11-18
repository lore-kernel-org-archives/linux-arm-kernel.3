Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461EBD6DDC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 06:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7CDREibPzZN7M7Wf0J3Ae7Hg12UEkxqiy5h9D2e/VA=; b=u0T72a8wQGweqzJ7tBFNV+Ev4J
	iE3rSJp6E/d9fqFAZxECDoEp0O+fz6eH8mwmU3sUeboNFkkPCnNhlhWVpje1c05N6rgIQdhAQxzDN
	/lFQqP0TkPj+58JCicpGWuEarM9+Caf5UVlKFDXHfymEpFaYgbEsX2YZGX1YgazP2e42zTPAYRmmr
	BRLYxYY2Y1BDcRI+kfl2mObpfo/eBIv/0kBHVdgeCLNg1mgFvIVTIZw5EtBXiJyaczRK3y3QqOOhz
	IJFddQgiVZtf5AKstGpZQ9ybPG3LOkppT84+vaPyuZA8O2rbtCANfEwQbJcurV8DzcYNWSRnkG+nK
	5+WfKfDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvdq-00000008ZkK-3QYf;
	Mon, 18 Nov 2024 06:53:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvZm-00000008Z0c-44U0;
	Mon, 18 Nov 2024 06:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731912573;
	bh=Ul40GVnC8fMJpggrKRkggKnbsiidAZ2bzmqtOkj/wi0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NVfbl4UVQ3/et0vosbqYCNoRN3n/enogc/hoLE4mIwendojGxO2hiFltimkfbwk+e
	 poQWMli3exiTD7AWAlJewRlmAulSRxD5K4N6BVdkg93Mr+T8jI2A8hqXdKvnAPYwhO
	 o2gfdcJlyxmU3hs0qXU0GIBojctHEqYbVOeyjTxk0cxCsvzqRPl8BhSHwBOWzFF2RI
	 7VzQ+CKtuHcKyeTUNQ2Ox5rUo3B89SnGvsY04rjHuu7vkgOJlt5VbIduct+wcNaH3S
	 K9FzpwrqlovaLEWBcESe/bUqoXhH+jgiE95KYskG4LJy6zD8sb0aBEP06i6xp7FNyv
	 sYr0eVj1TToHw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C2F8C17E1232;
	Mon, 18 Nov 2024 07:49:32 +0100 (CET)
Message-ID: <b0cdf6aa-18ca-4645-b0e0-44c7581018b4@collabora.com>
Date: Mon, 18 Nov 2024 07:49:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] PCI: mediatek-gen3: rely on msleep() in
 mtk_pcie_en7581_power_up()
To: Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241116-pcie-en7581-fixes-v3-0-f7add3afc27e@kernel.org>
 <20241116-pcie-en7581-fixes-v3-6-f7add3afc27e@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241116-pcie-en7581-fixes-v3-6-f7add3afc27e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_224935_193782_9F12F280 
X-CRM114-Status: UNSURE (   5.73  )
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

Il 16/11/24 09:18, Lorenzo Bianconi ha scritto:
> Since mtk_pcie_en7581_power_up() runs in non-atomic context, rely on
> msleep() routine instead of mdelay().
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


