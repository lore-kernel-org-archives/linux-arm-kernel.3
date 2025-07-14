Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E082EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 07:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQaqHvDZ/6Rv1IAlIYJFylMJ/OsNIqsaE+uT+XWQtXA=; b=PS6mQ6NvoQp7Qpe5N/5mNo9H8S
	9VU0OCaUsb0ZtCQLXFdLrJD8rtA+pW93pTQEx7Gr8Xh1N5S25ry0tHLwtTL9JQAOyFgv2btK0Dm7U
	gjGuMJCPGiYyj6nYdVHjL+bqr+CzM9U3LgkQQZtoxYlGEeI/Sq2YkwPTBZCnJbivgsGjiYSOPurv+
	lWd7zSqGYtflgdB8eB16SrEBdqWaPbBsIeKdM1gXa25jxrOoh1MeqMTTp8I1IY8cmjDmxVoYApMM7
	TWONaF3gI/XGHhWpqvyFuv8aicyTjpwHAiqsgYT3/Yec+nTubpklRVllqf/GK6ec5oQVZwzPwBlnD
	w3nVRx2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDvI-00000001Vx6-2Yob;
	Mon, 14 Jul 2025 07:48:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDVC-00000001SHf-3s8O;
	Mon, 14 Jul 2025 07:21:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 803EB452DA;
	Mon, 14 Jul 2025 07:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A213C4CEF5;
	Mon, 14 Jul 2025 07:21:29 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 6D3BD5FE7F;
	Mon, 14 Jul 2025 15:21:26 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
Subject: Re: (subset) [PATCH 00/10] clk: convert drivers from deprecated
 round_rate() to determine_rate()
Message-Id: <175247768644.1732129.7805401715825787511.b4-ty@csie.org>
Date: Mon, 14 Jul 2025 15:21:26 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_002131_270153_BA96A3FD 
X-CRM114-Status: GOOD (  10.37  )
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

On Thu, 03 Jul 2025 19:22:24 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() ops, so let's go ahead and convert some of the
> outstanding bcm, qcom, and sunxi drivers that have a round_rate()
> implementation over to determine_rate() using the Coccinelle semantic
> patch posted below.
> 
> This Coccinelle semantic patch is able to automatically convert ~95% of
> the clk drivers, and I can clean up the remaining ones by hand. I'll
> initially post some small changes to get feedback about the approach,
> and I can post some larger series by submaintainer once we get
> agreement that the approach looks good.
> 
> [...]

Applied to sunxi/clk-for-6.17 in local tree, thanks!

[07/10] clk: sunxi-ng: ccu_gate: convert from round_rate() to determine_rate()
        commit: ee9c15ca0f628435334afef74d2ff03112d80bf0
[08/10] clk: sunxi-ng: ccu_nk: convert from round_rate() to determine_rate()
        commit: 2b0d4f1b3f8524b413208d47099c445eaf7c18f5
[09/10] clk: sunxi-ng: ccu_nkmp: convert from round_rate() to determine_rate()
        commit: 8bc614c6ac3c97cef385aebc6520ddcfa0fca8f7
[10/10] clk: sunxi-ng: ccu_nm: convert from round_rate() to determine_rate()
        commit: 80395c3b47577c12121d4e408e7b9478f7f88d02

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


