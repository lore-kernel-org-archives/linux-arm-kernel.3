Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385CCC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UaNOIapp4J5KzxMU+tHJGWnVbFnnDP/ugTkRCJiT7PY=; b=sqM+pcrxUD7F3NN/TAEm3dAVLj
	t+e3fDiqYXJxG2kOCuh3+x6mlpyBS3+9WJ5EuZMcuXjH6INCJpcv8vZWGzsATA+yfcRsw829twKgB
	P51HPhAG2wzkfK5ut8uFv4/HikIQFxVNJGR25X92311xeN8bVt4a9fT5utDJYSu9getw/3NPJnXaU
	ZKntBcOwp5TICD92TlJ2A9Af7SRpATkL4ISeaSTGSoHD7V9S0nxs5hSUqWsNBnjHLWdOpQ3VDaow4
	IBqVQyHTbHlt0cDVRen6Nd2qgnx2OTM7jhvOQK54uQKBtvvSdJn0iUyY9Wj5nKlJMqeXAPZGJZ2gH
	yIksffOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCBc-0000000FCjb-1qqg;
	Wed, 14 May 2025 13:30:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB5r-0000000F3gk-2ivL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 May 2025 12:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=UaNOIapp4J5KzxMU+tHJGWnVbFnnDP/ugTkRCJiT7PY=; b=Xdzz3WIMRDUAWHatclEty1UGnc
	okzjAQWsNvnewYrysa7TaERWmWg+5jKbNQf5t6k5R726LUMdJYShkXqQonDlg/BHwvzCSDvcyaE0H
	imZZcpWs3SuLhxGtcE6Jn2yukswvt6TNI21ctQgMJutbt1kxNTFY0vfn22+FdFIndCfqD2CjeM1j9
	NZnbo2z+WPsEbj6M7z566wvTE400OrTH7cX9KFqXrySwtZkJsffTPZ4+tVOVJaNavJgXg8e1NEJwG
	9jhFihLczjG05GYvBSKnv9KCSy6NYsStvA6TBl42fIwHW8npBf0a9jrWM+LzeBxkOd65w1XEFQ3Fg
	f/3WPF2Q==;
Received: from mx1.tq-group.com ([93.104.207.81])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFB5o-0000000H8rA-0Eil
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 12:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747225212; x=1778761212;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UaNOIapp4J5KzxMU+tHJGWnVbFnnDP/ugTkRCJiT7PY=;
  b=Cbyiefzcu3OxiuGZ30Zub1TjDgkubV3JrdPlPsmP2mgBCWIbELQMogw8
   0xm6Dkjiriz3UhML1EbCYMz3HZaZaWwp7SFEnD3vMjYgwpyrtqbUYd1WK
   7zEWldqUDe+UTBMO0Cw3madjllbJSz5ljCZKxh2l1vKBMWkylqtU6oioP
   iy3B6M2pmzPHudAcNYHO/i77tyRGrmez68IQPIXdFmFrQa3eopw2spUZ7
   tS1VNY89tmWMVRUTQf+2JEFcSgxF1k5xb0tA9OB6QGX6029MsIS5udAht
   g2EeF3ItZP/+O+XXO5Q1ZBvD65tApS17+swPzuNeqmybZOrSoopTELySm
   Q==;
X-CSE-ConnectionGUID: HAcQnEHfShqHv1+SBVGxZw==
X-CSE-MsgGUID: mbQtCp59SpSYqWIfPy6W4A==
X-IronPort-AV: E=Sophos;i="6.15,288,1739833200"; 
   d="scan'208";a="44071281"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 14 May 2025 14:20:08 +0200
X-CheckPoint: {68248A77-2D-68AAF6F9-E177A1A4}
X-MAIL-CPID: 4549570F796F46B7B2130055CA730564_2
X-Control-Analysis: str=0001.0A006399.68248A86.0043,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31CEC16943A;
	Wed, 14 May 2025 14:20:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747225203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UaNOIapp4J5KzxMU+tHJGWnVbFnnDP/ugTkRCJiT7PY=;
	b=nCjGAj7cjlzcLzHErOoBUFEnftHlEuyYPnQh6/QZAJWos7YEO3xx0qhP+GkXR5Vpk3I++P
	B7An+cwjkc8gfI5EaOdToZgHZrZSHNIVJj1TeO4FjTzfljerS7JP+HDyvkFdLbX8p24r7u
	/PieN2D6UmH43MzIj94SB4bKnYbCt99J9PvZznicSq2meEpkTRiHlgf+xniIpRkHnNWJk1
	nm6PnWJ45Ei2aUIc8XpTOc4SeEptV76Fq9M+9r2U+lkI8Tt8hToHSnto8O2Wbn/KhvknJn
	h6p9vOpCI+Cdsdb+PkkCs1KbF/6tPk/5Z1btqb8ofC+Yrq0YJfUcHlVUIZHUPQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
Date: Wed, 14 May 2025 14:19:54 +0200
Message-ID: <20250514121954.707596-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_132012_517276_553FC937 
X-CRM114-Status: UNSURE (   6.93  )
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


