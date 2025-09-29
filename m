Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231CDCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 15:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vo4QfhD98L8b58KoDVJk9jRcoE5N2oLtCd0bb1BghPw=; b=RL16AFOzEM8EY5FZ92Lj9BNrNW
	9VWv55rYOXUSGL4ihqna7AjI+SGFhkmkCDa/GZUgiTEsxuH7jmfrwXJK6woNSZ8eBS8ou2zHFX2eh
	wvngz5mRM8SksYuWCPNxKd6/Whz/EkuOr2ItJL0QmQJzTe7ibdhtv88b6n7eDUqlhtMDlPK07V75z
	S4bPUo8eZRIZCdez3iO8a7B0a6cJZ8v7Tx3cHBykm1EjzKc/JVvTqZR9BD9SVXI4dbmyEN+7VF+iP
	SqKScuejODKga5qx2PfbXaYOyQaA4zqRgtloGil5VxHEevmGjW0qKaUUmVHD8pRwxW39ibAHukx+w
	0LdfohPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GEL-00000002rTe-0bar;
	Mon, 29 Sep 2025 15:56:01 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GEH-00000002rR9-3qlf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 15:55:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D9BD1C02449;
	Mon, 29 Sep 2025 15:55:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87324606AE;
	Mon, 29 Sep 2025 15:55:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A909102F198F;
	Mon, 29 Sep 2025 17:55:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759161354; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vo4QfhD98L8b58KoDVJk9jRcoE5N2oLtCd0bb1BghPw=;
	b=Aoiv0H7a+tE1fllLiatpWiOhyfR6Nih+buSSLBvfymK3Xc3I4nHglWrZtS31S1P9IJp7B3
	vp3h4a4hLoWk2L48j43Uveev5k9baoVPXKe8dAEF8v4XzvBo+MxZapnEjmSZ6qprAs6+iC
	tdKeKCAK4K4c6Yn0RWUHb9xSQg/EIbYugqFhcyijKHy8ZlU4AfCboOokVuOUvi9go/i0kX
	H1NCzfTd/fBJYwQmpU6L7GxdTBWk5aN6iTSJ4xkqRUkYU4SlLBZVhReVEepQ+317t1b5Ak
	GYOwEuDeV7YuEAuisCSqrmsKzwfLUWWNP+qo0rB46rFXeKGbzFI2uKOlxgSe4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Erick Karanja <karanja99erick@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
In-Reply-To: <20250922110727.1423318-1-karanja99erick@gmail.com>
References: <20250922110727.1423318-1-karanja99erick@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: atmel: Fix error handling path in
 atmel_nand_controller_add_nands
Message-Id: <175916134713.50416.13477111980143091827.b4-ty@bootlin.com>
Date: Mon, 29 Sep 2025 17:55:47 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_085558_132461_0E2AF39A 
X-CRM114-Status: UNSURE (   7.37  )
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

On Mon, 22 Sep 2025 14:07:27 +0300, Erick Karanja wrote:
> In case of a jump to the  err label due to atmel_nand_create() or
> atmel_nand_controller_add_nand() failure, the reference to nand_np
> need to be released
> 
> Use for_each_child_of_node_scoped() to fix the issue.
> 
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: atmel: Fix error handling path in atmel_nand_controller_add_nands
      commit: 8ed4728eb9f10b57c3eb02e0f6933a89ffcb8a91

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


