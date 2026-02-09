Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68071E81BDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 16:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5YRDCf581DxSZELSDqFmiETNcYM18q4XtmJvweo84o=; b=A2epAg2p3SKJ29xw/iE/aWVdKi
	JYG6PorSf8/xQ41vVXPllmrbVkXoJ1jBX91J3J9S9HRRj9vw4f/8d52uU0z6+FkEbhmtoRCS0DdY4
	VSBCTqhYPHmIF6OMo3z2E1Z0ZCotD9saa3ezRH93IoBcvkQdluN3TG3XBoo+Y+KHL+Jjkdpd96zWc
	B15+jU585n82aMFbjxexHkRaIsCcBy/s3Jj9cYizCdnNzRwWMQm3YL/Cm22S1nQYlecUVaNQPrmHw
	yrRl3YqG2xcCLiHi9zIgVtH8JRg/fabofZy+B9XbLUMs9zj7JyZYMTCKmbJmPYyM+UhD8JJJjkh8U
	UYgm4H8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTm2-0000000Fewc-2jCu;
	Mon, 09 Feb 2026 16:06:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTly-0000000Fevq-2gPe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 16:06:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA526339
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Feb 2026 08:05:53 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 122F23F63F
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Feb 2026 08:05:59 -0800 (PST)
Date: Mon, 9 Feb 2026 16:04:02 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Karunika Choo <karunika.choo@arm.com>,
	Liviu Dudau <liviu@dudau.co.uk>, Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: [RFC PATCH] iommu/io-pgtable: Add support for Arm Mali v10+ GPUs
 page table format
Message-ID: <aYoFcjNkPkPQh4zG@e142607>
References: <20260209112542.194140-1-liviu.dudau@arm.com>
 <58767D4C-505C-424B-AD08-C042BAA3FC34@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <58767D4C-505C-424B-AD08-C042BAA3FC34@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_080602_765113_BA21D64E 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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

On Mon, Feb 09, 2026 at 11:16:38AM -0300, Daniel Almeida wrote:
>

[....]

> +cc Alice Ryhl and the rust-for-linux mailing list in light of the Rust abstractions for this component

Appologies for the omission, I will bear in mind the next time to include Alice and you as well.

Best regards,
Liviu

