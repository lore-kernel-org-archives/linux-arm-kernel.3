Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3887C83F2D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4D0AOvb4LA8Jm1ZbkzcjRBOcJFgZBpCBm1ih3dazD6Q=; b=Pk90YQc3jS2DMyHzdFL99Xo4v2
	HF4622l6bJmXfeusQu3iy9eXyo8YBbaFNzA0zTOKZfOk3iP1xrlGgfwQ+/R4bpVCdIRmvUic/x5qF
	jGt77dcbp9gZQqF0vFkBSfdriD2tznmU4QVvaXLfnGSIa8i0FiW8U5E+fRICmf7KkjFBdhv6aQFB3
	aFVVKSwR27h4LYMbsoMydO/P8iBP4BnSIS8Sky/hzatm7he95cIRVPRuDDyd+cyYFS/01EfB/4Xlq
	YiUsWfId0R8Lt9uvFCRldf0Xv3UeqUUAHsdwcgTWw3T7IfDxQnH7itgRgk2Q5bQaau7EBxZqIWxgA
	jGU/nzew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBw-000000062DE-04C4;
	Tue, 15 Jul 2025 19:19:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubjhR-00000005qc9-2yJX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 17:44:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6630E4336B;
	Tue, 15 Jul 2025 17:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEF3C4CEE3;
	Tue, 15 Jul 2025 17:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752601457;
	bh=0GJDFMtsSqrzL3Epz+awKDltn2gCgf+SZWRb+hz1UgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tzwx4wfx/Buc5zcel76rU8dNYHj/zBJYLoXH3ZrTznW5i/Hn/SfwAf3w7oAZky8xm
	 DG0eNzTGfXdnE4F+cwV1beHn5m4zVdVpK6ViDlQIc+GY+k0nN5T0rjOwkqTudF4T/P
	 5GDW2h4v15ocDIolG3L4WOgSiJ2iRv9PnaZDFG04=
Date: Tue, 15 Jul 2025 19:44:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH V2 0/3] staging: vchiq_arm: Fix regression & resource
 leaks
Message-ID: <2025071555-stubbed-hardiness-8306@gregkh>
References: <20250715161108.3411-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250715161108.3411-1-wahrenst@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_104417_779062_411A0C38 
X-CRM114-Status: GOOD (  11.82  )
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

On Tue, Jul 15, 2025 at 06:11:05PM +0200, Stefan Wahren wrote:
> This small series fixes a regression introduced by recent changes and
> possible resource leaks in the VCHIQ driver.
> 
> Changes in V2:
> - Add Maíra's Reviewed-bys
> - Fix Reported address in patch #2
> 
> Stefan Wahren (3):
>   Revert "staging: vchiq_arm: Improve initial VCHIQ connect"
>   Revert "staging: vchiq_arm: Create keep-alive thread during probe"
>   staging: vchiq_arm: Make vchiq_shutdown never fail
> 
>  .../interface/vchiq_arm/vchiq_arm.c           | 98 +++++++++++--------
>  .../interface/vchiq_arm/vchiq_core.c          |  1 -
>  .../interface/vchiq_arm/vchiq_core.h          |  2 -
>  3 files changed, 56 insertions(+), 45 deletions(-)

I already applied v1, is there any code changes that are different here?

thanks,

greg k-h

