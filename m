Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D842BCD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 16:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fs37mZtBEj4mh4HBBrOzVn2o9vM5ahogZ/D+zH8VWRE=; b=sGGmOD5b/wpeIGSv0EJnNf9KgS
	6sJLZVOhBKUhd8eKThWizElz3s2hZX3XiUhU6a/VoFLkDSWEX3ugvavD6YzK/Pi+4Af/HbFGDfaA3
	Pb6KOJfi+Ts++4w/zDcVfKb2kO+/k2YbZwG1wPqJJ+VgeKPct2XPoM9jlzEkRWO+HkZIpz2pAb+eb
	FbgxoxAcsTAVGZMwOzsepFC1BobaFBDC4xYPLdzyN3Q1nTM4uaQALpIfDvMd/cRwtjHDrHJq7Mo3X
	JX80GVHkULXcSKJ4r3d/0dZtorDWpVJ+OmfdG8sQw5OuZjVVnc8kbDxk7nnSU7/uPH6aiVtquW116
	phBRbxHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMuS-00000008woo-0fkB;
	Sat, 30 May 2026 16:51:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMuP-00000008woS-35nG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 16:51:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EC1D243E86;
	Sat, 30 May 2026 16:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A581F00893;
	Sat, 30 May 2026 16:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780159896;
	bh=Fs37mZtBEj4mh4HBBrOzVn2o9vM5ahogZ/D+zH8VWRE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BAyAqQi3WXNfTP7owhvvOIsi35V9WV2a9Kf7BDnajl5xDaDfayuQiYxICAjvXvhcB
	 G9Jp4kdq7Q19B/bLt8FZK18fVyO1Dv05jr4VrOuh/KBzhRc7ZjkVdlajtVbIf3k8+I
	 iBP9oGd7wLwPJA5EfIHhVggz/CGu8VLgzDeqpFFqMPVHxBOwHLdTTn5F7/GQmMvWsF
	 wK8D27QgMNFMMXzUh1bY1Kw6OdpGxZszex0aXG3dr87ipI8KdYXZLV6VPG0JbDdwxB
	 mjL9IC8kQ8neyppeKCQdsWCtBVU50s+2ZL5wd1mbS9a40K7Fj+jhESh8geP0D5cDDB
	 WCHSuzk1WYE3g==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260528-perics-usi-v1-1-13a6ee4d1a6f@gmail.com>
References: <20260528-perics-usi-v1-1-13a6ee4d1a6f@gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos990: Fix PERIC0/1 USI clock types
Message-Id: <178015989447.40681.11936234439376141101.b4-ty@b4>
Date: Sat, 30 May 2026 18:51:34 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_095137_802011_AD63178A 
X-CRM114-Status: UNSURE (   7.16  )
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


On Thu, 28 May 2026 15:09:01 -0500, Denzeel Oliva wrote:
> Use nMUX() for USI and UART user muxes to allow reparenting between
> OSC and CMU IP output when changing rates, and use DIV_F() with
> CLK_SET_RATE_PARENT on their dividers and gates so rate requests
> propagate upward.
> 
> Consolidate identical USI parent arrays into shared
> mout_peric0_nonbususer_p and mout_peric1_nonbususer_p.
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: exynos990: Fix PERIC0/1 USI clock types
      https://git.kernel.org/krzk/linux/c/e11560b050ce867bd7d3ccea138231db54e2250a

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


