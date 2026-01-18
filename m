Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B197C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 19:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUWLBkf43DI1bsO7dEfoZo/teJeMsvm7UKWdG6qHzZY=; b=rlX3rOpqEZLgs08LWHgXgURQ3m
	ix4qIe8xTHMh91MOLxKQoyZ/WiP07Pfgozrm0XSDeW5ou4k9aWkGgzC+ACT8eOaKRmpReNcY8lee3
	6cFILEiEoTuwt8O4zPxeit9N9Mecl/PjB1iu0R0gtp+9SppLFP8YqxAKDMUupGXnwH7iuue5MeRdL
	UfT8oHK5PblhYpD6pvHxz1itWN2VcMbcErypHNKqOU23pelNuaE9xrU37TmMsAYXyKWf1Brz8XKWG
	Gyb1WMcE2X8EObeCQGWRtsNJqtoR9K26kYL6xnQ/RWT8EWiO6J3/VtR780h0rH22K15xKXJxrNMnI
	MT7gWfoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhYXR-00000000ozF-1sW2;
	Sun, 18 Jan 2026 19:34:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhYXP-00000000oyp-03Ui
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 19:34:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8797E43DC0;
	Sun, 18 Jan 2026 19:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C9EC19424;
	Sun, 18 Jan 2026 19:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768764853;
	bh=EAKf7Yk7D6bJXNYB0UoN3nvCauwO9tiIU/vivFjwIJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hgvWHJCX5yZWdp6Xl1Ced+MtQ8b5Nx16i3z6/u/15k+W7NCzdmhfSrcWKk0hanfOt
	 h707XcK8mHcuaE8w+0zhbg7xx8fLwhQ07ANtM8+0YRmHiO5aG4YWZQpyO4VwJo4GKH
	 PGQg51JcoTkJlkkjvpMgzhpTEnrpFDyYZOvgULy6gRwweU41RBnEA8QRrnoiNtv0nL
	 cjeCNoBCJHBQSHFkexNCCT37P5oEIBi4iojzhe3NjpSUgo/xJ4LSZONh6begzCg3DB
	 QzAkv8zLiR6V9LVbB4RzLc4jaRZq5LjD8uO7zHMVPvCW+0uHU534a/6nCjmO1LpLox
	 BzjwBlml8eWJQ==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: apple: rtkit: Add function to poweroff
Date: Sun, 18 Jan 2026 20:33:58 +0100
Message-ID: <176876480547.64728.18291427124643428920.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117-apple-rtkit-poweroff-v2-1-b882a180e44d@kernel.org>
References: <20260117-apple-rtkit-poweroff-v2-1-b882a180e44d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_113415_069790_AD4F3522 
X-CRM114-Status: UNSURE (   8.85  )
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

On Sat, 17 Jan 2026 18:59:10 +0100, Sven Peter wrote:
> Add a function to put a co-processor into the lowest possible power
> state from which recovery usually isn't possible without a full SoC
> reset. This is required for the USB4/Thunderbolt co-processors which
> can be restarted since the entire USB4 root complex can be completely
> reset independently of the rest of the SoC.
> 
> 
> [...]

Applied to sven/linux (apple-soc/drivers-6.20), thanks!

[1/1] soc: apple: rtkit: Add function to poweroff
      https://github.com/AsahiLinux/linux/commit/ba99035bf16e

Best regards,
-- 
Sven Peter <sven@kernel.org>


