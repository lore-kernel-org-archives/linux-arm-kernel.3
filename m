Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2630DC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 04:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxeQf6s78CH0SrlUelQK4Xitf7rMCUIgO+qCSqp4SJA=; b=CWQWZ74E3HMf+Y964SmTlx/moI
	sW9vDfZcl3UAJMHZXLfZ291KJz43Pd9jBRs4vp0ke8AENAE+SRTZPmvvzyBX2QcW+SS9zn6K2A2cL
	mP9GT/CvUOeORx9+tdveH4lD15GEVLEV1YOMOAF0QvJWrrjnxao5KS4fWa2aui9gImSQfrf9RG4Z6
	06oNOlx8+/zomwzZ83lcuQhN5vjubnRnHEkBncd5jTJYdih0V1PSeAYJ+mC3G6XWjQdEqw8ulJerg
	xkcGvszWGcNUygTcpXxTzR+KycbS1+AYSGDwhmlGc3zTg++BP8sWnpPny0n4EQKVJXdkZsOvbUFhg
	QB4tSwfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMfs8-0000000CZNT-1RuW;
	Wed, 04 Jun 2025 04:37:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMdv2-0000000CKLB-0ZbV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 02:31:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72A9F61127;
	Wed,  4 Jun 2025 02:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B418BC4CEED;
	Wed,  4 Jun 2025 02:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749004285;
	bh=jW0BB3cinE6IAbLWfjdG0dhsOZS2FBUM95QJu8mydeg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L+koj556a3Hdo3NxRJNxXR3wCvNhvnxpXaUUzD04FzN3C5+e77h69NgMuLxkms1WX
	 Df/Gozu/l+1MC0Jm5MMvMt8kcqS0eFqQe7VH0QZMmxxtmQ11oKP8Kk8fCNnVNV2m5M
	 TTD6T9J8C9RZvdcKKW6X8mNs64YGluqUSbaWgTDM=
Date: Tue, 3 Jun 2025 19:31:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Xavier <xavier_qy@163.com>
Cc: will@kernel.org, ryan.roberts@arm.com, 21cnbao@gmail.com,
 dev.jain@arm.com, ioworker0@gmail.com, catalin.marinas@arm.com,
 david@redhat.com, gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, willy@infradead.org, ziy@nvidia.com,
 "Barry Song" <baohua@kernel.org>
Subject: Re: [PATCH v6] arm64/mm: Optimize loop to reduce redundant
 operations of contpte_ptep_get
Message-Id: <20250603193124.347804cb5a19c9941a354ff4@linux-foundation.org>
In-Reply-To: <6f9842a2.7c3c.19734ce1860.Coremail.xavier_qy@163.com>
References: <20250510125948.2383778-1-xavier_qy@163.com>
	<6f9842a2.7c3c.19734ce1860.Coremail.xavier_qy@163.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Tue, 3 Jun 2025 16:00:11 +0800 (CST) Xavier  <xavier_qy@163.com> wrote:

> It has been three weeks since the submission of Patch v6. I take the liberty of
> asking whether you still have any comments or suggestions on this version,
> and whether the test data indicates that it is ready for merging. I sincerely
> look forward to your valuable feedback and guidance.

It was late in the 6.15-rcX cycle and I was hoping that arm people
would handle this.

It would be better if the patches had cc:linux-mm@kvack.org.

I'll grab it and shall include it in -next after -rc1.  If ARM people
want to grab it, please do so and I'll autodrop the mm.git copy.


