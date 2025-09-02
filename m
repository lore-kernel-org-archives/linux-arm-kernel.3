Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF43CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvxqjqBSAA3rroRPaw3cA0fLRMTiwbEBioineSL6S2E=; b=eI1YBiVIMxSa3hYOrOnE3r9pSN
	/ZRdfkDgCJVEV5cgeQM9seVjsYVxKm9RfbcwbvAr0GRCpfV/PLzTI0NjY4VA2K8crPI+V3NieNI3C
	UvrxqsZYzG6j87IP//5YDFbCPcnJirjF3LzeMGJWE7g59tdrTuYXREt52AQ33vg6JhiCrygwv8/I5
	UX7X77F+z/3e2cXFr/gNm1y3+bURYZAQA/cWEOnzRMJCrxhCo5jdOUE4Dl8nQCPRgbZTnuY5VhkGj
	jsgyo1JhnJy/Z3l9l+r5YpYezYUjx7aqk5GdWVasfiLo/lHtIja//8KRciA1S069pzGJJnLPXamcO
	RWlkSRhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbeR-00000002t9s-288f;
	Wed, 03 Sep 2025 00:47:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utZwT-00000002UOl-26HJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 22:57:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F4AF44B37;
	Tue,  2 Sep 2025 22:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F66C4CEED;
	Tue,  2 Sep 2025 22:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756853852;
	bh=FvxqjqBSAA3rroRPaw3cA0fLRMTiwbEBioineSL6S2E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Oxh3Cz6ZWiu1TNdgFIyXWPC1tQFEyai1+y76xpfVy1J7Ewhg0XzFUX8KNlpjMNL92
	 ADsXmHUsLar8/o/OM2DeaaA5juBFF5of0mSGJOrm1xcbRRTHdtnQMk50yXVFhdtn04
	 tdoIs+mHih76QZeuqcBoxcgk3lKXC4sbg2zdGtSAiAd7b6+fS+AWn21aa64cmFv8ns
	 qdHF6maWl0/QnKHGwZPb1tYqF4CBoSI94vlsIFvzZvLlvSKRlRaA9eJ2F4S8F+8eE0
	 At/9y3y82Ro2NtDqdE/9LGH/7tQFW3WeSrhHZowNmOHvfstDJr7t0YgKvAiw35ZIPQ
	 ufEG0/hiFo5sg==
Date: Tue, 2 Sep 2025 15:57:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Conley Lee <conleylee@foxmail.com>
Cc: davem@davemloft.net, wens@csie.org, mripard@kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] net: ethernet: sun4i-emac: free dma desc
Message-ID: <20250902155731.05a198d7@kernel.org>
In-Reply-To: <tencent_1489A82090ADCB83FAFDAD60B4D46B2BAA05@qq.com>
References: <tencent_1489A82090ADCB83FAFDAD60B4D46B2BAA05@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_155733_652368_9D92AE81 
X-CRM114-Status: GOOD (  10.45  )
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

On Sat, 30 Aug 2025 15:49:46 +0800 Conley Lee wrote:
> In the current implementation of the sun4i-emac driver,when using DMA to receive data packets,
> the descriptor for the current DMA request is not released in the rx_done_callback.

Please wrap the description at 74 columns.

> This patch fixes this bug.

Please use imperative mood, "Fix this." or even better rewrite the
whole commit msg to be imperative.

Since this is a fix please add a Fixes tag.

