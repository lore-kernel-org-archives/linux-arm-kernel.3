Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2624CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 19:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgl9LQGCxPzHgk6b4gNBqLFR4/SpCMm4ck3nP+tebGk=; b=mKCwfakdbM6byQL/JViiTF85mg
	OHVd4JzoRxVOS5agzqVU5hliX0H5JRyxc3w43+MoLbLSdFTtcJmlbWdgctuljWPwnzQzBHnm/5t4i
	8t2rjr4VqQmDPjsvUR+KzCr78uoaBLnpR2rlrRNk6ZUsSGBQ6lNDiIbm3yrjXR6uJW9sHNXntvVfW
	5rT4IQT4XAIkJPsOZIEBXkHMi8+zslkgXDp6i7Z5/uLRqZOliCsrV44n4wPfMmcNkUbfVKdwVq6pL
	zbIC2qxO6I3wTHigAv5Em9vfCekMilPRlNPChYQvTGcPmPB5U/1QyMKbmKfZiN6Zh8+/9JbCE3KPs
	vFXzPoBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBeBj-000000045Uh-2bQP;
	Wed, 22 Oct 2025 19:07:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBeBg-000000045Si-2ouX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 19:07:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99D2244B14;
	Wed, 22 Oct 2025 19:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AB5C4CEE7;
	Wed, 22 Oct 2025 19:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761160061;
	bh=MhikHcHibevNQwj+BN+1cIYd/DKSbUvhjASlY7USh2I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=F9miCQTQy14eYv+G7sJbojMRVwwyrJRzB0o2GZHQKS0qKMOyst/6rYHsNjj07SrzV
	 Fb0dkWL7Zq0ov7ZxRcJOlIR/vf3Kggf3cGt7DTZ4cdsZS8ONKzkcVd9Jsz8Wrq4U5y
	 0jaYNouJSYD4QSRM8Dv8E7uTfb4tf4011jX9NkUzrrxPi/QSZwPL63VpaOFJ/wrizq
	 vwtojQKQ+xxRDWp/4jPX0sT1D4FrZo0KbKhJhj/DJSSGc7UTiSrZ2rN9TiX7THz1ZP
	 b8uH7YcopmBnh+vGj/e+9Hum9RJNMb/FLvcoihktILJq+t44xxWhwHQBQVC9ui75o9
	 dTajyQwN79FvQ==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id B91885FB54;
	Thu, 23 Oct 2025 03:07:38 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251020171059.2786070-1-wens@kernel.org>
References: <20251020171059.2786070-1-wens@kernel.org>
Subject: Re: (subset) [PATCH 00/11] allwinner: a523: Enable I2S and SPDIF
 TX
Message-Id: <176116005873.3514774.12511738732010312757.b4-ty@kernel.org>
Date: Thu, 23 Oct 2025 03:07:38 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_120756_744722_08D932F7 
X-CRM114-Status: UNSURE (   9.35  )
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

On Tue, 21 Oct 2025 01:10:46 +0800, Chen-Yu Tsai wrote:
> This series enables the SPDIF and I2S hardware found on the Allwinner
> A523/A527/T527 family SoCs. These SoCs have one SPDIF interface and
> four I2S interfaces. All of them are capable of both playback and
> capture, however the SPDIF driver only supports playback.
> 
> The series is organized by subsystem, so each maintainer can find the
> patches they need to take.
> 
> [...]

Applied to sunxi/clk-fixes-for-6.18 in local tree, thanks!

[05/11] clk: sunxi-ng: sun55i-a523-r-ccu: Mark bus-r-dma as critical
        commit: 5888533c6011de319c5f23ae147f1f291ce81582
[06/11] clk: sunxi-ng: sun55i-a523-ccu: Lower audio0 pll minimum rate
        commit: 2050280a4bb660b47f8cccf75a69293ae7cbb087

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


