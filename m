Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED1BF9D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 14:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXlCjNgy9Q44YmPQyq4IBlhPormKX0z6YOu/yV00TXk=; b=3bFpHdgk+GingnlS2+Jc24JzAo
	rfUPWQ5S4/lVnq2qkONOFM82WN0wd2EnIfc7/njEmG7nWQKHYqzAOC3imC3u8/KFsouYl7F7+dzkM
	73NYnL4Ei1/tbJ4H4atIUwSnRFHXJMquYyzXQSTqBPjWY8jVFVIiOoFDW8+7Vd00k0kzZ0PHD7o+j
	tWwIRykQx5wKffiQZ+Wm4XzI90RVy/awe/ou0sAeA1ORcUByNcVI2XauaINfEWsFSg0R2Em69MlHT
	6nQMAPlrXFfiFQQkISYSdMqE/4Rx7Q1uu62UcIDmRZkqioxAx0Wcxx1G7uQMba6JsXKv9rajKcNPS
	bWc0B1Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCeSx-0000000HQkw-1Z7O;
	Tue, 14 Apr 2026 14:10:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCeSu-0000000HQkS-3Gjm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 14:10:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00EAB419DF;
	Tue, 14 Apr 2026 14:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284F7C19425;
	Tue, 14 Apr 2026 14:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776175807;
	bh=ujt1Wt+EHyK45REV4tnk5H2K0RDbN6WthFKYktWz0aQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tntm/tJV0yEUAmNgCeT7BuOsltvC61vjKBGdC9Ru9fWVc9t1sXyHHm7lXxaSRlOw9
	 PXe+G52WHGeCNJu9w/WUOv0pe1B5Ki1ijmSQxEwJkoDJUbV7lSCKrN+AaYjwkL8AHT
	 mwuURbkwx+nV+kNLCCtWn0AqnCzxSvrFpubEEDx3heMp2PCuuJ6erh1iL15ToY50yM
	 Eb49z+eP5VqH7u6iuk+gQcGLZl/WCdLm9ytvCUWIVBg+Hh+DlVG+pe/Gydn4pZLzp7
	 BwPvzjizpvySwWrFmG3+Ngct9gaZLQoI1Mh6hlKI4BSTOlWfdQVU4hundoNpPRM+0m
	 ttKXmL3on20xA==
Date: Tue, 14 Apr 2026 15:10:03 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: "lihuisong (C)" <lihuisong@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, Len Brown <lenb@kernel.org>,
	lpieralisi@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	pjaroszynski@nvidia.com, guohanjun@huawei.com,
	linux-arm-kernel@lists.infradead.org, rmikey@meta.com,
	kernel-team@meta.com
Subject: Re: [PATCH RFC] ACPI: processor: idle: Do not propagate
 acpi_processor_ffh_lpi_probe() -ENODEV
Message-ID: <20260414-excellent-hidden-dodo-5bb98e@sudeepholla>
References: <20260413-ffh-v1-1-301704f69e2f@debian.org>
 <af9c679d-899c-4832-b902-e621b5987f12@huawei.com>
 <ad4UWJ__dnDQtrj8@gmail.com>
 <6694ca7c-13bf-4e7d-9621-bc992cbf96a7@huawei.com>
 <20260414-cute-shapeless-dolphin-c5b2fc@sudeepholla>
 <ad48gItCwrC-ar34@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad48gItCwrC-ar34@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_071008_838345_A500CA9C 
X-CRM114-Status: GOOD (  16.97  )
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

On Tue, Apr 14, 2026 at 06:14:19AM -0700, Breno Leitao wrote:
> Hello Sudeep,
> 
> On Tue, Apr 14, 2026 at 01:25:53PM +0100, Sudeep Holla wrote:
> > So while I understand that the kernel did not report an error previously, that
> > does not mean the _LPI table is merely moot on this platform when it contains
> > only a WFI state.
> 
> Can you clarify whether datacenter ARM systems are expected to expose
> deeper idle states beyond WFI in their _LPI tables?
> 

Of course any system that prefers to save power when its idling must have
these _LPI deeper idle states.

> Backing up, I'm observing 72 pr_err() messages during boot on these
> hosts and trying to determine whether this indicates a firmware issue or
> if the kernel needs adjustment.

I consider this a firmware issue, but not a fatal one. What matters more is
the behavior after those errors are reported.

If you force success, either through your change or through the PSCI approach
suggested by lihuisong, then in practice you are only enabling a cpuidle
driver with a single usable state: WFI. That is not inherently wrong, but it
also does not provide much benefit.

When the idle task needs to enter an idle state, it will ask the cpuidle
framework to choose the appropriate state. In this case, however, the
framework has no real decision to make, because the only available state is
WFI. If that is all the platform can support, then the same result can be
achieved more efficiently without registering the cpuidle driver at all, by
falling back to `arch_cpu_idle()`, as I mentioned earlier.

-- 
Regards,
Sudeep

