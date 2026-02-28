Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBD3FEE4C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 14:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+ALpJPmcNTK2xGjrtQlYRfrVAE8SjcsDUHr37fAnME=; b=t4mo/2KHMEo/rZTUnbaaBS08M/
	nvBKJ9n8G1Q+6Gva21fd1eijNM2UkCH8hBtlSsJVx2qPuUbsSOzlpg8x5KjN4RsqEW5p2ljt5ohqr
	q8cOaHRdvmYOnCou2FkgbpXCQ+3nDa1jh4qbpNgjTjTSiXrVORQQ0yaRa2Ayl3xGbwnUmIfU9wpGq
	ef8Pghk+k3q3WGhjKF+PJ+HB0OlFkqpaFIW59zDNqonEXAekzKjkJm6kLn6FbbyVl4QUZZxgfxnpt
	NpnQvH4SgiiFw4PDcM7bd/oz+STV3ZX67EsdB7oBRvWC2/GkgcFuVgkcRzJPkZbOvbVbsEt/ckuMu
	EgfVzE+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLXs-00000009w66-2cuw;
	Sat, 28 Feb 2026 14:43:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLXf-00000009w47-1s5W
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 14:43:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EC3E6057A;
	Sat, 28 Feb 2026 14:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3396CC19424;
	Sat, 28 Feb 2026 14:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772289818;
	bh=CfsfHc2IZvizVqWXqW65hOnIoVPxOt9iivCaVzIk/Mo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m+MolcBByd47Ey7eT4TjLfGewAgb47Al4Ru5uuvyAruYPN0bqQq+kKCrKljfm6gs/
	 kC+0DBIplXr7nrlYU5WFk+IPQZ98y73BCLdbUVjt4cx9KOfctQtVjcRgzPnW6py2rs
	 iVKEzuDd9YmD94q6HHQWeFTg4x6SKJDgC2aUPHdQqwZXzJ7d2pkgMwE81ywZoV+LWr
	 bhSEbiMd7hmsoFtRfYiVZPitrDdRRGkYo6WvnELY+GGyt7w4eN6qvywVeTZd9xYKCo
	 yTnwjRcVfIRSu38IUd3RN5mDTntkILKawTVmKLZlslXZyfl4xls5suhd+Oo9TnFuU+
	 L5zdka5GkPY7w==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	sunyeal.hong@samsung.com,
	shin.son@samsung.com,
	Raghav Sharma <raghav.s@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	chandan.vn@samsung.com,
	dev.tailor@samsung.com,
	karthik.sun@samsung.com
Subject: Re: (subset) [PATCH 2/3] clk: samsung: exynosautov920: add block G3D clock support
Date: Sat, 28 Feb 2026 15:43:22 +0100
Message-ID: <177228975881.54431.9547973271595973650.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202103555.2089376-3-raghav.s@samsung.com>
References: <20260202103555.2089376-1-raghav.s@samsung.com> <CGME20260202101957epcas5p224b18e84c561e542c39096b2bd7f29a7@epcas5p2.samsung.com> <20260202103555.2089376-3-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=570; i=krzk@kernel.org; h=from:subject:message-id; bh=M3/w8Kjaa5+4q1BF5CF5iRHUViQIxQUsXUslcUtgoRs=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpov8MKoFI6cn9WQaNzBpeerXBWEmeDuz0Frz2a bysmdIAUL+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaL/DAAKCRDBN2bmhouD 13dAD/sEl5lanhP3VthwFPk4bqJxrtZ+Cr9iyE3xQ+CvyagHWK+vu0GVWAqOK6h/hDeIzHjgQ1h O9LuN85PTNVa5DCPVy2BOm4hqNuhf1+jbptO9UslNExVYnMA7Ob6XSpmwvPBOkVWrbMHa48GoSs D3StuQdBSTvMv06FPesw45CJF7izooDuB7RHZMrnVJzyauKKr4Cte3UHZSBY+BsrEPUwp3mC6c5 eekGhTIT5kixVFMgMO8iH6igL9lgrrIv4zBuCiDhyxbat2Lxa2YgwY/owl3sEW741BbqVq6Qg0i biBPGeMjJwjxXquKIPY5VqgIW4elkUfw0RJGIPi5HlvOnqRl9PfKMqdHbIQcbLJQpLuQTENKKdP 0CC7AeKPcAkRVfwcANFLNIRB4LIW4/twRf19M/7KZoc/tmDGegJWooK7gXLCXou7xrCGL5qwy4r 0tHAK/U0UuvNfsMAKPiFK41ekWvSHEHjVa/wnxA7CKCCHXW9NPzwnloNUuXQZkC56s/3JIvQ7uR r1XvORtJkzi7VZnxOfmEHg1x6GwrVBElehHs9YolwHJQFv8z7P78L+vzo6YUpvep7F+9Hw5167m JvWO1KiLSTps2NCqQ6B2yl4WhvPndquM6zlPuPFw2DinfvFyN3sDMnW7I464hXudxX8sFuD+LiT rpXGjsnuPnWcaO
 A==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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


On Mon, 02 Feb 2026 16:05:54 +0530, Raghav Sharma wrote:
> Add support for CMU_G3D which provides clocks to G3D block, and
> register the required compatible and cmu_info for the same.
> 
> 

You have checkpatch warnings:
CHECK: Alignment should match open parenthesis

You should fix them before my scripts or my CI sees them.

Applied, thanks!

[2/3] clk: samsung: exynosautov920: add block G3D clock support
      https://git.kernel.org/krzk/linux/c/5e5f3286d66712fb49264da20e3d89534754d707

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

