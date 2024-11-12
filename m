Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E5CD42BA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1l2Qf86YYFy2MagtsikZ2lvvIibC5iD53/O2ysKpC4=; b=PVOV+mjtLG7r/uWLGwuVJmKbdn
	npSNlB6EAgjCawSBzyowRqXdSMOnMX0//p9rU/gFiyfgB3spgZl+Evg8XRzZk0rN+iTxUalfPtm+2
	0jFiJa7HUq1P3Km6srYAcAoJnuu8ZEuts8uqV6LslX/pcg3H8UtE7VjxWf3B4+z0DUJxd5/i9THcD
	99C646DFTGKm7V3bFAm0rSjLtlVNTZVtDvdsAOIBbtYwANmqrD9QCg02QTYXtwNpHsMuU3I7JGtJl
	Z08FP81Uy4fsUw1Chq6Iw8zvYSzJv4Z4+bRL1L2drixAwU7Qr+hBWoBv77DcogLOWp7ooPXzPmCE3
	Pa81SFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtjZ-000000048bY-3cBY;
	Tue, 12 Nov 2024 16:27:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtTQ-000000045Zg-2YZe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9AA92A41E25;
	Tue, 12 Nov 2024 16:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CFCDC4CECD;
	Tue, 12 Nov 2024 16:10:32 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Min-Hua Chen <minhuadotchen@gmail.com>
Cc: Will Deacon <will@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] acpi/arm64: remove unnecessary cast
Date: Tue, 12 Nov 2024 16:10:29 +0000
Message-Id: <173142780465.896456.12212628053726419059.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240917233827.73167-1-minhuadotchen@gmail.com>
References: <20240917233827.73167-1-minhuadotchen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_081036_733686_13ECF42C 
X-CRM114-Status: UNSURE (   8.08  )
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

On Wed, 18 Sep 2024 07:38:24 +0800, Min-Hua Chen wrote:
> DEFINE_RES_IRQ returns struct resource type, so it is
> unnecessary to cast it to struct resource.
> 
> Remove the unnecessary cast to fix the following sparse warnings:
> 
> drivers/acpi/arm64/gtdt.c:355:19: sparse: warning: cast to non-scalar
> drivers/acpi/arm64/gtdt.c:355:19: sparse: warning: cast from non-scalar
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] acpi/arm64: remove unnecessary cast
      https://git.kernel.org/arm64/c/f95382d73ec8

-- 
Catalin


