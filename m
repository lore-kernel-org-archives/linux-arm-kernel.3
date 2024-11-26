Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1201AD3B9B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 16:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmF/6x31FfYxPFDBDRNPF1RJ1ndUJpnTkS2ByH7P/BY=; b=LlWSQIX2bZLoh+9MpQUaH04vYG
	Z0a1H+rB9t7G0uoN28G+toP8bZpXLIhfiXIhxRUnQkFTS8jzpAZcohOIYM1p2w7Fl7cgqH+1d5nsl
	RHe4OxMfdzgt6JTJsD/2dTaGLt4Axu8kQ1x8U+xWUUmM8OlM49xXx2c+8bq2FHEhrCXg43owepknv
	zm+/ByrXxjIOQ68GrIouzm1p+/8cOcF8krONGz0WbHn3xQXtOKEmoIQYNgfwaE0oRCdQRUhZb3k1T
	dzMXnh5ngqxJ6YjJkXvIZWZ6A7+OG47+CjQlOQjVmV8mF6wKHP/qKnDp0CP3rqIM2AlNKHfhxCMTX
	wS4YxM1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFy0c-0000000B5Yb-1sqx;
	Tue, 26 Nov 2024 16:01:50 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxyZ-0000000B5Bq-34k6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 15:59:45 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732636780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OmF/6x31FfYxPFDBDRNPF1RJ1ndUJpnTkS2ByH7P/BY=;
	b=LhvdyQnBtXR72Imp/QRtE+uP3eXpCVDl/VxdZdgRJi86CAOlTjndAOiogcAVC9bKZRiKXS
	qhzTBM47YfdE8BvF/TRXp9KwSUL0O3R58NQ7ti0oXtSZk8N9puq2eimm9MfCWYtgaTwZSB
	jM/QtcWCt1YMfedRxX8O7N8mgJE78Uw=
From: Oliver Upton <oliver.upton@linux.dev>
To: will@kernel.org,
	maz@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	James Clark <james.clark@linaro.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Fix usage of new shifted MDCR_EL2 values
Date: Tue, 26 Nov 2024 07:59:25 -0800
Message-Id: <173263668481.68510.14862173366195490038.b4-ty@linux.dev>
In-Reply-To: <20241122164636.2944180-1-james.clark@linaro.org>
References: <20241122164636.2944180-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_075943_914726_100A8B9C 
X-CRM114-Status: UNSURE (   7.11  )
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

On Fri, 22 Nov 2024 16:46:35 +0000, James Clark wrote:
> Since the linked fixes commit, these masks are already shifted so remove
> the shifts. One issue that this fixes is SPE and TRBE not being
> available anymore:
> 
>  arm_spe_pmu arm,spe-v1: profiling buffer owned by higher exception level
> 
> 
> [...]

Applied to fixes, thanks!

[1/1] arm64: Fix usage of new shifted MDCR_EL2 values
      https://git.kernel.org/kvmarm/kvmarm/c/d798bc6f3c17

--
Best,
Oliver

