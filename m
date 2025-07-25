Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B137C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 07:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ot79FB6Rm05Ivf76UgZFDK3nri1VvL/P6ylysfzZ5W4=; b=KhUUmzC/O1/TBIVlfF9awu3bCs
	iSAwwmxzzfF+YVJYMEDPsS2Y4jUDKuZrJ3a3IDuyZ+xnNUm8BTXngIMSTyUvVki4whykOZSsaQcAl
	A6drZAVGP7WAu7nX50n+N8uM1sB6sMNo331bBmH0n4S0zMRs0SzLmL5+CWsYAcrwLi47VYsWZ0XjG
	UpKgKzX+dt8I8m6k/SdKBjrhubQcqzAuy0hak5uUSx5Pd6wtmxy5yO8qM1q5OM/81Ol0zmdl71ckG
	kkJokhIHJZ3Uv2EU3ugaVtIzxglAsJaCa2YQ7oqZDh9zHWk5L8V+N1ZuDyvRRLZoWfx2RPH9d1mUG
	ggFqbEsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCt7-00000009GSU-2sJa;
	Fri, 25 Jul 2025 07:30:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCbN-00000009Edk-1Jco
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Jul 2025 07:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ot79FB6Rm05Ivf76UgZFDK3nri1VvL/P6ylysfzZ5W4=; b=AjJ8q5mGa/EeRu3YFimEB2BFS4
	r8ESPmG4W/OaNRKOf9RvuxFLsapch4BKBPKIrDuQTprglqUmctbMsJ2WpPYN40zXe3Q6f0hxGvBAz
	CsfMEEhQT2hrzG9NANImOIlwZ6sCXlgJY71U9mz5t2Z+OcxMCH0k5YjGCxhaW8T5OdHNIyaGBVBqv
	kH+/bERAB9+Z772jZawGB8wC6hi+VKECFWyzW4tzyhK31RSfgfyrK/GBA95DZkQhsBTh+Db9GO/8N
	uINLmKp66KVrCLjhuhXTyLWwI/znimId9/nvR6Gf0ALfLI5N0/dhQ8iHbIep1vSw1t2WlVM4LNWhK
	JBsdS7QA==;
Received: from mx1.tq-group.com ([93.104.207.81])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCbJ-0000000BnMG-42B9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 07:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753427537; x=1784963537;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ot79FB6Rm05Ivf76UgZFDK3nri1VvL/P6ylysfzZ5W4=;
  b=e+vWSvIJBTjBoL3RpbaxnIGqPLRcdaAtqLcVTByBe7g/o2gYWMPfJSX3
   yFe3njOEsi3ocMLOmbO+NzoAu2bDynXRI7XAgg52ckSuO2j4ecp/lZcQm
   AwDsaIXmZLkggVExuAQtlcdx1fhkxH3LCR8RYEcWrlZ3I7mgoQSE8gUJS
   Gj1y9H4eKN0KZrZiYOXjQ75Ln3FawBCF/p6EjpTPoEo388AkyEV5fWkT0
   nTDrC8aYcSjQnoucd6ZaMn0stD4TTdzewx+uPI7tOy1n097nfyF3rD5QO
   +qHAgukQwgBsyKBLSzYd9yGmZqmucMTtDusgFz3dO8Upg4quJGm16Dj8O
   Q==;
X-CSE-ConnectionGUID: UQgwQ7H2Q5OqZClASaX5fQ==
X-CSE-MsgGUID: PPfXhhUZQLSXodAMzkknMA==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45414809"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 09:12:10 +0200
X-CheckPoint: {68832E4A-15-9BFD12F6-F51D5FD4}
X-MAIL-CPID: B89379C4CC39DD7BE940DE706BEDB41B_3
X-Control-Analysis: str=0001.0A002107.68832E05.004C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A4091736D8;
	Fri, 25 Jul 2025 09:12:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753427526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ot79FB6Rm05Ivf76UgZFDK3nri1VvL/P6ylysfzZ5W4=;
	b=CDqNMw2wSEOHuEBFOE/lt41HATMfB0u8IJVw5kJwXQGig4wLnRDKmsXIGCgrsBKsgNJPgw
	Av666r0Lz63sAtAwglhN1ZyghP57DRbbTG3ifpAERuZoCRfONkAIh/t5jNga37tdDtp2dH
	j8+XUHRxlyn0MZuPNaqK7dzWwUMEJKGQojBrlM9EXK41qnzHzSxrs5hZSVI/4rDwx75kCY
	hLH5IuvCW6pp6GLy7s+6Gbjg4HAQsa0RHNGg+ny89xR6V8O274EdfwlXSChK/aHgAbYQML
	4S7v4S9JbvcEx5EAWkgn7WI05MTXPQibg2wBBeaRn7xrhG5wyT/WZ9A/pgjgow==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] mfd: stmpe-i2c: Add missing MODULE_LICENSE
Date: Fri, 25 Jul 2025 09:11:50 +0200
Message-ID: <20250725071153.338912-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725071153.338912-1-alexander.stein@ew.tq-group.com>
References: <20250725071153.338912-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_081218_420058_8D47B5B1 
X-CRM114-Status: UNSURE (   7.81  )
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

This driver is licensed GPL-2.0-only, so add the corresponding module flag.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/mfd/stmpe-i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/stmpe-i2c.c b/drivers/mfd/stmpe-i2c.c
index 145836320c170..943fa363efc35 100644
--- a/drivers/mfd/stmpe-i2c.c
+++ b/drivers/mfd/stmpe-i2c.c
@@ -126,3 +126,4 @@ module_i2c_driver(stmpe_i2c_driver);
 
 MODULE_DESCRIPTION("STMPE MFD I2C Interface Driver");
 MODULE_AUTHOR("Rabin Vincent <rabin.vincent@stericsson.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0


