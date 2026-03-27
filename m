Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A254E10F2846
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 15:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXE/MMx0uspFWIA7+vc5yZepzmHZLk/t7ZU20s4vGXU=; b=32hijIhLKd+jvn78Ee38qn0erK
	+q+wFbv9cbvaPcHIENmr1W77QluDcKtSAobtGXiVz4dRWBvtrRGwZpA9a1AVwuTIxZeR+0zHmfUQy
	981rSa3sqRMD2mxlItdmAuA88DAl/JtaIRJbxFJx7SYbpO0RnOTZloLimVSW31ygJI0aliFY9Gfvr
	UJ9L+e02Gnyr/zrmnMCjakZ3fQCEI8NYNgmUc02GDR22OB2jCh08cOeDwdsda+ZPDNaHfJcmbvTWY
	RO+KthD2bQtMWACX5z95XqXRAxzUojCMw8smFtuJmcI1TuKBwdf22QrE0a7br9t/ZkeHNmQNP0DbQ
	Is4t2+wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69Lv-00000007i1b-1Qon;
	Fri, 27 Mar 2026 15:44:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69Lt-00000007i1G-3Cqm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 15:44:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F7D635DA;
	Fri, 27 Mar 2026 08:43:54 -0700 (PDT)
Received: from [10.1.196.96] (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FC413F99C;
	Fri, 27 Mar 2026 08:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774626240; bh=fXE/MMx0uspFWIA7+vc5yZepzmHZLk/t7ZU20s4vGXU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pQwBST6pz7nGtDPhVdMnNALUQEZ94wtULP23dBhrMtku0oTJxCUoWxhDttFy/aGE2
	 4oj1qXg2dySXUmgwRgjjvOMc2PuLIs7RKPl6khpDGBGuQnUwLX9OtCHiTAN6laLIet
	 EHbCSPeejkvicgScGMfBbJwRB8MQwjD+v70FvM6k=
Message-ID: <f310e638-900e-42ec-adcf-6b42c30d9caf@arm.com>
Date: Fri, 27 Mar 2026 15:43:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/40] arm64: mpam: Drop the CONFIG_EXPERT restriction
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-9-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260313144617.3420416-9-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084401_847573_C6977E6B 
X-CRM114-Status: UNSURE (   5.83  )
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

Hi Ben,

On 13/03/2026 14:45, Ben Horgan wrote:
> In anticipation of MPAM being useful remove the CONFIG_EXPERT restriction.

Useful - ha! I've added a second paragraph describing why this was done, just
so it doesn't look odd in 5 years time.

| This was done to prevent the driver being enabled before the user-space
| interface was wired up.



Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James

