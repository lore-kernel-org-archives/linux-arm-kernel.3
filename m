Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8179EC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 07:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xvFMByaEOz99iBJ7NSHYWQOqz3P4t9DDrFX2j8+C6hA=; b=SBzzOgJj27hhwO6uTpVWtHLkv2
	66IK4rI5fQ4KtP4h0qVStdt72ilDDt8SzpCY9QEqzz4Ra5FPsw/vGRxBGUbSzJP5jGLpwHXWhDNED
	65E8Ib9L8qjSquQSQlWqHkSDp+KMLFtEuSj+I6jGdsqOwbf+StdhQxr4kXo4KCheoV3nRX0s8cROu
	P2InIiTBabZumIQmpAEuoOvyhBdjaRxpyFjrfb5A7Hr0+Bjfkw33fNWIsPMDpAiP+dwAhQmNGfRdO
	czjeJYp+FPHMqgvMZJrlbnDtOB70wGyHknIebkR4IOr/QHPzAUigcMu94mjBKFK8hylE+3bM1zt1n
	3fm0Dd5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufClq-00000009FgT-031X;
	Fri, 25 Jul 2025 07:23:10 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCb7-00000009Eab-3TpA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 07:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753427525; x=1784963525;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xvFMByaEOz99iBJ7NSHYWQOqz3P4t9DDrFX2j8+C6hA=;
  b=cKfAUW4j3I3JmkOOJGU/YCyJ5Y6y2fdO02nWepK9R1+/6Uz3CXZxlrsj
   MPZg8iGVyaKXAPuFQLeTQOKqVnsWasRZK6eIdlPmLRaRA7qP6IrV+Z2NV
   s4qIYRldMZ0BX/JqqIU2dM5+g2Gdi1t2WnaSjbAOO33Dv4clo41qwZJD3
   a3nCrYZ4FAXMwnT7iQ384cbzrEDZvDG1OS6uoBEJ8iafQgMDenA8FpVFa
   l3XZ4oJ5zwLyai+LLSOgitP2kdsViRYABtBAY+S4w+0qDxNOxXSTY0vXC
   c8+Ie/fEovJa15DSKjLhauJVJqabB+iclbGVmGMu4ozM6Z/w7DmUx+jKx
   Q==;
X-CSE-ConnectionGUID: bv4wrw58TomqhpSLsYv+Rg==
X-CSE-MsgGUID: mi2/nxJnQXO7TUmO26w0Jw==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45414799"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 09:12:00 +0200
X-CheckPoint: {68832E40-2D-8CC3CD70-C1DBF452}
X-MAIL-CPID: EC45E6D563B909B0A7AC09FCAAE3848B_1
X-Control-Analysis: str=0001.0A002116.68832E72.002D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69C25164BC2;
	Fri, 25 Jul 2025 09:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753427516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xvFMByaEOz99iBJ7NSHYWQOqz3P4t9DDrFX2j8+C6hA=;
	b=GRGUZbp+a3LTjQwnJbRRa/pseIjyLhgxfEw3blzWJ0HjxzsDf7rFtCvZX+FbWLjjD/dS99
	7PqxlbAcYSGGpi/E/GeCOiqWJAlgLrWPckiBuE15pKScyQEG4rowg2MMmMEMbFwoxP2wVf
	ns4ey/Sx7KaYdueqXmlF1PTKXZASGVyGdU3XChW5LlReB3b7JWoqp7bF519JVOsyU1fNov
	E4kN16bEYYW/9lHaYas17pcOqUYHnfmU/6i5uHLh/DZh4YC6nYm913IZqp5g/ICcLDGNnu
	/nOhRhXkmC46sOPYpb5w3YvgUL5XxBA8lnoHFhGLKU/tVcLRQQMkGyd/83oZ2A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] stmpe module support
Date: Fri, 25 Jul 2025 09:11:48 +0200
Message-ID: <20250725071153.338912-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_001206_173022_904E9727 
X-CRM114-Status: UNSURE (   9.39  )
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

Hi there,

this series adds support for building stmpe mfd driver as a module along with
the bus driver for i2c and spi. This depends on the cleanup series [1]
just for avoiding conflicts.
I'm not sure in which order module support should be added, maybe even all at
once. Please advice if necessary.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20250725070752.338376-1-alexander.stein@ew.tq-group.com/

Alexander Stein (3):
  mfd: stmpe-spi: Add missing MODULE_LICENSE
  mfd: stmpe-i2c: Add missing MODULE_LICENSE
  mfd: stmpe: Allow building as module

 drivers/mfd/Kconfig     | 10 +++++-----
 drivers/mfd/stmpe-i2c.c |  1 +
 drivers/mfd/stmpe-spi.c |  1 +
 drivers/mfd/stmpe.c     |  6 ++++++
 4 files changed, 13 insertions(+), 5 deletions(-)

-- 
2.43.0


