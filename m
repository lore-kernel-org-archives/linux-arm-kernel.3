Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92E1CA1006
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hGKL4FKs6i1GHIz+xvbOKSl/l4umvQsOiUCwcWZt3c=; b=cwrUZB3wfWH4pqCM+LDv5QReFg
	SOPvOhVN2Ym0muOzQW7+6rVfCBuhYHhqHImGRBb1z+62DjbkxVYILP6LjqE45B9PKzFVDpK+GBYl1
	TQiqd2BKPDrRSFtsjcRSkLRDZ/gJjZyYkJJ03fkkxvLwySFyrI91qpWjc3Md+EObpq2i8U+Wp6GmI
	bHB9s071VohM5/Tlt9cdKRN/dRFOsPT9bnhZuJYjSgHns0kZZqbediiRUU8e/G2WgtAah5ufEuFSz
	Vk4WHDQ3vfhdFpsEPxLfrbSGr1j5+qhOD5JYvbxQCZKrw3I8Q7FiPIqwJNG1hpo9IGCNyeYam5b3d
	ELyKLl0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5os-0000000CtCb-1l2B;
	Mon, 01 Sep 2025 14:47:42 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3bp-0000000CQ4f-3nsX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:26:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6ABF9C8F1CA;
	Mon,  1 Sep 2025 12:25:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41FBD60699;
	Mon,  1 Sep 2025 12:26:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2DF91C22D736;
	Mon,  1 Sep 2025 14:25:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729562; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8hGKL4FKs6i1GHIz+xvbOKSl/l4umvQsOiUCwcWZt3c=;
	b=ICva/DOhoEqp0sA/6pEKzHDp66jcy4SdmY8zOiDNLM/OAzy2LXngum3o1tpj3CFzbRhWav
	dSu8CrivVDRGAnuO7HUwM7hJ0u1+5nvI74OY9iDBX2wA4uZ1eoFrjKKo6HX5h5LkQ0SQ2o
	kfy5behNlzpFHvhiXPnndYs1DvuU+5jLkPpTu98qEhsMv7E7z2ds8pYwloloJUVcpVcHOr
	V7bbVLfvGGoj108tZnogq9g+yN0rPZxPvUL1sjHC/knOiOujD+aPXCbA5Kf8TPC1MIjN+I
	GS4y0PiZ8HhRTmqzlW8Qya6sZ/6vnxC5IvXiYhpfmFsVHAhNUbYp2FHOcRdqxA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Hui-Ping Chen <hpchen0nvt@gmail.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <a2a4ca2010ac4aa2aee0bec151d2e57e812510a0.1753904852.git.christophe.jaillet@wanadoo.fr>
References: <a2a4ca2010ac4aa2aee0bec151d2e57e812510a0.1753904852.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] mtd: rawnand: nuvoton: Fix an error handling path in
 ma35_nand_chips_init()
Message-Id: <175672955080.48300.7085440480114483519.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:25:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052606_312392_CDADE2BB 
X-CRM114-Status: UNSURE (   8.44  )
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

On Wed, 30 Jul 2025 21:47:46 +0200, Christophe JAILLET wrote:
> If a ma35_nand_chip_init() call fails, then a reference to 'nand_np' still
> needs to be released.
> 
> Use for_each_child_of_node_scoped() to fix the issue.
> 
> 

Applied to mtd/fixes, thanks!

[1/1] mtd: rawnand: nuvoton: Fix an error handling path in ma35_nand_chips_init()
      commit: 1eae113dd5ff5192cfd3e11b6ab7b96193b42c01

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


