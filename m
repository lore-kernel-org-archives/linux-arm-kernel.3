Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFEBD75BCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 08:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLNXyzIboI6pc2qgE87idMdWECU8DxxKZWb8lIJUvoA=; b=of3BkWO5jg8R5TtM9fv0IWvJOB
	ZNk4so2yLkiWLPtF1JDRMVss6NLLlh81zk2FxsWnar4xh9U8LHtS1Md3GmvNMWVYzeLqaghML/yoQ
	db+tiDTAHpdFbciWg8S3TmYq8FPSRQ+ajRpkR/J2pDZPD31AJIXey6h3Ggic58bgpZtXomXezsN5n
	yWRi+3SWXR0nwlcGpn3rvMGa1buwsmpi+lLzz1hPHEUUB6omzmiRSLbmIWYHHVYxOGV5gsHC9b2nY
	wxDg/l5R/LoLdpURnR33X1nArfDDMy1IGdww3qnEf9U0b3bqhokh7O/Pgd4dg6qlLBfhRp1YQMUh4
	l3CxWj8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2QF-0000000H58H-2AuI;
	Thu, 21 Nov 2024 08:20:19 +0000
Received: from out-185.mta1.migadu.com ([95.215.58.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2OT-0000000H4vv-2yx2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 08:18:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732177107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLNXyzIboI6pc2qgE87idMdWECU8DxxKZWb8lIJUvoA=;
	b=w3pxGZCaySyzLzo0mJzQMpGuT0OvsiJ0GJpjfIllGxdmhzmf8HUV3P1OTAmq41uNSa0h/h
	UKtyjNG9PK2TDXw+KaFdvMW8MdldEul/cd1t7ea5FN542Cdt1Ip31hcFyKw9+OUEVCGp3X
	KKcx8wnjoNC4aJ4QHpDW4wsIKKGWqlE=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] KVM: arm64: Mark set_sysreg_masks() as inline to avoid build failure
Date: Thu, 21 Nov 2024 00:18:04 -0800
Message-Id: <173217703276.53090.416338024630902187.b4-ty@linux.dev>
In-Reply-To: <20241120111516.304250-1-maz@kernel.org>
References: <20241120111516.304250-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_001829_897070_CD01E273 
X-CRM114-Status: UNSURE (   6.24  )
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

On Wed, 20 Nov 2024 11:15:16 +0000, Marc Zyngier wrote:
> When compiling with CONFIG_CC_OPTIMIZE_FOR_SIZE=y, set_sysreg_masks()
> fails to compile thanks to:
> 
> 	BUILD_BUG_ON(!__builtin_constant_p(sr));
> 
> as the compiler doesn't identify sr as a constant, despite all the
> callers passing constants.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Mark set_sysreg_masks() as inline to avoid build failure
      https://git.kernel.org/kvmarm/kvmarm/c/0f3a0f23f562

--
Best,
Oliver

