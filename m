Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAE9CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 02:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptUIZymul3ehhI7rUyxRaajvyqi2HEBRiPMP4Iu5Uns=; b=CTPk0llibY+qdwpz4ur3EgX6UV
	H6EuItAfvE0/wylEm4kPEixZaLVtb2vkKL+ZIRHeJKCtshdfpf7jxcu+Ag6g9EUi+Yu+Hy4nFPBiA
	wZ2t+SAjaMTd3HJv+XLbOTclQYnlbe9ln5iR+DtRUdEWFevTX98pRdLU3aoLpZiYAwQ5Py/3CVqO7
	/Udyd12VB+Bpvadg4UFfnuyURU3wLmjYLYh38OcN52WcnzkgGFKeyrZchPVyVMeC4TxOOMonihlwo
	3wGikqwIzBzVsneS76p7Dj0Ek+FYflK1nXu0y0JAW+Zw674hXcs1t0ga+ChJM/pBAaqxVl4zDypyx
	h8Em5kEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNiYB-000000079WE-2pt2;
	Fri, 15 May 2026 02:45:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNiY7-000000079UA-3dBQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 02:45:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 516D54450A;
	Fri, 15 May 2026 02:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C13C2BCC9;
	Fri, 15 May 2026 02:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778813115;
	bh=CAei6OyLs4Wh4ZQBWKlQtYH2e5Z/B4QH1dkxlz+9PUg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=TRlSO5xWcbYmlEcPCUHsV4Jeg6XGaio3XVs+9VyC/2rtYgAyKS3tt4SE8Lg4fyL9m
	 rwyb+JQ5b4pzCvRsNNP55O3SvvUlR61C1ry2W5aYC170gH0oR1XWcii7e2eApMZ7sY
	 enUkxz2o3dJX4tfOvgc8xGRWx1MMSAZAvzhcjeUzg0LLzXAz2QqK0j1rJTmwBmeyOx
	 A9/RA2vXSTTU84NUIujjFLiOUgRat+oFriPkgIq1fhFy9mXM1hqPP6nNdxCW2TPaVW
	 cHYpUZ5sO0WKBKNSacKGFUtjwrZ586y2DZehrAZjtFGjLXZCgxu+T0iXBEFs+3Z7nY
	 DW0rbBUPOO85g==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Chen-Yu Tsai <wens@kernel.org>, 
 Andrey Skvortsov <andrej.skvortzov@gmail.com>
In-Reply-To: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
References: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
Subject: Re: [PATCH] bus: sunxi-rsb: Always check register address validity
Message-Id: <177881311362.121816.11798899480694318999.b4-ty@kernel.org>
Date: Fri, 15 May 2026 10:45:13 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_194515_930663_93509EBC 
X-CRM114-Status: UNSURE (   6.35  )
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

On Sun, 01 Mar 2026 17:49:39 +0300, Andrey Skvortsov wrote:
> The register address was already validated for read operations in
> regmap_sunxi_rsb_reg_read before being truncated to a u8. Write operations
> have the same set of possible addresses, and the address is being truncated
> from u32 to u8 here as well, so the same check is needed.
> 
> 

Applied to sunxi/fixes-for-7.1 in local tree, thanks!

[1/1] bus: sunxi-rsb: Always check register address validity
      commit: 322f01103323199cdd9eff8cb6aacbf1248ce36e

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


