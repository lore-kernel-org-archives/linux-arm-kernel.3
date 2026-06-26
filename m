Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2318ACDE00C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 10:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RiRGYMelPViVpJAFJ/+wpKu/uY7s9Tmxp1lwWzuPoWo=; b=sEq/RoHv0ggrFE6CydJgzbTPMn
	fA0lhhhRchLIEGqIMhM5yBfAMv0WSB8lkN/5Ij4kWn+z0ETLOtrFBpdtHcDCIQtxj1u+234ppGhf9
	I21JgGEupfqemBYh7eUPImkTwYTOAYSejB2EaTwwJJKHLB9Ek9YqdBRvDasXYSvZ5y9yEVVll/4Fd
	LK6PepxUF1DYrEuRFJMYqbpSt3ysuwOWzEmwMzvLa3kT1nZpvXqbqi1v5+tHGZjNGIHYUyniiz+qL
	fP5EOMTUttIiKGpKjEljvhGI6NYJB1f5c9+liUAW3MpxuGQ1QhqVZQ4JLNb5GgOomQ70mn3BIMLcs
	aWQiqMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4Ga-0000000B9i0-0zja;
	Fri, 26 Jun 2026 10:58:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4GZ-0000000B9hc-0MCy;
	Fri, 26 Jun 2026 10:58:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C01F60132;
	Fri, 26 Jun 2026 10:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164181F00A3A;
	Fri, 26 Jun 2026 10:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782471514;
	bh=RiRGYMelPViVpJAFJ/+wpKu/uY7s9Tmxp1lwWzuPoWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YTtqDhZWX4gDsM3ZhC+RSSrkB6J3+JXyXalf7KZmvI6BZPpAJGkTDga9CWGHqDQGn
	 LJHpssTXYqG+amR6YdlEILOJENU/76GWqwO9J07I/gVIQuOKuKPxG1P0gZoo7iKOir
	 n5q9Ss+JnmDQJ4iDyJS+T3T595NfO5VNqkOq5RpDhd1nZ+VRhXaL8O6OcAC2ODGb1/
	 tdmbvqX/GoyXHKrGw5iLfPbV32OPxdhF9Lyd+Ie/CiDTl34hXH2yilooJMnQY1yYAv
	 vLIL5WimkP1EXPSZvqgSGY2TsG+++V4xUtmjlcTAFyS9QmoSyjCMwWDOin+YSd+MoR
	 tO4VZbNwqH69g==
Date: Fri, 26 Jun 2026 12:58:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: airoha: Add additional reset for
 PCIe PERSTOUT
Message-ID: <20260626-talkative-cerulean-hedgehog-93ccdc@quoll>
References: <20260625215741.3253212-1-ansuelsmth@gmail.com>
 <20260625215741.3253212-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625215741.3253212-2-ansuelsmth@gmail.com>
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

On Thu, Jun 25, 2026 at 11:57:34PM +0200, Christian Marangi wrote:
> Add additional reset to control PCIe PERSTOUT reset line for each of the 3
> PCIe lines.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  include/dt-bindings/reset/airoha,en7581-reset.h | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


