Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3442B606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BUc48mOe;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C4ZcNPkS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R4WIaVmgxMJzlsaERAlBqwLuDwVcuzfSzsQMDWtKV3E=; b=BUc48mOe2rokb4Uxy2nKsDJhPa
	0fazuJRgPOWGRd9AXZL96fngEYq29MTNfteMjhKXYZlwhex29OzMydDDhTHpfQE3hJIZgRxOfMmZV
	/OPtZO1TqdkPll918e4k5xFa2dr2RNDuchjUaRT5KrTi7GvWuZ3O1IKLfjjgj9jq8TmtV2jd7yzHs
	O2hEyIQxtdtZUzSY0Bs7CgTje/j8kkE/mUPgbvIjppikGK6Z/GeVJkGdR/9NI6o5pioB9xXMDVeN6
	YWRHwSbjICw6Lw+uwmaM2pYDdN4cIyCynW6BxpLv1baUYEDk1CMA1hMt9DzX3RysXkTPCIAdWTye6
	x/AbbnfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFzD-0000000BfaX-0sUZ;
	Fri, 06 Nov 2026 09:11:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFzB-0000000BfaO-3Srz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 09:11:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BEEB4388C;
	Fri,  6 Nov 2026 09:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D7E1F0089F;
	Fri,  6 Nov 2026 09:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793956309;
	bh=R4WIaVmgxMJzlsaERAlBqwLuDwVcuzfSzsQMDWtKV3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C4ZcNPkSyRQJZ0ssAxyOMZ6NFqyoKY/VDCujA8FssoHINi3z2X3hPbUHDPdeXI9vc
	 eYCG814CQSAlEICIRTKLQ0GM88EyBjkhZ+qdk4fqN1/egDjG9IK4Zp64lxEV87Gdu0
	 IBCJIeac5mBite0gVy9eUWdY2B1MMyUR3VlVGaV1L6dpHIgEK8MUeBC4zv73EQ/PK6
	 TPtzgyakdQ21r3JF8eZQQOHd+Us4Xo6p0ETmPwXoY578Lvmkt/svBechSexZLD+tLv
	 4jlJugHLDXDXRx9e0giw3MySAaf8XEcHaych+oiYGidzNOERGrbfvMgXTeLgmMUGKq
	 frDF3t+wXlFWw==
From: netdev-bot+sinfo@kernel.org
To: Ding Hui <dinghui1111@163.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dinghui@lixiang.com, xiasanbo@lixiang.com, yangchen11@lixiang.com,
 liuxuanjun@lixiang.com
Subject: Re: [PATCH net-next v6 RESEND 0/4] net: stmmac: fix DMA descriptor
 ring cleanup issues
Date: Fri, 06 Nov 2026 09:11:47 +0000
Message-ID: <179395630778.488859.15565408556126944757@kernel.org>
In-Reply-To: <20261106090507.1020751-1-dinghui1111@163.com>
References: <20261106090507.1020751-1-dinghui1111@163.com>
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

