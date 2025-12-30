Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A282EE9411F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 07:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Nm08QPvja+X8sRm8npcNZeirzQwsu4YExZqsNCkcus=; b=hBC82yr+I6Y8H39DNdnNkpYCg4
	wobRsELzUfR6jSkbZyPFk3JpmSbFXBtFhhk5fKlmAUesHjDaIoeodZJuwU6FytOecqzZVbP54WpQ8
	m4vwMmkGE1MEKh3HUV5W1EXROgbTXIhorH72iH0Sz2mSPaiIn6Wp95RRLI2LrFIMAD9xInSk9MgzQ
	GrwQAL52NU8sPLE1Tkut5cwsQDNpJtWJQ21YHBonbSvP3yftsrQI3NgiqsxovYXO7qVlMAO6O5/UN
	ivPHF5pNIszalXW2vM9IgVrxJkzeorjNMc+aii3DnJm7ofq6dScaR/zfGC9QavOS8cv3CekJrtJQ/
	+1nISZbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTsv-00000004UrC-1xmi;
	Tue, 30 Dec 2025 07:11:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTso-00000004UlP-1mD8;
	Tue, 30 Dec 2025 07:11:07 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767078660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Nm08QPvja+X8sRm8npcNZeirzQwsu4YExZqsNCkcus=;
	b=eI+ulv6EecfcGflQRPoc2vHM0nkxzmkswCtLR6gSJZ8zOXD2xkfuvc3n7lxrSd4hx3jFvc
	ZK+JIDZ424h+vq+3ltldhv3xs72qPnqPx4W9MGOppxGxSUmSAbgzYDTCLLDdIMjLAxIdbT
	BZb+CjQckrOb+Zcq6BcE/HxNItK7sUqm5e/jUA4nAhkomhhzwXeTVJAnEKPr07xmE4yViU
	zJKzDjnH3jPu8dFqXKjMYujavKXjWULsB2m+Kd328Ev2QHr7p6UrYcMWVPIlRX836CSfdH
	33yqn2PySFlYIafa0kTuDs7kdgs1QLk5iRb7HG/u4elhXG0AhcmLS+0Sxa2NiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767078660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Nm08QPvja+X8sRm8npcNZeirzQwsu4YExZqsNCkcus=;
	b=XeZFnivbaGws1YFVRSE6I5UJKD//1/a5LT4SNhlbj6BbogesPE1OR89CZQp3DYTp6uAX3G
	gd32wsqBDU+w5SAw==
Date: Tue, 30 Dec 2025 08:11:00 +0100
Subject: [PATCH 5/5] scripts: headers_install.sh: Remove config leak ignore
 machinery
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-headers_install-config-leak-v1-5-efba5c58073d@linutronix.de>
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
In-Reply-To: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767078657; l=1231;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3m2ChPrsGt9AyZmjEghF2edS4ROwGKo0RjvgqUHiJ78=;
 b=w5y4GhWvN+Pxg5pF5YeO1iV331ad5+hzF2z+stSOqnSr6vKFsxQnMT/epvhMh2rMx3tw7qzat
 yi8NDsGyvfkD4Iulhz4DYvgNpnBCmNhOoGHlNnD0SXIFi+c6kH7Q9dZ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_231106_621593_DAFA48BF 
X-CRM114-Status: GOOD (  10.51  )
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

There are no entries left to ignore and none should be added again.

Remove the now unused logic.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 scripts/headers_install.sh | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 1301ba68d772..9c15e748761c 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -64,30 +64,10 @@ configs=$(sed -e '
 	d
 ' $OUTFILE)
 
-# The entries in the following list do not result in an error.
-# Please do not add a new entry. This list is only for existing ones.
-# The list will be reduced gradually, and deleted eventually. (hopefully)
-#
-# The format is <file-name>:<CONFIG-option> in each line.
-config_leak_ignores="
-"
-
 for c in $configs
 do
-	leak_error=1
-
-	for ignore in $config_leak_ignores
-	do
-		if echo "$INFILE:$c" | grep -q "$ignore$"; then
-			leak_error=
-			break
-		fi
-	done
-
-	if [ "$leak_error" = 1 ]; then
-		echo "error: $INFILE: leak $c to user-space" >&2
-		exit 1
-	fi
+	echo "error: $INFILE: leak $c to user-space" >&2
+	exit 1
 done
 
 rm -f $TMPFILE

-- 
2.52.0


