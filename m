Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F03FC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hDoNt/IcI8UVVVhiKmtR1oyxN5TwwRmY+NA64nR1NI=; b=REjJDjno0moJzHNWsmQQWTtA7N
	UBVx4GTRKX8gr2IVBcUd7Q4pCs/iL2/nj+JGsZtLQXMoRzsPLuYtgNu+EEzO1SJrtM+U3rIZzkFbc
	Am6z1hv8NAkCiu09FDkD7wkII50ozpjLMrRXOjF7dMCEy9ZE8r97QGCjLZnRofgautU+xThnymP6A
	HlzlPEYQd16gj+pTgOCCJCpEXNDOhSRRgrZrjnyydWKgp6Vvk/xBEOBySD647Pa+6qo2ySlq5kf9A
	DAPlvDSIx9fzOMgcMPGamJU8Lt5VyWWW60gG6wya2vlQuGGqv1oO4AyoJ7qOk6BkggZRqd0tjnlrD
	53i0k1cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsM9-0000000H7Sx-314n;
	Mon, 03 Aug 2026 13:05:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsM8-0000000H7S4-0hGu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:05:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A4C840972;
	Mon,  3 Aug 2026 13:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4751F00A3A;
	Mon,  3 Aug 2026 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785762323;
	bh=7hDoNt/IcI8UVVVhiKmtR1oyxN5TwwRmY+NA64nR1NI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eI1wyjTyDaq+cllojo2voNxq3bu5QnmjEDXc4NG4TZQPFi0s0UANd85KOnW+maRRG
	 e/2O0I3bo0jengfKVSlJRVi4dbABu9MU+VIsqMMfbMBLyijc6net4bkn9NT0y0nbSc
	 uZG4dsQ/ls2zwl5y6CSM6gygxmxb1MMYVdOdYpqFWoGWVsQ+QA8s+p+vx9F4C1J1Bw
	 ucUgNRmoHAVluJsf8+imsxxWx5VyXHTmqQMwvtpr7Z9L3dP8dj5Su9tS6uMaJGyS+G
	 1Ut/7tndLob2Nd4QjLrXEzJaKNNPTOPGUmgH704MvX/NCePT+R7H/sJ2nB1lehEX7G
	 1HiUDuN9Qcpsg==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Paul Louvel <paul.louvel@bootlin.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] soc: fsl: qe: properly scan GPIO nodes at startup
Date: Mon,  3 Aug 2026 15:05:02 +0200
Message-ID: <178576221779.155079.3783262414291581671.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <a1db12ef75bf881dd5fba893a37db0c8517eca1b.1785414349.git.chleroy@kernel.org>
References: <a1db12ef75bf881dd5fba893a37db0c8517eca1b.1785414349.git.chleroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=666; i=chleroy@kernel.org; h=from:subject:message-id; bh=C36mAtGFRBt/txt5qECqtJJPOORfncKwPxMA1G8HePA=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQVTGJlkJj8ePrJ83c+ac112PQswufDnWz2u1+l9tbsD XHS3Z+R21HKwiDGxSArpshy/D/3rhldX1Lzp+7Sh5nDygQ2hItTACYytYuR4bytl/Fm//wjEywq eD4+v+YzI/J+2fZTM1+dK1/EOcsubT0jQ78cl3/8Qt9j/9fO9dDr/dRv+sto9w5b1rzl24WyxZf qcAMA
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


On Thu, 30 Jul 2026 14:29:36 +0200, Christophe Leroy (CS GROUP) wrote:
> Before commit 156460811def ("soc: fsl: qe: Change GPIO driver to a
> proper platform driver") qe_add_gpiochips() was walking the device
> tree to find all nodes with compatible "fsl,mpc8323-qe-pario-bank".
> 
> After that commit the discovery is handled by the platform core,
> therefore it is necessary to call of_platform_default_populate() on
> the par_io node.
> 
> [...]

Applied, thanks!

[1/1] soc: fsl: qe: properly scan GPIO nodes at startup
      commit: e2414b289c2b68afab361def612ca3791cd70d12

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

