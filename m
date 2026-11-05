Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03171606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JPjYVYmm;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=NwlLHwJq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Kenou/u5GC+cXRy8kELS4DyKmMoQ5qDZG4ixNftcQaY=; b=JPjYVYmmjWuSma
	OT60UnQ5gscOG/fX7Fr67LDHcTiGYj6lhcpGTINjcT9nl9LYRAngx5qSMnEe9snDR02mvKIcW1asE
	oaWdvGDSOyNvAGtMWErjg/KGDaV9ibAhySZm1gpd7NdwP3HuGdkZGZqBZ7P7U3SYe6xX2sM0qO9rF
	i7/Si8xIXAFbHyGxhULu0GOTiBHHGUjFytoSUm33MBrBDsjgl9LP1rHRk/ErMOXb1Ro3AchCCiWai
	YHleGKvPV9JfB/vCcAf+BEzA+Ny2L+uu4g5OZZy1yQStLcLnSlxuAOpHv7iP/yg82kEeqfo3yKvN8
	EMJn6MYviPFZRoBG8r5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3k1-0000000AVhs-2fvj;
	Thu, 05 Nov 2026 20:07:21 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3ja-0000000AVOT-0Yqi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=Kenou/u5GC+cXRy8kELS4DyKmMoQ5qDZG4ixNftcQaY=; t=1793909214; x=2109269214; 
	b=NwlLHwJqfHb5C0gw3E09HH8gylym0Jb6CWguUkkGfDUn5vkHb7TEe5MP8VM+T6fSF2gS5XAXFPF
	gMilW8aiHptoQTJZmqVyAnitblLTeJwb27plLlLbDe/IgN0nYp/pwpN+YHBnAmY+4xjM6+QPoH0ar
	jFe97/xBjIm03ohoEybO4+wjsmISB8c5wazZh2gS3R0G8cpE7DlA47kvb+f0ExL8SvFCx/cNJ0Ydp
	SZGKl56ITyXfA1O/GvS1zXbgMakKN4DBwQqS97gfQ7FyGyRUpm3t+a0Qauz4fuoek9eeYvUC6P9fE
	5YsJ55OtMKOVrZmtfy9yOZxU85eczQ6Popgw==;
Received: from [177.172.122.137] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xP3jV-003hS1-Dn; Thu, 05 Nov 2026 21:06:49 +0100
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Thu, 05 Nov 2026 17:05:48 -0300
Subject: [PATCH v9 13/15] syscalls: Avoid matching substrings in the ABI
 parsing
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261105-tonyk-syscall_table-v9-13-8d1275885d9c@igalia.com>
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
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
X-CRM114-CacheID: sfid-20261105_120656_724259_745404FF 
X-CRM114-Status: GOOD (  11.10  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently, the abi parsing for grep will match substrings. For instance, an
ABI called `abc` will match also the ABI called `abcde`. Use the space
limiter to match a complete word and avoid matching substrings.

While here, add a true command in the end of grep command to avoid the
script exiting earlier and being able to do the cleanup.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 scripts/syscallhdr.sh | 2 +-
 scripts/syscalltbl.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/syscallhdr.sh b/scripts/syscallhdr.sh
index cf6bba3019b1..cf35ff05b824 100755
--- a/scripts/syscallhdr.sh
+++ b/scripts/syscallhdr.sh
@@ -109,7 +109,7 @@ gen_hdr() {
 	tmpfile=$(mktemp)
 	offset_nr=$2
 
-	grep -E "^[0-9A-Fa-fXx]+[[:space:]]+$abis" "$input" > $tmpfile
+	grep -E "^[0-9A-Fa-fXx]+[[:space:]]+$abis+[[:space:]]" "$input" > $tmpfile || true
 	while read nr abi name native compat; do
 
 		if [ -n "$offset_nr" ]; then
diff --git a/scripts/syscalltbl.sh b/scripts/syscalltbl.sh
index 1e9cac32c02d..403a604e7c76 100755
--- a/scripts/syscalltbl.sh
+++ b/scripts/syscalltbl.sh
@@ -70,7 +70,7 @@ gen_tbl() {
 	tmpfile=$(mktemp)
 	offset_nr=$2
 
-	grep -E "^[0-9A-Fa-fXx]+[[:space:]]+$abis" "$input" > $tmpfile
+	grep -E "^[0-9A-Fa-fXx]+[[:space:]]+$abis+[[:space:]]" "$input" > $tmpfile || true
 	while read nr abi name native compat noreturn; do
 
                 if [ -n "$offset_nr" ]; then

-- 
2.56.0


