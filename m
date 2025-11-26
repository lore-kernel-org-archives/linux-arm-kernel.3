Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962F1D11195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 20:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0j5ImwVqZkkGp1vBWyag7W0SzOD0T5SnYVSte096OM=; b=uq6ccWa7UJvLuF2kxnQS4BvDPj
	dkFjXovNW1a9iBJWYg3dbqXEfwG9DLPEY85ecnj0MRDdRvMPzWzRLpGgpLVczH9cGg8TP459eqz3E
	LP2TrvDN6s+nxy6nLUgH+N4lRuZdRPLvf7GPcREhAT8cUiPeGSVOMzHtHmQRCimAOiCdNeUqDcCRu
	xXmhDDZQkBq2CmmiikmzymdRJTN7FVqpS0Jfgq7mgWR3+pWBDyLFPn1kyhyZfFwcjXA5D2aFA6dSv
	ZRlufFlEPj3plgrb18Zxi2U0O1DxS2pNNFCmgURak7HnpMS/T1p8NBqONUFX6Z5wNAd5XU9HQtz8q
	bjPw4wrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOLlV-0000000Fax7-2Vyu;
	Wed, 26 Nov 2025 20:05:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOLlS-0000000Fawm-3hcz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 20:05:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48A7643F71;
	Wed, 26 Nov 2025 20:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BF9C113D0;
	Wed, 26 Nov 2025 20:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764187522;
	bh=4UvnEA00ko1lzXg0hdjBBBEsnJicagQcXbbjtn3U4jc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KMmDAc/iJr+WTIK/XNheFgGF6KoMxY8sGn6uKmy7ktSGlsc5vAWgRt5OoP/og4282
	 iYmETb05ebG5T/0nIWKMYdjtUyF7kBBvRW51Br6V7CfyjHNIBDPA+HK5KmycbyCF7g
	 tGFNL90m86oHbEdTEg+E0W+Vc/56Fq/XSASSc6z88l5ag9WUXVUQ5dSQ7v0C4Q/nXA
	 2u5iLPnCHmGwtAV1uaqmVLkhXEMfEavoGxYU2Wyri7aHXWoeA64ZANBsABB8Jpv65S
	 4M/c2DQYkuMsVf2yLK7BgXqj1rCY6wewj90H4jo+tX/QiXEBqR8lk0P1VeXC+sA3Dt
	 c3KUU2YCiOzFg==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Peng Fan <peng.fan@nxp.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: (subset) [PATCH v7 1/2] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
Date: Wed, 26 Nov 2025 14:10:43 -0600
Message-ID: <176418784429.1591314.3521019603654312437.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124182751.507624-1-robh@kernel.org>
References: <20251124182751.507624-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_120522_943602_EAC24ADE 
X-CRM114-Status: GOOD (  11.82  )
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


On Mon, 24 Nov 2025 12:27:47 -0600, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
> 
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> [...]

Applied, thanks!

[2/2] remoteproc: qcom: Use of_reserved_mem_region_* functions for "memory-region"
      commit: c70b9d5fdcd707ddac29284ea425fd433f374696

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

