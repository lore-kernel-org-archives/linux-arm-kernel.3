Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA41CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UE1ia2+Nnud8lkNlwJM2jeNw6p+Ex5NbnOjwL06Qys0=; b=0T31DdhqF28U1cILOxhhnxQhg8
	crFRiB2u5+Iu1/McgRwMse26AJH9fpTYBbxuCycgYwIQ5xDl2oOvcxub85FrTYnsUG7KcKWuDLr5B
	0oZRn0fj9tHJEF1qnfYD14vUMjBMI+p/+QWzkQ+6MZXd9ERtnkWv6/wg2mMnV0so086Ga0ZXXqCpG
	aASkbl30pDnbKRg7eSvAhb0cEuPEcaMS+JYGwbmN354hfOytKuUlJDv/kAWGVNKqcrujH9nBYzuE2
	ZGbiND8feVfyzVMH15tsHJjrGNvfw9h7teABr+DsvYWfD8+Lp1fesDbRx1fNdmDFDa/ODuZHODfnG
	lutm+OzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgAU-0000000GD8r-1ojC;
	Mon, 05 Oct 2026 10:43:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgAT-0000000GD8h-0bTv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 10:43:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9443660A6F;
	Mon,  5 Oct 2026 10:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92031F00893;
	Mon,  5 Oct 2026 10:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791197016;
	bh=UE1ia2+Nnud8lkNlwJM2jeNw6p+Ex5NbnOjwL06Qys0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WbDtHklAq128TTT3jUfClAR3xWOifVFJPEnubk4AizHnxIh19nAdiBH00borMMGqb
	 MAByAPlZgwLeHr29YA1AU3O1TrkOcGP8mkFJ77PQAefyTWj54GNmaJ6dsHYSAVvuhF
	 O7/xIkhsHbhsIrTaLqeX/r9UCJs4OQdtwHfaQ6srnFxfRdv9zj4I7r+4qsD/y98567
	 dz6LKDD+C5PGOiwV7+J+fdUI5btnNGAIIjpsZQOSuXg2UoLwqLLEIlHUZYPe4wTd64
	 aolLoU0lhO0Cq6uPtbMKV+YBEjXPTlioPWrLJM1iCBBlPSdL5aJcjUBfY3VFs78swS
	 iQYCnEjoBAsDQ==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Myeonghun Pak <mhun512@gmail.com>
Cc: Christophe Leroy <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 0/2] soc: fsl: dpio: Fix IRQ cleanup during probe and removal
Date: Mon,  5 Oct 2026 12:43:20 +0200
Message-ID: <179119699110.180542.13258001668157935133.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261002194802.375497-1-mhun512@gmail.com>
References: <20261002194802.375497-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=783; i=chleroy@kernel.org; h=from:subject:message-id; bh=JwNYDRoRQhU9WQin3CftpaZ6xeoE0xQIsjPgxSQIBJM=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQdrveyvLVe91fb/K1b+vZIn2RcyCvKuOO23mmNkocn9 xxs6Fgq0lHKwiDGxSArpshy/D/3rhldX1Lzp+7Sh5nDygQyhIGLUwAm8uoeI8OzmZGPhVU/fPia Urxe8uK9vqSF5slLv1fx/C26nXtn2fbHDP/UnrerP1ip5bfrmxavl+KEKbdXqs//mverxb504nO z8tdMAA==
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


On Fri, 02 Oct 2026 15:48:00 -0400, Myeonghun Pak wrote:
> This series fixes two DPIO I/O object lifetime issues during probe
> failure and device removal.
> 
> Patch 1 releases the I/O object when IRQ registration fails and removes
> the unnecessary unregister call from the probe error path. Patch 2 frees
> the managed IRQ before returning its resource to the MC pool and before
> releasing the I/O object during removal.
> 
> [...]

Applied, thanks!

[1/2] soc: fsl: dpio: Fix cleanup on IRQ registration failure
      commit: 899559907f9d8bce0720f6d4336b2871e83957ae
[2/2] soc: fsl: dpio: Free the IRQ before releasing the I/O object
      commit: c4ddf1eb1d321e40d82fb89d34b61edb3f927198

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

