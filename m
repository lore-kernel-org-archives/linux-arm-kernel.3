Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E3ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1sCkCgaiG1tA44yfM5L2ANo4vr5hbJ7W7Dhy275RGto=; b=NoJ2t0Y1rETI7SLhCqDHak7hAg
	r6qLkRVK7XxIw5vnAGC+1MQdhsmmczFNG9xnXuNMFJSmuSboKxdu5rJ2J2DIL17vrEn6UGLg0W/Nj
	dWzlV160mfsN2I8JKiLU6+VHmcMXZcKJqHO3IJmICylsQ2NwC0prVrBTcvRiOiXikOct62XNCWiEU
	IQgUpGTMfebzmaNJwlXFwpbqGzjGFMgxm/cYdFpu8W/lAfISUvU3aInTdaFKVKxtKmGNfVNh+66j/
	XsJVQ3uyRyk9T7/MPuCD5HUV81eZK3eQFIRTiUzvu0wTEi+onLF9vm+WDdokln+9WujU+ItoIkF0A
	yjHk4L9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtWi-00000005VdB-2kXr;
	Tue, 09 Sep 2025 08:16:32 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsRm-000000053E8-1stt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:07:23 +0000
Date: Tue, 9 Sep 2025 00:07:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757401640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1sCkCgaiG1tA44yfM5L2ANo4vr5hbJ7W7Dhy275RGto=;
	b=T16KC8mlkc5FGJYRuNmRzyykNMCR64eNY9Ro4AI2qiVGUT9isxX9alIMp3XWcO7yseGGfg
	BnOhQMDKGXI7yO4Cpi9xkcifSVD8E2ML6BOsNywRtslYQYzYHm9KCO91uDTv60onUenJMg
	9kPyXnW9BljanSa6ge2DE3kT/RI9Ezw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Jinqian Yang <yangjinqian1@huawei.com>
Cc: yuzenghui@huawei.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, liuyonglong@huawei.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH v2 1/3] KVM: arm64: Make ID_AA64MMFR1_EL1.HCX writable
 from userspace
Message-ID: <aL_SIwQiz3QO1fKe@linux.dev>
References: <20250909034415.3822478-1-yangjinqian1@huawei.com>
 <20250909034415.3822478-2-yangjinqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909034415.3822478-2-yangjinqian1@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_000722_640122_187030D9 
X-CRM114-Status: UNSURE (   8.96  )
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

On Tue, Sep 09, 2025 at 11:44:13AM +0800, Jinqian Yang wrote:
> Allow userspace to downgrade HCX in ID_AA64MMFR1_EL1. Userspace can
> only change this value from high to low.
> 
> Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>

I'm not sure our quality of emulation is that great in this case. We
have no way of trapping the register and it is always stateful. Better
yet, our RESx infrastructure doesn't account for the presence of
FEAT_HCX and we happily merge the contents with the host's HCRX.

We should make a reasonable attempt at upholding the architecture before
allowing userspace to de-feature FEAT_HCX.

Thanks,
Oliver

