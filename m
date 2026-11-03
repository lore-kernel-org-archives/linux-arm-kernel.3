Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FE7606EE8D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sjx3Wka6;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=eJejINim
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/giysDG79yh2AQk/VRr8fH0SzK99quvNSud9CE+SPJw=; b=Sjx3Wka6klZGDgtVLNNGdagi4X
	mNcIo8/prYQ4m1M/dMDrD1xZO7S/y9plrf4IXWv3DJteP6n7UXLQcMgVVuFO4O5r+Ga/lob7sM+VO
	XpZcwTQIEmqbCGhi8/dFyOfeQD1+guQX/QUJxlumsvRuTNSjoM24/kBN/RnFPtn8MKRXvTh6J7yvo
	th8QxaO40ZTz55jncrJjci+O8BkkPSSAwIkf0u2gUz4ntAeujKbTuzAH/lZ7BYcgnEsa3Gg1oLuJU
	Un/hKPwAHg20lm2xMnvLf7h3GO68sFdLaSLGom3DTL740SQxoSooca3MQv56rSqi+hdK3y0+0H6Z1
	TADFN0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9u0-00000001Xas-2Tsm;
	Tue, 03 Nov 2026 08:29:56 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9tv-00000001XXk-18up
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793694598; x=1825230598;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=fKIT1odc8juQtbc/yg2Qb9XwR2x9WyUKoI+trK5ZRKs=;
  b=eJejINimmNjfprN0Jj3OFgiyqojm/u7Fdq1wBHZXncNuDWOqPqrSJQEW
   iIKuFsy4cmZ4J6ok3DKLXW4mrlrzKfXgC7m5mRg6r7Saz7ttjpkGEvsrh
   IDY3rVxiTwI5hanbXgblMhUog6L0CtuKr0uKeXdogcMAWWeWiszBswYxh
   L52ZFa8VpcROT7gyjSPnLvevi8GCuXO1r3cnNZkytZfrZ3ef9gOBw65jz
   3DqOWnAxF9JQ7as9UWy+BrvGojVnEjFfP276Flys0Lqd+qLk0+SlvURKT
   qH9p2cvHEpTDiI6Sib6jtF1KQmdn3M2OaYNol3XB4dHwdds2t7T4MgqPq
   w==;
X-CSE-ConnectionGUID: C2jOjHXDQAiO7PJ6P3Cq5A==
X-CSE-MsgGUID: BJ0EBjf4TMy6oZtH87gjSg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:29:53 +0200
X-CSE-ConnectionGUID: xuzxpQYAS9acAy2rIn2kug==
X-CSE-MsgGUID: wwCpMMWJTsi5DF/Fq5253w==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 03 Nov 2026 10:37:46 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Tue, 03 Nov 2026 10:29:44 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Subject: [PATCH 0/8] i2c: nomadik: fix several issues in fault handling,
 optimize layout
Date: Tue, 03 Nov 2026 10:29:36 +0200
Message-Id: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHGb6WoC/yXMQQ6CQAyF4auQrm0yrYDEqxgWWKpW4mCmYEwId
 2fE5ZeX/y3gmkwdzsUCST/mNsYMOhQgjy7eFa3PBg5cU+AKjQXj+Op6G/BmX3U8HYlJpKYyNJC
 7d9J9yNml/dvn61Nl+h3Bum6kkHkHdQAAAA==
X-Change-ID: 20261025-i2c-nomadik-fixes-73121cc61408
To: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 srinidhi kasagar <srinidhi.kasagar@stericsson.com>, 
 Ben Dooks <ben-linux@fluff.org>, Andrea Gallo <andrea.gallo@stericsson.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Dmitry Guzman <Dmitry.Guzman@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_002951_759581_1F2D2A21 
X-CRM114-Status: GOOD (  11.57  )
X-Spam-Score: -4.0 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patchset fixes several issues in i2c-nomadik driver.

Patches #1..#5 were previously submitted as a part of a patchset that
introduces detailed fault reporting feature in i2c-nomadik and
i2c-designware drivers and i2c-core.

In patch #5, the new structure declaration is moved to different place
to make it independent of patch #3 (avoid merge conflicts).

Patches #6..#8 fix other pre-existing issues found by AI review of that
patchset.

All patches are mutually independent and may be applied separately.

Patch #1 Optimize struct layout.
Patch #2 Remove automatic retransfer on failures.
Patch #3 Fix error codes returned by xfer() callback.
Patch #4 Avoid excessive prints by replacing dev_err() with dev_dbg() on
	I2C faults.
Patch #5 Add quirks that describe hardware limitations of the controller.
Patch #6 Handle PM runtime errors.
Patch #7 Fix race condition with IRQ handler.
Patch #8 Fix possible long busy-wait loop in interrupt handler.

Link to the patch set that patches 1..5 were submitted in:

https://lore.kernel.org/r/20260903-i2c-fault-reporting-v2-0-fedeb91792e6@mobileye.com

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
Dmitry Guzman (8):
      i2c: nomadik: optimize struct layout, change unsigned char into u8
      i2c: nomadik: do not try to retransmit I2C message series on errors
      i2c: nomadik: return proper fault codes
      i2c: nomadik: change print level for fault messages to debug
      i2c: nomadik: add quirks max_len=2047 and no_zero_len_read
      i2c: nomadik: handle pm_runtime errors
      i2c: nomadik: fix race condition with interrupt handler
      i2c: nomadik: reduce FIFO flush timeout to avoid long interrupt handling

 drivers/i2c/busses/i2c-nomadik.c | 105 +++++++++++++++++++++++----------------
 1 file changed, 62 insertions(+), 43 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261025-i2c-nomadik-fixes-73121cc61408

Best regards,
--  
Dmitry Guzman <Dmitry.Guzman@mobileye.com>


