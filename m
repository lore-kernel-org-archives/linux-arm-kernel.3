Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5CDCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3HF9SwZ/kD86dwQoW4/jM66szRtAPMeKvjYCq5NQnE=; b=AKcUOmV7cPvX8yYv3U17S3Zqyv
	c4xmr6kT6KogWnZ0PpZjgAyXgKfOvQxj6CU3bMSWkwU4zfRQNObjjdk5TVjrTQiNzH3lZM6enuAhF
	Ycv8AKaeHS+4KvtvBhR3XjGx7bGhHw3ikGsvXIo9mDzhP4aWlc8AMFx2WWjoRcTCRKlavyVRyBxve
	sZFCIGF3ZUoAGkClrvT36tL3fSZct8UWKqSSDBX5SXO+pqEIQZv3Rhfc/mlpx8Bh6zpy8NE7E4Zjx
	8In68kBs8XgcI3a55oyp9NGG6k44b5U8X8Vu06ivxHHak0eG5N8ZfY1miz0pxTSD/aRllXTkzJIL0
	0qD5hSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTM-00000004KcH-3R2I;
	Sat, 23 Aug 2025 08:19:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upXcc-00000003OMk-1aS2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 19:40:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65F7C6023F;
	Fri, 22 Aug 2025 19:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66A2C4CEED;
	Fri, 22 Aug 2025 19:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755891621;
	bh=KtVNSI3n9Eo/JyZH6l2EiTQ2eYL8W/635pYYJ4jBuvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FEpyDBGj4IkEi7MrvVMXP+ihv8WBLGzwByWxwkkH0Me1aSeYHMdvEvBH2lpiyk1Nr
	 OWzl1+UyRdtFhhblgrlNuRlpmnRCMZWz+oNpSrvne4yiRt33PYORAAgXWfZJNgZWf+
	 jJeF5sO8V/Oiv7+ImaxmD0u0VNL06Km4nUV/Mvov0/ai83PObHw23omgCC3kwJoaeK
	 oiLVUnUMzjeMvwIyQlekT9z0XQcryAs1eEBj0GEokzZxR76larKb0vOqdclB52gNFO
	 rXhbKXjCiKrv2/jxnT6mYzKlOWsEVx0E8bi45bW58nRjN2SdOeT9J4N4o3/4c3lJSv
	 45agHxWxkFhUA==
Date: Fri, 22 Aug 2025 14:40:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: cw00.choi@samsung.com, mingyoungbo@coasia.com,
	linux-arm-kernel@lists.infradead.org, alim.akhtar@samsung.com,
	krzk+dt@kernel.org, linux-arm-kernel@axis.com,
	pankaj.dubey@samsung.com, hypmean.kim@samsung.com, sboyd@kernel.org,
	krzk@kernel.org, linus.walleij@linaro.org, hgkim05@coasia.com,
	conor+dt@kernel.org, jesper.nilsson@axis.com, smn1196@coasia.com,
	hrishikesh.d@samsung.com, inbaraj.e@samsung.com,
	s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org,
	tomasz.figa@gmail.com, mturquette@baylibre.com,
	linux-gpio@vger.kernel.org, dj76.yang@samsung.com,
	catalin.marinas@arm.com, soc@lists.linux.dev, gwk1013@coasia.com,
	arnd@arndb.de, will@kernel.org, pjsin865@coasia.com,
	kenkim@coasia.com, swathi.ks@samsung.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	shradha.t@samsung.com, ksk4725@coasia.com
Subject: Re: [PATCH v2 04/10] dt-bindings: pinctrl: samsung: Add compatible
 for ARTPEC-8 SoC
Message-ID: <175589161947.192356.7959159186855408462.robh@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <20250821123310.94089-1-ravi.patel@samsung.com>
 <CGME20250821124034epcas5p350aeb42b9065fcbc3d9f713df1649574@epcas5p3.samsung.com>
 <20250821123310.94089-5-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821123310.94089-5-ravi.patel@samsung.com>
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


On Thu, 21 Aug 2025 18:02:48 +0530, Ravi Patel wrote:
> From: SeonGu Kang <ksk4725@coasia.com>
> 
> Document the compatible string for ARTPEC-8 SoC pinctrl block,
> which is similar to other Samsung SoC pinctrl blocks.
> 
> Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


