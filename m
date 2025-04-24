Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8957C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 07:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Nw5aseHOhIbLTKLOXIlzEwQhv70Jz8gP9ue3vYG3VA=; b=giCIBZPctnGMNn1qRVyPNIU8Ma
	aYEhUt3NHd/vgljhOYvJ+hWHtEJMW6a1NwroD5MRpTl9wr9qMv4xVaQytIVxIeohpdtO3ab2MvN4S
	1sTaI1LfBsrWrQIjHeR5m0XxcSTh5cN/Mg89X1JWZUjLxjsLi/SS6fj/18WjErx0Fd/mDq3xamhyd
	91RAjgafU8JoWdpa2hIxzB5w0gpG6OaTmHAgspIAZbRD8+LQ58qDyaK+J1As9DoUORgIBsd2Htxgx
	7mUd53bV4h/RqCUe5gjtn5xl1QQALodCfcEp3HGmVFEywkmcUD/gm8fweo4cQ2nloiUQH4rKt7T7p
	YI5CUb4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7r1X-0000000DBTe-1ZBM;
	Thu, 24 Apr 2025 07:29:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qzI-0000000DB1y-3nfw;
	Thu, 24 Apr 2025 07:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0Nw5aseHOhIbLTKLOXIlzEwQhv70Jz8gP9ue3vYG3VA=; b=TxQeL6WMnTTBtWK7rOSZxEmN3G
	1LQVmKbBxjnbtAtYk/Ls/XxPvPcLleDGjBODxisVCk/SNaeu5ZjIQZgXgcmN2M3RlnhoL1euzNRXf
	Xhpn8DDvnDdHi/RCoeRcNwRL0JzS4jAgT8DKA29YSAWGaH7It/vsd7Xy2rwgGUgdC8tF6KglcP36k
	5WNXr+DcjSNoIgB0qxwpjO60xMEmzgUPv/A6+InEBY+YR2y6Pfcd3iOCQ5sE24sOFLmRyJtozFCbh
	/r7D7XssVfOoIfk85brCLjtpcl0bnONAehCXn0WStjNxA71LRk0CG3BeQnuqf+FaGZNb3uKoxaNOo
	gbvvjTZA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7qzF-0000000BYCz-3miW;
	Thu, 24 Apr 2025 07:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745479624;
	bh=ljhJbQLJJ86qgaZxYsvXbNm6MCq8nLzlJBcZNJhB7ww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=czB6Z5PcJq38V/WRS9lzymYte5sDUYePs29i48bee56SfP5Ek4WFa5LlIW/Gk/sko
	 IEEJaERWEUV9xJs0frGN/UEYRleYGtPB/TyY7MFepxu+E/R9JZ2UyOtTIBoE5mcnA9
	 L/PhHPpu7r7WCgsXFV/RFSiCQpo/E+KPYGnWAQLKlLj7xNRon9LUVDV8FhKGFkAqzg
	 QpaZ1pZyrE83Y1qd74GZUuZlhrPCF/8Ynu2n2UEI5yJdTMC45bvs9TiO19F1IEtaC1
	 FT67ui3LtHrEWjRtxbOw/250wWG2uAYXjhWKkTWM6EZ6WF6urvr3F2xAQ8p/vDQ//6
	 enag0pi9tPg2g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2BFC217E0808;
	Thu, 24 Apr 2025 09:27:04 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, yong.mao@mediatek.com, 
 qingliang.li@mediatek.com, andy-ld.lu@mediatek.com, 
 Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20250424013603.32351-1-axe.yang@mediatek.com>
References: <20250424013603.32351-1-axe.yang@mediatek.com>
Subject: Re: [RESEND] arm64: dts: mediatek: mt8186-corsola: make SDIO card
 removable
Message-Id: <174547962408.16683.11392020991480921546.b4-ty@collabora.com>
Date: Thu, 24 Apr 2025 09:27:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_082710_110278_3063C7B6 
X-CRM114-Status: UNSURE (   6.15  )
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

On Thu, 24 Apr 2025 09:34:35 +0800, Axe Yang wrote:
> Under specific conditions, the SDIO function driver needs to
> remove/add SDIO card to perform a reset. Remove the non-removable
> property to support this scenario.
> 
> 

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8186-corsola: make SDIO card removable
      commit: ab394a9785f0339fd6617cd51ca4e2982a82cd87

Cheers,
Angelo



