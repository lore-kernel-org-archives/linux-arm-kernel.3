Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7936073797
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HUMC1RFY;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhvtAJHZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=HUMC1RFYXE+S8fDIPfuf0TgRMI
	DDB6EOasTEoGO/E0SDzik+yK71F398tH69fg48PbLxWbNx8NVb1U6e6BZkP+IzWkg3ZS7JlEOy9R6
	LtCCiRhkLlxlL2RMAkkB524axcRZR/iWGmoboUGuejQR5W1avhENIYzrRcQnK/UnBF403k/kvcptr
	wQVHnLFqozpZ85YP1CdVUUWMHLUVMdxlX7De9/j57ya+Xjjl6lCXRf+gvrf36luHNNe268iACpEBt
	WoLHzWvY8TVhf0rtYXWo/hDpihWLVEX2PGez/+W8zEs0B9HC0ca8tFsvjQbXE7dO1VFKEKocBj0bz
	c3md6nPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBqq-000000021YW-1HRH;
	Tue, 03 Nov 2026 10:34:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBqp-000000021Xi-0WwW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:34:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DDB3341457;
	Tue,  3 Nov 2026 10:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261111F00919;
	Tue,  3 Nov 2026 10:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793702086;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BhvtAJHZeYQIMg97ZMZ/UsiRQ/bfdXmMDtCZNSyzlKIAt2+2fc8GsEdEhW/yJB8Pe
	 li5XTil64wZr/Eppw2rPf/vvg4EPGqFpg7yxRu6rNLggmbKWWclCXqMN/LBNAbMf6e
	 657PgJfORhVLFmM9w4EMUr/oEn641LakT49XalDvCBUAmkTXD77sPU/dheQ91sygG0
	 KIui+33YoCt7Co0GnGrRRr1E+UnaNdRdUbxO5U5QCzwi2k7kd+CliqZ6qMPrvFh2rs
	 lvvYVtYEbu0uZtowLCWZYXwUJC0XC0g4z32Lbl94yKZaNI0oeakua7lGrOzbqsCJdg
	 U1IbtCZ3/wceg==
From: netdev-bot+sinfo@kernel.org
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] net: lan969x: fix page pool leak when RX DMA allocation fails
Date: Tue, 03 Nov 2026 10:34:45 +0000
Message-ID: <179370208572.488859.13061346366607399328@kernel.org>
In-Reply-To: <20261103102854.1340615-1-vulab@iscas.ac.cn>
References: <20261103102854.1340615-1-vulab@iscas.ac.cn>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

