Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5BFCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlHyUPkAKhtnaRHqk4oTW7GqOpQjsIndexSVdjrjBbo=; b=ia991NPozvhZIPh3JBGbrqvA9H
	U2tT6+NiHLsB/qdxloGDg35WvFwVfSwrdD6nC4oCpG5vosq2zNfUEmwQp6p7W36nBrrRg5WxgVYpZ
	tN+mEAItKWTomYqxq8gKtecoY8N6Q9lhOX0B5vl7AEtrAz0WlHAjIU/LxYOVVqAgeR+HVmh2efkpg
	y4rYfAgKw2ySrTWxwb1O/TKlpMLg7TSpYG/EJzUC2r+STcXOVGHMiXM4RaKlAGfKYMf5Czg+cgE8U
	RYyZXorkf84NRWy5qx9RRZLeFQzSNxB2mBMraUns1s+4CW7EA1ZwI3QtRN11wrumXu7O2K218JE6r
	5n4UjWSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFbD-00000008yx0-2XBc;
	Thu, 01 Oct 2026 12:09:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFa8-00000008wYv-3lV3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:08:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B70960A57;
	Thu,  1 Oct 2026 12:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A721F00899;
	Thu,  1 Oct 2026 12:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790856491;
	bh=mlHyUPkAKhtnaRHqk4oTW7GqOpQjsIndexSVdjrjBbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J7EGBoECmsrailKaJlWvcrwz9QroxtVIL21W8kCcnGLQn0h6dfObOjf2Fq2+Y0mfo
	 k45F9+WtYYK1dDO6+vhAYPsLT3Xe70T/160MNZyggPu9JVDjb6AD3s0xT7XOYesp0t
	 /dzsAAuZot/jZe2ql9Qnul0DlGwjVTbVgZ3mBAI8=
Date: Thu, 1 Oct 2026 13:57:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiawen Liu <1298662399@qq.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: atmel-ssc: handle clock enable failure
Message-ID: <2026100111-tinwork-unglue-3b65@gregkh>
References: <tencent_95E7173942FAE82639FD03E6FFCE5516D60A@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_95E7173942FAE82639FD03E6FFCE5516D60A@qq.com>
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

On Tue, Aug 18, 2026 at 05:22:40PM +0400, Jiawen Liu wrote:
> Return error from failed clock enable.
> 
> ssc_probe ignores clk_prepare_enable return before register writes and
> unconditional disable_unprepare. Unchecked prepare/enable may be
> unprepared on failure.
> 
> Check temporary pclk enable before SSC register access in ssc_probe.
> 
> Signed-off-by: jiawen <1298662399@qq.com>

Does not match your From: line :(

