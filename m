Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6E1CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZxI4LsfcMWt6ba+IFpGYGNMJB4Eed98Z2DKHmyuPJA=; b=eH3NWM8JkZ2nhiPE8TKRnbl7dt
	E/x6GQb8isaRpuqazfmesIoPheTFFHfBcVPxYmFW2h2dfRDnHq4+JVKZSEg7FKjk6gOw2ArWJRE+p
	C9sLfihoF80p5W1eRCVCjvYO+Vle+jQ2MyxMLKOuhf5snfMk7MTAEL26iO5qkykLSVPHX672RGlwi
	V1TT6ani9Sg9jP3IjheVMRnLsyApjVcMsZmeZ+FqaeFuR+P+L796NYFR0fprvXoSHymtCMeTBi5r6
	xaMYetsqi45/+Lwt2CmnwnSPFBCLr8U+F/+/d/by8IAD0oBG5+A0yacoKaYc2ah7tA0A0/15//Gqi
	2T+aRuyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXZD-000000009Gh-1Vzc;
	Wed, 06 May 2026 08:25:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXZC-000000009Fy-0cNF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 08:25:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D3931A25;
	Wed,  6 May 2026 01:25:07 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3C7773F836;
	Wed,  6 May 2026 01:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778055912; bh=GvuUkUcWvf2zjTxhCcjwgeRUpxr1nMMzXKYOaWAuLx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TdpcStlqvQO/Otsz1RsCmARd9jJ38Y6Rpymau4IOcfWk4Iy0YDmOSOyUD+Uat9gS/
	 lWPJsqB5DzMkXVPACD7ijAmZAoZOhJM8vIbvtw9SknyEZEMNOXFoBTV93dEf51fO/H
	 PVLMYXkac6geaa1gSe5Nn/2iDtkS/Mje35jA/eFU=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quic_yingdeng@quicinc.com,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH] coresight: cti: Fix DT filter signals silently ignored
Date: Wed,  6 May 2026 09:24:59 +0100
Message-ID: <177805588674.639041.8334808426614149633.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426-nr_sigs-v1-1-3b9df99dab97@oss.qualcomm.com>
References: <20260426-nr_sigs-v1-1-3b9df99dab97@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_012514_323054_F2EAC358 
X-CRM114-Status: UNSURE (   5.91  )
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


On Sun, 26 Apr 2026 17:59:34 +0800, Yingchao Deng wrote:
> In cti_plat_process_filter_sigs(), after allocating a temporary
> cti_trig_grp struct via kzalloc_obj(), the code never assigns tg->nr_sigs
> = nr_filter_sigs. Since kzalloc zero-initialises the struct, tg->nr_sigs
> remains 0. cti_plat_read_trig_group() guards with:
>     if (!tgrp->nr_sigs)
>         return 0;
> 
> [...]

Applied, thanks!

[1/1] coresight: cti: Fix DT filter signals silently ignored
      https://git.kernel.org/coresight/c/551bb2fd5e4e

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

