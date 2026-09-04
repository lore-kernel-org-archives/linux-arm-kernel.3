Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550E1C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgNMv2NMaBRn192MXktM2p886ZVWCVbNLII+lS9uSEI=; b=g10SNoW6jE8G7DNjRRwncYokmI
	Pn2E8yIucGH7hBBKG0jXQmu0XKVEgGnoZ8Q5sabc7wI/3NgGAzYeSfeI1OIy/6xN8MqsyNsVcYm/j
	h1VvMi3xxTzzSldSlcSx9D0NN0e7cFHphhAQa8Gs882bl6WWHbGLRlvCqOY7xlY/DTTXP/24ZX9ct
	5tmBgK3CGM2+eK4B32cr4ES+hZNNVXxLvDwFCTLUV9g13wypixyOl70BDydm4UjsrbSpkfV4JR0D0
	poxz+JdEViJxAuTuXrOrzF9uTNr56T3O6/9TzWSEfnVC9s1YEz8nYAUf3vL4VTcUi4P4SQsGNM1YQ
	SkomRW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TqS-0000000293f-2ZGQ;
	Fri, 04 Sep 2026 13:20:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TqR-0000000293Y-17DC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:20:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 35A1C600C8;
	Fri,  4 Sep 2026 13:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA3E1F00A3D;
	Fri,  4 Sep 2026 13:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788528037;
	bh=hgNMv2NMaBRn192MXktM2p886ZVWCVbNLII+lS9uSEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B2PJYSCXyONed+eHGO8p2FM1WjRzlc0A9jf7Sdl+LEfO8nigoleWGXilcLEERRwXW
	 e1OAmzmGRB4cZ9Jj5Ms6iwBn0o6PgGfJuXZTiWwjRLT7m0tV4w9ucWb9yzsxJvF7rl
	 NLGOJWAOFJyvS/7ndMbJUosJzmflczp3tx4ilzPhfiKRP+Qolb4HqkAZpCgDZaFety
	 KMvJtABYHiv8xJRGv2i+nX3uNlLz7Dv5oDniZ2nM+nkISmG3cAhN19qXoFwJ6HjNbD
	 Mf9h6SXv0CK4alBagmCUg923o1h//pvEWisiD+kE5cMLggBSgPdBshYHbQtEwrJ5v9
	 d42FWG7Nd2iLA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	Xixin Liu <liuxixin@kylinos.cn>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	cristian.marussi@arm.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] firmware/clk: arm_scpi hardening (leak, OPP bounds, cpufreq)
Date: Fri,  4 Sep 2026 14:20:31 +0100
Message-ID: <178852798387.330796.10489318614485340307.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.v2.1785200642.git.liuxixin@kylinos.cn>
References: <cover.v2.1785200642.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 28 Jul 2026 09:04:02 +0800, Xixin Liu wrote:
> Thanks for reviewing v1.
> 
> This v2 hardens the OF SCPI firmware and clock paths against a few
> real defects found while reviewing linux-next:
> 
>   1) device_node leak in scpi_dev_domain_id() after
>      of_parse_phandle_with_args()
>   2) DVFS OPP count from SCP trusted beyond MAX_DVFS_OPPS (OOB read /
>      bad OPP table size)
>   3) DVFS index used as clock rate without an upper bound check
>   4) scpi-cpufreq registered once only, and cleared on register failure
>      so remove() does not unregister an ERR_PTR
>   5) use PLATFORM_DEVID_NONE instead of bare -1 for the scpi-cpufreq
>      platform device id (readability; Fixes the original registration)
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/5] firmware: arm_scpi: fix device_node leak in scpi_dev_domain_id
      https://git.kernel.org/sudeep.holla/c/65320b642025
[2/5] firmware: arm_scpi: reject DVFS OPP count above MAX_DVFS_OPPS
      https://git.kernel.org/sudeep.holla/c/32471d84a487
[3/5] clk: scpi: bound-check DVFS index in scpi_dvfs_recalc_rate
      https://git.kernel.org/sudeep.holla/c/70f4b78d560e
[4/5] clk: scpi: register scpi-cpufreq once and clear on failure
      https://git.kernel.org/sudeep.holla/c/ab06cf8152da
[5/5] clk: scpi: use PLATFORM_DEVID_NONE for scpi-cpufreq
      https://git.kernel.org/sudeep.holla/c/86d923a882f4
-- 
Regards,
Sudeep


