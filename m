Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9DCCA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+gTABO3yLvwj5zpCn1iXwAc4V2b2f6GGlKwYK5Pnws=; b=eDQbaTmvHGOlZWT6nPKP4z4P6T
	JXEPr4UdgDJFfHtuLAXgvPG0NQnLXsWEW5kH4EuRypMmrnxDYLWmTLG6BTeG90VutdzR2NSdSBQJ2
	N53xL4E+4nNojhQbaK2AvLf+I3J+pg/C+TWu0UJ6a15lyghpSihB5ghqDbeDjTY5tfXJgbchkw3Z0
	vmb5QAvnePXqAmp4jzl1lEvleSWzKPSCi7PMGce9tQd533es0beIDpXJfXRJ0CnZfO8XgjU9+zE6O
	VLeaIGREk1fX4yZaXpux06CUhSyRGDaTlCVWaKviOt+V2ORZejkKnykzoqVmfUQv8OHovElQaMo/Y
	1JTPwBRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ3x-00000002Mnl-1hJL;
	Wed, 07 Oct 2026 11:43:57 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ3v-00000002Mjz-1YGq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:43:56 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so7182052a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791373434; x=1791978234; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+gTABO3yLvwj5zpCn1iXwAc4V2b2f6GGlKwYK5Pnws=;
        b=B6sh5TEsI9mmb/CYc61yvnAdXEYEeW0iygq1+4T9dXZa63uNBVQPxpi1FsLfVcU1M7
         vLumILRzWn0JHbyJORtAm+d6n1KgLpgkQ3pALpKbFhnXxbjpJez5fvMFqhWaXaNaB9dS
         gguTDmbWBXmK1V6aoAMV/lHAQdz6UZ84+wMfgIrHozv5l6xlefR8DIfhYqrFdloNZR6p
         tF6DdyHSVCnHPOECVl6BZoS20/P73peMUo7W1or21fxBPTk29ZPe3VKwiR5V9RATtIqs
         +GlFWeRVFk8oVDKt4lHdOoZ8/PXTnGX1DYESFc9RKP1saQ41cWcbGIWjXLfwduxZLu6v
         ocFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373434; x=1791978234;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+gTABO3yLvwj5zpCn1iXwAc4V2b2f6GGlKwYK5Pnws=;
        b=SF9XhYmqnN+JE8gTtQBT5uBo0EPJCmtgcv9yNCfV1GbABZsN2wEuPpQw1rnSNQt6o/
         7/TXimFIGAlwhd9tFfdJw6b0ZIHS5Ob0bnGRzVcqqnk+jtUOaEFqDTd2g28bFzh/tXDH
         F1TgDuOof9slDh8HmXtJrJDlh03JOTYwj2N+cwQrdhU/FcaLmPFK7pSnd6rqlF0mN6oS
         xuHuY+wuiPb69fHS2Uv/roY75LmoSsv2IOBTsa7nnIi3NJiAPlcnq0PQd8EP1AolemT2
         sJ5cS6CSHB3B8wqE9clJFoQRNtm9G8qc09n4tkUGNwjra3sz8MFNuBjpsQiZSDhu4SxQ
         S3Cw==
X-Forwarded-Encrypted: i=1; AKwUvBx/WOth6q7ndaT7KOjq98KmswzgKnnbfJgbBI+ZfShgwpKLazeJkQNII4R4QxHjhdwi5QXWbl6onnwV03Xm5TwE@lists.infradead.org
X-Gm-Message-State: AFq9FYKnOZv0PRB/Ggmzl5uC3/6926oOKHep2R6LZ3qrg58ri3wLD2N/
	BJfb32Lr6zbCUSz/vfAzZWvB7yZ6X3Q7vcW0rFjXbwfwvj/oHntw9I5F0Irsr1A0i/dqIQZFWBO
	5V3auhgIKSJ23X+fIlsNyEUyKew==
X-Received: from pgaa8-n1.prod.google.com ([2002:a05:6a02:6488:10b0:cc7:b6ea:3094])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:258b:b0:3a8:96cb:fe8 with SMTP id 98e67ed59e1d1-3a89f6494d7mr1748991a91.9.1791373433404;
 Wed, 07 Oct 2026 04:43:53 -0700 (PDT)
Date: Wed,  7 Oct 2026 11:43:28 +0000
In-Reply-To: <20261007114335.440322-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20261007114335.440322-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Message-ID: <20261007114335.440322-5-dylanbhatch@google.com>
Subject: [PATCH v8 04/11] sframe: Separate reading of FRE from reading of FRE
 data words
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Mostafa Saleh <smostafa@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_044355_435003_B211C2D6 
X-CRM114-Status: GOOD (  18.24  )
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

From: Jens Remus <jremus@linux.ibm.com>

__find_fre() performs linear search for a matching SFrame FRE for a
given IP.  For that purpose it uses __read_fre(), which reads the whole
FRE.  That is the variable-size FRE structure as well as the trailing
variable-length array of variable-size data words.  For the search logic
to skip over the FRE it would be sufficient to read the variable-size
FRE structure only, which includes the count and size of data words.

Add fields to struct sframe_fre_internal to store the FRE data word's
address, count, and size.  Change __read_fre() to read the variable-
size FRE structure only and populate those new fields.  Change
__read_fre_datawords() to use those new fields.  Change __find_fre()
to use __read_fre_datawords() to read the FRE data words only after a
matching FRE has been found.

[ Dylan Hatch: Adapt for in-kernel unwinding without flexible FDEs. ]

Reviewed-by: Indu Bhagat <ibhagatgnu@gmail.com>
Signed-off-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 kernel/unwind/sframe.c | 97 +++++++++++++++++++++++++++++++-----------
 1 file changed, 73 insertions(+), 24 deletions(-)

diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index 2a188373be857..ec81110a36796 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -37,6 +37,9 @@ struct sframe_fre_internal {
 	s32		ra_off;
 	s32		fp_off;
 	u8		info;
+	unsigned long	dw_addr;
+	unsigned char	dw_count;
+	unsigned char	dw_size;
 };
 
 static __always_inline unsigned char fre_type_to_size(unsigned char fre_type)
@@ -180,6 +183,67 @@ static __always_inline int __find_fde(struct sframe_section *sec,
 		 s32 :	GET_SIGNED_AND_INC(to, from, size),	\
 		 s64 :	GET_SIGNED_AND_INC(to, from, size))
 
+static __always_inline int
+__read_default_fre_datawords(struct sframe_section *sec,
+			     struct sframe_fde_internal *fde,
+			     struct sframe_fre_internal *fre)
+{
+	unsigned char dataword_count = fre->dw_count;
+	unsigned char dataword_size = fre->dw_size;
+	unsigned long cur = fre->dw_addr;
+	s32 cfa_off, ra_off, fp_off;
+
+	GET_AND_INC(cfa_off, cur, dataword_size);
+	dataword_count--;
+
+	ra_off = sec->ra_off;
+	if (!ra_off && dataword_count) {
+		dataword_count--;
+		GET_AND_INC(ra_off, cur, dataword_size);
+	}
+
+	fp_off = sec->fp_off;
+	if (!fp_off && dataword_count) {
+		dataword_count--;
+		GET_AND_INC(fp_off, cur, dataword_size);
+	}
+
+	if (dataword_count)
+		return -EFAULT;
+
+	fre->cfa_off	= cfa_off;
+	fre->ra_off	= ra_off;
+	fre->fp_off	= fp_off;
+
+	return 0;
+}
+
+static __always_inline int
+__read_fre_datawords(struct sframe_section *sec,
+		     struct sframe_fde_internal *fde,
+		     struct sframe_fre_internal *fre)
+{
+	unsigned char fde_type = SFRAME_V3_FDE_TYPE(fde->info2);
+	unsigned char dataword_count = fre->dw_count;
+
+	if (!dataword_count) {
+		/* A FRE without data words indicates an outermost frame. */
+		fre->cfa_off	= 0;
+		fre->ra_off	= 0;
+		fre->fp_off	= 0;
+
+		return 0;
+	}
+
+	switch (fde_type) {
+	case SFRAME_FDE_TYPE_DEFAULT:
+		return __read_default_fre_datawords(sec, fde, fre);
+	/* Flexible FDEs not supported */
+	default:
+		return -EFAULT;
+	}
+}
+
 static __always_inline int __read_fre(struct sframe_section *sec,
 				      struct sframe_fde_internal *fde,
 				      unsigned long fre_addr,
@@ -189,7 +253,6 @@ static __always_inline int __read_fre(struct sframe_section *sec,
 	unsigned char fde_pctype = SFRAME_V3_FDE_PCTYPE(fde->info);
 	unsigned char fre_type = SFRAME_V3_FDE_FRE_TYPE(fde->info);
 	unsigned char dataword_count, dataword_size;
-	s32 cfa_off, ra_off, fp_off;
 	unsigned long cur = fre_addr;
 	unsigned char addr_size;
 	u32 ip_off;
@@ -209,7 +272,7 @@ static __always_inline int __read_fre(struct sframe_section *sec,
 	GET_AND_INC(info, cur, 1);
 	dataword_count = SFRAME_V3_FRE_DATAWORD_COUNT(info);
 	dataword_size  = dataword_size_enum_to_size(SFRAME_V3_FRE_DATAWORD_SIZE(info));
-	if (!dataword_size || !dataword_count)
+	if (!dataword_size)
 		return -EFAULT;
 
 	if (cur + (dataword_count * dataword_size) > sec->fres_end)
@@ -220,30 +283,11 @@ static __always_inline int __read_fre(struct sframe_section *sec,
 		return -EFAULT;
 
 	fre->size	= addr_size + 1 + (dataword_count * dataword_size);
-
-	GET_AND_INC(cfa_off, cur, dataword_size);
-	dataword_count--;
-
-	ra_off = sec->ra_off;
-	if (!ra_off && dataword_count) {
-		dataword_count--;
-		GET_AND_INC(ra_off, cur, dataword_size);
-	}
-
-	fp_off = sec->fp_off;
-	if (!fp_off && dataword_count) {
-		dataword_count--;
-		GET_AND_INC(fp_off, cur, dataword_size);
-	}
-
-	if (dataword_count)
-		return -EFAULT;
-
 	fre->ip_off	= ip_off;
-	fre->cfa_off	= cfa_off;
-	fre->ra_off	= ra_off;
-	fre->fp_off	= fp_off;
 	fre->info	= info;
+	fre->dw_addr	= cur;
+	fre->dw_count	= dataword_count;
+	fre->dw_size	= dataword_size;
 
 	return 0;
 }
@@ -293,6 +337,7 @@ static __always_inline int __find_fre(struct sframe_section *sec,
 	bool which = false;
 	unsigned int i;
 	u32 ip_off;
+	int ret;
 
 	ip_off = ip - fde->func_addr;
 
@@ -333,6 +378,10 @@ static __always_inline int __find_fre(struct sframe_section *sec,
 		return -EINVAL;
 	fre = prev_fre;
 
+	ret = __read_fre_datawords(sec, fde, fre);
+	if (ret)
+		return ret;
+
 	if (sframe_init_cfa_rule_data(&frame->cfa, fre->info, fre->cfa_off))
 		return -EINVAL;
 
-- 
2.56.0.360.g66cac248cb-goog


