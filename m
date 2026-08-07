Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AE5C5ACAB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 21:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHBBxbPUVANpahMUOGZWz4stezBioU5NTMq0eeFgIz8=; b=4dRIdIus+6+TparRwS6bG33R/u
	RWH0TAaG/nBE2OcC9islxCTeX3FExL7N/BF5b3R1cYm09jC1gkpkuxp/+E4zfQYJ0XXc9H5qW/2wM
	5BYirO55gZpo48JDQAJgfWVN0LG9SuitQCeSyisgl4zLTYPKyJ6Mhsd5zjM+2p2A/N3/B0YO2tTqv
	Y+wJlVNEbBEO0C1/ikBMOglj9GwBwCd7QwpJakh1sLELGmdgFu2XAQcWkNy3ndG0iHadNd+8Dh6S3
	JvGflA5jKlKWplLxrvMLdHwV1aMT9w62lmCpqzHmigusYplSaAoBZWXjvcprJUMbV7EGen1+JrrvW
	SC6rOlOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsSCH-00000008lnW-1u3E;
	Fri, 07 Aug 2026 21:33:45 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsSCE-00000008ln1-2zIn;
	Fri, 07 Aug 2026 21:33:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1786138415; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wc23WidJGbIWp8Fc9+M+I68bZ4PE3481CJXMH84ECEWzumbc0wNNsxO+/eCvPGGyz2F+4cPGXI8HdocWkO0gPZmjOeJbsHsV3tivVdlZ1T4hTuuGjAeOdpxBPAPvezjK/OQrQeKCbARbZmrM7PAz7WyUYou4xOZx0cBjnJCkBcs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786138415; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pHBBxbPUVANpahMUOGZWz4stezBioU5NTMq0eeFgIz8=; 
	b=CZ1Zq/UXMOXV8BWTC7lqowJhTyKrjo3mdIzxHp+IVlTuwMdLTo/5yiiidivXnQnMg+7fWe1t0uKVMz3YOSvzRF+Hh4CMSLuWHdGVNgjvaVr3zVVO3IqiWAcYdZtH/QdLs6n8z/WEMVXpu5WPtN/f/OQDO3kfPgZPcd/DEP5998w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786138415;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pHBBxbPUVANpahMUOGZWz4stezBioU5NTMq0eeFgIz8=;
	b=bJpBgN4XzSb+MF16ZgRzB3MeQ8Wh9DbgPv4TJJezvakTcET2asvMlAfgzZLS6roH
	iL2djC89XDNBWidHr7yQ8DpHNX0sW39++lmX8eU9EPOkLbTMnXIgCnsMWK0lgrxgCFI
	yRxOWBaPytGeg/DBKbZtGqe44RrBeNh9EFAAC2l0=
Received: by mx.zohomail.com with SMTPS id 1786138412992223.01443850100577;
	Fri, 7 Aug 2026 14:33:32 -0700 (PDT)
Message-ID: <2f63364d-6653-4f78-ab0f-c75b4fd5bb9c@collabora.com>
Date: Fri, 7 Aug 2026 23:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 support per-direction phys
To: Vinod Koul <vkoul@kernel.org>
Cc: jason98166@gmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <20260726-dcphy-rx-v1-v2-1-cf9cc34a412a@gmail.com>
 <82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.com> <anSuxfeitSqmSHNr@vaman>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <anSuxfeitSqmSHNr@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_143342_814319_EF3BD8F8 
X-CRM114-Status: UNSURE (   7.62  )
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

Hi Vinoud,

Thanks for your feedback.

On 8/6/26 17:56, Vinod Koul wrote:
> On 03-08-26, 13:17, Michael Riesch wrote:
> 
>>> +      Two cells select the PHY type and the direction, so that the
>>> +      transmitter (DSI) and the receiver (CSI) can be described as
>>> +      independent consumers of the same PHY:
>>> +        - <PHY_TYPE_DPHY RK_DCPHY_DIR_TX>
>>> +        - <PHY_TYPE_DPHY RK_DCPHY_DIR_RX>
>>
>> How is that Rockchip specific? As you state above this is either MIPI
>> CSI or MIPI DSI, two perfectly standard protocols.
>>
>> @all Would it be reasonable to introduce PHY_TYPE_CSI and PHY_TYPE_DSI?
> 
> I think yes...
> 

Jason, could you incorporate that in a v3?

Thanks for your work and best regards,
Michael


