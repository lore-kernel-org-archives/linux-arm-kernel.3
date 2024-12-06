Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C50E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 22:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1xuq5MaOVXzbbaRlB1GdkyoZlSh1Oy8sKqF7zlVU32A=; b=g2h35esllTvHnMS13cWNX98+xI
	8Tn9ZF0j4AVfNy417Gsmz1E0nAejScS+rdys06WeuhF2EVLcPx7irqOaSiaqLuxYiZHHTYxiY/Cx8
	iL+Lr6Sf8WIutcA/APgYYXQZgyhihoQsN7qLUH/5pw8VwxOMT5BwBaOnhXMgDZYobgxWzCmWEsej1
	UIyJsXpEjpVeznYHN7wdixlLXmosFBgG+mNrQl+q6DPBgvONxIUIwUKB7zBYsYsv+6DrJgVuLtReW
	jZAEcqT6GARR7je+x5a1B43K0T+CRodSlCkc93UkpDNtcc8Ns2zQP8FchFqUNqFOQ/fvn2r1xaKYY
	EQaIsl4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgkK-00000002teH-3L3N;
	Fri, 06 Dec 2024 22:24:24 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgiI-00000002tFl-27sr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 22:22:20 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1F73B20ACD7B;
	Fri,  6 Dec 2024 14:22:17 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1F73B20ACD7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1733523737;
	bh=1xuq5MaOVXzbbaRlB1GdkyoZlSh1Oy8sKqF7zlVU32A=;
	h=From:To:Cc:Subject:Date:From;
	b=H/npKA8Rnh47xTBuMa+7BCp4sE2qXydsl8gaqrpBn92P5i6aocUMlsuCaYEs5RQvd
	 3CmReQkLH6fWI9+iBIa/YVtntG1IwD2BAz/ZtUPwWjKUioRxJoL/apEkGWz8oGQJd6
	 rDWOJcfhoixugN4fgn+ehTaiVqjg7X/ZGzyQDMu8=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	mhklinux@outlook.com,
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
Subject: [PATCH 0/2] hyperv: Move some features to common code
Date: Fri,  6 Dec 2024 14:21:45 -0800
Message-Id: <1733523707-15954-1-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_142218_562853_0BB8BD28 
X-CRM114-Status: UNSURE (   7.95  )
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
them to hv_common.c.

Signed-off-by: Nuno Das Neves <nudasnev@microsoft.com>

Nuno Das Neves (2):
  hyperv: Move hv_current_partition_id to arch-generic code
  hyperv: Move create_vp and deposit_pages hvcalls to hv_common.c

 arch/arm64/hyperv/mshyperv.c    |   3 +
 arch/x86/hyperv/hv_init.c       |  25 +----
 arch/x86/hyperv/hv_proc.c       | 144 ---------------------------
 arch/x86/include/asm/mshyperv.h |   4 -
 drivers/hv/hv_common.c          | 168 ++++++++++++++++++++++++++++++++
 include/asm-generic/mshyperv.h  |   4 +
 6 files changed, 176 insertions(+), 172 deletions(-)

-- 
2.34.1


