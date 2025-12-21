Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4527EE67482
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 13:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyeZsE+KC2UKyHF++g/6iIbrO4CAkvMFhKsVoMM9YEs=; b=E8s2Dl1bVCOntwaWfC9Sn+ZKL1
	LkAMPSrtYD2HxwjZU+UVDpAbXmX/KrdQBBXQugJimlu9WCAKZKmB5IgV1J/H+REjRNhfrH5lSR0E2
	xjO2MEmkIZ8j1Q9erIMLPlywmHvGIJ0OUGj/lpRX0tHIAcS1mUOQCbX+j9ZezDrVFX7t8n7xIutAi
	8KvGNQUsGKV1f3wDSQ5T69apSds9nDWGEfF6H1MGsT+q06IxhJ74qapCX5oMdij1/DcWJmm/xdkbU
	tg23Ci5+0NYkjqOqeaMoxUoD1wzCXOAroRbb3sS4HMnr+DvlPZAS6z5IOosKdhS3yOQLhgp9LQQai
	5B2N157g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXJWY-0000000CTI5-12CX;
	Sun, 21 Dec 2025 13:31:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXJWX-0000000CTHx-0nBp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 13:31:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C79D60007;
	Sun, 21 Dec 2025 13:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A435C4CEFB;
	Sun, 21 Dec 2025 13:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766323858;
	bh=C95pBC/of2RDtllaJWeqA4lDBg3IEEK6Pq6I70LkZfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b49awFXhl6ZyrvmzyVuFZjeQ+81LoAJYvhHPlq9jQ1qpAEkNuW7RK87fvcPYe7z7y
	 sMJT/impbhhIhR2M/hYYqo/EiWpSrlnBDr6TgjxjVxRTNTFgIybtPiggHjT5Znimz0
	 I8jgKkBDujuwp7o190Yp7GI2rn2i2s+ibDtyLPLdB0SO/el9R0MG044g2lgiuKUmKv
	 mTiHHmLUkxWETghbwm2NvQxoBh3qqipaKP9VI9Qq2Qxk4Kdk5coT00DYJNcR5B+LXA
	 n5L6x3+9JzrsKzy49zIqGbWge+1TgZkz9Dt8wmxAVg6/bdJ/23Zg1vh+3nu4sPPjZ6
	 qN3R4DfKjC0/g==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, sunyeal.hong@samsung.com, shin.son@samsung.com, 
 Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20251119114744.1914416-1-raghav.s@samsung.com>
References: <CGME20251119113922epcas5p1f9593dbc6cd51d9fa04613d9120eceef@epcas5p1.samsung.com>
 <20251119114744.1914416-1-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH 0/3] Add clock support for CMU_MFD
Message-Id: <176632385218.12602.17940267617216000945.b4-ty@kernel.org>
Date: Sun, 21 Dec 2025 14:30:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Wed, 19 Nov 2025 17:17:41 +0530, Raghav Sharma wrote:
> This series adds clock support for the CMU_MFD block.
> MFD stands for Multi-Format Decoder
> 
> Patch[1/3]: dt-bindings: clock: exynosautov920: add mfd clock definitions
>         - Adds DT binding for CMU_MFD and clock definitions
> 
> Patch[2/3]: clk: samsung: exynosautov920: add block mfd clock support
>         - Adds CMU_MFD clock driver support
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: exynosautov920: add MFD clock definitions
      https://git.kernel.org/krzk/linux/c/db1cc4902f2f51977e427f796ea8daf49ba93c69
[2/3] clk: samsung: exynosautov920: add clock support
      https://git.kernel.org/krzk/linux/c/efa45bcc73e1a30705eed28933e341d36a08bb84

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


