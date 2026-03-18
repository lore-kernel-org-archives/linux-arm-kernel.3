Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B9E103E199
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnbkIUtG4AYB43WP7NNgELdiqVTygXI0WZFKb6AB43U=; b=BXEfM/lkj1bCk68hMfcOW/EKKf
	juISo5K1K9iC8wQOcTJMVdfvuv2n1H362w0WMliSW9NnAJFjfm9JeE2z4zug8ao2jPOliunTcerJ1
	4bGGAwsormQbooQSomqtloIMZjRNjfLjOWyefnqxMiIxyGxdzAt+MiBYAf/qb1FlF9dZKPOGyfI0F
	SYMm8KGZDs0GSnHHWA6CrUQVm4mu1oBne+s3WOYTtqTLJCIRRiDiPdgEFbel6fUYaRh0PROH8Xrze
	TweCXtjDyHePLF0PiDOmSeZgaWjnY+z100j/ZHU9Vt7qFaKHMy4z3K0Zd6rmrQ3iPYg6AqGPnQd6W
	5UYpKJxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2spx-00000008ibi-2BY2;
	Wed, 18 Mar 2026 15:29:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2spv-00000008iae-2iCa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:29:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B60860053;
	Wed, 18 Mar 2026 15:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A23C19421;
	Wed, 18 Mar 2026 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773847770;
	bh=2K+rVR37l7dSsF1Tew9s8OkMusF0TWNUD4t6yo95/r4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+D3ha70AquDub0ZgyBK9pfNZe+hZqGKzvNNk+1TEhMKNIeVjI7gH3GcYdmz3fYmS
	 jH0EzNnY0zzPuA1+dbBfRuUSCvHtuI/5VL5exynhru/0YlGsLjDXANqX7oIySVMAj4
	 f2MploVtaAoWjw3qD3+TcollqAkNi9dC2kFn7RDv3T6mCI+xBjkx2MpiLCWR1xcixq
	 Wds3UrLsxHRz/jmBlgH8hsQSIuR/BLwfE2UxayTg0eaOK0ymmX6hwaaMZdm1YRnPTc
	 BwxXJ8ZhxWNNWac34awQZto8gBjXXMPMDlY67BWmEU+aixx53Kkpi00vZAZfe982iJ
	 2LgDZ76i5KQDg==
Date: Wed, 18 Mar 2026 15:29:25 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 05/13] clk: scmi: Use new simplified per-clock rate
 properties
Message-ID: <20260318-astonishing-magic-skunk-5f45fe@sudeepholla>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-6-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310184030.3669330-6-cristian.marussi@arm.com>
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

On Tue, Mar 10, 2026 at 06:40:22PM +0000, Cristian Marussi wrote:
> Use the new min_rate and max_rate unified properties that provide the
> proper values without having to consider the clock type.
> 

Hi Stephen/Mike,

If you are satisfied with the clk-scmi changes, I can take this series via the
Arm SoC tree. Please provide your Ack for patches 1, 3, and 5/13 if you are
happy with the changes and with me taking them.

-- 
Regards,
Sudeep

