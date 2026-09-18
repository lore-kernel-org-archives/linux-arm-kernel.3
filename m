Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045F9C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NyvQt/xrr7/J2Rj9IMwy3V+McdYcbrXcfwVdArfFoA=; b=nTl06hBqHHRGQsEmzkoS8r5d7L
	kB/Oq8OiuxFGYPOY5RXrao3JRu7huX86XX719D+1D7xpre557MCazEaj8yqyoq1XWTplLLX6CeLaB
	PBWGUpQqhWApJPqatfF0YqrcYb/uAnwLhiECOwi6YFjTJUE8/gS8M0TEjO4DYRu9lQIUEH0+M8Mwh
	d7uiEbvST/PDVfDHTeeSylZl+xsSEz6zaCzOUgYhziw6x8nP3WM2J4eOONZfBLZsmzdkSo8OBr/rc
	FUUap+iunbgJTFCrZjEL+rVy6pHZQeNTl+8u+ZCPXd9XShrI/d6HSY122NUQ6YAjFfx9oAomMXdnR
	OlnhorYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7U8O-0000000DqAP-1LrG;
	Fri, 18 Sep 2026 08:39:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7U8N-0000000DqA3-18xV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:39:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2EF7404FD;
	Fri, 18 Sep 2026 08:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF931F000FF;
	Fri, 18 Sep 2026 08:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789720790;
	bh=4NyvQt/xrr7/J2Rj9IMwy3V+McdYcbrXcfwVdArfFoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oj77CiL48FknHrG/C+PhbXizZUrccbyaIuo3sONdOz2U0EvXATU7wC8FbnrJo60pH
	 QpAm2SeEbdoxJ/yoATNd0P0VxnhXE6fJu7qNIUQ2UTuBxXG3u/MFGuSliTvss13rZF
	 v5pAsTYW3qNHQ56yCV6KcYHzt5z9hfjHNxw87z+4T6hpY6dfai1Zr3fgq32vL5eG7L
	 HsGhskkQPvusqC2fGVVPyVjpqnLE3a0QHxAVnXHiXL6Qb7G30yPK7oUIe8l87lgHeN
	 ltaNmSB+jSb8Z8G7ksFALjofzsIkOaju8gcqyyij9pL1VP+UFwqeUouFc2aB/0ZeMV
	 6kb8zmJwnr0OA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: broonie@kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Cc: Christophe Leroy <chleroy@kernel.org>,
	herve.codina@bootlin.com,
	leoyang.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	qiang.zhao@nxp.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: cpm1: tsa: Fix clock leak in tsa_of_parse_tdms()
Date: Fri, 18 Sep 2026 10:39:38 +0200
Message-ID: <178972077003.546774.17878987805855996127.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917152719.2160395-1-vulab@iscas.ac.cn>
References: <20260917152719.2160395-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=614; i=chleroy@kernel.org; h=from:subject:message-id; bh=pC3q+eVOwKtbzxx0BZcSBlwLSzb+dYpbfXOvP0gz5ns=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWSt+XH6buLtv9na7FOKuo6fmv0y1mOv4ZXC3YLNRmFf5 xSlCDU86ChlYRDjYpAVU2Q5/p9714yuL6n5U3fpw8xhZQIZwsDFKQATOVrHyLBd81a/VUC7/Lvs V8wR18VXh8btmL879cL1SyfqXllejt3H8D/hjcFkRYddXBcy5nGpc3U/+rEidmt79dx94flrQvX 7r7AAAA==
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
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


On Thu, 17 Sep 2026 15:27:19 +0000, Wentao Liang wrote:
> The error cleanup loop puts l1rsync_clk and l1rclk_clk a second time
> and never puts l1tsync_clk or l1tclk_clk, because the branches that
> guard the transmit clocks use the receive clock field names.
> 
> Use the matching field in each branch so every clock acquired by
> tsa_of_parse_tdms() is released exactly once.
> 
> [...]

Applied, thanks!

[1/1] soc: fsl: cpm1: tsa: Fix clock leak in tsa_of_parse_tdms()
      commit: 7b3b0598c00e67f2df85d0b4cd99eaa3be6c9bfd

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

