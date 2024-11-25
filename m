Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D20CD58D5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 15:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JxCpXxp9/Ryyxa5pKJdYKh+TQiGVzBW9sguu6l6duPE=; b=pSViJ0EOKn03pJMOtUEUWo1dsS
	sQvAZNEO+nnViH35UNfsVUKGEIS1Fo5+0Z0YRH6tkltzLxvXSU1l9IRnLtFi0ln4ZHKBWmKf/GxIK
	Ty9qi24SD76B6usMVpq4nBgv9Y0FksU0w+g/gdWB7CUPyWukheO5Np1N4g4LQUzny2mnDaqnfDC/u
	MAgf6Byrof1UIYid0gI0hX7rB7wFZeypzET+CcP8N9czppCEbpJcRIEuyhOjVHpamu5nE+fwiHzZl
	9JTNyG87oHnvk68W3EJJGRWt2rCMd98V7wwXFpoJgef9SwBeRXX7oloSu59fBQ+iWfBnxGVlqVLeW
	Z4m+oJSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFaZ8-00000008N2Y-2wyI;
	Mon, 25 Nov 2024 14:59:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFaYA-00000008Moj-3XEp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 14:58:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 177BF1692;
	Mon, 25 Nov 2024 06:59:23 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B7D983F66E;
	Mon, 25 Nov 2024 06:58:50 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	sudeep.holla@arm.com,
	guohanjun@huawei.com,
	gshan@redhat.com,
	prarit@redhat.com,
	Jonathan.Cameron@huawei.com,
	dwmw@amazon.co.uk,
	ardb@kernel.org,
	hagarhem@amazon.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nd@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 0/2] small fixes when boot with acpi=force option
Date: Mon, 25 Nov 2024 14:58:46 +0000
Message-Id: <20241125145848.506347-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_065854_919490_841EB147 
X-CRM114-Status: UNSURE (   7.33  )
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

When acpi=force option is used, the dt should be ignored whether it's
invalid, passed from command line or from configuration table but it
doesn't so it produces error message
while scanning dt early time thou it isn't used in booting process.

Change to ignore dt when acpi=force option is used.

Yeoreum Yun (2):
  arm64/acpi: panic when failed to init acpi table with acpi=force
    option
  efi/fdt: ignore dtb when acpi option is used with force

 arch/arm64/kernel/acpi.c           |  2 ++
 drivers/firmware/efi/libstub/fdt.c | 10 ++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


