Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5075CD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 04:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4c4vh6+BB27uxbgTfjCbJ0ljIKXa19ItFtJ6p1jjPhE=; b=O1tWKoECv0bBZzSM4FM2UKjihI
	BoBDkOJFA8bZ5yebnLu2ohPJOfgBBAcnNf+B4OG9GtQ3Ntse0dcRIRxGDuCbsJrcTi7U0f4mHa3+5
	O25o6rST6qXGJJn7+MctBKt612rrgN2GKcyYnLk13nR+QZI7syutKQwZgKvmPxdG/Y3y3JfZG15iY
	xt1EbugxeGGtI5w3V5O60JKj0Sk2rHZzqAl+wNC49wdVkUxAgbD94q1bd6mgmTEe9gNvEJ2hmOwGI
	syvjTo0b3r+9CQnO4qFfPe6fQsO4dOevXQu2JO1S1y9bMXJCUZLSU87Geuid3GyOGmHdZRxVGJTmR
	KcG8fGkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJl7n-0000000BWXZ-2ypt;
	Fri, 14 Nov 2025 04:09:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJl7l-0000000BWWx-0UD9;
	Fri, 14 Nov 2025 04:09:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9AAD43BD8;
	Fri, 14 Nov 2025 04:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33D7C116B1;
	Fri, 14 Nov 2025 04:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763093364;
	bh=4c4vh6+BB27uxbgTfjCbJ0ljIKXa19ItFtJ6p1jjPhE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mVTBspbHocqrJlpBANsgISapRzBdfdNGoru83F3NNHZwkHYdO1UcAWFrLoL2WsAAn
	 OyA1tVHtn9da/L7l2EBSg6WYGs9uMzn4BI3dHghKKouTZ4IoEkr4/AS4yJClvHl4VD
	 FCXl/B/gl1X+nRc6vnC6TqtKpH0W55WCgc+hDkuxa3yFb++Uno4mOrJLQQzAWKbmQG
	 U1adN3w7TuALI3Q9maT9BjId15Y8ld7R/pOuOZxNpid70VUXR7wLu2KwEbP8wIlrQc
	 uwpsuBKRy2NrU9X8Zz66x8pb9DCWRovHz53/qMDlwSNd4wPWHgm/Se27wAUUY8aySJ
	 jQyOv5YDjsdRg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110035645.892431-3-mikhail.kshevetskiy@iopsys.eu>
References: <20251110035645.892431-1-mikhail.kshevetskiy@iopsys.eu> <20251110035645.892431-3-mikhail.kshevetskiy@iopsys.eu>
Subject: Re: [PATCH RESEND v3 2/3] clk: en7523: Add reset-controller support for EN7523 SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Andreas Gnau <andreas.gnau@iopsys.eu>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Thu, 13 Nov 2025 20:09:22 -0800
Message-ID: <176309336273.11952.13793350271645615953@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_200925_173699_BFE533D8 
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

Quoting Mikhail Kshevetskiy (2025-11-09 19:56:44)
> Introduce reset API support to EN7523 clock driver. EN7523 uses the
> same reset logic as EN7581, so just reuse existing code.
>=20
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

