Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39E9606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 01:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MhWdysv1;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mKSFrJKV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MROGN9E8EJD6Dob6PvAu9y9tvnVdyuPg06+xGcxd+JQ=; b=MhWdysv19mjRaS
	Hm37kAv/ZhAvBzs0HFYS4nijckY9XC2iELLJYGsoF4cFTeavC/pYHD2+YNFSrVPhfyx7a1Jawhv3t
	lKRkkiqFE9WPjUZVJkDE/NKGGBTg+Ouda0jpv+JWRNcWzIQPvTiVfpkitgWEtD6OjaEoG+O6JbXDh
	IPbjIyNQgaLMuKeTOSMeGpN9BUspRmp4TPD/h0oQvaw0N9uciJck6wxIbOAp5JTUkBDQoRrIyIAYt
	JK80FrnTjIBKb/uW7nxNbHIsauH6MUq93jSRip3VM63gwXPuPFLYmlyfmtiSnlHuVmxazOKh5sAo9
	b35MRLJnrxuoOVyJS+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNhEt-0000000FNg6-36mj;
	Mon, 02 Nov 2026 01:53:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNhEs-0000000FNfb-0xC3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 01:53:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ECA743AEC;
	Mon,  2 Nov 2026 01:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8951F000C1;
	Mon,  2 Nov 2026 01:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793584413;
	bh=MROGN9E8EJD6Dob6PvAu9y9tvnVdyuPg06+xGcxd+JQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mKSFrJKVgmGVVzhHaeWprcQvTRIvHbFawicYqyIc2MXnSqdCiJDgbdAK539ODKohv
	 pBpSj8qqZSvk3b46E+nzHPmlATgR6MnxMylMcQHlhpwCu/lti6r+F6J2NKQec/jdFV
	 A0zHa+hdyK5GoLvyLukY5Sl1xdqGBo6aglp+aFXfUYWCqQpBLk3tGwj+Ld16+31Kcj
	 hXLHuCm87XZVwr8gvarOxdsbQPrkBuR8r+SFam5YE6lVAng8bM88giNWnKtSlIj2ux
	 7fn2G6TRR7p5i3u9fL2qXyWzlaWVY48mDSYnwBopckalJOKT2DFr2EfRETzUpvCQGi
	 2iipInWf9LmWA==
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Olivier Moysan <olivier.moysan@foss.st.com>
In-Reply-To: <20261023-ups_mp25_clk_mdf-v1-1-3043b3fd4bc9@foss.st.com>
References: <20261023-ups_mp25_clk_mdf-v1-1-3043b3fd4bc9@foss.st.com>
Subject: Re: [PATCH] clk: stm32mp25: allow MDF kernel clock rate changes to
 propagate to parent
Message-Id: <179358440476.349160.7540127270699640525.b4-ty@b4>
Date: Sun, 01 Nov 2026 20:53:24 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-5d8fe
X-Developer-Signature: v=1; a=openpgp-sha256; l=356; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=sRSUhW0nCs7Zfux0rOD2DZbpMM9hzet8PA9cOK33KXg=;
 b=kA0DAAoWt9LdJ11+wIcByyZiAGrn7Rags8rSQuCbM7vJWk1bUBv99T9TC14cpchuBdRWSfk+z
 Yh1BAAWCgAdFiEEpG0ycFhlqj3e3CkEt9LdJ11+wIcFAmrn7RYACgkQt9LdJ11+wIcVrQEAm4WV
 PUi+6S6tp/poyzpg/Usc8X6VU9uPBAOw1qbgZfkA/2aHz8WlzQ7R/IhaxLS6FqDS1s4+kKOBv8e
 3bCRXh/kG
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 23 Oct 2026 08:50:23 +0200, Gabriel Fernandez wrote:
> clk: stm32mp25: allow MDF kernel clock rate changes to propagate to parent

Applied, thanks!

[1/1] clk: stm32mp25: allow MDF kernel clock rate changes to propagate to parent
      https://git.kernel.org/clk/linux/c/1d6eae1cc3dd

Best regards,
-- 
Brian Masney <masneyb@kernel.org>


