Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D77109022A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 13:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfGTlbSotR1YenoLXwlR/qjzLr1Jf2iZ4bAtIfxPloA=; b=OM8E3B7SwBIQEsXXmvqaxTNMY2
	xTF2zSESkqVu+PexXAOpsauJ+0OUCg8SGoUBgDV2QTnVyVndLvF8kI54IyIGT+/THaAw11TO6pY8v
	a08O/tNhRwHW6xFD6bOBxAXAsb5SDhd4wV5zatPOrdrom6UuR87xp5mcp1PnvhYr3K/ga+TPpu32L
	/LR2FTu964nLcTe7G8fjOzxOFpkNzF9FtxEqUU+q3gLg4u6NnIgSKmtT0K/Tmz7sPr2YviYhlSSK8
	qx6xdqGMtfPzIDJellqIBCsJgDwDsk6JZeiXcdKJN0lr4WS5uAWyCZSlNZ4QdGzWevgwDCI2/IomL
	/i+qesbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Dpw-0000000Aihg-10rC;
	Thu, 19 Mar 2026 13:54:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Dpt-0000000AihH-3x5V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 13:54:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DF3F600AD;
	Thu, 19 Mar 2026 13:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B35C2BCB0;
	Thu, 19 Mar 2026 13:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773928492;
	bh=6lTDuDTet2Kh2hHL2W19L/RTuSwbVdiJ3pKzj7JqvFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IIsUezRhwWh1BsXMNOJ67yiJdcGBaUlTKxxOylNOTzzVPX5If51Fyl1Q45iNKlID+
	 IRhJzrCjbQdEi7iEc6pUVS7I3hMBr6lVPqk92iS65c4xksOiAHuQ2IX8pXJIsAsVEQ
	 SchRwP5nXQB6bLzrS3p0vJvDDcY0y+u92y0FhVOc=
Date: Thu, 19 Mar 2026 14:54:48 +0100
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
Message-ID: <2026031906-mulled-bully-10f6@gregkh>
References: <20260217133527.2881603-1-ryan.roberts@arm.com>
 <2026021717-stellar-skylight-7824@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026021717-stellar-skylight-7824@gregkh>
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

On Tue, Feb 17, 2026 at 02:50:28PM +0100, Greg KH wrote:
> On Tue, Feb 17, 2026 at 01:35:21PM +0000, Ryan Roberts wrote:
> > Hi All,
> > 
> > This series is a backport that applies to stable kernel 6.1 (base v6.1.163), for
> > some speed ups to enable significantly faster booting on systems with a lot of
> > memory. The patches were originally posted at:
> > 
> >   https://lore.kernel.org/linux-arm-kernel/20240412131908.433043-1-ryan.roberts@arm.com/
> > 
> > ... and were originally merged upstream in v6.10-rc1.
> > 
> > I'm requesting this be merged to stable on behalf of a partner who wants to get
> > the benefit of this series in Debian 12.
> 
> Same here, why not just use 6.12.y?

Ok, I'll take the 6.6.y patches, but for 6.1.y, people should _REALLY_
move off of it if they are using these types of systems as there are
loads of other things/fixes that they will get if they move.

thanks,

greg k-h

