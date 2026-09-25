Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0B2C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 11:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nO41lh/H4SzcoCdayvonqkq9okmqSnTubMvlLylaa1w=; b=nEjLLq5ALs9PnlZguy1Oh9gn6C
	dKPpeLtvPs3jhQY3riGL9uvCtJ/k3XZ6ud+UxCWH4Hx+FdFRncPvhTryBKchJQKcwI2lxh9O3w1IP
	fvTqZWC3fY8F17ysxMO/1o+eXyP2A+9CCx/3q09c58wR3oJJDDwjOf2EMulMGQOBe0yd8cpTfEPQI
	P0oPCTT1I/LYe/xwoUjtlBMoLTxy26UT7am3Uqiyy+UMKndsFq+1M+JcVX2gwGwabgv54mOxbf6bN
	W8AiXPwpfCE/aSM+MdOKpciGxQlg6ljX8BREyKYdK7zhd7VoUh4QKJKGQV2N7wdtudgDd8KJJ331u
	4VMmZw2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4Cn-0000000DD6L-2OBm;
	Fri, 25 Sep 2026 11:35:05 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4Cf-0000000DD2m-12Rh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 11:34:58 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260925113454euoutp029aba4d7652769b32aa244658574edba9~YjTFViDYa0681106811euoutp02X;
	Fri, 25 Sep 2026 11:34:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260925113454euoutp029aba4d7652769b32aa244658574edba9~YjTFViDYa0681106811euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790336094;
	bh=nO41lh/H4SzcoCdayvonqkq9okmqSnTubMvlLylaa1w=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=HT2us8FYPCD02Bqr6zxqNELSXegcdUB71/GiSE79vPh0ddbcgSd4gYAdoEzE+9FfU
	 aXibiNf7aXZYzd8naEbWeqtRvgyMmH39N++134vhhtm7ENQIBAGk9Lb7PSqTDSnY5A
	 fdjlRPG2x+BJwq2hJNUpKlor5WltkEwRd9KhMQsU=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260925113454eucas1p1ffe6b62a29086943a60137ed7e1f42ef~YjTFCnGhF0249002490eucas1p1k;
	Fri, 25 Sep 2026 11:34:54 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260925113452eusmtip215fd236cce7ebc09bee5052a2af6141d~YjTDfNwYs0229302293eusmtip2L;
	Fri, 25 Sep 2026 11:34:52 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 25 Sep 2026 13:27:32 +0200
Subject: [PATCH RFC 2/9] lib/lz4: backport upstream's -Wmissing-prototypes
 fix
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-lz4-vendor-upstream-v1-2-1c7ffbe21c4b@samsung.com>
In-Reply-To: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,  Nathan Chancellor
	<nathan@kernel.org>,  Nick Desaulniers <ndesaulniers@google.com>,  Bill
	Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,  Russell
	King <linux@armlinux.org.uk>,  Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>,  "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,  Helge Deller <deller@gmx.de>,
	Heiko Carstens <hca@linux.ibm.com>,  Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>,  Christian Borntraeger
	<borntraeger@linux.ibm.com>,  Sven Schnelle <svens@linux.ibm.com>, Thomas
	Gleixner <tglx@kernel.org>,  Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>,  Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Minchan Kim <minchan@kernel.org>,  Sergey
	Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>,  Nick
	Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>,  Chao Yu
	<chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,  Herbert Xu
	<herbert@gondor.apana.org.au>,  Phillip Lougher <phillip@squashfs.org.uk>,
	Sungguk <sungguk.na@samsung.com>,  Jaehoon Chung <jh80.chung@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2100;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=wMVojsfuYF9eT5q5rMs2c29qyYKzm0LcLr4isls1UTQ=;
	b=owEBbQGS/pANAwAKASw99I2nQptuAcsmYgBqtlxRhAkB7TyATBVr/4+ZvB5W43K313iDQp6Eo
	GaNSuSsmEuJATMEAAEKAB0WIQR2xBTdTO5XfoUTSOYsPfSNp0KbbgUCarZcUQAKCRAsPfSNp0Kb
	bqqICAChUCgNeDyv3RGoQ6NgJobTPJZsAhZENmNk+sFHRrRm6s6yXgvJuRHnzHz67u44q3G2aUJ
	/w62OUYZhnqPXdGHG01nPAl/of1ajK7KLqRJZtwlq76hT4q/T3bD7HTJyl07fgzoJcWA3FJeoQC
	1ODZi0rz3jnFdvvowe7eSTcTvlQ7A4X+H/saBtEhuoKsMAlE3scE8X1i/kj0dRRcx8yrOhXE433
	ExlndGyD/0UTmNLSkn9uACbJR7e7T83b1n4lRCzw5cW9WKelHdl7gxKHn3nCqO43ppJbweGga2A
	TmrhwDJsGXJ9NmpfsGfz7Gd6ImCi+0CtxVH3d3CbdbEGiCeL
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=76C414DD4CEE577E851348E62C3DF48DA7429B6E
X-CMS-MailID: 20260925113454eucas1p1ffe6b62a29086943a60137ed7e1f42ef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260925113454eucas1p1ffe6b62a29086943a60137ed7e1f42ef
X-EPHeader: CA
X-CMS-RootMailID: 20260925113454eucas1p1ffe6b62a29086943a60137ed7e1f42ef
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
	<CGME20260925113454eucas1p1ffe6b62a29086943a60137ed7e1f42ef@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_043457_587369_409B8A0C 
X-CRM114-Status: GOOD (  16.27  )
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

v1.10.0 defines LZ4_loadDict_internal() in lz4.c and LZ4HC_searchExtDict()
in lz4hc.c with external linkage and no prototype, which the kernel's
-Wmissing-prototypes rejects. The first also prevents linking, since
lz4_compress.c and lz4_decompress.c both include lz4.c and would each
define it.

Neither can be forward declared static in lz4_deps.h like the other bare
helpers, because their signatures use types declared inside the .c files.

Take the two hunks of upstream commit 5ef1f16929b5
("fix -Wmissing-prototypes warnings") that apply to the files we vendor.
This is the only deviation from the tag, and goes away at the next
re-sync.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 lib/lz4/upstream/lz4.c   | 2 +-
 lib/lz4/upstream/lz4hc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/lz4/upstream/lz4.c b/lib/lz4/upstream/lz4.c
index a2f7abee19fb9a5c768f2a6c266acf5b571f0855..0d474be0236a698d297ab9a430f5082485eb3709 100644
--- a/lib/lz4/upstream/lz4.c
+++ b/lib/lz4/upstream/lz4.c
@@ -1584,7 +1584,7 @@ int LZ4_freeStream (LZ4_stream_t* LZ4_stream)
 
 typedef enum { _ld_fast, _ld_slow } LoadDict_mode_e;
 #define HASH_UNIT sizeof(reg_t)
-int LZ4_loadDict_internal(LZ4_stream_t* LZ4_dict,
+static int LZ4_loadDict_internal(LZ4_stream_t* LZ4_dict,
                     const char* dictionary, int dictSize,
                     LoadDict_mode_e _ld)
 {
diff --git a/lib/lz4/upstream/lz4hc.c b/lib/lz4/upstream/lz4hc.c
index 4d8c36a6978fcae09e4c4a936572b4b271513466..32b29f382268d961d65383b24c7225494d9044ad 100644
--- a/lib/lz4/upstream/lz4hc.c
+++ b/lib/lz4/upstream/lz4hc.c
@@ -360,7 +360,7 @@ typedef struct {
     int back;  /* negative value */
 } LZ4HC_match_t;
 
-LZ4HC_match_t LZ4HC_searchExtDict(const BYTE* ip, U32 ipIndex,
+static LZ4HC_match_t LZ4HC_searchExtDict(const BYTE* ip, U32 ipIndex,
         const BYTE* const iLowLimit, const BYTE* const iHighLimit,
         const LZ4HC_CCtx_internal* dictCtx, U32 gDictEndIndex,
         int currentBestML, int nbAttempts)

-- 
2.34.1


