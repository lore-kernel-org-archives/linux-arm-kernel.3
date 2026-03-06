Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A801F0182F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPROtsTnNLJzZlGcwlJzBYRMDDzSioXP6zf+snJ1cpM=; b=Fd8b8XiXgpdaUCmmHEF7l+RBT/
	fmyvDeGGXEWEmtCsZsKjCn/5TVqdvtGHlre8AUInU84nt3TgM6JCqWT8tt55jBGeCLwlU8A7rLIi8
	kH600KZzqh76mLMoe6mxlt5koJKqvTS/8vPP25SEjYcgVOoD3a6Z1MqHPCytpSjUEfUph3H8r6fsk
	6XoD06T8DJzTBguFo7S4quj2uSU1k+qT6BprhqvIntJP9oTMpeYr4Ihdc3KpyhqFxUHqWQb5jOqn0
	WStw9qnJFuEDRhS4ZGoSBRLiw+PK95veSrV3Mz5JdzCy/9INhVT4ltsBb+yUb1g7vo+fmTtpdZR+V
	N49RR/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVig-00000003pjw-0L0A;
	Fri, 06 Mar 2026 13:59:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVie-00000003pjn-2YEA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 13:59:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CA8960131;
	Fri,  6 Mar 2026 13:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B95C2BC87;
	Fri,  6 Mar 2026 13:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772805593;
	bh=IBx8s4MEb82WlxxgDM5bJV6i1OaR8I0L+CFSnAv5e9Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=igF5XwZkDIVguvOozPEcoDIOUNb4XQBtPfO7s3jYmwgSbWpeqIZBYS5Gf/5uvLEzE
	 rSirtVCE+D17p03ffGx+3ruUkP4hE6XWxEywzZn4VtLKXQONo9suR6p/3aVC9BROdx
	 gSBNQuIGpqgXxwk21GOrfsqdQ4fWrupIsR+LbGcwCtKBkwVH6s/0EjqfNQsa3C2tca
	 GhBCMi7uezfrCWIjRhVKJAN7TOwHo52Z2pAPStb35e7DoyVgbUQISQviVuJHkjwA+a
	 Xl0eykpl9YXDOqtru0gBz6CDfejU6Frkuzp/pWsANxP21cme2JVECT//60L0kmR9oe
	 zR2fB8i9xCcpw==
From: Lee Jones <lee@kernel.org>
To: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Michael Reeves <michael.reeves077@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>
In-Reply-To: <20260217-b4-macsmc-power-v7-2-4a4d63664362@gmail.com>
References: <20260217-b4-macsmc-power-v7-2-4a4d63664362@gmail.com>
Subject: Re: (subset) [PATCH RESEND v7 2/2] mfd: macsmc: Wire up Apple SMC
 power driver
Message-Id: <177280559145.1054360.6985204095532084985.b4-ty@kernel.org>
Date: Fri, 06 Mar 2026 13:59:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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

On Tue, 17 Feb 2026 21:47:26 +1100, Michael Reeves wrote:
> Add the cell for the macsmc-power driver so it is probed by the
> MFD core.
> 
> 

Applied, thanks!

[2/2] mfd: macsmc: Wire up Apple SMC power driver
      commit: fd708bd746a1c81e7467f61ee1b538b1f4f23383

--
Lee Jones [李琼斯]


