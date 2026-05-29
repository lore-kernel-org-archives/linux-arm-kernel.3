Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89549CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/B1s9KhnGd01rwpg2fz4lH2p0wkLzGPo4AluzrGq1U=; b=acodFzlXJDUspHq1QQq6wKQcje
	l8RBcQHZ4MPsQQJZVxwXuQ3U6ukFZlngUW0H0JIJ1lrTpEf52Emxqo2ZRwsCkfF0dj9ygEwz5ORE/
	6xiP07JaUPjhbivcy0zCaG72KueP0NUNFrwybGrrIaji6z8sUqQTZrsuuHlXYFu/dU+Y/vteS6Ltg
	IAFC/teA44dr04xb18iWhWz0Ladkd+WehMb/j2JhKWrKvRi6LbNjsLtL2jwvEU4UNqFTPWAogCijj
	INtO8CFlGfQ57nFg/1QoNZ7dFrlwqBU4QXJCGZqwOZjSqaLVtsIdDWFC6Nflve2ZqsIV+WIqzg4eN
	8ZIYFPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzWe-00000007kqc-3ZUg;
	Fri, 29 May 2026 15:53:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzW5-00000007km2-0Lsy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:52:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7530D605CF;
	Fri, 29 May 2026 15:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA2F1F00893;
	Fri, 29 May 2026 15:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780069976;
	bh=N/B1s9KhnGd01rwpg2fz4lH2p0wkLzGPo4AluzrGq1U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WsdxII/q2zvqNxWCu9klfz79GluHKPdSHwdkuHSAv0hUH4JarglftSySE6k5cbyMM
	 BqPCmcNHtOf0Wbcf7WePutZtO5a3J27pzUo5lCjR6amgAmK2Kljw3ZHzDQvSgXj8oy
	 6eoAd3FAA1d/M9VDgPQry4cccHA8vF4X3FaJc6MsUTbiZYc8vX7j9bHVydxWHppBd5
	 aYajVapdVuY45Wy5vVkNOKKB4VCBIAFFKgwjooxm/W77u10KqU70XA9JlBi683UXIf
	 H35ULHRV7vYplnGUjdbmo3QWilV11HQT9eMNN/riJBVQW5i1u74hYUX7pkoN2Ot93+
	 tADG9vjqdg4cQ==
Date: Fri, 29 May 2026 16:52:39 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: will@kernel.org, xueshuai@linux.alibaba.com, saket.dumbre@intel.com,
 mchehab@kernel.org, dave@stgolabs.net, djbw@kernel.org, bp@alien8.de,
 tony.luck@intel.com, guohanjun@huawei.com, lenb@kernel.org,
 skhan@linuxfoundation.org, vishal.l.verma@intel.com, rafael@kernel.org,
 corbet@lwn.net, ira.weiny@intel.com, dave.jiang@intel.com,
 krzk+dt@kernel.org, robh@kernel.org, catalin.marinas@arm.com,
 alison.schofield@intel.com, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, Michael.Zhao2@arm.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-cxl@vger.kernel.org, Dmitry.Lamerov@arm.com,
 devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v5 01/10] ACPI: APEI: GHES: share macros via a private
 header
Message-ID: <20260529165239.25753125@jic23-huawei>
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-1-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
	<20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-1-2e0500d42642@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 29 May 2026 10:50:41 +0100
Ahmed Tiba <ahmed.tiba@arm.com> wrote:

> Carve the CPER helper macros out of ghes.c and place them in a private
> header so they can be shared with upcoming helper files. This is a
> mechanical include change with no functional differences.
> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
I'm not sure there is a 'right' way to handle the use of ACPI deifned stuff
outside of ACPI, but this seems reasonable to me.

Reviewed-by: Jonathan Cameron <jic23@kernel.org>

