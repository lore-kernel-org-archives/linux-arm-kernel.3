Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B01E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 18:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Led+9qJPjWGomd8o9zFG1B7on1cdTyrvmqth2C+w2Yw=; b=R1RNQLNNl5jdsPUADjoKQ2btp2
	pFxknPGUIxsO92SVnVn3wpcuC6FBz/ngzOiL+d1FOsQNhVUTZ0IsdPl+vYBoG3IT5sUBTCKIxgagE
	lqUqVjKK+r2UcwpP+0e23GiG0l3pZDiWstvYu/O5w+UI72v5IdlTGuc87W1+4sYaXhuPuT1UY1avv
	EOmq6QEXeDHgvZpnj54P7GQ2+XOyKTjmoZ37MQdWxyaLf8yG0c2L6E5vYAnJJTCB/ySJlL9tfCvb+
	4gYdNUYdK1MNAQPYBelxtNrCVeCWob5t2p8zuwqo7xqpl8ogM1Mb37zqYM5sC7tW9uQfKnO7InmPl
	DMfMl+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhZ0-00000005mLY-3OOL;
	Fri, 20 Dec 2024 18:17:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhUc-00000005lb6-33kW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 18:12:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5382A1E8D;
	Fri, 20 Dec 2024 10:13:20 -0800 (PST)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F18EA3F720;
	Fri, 20 Dec 2024 10:12:51 -0800 (PST)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: suzuki.poulose@arm.com,
	gshan@redhat.com,
	steven.price@arm.com,
	sami.mujawar@arm.com,
	itaru.kitayama@linux.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH v4 0/1] arm64: CCA TSM module autoloading
Date: Fri, 20 Dec 2024 12:12:35 -0600
Message-ID: <20241220181236.172060-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_101254_806727_366516A8 
X-CRM114-Status: UNSURE (   5.40  )
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

Provide module tables and a platform device so that the
CCA TSM module will autoload when needed.

v3->v4:
	More comment/function name tweaking

v2->v3:
	Fix __maybe_used placement, it does fix CLANG builds now.
	Add reviewed-by tag, Thanks Gavin!
	Ugly commit message cleanup.
v1->v2:
	Various comment updates/variable renames
	Add missing __maybe_unused to the platform_device_id

Jeremy Linton (1):
  arm64: rsi: Add automatic arm-cca-guest module loading

 arch/arm64/include/asm/rsi.h                    |  2 ++
 arch/arm64/kernel/rsi.c                         | 15 +++++++++++++++
 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c |  8 ++++++++
 3 files changed, 25 insertions(+)

-- 
2.46.0


