Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9056C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 11:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79urvNIlMrRW2bM7NthcgJ5nSvRIQeNNBWJzKsp3grc=; b=Ha1MQUgzkYUSx4mYVvRepT2XiC
	3gIVjeFUSbxLvJcK3/oBP/8FyvUUDzq0uU0Hd4SFHWn17w/nf6MwemEQcRfU8ssj8qLrn9gPSslFV
	r8ViFg60B4usmOtwKKUloHRmuc09qk0PQi8Fo9xvHhBFwb6G6sZ5YfoyM3UuPcdShi3d0g6KR/Jl9
	9CNhSk83P5/tD+215QDVc7MgiBhriqJO9tbulXBCwvVhfWeDMOM4KmaHwaEAZ1w4rLra80zlJThqE
	p3PcpquMxlapXhgGNOH0ShnVtZJA4EhUTiNdVVYWpWMvlgIN/z4pCJ5+n+ELTZBpZsJaljacY++yJ
	ONJmOHHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyTAl-0000000GXt5-0Erx;
	Mon, 24 Aug 2026 11:49:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyTAh-0000000GXsb-1A4J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 11:49:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B1441756;
	Mon, 24 Aug 2026 04:48:53 -0700 (PDT)
Received: from [10.57.70.220] (unknown [10.57.70.220])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7461C3F66F;
	Mon, 24 Aug 2026 04:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787572137; bh=FUTULkw4sbTU30itVTCBK3ANXD7XisKmmUJJlXOZQsc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=npev5eRcYxB8WWc3bqFPpFzAeRE0kdm6uSQsep5ImOyqAt3VY2jrqsiKwEwBwrMMd
	 2OZ5V0N0ak8uQ3V0tnhJnQUDSDnME5yOLd2fDnCL1FCZ0dPbALqLqyGxPYFU51Ca1z
	 ZTV+BQkVhCEOgo+TTeWn6hd2sS5XJN2lSNolKVK4=
Message-ID: <566ce354-88f0-4e68-86a4-a8d68bb65254@arm.com>
Date: Mon, 24 Aug 2026 12:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: arm-cci: fix device_node refcount leak in
 cci_probe_ports()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Manush Prajwal <manushprajwal555@gmail.com>
References: <6a887550.f7f62383.10ed1b.5875@mx.google.com>
 <5bd32eba-881a-4395-841d-909536262dcb@web.de>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <5bd32eba-881a-4395-841d-909536262dcb@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_044900_642030_0E2F2E53 
X-CRM114-Status: UNSURE (   6.53  )
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

On 2026-08-24 8:00 am, Markus Elfring wrote:
>> cci_probe_ports() has two device_node refcount bugs in its
>> for_each_available_child_of_node() loop over "cp":
> …
> 
> How do you think about to add any tags (like “Fixes” and “Cc”) accordingly?

No.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst?h=v7.2-rc5#n15

> 
> See also:
> * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v7.2-rc5#n145
> * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst?h=v7.2-rc5#n34
> 
> Regards,
> Markus


