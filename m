Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15C8D58CC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4D04v2CM9GyHATFfO9G3Ds/AR66R1S8pm4fCXZ9xOPo=; b=ZaA+sEavIgAJfDYsx/undDrNES
	Tk7fOAl0TWqt36CXGXkIMo3c1xRlQT31xfibkuHn+oQoHUd52gDY/y7auYGKVi1js8vDQxW7858r2
	xz7//hwmsAtAic/lkYGbeJxPs1tblTtXHKcS1BDZ88ckzTPaEyAGP8CBKn5ZYi+XjR8g3f//mxLbG
	oVn8rmMY7DiGrLAHWoX/vMQp+xHGxRd/STuVd1G/4AT3p+MJFJsrg08E6aPTuLEuDm+99fPdUH5XF
	z3/17O/BCGo4EFsZalad2viAqGbJYiev9kVpBvzbMq7xpb04Ee+XvSjXyR0SK9uxmgMxY5KhBclcE
	YURFrCnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w517X-00000001Q6S-33n3;
	Tue, 24 Mar 2026 12:44:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w517U-00000001Q60-3vBP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:44:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4AA45442D3;
	Tue, 24 Mar 2026 12:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE16EC19424;
	Tue, 24 Mar 2026 12:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774356268;
	bh=o1MAC3ATghU10xL4Aes89ym4NEC0lex8R7/g7kN+Ua0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mhvRDFRSdlsyjpNt+QbRqbBJGpQQz+1HiDQPDqZSYZjncL8a1S3p5S9LyFb1lkieV
	 zslampFzGx0PuxHVt5CnMPNEx+o+dTt2LRI5cQUf+uFOXg6IvIkNbW5eg9HFjAD67D
	 l9H30ts7/tTrYitQZ+CO1ymkZ1WckOBQLRIAgPBJnqZJHs6ZwxKLKgZHb2wzKzrUt1
	 ZioRvYvCr6fWvlb0Raal7/vsCUN+QqfZGtpSrfwAjWqb7gYbS2h/gEvK2+6daXGwh6
	 DQFFcnkVBIy/7MA25aQ0MPUnxWPUCaVHO507CPaMk5bOVX93FCBNr1um2zM6qCVvsz
	 OeZEPtLP3tdLA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-2-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-2-983eb3f296fc@linaro.org>
Subject: Re: (subset) [PATCH 2/5] clk: samsung: exynos850: Add APM-to-AP
 mailbox clock
Message-Id: <177435626440.57018.18123617463088558125.b4-ty@b4>
Date: Tue, 24 Mar 2026 13:44:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_054429_005327_9AC40D88 
X-CRM114-Status: UNSURE (   6.60  )
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


On Fri, 20 Mar 2026 21:15:14 +0000, Alexey Klimov wrote:
> Add APM mailbox clock for communicating between APM and main application
> CPUs in CMU_APM unit. This clock is needed to access this mailbox
> registers. This mailbox is used for ACPM communication between kernel
> and APM co-processor.

Applied, thanks!

[2/5] clk: samsung: exynos850: Add APM-to-AP mailbox clock
      https://git.kernel.org/krzk/linux/c/e57c36bc1a3e459239ead492ebce731a88a264b1

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


