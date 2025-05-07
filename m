Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532DAC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 12:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UaNOIapp4J5KzxMU+tHJGWnVbFnnDP/ugTkRCJiT7PY=; b=DZ0JxR5SlDGlspILHRSIQaNEni
	MoXPRQcQMlHabWCE7kTGbfTIkDQtMfppU400DCqbuF5440noqg674//18huM4U2jCDWJt6VOie9w0
	gwrh6LoziQic2kTl0VR/HgDayZVifPQPkvXZhnqH3jtov23mdXr1fFH3ij8tRk+reukBpldN//G9R
	R7iFOVooRjnU6KVZrIzdS8cccLbEXQGTJiafa99FS3X6rpTVYBFdp/Wevh2Sl/n/HbC7cn3ARI0Ak
	8iqGXY2VjWnxpO1iUIKRN4QDkQfVxdt0EfV5lT6ngie7FMv/jdqm2BcnruDi0Wj4DUBnysbODC/fZ
	qRGyWwqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeBx-0000000FSl6-1vld;
	Wed, 07 May 2025 12:48:05 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCe8T-0000000FRrq-2p0r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 12:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746621869; x=1778157869;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UaNOIapp4J5KzxMU+tHJGWnVbFnnDP/ugTkRCJiT7PY=;
  b=CcrWoWyUn/XvO1jswCzov3S0zKC2YJ/5rKh2RyhxW/C0tiFU6218JZx7
   MkLpFkNfUmBu6fupjaEQ+2mChhDW2WV7fF4khDV5141bFgtFmBxJNrGca
   SdnW/cjyfWhYnc/OqlmNNj9JwDpE665vbEB+eeznzi9XvI1FRqrDxDyNT
   uz9a0Gnbl0QtJTa8JlGZafhgWAI3PrGh2VTlAQ3Qc0YfIvlvpdAMHVYEp
   R5cTtQHGVrB2OcTgnvw1cunhHkaNBULpBFh0t0QOlC6HUUKBtWF3Vq6LN
   IUmgr7yW1ws61Lvmq/Qy3wxrHQAEqkRgddU5dWrSvAfBQ4WptJuRkyGjC
   g==;
X-CSE-ConnectionGUID: DrLXQv0vSxemKXNx8bmoHA==
X-CSE-MsgGUID: TR8Z33pXRm+v+2x3xaMeBQ==
X-IronPort-AV: E=Sophos;i="6.15,269,1739833200"; 
   d="scan'208";a="43936346"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 May 2025 14:44:27 +0200
X-CheckPoint: {681B55AB-12-C7E25413-F4312D34}
X-MAIL-CPID: 6E8B7F67FFA38057D06757D6A4063F61_4
X-Control-Analysis: str=0001.0A006398.681B55BB.0089,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0BF21609AF;
	Wed,  7 May 2025 14:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746621863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UaNOIapp4J5KzxMU+tHJGWnVbFnnDP/ugTkRCJiT7PY=;
	b=kj0fwJqqaZdYnzp02ZZSmaFjCKy0xnCdVTH1vg3rjVYqjeGZF+pLxbMZBh4WxAsvoWwDO+
	lXU1tFBr5T71QnznSaMTc5aPiE4RR0AitCWmZRrqBw6U8emPNxOEnlPfiSzjSIr6h29cdG
	+m35eKK4OAnaBve+dKIcgugoRu1F6TAxFH/OcaRzPhS/Rvs1NJ/6wJrIASjZbipq7R9Zw/
	qh53wh3NX8PTa/UMsDL2Ja0993wOyaWxLzRzBDiWii5BH10/7RnO/9EaLYVCEjmgQqUhwH
	1H/HX5BEjlrUOCidIubhqLpR0KODCxQsOK4c3+iTJ8clmSaH5byHQguhjD7Vzg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
Date: Wed,  7 May 2025 14:44:13 +0200
Message-ID: <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_054430_193183_A8EE7296 
X-CRM114-Status: UNSURE (   7.06  )
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

Select PINCTRL for NXP i.MX SoCs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4e..49c3bc25e5f68 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -219,6 +219,7 @@ config ARCH_MXC
 	select ARM64_ERRATUM_845719 if COMPAT
 	select IMX_GPCV2
 	select IMX_GPCV2_PM_DOMAINS
+	select PINCTRL
 	select PM
 	select PM_GENERIC_DOMAINS
 	select SOC_BUS
-- 
2.43.0


