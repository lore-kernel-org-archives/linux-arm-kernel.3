Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34501C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 10:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuIJDVfzc4mKu5qy1/23g2RKiIrU+flgYFGTMQPg0EY=; b=4wIsv513OP+3vVQpnj2iCGLj8F
	PphNIFg3YCpAfcIaLJrLzzWKTz63znXmSGQX0np7GiY7UgmKP/g/FGLkpa5O9gy2TNuC0Ww1DoUeU
	Yn/LXdAM4L08PkYrgSqItwSH0e+Rqt0UjFUW61gx0Ip/vFn3GeZG6hBFfpxV44o7VgojW45PImQbU
	9M9V9eIkdB2OGM0Z+z2xWJXQwzNSuD3aEvJTVlRtE5h6a6fYAgr0W7+EDofCax+d0mCaLSVKU5Ah2
	zimqcm88RhajagmKwLQA32oA4VgKjK5F6BeqM36QYYMU8vvKJ1+Qc5avu300KS4sSwFCrCjjD7KMG
	yV53XM4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueWQF-00000004dDu-0JPj;
	Wed, 23 Jul 2025 10:10:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueW1e-00000004Ylh-184G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 09:44:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF64160007;
	Wed, 23 Jul 2025 09:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0AADC4CEE7;
	Wed, 23 Jul 2025 09:44:33 +0000 (UTC)
Date: Wed, 23 Jul 2025 10:44:31 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	broonie@kernel.org, yury.khrustalev@arm.com,
	kristina.martsenko@arm.com, liaochang1@huawei.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/8] arm64: uaccess: Move existing GCS accessors
 definitions to gcs.h
Message-ID: <aICu__TsqPRXJU7m@arm.com>
References: <20250719043740.4548-1-jeremy.linton@arm.com>
 <20250719043740.4548-4-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719043740.4548-4-jeremy.linton@arm.com>
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

On Fri, Jul 18, 2025 at 11:37:35PM -0500, Jeremy Linton wrote:
> We are going to add some additional GCS access helpers to gcs.h in
> order to avoid some forward reference problems with uaccess.
> 
> In preparation for that, lets move the existing gcssttr() and
> put_user_gcs() routines into gcs.h where it makes sense to keep all
> the accessors together. Further, the code which uses them already
> includes gcs.h and there is an existing CONFIG_ARM64_GCS check we can
> reuse.
> 
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

