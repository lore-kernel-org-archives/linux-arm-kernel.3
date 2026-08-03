Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB9AC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZP+7X3Uw5ZiqZ3CWxhIlqmxPiDSX9P3cuwNS1v6h28=; b=dMwwXU0qDf8S3+cuBE96FL2bIp
	0nyrwEEJVqck4Z1+qMdAID2pg0dK4M17+8fzxOEq5488ZOSS0WXHv3Lw3uh609PVWer+dr5h85VAf
	OBamCaFXjKLYzn7YZsm0Ys6S8jTv3vT2Zc8gf8vkn1rjqnRkVu6KjWDFnsBmZsD0RgkPirc82ygPV
	yvlgzU9Xqk9q8qUUhPtEWCdBn41HA8uRts6WtFlA+fPLzEx7hbT5WJ6GteTS8YMAemU4Zr8P61Zwu
	+Cz/L13Sfr0XffNu3w9JpdTppX4DrjT5M30KhEDw1Jl+2DHQZdSElTxF1RoHyB/vLRG5roxjkUO8t
	QDHm2TmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsM6-0000000H7Rl-2TU9;
	Mon, 03 Aug 2026 13:05:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsM6-0000000H7Rc-01Gj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:05:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 60AA841B42;
	Mon,  3 Aug 2026 13:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209181F000E9;
	Mon,  3 Aug 2026 13:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785762321;
	bh=BZP+7X3Uw5ZiqZ3CWxhIlqmxPiDSX9P3cuwNS1v6h28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M4GcgWSkF5genYsVaSXBZ3AMIxtPWql/hNVnqEDY+FEZTO2CTFXyYeWn/5eRWkpYV
	 MEmHNqCGPLfZY3H6sPXh3wvhb3dcaghqWZNdH97WuoI+cxHXT1AEKVV/IsoKWU/lrF
	 roJe6Jsgt2WY9Wji19Pp7dBQrR0mPbzWPvXSbRLAs6tFX/RfP4tuKWUSE7sltft8ZM
	 5Nzc8WwOb1pXknvLGJtOvt36QC4YN0BvlIhDwLnWZyF9TNJcYp6lhHyDVugCxx6afE
	 10hKu6BRks1nYkWsUxEoob59+0z5/fK4NfdmVf3nuweQc2oncWNX4m2pv5IyhsW7qc
	 7vgIiHQnZ2tpg==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: RAGUENES Jean Noel <jean-noel.raguenes2@cs-soprasteria.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: qe: implement get_direction()
Date: Mon,  3 Aug 2026 15:05:01 +0200
Message-ID: <178576221776.155079.14811751064714928381.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <30b3f278a10b46252783458c81dc438df176f86c.1785405882.git.chleroy@kernel.org>
References: <30b3f278a10b46252783458c81dc438df176f86c.1785405882.git.chleroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=383; i=chleroy@kernel.org; h=from:subject:message-id; bh=IrBaPxnph4YWN6xCAfs0TkjBzFIy+/PMRzuA4pYF9aw=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQVTGLccCD81pRn7Av/J7fduq5Q1K0Rf5/D9R+LlpNF0 V+RW5x3O0pZGMS4GGTFFFmO/+feNaPrS2r+1F36MHNYmUCGMHBxCsBE/LIZGaYmGVlJi25uOTL/ Yf/204tnpr0sfeHmmrxGbVe/9cnEFXMZ/immvJ0i+EtmeuxL1vg4h6W8DzPdbsk+35PxoCx9o1B dFicA
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


On Thu, 30 Jul 2026 12:09:40 +0200, Christophe Leroy (CS GROUP) wrote:
> The lack of get_direction() callback in this driver causes GPIOLIB to
> emit a warning. Implement it.
> 
> 

Applied, thanks!

[1/1] soc: fsl: qe: implement get_direction()
      commit: e460ef309f44b39480209970f1dd462f051d6f30

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

