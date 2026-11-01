Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067F2606A6D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CKCBmXnY;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=e521Ynih
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=goW7RQ5gSG9M8ONyPtIuBcVGXFA2Uc2cLxCG2sGG9h0=; b=CKCBmXnYsb67No
	LcqhutwuzCF3aXfyaNrJDOM9Ar7melh+7DxNI93HFGfsG/FCunJZ34rG3sETMrF7x+wlBoll0NmrW
	etr6cG087Ug29b2ws8j/UmqDzeH9E7Qzh/lEF8qL67g5ZsHuBPvglRqQWhmfil8epK5mdu9ohPrxV
	PtxEAdlk3V3jPPtSmb4215IoKaE55/8GAiRz4SZfQl1NN7Y6DuGTelweCrRL3ZZOGA3GyMFrSpVe+
	xHwHyAMoNFLxdKiPlZfOG/LwMpsnmnR/aIfa87Qd50L6aXHCq8JPkWrHGLyf5pOE4ULSD4E0Yamsv
	ByNS8Jc//CA0K3hUX6hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdsm-0000000F6VO-3N3h;
	Sun, 01 Nov 2026 22:18:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdsd-0000000F0Xu-1h0q;
	Sun, 01 Nov 2026 22:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=goW7RQ5gSG9M8ONyPtIuBcVGXFA2Uc2cLxCG2sGG9h0=; b=e521Ynih/0ZP2WcELufGS4Msny
	QdmO24BM/lDHX5CE3zgpiWVRcnsQaJImAxf2Ywz4CoNaqjYyj+CD6VeQqsbvoj9pcZU/bjrPFBTMC
	o706mrEcaXYw9aO/SGEHyT+iBxU5YAgiA3l47huvw/w0FebKqIp6TaNx6VBz7aa9fxu9YKpVgja7M
	ltNPL6rZKBs3AHzKTwf5idni0QRBld7Gwm1EUmozDxIiG53q33PW3EDvEQQhLfW2SmgCSa/p5JTDx
	eUFZ6jCOBCaCjOjjVTrfo19al7nXPVWswzKxl+Xt68zDzLjjku8wlMymL61GLuzJIhVeHRAIseYkY
	q358SY3Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 0/2] Rockchip softrst cleanup
Date: Sun,  1 Nov 2026 23:16:35 +0100
Message-ID: <179357139340.4108484.8828443894202280653.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901-rockchip-reset-refactor-v1-0-936576523b21@collabora.com>
References: <20260901-rockchip-reset-refactor-v1-0-936576523b21@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_141823_475913_EC0532FE 
X-CRM114-Status: GOOD (  10.47  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 01 Sep 2026 17:13:33 +0200, Nicolas Frattaroli wrote:
> A small bit of cleanup, prompted by me looking at the softrst driver
> during a patch review and noticing that there's some dead code in this
> here reset driver.
> 
> Testbooted on an RK3588.
> 
> 
> [...]

Applied, thanks!

[1/2] clk: rockchip: Remove dead code from softrst driver
      commit: 3c1db9e5bea27e658c9fd2b0e5dede0949ffc0f9
[2/2] clk: rockchip: softrst: Remove unused num_regs member
      commit: ac718d9a906b7c85ab94f9e77d5734ae5e675249

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

