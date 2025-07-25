Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C36C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 07:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uh1MZsai+1QlLMsnGqqtZ6xsZZILDM6L6Dcdbc1nr8M=; b=u1L/kuDXjEdmTpKlo2WIs/8EJW
	nnMXru0ODl+CybBk5g4PvSinEBGfBLDLPyEOizDeWNwtM6Qw6z/JzM+e/D7uEbapEcEYjJbCahQIp
	DBuL9AbTgwDZkzKtT/yDyu/xRLU10ZP1BdQJVKwmj9Ckn20JyH1slemDIgdbj1NL24C6ELxqB/BQc
	ScJp6k0aYq5blcQ6imiLbQtxxWrkUe/P+Uxr/oFw2hW/b3YumKxgPCsJQ3z/X5LtRpv5o/Schrfm+
	gMm4vxoWgYiheo/Avjsc6hhl+ZTGDb9MM9y1+Fxu4z6IhgorNZgAcrS1qcIHEjYmdua8UDpAY2Sxp
	w6zY/YIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCZg-00000009ERt-37gl;
	Fri, 25 Jul 2025 07:10:36 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCXC-00000009EBY-3l1F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 07:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753427282; x=1784963282;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uh1MZsai+1QlLMsnGqqtZ6xsZZILDM6L6Dcdbc1nr8M=;
  b=Uzko+Bi+ZTbGcy45/4ez/V9YcscflChOvhMCuLW5Mi+ggomk5Klli/kH
   +SJhpv1zExxE6M3H4xzClI2ejZ96MhQ93oMriaVDuKkmtb8Vbez2HdVK1
   s1iSnWuXXvjIDF4ocA2qe0HHcZu223/TkRkdXXeQkeco+bHGhYtMAywbl
   3jVSkiS8TV4snAtEQRfyB7kc37xIIoLcicfQbyT9Rq4rHmvsd2K0j+svE
   6eVVaOaXSTgL8N8H5od0PNACGkdmCeOtFpXxq7SgTy2MqrkIThIeTmNBb
   AJ1c+YFpVFZPJw04cYeBz/hrXZ4VOz/8L1hIwzw+6LJMZ6TWqUqSCh8BQ
   w==;
X-CSE-ConnectionGUID: pTxjeaYCTjqymR65UahxpQ==
X-CSE-MsgGUID: yGEwm0Q0QTu0I1hikHzCSA==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45414666"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 09:08:00 +0200
X-CheckPoint: {68832D50-7-943DFC15-D71A48EE}
X-MAIL-CPID: 0E5749B5E1E6CD6317F31CC94F75ADF3_5
X-Control-Analysis: str=0001.0A002103.68832D70.003C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D106C164BC2;
	Fri, 25 Jul 2025 09:07:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753427276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uh1MZsai+1QlLMsnGqqtZ6xsZZILDM6L6Dcdbc1nr8M=;
	b=ie9ng9nsm5xHyEGnzo8Ek6IVDFTxaYyS1NHVI2f4YZQEHwwQ7ZEh0NnX6Pye5k/7Zy00Gr
	iI/W0lyjEgiEt1hXqW11CULqiZYCm/G9+szNBzPwj6kha8dMUshtp7pxrnA0YGXc0uGBy4
	5DNSRSifq+cl4ixhjX4+SQnoSWzyg+fD/0Owmm5AlAB3azTcW/yes2mj0DBP4VtvRBqe5p
	8fsG/HvrKdHUrOZL66RRUK0W5TUmmOTtUNV1PQE7QgXl2G65zGcNgbOtiBXczZQaFFVfsy
	Hm+p5luodaRrLh2womSCWm3n8Q4x9dBZg08JJ/fMYKi+28XMslVcRCvScgb5Ww==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] mfd: stmpe: Remove IRQ domain upon removal
Date: Fri, 25 Jul 2025 09:07:48 +0200
Message-ID: <20250725070752.338376-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_000803_426301_B025A2FF 
X-CRM114-Status: UNSURE (   8.02  )
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

The IRQ domain is (optionally) added during stmpe_probe, but never removed.
Add the call to stmpe_remove.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/mfd/stmpe.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 819d19dc9b4a9..e1165f63aedae 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1485,6 +1485,9 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 
 void stmpe_remove(struct stmpe *stmpe)
 {
+	if (stmpe->domain)
+		irq_domain_remove(stmpe->domain);
+
 	if (!IS_ERR(stmpe->vio) && regulator_is_enabled(stmpe->vio))
 		regulator_disable(stmpe->vio);
 	if (!IS_ERR(stmpe->vcc) && regulator_is_enabled(stmpe->vcc))
-- 
2.43.0


