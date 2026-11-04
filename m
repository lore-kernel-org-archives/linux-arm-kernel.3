Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D50606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 22:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xuoi45Ot;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JB5gLwpc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xfCUcWF5iTPTTtnt+wRlptQerZfB/hTrl+o+h8x0xIw=; b=xuoi45OtAvBapI
	FRsiL2DUGxZTBUS1Mh1ZO39uV4atvTCLsyF0IYr+t3ffGL7Pd4yofQ5ISUTeWePHocVI2AJG/NHVZ
	IXdAJtaNUwsYxieRtkKZhyQlbDmSzkUHrL+2Zq3cXqCOfWlMp58+wKAMEAgMgIkpntmOvUdpraIAk
	Fx0zZisZixe+LItgdg4CUJoEfxTVu3kTTQ26sz3tdc5dDxap3AApzMzI7FrpjRMrf9LNXTu1ZXiiZ
	2QymV+4ZcDxPCRfLAIVSSt07NrcRblFE+ir1aGm/NsQYk1FnnRd78sRx2g4j6wdAeTY+uT1kSNh7F
	yWVwmyHuQRx9zfcT2Xow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjhA-00000007Alb-2rj1;
	Wed, 04 Nov 2026 22:43:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjh9-00000007AlT-0cVT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 22:43:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 89F9C4089E;
	Wed,  4 Nov 2026 22:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BABA1F000C1;
	Wed,  4 Nov 2026 22:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793832182;
	bh=xfCUcWF5iTPTTtnt+wRlptQerZfB/hTrl+o+h8x0xIw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JB5gLwpcA3pgkb82ntBESuCnMulwhHa3nhr+vKR8DTw65EDkCuATnnz8DzOJz1DRt
	 JBfggSISEgJMnu/r3PJHzyeDDftzzCTVYvrfzRLxXxenZnUQ+A95F5LelVkNe4/J/S
	 jM/RZfwMDFSZkVZISVs51qFdNHhb+RroAEzr6GYNEDIY7OA3XfMUU9vGe0+0OTnQyE
	 CHqMIoghRj+quG3YzCPCiMvx1j4HlMDOUHUxYcddwtEtPIIMGP7GLpUpbIWfhZRl8n
	 QytCd2kSgVia3wGEsY10TJE/vIoL1wmHjrXRXy/9AR4+oEE2/vnux38cZJKNnIQx5Z
	 mM/+J8SIAyK7g==
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antonio Borneo <antonio.borneo@foss.st.com>, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261020-ups_mp15_clk_update-v1-0-67da20111b08@foss.st.com>
References: <20261020-ups_mp15_clk_update-v1-0-67da20111b08@foss.st.com>
Subject: Re: [PATCH 0/3] Subject: [PATCH 0/3] clk: stm32mp1: add I2S_CKIN
 as PLL4 source and keep boot-enabled clocks running
Message-Id: <179383216216.724795.5427816189505409179.b4-ty@b4>
Date: Wed, 04 Nov 2026 17:42:42 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=820; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=lPLBBMLRBSUJePs+9+cbHKp8v+ePqO1f7Zw5/dLhgrk=;
 b=kA0DAAoWt9LdJ11+wIcByyZiAGrrtPChydHrW6O3SfTo3tMmeplujPzk2w4/aI39D1Rh52Ib8
 4h1BAAWCgAdFiEEpG0ycFhlqj3e3CkEt9LdJ11+wIcFAmrrtPAACgkQt9LdJ11+wIdM0gEAtdso
 FXC0bKFk9Qv2+QrKD+x6t2EGwngkfuDTOuN4A6MBAN3reACYmINUNE+/46n7+ttTDKixFvVIIa9
 wmKI4pvUE
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


On Tue, 20 Oct 2026 11:48:52 +0200, Gabriel Fernandez wrote:
> Subject: [PATCH 0/3] clk: stm32mp1: add I2S_CKIN as PLL4 source and keep boot-enabled clocks running
> 
> This series contains three small, independent improvements to the
> STM32MP15 clock driver:
> 
>  - Patch 1 adds I2S_CKIN to the possible PLL4 reference clocks
>    (PLL4SRC = 3).
> 
> [...]

Applied, thanks!

[1/3] clk: stm32mp1: add i2s_ckin as a clock source of PLL4
      https://git.kernel.org/clk/linux/c/57f8b36fb36c
[2/3] clk: stm32mp1: don't disable a PLL while its P/Q/R outputs are enabled
      https://git.kernel.org/clk/linux/c/fce4f8da5a6e
[3/3] clk: stm32mp1: don't disable the ck_trace clock when unused
      https://git.kernel.org/clk/linux/c/f9296c2513e8

Best regards,
-- 
Brian Masney <masneyb@kernel.org>


