Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25486CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4eL8hEk6P4gbRoRqXH2ewsh1LlERvvkvMc/X2NMD+8=; b=v6ErwkJTW4ccFb6iFUqlO2Trmd
	pcYzDXjqVd3NzwTSw7YZyeu64KmCXw3CMhN4fq9kVDhvn+FyaVH++ikr+/w3xtjo9g+FTqZcsA6NE
	y0N0lpny2Dys/tLSsQ2HJm3lTKJzIqKZqm6jnQLeMYULUPBcu4s8MZ1jFbbN8ZlHvUAgjBRVKp4ed
	CmmSb9pzX2TzWtJkBLXN2gQh9DfJWvcMrJgZyO73/IEOIP6z/8Si/7zqBhPaLPB7oFlaOrR/i8otb
	Zo6hSK0ZKU+BazDw3UjUldzXbpwM7wDqL9MoOKQy715eRFlWcx3LX7C4UyIUyfkbzQ1PLHni6H+7G
	e62JoOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDYk-0000000Fygt-0D8i;
	Tue, 05 May 2026 11:03:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDYj-0000000Fyg4-36w0
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 11:03:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/4eL8hEk6P4gbRoRqXH2ewsh1LlERvvkvMc/X2NMD+8=; b=MhGxAOQLvWzqNS9qbtwXCwP0sy
	j5ofLD1RtfUSZYnQYMvw6nZkcDMgndbxdIkifKIE3UFqwq3O9y5sm3qYiz1e61f2h523SuisvWZly
	179E1VwimrdzSsyGpXunUwlBrWGP8ZgkSL1sUFqYsDt9cCnzW1SFiJqkqvA1OU0G8/aLePFXr9QrJ
	9TSzR5wFzN8d8f1DCLOz8YgVQhETZiMmPKES+ShDS/yQspdgaJzYGpeYIO/1e7r9crfH9FM4LW7by
	VnPhI+A4K9o9Jisd/CW/zuUBL7lMDFt4JQTFtGNdUhmDT921R8acgjb6YcaauBCBlCG4Dzo7fZUrw
	ZuSvEvrA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDYg-0000000DIZR-11cc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:03:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DF0128FA;
	Tue,  5 May 2026 04:03:11 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBF673F836;
	Tue,  5 May 2026 04:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777978996; bh=PGCQed9Oxq3MqN8uLcSU6BNGwjhEPHA36l4Uy6rY/dw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T4ABxL/9VRAvQ0bFdU+Lqt1Okw9qI1CggU+Z/Ixt2UOvrkyMXWMrsvB8ol+djB0P8
	 nyvo12tZo8tJeOr+cjHTqX6dYzYRTqW4Zl/MuYz5q1B6S347T546TH2J1v5vOw2RqX
	 FvW/8/TPYfTVJHWq/qahpqV5T7pzOKJ0nWCVhkVw=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kees Cook <kees@kernel.org>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Thomas Huth <thuth@redhat.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [PATCH v1 04/12] arm64/sysreg: Add HACDBS consumer and base registers
Date: Tue,  5 May 2026 12:03:03 +0100
Message-ID: <afnOZwB51YLz5e9N@devkitleo>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <afaehWCHVIN7EXNB@sirena.co.uk>
References: <20260430111424.3479613-2-leo.bras@arm.com> <20260430111424.3479613-6-leo.bras@arm.com> <afaehWCHVIN7EXNB@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_120322_561319_9D765C98 
X-CRM114-Status: GOOD (  10.17  )
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

On Sun, May 03, 2026 at 10:01:57AM +0900, Mark Brown wrote:
> On Thu, Apr 30, 2026 at 12:14:08PM +0100, Leonardo Bras wrote:
> > They will be used on a later commit to make use of the FEAT_HACDBS
> > mechanism if available.
> 
> Checked against DDI0601 2026-03:
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>

Thanks Mark!


