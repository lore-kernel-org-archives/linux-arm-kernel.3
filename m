Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3166FCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 11:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3B+mikFNlZabMyXp9p+/OHQ890QQLJ1zpZv52IgKcEc=; b=4EuOMRW6w+uaSR6jyPdHmUYeE+
	rC1nJVl3GbQTqaHxzTSQGOIDYf7MmEo7/yEQSENYH21vz6/iHjdN5slIaVFO6rkaM7QpgnEGdwNPY
	SgDShtz2NwpTYVjHWBq4IUidHL5FpQtESFU9wxlpNy2YjR5JqR6KunXw/RNOe3zrRHrELoHODjItR
	BkI3/T46RZGLqZyH8AbofTt5SdlqDzBMgC6CgYgWTi0JHCY62KsMOeI0WCDJcILYlQflrNSWAqyUP
	rDSafi7Lbd3XOraj8gO6BrwoYW6P7LKqvhbokflzhpbWrCKG8u8+yyIdaKhMhAwXISVKAm4N90agF
	UrkmMRZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOZxu-0000000Cdjp-46SD;
	Sun, 17 May 2026 11:47:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOZxs-0000000Cdj5-2Gzo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 11:47:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B4E74077C;
	Sun, 17 May 2026 11:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375A2C2BCB0;
	Sun, 17 May 2026 11:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779018443;
	bh=ht5FEAjz4k2i7BzSIOv6urlA4dgzDcKJ4CAWLL1zqco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gRe3v+WLe6F9aJ8bdwGCpNjVIn4iRqqqurvdZCzGa9ttouCfzl17UX2AlK5ciUSi9
	 PV/PJ+nMftnyPjAlBl53vJqbP46KRAffvhsbh4penXyu9rVZ6F4/GZOx7LolloMB8Z
	 /cGfUCrQDTTUyshS8d7m6SXu+qH/DH2FebHMWf2J4LKOmfiD/N5kxR5+WeKpZ0//ig
	 TtXyvUwlx9n4y113r03qIIhSAJxoKGWAVeV0NL8Gw3xY4hRmyC25/Tsw1+7EV7lsf7
	 I//v3E6nN+5ueJvl+mD5Lj+SRhLZ/CfVCwrN5iReKhelr4anYqzPqvkwIaJSz8SYlu
	 6Tstx7CjpjNSg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	cristian.marussi@arm.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: scpi: pass child node to of_clk_del_provider() in remove
Date: Sun, 17 May 2026 12:47:17 +0100
Message-ID: <177901833722.3838478.12838195282594150.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513090900.5323-1-sozdayvek@gmail.com>
References: <20260513090900.5323-1-sozdayvek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_044724_601799_FCE16FA4 
X-CRM114-Status: UNSURE (   5.99  )
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

On Wed, 13 May 2026 14:09:00 +0500, Stepan Ionichev wrote:
> scpi_clocks_remove() iterates over the SCPI clock provider's child
> device nodes, but passes the parent node to of_clk_del_provider()
> on every iteration:
> 
> 	for_each_available_child_of_node(np, child)
> 		of_clk_del_provider(np);
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] clk: scpi: pass child node to of_clk_del_provider() in remove
      https://git.kernel.org/sudeep.holla/c/b79d9b5747d9
--
Regards,
Sudeep


