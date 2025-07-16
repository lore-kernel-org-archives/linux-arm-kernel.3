Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD983C83F2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 07:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MMtSjLmAV/YTiKI6wpK7PHd2VJs1znSATT/ZPI2Iks=; b=xP+31WOupV6TCDi8eHayLmmIjW
	dWp+ULoYsciyy3TinUQUKRAXP66FwyrOBo8qlyiraaDkHy9j7yDvv4QgNzJgZyJXjfdccSZFCCr7/
	0mqJUppJ/zkwYdeCFSs5KmmnZyLgAmMDc0Oc+wheLqlCzAqlLIUIEnpX8yuw821koOE6Gat8y6TJ1
	kHoMtbJ6rEAaY4wBXDlfR0h7n/1JIWN6L9Ybw4n9/fepUy2i78JdceOxZ75/IfVRHw5deIBSWlDCX
	5NZAtw2adMJC7HXGXh/OT4cjKovIYD78i2NP3eGk13N4CL9xdM6BT+dS7K2mwYsnPjIukvbb8xbpV
	qrqMwL8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwgy-000000071pj-2nUS;
	Wed, 16 Jul 2025 07:36:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwdY-000000071EB-28w0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 07:33:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EB406144D;
	Wed, 16 Jul 2025 07:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA951C4CEF0;
	Wed, 16 Jul 2025 07:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752651187;
	bh=wSS+MxIy+JyaYWx3+wf/p7Zd06S5TWqVfO1PJxPUgZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fddcbr6DEZO1a73wntEdYLzsy5sHn3xtD9CsDxtPCJGWF2xxowZUT6gckYLxfSVuS
	 oKLkNkqhahFO9O8+bPh2QT/WaslT1QmsRrVHQRVh0j4K2/Uk3xxv0fhwXzko38scVj
	 4ql2gdc4mlHVY0HsiNDvFJL9qGnB+kg1srEcBEPc=
Date: Wed, 16 Jul 2025 09:33:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH V2 0/3] staging: vchiq_arm: Fix regression & resource
 leaks
Message-ID: <2025071644-sulphate-outdoors-02ae@gregkh>
References: <20250715161108.3411-1-wahrenst@gmx.net>
 <2025071555-stubbed-hardiness-8306@gregkh>
 <5e9e606e-d227-4d87-a5b7-cb5a105dcd98@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e9e606e-d227-4d87-a5b7-cb5a105dcd98@gmx.net>
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

On Tue, Jul 15, 2025 at 09:59:45PM +0200, Stefan Wahren wrote:
> Am 15.07.25 um 19:44 schrieb Greg Kroah-Hartman:
> > On Tue, Jul 15, 2025 at 06:11:05PM +0200, Stefan Wahren wrote:
> > > This small series fixes a regression introduced by recent changes and
> > > possible resource leaks in the VCHIQ driver.
> > > 
> > > Changes in V2:
> > > - Add Maíra's Reviewed-bys
> > > - Fix Reported address in patch #2
> > > 
> > > Stefan Wahren (3):
> > >    Revert "staging: vchiq_arm: Improve initial VCHIQ connect"
> > >    Revert "staging: vchiq_arm: Create keep-alive thread during probe"
> > >    staging: vchiq_arm: Make vchiq_shutdown never fail
> > > 
> > >   .../interface/vchiq_arm/vchiq_arm.c           | 98 +++++++++++--------
> > >   .../interface/vchiq_arm/vchiq_core.c          |  1 -
> > >   .../interface/vchiq_arm/vchiq_core.h          |  2 -
> > >   3 files changed, 56 insertions(+), 45 deletions(-)
> > I already applied v1, is there any code changes that are different here?
> Strange, I didn't received a mail that the patches has been applied. No,
> there wasn't any code changes.

Ah, I hadn't pushed it publiclly yet, that's why!  I'll go drop my
internal tree and queue up this one now instead, thanks.

greg k-h

