Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F02D1BDD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAsAUmXtgmWa22yqkmvhyqE2wD2mR+iQbhLSHOCO6K8=; b=kVGshozzr4Mz1BUWtzlAVbrQeH
	PnRaEl1GCN46QnR7qz8TOhuAIHQC1oT0Q6TM3DOZTO0YF5HkE/Yzv7UyV6le4EEquS+eg/XKZtqKM
	9BIRS5DdfLh9HG3LA2fs/G4Jhb2HTanVhgHTMmrnJGHSSENOzsAWMSW7mRSTyl6MvDG/7c++ZJHeF
	vOc/Dmc71iJCEKVcYvVXZ0KS4/ep2ElKwtk8PXOkTIsSEAhTypgsdwd2SCj4KW1gvi6IanorgeyQK
	g28cTIic4df40JOa8SAlAMBRuAc2TiuweA1Lz+YqBrrtBxN/mAyIHKo60C3AW1riiQeDF/pUm8Uzc
	eoijE18w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t819l-0000000EaIl-3sD3;
	Mon, 04 Nov 2024 17:46:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80b2-0000000ETbu-26aq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 17:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8D64EA4318A;
	Mon,  4 Nov 2024 17:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD02C4CECE;
	Mon,  4 Nov 2024 17:10:28 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: lpieralisi@kernel.org,
	guohanjun@huawei.com,
	sudeep.holla@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	rafael@kernel.org,
	lenb@kernel.org,
	Zheng Zengkai <zhengzengkai@huawei.com>
Cc: Will Deacon <will@kernel.org>,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ACPI: GTDT: Tighten the check for the array of platform timer structures
Date: Mon,  4 Nov 2024 17:10:26 +0000
Message-Id: <173074012623.2444105.8147260766565910600.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016095458.34126-1-zhengzengkai@huawei.com>
References: <20241016095458.34126-1-zhengzengkai@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_091032_625949_AA0EC16A 
X-CRM114-Status: GOOD (  12.43  )
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

On Wed, 16 Oct 2024 17:54:58 +0800, Zheng Zengkai wrote:
> As suggested by Marc and Lorenzo, first we need to check whether the
> platform_timer entry pointer is within gtdt bounds (< gtdt_end) before
> de-referencing what it points at to detect the length of the platform
> timer struct and then check that the length of current platform_timer
> struct is also valid, i.e. the length is not zero and within gtdt_end.
> Now next_platform_timer() only checks against gtdt_end for the entry of
> subsequent platform timer without checking the length of it and will
> not report error if the check failed and the existing check in function
> acpi_gtdt_init() is also not enough.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] ACPI: GTDT: Tighten the check for the array of platform timer structures
      https://git.kernel.org/arm64/c/263e22d6bd1f

-- 
Catalin


