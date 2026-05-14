Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80739CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 10:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a49HefPrLN3684t7i07u4fpCn79yODS1Mq70Vx6MPJg=; b=RSKdkVICnpn6CdIlLMs+KPqXBL
	KPJtJzluBFP5Z7x3bjP5f+BMiM5UJZE6NEdLzbTEHRzfmXb2EXoLmt1dZl/O1lTUnLMKTPGBjQe+M
	KROuBq3CV1D3LDusam1fJRpQwMtqEUUU1GkRLYnT9LXZEekwOsbt3s/4uwmCDMymN7esywPMu/VBz
	2hn7dDChW8kckDcRclqEemh1zffwyl6GaS9IjPevqGAD4y8bOOsDUtu2JJtQG/DfJBotUX/yEAS5F
	N5cEjGtUxmX8IimJy29XW25NgHPW9SGvdvZrrNfjuHwmM2uXzGv32rTmWwspeoZS3V0UbsVx2BNPx
	E1RIevwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT9l-00000005B7B-2Mu3;
	Thu, 14 May 2026 10:19:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT9k-00000005B6i-252d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 10:19:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C29D360121;
	Thu, 14 May 2026 10:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06778C2BCB3;
	Thu, 14 May 2026 10:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778753943;
	bh=e7xpXAWRH3bKtSRCX5MeXqyvSqXqOnDZwGaBzAXQNeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fwk0SggmadWbfD2nzQQTWx7NR2HYpAvnoney57HrAoss7sdm+WwFFvMF/pSctOZcK
	 R2KyopyPnQ336M+VhYNt863kDzXcDuQ4+CS2i8lBt4DjvFyW88wg8QqD1o2asKSOru
	 dyJmTJp43CfSTv7T4PFeWIxqt68YX/ubYkoTmKlM=
Date: Thu, 14 May 2026 12:19:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v5 0/3] Switch Arm CCA to use an auxiliary device instead
 of a platform device
Message-ID: <2026051453-batting-delighted-0a57@gregkh>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514094030.42495-1-aneesh.kumar@kernel.org>
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

On Thu, May 14, 2026 at 03:10:27PM +0530, Aneesh Kumar K.V (Arm) wrote:
> As discussed here:
> https://lore.kernel.org/all/20250728135216.48084-12-aneesh.kumar@kernel.org
> 
> The general feedback was that a platform device should not be used when
> there is no underlying platform resource to represent. The existing CCA
> support uses a platform device solely to anchor the TSM interface in the
> device hierarchy, which is not an appropriate use of a platform device.
> Use an auxiliary device instead to track CCA support.

Why an aux device?  If this has no platform resources, please use the
faux bus support instead, that is what it is there for.  aux devices are
used when you are sharing a real resource among different "child"
drivers, and need some way to coordinate that sharing.  If you have no
resources, there's nothing to share, so no need for the complexity that
aux gives you, just use faux instead.

thanks,

greg k-h

