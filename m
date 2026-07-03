Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D831AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 21:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nPMkOdgH6vPZv3E0L1/87s6y+9ZPPA8sJI8Ebig5cs=; b=k2iG9pTGKTOFi3uTeCQQaUHBIQ
	Lwl8FhaTeTC8vKLjheDDCk8pmXh1BLLUHf+LNY4W6nXu5VRfZ5xpF6dy7XTRN1EtLqYMloH64ZAE+
	zF5JQPq1QmQJxiZtM1rJn32EWkoea29JOsxydttkVVX76geha5qkBjYyla8wjdbl+0VZZWbOJBuhQ
	GEtl639EHU6Z+IAsKX6d4wmLIICrWdUh3sNqIUqnhjksh4YbHii4NiqMXV1kw7WEENs6+bwdVidLz
	q9ggj2JNoxPUcJlhRbtAOubCO5mESVyNzLAxuvPw1vsuIq+NoaAh0P+yk/tjYYBCVlgFPUTIskWRC
	JsdT60eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfl8k-00000007v9M-3A1p;
	Fri, 03 Jul 2026 21:09:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfl8j-00000007v9E-3mKo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 21:09:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 78A2A43673;
	Fri,  3 Jul 2026 21:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934E31F000E9;
	Fri,  3 Jul 2026 21:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783112977;
	bh=8nPMkOdgH6vPZv3E0L1/87s6y+9ZPPA8sJI8Ebig5cs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=S7HEqDSYehX2rE5vhDX8v14E4SNDupI2Ar+VTfduze3wgDCGmtKl3PY0K7NwFtoav
	 vUyQ6t88vQuJXNk2OXcou2i3wHOKRlgG50hgAMRTrA+ZKyj0znPrtm9taYOMsnqKW2
	 e/p889jsPO4pPy1DGhsJaUbljXoOXkU8cawVP4lzbCAXV8CdQSrFn/kkywUirB0Tb/
	 qdMFAN/OfEac0aIrJFBFPZFsEIUEReLQs7fsUymShyoexqeavoi23EWt8wp8lzgbR0
	 w59zXlXKA3/rCUNZLsZSA6fd8xAkkV7eTNHZAQOJaOzjwCnYxUItdanQl2NeIL3h8/
	 8q6xNCGlumizQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>, Sneh Mankad
 <sneh.mankad@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, Peter Zijlstra
 <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: Disallow disabling boot CPU based on config
In-Reply-To: <akfHIH_dZrr5bosu@J2N7QTR9R3>
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
 <akfHIH_dZrr5bosu@J2N7QTR9R3>
Date: Fri, 03 Jul 2026 23:09:34 +0200
Message-ID: <878q7rlr01.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, Jul 03 2026 at 15:28, Mark Rutland wrote:
> On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
>> +       depends on HOTPLUG_CPU
>> +       depends on SUSPEND
>> +       help
>> +         Disallow boot CPU (CPU0) offline when the suspend_ops->enter()
>> +         has to be executed by boot CPU.
>
> As above, I don't think this makse sense as a config option.

Correct. That's pointless as it can be determined at boot time either
through firmware (ACPI/DT) or if that's not possible for whatever
reasons then a runtime detection quirk which depends on that particular
platform.


