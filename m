Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E957AC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 23:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vncym+/9iDRoxIE5WZB5WeZ1MhGwXFjx6dypVyLGBrk=; b=iTZSdWZePklTix/QOhF3GmFyqr
	ejiWNdvmHfywko1UAHJbPbGmixh13gYEyBk51LZSENxQatn+qLN2UTQUwZZD+YdJO4B123zTDZjBy
	31ghn82zTJvCBYVIHgdGrYABovxOCJ6B/NMgTx60TUbjmWMPtmtXgBJ8Gmb2mN2ON6A5yBNz3yIOu
	LT375HCInXOHzUhILBDNgas7IJXdR39ChWlZYw3nW5LXRm4/n9tvDwEoOx+YLhs3zCvnCkn30Y0Re
	9AC9lqX6jGJz0WJGDPUhQAss9Z15xIywlWzeYOiCkuGnkRC3Vw/HSARpcQSUaFcVybA81usfHhdE8
	Ahs76zCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x05s3-00000006UnV-1loR;
	Fri, 28 Aug 2026 23:20:27 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x05rv-00000006Uhr-0trW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 23:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=Vncym+/9iDRoxIE5WZB5WeZ1MhGwXFjx6dypVyLGBrk=; b=BqyoY1p72wSTux/MZTu6eTU+Q9
	FP251vuGAZmUENK0nnVRs48UXWwLsJ33Ttq8pIPEt1UpMi68cZBlJKvpHQ/0cd6Fd17xjL89LLHem
	02rm+MEvtKHA6qsqoGfxek9xrcvpMYvpweF88W8j1IfIq2giULo+H8aiYQsGIkRfPb20l92vu6vZt
	WAhoOSk5zaIF2dLVdEP29Yog+IdN4FeTPxlqsynG7KKTdjIkRUqAWCQHpRTY13sskABJQG36JfVlp
	Ej8OgrpdQ+rE77symMV+40XcQQBQ3c1RxuL8ww1e9MXmvONNpwBfJ2GDg4YNcqKSHwYSWs78uDm3K
	YOjiQ2Dg==;
Received: from [187.57.78.212] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x05rr-00B3sF-NW; Sat, 29 Aug 2026 01:20:15 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Fri, 28 Aug 2026 20:19:37 -0300
Subject: [PATCH v6 10/13] syscalls: Add an option for offsetting the common
 table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260828-tonyk-syscall_table-v6-10-fdd358456cf1@igalia.com>
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
X-CRM114-CacheID: sfid-20260828_162019_269488_C575548E 
X-CRM114-Status: GOOD (  11.91  )
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

To better support architectures that doesn't share the same syscall
numbers, but have them in the same sequence, add an new option to offset
the common syscall table numbers by a value. This make it possible to reuse
the common syscall table for alpha.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
Changes from v4:
 - I was reusing the logic from --offset to apply the --common-offset, but
 the logic is different: --offset does a string concat, and --common-offset
 does a addition to the number
---
 scripts/syscallhdr.sh | 26 ++++++++++++++++++--------
 scripts/syscalltbl.sh | 24 +++++++++++++++++++-----
 2 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/scripts/syscallhdr.sh b/scripts/syscallhdr.sh
index a9b880070a3d..6c24428b65b6 100755
--- a/scripts/syscallhdr.sh
+++ b/scripts/syscallhdr.sh
@@ -16,17 +16,18 @@
 set -e
 
 usage() {
-	echo >&2 "usage: $0 [--abis ABIS] [--emit-nr] [--offset OFFSET] [--prefix PREFIX] [--common-tbl PATH] INFILE OUTFILE" >&2
+	echo >&2 "usage: $0 [--abis ABIS] [--emit-nr] [--offset OFFSET] [--prefix PREFIX] [--common-tbl PATH] [--common-offset NR] INFILE OUTFILE" >&2
 	echo >&2
 	echo >&2 "  INFILE    input syscall table"
 	echo >&2 "  OUTFILE   output header file"
 	echo >&2
 	echo >&2 "options:"
-	echo >&2 "  --abis ABIS        ABI(s) to handle (By default, all lines are handled)"
-	echo >&2 "  --emit-nr          Emit the macro of the number of syscalls (__NR_syscalls)"
-	echo >&2 "  --offset OFFSET    The offset of syscall numbers"
-	echo >&2 "  --prefix PREFIX    The prefix to the macro like __NR_<PREFIX><NAME>"
-	echo >&2 "  --common-tbl PATH  Use the common number table"
+	echo >&2 "  --abis ABIS             ABI(s) to handle (By default, all lines are handled)"
+	echo >&2 "  --emit-nr               Emit the macro of the number of syscalls (__NR_syscalls)"
+	echo >&2 "  --offset OFFSET         The offset of syscall numbers"
+	echo >&2 "  --prefix PREFIX         The prefix to the macro like __NR_<PREFIX><NAME>"
+	echo >&2 "  --common-tbl PATH       Use the common number table"
+	echo >&2 "  --common-offset NR      Add an offset for the numbers of the common table"
 	exit 1
 }
 
@@ -34,6 +35,7 @@ usage() {
 abis=
 emit_nr=
 offset=
+common_offset=
 prefix=
 common_tbl=
 common_tbl_path=
@@ -57,6 +59,9 @@ do
 		common_tbl=1
 		common_tbl_path=$2
 		shift 2;;
+	--common-offset)
+		common_offset=$2
+		shift 2;;
 	-*)
 		echo "$1: unknown option" >&2
 		usage;;
@@ -98,14 +103,19 @@ emit_end_guard() {
 }
 
 max=0
-# gen_hdr(infile)
+# gen_hdr(infile, offset_nr)
 gen_hdr() {
 	input=$1
 	tmpfile=$(mktemp -p .)
+	offset_nr=$2
 
 	grep -E "^[0-9A-Fa-fXx]+[[:space:]]+$abis" "$input" > $tmpfile
 	while read nr abi name native compat; do
 
+		if [ -n "$offset_nr" ]; then
+			nr=$((nr + offset_nr))
+		fi
+
 		max=$nr
 
 		if [ -n "$offset" ]; then
@@ -123,7 +133,7 @@ emit_start_guard > $outfile
 gen_hdr $infile >> $outfile
 
 if [ -n "$common_tbl" ]; then
-	gen_hdr $common_tbl_path  >> "$outfile"
+	gen_hdr $common_tbl_path $common_offset >> "$outfile"
 fi
 
 if [ -n "$emit_nr" ]; then
diff --git a/scripts/syscalltbl.sh b/scripts/syscalltbl.sh
index f5b95b19ac92..eaad7be4c393 100755
--- a/scripts/syscalltbl.sh
+++ b/scripts/syscalltbl.sh
@@ -16,14 +16,15 @@
 set -e
 
 usage() {
-	echo >&2 "usage: $0 [--abis ABIS] [--common-tbl PATH] INFILE OUTFILE" >&2
+	echo >&2 "usage: $0 [--abis ABIS] [--common-tbl PATH] [--common-offset NR] INFILE OUTFILE" >&2
 	echo >&2
 	echo >&2 "  INFILE    input syscall table"
 	echo >&2 "  OUTFILE   output header file"
 	echo >&2
 	echo >&2 "options:"
-	echo >&2 "  --abis ABIS        ABI(s) to handle (By default, all lines are handled)"
-	echo >&2 "  --common-tbl PATH  Use the common syscall number table"
+	echo >&2 "  --abis ABIS             ABI(s) to handle (By default, all lines are handled)"
+	echo >&2 "  --common-tbl PATH       Use the common syscall number table"
+	echo >&2 "  --common-offset OFFSET  Add an offset for the numbers of the common table"
 	exit 1
 }
 
@@ -31,6 +32,7 @@ usage() {
 abis=
 common_tbl=
 common_tbl_path=
+common_offset=
 
 while [ $# -gt 0 ]
 do
@@ -42,6 +44,9 @@ do
 		common_tbl=1
 		common_tbl_path=$2
 		shift 2;;
+	--common-offset)
+		common_offset=$2
+		shift 2;;
 	-*)
 		echo "$1: unknown option" >&2
 		usage;;
@@ -59,14 +64,23 @@ outfile="$2"
 
 nxt=0
 
-# gen_tbl(infile)
+# gen_tbl(infile, offset_nr)
 gen_tbl() {
 	input=$1
 	tmpfile=$(mktemp -p .)
+	offset_nr=$2
 
 	grep -E "^[0-9A-Fa-fXx]+[[:space:]]+$abis" "$input" > $tmpfile
 	while read nr abi name native compat noreturn; do
 
+                if [ -n "$offset_nr" ]; then
+                        nr=$((nr + offset_nr))
+                fi
+
+		if [ -n "$offset" ]; then
+			nr="($offset + $nr)"
+		fi
+
 		if [ $nxt -gt $nr ]; then
 			echo "error: $input: syscall table is not sorted or duplicates the same syscall number" >&2
 			exit 1
@@ -108,5 +122,5 @@ gen_tbl() {
 gen_tbl $infile  > "$outfile"
 
 if [ -n "$common_tbl" ]; then
-	gen_tbl $common_tbl_path >> "$outfile"
+	gen_tbl $common_tbl_path $common_offset >> "$outfile"
 fi

-- 
2.55.0


