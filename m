Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09297F46C4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 15:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNgPSQR5Udavqq/7drk1FjSWUftPKsR8QqtnPfIXNww=; b=nnFSbFDcP6CT0QQEcg1p9ah09G
	OAZvhMMeTnfFJjUvwzN3OIH9Y120g+cGrWGfWoMJd4DYAhH/L5xdDvLUtPZCHDGcO49i8zVGRmpO4
	rJVUCa+HFGU9/1+GOWgfmv+5VYV0EFnpylbbVYl80NNCTgHmeV6uyZj8ad+WySRol/3v6gM6SUcQF
	LnKYsTKYbwmXqm2+g1WaEZBtJ+QkSozRppsTtnUeL1hDCjFYx5ry+fJwi6xhgiJiQ5bCXR3rOD/K7
	djfkFPyfGbne3njWTDjcYSvCYpVW8dn8Pjm9/Qofb8pm0zmflYl/0ADrbodFL/9HBqZFMK0IA/JvS
	hun3o9Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9m2z-00000005HVt-0bB5;
	Mon, 06 Apr 2026 15:39:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9m2y-00000005HVi-1Tce
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 15:39:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AA3460123;
	Mon,  6 Apr 2026 15:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5B0C4CEF7;
	Mon,  6 Apr 2026 15:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775489967;
	bh=dBBOOPYccQdP+A1MwC4aCCDHzpoBm0wvT7ybVzIt/eA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OA5kMl0Gi+T8g5RhjXEe9hvsyaDredPQ0qoKai/Yc2nG0IF2V9s10lPjTrGcgfHqD
	 /MOwP5I4JtbJx9Cft0D0SL4Gb3BxDzumow+6rjVi0BMtkEPjYmujEfQA2o9pgMGTIh
	 JKDJlwP27ryxpBgtjRqlaqNL5n/ALriHd/KvIoO9xLgUTUX0j6PSNbTaUNNw1OtCoo
	 RgjpXfMbWHNCqxfvUTwm8D3Nzy+qe4MDYEzh2uzUew0bv18KBjyT/eacUGgZ3vTjW3
	 fPodZeSM7qm2Wmg5LySWQZ2mRa3pBaCsvrmrOEghQjMH6cnhP/VYK++30tt5UjY2CP
	 N3ybr2jKzraEQ==
Date: Mon, 6 Apr 2026 08:39:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Julian Braha <julianbraha@gmail.com>, davem@davemloft.net,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH v2] stmmac: cleanup dead dependencies on STMMAC_PLATFORM
 and STMMAC_ETH in Kconfig
Message-ID: <20260406083924.5711ecd9@kernel.org>
In-Reply-To: <CAMuHMdUfzVSQpadJYpEqPJ_UOBAgswnGzD_bp_U3U6jt2dy0dg@mail.gmail.com>
References: <20260402145858.240231-1-julianbraha@gmail.com>
	<CAMuHMdUfzVSQpadJYpEqPJ_UOBAgswnGzD_bp_U3U6jt2dy0dg@mail.gmail.com>
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

On Mon, 6 Apr 2026 10:23:46 +0200 Geert Uytterhoeven wrote:
> >  config STMMAC_PLATFORM
> >         tristate "STMMAC Platform bus support"
> > -       depends on STMMAC_ETH
> >         select MFD_SYSCON
> >         default y  
> 
> This now lets us have STMMAC_PLATFORM=y and STMMAC_ETH=m.
> Does that actually link?

Hm. Sashiko didn't complain when patch was posted.
Typical LLM indeterminism? 

