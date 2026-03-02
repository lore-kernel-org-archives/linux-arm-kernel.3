Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CA9E9B36A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZY3Asv72VNsfa4jmmz7uI+OZ4QLxYyrCg577Leyq3BE=; b=Sk1Xn56oH9Q77U8DPsjNQ8Z6kf
	JFFveKUym8zh39nucafqRXwETTlpaRulFHHCd4AyhP+Gag7zD38p2YeGS4jU5ndHLP+RHlFTF8ZEx
	PXLaz6MayQL+0l12LXAq8DeiG7JxwDIo8dAkVQoQjKMRbxEUSRaWLe5g+0x0lg0pegLWlmxsK+jZu
	SSpzD4nNCUpXqNsf5Q79gSis7z9LT7XQ2DxUXdXVMGyGcMCQ7/3PWNzVquK0iCQbWO3bpm9/3dnzL
	l7swR+SO8AF5gp+An1/KyBSq5XZIJvxPsIiUTSfNG7HnzN8U2K50YzAMuR/k1Odb2cv7ylsPTAu5q
	q4F0rORg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1R3-0000000CpER-0zVY;
	Mon, 02 Mar 2026 11:27:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1R0-0000000CpDH-0PME
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:27:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 40B6043FF9;
	Mon,  2 Mar 2026 11:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90344C19423;
	Mon,  2 Mar 2026 11:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772450853;
	bh=nF1QXwyCcdzGFo2JvN07s6YZSCOpZ7lAk4rFgnXi0BI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RV2/KBa/aVpQN1rZuC+QHybsJmtBOZHtLSOLCleLU/mPUh5ywWZ/WoTdQ0IR2dAV7
	 iN9Ozj4IDJNMkh7PXwlzMX9D+BsOTEXX0haStS4xEUoiQMkESL873KekrqN26CtIZ4
	 P4giwdE8HztLsznI/U1EFkTUzGpGbX8LghbzQtGf+KgF7ywRVMJS8A7zQQJYpk0/tI
	 4QUXxMw5QeVwr/SruuX61oMNYDobiHjsVyFXSGmhPRuSsdYrbTN9cLrod79z+OCDxP
	 g8gyRRr2I7N85GUR+XTvdOzwSJFQujOXuHdCZ+6Q9xIqKzzWlJwwSwb6Q4gngskgM/
	 sXV2QaSoCC7qw==
Date: Mon, 2 Mar 2026 11:27:26 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Message-ID: <20260302-conscious-obedient-dormouse-0f65a0@sudeepholla>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_032734_195316_96A27C01 
X-CRM114-Status: GOOD (  11.41  )
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

On Thu, Feb 26, 2026 at 01:16:45PM -0500, Brian Masney wrote:
> There are some clocks where the rounding is managed by the hardware, and
> the determine_rate() clk ops is just a noop that simply returns 0. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

