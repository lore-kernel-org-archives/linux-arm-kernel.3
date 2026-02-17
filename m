Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC508E68147
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 17:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqvkO3d8pf0lSaPpz0YdQ9T5Ii+HCmRk3sj5lrZM12U=; b=qYuoZAH7mKK5nBFSN7E43fIeGT
	fDmMr1hTXziK2gqvMxVdVv1ZeJriKCLF1CeU5AWqn5ONa9l8g1jNNOMYKkrb4EqiI3NWZ2r4n7uLM
	Q07cypN0TnmxSkzbUZ9k7aSTJrgIMstyV+ihzv9C5hXE/qMAR+mvRDVNjRQF1IU0vtK4Pbvn7HfP/
	bmNql9X8299FVuB2h51XCxKkRRxqa3jrOT9L9YnENv9IsLLV80srMfyy+i0Bz7tgRWBdrm9wfN7uS
	G9f/TFHBbMBZkBU1YJpQ/gQm6ImRA5em5AUeJ6loW4rgxQML9W4ikN2W4eM3+udzijDSCTRSRTx1m
	ITsDdTOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOjP-00000008e5a-37QZ;
	Tue, 17 Feb 2026 17:19:28 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOjM-00000008e2d-2mZA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 17:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1771348762;
	bh=iqvkO3d8pf0lSaPpz0YdQ9T5Ii+HCmRk3sj5lrZM12U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hGQrADKPIWiFzGofJtFWS3VD5op+SkWvFrgCBSDM+4x5bKFMAQhgHNu0wLhcjJOmX
	 9jnRpyJsGTG4PRoPWefEqa83g90G+mruAP4ug2OFNsx8KG4mvqy9Yu4dbOgwi1jMkY
	 SmLxDxlkInH2D4cYmRmr3SYdqMlAdkkVSpPJYNWw=
Received: by gentwo.org (Postfix, from userid 1003)
	id E70FD401B2; Tue, 17 Feb 2026 09:19:22 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id E5831400C8;
	Tue, 17 Feb 2026 09:19:22 -0800 (PST)
Date: Tue, 17 Feb 2026 09:19:22 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Dev Jain <dev.jain@arm.com>
cc: Will Deacon <will@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
    Catalin Marinas <catalin.marinas@arm.com>, Dennis Zhou <dennis@kernel.org>, 
    Tejun Heo <tj@kernel.org>, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, maz@kernel.org
Subject: Re: [PATCH] arm64: remove HAVE_CMPXCHG_LOCAL
In-Reply-To: <89606308-3c03-4dcf-a89d-479258b710e4@arm.com>
Message-ID: <6d30176d-9673-287e-4658-a5e9e6e5d649@gentwo.org>
References: <20260215033944.16374-1-jszhang@kernel.org> <aZL46z1UZkQlF3Dd@willie-the-truck> <89606308-3c03-4dcf-a89d-479258b710e4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_091924_743399_B1097C06 
X-CRM114-Status: UNSURE (   8.93  )
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

On Mon, 16 Feb 2026, Dev Jain wrote:

> By coincidence, Yang Shi has been discussing the this_cpu_* overhead
> at [2].


Yang Shi is on vacation but we have a patchset that removes
preempt_enable/disable from this_cpu operations on ARM64.

The performance of cmpxchg varies by platform in use and with the kernel
config. The measurements that I did 2 years ago indicated that the cmpxchg
use with Ampere processors did not cause a regression.

Note that distro kernels often do not enable PREEMPT_FULL and therefore
preempt_disable/enable overhead is not incurred in production systems.

PREEMPT_VOLUNTARY does not use preemption for this_cpu ops.


