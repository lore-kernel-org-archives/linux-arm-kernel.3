Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A26C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 22:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYreVBH/AVISc3OQPvTRsLxBAk30fKgkR5xyJoFiadU=; b=Sr/a9hqb2ltAhuque0Pg4nLEyD
	z58WrD+HHJlGAI/hcsWG+f7x/jZ/kpMBIXl9lWd2FsBFEUvUw1tHOGy/H3nyWFl8tDGayb/16YQqH
	y2dC/7iCYcjpyHRqG9lHGSQORgCKZ++IljNLMKu6MhWA04d8N8gwADW3u3xbpdjt0lSj83OZc7vGa
	vVdWflFb5IX3/Ksu/OyfmfATAPf+HmYaj3ySb+TuTxLTPYPu2n0DTdaBzdkbtazNkxcwhtk6UMR4r
	U6slNt1vVolH0DFepK1k2q1gf4xwA3PvyR1YatM69x3CsQnj3sr5xt3afUhkXFACDA0uSkD6wdHWM
	tXyjlfUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hHt-0000000FeDv-2gzV;
	Fri, 18 Sep 2026 22:42:33 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hHY-0000000FdxY-39rh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 22:42:13 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so1516514a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 15:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789771331; x=1790376131; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cYreVBH/AVISc3OQPvTRsLxBAk30fKgkR5xyJoFiadU=;
        b=IobPK87+appmVvPNPnKxlv8xyVcEj/b7dburzLMc+w+jbWjU8Y80//UrAOWO7U4qb7
         5+g1e2i8gV+QbzX54YR2s8CIrxfKxOQBz6VD6FrhPamKXQaww9epHCP+DlPhxQATkrj6
         gmmyyJOHO4Z7rDPwjRsRFKdQH9/evxMCB8m4ewaEbCkghU7y1SGlSP+132T7SH4lGkjt
         GYIxf9yYEXLFccnFUArMzxlt2q54uqoqJSUYRKME8tC3FcSDMpAJGlCxDS1Evo1Wf9JH
         khE2DsogoTp8+OcuW7/HQ1x5FfONudfOC3WgqF+3sl31q2fQ2iW9NPZdXm+AeSMXvI4D
         MDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789771331; x=1790376131;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYreVBH/AVISc3OQPvTRsLxBAk30fKgkR5xyJoFiadU=;
        b=TcPGQa6jdKJEPISMNdAI84AKC/JBAS0/vEhXbjx4jI4pXkK3oJMG0KH5EnhIna53f5
         VbGQSnr68Arld24DUZuEa3Onz5PvIRy01lZBJs8YxULQmWHXdbrfY8Yalo3g16J/BF+p
         4GcE51dTvjXMs1WB6bn2gJQ1gTbRRPAJKzaI/DzAtOJskY1kvbqppJFLxR6rW5XFeDDW
         Xf7+Ho6kkW5cGdMSXmTnnu/Z8WmdwE9sj2jlHuRir3QJKrZBwz4YWIc+Lm3aVVHolztS
         JejUP3Ie/WTIwcJgrPjkfL0Sto7A+F2/FgDx+oPVlZV5NN2qXE7KSZJRqza1R+BcjNhn
         XoMg==
X-Forwarded-Encrypted: i=1; AKwUvBwJ2APsCNuZvgi4EBwSRtS1MI3zP1lgsvcN4esH3NVaQoZDrcF0ToI1LB4wvQEFkG9vmkCj4lodxJVQ4KsAbVdB@lists.infradead.org
X-Gm-Message-State: AFuF++nbwlFXeWprrB5Nc661Jr1SydJCYs1+n64nusdnKIMSPCwkUH/l
	9kwVkI6iD5LFNogGceAj/0I3lCv6WhVOCrCK7HxFZQ9kkrq++GzY5eTUjfUx/fnhsZHTTM1hjX8
	2O/frqro06iyS4/owcnzjDR60+A==
X-Received: from pgdi3.prod.google.com ([2002:a05:6a02:51e3:b0:cc5:253c:a532])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:72aa:b0:3dd:a006:7b36 with SMTP id adf61e73a8af0-3dda0067bbfmr1750743637.53.1789771330766;
 Fri, 18 Sep 2026 15:42:10 -0700 (PDT)
Date: Fri, 18 Sep 2026 22:41:50 +0000
In-Reply-To: <20260918224157.1471085-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260918224157.1471085-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918224157.1471085-5-dylanbhatch@google.com>
Subject: [PATCH v7 04/11] sframe: Separate reading of FRE from reading of FRE
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
X-CRM114-CacheID: sfid-20260918_154212_816701_41A97005 
X-CRM114-Status: GOOD (  19.04  )
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

This patch is adapted from commit 745489faa10c ("unwind_user/sframe:
Separate reading of FRE from reading of FRE data words") and squashes
changes from:

 - fdaf91d4fc0d ("unwind_user/sframe: Add support for SFrame V3
   flexible FDEs")
 - 79313210e44e ("unwind_user/sframe: Add support for outermost frame
   indication")

all of which are from Steven's sframe/core branch.

Changes include:
 - Drop support for flexible FDEs (SFRAME_FDE_TYPE_FLEX).
 - Sqaush in creation of __read_default_fre_datawords() and
   __read_fre_datawords().
 - Squash in outermost frame handling logic.
 - Deferred sframe_validate_section() changes to a later patch.
---
 kernel/unwind/sframe.c | 97 +++++++++++++++++++++++++++++++-----------
 1 file changed, 73 insertions(+), 24 deletions(-)

diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index f3975c7e89493..9aac703f7ce6e 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -36,6 +36,9 @@ struct sframe_fre_internal {
 	s32		ra_off;
 	s32		fp_off;
 	u8		info;
+	unsigned long	dw_addr;
+	unsigned char	dw_count;
+	unsigned char	dw_size;
 };
 
 static __always_inline unsigned char fre_type_to_size(unsigned char fre_type)
@@ -179,6 +182,67 @@ static __always_inline int __find_fde(struct sframe_section *sec,
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
@@ -188,7 +252,6 @@ static __always_inline int __read_fre(struct sframe_section *sec,
 	unsigned char fde_pctype = SFRAME_V3_FDE_PCTYPE(fde->info);
 	unsigned char fre_type = SFRAME_V3_FDE_FRE_TYPE(fde->info);
 	unsigned char dataword_count, dataword_size;
-	s32 cfa_off, ra_off, fp_off;
 	unsigned long cur = fre_addr;
 	unsigned char addr_size;
 	u32 ip_off;
@@ -208,7 +271,7 @@ static __always_inline int __read_fre(struct sframe_section *sec,
 	GET_AND_INC(info, cur, 1);
 	dataword_count = SFRAME_V3_FRE_DATAWORD_COUNT(info);
 	dataword_size  = dataword_size_enum_to_size(SFRAME_V3_FRE_DATAWORD_SIZE(info));
-	if (!dataword_size || !dataword_count)
+	if (!dataword_size)
 		return -EFAULT;
 
 	if (cur + (dataword_count * dataword_size) > sec->fres_end)
@@ -219,30 +282,11 @@ static __always_inline int __read_fre(struct sframe_section *sec,
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
@@ -292,6 +336,7 @@ static __always_inline int __find_fre(struct sframe_section *sec,
 	bool which = false;
 	unsigned int i;
 	u32 ip_off;
+	int ret;
 
 	ip_off = ip - fde->func_addr;
 
@@ -332,6 +377,10 @@ static __always_inline int __find_fre(struct sframe_section *sec,
 		return -EINVAL;
 	fre = prev_fre;
 
+	ret = __read_fre_datawords(sec, fde, fre);
+	if (ret)
+		return ret;
+
 	if (sframe_init_cfa_rule_data(&frame->cfa, fre->info, fre->cfa_off))
 		return -EINVAL;
 
-- 
2.55.0.1082.g2b9226bbc0-goog


