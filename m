Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B8BE9B24D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 11:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6ouJXOBm+HLgdFvEEzGMsOdkfNTb8vl9z1LAIe3u0g=; b=NNM4mtjagkiYHjMgWpWHm+q8E8
	BrRbekle+CmbZuJdVpyObD7B0E1Dm2uSFK3bm4DrH4+Jr0ED+KsS64+/yXXrJzBr+CNNC4Ha1KWmk
	dlEl7OafSTEC7863GqglMiHkv3wfYrUE8yMhhqNPNpWXmImoNEPdLMeSaAw6Nmk7rbQAi3956DdHm
	6789QCDgoWbFrqIsujJf4roLfX97Anux/UT6nuaDAPPFA3QrJQrIP360d+bVAU4VjxOue2HrXRoP2
	OzItuzvCqF0L9Yr5+qYqK4wYdzmaifbUl2gL6APyBnP4yBA78e+3qV2gOSN4tWo2AUgRqUspCDdcG
	JdzwerHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqI0-00000001wXB-0gcY;
	Tue, 24 Feb 2026 11:09:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqHx-00000001wWm-0xJR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 11:09:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF35243921;
	Tue, 24 Feb 2026 11:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E6DC116D0;
	Tue, 24 Feb 2026 11:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771931351;
	bh=SBawp4kj1bHyOycQRY1GOb635H1p2bmugDN5LdacQPo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ad6Oz3+j6k4ivCyEIQHcYfOT3Os65gOfZkm9JyjMh/U33BQ0qGMlekD9/DUN5balT
	 fEA7TXoOZAivGH1dDPdxN6J8+PPymf0ih5Xd2+lAdAY1w1NKU/3w1f7U21DN82+3ca
	 7F48l/gL0sI5d7I9seo594gmIvBIN2R+M+7BeEnkmb8WM6q88cl10UuHI4Vj0U2dXC
	 DZRlxdNmRNJLbrdiEAhtQTvA/W6BOBstyagG8FDPsUvDB4AP2iT+6fquBC1wVZns2v
	 Nzpiq+I6mIWJ3Om83rIW8UlmwETMUgespB2CWhv3M1B0mD+kVHSiby26G4aAknooU5
	 DrWUd+uFj1vUw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 llvm@lists.linux.dev
In-Reply-To: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
References: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] firmware: exynos-acpm: Use __counted_by()
Message-Id: <177193134878.50704.13669027037095531482.b4-ty@kernel.org>
Date: Tue, 24 Feb 2026 12:09:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_030913_299120_C72F5B82 
X-CRM114-Status: UNSURE (   7.62  )
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


On Thu, 19 Feb 2026 12:27:09 +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Add tags
> - Patch 2/3: typo, single ioread32 lines, merge the two if() for
>   txcnt/rxcnt checks
> - Link to v1: https://patch.msgid.link/20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com
> 
> Improve safety of the code by using __counted_by/__counted_by_ptr.
> 
> [...]

Applied, thanks!

[1/3] firmware: exynos-acpm: Use unsigned int for acpm_pmic_linux_errmap index
      https://git.kernel.org/krzk/linux/c/910e91a6496f7e0af80e945a6b850b589b90669e
[2/3] firmware: exynos-acpm: Count number of commands in acpm_xfer
      https://git.kernel.org/krzk/linux/c/00808ae2e679a97dccc5cf0ee4474ba1e2e8a21a
[3/3] firmware: exynos-acpm: Count acpm_xfer buffers with __counted_by_ptr
      https://git.kernel.org/krzk/linux/c/951b8eee0581bbf39e7b0464d679eee8cb9da3e0

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


