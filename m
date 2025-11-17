Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF75CEBF9A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TL7p95TJ8YS7WWH1xCuEfWjQDMAtKcnZf4fd2mcQ7A4=; b=lhhymeNOoLlexX8MD5gJPdCAcU
	rv0sZ0R9XRFr3cUZ9ycTGy0y9uvxRP2ai8PBntT/3y879/b+0CRfPCfkKfxt4pBHrGS4YYZurvRdB
	uvYjCWFG06KBdgMDORwnvvUH9fDIWBDYnR/MEfd7WgTkMgQw87ksvFOxnUqJ2cdATtpVBtPiSL1kq
	MYzvHt4zbIzlM7U/m7ZZqljpoiMa3cvRM4HhP4ujTGqJLencOPfbsk6NKU26a9YZNfd69N8DLCz7u
	43weocVofy9fT/s8MD3/bLdSWn068HtReP21pmoHEhCSXdrzlBcnCC1/S4Z9ZbzSDqIBtYnXVoCOA
	inON2KVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyVw-0000000G5wz-2IDB;
	Mon, 17 Nov 2025 12:39:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyVk-0000000G5jH-2tXX;
	Mon, 17 Nov 2025 12:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763383149;
	bh=ierKwIIuey+KBX9hw2bltCwqXrLhrQJwTN42mjY84yI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d49lZmHlRM17eRcwy37ucduJi/6vt5S30qFVQ1rDXMn58KPiAZu+PV3X9mnSE7m2q
	 zzhhe/mOUDd1XpBzlvkkbT5hUeiKSvNGGuSf2dkb7XNV1pc9i0yPHFjpBsd5lKj8kX
	 /uWx3veA3PYYRhRw2qtCWLyaqy4HVh5zPYsCw+wi3POyszvaOM2Va32XYS53IOLXuF
	 ow9K9pRbJCse9FujAdNkqAHLGqUVmrNPUjy16cwDDdj99SN+pcUL+Eeq6QV3q6nbkB
	 eTvC45gEekK9fC4qDarD8Xs0bF0QBFK5s619StKPVkUVfAbV+al2HXmAgGB+B2z1Oz
	 twtyJGWTWpuJg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C23917E1249;
	Mon, 17 Nov 2025 13:39:09 +0100 (CET)
Message-ID: <2dd6857c-5895-4a53-8ccf-7407e454fd1d@collabora.com>
Date: Mon, 17 Nov 2025 13:39:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] soc: mediatek: mtk-dvfsrc: Rework bandwidth
 calculations
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Henry Chen <henryc.chen@mediatek.com>,
 Georgi Djakov <djakov@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
 <20251114-mt8196-dvfsrc-v1-10-b956d4631468@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251114-mt8196-dvfsrc-v1-10-b956d4631468@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043912_895291_6054F1BD 
X-CRM114-Status: GOOD (  15.63  )
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

Il 14/11/25 17:54, Nicolas Frattaroli ha scritto:
> The code, as it is, plays fast and loose with bandwidth units. It also
> doesn't specify its constraints in the actual maximum hardware value,
> but as some roundabout thing that then ends up multiplied into the
> actual hardware value constraint after some indirections. In part, this
> is due to the use of individual members for storing each limit, instead
> of making it possible to index them by type.
> 
> Rework all of this by adding const array members indexed by the
> bandwidth type enum to the soc_data struct. This array expresses the
> actual hardware value limitations, not a factor thereof.
> 
> Use the clamp function macro to clamp the values between the minimum and
> maximum constraints after all the calculations, which also means the
> code doesn't write nonsense to a hardware register when the math is
> wrong, as it'll constrain after all the calculations.
> 
> Pass the type as the actual enum type as well, and not as an int. If
> there's some type checking that can be extracted from the function
> signature, then we may as well use it.
> 
> Don't needlessly explicitly cast return values to the return type
> either; this is both unnecessary and makes it harder to spot type safety
> issues.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



