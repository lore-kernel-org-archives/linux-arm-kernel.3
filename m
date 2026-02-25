Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E26FD375E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjoi/tdi5Udptnb8uShxOAXdeKTkS37ls+psj9vBk/c=; b=iLZKrN+C3zWqhFY5UKBM49JKzL
	8qBbO/Xhc8ZhQimsiZQCP/zOUNWby6Xdfy05J9kPK3/6TvTfI6Y8/1RTRHoLvMPyUzU6VyKwU0GMV
	iNIxbQKPeg9BI7CI7OUMGKtDCsiEpKm+31LAcbwZGM5RCHb8FUC5c0rewOMVawSyAM6D2NpL7flAy
	WJIZ7m5T4YSp18mv83dZzs0YryiXYL0morSSQThdt0D7E0h9S0knV2zSBcmYDu88bLpqaqdzK136f
	1JfqYaB33WmbUgISzFkRszYmvv5OcbL1zxrZLlIFulizju68ozJYS0qDR0HfJNY26BYpK0C74Ayxg
	egy8Zpfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEhZ-000000043Kd-1woT;
	Wed, 25 Feb 2026 13:13:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEhQ-0000000438q-3ilV;
	Wed, 25 Feb 2026 13:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772025186;
	bh=n4DHsYxUKbgES8MiHsACk0FhFdNJP+CaJdwmJWhWYi4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Onu5z4WqnR/45diDIi/k8XZqdvJ6b9N6+Qvzu6F5eIir/6l0ngkpAjraPNJMwpR4x
	 yQgO0HEtqvSJ3tP0m04aw1j8GeIHl+4GYESGhyxQjNHVK95gK+QQdF1CJKyX+e5buw
	 xHblyUWmbpzwk5w2lNKkcCQJdQG+RxWQjNE/chLCUzCFUvsdm9/qe8YeKbxjUgNz3t
	 CYu3bwCG6VtIvQpq/t1QxE1H1ubJkLRm4GXKlWncpUFjq/V5RqHzVHO++Jti5YRHwG
	 kWoDlvpHU/JBeDX3/W+Kd7f1EvdWR4kJNTRe1BUdX8LGTUi3GDHpnU5Yw/4DO3xOwB
	 XquDH7uzzIbHQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A59C17E012E;
	Wed, 25 Feb 2026 14:13:06 +0100 (CET)
Message-ID: <ff0fd6d6-c7b7-420e-96bd-75f844188cf5@collabora.com>
Date: Wed, 25 Feb 2026 14:13:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] PCI: mediatek-gen3: Clean up mtk_pcie_parse_port()
 with dev_err_probe()
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260225072225.3345307-1-wenst@chromium.org>
 <20260225072225.3345307-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260225072225.3345307-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_051309_472150_879D24EF 
X-CRM114-Status: UNSURE (   9.25  )
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

Il 25/02/26 08:22, Chen-Yu Tsai ha scritto:
> mtk_pcie_parse_port() in the pcie-mediatek-gen driver has a bunch of
> 
>      if (err) {
>      	dev_err(dev, "error message\n");
> 	return err; # or goto
>      }
> 
> patterns.
> 
> Simplify these with dev_err_probe(). The system also gains proper
> deferred probe messages that can be seen in
> 
>      /sys/kernel/debug/devices_deferred
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Ah, finally - thanks for this cleanup, love it.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



