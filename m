Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BF6C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 20:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2GBzGhqm8xTiIIDgff/39cZhRTjWobzxl7Bo1QUcT8=; b=k8D6aMT6W0cR8IdAWogbKNYGj7
	QF0ZPtCdbLLpKraM+m+wF4ulCc46kHoOmkNgZi0q5VYlUMopNOwUnADb46HZIOz2x3yIpcj42k8aV
	ymKI3YTw9s00FeJBM1i6ZOZRE4wT3JAcxRmvUdif1sIUM7ilMBHdjAYCxuQ5t2K71gIFeZSM7rbvg
	60I9RTghGtzxvSk5ZRJdEC8ejuQeDnHgZOkaC/aFOl4ZQFezHHPzdB+3dd1xoHxUhFjNYS85lktYB
	I4WljpTrH6mYQ6qI24Ftw77h8om4/dvdgA7x8Zr9mWQ9txdN7wOx8mfd1EGrHXwsQ4BQ9tY99LUft
	R8suZkHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyG4v-0000000EFD5-2sSH;
	Fri, 28 Mar 2025 20:13:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyG0k-0000000EEsl-0OHj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 20:09:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7EDBF5C137A;
	Fri, 28 Mar 2025 20:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EC3C4CEE4;
	Fri, 28 Mar 2025 20:08:58 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	oliver.upton@linux.dev,
	maz@kernel.org,
	Jinqian Yang <yangjinqian1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wangzhou1@hisilicon.com,
	shameerali.kolothum.thodi@huawei.com,
	liuyonglong@huawei.com,
	jiangkunkun@huawei.com,
	yangjinqian1@huawei.comm,
	xueshan2@huawei.com
Subject: Re: [PATCH] arm64: Add support for HIP09 Spectre-BHB mitigation
Date: Fri, 28 Mar 2025 20:08:56 +0000
Message-Id: <174319246800.4193737.16068593925893722302.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325141900.2057314-1-yangjinqian1@huawei.com>
References: <20250325141900.2057314-1-yangjinqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_130902_186991_A95A43B8 
X-CRM114-Status: UNSURE (   9.24  )
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

On Tue, 25 Mar 2025 22:19:00 +0800, Jinqian Yang wrote:
> The HIP09 processor is vulnerable to the Spectre-BHB (Branch History
> Buffer) attack, which can be exploited to leak information through
> branch prediction side channels. This commit adds the MIDR of HIP09
> to the list for software mitigation.
> 
> 

Applied to arm64 (for-next/core), thanks! Please check that I added it
in the right place as it was conflicting with the current for-next/core.

[1/1] arm64: Add support for HIP09 Spectre-BHB mitigation
      https://git.kernel.org/arm64/c/e18c09b204e8

-- 
Catalin


