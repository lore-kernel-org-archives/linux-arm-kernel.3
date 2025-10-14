Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93104CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mc9AOiHcgwnUop6Je31sTiU9nXPdrfPEMTdV3OVwjJM=; b=W1AkzuApFtu0VCbgfbmLZpENpW
	Lu3znU18Go83l9yBCK0op0OHOARIaMXGGgumlSyKR1LSeDIUxGtTJRGZ9P93bLvRIRZo4Bc1GiHLh
	Hk5QNDd1sAvMfm95bNjhvBl5vF7VM14+UylwbcDVm9VJzjmejW4Cozt5VIAQzC/ULHc7367ZbXuTI
	TAZDY08fjmq9QeqtOg/R3qwt2odeyD2GB6pE/mgSs2/6pjl/SUoDYxq22FcSpEz5ABoenswZ5j2/Q
	Yavn/1Frzn5Y6aHKkCCSugT8fVqdSh7VWGgk8MXEdDvywb6a6Zyo7oT+dZp9wWAxhqj6u1tDlNYtY
	3BXvunJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dVB-0000000G9AQ-1cUS;
	Tue, 14 Oct 2025 11:47:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dV8-0000000G99d-46rN;
	Tue, 14 Oct 2025 11:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760442452;
	bh=V9yoqwxESdZwxltRllnlJkbdQXUNmo1TpE4ddW0bRYo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=pVxqN0wPKBKaeJhkbaLkohXFCzia/ZgKznHPt9ULdyZ0+kDJSbe65XnV1f260+orS
	 BC6ZKkJYG/M+dqwRVWiVnerOm2HZIYw5PSi0JIZGO01FUfTd8mPhrgCeWtjxSHwnuT
	 RoYVrZbfJ46dEwddj1r/ryHtiMiZA0nHZd2kAIxOyldoahBy9jUu9A3vB7VqkwBjwr
	 pdwLsI06AwXoCcNMW2gkxXQ65IVj/cK7Eq1o1LR3IjutCebOV5Jodg7TXcBjGZmuIp
	 SnwShRldBluFHmBSUjVrv7zNItDL4qYq6IQK3kn3HG+tIqpcxTV3D5LtUQS9dV0Ur7
	 62vyaIO71vA0w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3254417E013C;
	Tue, 14 Oct 2025 13:47:32 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 upstream@airoha.com, Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20251012205900.5948-1-ansuelsmth@gmail.com>
References: <20251012205900.5948-1-ansuelsmth@gmail.com>
Subject: Re: (subset) [PATCH v5 0/5] PCI: mediatek: add support AN7583 +
 YAML rework
Message-Id: <176044245213.17852.7184723529222407322.b4-ty@collabora.com>
Date: Tue, 14 Oct 2025 13:47:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_044735_194581_EFDF6AC9 
X-CRM114-Status: UNSURE (   8.90  )
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

On Sun, 12 Oct 2025 22:56:54 +0200, Christian Marangi wrote:
> This little series convert the PCIe GEN2 Documentation to YAML schema
> and adds support for Airoha AN7583 GEN2 PCIe Controller.
> 
> Changes v5:
> - Drop redudant entry from AN7583 patch
> - Fix YAML error for AN7583 patch (sorry)
> Changes v4:
> - Additional fix/improvement for YAML conversion
> - Add review tag
> - Fix wording on hifsys patch
> - Rework PCI driver to flags and improve PBus logic
> Changes v3:
> - Rework patch 1 to drop syscon compatible
> Changes v2:
> - Add cover letter
> - Describe skip_pcie_rstb variable
> - Fix hifsys schema (missing syscon)
> - Address comments on the YAML schema for PCIe GEN2
> - Keep alphabetical order for AN7583
> 
> [...]

Applied to v6.18-next/dts32, thanks!

[1/5] ARM: dts: mediatek: drop wrong syscon hifsys compatible for MT2701/7623
      commit: 5416aeee4ef761b79d2e1c35f6d9a35bf3104709

Cheers,
Angelo



