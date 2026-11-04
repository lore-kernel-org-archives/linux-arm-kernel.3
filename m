Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4E2606EE84
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zm+3DK4d;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eXCvFuDU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=; b=Zm+3DK4dVcGNxVznVC49VXKNq7
	cd4wyUpzIwLlzofOy9FxaINTON2jQgfQ9lJmSspyeDecZINi3YySqbo5hv8c25RRu1/SH2HECrao+
	LNuXE3z3YTq5Ise+MshZC2bcOjw8wc/O2nqqSj1mGd4kflZ4KsD65mWF/CSLNYJhC96U6RaU2UeOX
	iXdFy6wZFFrNAI5cJZ74PWAt9Y9ub0mR1Q/+MAC0bsPshEDakC3831E27iSWXGUk3yEALN9E5DL26
	wIZIIshpw8w44kmbyxPn0AgUkk+8+oUCXG3oW/PM4M+Ruh9yH8YMZrbkExWUszZk0ynaHtWgJhODx
	582hPfZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg7J-00000006SXF-0QU9;
	Wed, 04 Nov 2026 18:53:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg7H-00000006SX0-2Owz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:53:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CEC6541208;
	Wed,  4 Nov 2026 18:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A721F000C1;
	Wed,  4 Nov 2026 18:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793818426;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eXCvFuDUA5RNtyc/tcg5n5mfR4ya7s4aCqBXwm/WLftspUNTI7WpiyHUk/ojFTbeH
	 C522E53qNf++5aiP9nwFo6L0aYLjujRjpi5Fy1D1crIuU1k44FBWwiaKdpTflD2i9Y
	 6cOFJZ6WXymiJ4/+cRgJ1NGDYR7tEA7E5ZCR+oMyga4kZLzblMcy25qcw03yOqyIx8
	 1IuJVpFfYo5ek/Nq7OSIQwdTLWw2iKHF16TLosoiCWfwNE9UmmvUyzIZ5pV9YEWKTE
	 ECLxueLk4dsNjCndFdU4KZ6KqgzzMSEf3uAmZ2h1vDZ0RCPXYG5dnBjISElVswmCgr
	 ZEI6M9eHlJrTg==
From: netdev-bot+sinfo@kernel.org
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Piotr Wejman <piotrwejman90@gmail.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: rebuild VLAN priority steering when
 filters change
Date: Wed, 04 Nov 2026 18:53:45 +0000
Message-ID: <179381842538.488859.11490770653999769834@kernel.org>
In-Reply-To: <20261104-submit-stmmac-vlan-prio-v1-v2-1-6cfc71e636ad@gmail.com>
References: <20261104-submit-stmmac-vlan-prio-v1-v2-1-6cfc71e636ad@gmail.com>
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

