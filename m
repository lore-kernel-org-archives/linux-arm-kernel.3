Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20DDC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 12:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxhMlPfGGQNcv2eDEp3w8gErSrEM6AUyRUq0al7rIKo=; b=NSfQ0JRJbPptjMs/hx3Kj7IV/i
	KU2ylVgTa2Bs5Jwcv72kpg+gdBxdGvtKkxuEWS+cPD4Z4IC/932kQJIxgKA82qRtU1awQ5yxE0gZH
	QZx9B/zDWnShNtKpzW8YRgAjx170hCR2R3vNMljqYhaGjnTFjxBjZkPpsJRyhq96CQDFJSs1PkVJC
	xGBHnTzqqXXZvbB7zUj6iHafBjRuJAjr6pKYggHb4x0U1AGnlGKMKawizm7izyyk3pNSjeasC0Ydx
	HnIQNJ0gk0gSjWgGmRHRYway7KU9Pb1YMn93MsZZbh6VBIVTgleLTsJc2xOaiPz6IY+dAvMfQ7MuT
	D0BDox2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM44I-00000007L4B-3ncn;
	Mon, 02 Jun 2025 12:15:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM427-00000007KtV-1fUc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 12:12:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 326AA12FC;
	Mon,  2 Jun 2025 05:12:27 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AA313F59E;
	Mon,  2 Jun 2025 05:12:42 -0700 (PDT)
Date: Mon, 2 Jun 2025 13:12:39 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Will Deacon <will@kernel.org>, Qu Wenruo <wqu@suse.com>
Cc: linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
	rafael.j.wysocki@intel.com, jonathanh@nvidia.com,
	ulf.hansson@linaro.org
Subject: Re: Kernel crash on boot, arm64 VM
Message-ID: <20250602-solid-coot-of-karma-cfea5e@sudeepholla>
References: <17fc594b-b80b-4918-8945-4aef35dc9c94@suse.com>
 <20250602103521.GA1134@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602103521.GA1134@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_051251_475087_F0D36FBC 
X-CRM114-Status: GOOD (  14.18  )
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

On Mon, Jun 02, 2025 at 11:35:22AM +0100, Will Deacon wrote:
> [+Sudeep]
> 

Thanks for adding me.

> On Mon, Jun 02, 2025 at 10:00:38AM +0930, Qu Wenruo wrote:
> > It looks like there is a regression related to the device tree/acpi parsing
> > in the latest upstream kernel branch.
> 
> I've kept the crash log below, but I suspect this is due to the __free()
> cleanup path in dt_idle_state_present(), introduced recently by
> 5836ebeb4a2b ("cpuidle: psci: Avoid initializing faux device if no DT
> idle states are present").
>

Hi Qu,

Do you also have this commit ?

39cdf87a97fd ("cpuidle: psci: Fix uninitialized variable in dt_idle_state_present()")

Just trying to see if it is same issue or if this something else even
with the above commit included.

-- 
Regards,
Sudeep

