Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A59CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wX50N1iHvuUcfFTPrDTk6BLpkXD7It4diuWw8d34XeY=; b=2S3eZsEFDt1jrxVhTPeqgE66yS
	5krU1JQFrdnOAR7YxCyRV0q5KlpVAIf+qvpRx7OK5Q3ysZ6uiV0SulxCqBAZNS1e++5krtwDgHh83
	NnqbiEtuB5JiONmgQ7e8oFu27aw5Mg62i4UVbGPSEpj7GMuuo6xJx+aFObaCkE9PPOWlyvmqjrrBV
	reW6kjv8xeUPZAlV4AnaqxMI43HlqRsTocdfqMO4ThBMZR+E8ZknLxN/rccEfe0wUol8TM4b76TPe
	py5mo0ve1O0hMRLyoaQTMiiT0bbyF6CmWnzf2Rxh99cPdD0DC5hWrKxBsRBkWnOiSg7DA/A68eibf
	X0xFjvyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFAvo-00000007jtw-3wMk;
	Sat, 01 Nov 2025 12:42:08 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFAuO-00000007j17-3ztK;
	Sat, 01 Nov 2025 12:40:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1762000821; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A7QggDksDzCmseQYSFGx/xof5FXoKWhxWCF1voGnOqira6R7CpXcFOe0adxPrhAfq46N1HjN76y4RmHjG2MKHWqbGxvwsMyJVal7+yN2yaVxHACMWl+iV2XKLZ756ZfiGeB7GPOMfmO5c2NiDuOqi33nIosp10r5BtTbdXDjSu0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1762000821; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wX50N1iHvuUcfFTPrDTk6BLpkXD7It4diuWw8d34XeY=; 
	b=IRfmqhYlU29u+cfbSc2SPpAMwbA9jqEXzZ2q6s4FAq/fo8xrlDQSrLa8qvj+KfyhxxoqqjfejRhYxARtTv0si7j9gCxYbC/wfSsPcXJeow/Nupy5oK9uEUoQqa+vx/v1KKRRxXaopfS8uW9e92K+MwM/7lXIx+A+HLzbpKdLB3Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sjoerd@collabora.com;
	dmarc=pass header.from=<sjoerd@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762000821;
	s=zohomail; d=collabora.com; i=sjoerd@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=wX50N1iHvuUcfFTPrDTk6BLpkXD7It4diuWw8d34XeY=;
	b=hVxDDM/gqRw68T07nRuvdrHGupRkXhOU8RexT1UeP+9bS+r2KO4yzzfNJKjP+80C
	7ABb6CAL4qYLI3lXalMwKyt2SNufHOI19Bfnb3DH6aWQUjo7eCQ7Z9iLnS5/At0SWAQ
	DMYA4onW8qA2XN4liLwbv9J0ttSlgEbygWhi/Tro=
Received: by mx.zohomail.com with SMTPS id 1762000816267360.6637248664106;
	Sat, 1 Nov 2025 05:40:16 -0700 (PDT)
Message-ID: <548101c6c887299b3c39f294e376c782e0bd2160.camel@collabora.com>
Subject: Re: [PATCH 13/15] arm64: dts: mediatek: mt7981b: Add wifi memory
 region
From: Sjoerd Simons <sjoerd@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang	
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,  Manivannan Sadhasivam	 <mani@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul	 <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones	 <lee@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"	
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski	
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi	
 <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, netdev@vger.kernel.org, Daniel Golle
	 <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>
Date: Sat, 01 Nov 2025 13:40:06 +0100
In-Reply-To: <9bf32a56-b67f-488a-8719-3f97d85533d3@collabora.com>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
	 <20251016-openwrt-one-network-v1-13-de259719b6f2@collabora.com>
	 <9bf32a56-b67f-488a-8719-3f97d85533d3@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-7 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_054041_048716_44E23B3E 
X-CRM114-Status: GOOD (  12.34  )
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

On Thu, 2025-10-16 at 13:28 +0200, AngeloGioacchino Del Regno wrote:
> Il 16/10/25 12:08, Sjoerd Simons ha scritto:
> > Add required memory region for the builtin wifi block. Disable the bloc=
k
> > by default as it won't function properly without at least pin muxing.
> >=20
> > Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
>=20
> You should split this commit in two:
> =C2=A0 - Add wifi memory region
> =C2=A0 - Disable wifi by default

Will split.

> Regarding the second commit, you have to re-enable the wifi node in all o=
f
> the currently supported MT7981b devices, including:
> =C2=A0 - Xiaomi AX3000T
> =C2=A0 - Cudy WR3000 V1
>=20
> While I agree that without pin muxing the wifi may not properly work, it =
is
> unclear whether the aforementioned devices are pre-setting the pinmux in =
the
> bootloader before booting Linux.
>=20
> In case those do, you'd be "breaking" WiFi on two routers here.

Wifi will never have worked on those upstream; The driver hits an unconditi=
onal -EINVAL during probe
due to the  missing memory-region this patch adds. I'll make sure to note t=
hat in the new disable
patch.

--=20
Sjoerd Simons <sjoerd@collabora.com>

