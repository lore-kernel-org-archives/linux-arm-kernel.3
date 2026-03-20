Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB191093168
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 03:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HzAyuv1cR2aPHHtMvh1o2+bWKgmUnvOcDh+3uBWmXE=; b=LC9S+tdL4wjSOff26t3QRmPhlf
	hvIlCRUx/GNKWtmkFq7qwtMA9dCEzqOksuns36jI6n6sH6Cr75V3USDeAqYteV4/UkGfJoWIgy0TJ
	rkOGAW/a5j8es0NAnBVhNv7o+4SIZird43Cnfqj/bAg7VsVkE7ZPCxO8vI5YVRn4Dc9fI/Foy94vB
	VGbZeGiB6ecUaAftCchWfnFc+QOvQyzFa0RXgRg4Afrf9IF/yO8JYWj7rnU7CEw7BG8n9LkcHIxrD
	t/K+QjAyUsTQ546uBsB/uvxYmg5q57obBlqNiSWUXdyK3D84qsvEaTb+hmU+TtYcxaSgxQQcwDGip
	zu0vD3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QNq-0000000Byxu-2blV;
	Fri, 20 Mar 2026 03:18:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QNm-0000000Byv5-1KRs;
	Fri, 20 Mar 2026 03:18:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB74B4358E;
	Fri, 20 Mar 2026 03:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A21BC19424;
	Fri, 20 Mar 2026 03:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773976720;
	bh=RnWaFWKleytYk2xnMbn6rVyzIPDB56jqJgJOybkNp58=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XCGRZxSuX7NB0ciVsWAd9qvBv9OyQ8YLbS1a+8P3iOs92SF02WGeSPOmDhHZYN8k3
	 2ERRZEycezU/gQTEFoNqad93hDeICz1JmYWv2WgOP9VeqK4G40VWziMGpyao6ozqpE
	 +lt/ohK+PFKlyJD2wClCMFCru8H2uNJzFHowMP6w=
Date: Thu, 19 Mar 2026 20:18:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org, linux-mm@kvack.org (open),
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] change young flag check functions to return bool
Message-Id: <20260319201839.2dfa704041b8f13d8dbbfd3b@linux-foundation.org>
In-Reply-To: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_201842_386930_99B6F7F2 
X-CRM114-Status: UNSURE (   8.07  )
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

On Thu, 19 Mar 2026 11:23:59 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:

> This is a cleanup patchset to change all young flag check functions to
> return bool, as discussed with David in the previous thread[1]. Since
> callers only care about whether the young flag was set, returning bool
> makes the intention clearer. No functional changes intended.

One observation from Sashiko.  Minorish, worth addressing:
	https://sashiko.dev/#/patchset/cover.1773890510.git.baolin.wang%40linux.alibaba.com

