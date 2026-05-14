Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D92CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 10:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6YNQDiAk/xlVO0n8LOtKzUmpF01ZP10NXjIieKLms0=; b=kJvZ+UTS27QjCx+zusAC30nHOS
	st6PJ2FlNexM6B94v/lTYKZpW/v37Q9TeVbaFRBtK1Y3q5H+6BpB9jppLl9l4D0YCWje7YCBXrAXY
	XYC6ASBR2XXBNngT4WCs63mD3+tt3bhHnKTWyEreIPEM5iGB4BNze/zp0UW3dBVw8TZamdb6xJywK
	qXbFvO2lqdawFa7pzqcsCL9w6BRWpkCXNQmZm9qj9VjyApTG5Pt1dRlKUn6fF/Lj3eTHTdSvpVCyl
	3NPyxRIBdIWO5kNnWFO1ESUzUEiQmiy3rQcW1RcioLJeL4OlmJQpC7Xe84aRhIRI9TiLEK0dH9Mzr
	IdC4LFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTfc-00000005FA5-2uyQ;
	Thu, 14 May 2026 10:52:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTfa-00000005F9N-0WmS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 10:51:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D655C438B8;
	Thu, 14 May 2026 10:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114D4C2BCB3;
	Thu, 14 May 2026 10:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778755916;
	bh=NdIUfducvTRfNv9EYak+8ec9D63cIOd0Q93R/5kYsIM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TZGxBDkPMRNBmNhF9URVkpubYH9ZVQym8A3/b6mCW61gCl35FjejmAg5Nkv6Wbesg
	 9cmY4U7pCPnrbZL00Z12bH+ewTJb9/cFganuk7XvB1fUWu8rHs8QiOhEPwJ/S3sD1J
	 EtxFChOpUSfwkLSY+Wr+A9eIYPR4APzdb80ivSay/AYG4yQQQIeQWFvC/8rm3p04J6
	 u5nVcJhSq0yaTi/3eVimpctCx3HHKDKC8A7us5rTjB76ZWOwuwwMfhFsWkaiHM2cFI
	 /nL/XRo2kj6Ujd6NTPE+y4smsYdL5sRaZqCA9yG2i0baQjIe3lXqw52KSR9DUQr5VI
	 Sg2yPIUvbctJg==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v5 0/3] Switch Arm CCA to use an auxiliary device
 instead of a platform device
In-Reply-To: <2026051453-batting-delighted-0a57@gregkh>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <2026051453-batting-delighted-0a57@gregkh>
Date: Thu, 14 May 2026 16:21:48 +0530
Message-ID: <yq5ase7u5kmz.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_035158_187833_A61BD4DE 
X-CRM114-Status: GOOD (  14.42  )
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

Greg KH <gregkh@linuxfoundation.org> writes:

> On Thu, May 14, 2026 at 03:10:27PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> As discussed here:
>> https://lore.kernel.org/all/20250728135216.48084-12-aneesh.kumar@kernel.org
>> 
>> The general feedback was that a platform device should not be used when
>> there is no underlying platform resource to represent. The existing CCA
>> support uses a platform device solely to anchor the TSM interface in the
>> device hierarchy, which is not an appropriate use of a platform device.
>> Use an auxiliary device instead to track CCA support.
>
> Why an aux device?  If this has no platform resources, please use the
> faux bus support instead, that is what it is there for.  aux devices are
> used when you are sharing a real resource among different "child"
> drivers, and need some way to coordinate that sharing.  If you have no
> resources, there's nothing to share, so no need for the complexity that
> aux gives you, just use faux instead.
>

We did discuss between faux an auxiliary devices early here
https://lore.kernel.org/all/20251010135922.GC3833649@ziepe.ca

To summarize auxiliary device was choosen so that we can do module
autoloading.

-aneesh

