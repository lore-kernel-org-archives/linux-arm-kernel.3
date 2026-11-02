Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86FC606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 02:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gxB0D0Z+;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BdldPLyI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ps/qs5CWGADuVYzfGEn+VGQnXcRANVXhnQ5CyJ+SbKc=; b=gxB0D0Z+Dr+sfT
	TyhDH7ubo8IJE8Ct+keqXikJqKVfaHBNFRRi/EUEkFu7WB/B4dBVUt/Z5Bz7qn2ueaOEuMhEzlZdL
	eZ8fczKQ5QbASoU4M7ODVY2HdM/5+Evw1By16vWiXIm407bk0smDkjPcGjrOBATs0kYt6QD0JYurJ
	VxsrRQIsZQXNwZj/mBCw33RLxIBmyfcWpgqteQbx75/Htpo+9Jl6r9pB/UH87K2WbivW3VXBVgCIw
	xOIiGBBQ7STecfMCuRaANxnvXJj+wF4ryFRtrhOnON3Qy9o6McNBhrucbbRX5iGTeF3NYhxvrnC50
	0xFLt5FLxM1U6l1F647A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNhh7-0000000FOv9-3aDS;
	Mon, 02 Nov 2026 02:22:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNhh6-0000000FOux-2rQn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 02:22:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 244A260098;
	Mon,  2 Nov 2026 02:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6411F000C1;
	Mon,  2 Nov 2026 02:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793586163;
	bh=ps/qs5CWGADuVYzfGEn+VGQnXcRANVXhnQ5CyJ+SbKc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=BdldPLyI7rsUgAobFIathWTmBtP/I9JyKZxIjN+58RQf2UVMmdkEHiQOTIx2To7mr
	 JmzGq3vAdJoOlCAlrScAv3TfXOWXoBnxNSAitEuG0Y5UOcPFq2RcwwcCemeFgfpbo9
	 Z1/U6psSFy+YCoIrbD+kgUaNyOKEAfttvym3B91TtgC7Iy3uCnYyhz4+K9itr2TV9p
	 RB4vSr3cRaibBc69qLWEKv/3ug281NcbnJ/GqjlWDgkgY++rf5LG4qzcAGFlkizx+O
	 X3+j9fZP+6WEIFUJDkLonnzuaKQCSmBvX73LKfDDUnH8pwjUdep7MKHNweo19iXpmK
	 AgSLG2y+rKu5g==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] clk: stm32: add support for reset_control_reset()
From: Brian Masney <masneyb@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261019-ups_reset_control_reset-v2-1-be4ccf511cbb@foss.st.com>
References: <20261019-ups_reset_control_reset-v2-1-be4ccf511cbb@foss.st.com>
Date: Sun, 01 Nov 2026 21:22:31 -0500
Message-Id: <179358615196.355577.6979239007950304521.b4-review@b4>
X-Mailer: b4 0.17-dev-5d8fe
X-Developer-Signature: v=1; a=openpgp-sha256; l=1001; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=b4zZE+9DrZ8HWU79r7L/+S6e/F34MgSto3ilXCnyf4k=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKef37rumDRDxsh1ZOJ6wzPafFd4VTZX/izTenplteaO
 /MzjkxL6ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiT/IZGY4HhOvtsJI5ubnv
 1Fmmk7o31js5XbksHKXToP35Lauq4WGGv5LdQhXL/8xfucCBeYeU6q5FFuvuFsassW4yjmvY8Ne
 WlQMA
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Gabriel,

> The STM32 RCC reset controller currently implements only .assert(),
> .deassert(), and .status().
> 
> As a result, reset_control_reset() returns -ENOTSUPP, forcing consumers
> to open-code the assert / delay / deassert sequence.
> rs.

There's an extra 'rs.' here.

It looks like there's at least two in-tree consumers (stm32mp25_vpu_hw.c
and stm32-dma3.c) that call reset_control_reset() without checking the
result. Would it be worthwhile to call out in the commit message that
this will actually invoke the reset in those cases? I think that would
be useful information to have for someone deciding whether or not to
backport this to a downstream kernel.

> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
> Changes in v2:
> - Increase the assert delay from 2 us to 50 us, a value that suits all
>   STM32 IPs

I think this would be useful to also include in the commit message.

Brian

-- 
Brian Masney <masneyb@kernel.org>

