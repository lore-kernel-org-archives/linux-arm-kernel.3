Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF8AC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 17:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Mqf8IivruERMP6fZwT8V4CKtJjvaF7LKzl37WPzoRE=; b=fw5IAKwUkrUtcFPTUd6zEc7Tyy
	V4ABfK/Jt9m/5XnX6VwVtbW15CFmVQ83wMX4ROID3kkJ6Dn0IiDovxZtILZkeX/uhJnzThqwT1V3L
	v29m0UAAKgVkDfyfsj38wBpn+UcQ8oiyVDVEl4iRZYYe5cETfkxrG9VcUjTUXD8Fz/x6dmIJh3dcJ
	s4fNR0U5EZ0q1xi6I5RJQB4g21Gk+eCCfE7YIO5RC5/YZQOD+uAiwW36A13KYEwE5yC+QrQWNYByH
	jKOijguIAT9zq2Li3/fRFYrUx54OcoSzHd8nYOofk3Xiu6OIb2E6qsvbzS/1nAqp2JfBLZrIspfzC
	WdHdqC3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCuw-0000000GgXK-2GPZ;
	Wed, 12 Aug 2026 17:39:06 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCus-0000000GgVg-4293
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 17:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=1Mqf8IivruERMP6fZwT8V4CKtJjvaF7LKzl37WPzoRE=; b=bRcE1a5Mj2NzjAa2ToQscz+2o7
	geMWanyF/mqQ89iN1gMJ9D/Zv7VdJkTTZzFI58V5NYkzPUik3GchuqO5+M5+hcpTc5e7JIIBS/UFj
	L41+E/39vpFW4AbmH5HxgovZhGwP7UvRs1AQ5G0XT2Z/rv7zNmttLThJnkR68WJkX3SuaHsWmEPKb
	Ym9uSe1ch9Uexqj4E2YQefvLk/DK4Di+Gi0fKugxznzHSKdVBLAGr2QxqCIFmzVfGbJrSKZoODxaQ
	tPMr5i2bd81dqyue+Z5Yv7kZkgQfOctwYhYa2aow5E5bH2IjElCtOCsUX+yrPHb3dH+QpHiL8bkNz
	3JLk2rDQ==;
Received: from [177.139.22.20] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wuCuk-000FR2-Ab; Wed, 12 Aug 2026 19:38:54 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Wed, 12 Aug 2026 14:38:32 -0300
Subject: [PATCH v5 01/13] syscalls: Make --abis parsing more robust
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-tonyk-syscall_table-v5-1-3d383927c609@igalia.com>
References: <20260812-tonyk-syscall_table-v5-0-3d383927c609@igalia.com>
In-Reply-To: <20260812-tonyk-syscall_table-v5-0-3d383927c609@igalia.com>
To: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 kernel-dev@igalia.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 linux-mips@vger.kernel.org, parclinux@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_103902_997493_CBA4DE66 
X-CRM114-Status: UNSURE (   9.85  )
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


