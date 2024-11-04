Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E31D1BDD6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJy2KVyckJ5IOoc7Q8jWOElKjq4GVFCKWXt1IDOc5NY=; b=xKAP3HDHQFBLwZPSB0noo1VTBB
	TPuIXMXv0Crk5iozn3MrVwOaVHs8p6B7nVg61pbIv5+LK052xVz/uQ6zHpUItdc2uGTVnGlxDQNeF
	eBTyBKJgEA4vn5XJbfECqWXxTfAjO2JyWb56W4CVjp3hlhRD7TuhPfr45W6+qR0XycbmftyCVQ/yO
	jX9eStlPFOCMPjfi/KHTvKtfGvwtaIStzHqMBJIRe25KxDp4TGIa+EjnkRfb3t0aLBJULxSvzG1Uk
	rwjRAmV6QO7x5Mcy9Q6rp/GZeMnJyG/MFXVgRegTknh/7ahyflOk2m7BcH4y/mOH7oD+FKC7i5/M5
	hYxHhVrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t81K3-0000000Eca2-2Mko;
	Mon, 04 Nov 2024 17:57:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80tY-0000000EX8a-1g6N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 17:29:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 79B26A431E3;
	Mon,  4 Nov 2024 17:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47A9C4CECE;
	Mon,  4 Nov 2024 17:29:36 +0000 (UTC)
Date: Mon, 4 Nov 2024 17:29:34 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: will@kernel.org, maz@kernel.org, mark.rutland@arm.com,
	broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
	oliver.upton@linux.dev, ryan.roberts@arm.com, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com,
	prime.zeng@hisilicon.com, xuwei5@huawei.com,
	wangkefeng.wang@huawei.com, yangyicong@hisilicon.com
Subject: Re: [PATCH v4 5/5] arm64: pgtable: Warn unexpected
 pmdp_test_and_clear_young()
Message-ID: <ZykEfotHgCzhj6Xs@arm.com>
References: <20241102104235.62560-1-yangyicong@huawei.com>
 <20241102104235.62560-6-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102104235.62560-6-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_092940_516678_75FD2B77 
X-CRM114-Status: UNSURE (   8.35  )
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

On Sat, Nov 02, 2024 at 06:42:35PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Young bit operation on PMD table entry is only supported if
> FEAT_HAFT enabled system wide. Add a warning for notifying
> the misbehaviour.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

