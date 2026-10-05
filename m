Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C389CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J9Gm/BTCAlrmEIT8CdHGZu24+uBtcpyp+USLt6702EY=; b=IL7BB6KFYQ/3SMCcJlH2vMkP10
	7p3Oz4wHHmbU0NLHfMtZvbMGooPqNwialst2XfU1MlOrau43ysI3mSWi/WoYuVGcw7WlZspb1CQfc
	Hpqwc6QIcgL/OGihjq4wihz8CHQetYtXy9Fhfi+tvbEuzU4pVfgMpKeAKSv+DYjI4z4LHRDcRotm3
	mRAXoVrYcP8aE51zJ0VAiypiEl+pvMG7CyFw9zEtyWytZO6+uS6OgIUq9CYR8JlgoiKiraotYr3Em
	kEU4AT6qJbetfQeN9UqyzzZMiTqQjRR57hG3fviCEiOeKW84KlCDatlpsOzIzUzUlMrCe+yF+7koy
	b11pErqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgVa-0000000GIX3-0t7u;
	Mon, 05 Oct 2026 11:05:26 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgVR-0000000GITB-1gn6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:05:22 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a16faefac0so6581165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 04:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791198314; x=1791803114; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9Gm/BTCAlrmEIT8CdHGZu24+uBtcpyp+USLt6702EY=;
        b=kTRN8W1ISaceDTWqDReI3vUOskD8+usH/dDaxUyEBXPn6Xxm+jo6aWY5DFUv19hXwd
         zJm5nkv4BFQvEkquFfOa1YGpfUSku9GGQg5Nk5BRBSY9xC/fby8zWjovEpLzIGRGIMYr
         MWWSzm4/94WlpW0uJWP0DN2LDFdMIgABMYKVRXgvmnU1YArUdYPbn1jtYncw3tYLyaJi
         Pgwkf3ymuoafJjtaxAEiEZutnxVm3PFmY3ZP78VMgvnUT0Hl8psK0zt4gwM9etrEC/jt
         oYSKFQS1XMzSB9GvQY+68R4yEgmOpycO54oiUzGzwRl7oI1SQmtEMbqkm0GkZzQ5noE3
         KHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198314; x=1791803114;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9Gm/BTCAlrmEIT8CdHGZu24+uBtcpyp+USLt6702EY=;
        b=KXXJ3cRTmXXlTswY5K+scBmh5+lWCgXwIxWLL4tI05pTc7gpTYtI3KJiIcMrDATT6H
         K+n612CDXEa8XuR0zhr07qjZe7dkpQCkUHCxrNrJcBRG2CzdjafQ4W4lpZUgRbrK+LZK
         4chTZJYXlT5ja3cvXWnebQLG+bwucLeelEA0E6lFSwAu0Geu2sZ+Q72QyXsqK8HKiDfY
         vGMJpvSvRMOMjxj4qhrSVnRro5zmMxmLQRGW6K2/DKbCL6vGp0QE+TrTXg6tAAa7ApGK
         Lkm/rR5PlcfMBb7V1h3qZ94P9F7LIFb55zIo9H5YMG/yjbB8PLR1kFqtrRyCejv8J4/K
         cCMw==
X-Gm-Message-State: AFuF++kTlUUzyZooMWCB15r6riaeXdjcjbQwatuqdhsSgeK1TuX4O3Ec
	30H6xOfAPx9dnRLDeoNOAD6/n0SmU8S/cjdCAsom8uV/PnyECL8baiSLwrOl93uc0TtDORp3E9D
	nsOZ+84pp4AA2yqm12UOvGGUtedqOGoS25QnyrEUYP00IPmwt/fJa1ZWPIsyDvoQ/qHdCPq0WjT
	Kf1s/VPAXYRL0Sq+d8CqkDcqFDT2ffxsiP5m3/+tFNK+u5
X-Received: from wmph41.prod.google.com ([2002:a05:600c:49a9:b0:4a1:6dc4:df0c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:45c3:b0:4a0:2540:b46
 with SMTP id 5b1f17b1804b1-4a1680e5babmr113687655e9.12.1791198314148; Mon, 05
 Oct 2026 04:05:14 -0700 (PDT)
Date: Mon,  5 Oct 2026 13:05:12 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261005110511.157016-4-ardb+git@google.com>
Subject: [PATCH v2 0/2] arm64: Implement support for BTI veneers
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040517_457278_3ABF68C0 
X-CRM114-Status: GOOD (  13.86  )
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

From: Ard Biesheuvel <ardb@kernel.org>

[ Resending this with minimal changes even though some other approaches
  were proposed as well. [1][2] Neither of those are appropriate for
  backporting, while this series can reasonably be applied to older
  kernels. ]

Recent toolchains will omit BTI landing pads from functions with static
linkage that never have their address taken. If a landing pad is needed
nonetheless, it is up to the static linker to emit a BTI veneer withing
direct branching range of the target, and direct the call to the veneer
instead.

Modules are partially linked objects, and so there is no static linker
that can do this for us. Instead, the module loader must see to this.

So implement this for the arm64 module loader. Patch #2 contains a test
module that was used to validate the approach.

Changes since v1:
- make HAVE_LIVE_PATCH depend on !ARM64_BTI_KERNEL, as live patch has
  other cases where landing pads may go missing

[1] https://lore.kernel.org/all/cover.1786768375.git.jpoimboe@kernel.org/
[2] https://lore.kernel.org/all/20260822135323.795946-11-ardb+git@google.com/

Cc: Mark Brown <broonie@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>

Ard Biesheuvel (2):
  arm64: module: Emit BTI veneers for cross-section calls
  DONOTMERGE: arm64: module: Test module for BTI veneers

 arch/arm64/Kconfig                  |   7 +-
 arch/arm64/include/asm/module.h     |  12 ++
 arch/arm64/include/asm/module.lds.h |   3 +
 arch/arm64/kernel/Makefile          |   1 +
 arch/arm64/kernel/bti_veneer_test.c |  26 ++++
 arch/arm64/kernel/module-plts.c     | 128 +++++++++++++++++++-
 6 files changed, 167 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/kernel/bti_veneer_test.c

-- 
2.56.0.rc1.315.gc6ed9934b7-goog


