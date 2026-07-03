Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C473C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tFkhV9y3YSpG7ZFQq6X18e4oKX1Jy1S3KYwLSR0WpE=; b=fgZ+uIa6utVxSN9aXjCeesPYEx
	YOga8WT50PhkEjjBxVqs2Sing1ZVv2ogI9uziXyqzyjFfpHecaGQVtoJH3WPyazk0KiTilNAWewZX
	TZxnGmVSgKAA3x8WH88VSbmNKWXl7+sjh7aQeXKR4aejVAb0oyt3Tgqmzl3cJgyzmBV4Bm9ay6gdy
	1AAfFT8j44pPhUT3NM5ieqcgC3mqb6MzBpjf6wudrCh7o9xiw9UCMozXDcSS042mwmDZUFMwGx8s+
	/ia8m+6uTSgRA6NmOcFIhPHbXe0U9NcW+weaJmlfEnKLcIG9BA3xgb1YrqON5e9GxVQt/wPLrpk1f
	5Se55bUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfgBE-00000007Rzd-173E;
	Fri, 03 Jul 2026 15:51:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfgBC-00000007Ryr-3YCx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 15:51:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EBB0960051;
	Fri,  3 Jul 2026 15:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361A11F000E9;
	Fri,  3 Jul 2026 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783093909;
	bh=3tFkhV9y3YSpG7ZFQq6X18e4oKX1Jy1S3KYwLSR0WpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S1W87LOQhTm4vC9qjjU6evSDA7cIZuPkpXGHrVl4l/Y2SBeuvoH3TBVUAYI6gg35B
	 VMDwmFQDailxQp2+c++0GbmJHxuzaTy2XN9S6wp83hs4sHDycopFzFEGVwUjMObiUT
	 Je63NveeqJD6Bam9yHz6UZ0bTDCVl+eHpKGJeEkLKBIr4CyfnngUwG0MCmPLcc6/4h
	 yYOYIyfExN+aPu8V3GrcFy8GRZPzFJMaCxni28KSWA1qdJf88B3BNZpkckITHIPCoh
	 KkZzB4kXLBDry3iqhIgrM+IQPgQdLa6f1pP+eq1R4oAkPxZVWlMrXwRqEHg1yYZr22
	 9/n+cUnD34acg==
Date: Fri, 3 Jul 2026 16:51:43 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: Disallow disabling boot CPU based on config
Message-ID: <20260703-competent-adaptable-coot-f8daaf@sudeepholla>
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
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

(It is always good to cc all PSCI maintainer for any ARM64 CPU
hotpug/suspend related changes)

On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
> The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
> the SoC to ACPI S3 similar state where SoC is turned off and DDR is
> retained. The hardware design on these SoCs forces a constraint to suspend
> and resume the system on boot CPU / CPU0.
>
And you fail to explain why they have that constraint.

Is it because some secure context is not allowed to migrate ?

We already have a mechanism for that in place and this hack is not at all
required.

-- 
Regards,
Sudeep

