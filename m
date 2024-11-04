Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE738D111BA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 08:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P594FfHFIvsXMOwGReb27v+hwrq26dJJ42raaIcoDpc=; b=kkW+Kn9fNpE+Pj1/VFd47liAnE
	zzTpPJVX5tG7Xb8/MqPtHmrbGeNzZye4MXwTd4d6KKxeNGAHOtioLMoJFXJUvUkh+XvvpTWzQFDRA
	taXfZZRRtu4FaQoXFTDW3mHbDn9L2L5cX/hUyiKUynyiFxF4RYLD3/GbxPSWsM42tUAspcW7cKbbj
	6Ox4zW0qhnv4SD2mJZXdKYs6iXI9abBVIuiYy6L4Lm60XvkyrouGA6V63Hw5Z0iyCFN17GqMnVa5Y
	ANHcJ5JiXnEeH56zgeac1OUIYYu+ep63nxCTNXJf/dKtK6OJ1vvY4U7HqtXFlJfHS3zYfCJRAyVpJ
	eWcoQ9pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7s1U-0000000Cuj9-0LeE;
	Mon, 04 Nov 2024 08:01:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rzl-0000000CuQq-4AOM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 07:59:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D90AEFEC;
	Sun,  3 Nov 2024 23:59:56 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 441EA3F6A8;
	Sun,  3 Nov 2024 23:59:23 -0800 (PST)
Date: Mon, 4 Nov 2024 08:58:49 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vanshidhar Konda <vanshikonda@os.amperecomputing.com>,
	Sumit Gupta <sumitg@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	ionela.voinescu@arm.com, sudeep.holla@arm.com, will@kernel.org,
	catalin.marinas@arm.com, rafael@kernel.org,
	yang@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com, linux-tegra <linux-tegra@vger.kernel.org>,
	Bibek Basu <bbasu@nvidia.com>
Subject: Re: [PATCH v7 3/4] arm64: Provide an AMU-based version of
 arch_freq_avg_get_on_cpu
Message-ID: <Zyh-uVSW-0d0r8oB@arm.com>
References: <20240913132944.1880703-1-beata.michalska@arm.com>
 <20240913132944.1880703-4-beata.michalska@arm.com>
 <aa254516-968e-4665-bb5b-981c296ffc35@nvidia.com>
 <ZvU4mR_FZa7jXUgk@arm.com>
 <ylcfqw4swz6xjxxfoyljyifs4ibbueywogqxusxfz3a3fgh3du@cfaajchbwgvn>
 <Zv8PKlr_PJgxazro@arm.com>
 <5y3yz2ct2o42c53dc6rwpse3andstjx74lowt2b3hohj4ogbct@nu2szdnxvxid>
 <Zwe1p0La_AFknglf@arm.com>
 <20241029065319.zto3wlvceec3fjym@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029065319.zto3wlvceec3fjym@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_235930_107651_21D42E25 
X-CRM114-Status: GOOD (  13.62  )
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

On Tue, Oct 29, 2024 at 12:23:19PM +0530, Viresh Kumar wrote:
> On 10-10-24, 13:08, Beata Michalska wrote:
> > That is a fair point but I am not entirely convinced using '0' instead makes
> > things any more clearer as this is in no way a valid CPU frequency.
> > As long as we document the expected behaviour keeping the interface well
> > defined,  both options should be fine I guess.
> > 
> > @Viresh: what is your opinion on that one ?
> 
> Failing to get frequency for the CPU shouldn't be represented by 0,
> even if it is confusing for the user.
We still need to decide  whether provide a more descriptive way of informing
about such cases (whether it be 'unknown' or 'idle' ) or to simply return
an appropriate error and leave the userspace with dealing with that.

---
Thanks
Beata
> 
> -- 
> viresh

