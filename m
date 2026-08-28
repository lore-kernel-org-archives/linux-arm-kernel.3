Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FEBC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 23:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Mqf8IivruERMP6fZwT8V4CKtJjvaF7LKzl37WPzoRE=; b=c/VonjpqsDk8Ow7Ok/Vk9nNCMv
	FolSVr1szx/vQiL6wsBbICWlUKWz2GpOLnxalovsHARw/AAXBPf5tEz88lsZVCryJYCzIa/JFnhu4
	QjAr38oAPLAm5dZNaYiybpcOMYmrwMCMvuNOhREotIm5xujfxPrDplwCqAOKhtJCxP2aQnxgbyoTM
	ihZ+znEn1ePlofSkh81EMrZZa2ltFDLROs+MEEQlSoSh6nG6509rJYCuFvTguDCWmoJz9Xp+7fycW
	ubj3Hs6GRT5aqVrxI0yY++xr1yLnHOPAUCaqWwPi2FeqoOYooy1cQXaD2iYG8Q0nJcpMiw6yCZWqA
	cfTCP86g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x05rY-00000006UXh-3Q0u;
	Fri, 28 Aug 2026 23:19:56 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x05rU-00000006UWC-45nr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 23:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=1Mqf8IivruERMP6fZwT8V4CKtJjvaF7LKzl37WPzoRE=; b=kApnQbtQ+Dg617qrBmTZu5xy5f
	Lbnimg8N/l8V7rNCeFVbJcEP8p7rAPDFM6+FLM1MLpk3/R2s/wGdqxGk+JMY2Cbq1i732NZEEEeAi
	fFw07E+np24+TEJZCvkt3IqkU9W6gSieQ7X19bnMSFcmZxaqrNSv6aVoN9q081NBZK+pQDxhyv/KF
	PWWNev7hAPz9ckok7XW+BdFezFHo5Yzo4s5EuYxVB0UXOUCcG1bhVP69cxpgCtD/BbrSrsj24TjyS
	C6T1hVi66MJhPhLp79eAkl5A7zvOexdz/lccuiuAKAAz+dOHdfSUm3/OugLnUjolODZdMyQMM31Tq
	RkhkZoZw==;
Received: from [187.57.78.212] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x05rM-00B3sF-2z; Sat, 29 Aug 2026 01:19:44 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Fri, 28 Aug 2026 20:19:28 -0300
Subject: [PATCH v6 01/13] syscalls: Make --abis parsing more robust
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260828-tonyk-syscall_table-v6-1-fdd358456cf1@igalia.com>
References: <20260828-tonyk-syscall_table-v6-0-fdd358456cf1@igalia.com>
In-Reply-To: <20260828-tonyk-syscall_table-v6-0-fdd358456cf1@igalia.com>
To: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_161953_307410_9A91D0C1 
X-CRM114-Status: UNSURE (   9.48  )
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

Some archs Makefile have something like this as the rule for making the
syscall files:

  cmd_systbl = $(CONFIG_SHELL) $(systbl) --abis common,$* $< $@

The $* symbol is evaluated to the variable found at $(uapi)/unistd-%.h,
where % is 32 or 64, resulting in e.g. `--abis common,32`. Sometimes the
rule for the file won't have a %, resulting in a trailing comma e.g.
`--abis common,`.

Currently this input is transformed into (common|). This is problematic
because grep will then match any ABI because of the trailing `|`. Make the
syscalls scripts more robust by removing any trailing comma.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 scripts/syscallhdr.sh | 2 +-
 scripts/syscalltbl.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/syscallhdr.sh b/scripts/syscallhdr.sh
index 22e34cd46b9b..bad1ab606a0f 100755
--- a/scripts/syscallhdr.sh
+++ b/scripts/syscallhdr.sh
@@ -39,7 +39,7 @@ while [ $# -gt 0 ]
 do
 	case $1 in
 	--abis)
-		abis=$(echo "($2)" | tr ',' '|')
+		abis="($(echo "${2%,}" | tr ',' '|'))"
 		shift 2;;
 	--emit-nr)
 		emit_nr=1
diff --git a/scripts/syscalltbl.sh b/scripts/syscalltbl.sh
index 6a903b87a7c2..c4b1f85c2dd6 100755
--- a/scripts/syscalltbl.sh
+++ b/scripts/syscalltbl.sh
@@ -33,7 +33,7 @@ while [ $# -gt 0 ]
 do
 	case $1 in
 	--abis)
-		abis=$(echo "($2)" | tr ',' '|')
+		abis="($(echo "${2%,}" | tr ',' '|'))"
 		shift 2;;
 	-*)
 		echo "$1: unknown option" >&2

-- 
2.55.0


