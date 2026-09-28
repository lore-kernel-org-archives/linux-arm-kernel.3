Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D74CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 18:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=YEiKhVJnrFb3D05uLv9+HUeA1v
	2XImw76rCrHwS8Kae8MtGuc2vpVNKjFDSjSsJo2bKu+wif7zHPl91qIKTK1PO+RXAeDbmbT1KxOnB
	/9/qBgrP+L3egUU7ZNXflbxBxhVTo6nf7zgLw59LzySiuWbBlRhrked0XywLvWbFH8mmtnZR4FqPm
	BLldAZIpjFJ2Yai/Uszh3e4Gd2sRIDIgFxEhUvkaoNF8m19Bm9b/0Qdxmyv9mMjlzxQZ7N7u6yYWo
	l1Xbbn8sfk6vtb+B+MYgMQZcn9vuV0KDhFaCzKUApsopXesab0MZz6GoedHwf+h6MLBzLrfwp3Er5
	wm0ivGpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGMN-00000001Mbv-0IH8;
	Mon, 28 Sep 2026 18:45:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGML-00000001MbL-2oWg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 18:45:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EBDE435B8;
	Mon, 28 Sep 2026 18:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668CB1F000FF;
	Mon, 28 Sep 2026 18:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790621153;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jp81Qan8MtJvuJKPQ1zFoDYsM55kGAplv5MMIxAV9NuE11nzbV1RquJfVJ7NJSBnR
	 nYOhvLZKC2XoxdxahYqLwLkwC6IsB32NF1PAV3K8eAmER5fk58cJewG/16yQoOR3HZ
	 YJ6AjHwzCV2gltbUUrToNXy9VGIRcULKYsgiS2bbM73pLphgkbHu50ij1KOjFufxAA
	 FprBXCW8l6vEzZ/9IgUoBpnbIk82zXUVQObNN6VjHwj5Hm3ASIwGsKSvsUz93vDbgJ
	 ekVv74LEfz0lyHjV7xB0OD98JfG7vwsFnIjNFLG3wx4r64Um3wwJBec5rq4vf3tuSF
	 3OFCiXowVRqKw==
From: netdev-bot+sinfo@kernel.org
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4] net: xilinx: axienet: Free outstanding DMA buffers
 on dmaengine stop
Date: Mon, 28 Sep 2026 18:45:51 +0000
Message-ID: <179062115189.31693.10983859622988810787@kernel.org>
In-Reply-To: <20260928184207.2361931-1-suraj.gupta2@amd.com>
References: <20260928184207.2361931-1-suraj.gupta2@amd.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by code inspection). If it was triggered please include
   the symptoms, like the stack trace or error messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

