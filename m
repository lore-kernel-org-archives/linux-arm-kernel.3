Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBBCCC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXXgGLmTCc87ALGVvkk6qcqz1pQ93/PQ6vEFDcP7yi8=; b=QuXviEJ2U10HzwvtRFkT40jOe9
	6gmeXCv4lvUvzpAp5/sYk3zTxZvMo45yIM9KkqkGZ4ePr+Sdkf7xbSEPKZsX95LwM/dVVmqVupE94
	dq46DPpSE8OqtiHBbUAh+EJio5Ulufj8+W5Vll3k+nl+8FNHj4UTY5fDC2lOONhDZa0Rez7xDCLmw
	ZuFaJ5zh5wdxcY6AifmLG9jRrr8MEaeKJiIMEtcj+0KbOqeOg7xPayW6z2azkEVLXDv0x8RrSSvoc
	+iXN8URHnSYgRpec5lhR+VovKYhEEP7RUaDcnwtnNEpH2d2s7nZMhac1srTpTLiGCHsIOBd02CbMW
	gciC3hzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZX4-0000000CXBL-1hiG;
	Tue, 13 Oct 2026 10:14:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZX2-0000000CXAT-0hsl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 10:14:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A3D5169C;
	Tue, 13 Oct 2026 03:14:48 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64E243F7B4;
	Tue, 13 Oct 2026 03:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791886491; bh=6R0ZVcgI1vecdTgXYMbd5IpM7bGkwKNFlhxOFBr5xeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hFqV/kmivBi5/zMVd7gjTsB4GBfq86/B+pdmX+faSvuRuxoyj+l3tvAvMJM3ZTxbT
	 ikBNXRFmpwAjL2jn0YhDEWbHy251mlhCBkAH7fG4itGhnD1z4KEyL0OSWv3qdrIzOW
	 67hVUPxaDfoZezDD4yu5gkhO1uNI8hoL5ZLGrgS0=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-efi@vger.kernel.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2] arm64/mm: Treat faults taken by EFI runtime firmware as kernel faults
Date: Tue, 13 Oct 2026 11:14:41 +0100
Message-ID: <179188648181.1426971.9847228389872179682.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013073007.1431719-2-ardb+git@google.com>
References: <20261013073007.1431719-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_031452_251564_BBAEC4F3 
X-CRM114-Status: UNSURE (   7.13  )
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

On Tue, 13 Oct 2026 09:30:08 +0200, Ard Biesheuvel wrote:
> When EFI runtime services are invoked from a preemptible kthread, the
> kthread runs with efi_mm installed via kthread_use_mm() and preemption
> enabled, so neither faulthandler_disabled() nor !mm applies in
> do_page_fault(). A permission fault taken by the firmware on one of its
> own (TTBR0) mappings then hits the 'access to user memory outside
> uaccess routines' check and oopses, without efi_runtime_fixup_exception()
> ever being consulted.
> 
> [...]

Applied to arm64 (for-next/efi), thanks!

[1/1] arm64/mm: Treat faults taken by EFI runtime firmware as kernel faults
      https://git.kernel.org/arm64/c/171be684bfa3

