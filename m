Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03078FD7F8F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 10:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ngbwwY0TiqcIWOoQdmEKmOpl6Qj4QnOGdI7Z/wfn+6k=; b=SMDNi3Jwv7zNGYQEuhQLG6ocx4
	KK34TX4fvVC4mA61x7HlCCpYhY+geqGO1vKES9N8fKLPVghaZGN/DQATNNCzeA6/zgCLgt42STAu4
	LHt9OBFOtuY7u+5NYu/QR1JlCcJRuiz0RCPHEDlKBOMJA2+2FfS9yNxTtL+WtDxmjIs3Kc1UC6s6o
	dOB1S3fA5EHqa4KIh6l3yBQXFHRO7EDE9aioQAxe8MqHmFxD+1F11SZu+utjx0T81qzJoO1YfVcVE
	x4gVcmIHS9EKv8D6XTc254KvIQsHotEQ4RIIkqVRSz3WNiONaFVbmN44oElBjVQFNeTMjpAR7CdFD
	oq+d6F3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuyE-00000008EAY-1h4Z;
	Fri, 27 Feb 2026 10:21:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuy7-00000008E8E-1n05
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 10:21:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27CED14BF;
	Fri, 27 Feb 2026 02:21:01 -0800 (PST)
Received: from login2.euhpc.arm.com (login2.euhpc.arm.com [10.6.38.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C8A463F7BD;
	Fri, 27 Feb 2026 02:21:06 -0800 (PST)
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org
Subject: [BOOTWRAPPER PATCH 0/2] Support GICv5
Date: Fri, 27 Feb 2026 10:20:47 +0000
Message-Id: <20260227102049.8015-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_022111_505270_C5DBC97A 
X-CRM114-Status: UNSURE (   6.86  )
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

Small series adding GICv5 to the list of supported GIC
versions. Minimal implementation, just enough for Fast Models.

Thanks!

Vladimir Murzin (2):
  Introduce --with-gic option
  Add support for GICv5

 Makefile.am                    |  15 +++-
 arch/aarch64/include/asm/cpu.h |  11 +++
 common/{gic.c => gic-v2.c}     |   0
 common/gic-v5.c                | 133 +++++++++++++++++++++++++++++++++
 configure.ac                   |  24 ++++--
 scripts/FDT.pm                 |  16 ++++
 scripts/findbase-by-regname.pl |  44 +++++++++++
 7 files changed, 233 insertions(+), 10 deletions(-)
 rename common/{gic.c => gic-v2.c} (100%)
 create mode 100644 common/gic-v5.c
 create mode 100755 scripts/findbase-by-regname.pl

-- 
2.34.1


