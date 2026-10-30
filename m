Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CAB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0zLY4ldO;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jba3VDhQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=0zLY4ldOhxx8Zm27+vroSoCmqn
	i1QoZsM+ThZJIgNyJ8FCJYCZu/e60Wa1gUFB6Igr781QZylMLbr9skCqbqQHD07vIX+ANV6iHRynD
	KBbK//+xaN7WuS7ELOhsSvqryZrMm8uSobWynKO93BaCzy1hWfb1hbxCS2w5YHmDwEpzji+SOPTeB
	DPwmIzRLVB+zdlwTUbjAn0ek15Nn9l1xcOYG1vZQ+6q//kGPzjsH5Mj9dnf4IMlJJinRYLj0MRNYz
	YkNKmFvIBXqs2U1yBx7uoQcOK8HhKaViegxbxS+93ndFTNK8v7+3n7BvHIKy1N1tC08CemFAWp3/O
	TLs3EiaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiWd-0000000BC4l-37gh;
	Fri, 30 Oct 2026 09:03:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiWc-0000000BC4f-2OKG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:03:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BD656062C;
	Fri, 30 Oct 2026 09:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CEE1F00A18;
	Fri, 30 Oct 2026 09:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793351029;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jba3VDhQK8Azg35IwM/K/ULHd5IY8xLxA431JYRkLzJjnS4uz+dMmK3rKGjcZZbZT
	 0ehkyIq0I1C9FP0r2x8u4lZwvNfaaqpGCfTP9veWoe3mZKEhEBwgSFhqtCQYHnu/aQ
	 pOoVuiTf5uzi8GSmWG9cmL1jIhW9YIjdSHLqrS9Mj8gplaH0qanyfIKUmr6xu7wS2l
	 CmBm70OOrxaXnX55iDA462Q6lECOhMfjNISDwr6e53/GVul+XtCynCYc/V4vWRWlbE
	 30KFrU1Ci8iI4lDkngA0JixlAObuXQRyE603mr5eJchScKn3FRxDEy3WZSW8VraiDL
	 effH+ecMfM9uw==
From: netdev-bot+sinfo@kernel.org
To: laixiangwu <laixiangwu@cmss.chinamobile.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ti: icssg-prueth-sr1: Fix device_node refcount leak
 in prueth_probe()
Date: Fri, 30 Oct 2026 09:03:47 +0000
Message-ID: <179335102798.3327.13730382084781364050@kernel.org>
In-Reply-To: <20261030085851.2019-1-laixiangwu@cmss.chinamobile.com>
References: <20261030085851.2019-1-laixiangwu@cmss.chinamobile.com>
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

