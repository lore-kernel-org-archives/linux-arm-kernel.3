Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D682FCD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 08:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAF1nzw6/257vndlPErWeOzUz3R5jMD0dIGugJMjvp4=; b=hzlY2+FLO8zyS87nfQoMiC1ehH
	7HywJzpyCI50CspgxLcgvQkUEd1p756LS5ovsMxltd24hpUQzYo7akF5liqelAA9txGE1SNcNS4/T
	sBdXFEBoUWFBe+SR+2wzCNcz0vKDBEMivamwPMMrmyrQVB+N41kBkzq3t6qNXHhXg0925C2yC6JWF
	1l5t+gETCsu7PQXNxsQLEohvg7wVgODHV1jSPoG+d9KWuXJ1X/G4DLL9CmD7UTNBRoDpgc8gB8SID
	pRVjLYirkwwtObH8a8JAOcOtB1LJSuvh5dUXE3IZrt/3/Gnw/FJrlqSU/Jn1a2nMRJy7pQI896nRt
	B8UcIXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMii5-0000000G7iN-1eHq;
	Tue, 12 May 2026 08:43:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMii2-0000000G7hg-32NX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 08:43:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8831243667;
	Tue, 12 May 2026 08:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49133C2BCB8;
	Tue, 12 May 2026 08:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778575401;
	bh=AzX8yXSa8mZeuYVkhSfLL/djnjt3bTbaiv5tUdNNaGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jXzozDCJbIXl7wFaJs7MuQDiQyfJkOPbR+omuNgM5mXfNdpDGaRgbxGyirBInMJ54
	 0ZSAdHYB3+4KtQLo7kQe1POLStXKQuI57EjOWQZ4HTIEjP1f+HC1j9GvFf1nn+ySh6
	 FdKnjUVNq0EjU4JY7lvApI3ZCuLhYQh5hYQuJVOj4PJbA3LDeFXm7PllKawyX85+LP
	 Zp+TY3O4WBoVCsgaVjiSoyjf/2/GUFYEk7HUpEm2Tgx4TZpLFRKshL8y1oNLmA/YSc
	 UQwt7FPYdpiQ6pqzadHTtBZyshrKemYcKDaRTs7e7IuvC4M4mXyV9gGXmAU9tFitDi
	 lGJrgmS30Lk7w==
Date: Tue, 12 May 2026 09:43:16 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v4 03/15] clk: scmi: Use new determine_rate clock
 operation
Message-ID: <20260512-logical-tidy-pronghorn-5da394@sudeepholla>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
 <20260508153300.2224715-4-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508153300.2224715-4-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_014322_783249_F021CE54 
X-CRM114-Status: UNSURE (   9.70  )
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

On Fri, May 08, 2026 at 04:32:48PM +0100, Cristian Marussi wrote:
> Use the Clock protocol layer determine_rate logic to calculate the closest
> rate that can be supported by a specific clock.
> 
> No functional change.
> 

Hi Stephen/Mike,

I have potentially queued this and 5/15 to take it via Arm SoC unless you
have any objections. It is mainly simplifying the SCMI clock driver.

-- 
Regards,
Sudeep

