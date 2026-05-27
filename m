Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46817CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ksdgjc40jlzTwXE0aql93RpRNJfc1+mdFdSmhlsHOA=; b=DEWty3qOLJAISXC9ag37Zl70FI
	3UPzMUWR9RAt6+5g+TwCuLHwq681H+jrh2NlYLQcLFU7O4VE/VHmH0UdQeW6Yz7RlvYUzXFpGc7gq
	FcZtv3XSPnhQ+G7InXqcYvTKID22Olonc+ZwJjD7iPOG2gFiNC1yBPHWG+f9P1gX91BKbjGNX1E0h
	6U/xWGkAUvwSY01kYDHd7annWDAPlvs5mG2A7vxNPcqKyz3Q/bFbFQN8YWuVK/Qn7D0FjhF9tC5A5
	6SvFebUxZp2mhtz8EBkJbB29CfHYCwN9mLfRKMrUiUCIZz9VoQK7nVfL/+KTM2YbFECCBwxX2C4P7
	+ZHX+Mgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAGN-00000003bPA-3MIc;
	Wed, 27 May 2026 09:09:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAGJ-00000003bOo-3MFG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 09:09:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EDB8C44539;
	Wed, 27 May 2026 09:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AB61F000E9;
	Wed, 27 May 2026 09:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779872954;
	bh=7ksdgjc40jlzTwXE0aql93RpRNJfc1+mdFdSmhlsHOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=izQF6lcVc37gS7ka19Joj79opGsd6eRPOfrXC41G8d1jrB5I0QZI/W7HHz+vuz9Dm
	 hMsanxgxbP5JVlp+B7sqV08MPhPXNeHZWWqGFjJ71GMvc2wqthWhz7aOKWXHk+7Vdi
	 yrh+2H9v4pNQu7NfNEI5ECSFWxpxVWp9P7hiIsll+MjzB3svk+tOdTxf1kWKc/HNqZ
	 6VaQSQOzWduCt9T01SJCPJpqFaBWlGUH+cHeoYPU8+kh85Pcq/UFPEP0X2O3q77R+k
	 dUwL9oG83iV7KOnPRNIyqosG4nIOTX7SNt5V3n2m9P7Cwj9PTV6YCY+jpyex7sLuE0
	 OUG3pxnxgsE5A==
Date: Wed, 27 May 2026 10:09:11 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH] firmware: arm_ffa: Treat missing FF-A feature on a
 platform as a probe miss
Message-ID: <20260527-sparkling-sloppy-muskrat-c1e4ac@sudeepholla>
References: <20260526103649.5684-1-sudeep.holla@kernel.org>
 <20260526193543.GB2851089@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526193543.GB2851089@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_020915_858019_11D45459 
X-CRM114-Status: GOOD (  15.23  )
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

On Tue, May 26, 2026 at 12:35:43PM -0700, Nathan Chancellor wrote:
> On Tue, May 26, 2026 at 11:36:49AM +0100, Sudeep Holla wrote:
> > When FF-A initialisation is driven from a platform device probe, systems
> > that do not implement FF-A can return -EOPNOTSUPP from the early transport
> > or version discovery paths. Driver core treats that as a matched probe
> > failure and prints:
> > 
> >   |  arm-ffa arm-ffa: probe with driver arm-ffa failed with error -95
> > 
> > That is noisy for a firmware interface that can be absent on otherwise
> > valid systems. Driver core already treats -ENODEV and -ENXIO as quiet
> > rejected matches, so translate only the early unsupported discovery cases
> > to -ENODEV. Keep later setup failures unchanged so real FF-A
> > initialisation problems are still reported as probe failures.
> > 
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Closes: https://lore.kernel.org/all/20260523001148.GA1319283@ax162
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> 
> Appears to work for me.
> 
> Tested-by: Nathan Chancellor <nathan@kernel.org>
>

Thanks for reporting and testing. Much appreciated!

-- 
Regards,
Sudeep

