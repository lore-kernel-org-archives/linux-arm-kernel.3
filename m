Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62920CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 07:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mHO05Orf5A4+TKslyNxcQEarOcjJBSjTZ1kLbXPXXk=; b=T2jil7axpZi8UmsIX57zK0tdCK
	JFSGxZJFRouhiyeMI3KxRCp7JJSL/mPmyDtIqXkwdoX6tPBoWlo1yifyauz81KTCC/MCOVEpzOwhV
	YWUbkCl3xSIR+9FmJZONOQwKvOFWsb+FmyyXt9NFtfCpm1hWaYr6H/31utcdBfLEP1dxC7Sq11eDT
	UfDh0tXqCBclvyj3/JBJXVMXB/Fv8nPzPQPrcha99HGYtHfvcrIS86BFuc/n0ZRX1kV5pabSOzMbn
	WGYpxXFEYKxVNYOzQFTKj4e1wt3qbEIDTu0qEdh4KESHG3YOEHzSbrnxo35j9UFC1eQANNAEcsD0H
	KKnwYbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eZr-00000006vyV-2FVS;
	Fri, 17 Oct 2025 07:08:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eZq-00000006vxv-3FFl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 07:08:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C19BD64231;
	Fri, 17 Oct 2025 07:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15576C4CEE7;
	Fri, 17 Oct 2025 07:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760684917;
	bh=y3A8UFbhIHfnjmL8SSSVLEJdomH+VBXzyz4jFtrYdQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PlN5iAAVMVKIhf/P///IxkO8IRuSQAvaDa11Iv3qY8HMYbAimhMrR1NLqHqAY5KxX
	 dhIybQEVM9IJ47Fbr+Vq4Gfw1eQii32qEuS3LSO5bgCscGgG6HZYuyBF5xHj5lUTd6
	 vTsXcYn7hEg+3wfq1ZmHYuafEpnzyGM7yGDbU4Gw=
Date: Fri, 17 Oct 2025 09:08:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: stable@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5.4-6.17 0/2] arm64: errata: Apply workarounds for
 Neoverse-V3AE
Message-ID: <2025101708-antsy-steadier-5ab6@gregkh>
References: <20251016111208.3983300-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016111208.3983300-1-ryan.roberts@arm.com>
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

On Thu, Oct 16, 2025 at 12:12:04PM +0100, Ryan Roberts wrote:
> Hi All,
> 
> This series is a backport intended for all supported stable kernels (5.4-6.17)
> of the recent errata workarounds for Neoverse-V3AE, which were originally posted
> at:
> 
>   https://lore.kernel.org/all/20250919145832.4035534-1-ryan.roberts@arm.com/
> 
> ... and were originally merged upstream in v6.18-rc1.
> 
> I've tested that these patches apply to 5.4-6.12 without issue, but there is a
> trivial conflict to resolve in silicon-errata.rst for it to apply to 6.16 and
> 6.17. Are you happy to deal with that or should I send a separate series?

Please resend a separate series for that, and then resend this series as
well, marked for the specific kernel releases that they are for.

thanks,

greg k-h

