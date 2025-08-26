Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31366CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 11:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAlmlBhnB1/JQxLRvazJyEcVQTq16WIWLWshjV4Bz8w=; b=Q1wrGRqk7Qbd1aBw75kOAHH9vq
	TZuuslNorHkPjtwUpKO4M2IDCFSsDPElt4qz4i4ViSBSViY6rSgzvxU2zJjYuJTkOqg3usbx8PS3R
	ZsVbYIbs8JSLlBMf/nSRO/lGbH+GWntkoB/SogWPT4ALrUOSaatTf0luwxRwKPB+MaCm6pn2ffJgO
	8ax4hIHj0M6+2oStztLsVqP0AkPMUPjTSZSeJ23JADLCEZpc/8VO0YsCefI0GhikcS7M11xVPb8EP
	lyB1XeuqTR/SpDA0FY9Xru4Acuu2eJQ+X48NGkXBMSnAEvd+rnbvKkVUkhIEhVcLhQdgaWYprHXGs
	DY5nR6rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqs3g-0000000Bp9C-2ajM;
	Tue, 26 Aug 2025 11:41:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqr6g-0000000BePw-3ONs;
	Tue, 26 Aug 2025 10:40:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C830360285;
	Tue, 26 Aug 2025 10:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7DCC4CEF1;
	Tue, 26 Aug 2025 10:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756204849;
	bh=JfnHB8itPxPPdAH379o/TV7lzlwklY/FNdFof1xujK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vCmZeD7cXfTHLTaz4Uu7/uuKRPQxbvzu0PZsCaez0GE/iBDdbZQc9rxmRnN5n3pQH
	 QQPY7qDqfuwO2l6aw1Yg4/CEMg/mG+FAI8rUlo/h6wN+hscCo+5IEY55uXkeuZ/8Pj
	 ISOB08j+Xq9/f15n3FB12sycLOygkYEpA7eT/FvM=
Date: Tue, 26 Aug 2025 12:40:45 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Xion Wang =?utf-8?B?KOeOi+mRqyk=?= <Xion.Wang@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Huadian Liu =?utf-8?B?KOWImOWNjuWFuCk=?= <huadian.liu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"arnd@arndb.de" <arnd@arndb.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/1] misc: Prevent double registration and deregistration
 of miscdevice
Message-ID: <2025082631-hypnotist-snazzy-147a@gregkh>
References: <20250825084556.10358-1-xion.wang@mediatek.com>
 <20250825084556.10358-2-xion.wang@mediatek.com>
 <2025082533-ranked-simply-4b63@gregkh>
 <d3d0fc0e19f939c093e6df1ff08ce23be71636a3.camel@mediatek.com>
 <2025082638-parlor-retreat-56ff@gregkh>
 <1ffa28bf6e3dcde83a6a6a5dde163596c4db639d.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ffa28bf6e3dcde83a6a6a5dde163596c4db639d.camel@mediatek.com>
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

On Tue, Aug 26, 2025 at 07:58:47AM +0000, Xion Wang (王鑫) wrote:
> > Again, this shouldn't be something that any driver should hit as this
> > usage is not in the kernel tree that I can see.  Attempting to
> > re-register a device multiple times is normally never a good idea.
> 
> Thank you for your comments.
> 
> I am not the owner of the WiFi driver and do not have full details of
> its internal logic. However, during internal integration and stress
> testing, we observed an issue where repeated registration and
> deregistration of a misc device by the WiFi module led to corruption of
> the misc_list. While I cannot provide the exact reasoning behind the
> WiFi driver's design, I wanted to report the problem and share our
> findings with the community in case similar patterns exist elsewhere,
> including in vendor or out-of-tree drivers.

We do not "harden" our internal apis for external drivers, we fix
drivers to not do foolish things :)

Please fix your out-of-tree code, it should not be even touching the
miscdev api, as that is not something a wifi driver should be
interacting with.  Please use the correct one instead, and then you will
not have this type of issue.

thanks,

greg k-h

