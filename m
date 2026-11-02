Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9AC60A5BC2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cdcOkWRw;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UixUaAxt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UsABZ0lwLfggHeYm6LleXhMVDT34BdvM7eLvAqIcs1s=; b=cdcOkWRwP6Drlh
	FmyqYqaQZ6vGK5kSS+neEJvO/FBUToZ/qMpeCT8IasshzfwHecgUrZhLTjb5SxUALAgn0iJGSjmbY
	Gu/cJ6nt9URx2Rfgxe5K1ioI2v21HlJGHTL1v89TYbx94Ez8GBOUpoUuJu/7haOIrnpQePQV8seHp
	yZf5OPqV6X0ENASxOerGaQr0ZswnYGMDYq4KA3d7QmsZDV+Fja8A83a3bJXZpU6U8r1yjLBuhqfk/
	I2DbKPWXjF0UXEN9wsgfZ1NnuM12NXT7j0MAB+eFqZ9nKKiQ+iD2zdG22xSTaWjsuMRqOZ8RQdWyN
	bSG009sGx8Q7W0jdO6gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsYb-0000000Gh4B-1Coa;
	Mon, 02 Nov 2026 13:58:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsYa-0000000Gh3t-0YmJ;
	Mon, 02 Nov 2026 13:58:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DEAE741928;
	Mon,  2 Nov 2026 13:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230AE1F00A17;
	Mon,  2 Nov 2026 13:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627919;
	bh=UsABZ0lwLfggHeYm6LleXhMVDT34BdvM7eLvAqIcs1s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UixUaAxty87lFuFytIWEIUzRYsaJcDzVgHw6J++nAujqPiznIGfndAP6SvC8gumRO
	 Qv0ONZx0X/W39T3e+iQwLSl7ca/UnU3vvNGEUlSooWAPEje9WHGZpF/V3kFf29Br5/
	 6+Kf+mObBUGzKDK7GX+Cv9//mCEyipvBFuZzOD3kjdRP6k/O6GEwjmNUrFk7jwkj4q
	 PKc0taGGg6dJFa/g6VkGEi5XNb850jqrLv6XpYPYiDRheV/Yq7wxB/xqlA0x3UK/Qk
	 JnJ+j6aIGzGXpA+rtUG6fIerNRmQoTD0U0H6CScikxnbxmo/YLIPgGZJOU+wf0KYr+
	 mAfmR8fDoFDjA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-mediatek@lists.infradead.org, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jian Hui Lee <jianhui.lee@canonical.com>, 
 stable@vger.kernel.org, Yong Wu <yong.wu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Ulf Hansson <ulfh@kernel.org>
In-Reply-To: <20260926192417.1448813-1-valentin.haudiquet@canonical.com>
References: <20260926192417.1448813-1-valentin.haudiquet@canonical.com>
Subject: Re: [PATCH v2] memory: mtk-smi: fail larb runtime resume until
 component bind
Message-Id: <179362791566.178192.291057765845051785.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:58:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sat, 26 Sep 2026 21:24:17 +0200, Valentin Haudiquet wrote:
> With the mtk-smi and mtk-iommu drivers built as modules, a consumer
> device probe (e.g. mediatek-drm on MT8183) can race the iommu's
> component master bind.  The consumer's probe path runtime-resumes its
> smi-larb suppliers, and the larb's runtime resume then runs
> mtk_smi_larb_config_port_gen2_general(), which dereferences
> larb->mmu and larb->bank.  Those pointers are only populated by
> mtk_smi_larb_bind() when the component master completes, so a larb
> resumed inside the window dereferences NULL and oopses in the module
> loader's initcall context.  The module loader is then stuck and the
> rest of the boot dies.  On MT8183 (krane), mediatek-drm module init
> hits this:
> 
> [...]

Applied, thanks!

[1/1] memory: mtk-smi: fail larb runtime resume until component bind
      https://git.kernel.org/krzk/linux-mem-ctrl/c/dfadc8ba7d2d32fcf7f8f740aa8a0a60e3e731ec

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


