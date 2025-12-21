Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9ACE67482
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 13:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLY0MOjGAYimbiZ60W0VjGdoa50Vf/tKW1clAJGNbSA=; b=1Watf5JNIJKWcgMivgW56R4I0F
	0aaR2KmtWU2ThYTLFHdDtEyl4JO+F/BCnzJ5vG+wd9875LrLtqH5xmfXCzZ8yDDH0VPXzLcV1juRK
	pkMwPMOnUkob2XSQXhTamKANPkSSG5fbzbUIt04zYKEcaKVtvZAZff+Ypd9lksp+4f+GaKSkDLrVO
	ZRviRo+3BwKDiato/VWW8rHDEbJJVlCRQkZRL2DdbyEk11YjOyOxas/r+SqHTygSFXQTfh10vAK73
	eGZQynIFaRJgVcAibuYQfpOE8+SlKjGnYLGCbJKlayvuNQuxNq6LqMaRZEfQ6PSXzeAQ5kzVA9enj
	aXV6myYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXJrh-0000000CUBC-1Zm2;
	Sun, 21 Dec 2025 13:52:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXJre-0000000CUAp-0mLU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 13:52:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 703E942B00;
	Sun, 21 Dec 2025 13:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085CCC4CEFB;
	Sun, 21 Dec 2025 13:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766325169;
	bh=2iOX+VikXxGI+1PhprdHaR31tkLCi6+pn/g3cPCvssM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vNiDm+7K5mClmHKCcz34ynTWcsqeGNcH1bEL3L4m7Mh5VJ2csTfbSEfs2xjjqRMYd
	 EDElZXdPz1Yd4fveF+Zj0zULCgNgbrWE8JkUOgH5iQWko16iTQ8q0oD7JFNskD9RqJ
	 OoelyRULKjGujf4jnGd9vj5JLv3nwsKFNTycifvwc47+ET/KmbBldmcfONgQPRCr5Z
	 w/u6740Chow9U8V9KLd7BjjVvCHc9yWd49AOh3LczipyEevSOUqINgiflqNM3hJ+Zl
	 wMbxyKJNlHZLyiht2+STeFTt7tKq150dtc0/imsbSDi8PGOlhqKrIc/Bh46xn9FWO4
	 iM6QGSClc2xcQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, sunyeal.hong@samsung.com, shin.son@samsung.com, 
 Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20251119114744.1914416-1-raghav.s@samsung.com>
References: <CGME20251119113922epcas5p1f9593dbc6cd51d9fa04613d9120eceef@epcas5p1.samsung.com>
 <20251119114744.1914416-1-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH 0/3] Add clock support for CMU_MFD
Message-Id: <176632516371.32657.3772424458194925472.b4-ty@kernel.org>
Date: Sun, 21 Dec 2025 14:52:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_055250_271601_B8F82C52 
X-CRM114-Status: UNSURE (   7.53  )
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


On Wed, 19 Nov 2025 17:17:41 +0530, Raghav Sharma wrote:
> This series adds clock support for the CMU_MFD block.
> MFD stands for Multi-Format Decoder
> 
> Patch[1/3]: dt-bindings: clock: exynosautov920: add mfd clock definitions
>         - Adds DT binding for CMU_MFD and clock definitions
> 
> Patch[2/3]: clk: samsung: exynosautov920: add block mfd clock support
>         - Adds CMU_MFD clock driver support
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: exynosautov920: add CMU_MFD clock DT nodes
      https://git.kernel.org/krzk/linux/c/abc6930a3150003e1a436e906ffd1cafd679acfc

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


