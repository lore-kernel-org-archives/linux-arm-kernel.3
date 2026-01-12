Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00680D25043
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 07:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Nm08QPvja+X8sRm8npcNZeirzQwsu4YExZqsNCkcus=; b=XhjI6rP3oyfXhMIIpsVRtfjAmp
	ZZeaGvWRUarAcT1eW5aUA3y/77mU4lUN60Tmq8AluOq2Pu+4QyoOvHmMLHk2/HpE07XdfQ3Mz9GLI
	OGWaZFeMYBVfabHu0GdxTkcnxJxkaOjy9z+thWjkO9Bd6cdH5nfv8hLJVvhmVjVyIywq+eyDRlOAf
	soKoHhR689a4mD6feD8O77RToXPSD15I4q0y52gef0NqFBajLnykZCDB3xFGsV097rvW8tHJKdJwa
	hZ9addD7Cto6j2SNYKjbO70CTPvsJxlG6PqGJNK0ite9bPoJOEXwWK3kMdOvGUlvRjTgbB/iIxxMF
	6ATPXC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCp5-00000004wRJ-1lCz;
	Mon, 12 Jan 2026 07:58:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCoz-00000004wKk-3aDM;
	Mon, 12 Jan 2026 07:58:43 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768204717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Nm08QPvja+X8sRm8npcNZeirzQwsu4YExZqsNCkcus=;
	b=YUA8/D41Qd5gz0b5oHny13Ly/SKKuKkDId6G1JNhOQH0X8E/87G7+k+WpjLfYaRlD8Q963
	e1xqw92qVBROfZgQ1/kvnzRSsFWaXTz6qrq6t8X8AGeOX4z5eEzIvZoyWpV6zS/XsybETZ
	egSTALZ2A3ef2qN7InBSZ4dT8WZxmk9tF3n8mr/4/IRc7mVSLjv8Tvuoe7HEUhdkKcAYcS
	3T5c4R/ZuOqOINqah/lWpGMYuUH4vJtE5N0X6kva9iHg+Wbq15bmh41Bg1vOnn2e8TBUBU
	bw+blVCmbkhlT6TqrSXMM2cXFGoHYN+oH/oLzS3eKOVSMVWXsIXwObEC9oP+Fg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768204717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Nm08QPvja+X8sRm8npcNZeirzQwsu4YExZqsNCkcus=;
	b=i+pvltVKbnu+ggWlaK4sc/4fwRX1DLgkK1PhBse1cfVMBKq7kC3c62rQvkbHP8pQDwNM0v
	EARnupm14BZcXLAg==
Date: Mon, 12 Jan 2026 08:58:33 +0100
Subject: [PATCH v2 5/5] scripts: headers_install.sh: Remove config leak
 ignore machinery
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260112-headers_install-config-leak-v2-5-4d8084444603@linutronix.de>
References: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
In-Reply-To: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768204713; l=1231;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3m2ChPrsGt9AyZmjEghF2edS4ROwGKo0RjvgqUHiJ78=;
 b=lMTaoQYD5mp3KkppGHRh80zlb5hvyWuPkZm9YoR05ZtcJuFvgjKLhNDS5cIvudXfwBDhIPSwD
 qPePzBUbGDhCl05oBVNc6DZNK7Ly/RAa6pJgDde0NMqvyIFDV9mxjaK
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_235842_035290_D5022EDD 
X-CRM114-Status: GOOD (  11.03  )
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


