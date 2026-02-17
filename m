Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D74E909A3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tA/qBIFiXQqlfaffCEmCsMlqCoDVe7C/PwYtpr7l/xI=; b=xO9QqV5MtN20xUv72OujsUeox4
	8xHCBxWcBDcJzhgzsWm/5hy277wc/ZNaAg2L9AQPEMWK/5HFqiUt+nC1DAAFcBc7eTBUe8ejoDaVV
	LEHBaS8BCtp1menHqEL9EZr4ehT803l2JFwTIgbiQmygz2l5akcHT+3kJVua15t7VI4bm2FuooDWs
	rAOJOUbwiksH3WSuBCkF5tivD4KNlb1pI/7+JgJ6Qkm5ZVabeXRuEEDdJSCkRjwlbLw6gKzp+uZ3d
	Qz/a+2EMVCT+QfBbRZe8G1Kao35mLvlPp8LTZp0A6nBFTBTGtyqlzrxrY243jE5RtUbL5FFoSpM66
	h9FtHHtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLTH-00000008MJ2-0at5;
	Tue, 17 Feb 2026 13:50:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLTE-00000008MIh-3dd2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E17DB6133D;
	Tue, 17 Feb 2026 13:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3048C19423;
	Tue, 17 Feb 2026 13:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771336231;
	bh=2q/n7obVICsBUhVx3cRmA/pC+bCZgsAvDLO0dsBRNB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UfDmGbzF5JS7yU8GYCcSoiEO/h+3Fc4KlUTVz9lGl5Dsp+EgKbGYei4ACeBTCMSPX
	 xcYYQqTljI0tUwBSA4E6dpDpcBcpNm+flD/QGVXU2Cn6diawx94X+qYKRfMAPhd19e
	 Pzr/7oe+4OlsoRlMFx8yhC6//98eK+e7ORwiIV8g=
Date: Tue, 17 Feb 2026 14:50:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: stable@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jack Aboutboul <jaboutboul@microsoft.com>,
	Sharath George John <sgeorgejohn@microsoft.com>,
	Noah Meyerhans <nmeyerhans@microsoft.com>,
	Jim Perrin <Jim.Perrin@microsoft.com>
Subject: Re: [PATCH 6.1 0/3]  arm64: Speed up boot with faster linear map
 creation
Message-ID: <2026021717-stellar-skylight-7824@gregkh>
References: <20260217133527.2881603-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217133527.2881603-1-ryan.roberts@arm.com>
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

On Tue, Feb 17, 2026 at 01:35:21PM +0000, Ryan Roberts wrote:
> Hi All,
> 
> This series is a backport that applies to stable kernel 6.1 (base v6.1.163), for
> some speed ups to enable significantly faster booting on systems with a lot of
> memory. The patches were originally posted at:
> 
>   https://lore.kernel.org/linux-arm-kernel/20240412131908.433043-1-ryan.roberts@arm.com/
> 
> ... and were originally merged upstream in v6.10-rc1.
> 
> I'm requesting this be merged to stable on behalf of a partner who wants to get
> the benefit of this series in Debian 12.

Same here, why not just use 6.12.y?

thanks,

greg k-h

