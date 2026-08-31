Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0CBC61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 11:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2W8jOJ06warbrDPILCkL8sgiW7WvfOtSLFf8/fDlV0=; b=HL65Ohomchjo/Dh7l3+/BeLC27
	jtlBDIc+++t/bJptnMulawfeofhRYIOyh6qwEhWP2t1e72CTvBFHhdnmS+poicb51SgWEPPdyDuTX
	vVFpL98F1ifsjmrnjmNmV/adVYjeTWVjx7Md+TPr+BmYrLTd0tU7DY+W/JdFK1VPbY6fqjOPZK0f0
	fIdr0ViL3LZ4Y1HBYLqUauN/2/pYhm8dLvslHIkTbrF5vXJUXYYEo9J4//9Tlw+8z+3z5TuyUfI3E
	UXkSbelZbcLObXH1PzTjceIh5D8AizMeCfNcEbj+IeaC89woWqtKoK8XK+5zq1y0i3zlur92+hlnE
	x++7PH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10Hl-00000009Be8-226D;
	Mon, 31 Aug 2026 11:34:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10Hj-00000009Bde-48gH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 11:34:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 325A060218;
	Mon, 31 Aug 2026 11:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB511F000E9;
	Mon, 31 Aug 2026 11:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788176082;
	bh=V2W8jOJ06warbrDPILCkL8sgiW7WvfOtSLFf8/fDlV0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Cb92b7KD7d1mr+w/4jwGvmN+x0rwgvSGHgB0SPP9kPfmFkNRriEA2ZPzdMjMwEAR3
	 q0TAQ1cpWs5QYUg4UxN1z1iG9IVPqbD3hCOwfa7xq2oa/0AgdeFQDkVd9FKVihw3w5
	 inWU+p7oYMZ5HLQqmjQOWbg15rP/GNBgH/cKsl+0T2Sk9qh6E1i1v9D8M8S6/vMV9a
	 GG/HJGtU4qnwbemjovKJFpE72NhN8ZbRCHCC/kIRzEyMISClxMfjSd2CS7YAMqBowO
	 Q92VwhCHPE+SFKBlVT68S4PHD0fAagqopMLwUWo07BGP3t71Hl/AyPADjYtRD22Ru1
	 49jB8Owt4kZXA==
From: Thomas Gleixner <tglx@kernel.org>
To: Tapio Reijonen <tapio.reijonen@vaisala.com>, Russell King
 <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tapio Reijonen <tapio.reijonen@vaisala.com>
Subject: Re: [PATCH] ARM: fix get_cycles() always returning zero
In-Reply-To: <20260827-arm-get-cycles-v1-1-6495fc03369a@vaisala.com>
References: <20260827-arm-get-cycles-v1-1-6495fc03369a@vaisala.com>
Date: Mon, 31 Aug 2026 13:34:39 +0200
Message-ID: <87ecfecyls.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, Aug 27 2026 at 09:54, Tapio Reijonen wrote:
> Commit dfc256dac54c ("calibrate: Rework delay timer calibration")
> renamed read_current_timer() to delay_read_timer() and inverted its
> return convention: the old function returned 0 on success, the new one
> returns true on success. The ternary in get_cycles() was not updated,
> so it now evaluates to 0 whenever the delay timer is present and
> readable, which is precisely when it used to work.

commit e1e3a0ab69c64eedaf53dce9306f8a090bf038f0 upstream


