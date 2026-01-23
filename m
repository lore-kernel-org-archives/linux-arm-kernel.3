Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568BCD74EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 15:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4V2hjla+bW2QYTmJeImMZ1GnZfmBM9sjn2knDrMUSM=; b=t9nl7HQPXsq2t6DHvGQGFjHukL
	u5DwovyIYkQI3Jj1rTnL/KmsUv3MtuhIk+kGLGg5FMry+4n3aSfDW9MUZthP2WZGnCVIKnPDN0HYm
	55l7SMUl4oRBfEM55+SW9AQCtpKwrG1dzh4IjIZIPUB0nTlLky1+mgBvy9qPhe0BgY35Sj8EMeTy5
	/VhOysBPWxzZPnHHfBDgtvX8gXkGnysCwGKRFnVUGIcYADlIe/7jm6+EKT0y5vyf3O5HnZrTXATnS
	DCietAtwGUZDl6OdcKKsm9auOJ5oc7nmcMHk+dN6BYURUoZTln73svg5hJ9YTJGVunPA3D7X1R2mm
	EyvAOGBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJVB-000000097i2-1KbG;
	Fri, 23 Jan 2026 15:55:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJV8-000000097hO-07bb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 15:55:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35DF11476;
	Fri, 23 Jan 2026 07:54:59 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 743AF3F694;
	Fri, 23 Jan 2026 07:55:04 -0800 (PST)
Date: Fri, 23 Jan 2026 15:55:02 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Zhaoyang Huang <huangzhaoyang@gmail.com>, steve.kang@unisoc.com,
	jeson.gao@unisoc.com, xuewen.yan@unisoc.com
Subject: Re: [PATCH] arch: arm64: set __nocfi on swsusp_arch_resume
Message-ID: <aXOZ1vsFvQRkxK9x@J2N7QTR9R3.cambridge.arm.com>
References: <20260122114925.624309-1-zhaoyang.huang@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122114925.624309-1-zhaoyang.huang@unisoc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_075510_102456_CB5FBAE1 
X-CRM114-Status: GOOD (  15.62  )
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

On Thu, Jan 22, 2026 at 07:49:25PM +0800, zhaoyang.huang wrote:
> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> 
> A DABT is reported[1] on an android based system when resume from hiberate,
> which is root caused as CFI will plant stub code[2] to verify the
> swsusp_arch_suspend_exit's authentication, where the hash value is stored
> before the page that alloced by create_safe_exec_page. We also have
> tried to copy the hash value together with the function but get failed since
> the value is not on the desired position(src_start - 4). So we solve
> this issue by setting __nocfi on swsusp_arch_resume and it works.

I think this patch is fine for now, but in case anyone is looking into
this in future, the description isn't quite right.

The problem is that swsusp_arch_suspend_exit() doesn't have a CFI hash
at all, even before it is copied, since it is marked with SYM_CODE_*().
There is no hash to copy.

Ideally we'd mark swsusp_arch_suspend_exit() with SYM_FUNC_*(), but
that'd break the expectation that the entrypoint to
swsusp_arch_suspend_exit() is the first byte of the .hibernate_exit.text
section. Changing that is a bigger job.

AFAICT there isn't a way to suppress KCFI checks for a specific function
call, so for now this'll have to do.

Mark.

