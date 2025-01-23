Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31CFC02181
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 01:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/AgXN5KjTnN4GZLmYoXIn9AvgzsPCE77QNdzB5vhL4c=; b=q8VFHY5EBesrx7IN8IhGkOmJxp
	yXO5SzHkPI2whWvDzWy3WCFLi/9dUSRfw6dO22mr7i8qOwowyDv3a7oQyT2+KXXMr0emq9IVspnFV
	5ooAQp8E6fDcwPrlpGxtjUiHvrB3Y1SBJ3xo8bYxyecSYmFj2kCr56XY96l8BCB24CBePUa7cZ12R
	ejUkE1qDLlpt+duKgvHxwbZIJ2TYfNGlHbN4r+jE6D5rbgV+uhFDK3wMdcSmArCodEKaknoefx/fR
	jQFx7JnOj1rzdah4X8tXS6HdkorAJOEdqQbgJtA4IxiuauIj3hyI6LIex+NETR1QAJ9w93nwPdW0e
	Nf9yDz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tamL5-0000000BXPf-1UC8;
	Thu, 23 Jan 2025 01:48:59 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tamJm-0000000BX4i-3x55
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 01:47:40 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id A074B204608D;
	Wed, 22 Jan 2025 17:47:37 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A074B204608D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1737596857;
	bh=/AgXN5KjTnN4GZLmYoXIn9AvgzsPCE77QNdzB5vhL4c=;
	h=From:To:Cc:Subject:Date:From;
	b=XQ1bX/Rk/xz8YWValTiiIbsu1Jp4sp5TYA8tMyWhZREOMFS0OKyawOUDaOO9Zcvq/
	 BCJ4jSq2qUfTFVy/8Ur80p5Q3P7AIOrBZFxEcvr0I+b9hhl4gNKdA9bldJG1no6csv
	 GPdIKUqNggnJ5iZFe8RIh2mHY0JUdzkhgy4VW8VE=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	wei.liu@kernel.org,
	mhklinux@outlook.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	arnd@arndb.de,
	jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com,
	mukeshrathor@microsoft.com
Subject: [PATCH v2 0/2] hyperv: Move some features to common code
Date: Wed, 22 Jan 2025 17:47:29 -0800
Message-Id: <1737596851-29555-1-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_174739_005399_34188536 
X-CRM114-Status: UNSURE (   9.66  )
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

There are several bits of Hyper-V-related code that today live in
arch/x86 but are not really specific to x86_64 and will work on arm64
too.

Some of these will be needed in the upcoming mshv driver code (for
Linux as root partition on Hyper-V). So this is a good time to move
them to drivers/hv.

Signed-off-by: Nuno Das Neves <nudasnev@microsoft.com>
---
Changes in v2:
* Fix dependence on percpu output page by using a stack variable for the
  hypercall output [Michael Kelley]
* Remove unnecessary WARN()s [Michael Kelley]
* Define hv_current_partition_id in hv_common.c [Michael Kelley]
* Move entire hv_proc.c to drivers/hv [Michael Kelley]

Nuno Das Neves (2):
  hyperv: Move hv_current_partition_id to arch-generic code
  hyperv: Move arch/x86/hyperv/hv_proc.c to drivers/hv

 arch/x86/hyperv/Makefile                  |  2 +-
 arch/x86/hyperv/hv_init.c                 | 26 -----------------------
 arch/x86/include/asm/mshyperv.h           |  6 ------
 drivers/hv/Makefile                       |  2 +-
 drivers/hv/hv_common.c                    | 23 ++++++++++++++++++++
 {arch/x86/hyperv => drivers/hv}/hv_proc.c |  4 ----
 include/asm-generic/mshyperv.h            |  5 +++++
 7 files changed, 30 insertions(+), 38 deletions(-)
 rename {arch/x86/hyperv => drivers/hv}/hv_proc.c (98%)

-- 
2.34.1


