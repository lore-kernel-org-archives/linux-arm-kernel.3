Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B202FCA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 01:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vLjdzZVo2qjctqqDpE5Ro7QbiQoISQRnLovdDe46Yk=; b=q60h0J9E1nhw5TfxvGBMouJ7/z
	RXfr1Tyy0MB7DB93hAcLJSgpToSaOaf/rkHB8vD+9YnrH/2KVnhrtdskHkTsDBMLXc/L3Zqfp0t8+
	hgkyBxMTdrQKlpaSH8djQN3uPjgdEzTByBi1CKe/aFB4+FlkvPWIDs8emXs6qDtqaF7DY2FV8j9Tp
	5xyWGqKevv9PlnUov+3MzcgrnXo0cHrAPUvvhjWoavLcCaq3KRExKHm6jwIf2GvI3OI6bFB46fWK1
	HyuUoqoEANH8TEJslk7tAsSkALHv0YPLeVNebFTw2+1MDjI8xIyCZefWzGwNbT8KBtT/cOYlNBsGZ
	Z6lme2qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBjbe-00000004tKM-3Slv;
	Wed, 30 Sep 2026 01:59:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBjbe-00000004tKG-0UXf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 01:59:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 81281434E4;
	Wed, 30 Sep 2026 01:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 031D21F000FF;
	Wed, 30 Sep 2026 01:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790733577;
	bh=0vLjdzZVo2qjctqqDpE5Ro7QbiQoISQRnLovdDe46Yk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=REtHWVNLtp5xQUCYPa1SNv2wi1HPGDYr4bMdLX8DmmFWKRvTZO94mb+fuKwphevzm
	 BbuXAJo2x+BIfNeo+Mdhaa5263nz4Dae5Do+Q2P/a6KIGP6sBRc43sSthi2fu7/ES6
	 z1/1j6h1vUR1BRTIziw6vk0cQlhEMApW148dwC/60GAuofVdgWwGNjpH9vrgppHIH7
	 hNwkBH3uNN1S21RVOt4Mg35BzoN2ExDC0FRWHRoopz7DDuMMq5T155eVYmpGkjmsxT
	 dfxwW1uh3ubmIEZreQOlSP2EqGECgSqR42LCqVAUiwMr/d0MMqEhhTnzM6bT5TTywK
	 lWU7k4swLgxpQ==
Date: Tue, 29 Sep 2026 18:59:36 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Quentin Freimanis <quentin@q-lab.dev>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Lars Povlsen <lars.povlsen@microchip.com>, Bjarni Jonasson
 <bjarni.jonasson@microchip.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: sparx5: make ports inherit the switch base mac
 address type
Message-ID: <20260929185936.687250f9@kernel.org>
In-Reply-To: <20260928045012.30178-1-quentin@q-lab.dev>
References: <20260928045012.30178-1-quentin@q-lab.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun, 27 Sep 2026 21:50:12 -0700 Quentin Freimanis wrote:
> 0 is NET_ADDR_PERM, so userspace thinks this is a stable address. 

Could you please explain the end-user impact of this?
Unclear to me from the commit msg if this is something that broke
your deployment / scripts or maybe you simply noticed it from code
inspection / LLM scan.

No need to repost, just explain, I'll add it when applying.

> Fix by tracking the base MAC address assign type in the sparx5 struct
> and applying it to each port's netdev.

Generally no need to repeat what an average reader can easily grok 
from the diff.

