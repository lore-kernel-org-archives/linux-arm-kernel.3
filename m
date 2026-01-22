Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31074D3EE92
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thtdOXiIScvz+eUef0dCIO/EceIlv2tmktrNqUEU9cA=; b=HBsUU6qRDdAAJoRmkJY61kPsvM
	jr3hwHtkK1ltfpi0vZQ6pl4U1CSS5BWv+urFG2WKkbIv7QcBOtsEPSSXQGgZLzQfdPu+ae6DDQ4+V
	ZQT+HAcnsOXCwbh9L0Tf2inJYEs5rRYR2jrHdkunIf0OpdrRVddKtNGDrzpldCOfbU1HPTxuc5gRR
	g+WlmsiuFhO4yT6+cApXL4UZaehEZF2KuxnVD2cxttQ/QbQnc8ufyVGE5aTNLPkBWocyNtDAxVpAz
	Lz0snbcF0pgADan1SgXx77Xtg5UjRda74KrAyV7HLd4j/3fjIczqygmLtOQILjahDBhx5kxop+rEr
	3tOkAS+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viy2X-00000007WFf-0r8C;
	Thu, 22 Jan 2026 17:00:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viy2K-00000007WCl-3saT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 17:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB51060053;
	Thu, 22 Jan 2026 16:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8E4C19423;
	Thu, 22 Jan 2026 16:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769101199;
	bh=XP3btCdfZ18H84BPvTQijTYLXkXA2fMO98F8VgchIOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CzfjNByWkqZNWarc97P1of6ulVVMxbVA/TgAr1EUL/UA3sAWJZXfm5ATHgrcGhh4C
	 o3RD7/pgYiOact5D3MlLRiRG+EwE4AObbmeEz85hsP6ChoIwzIsAiNdaHJCS6wmWAh
	 E4Q7hePj2AEHx6XkHkp5ZqxbUCbIhBXgiPSHiOgAmdhkMRan4A20Y8J1MT5ov81XZF
	 rpzwHOL4sckepaVDxw08M1PCWrs6jdhWdo6UbcvVDztaGl0KmYwEHEHeWocqXpzUPI
	 KPr776MBBB+QfF2nHn/vZc/gKekFtUz4PlFtJ5TvaACtw9Xjm72wQqH0qcYqJ5moYa
	 6P8FN8iETPbiw==
From: Will Deacon <will@kernel.org>
To: Lifeng Zheng <zhenglifeng1@huawei.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: topology: Do not warn on missing AMU in cpuhp_topology_online()
Date: Thu, 22 Jan 2026 16:59:41 +0000
Message-ID: <176908072212.2053791.7954554866629671060.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <a8dbf49bfa44a6809fa4f34b918516847dc14460.1768466986.git.geert+renesas@glider.be>
References: <a8dbf49bfa44a6809fa4f34b918516847dc14460.1768466986.git.geert+renesas@glider.be>
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

On Thu, 15 Jan 2026 09:51:45 +0100, Geert Uytterhoeven wrote:
> When CONFIG_CPUMASK_OFFSTACK is not enabled, and resuming from s2ram on
> Renesas R-Car H3 (big.LITTLE 4x Cortex-A57 + 4x Cortex-A53), during
> enabling of the first little core, a warning message is printed:
> 
>     AMU: CPU[4] doesn't support AMU counters
> 
> This confuses users, as during boot amu_fie_setup() does not print such
> a message, unless debugging is enabled (freq_counters_valid() prints
> "CPU%d: counters are not supported.\n" at debug level in that case).
> 
> [...]

Applied to arm64 (for-next/cpufreq), thanks!

[1/1] arm64: topology: Do not warn on missing AMU in cpuhp_topology_online()
      https://git.kernel.org/arm64/c/747d5b6735ca

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

