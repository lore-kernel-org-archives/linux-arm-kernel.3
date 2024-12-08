Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C82E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 17:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4NGDfTKm88PBXa//lx3APuGR1AJTSkN9EHKc1S2T8A=; b=VBfjI9t01qg1n7MMR5MKmQcI/K
	K+/xMupMNNEX7FBHGBhyWKbqdUjbBGZjzuRdDitUtr2bJw+srZ5nJc0tW0cGNpoCLuZlHdRAook6R
	smzKp0yK16iRx7PmyHV2EixQqQoucrMwx4PjcdS9m9maSP4YlPJ4DYiwPaY0NgWzRokh47WE4W5y7
	aIRmZrpG4il91tSK/ISbNMy3yhNmyjFAPf4HqDmm3sQ63YOryO7iskEIfpvQR9yd0eyTJGIfq0G36
	PVDAzdvu2Yicpcz2694HpN1ZP/PsBRLpcjpYAV3iFp1oJ26VAHynVj2CWjQUhKIFbIsOeBoYX+BZL
	2tVzXPWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKlC-00000005cle-2ANk;
	Sun, 08 Dec 2024 17:07:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKgy-00000005by4-3vMa;
	Sun, 08 Dec 2024 17:03:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D38AC5C4AF3;
	Sun,  8 Dec 2024 17:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4247CC4CEDD;
	Sun,  8 Dec 2024 17:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733677416;
	bh=OjcAvwB2AK9aiYDMht3s2YvA/tWmdDIQS+AqF6PppMk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=D7L43cy7tkH0KdAvN/EPahuuY5iAJ04EP85dKfeMN/DrSxJYzSy42DI8XMMwI+vOu
	 8j01hnxuCeJH9KxOQiIkCmKTxyKd5zsqj5M0Dj2FCRbCRPdad9EfZjNPhmjv6hBXCi
	 yntWkfMrByjJO/O7+ovF1L855z5fk8PXsML6CLzpVFPlWvjSWoicTRrqZWrL3t9oLA
	 kIjGlJ2PsZfVCnUB87CbNkbEdS9wWf034+QcWElpOwqGbfibbW5zv48jBLS39Ah4aC
	 yvzrxSXsOGiJ/ICdij94RXFWetBy+BTIePWSpJM1wnMRkjC/xaRBCHZB80fhuqtdBC
	 wATiMitUlCzPQ==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, krzysztof.kozlowski@linaro.org, 
 alim.akhtar@samsung.com, Peter Griffin <peter.griffin@linaro.org>
Cc: tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 kernel-team@android.com, willmcvicker@google.com, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20241029192107.2344279-1-peter.griffin@linaro.org>
References: <20241029192107.2344279-1-peter.griffin@linaro.org>
Subject: Re: [PATCH] phy: samsung-ufs: switch back to
 syscon_regmap_lookup_by_phandle()
Message-Id: <173367741186.1042266.15067476399278032405.b4-ty@kernel.org>
Date: Sun, 08 Dec 2024 22:33:31 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_090337_038754_936AA5E1 
X-CRM114-Status: UNSURE (   4.41  )
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


On Tue, 29 Oct 2024 19:21:07 +0000, Peter Griffin wrote:
> Now exynos-pmu can register its custom regmap for gs101 via
> of_syscon_register_regmap() we can switch back to the standard
> syscon_regmap_lookup_by_phandle() api for obtaining the regmap.
> 
> Additionally add a Kconfig dependency for MFD_SYSCON.
> 
> 
> [...]

Applied, thanks!

[1/1] phy: samsung-ufs: switch back to syscon_regmap_lookup_by_phandle()
      commit: 0d9fff6c57fee5cccba414a0c40d75812121bdd8

Best regards,
-- 
~Vinod



