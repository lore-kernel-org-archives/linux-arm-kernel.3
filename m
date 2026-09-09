Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E5DC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 02:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uEessHzcSfxsC9/R4E/G5cHhOHZfHSBc4M8wjJU3EI=; b=tTgRgICnHcALGx9wzrJJfj8ZCX
	67aGVRurKWpBElYPVw1A1WOXxqY47Z/RWcnARiVitdDKybmlEm51NWJelTdjTs42OscF85a7lRRaN
	QnrmundS/O9YwVP+Vlr/p6p1ZrJaq/bSVnRz2ePqinkFytqWxISCx6xQU5IBO7WmRfyC4iKqSQd/L
	evtm+DC34olHd2Y2v5uEGawvaHHeswSt6Zo7AqDjCxvHvUw47WlyERafipS3qqCRfXaaYtDBAQEED
	FrQDwHZ2IgQu//4vxv+X3N3SfUCTkKFuqsIuHfjiFFKOfOr2JrUPtgGHK0fVhOcxo4Eqp8k1bfkzU
	lqN7zKjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x47d4-0000000Ae3f-2Trs;
	Wed, 09 Sep 2026 02:01:38 +0000
Received: from mail-m83119.xmail.ntesmail.com ([156.224.83.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x47cy-0000000Ae2P-049V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 02:01:37 +0000
Received: from [127.0.0.1] (unknown [122.224.241.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d0ba6a2f;
	Wed, 9 Sep 2026 10:01:22 +0800 (GMT+08:00)
Message-ID: <d1c64269-63b3-40ed-9efd-1ba545f8cb2e@hj-micro.com>
Date: Wed, 9 Sep 2026 10:01:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm-cmn: Fix {wp_dev_sel2, wp_dev_sel} limited to
 0/1 when MXP_MULTIPLE_DTM_EN is TRUE
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, peter.du@hj-micro.com, andy.xu@hj-micro.com,
 allen.wang@hj-micro.com
References: <20260819105443.668784-1-allen.wang@hj-micro.com>
 <f97fa5ae-3535-4e1a-a164-77138a93cc89@hj-micro.com>
 <58adffd2-6ef4-4a4c-ba3a-3f510522d928@arm.com>
Content-Language: en-US
From: "allen.wang" <allen.wang@hj-micro.com>
In-Reply-To: <58adffd2-6ef4-4a4c-ba3a-3f510522d928@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa083e5fbc009d8kunme32fd7ee3c8753
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDThoeVkofQxgYSUJPTh5NHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUlPSlVIT1lXWRYaDxIVHRRZQVlPS0hVQk
	JJTktVSktLVUpCS0JZBg++
DKIM-Signature: a=rsa-sha256;
	b=a8vY9GZLrLFJA9Epxm8DFpwotP6Ktm3Iv64lfTXz0NlLfQ8OZ7jl/dPdtyJ6kZaxEVLGF8cpv/ODOehuhRhUE/VACwMMcH8KrFCKmWZDGcm1wercTeuFL7GSn5bADXqReIKm/HEE4Syr7vjctGHZgqtKOa8uQuImylIGGx3DDi8=; c=relaxed/relaxed; s=default; d=hj-micro.com; v=1;
	bh=0uEessHzcSfxsC9/R4E/G5cHhOHZfHSBc4M8wjJU3EI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_190134_305748_1A50E487 
X-CRM114-Status: UNSURE (   3.96  )
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

Hi Robin:

Yes, that's exactly what I'm saying. I've tested this on actual
multi-DTM hardware, and the hardware does not ignore wp_dev_sel2
automatically — it must be correctly configured by software.

Thanks!
Allen

On 9/8/2026 11:04 PM, Robin Murphy wrote:
> https://support.arm.com/documentation/102308/0307/Debug-trace-and-PMU/
> Debug-Trace-system-overview/DTM-watchpoint?lang=en


