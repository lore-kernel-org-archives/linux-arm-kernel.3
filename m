Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3890C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 04:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMSEo47JNrqpAkPqEL+EygxS63QZdMKPNqyBWVmnlBo=; b=VmzmKJzatmx2GURQVAI5JZaqQV
	3hczXt1eR6vR8MnNheyo756vuHURYK0YCmamKpzgfBuuCTH9KVnagdkQY/yxRDQ8jdUTpvFT2fuvq
	fxWtoiM+IW4Z/YbDrrazX+QPrJag33K3r6p4MaZyhg5jW3k4cmVOcPM6Nfkho0XG+Hep8hNuE8umI
	vQ7uYZJgsYezPA/EFLRafdNlWo2lS7+lTNMiebsPITZUYQmUMYx+7uWlf95mT37DA3cDuCjQGqRpT
	40+sgnOyEFCxTaS79fvsnr2jgkTXhBM85swlRF0aU/7c0JGqC57syuqdSXoD8RJgiKaJCkA1FOXyw
	ez4fbSdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we3XG-0000000DfrC-2qLu;
	Mon, 29 Jun 2026 04:23:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we3XF-0000000Dfr3-1dHh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 04:23:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C4E3160054;
	Mon, 29 Jun 2026 04:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CAB11F000E9;
	Mon, 29 Jun 2026 04:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782707031;
	bh=GMSEo47JNrqpAkPqEL+EygxS63QZdMKPNqyBWVmnlBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cdgD8AmlegczizJj7HovfqCr7SrqOL+w/drR6Tl5guPoMQYY3u5GR4gLyeG0nJ4tv
	 EVyCqKa6WK0q2CNJOP3b3TZ7+0iRKNbI/XT/8Jp+Z0RhEnEHzti04M/pkR2DFYGQ6+
	 ByMAjCB59wvpDwOTUJanulyVggfWVeh2S6aEOR0c=
Date: Mon, 29 Jun 2026 06:22:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
Cc: andersson@kernel.org, alexander.shishkin@linux.intel.com,
	mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
	suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v14 0/7] Provide support for Trigger Generation Unit
Message-ID: <2026062959-distaste-launder-e253@gregkh>
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
 <48c6abce-c492-46a6-84ef-3074983e817c@oss.qualcomm.com>
 <a36a1ed3-5194-465c-b029-0404e0f2bcee@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a36a1ed3-5194-465c-b029-0404e0f2bcee@oss.qualcomm.com>
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

On Mon, Jun 29, 2026 at 11:03:33AM +0800, Songwei.Chai wrote:
> Hi Greg & Alexander,
> 
> Apologies for interrupting again.
> 
> As the TGU hardware plays an important role in Qualcomm tracing design, I
> would greatly appreciate it if you could kindly take some time to review
> this at your earliest convenience.

The merge window _just_ closed, please give us a chance to catch up.

Also, why us?  Surely you have other reviewers for this code, right?

thanks,

greg k-h

