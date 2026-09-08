Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09A0C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bC1WWh/xuFVa+YUjJaTnVEkwteG3jK4MlszJkiclU94=; b=iU8DNiGs546sq6On+rlOVhU8mK
	kQUjTPb2xKfIwBVE5+kmpDhvAhL9egC0wMYt3GCN3tlrGXmF7WF1DbduWlwVvvgFLwuc9UsnSVBMk
	f22zAH1XLKILkTWVmdxwABb17hhU3aAh38q2qVPi8dkD2VTyRZdyF1Q9fl5rlTaJjY2UQw4owjugC
	oRnJSixXMazAVjM6ooFge4vB5bbEZHoeyBczwEEKFQRNrJu0FEFU/jc6WaFQ40LppyJxXgKzAa9Ip
	ti9aAKR9BJtMn2oBbMfq/oEQXJGHw507gRE4QvHSer4ofsrDv5YKU3+dSv0XLXuSI8OGYBlw3dSo9
	IedPDahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ohw-000000086GT-1AoG;
	Tue, 08 Sep 2026 05:49:24 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ohu-000000086Fy-3AS4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:49:23 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cc1cc1b42b5so4235342a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846562; x=1789451362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bC1WWh/xuFVa+YUjJaTnVEkwteG3jK4MlszJkiclU94=;
        b=fIFE1cx22dLTSmsQhsq94I1EFNHkCtF6XXRoOYoBijUoObm56jLIAOXROGyltkI1hM
         IwdBWwocAqMzno5KYw5m8Ytc7X2gHKdesClsdKVtHMj6R1HR3xSUE9rJHSFO0Kya9H+i
         QHhUT6e8PWXVZiTiZaD5UzwV6ZqvFwpWtbTf1uNblbxSTDWSQFm0lxjExy/tWJXPwP4w
         1bsgDJ9J4lJ2Sao9XFcdAcMG152TT/N/34CN6QsboaxlQpfcr/sZz38i3kL/Xk5jE+CS
         zRaXupsbp4vYzdBwthE8KufPNnDHARXOi6MvFZ7+8vyD0iPWZMchE+x4uODY2zvnLHot
         7gUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846562; x=1789451362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bC1WWh/xuFVa+YUjJaTnVEkwteG3jK4MlszJkiclU94=;
        b=suDC9gAYQSq8fxImMC14inU2zd8kTE/D6GKQRsU6j6+XS/5YqijpINKQoFsAyP4x5P
         VjehEql9AzyC3YPlFkPXU5RQh72HushnrDqMDP5OZ5w11wL2CBA9YkCWYNDzOHCh12uf
         kExy1KMMNbWubys9b3VHW1Tjz6XKfxNIC0DwiySGUUv+JSjRAAfvUi7EURwsJ+JBU8we
         7H39krzhhEJBpRUoK+xOgmyxcn437i9j9e298sSyjK0ImaHq7Ux3GZMlI5QwPt6jzPyI
         U+F8PnEKabFEf1wEmWExh2+ooyTK3o+Xttgf76VHW2Kr3OWxalF/K1br+PTaGkLf3x5J
         +VBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUxbGTfz+SjVNHFI4NcsyYD2WzGIOGkC+YANZOEcctUKF/S7lzUeZnhHSlMyK2xZIsKMUISnOgJt60tywGJmjt@lists.infradead.org
X-Gm-Message-State: AFuF++kON/bz0rg24rw5/e/R8zbsHOJMnOw1w01kvR5lfZK1ZAa3HNjr
	q7y83OxXiGZhXHLWfIddB7MwYwpUrZ9D5g4rhIbv95TYWKduGY+03WKm
X-Gm-Gg: AYBFou2nUMmGsq9W5qOVd73d1k8ctlqnjjrCeHRz4rdmeU1eQ5q9JyfIcralG6Wc0B/
	FAxPbZyMR3uLm4CL0CUBBcVg6qUYtxuzh/lzHCLVu1R1vYcjgeUleNf/5YopV4uSDhUUtO7xFon
	nZqAv5RpDtYoTLpn75MFwk+91g4CQmk5f+Ipouz8ezRFy3bdj/JuT9fN7N2vS/2nXMMOIFUAT6s
	yQkEoMl8vJomF3eoz1t171gcdu4z2WL7Unvh9ZMMpndyG1HiLQt28JwtgckRvQzmpINKHkzEXqe
	Usxni4127TQi6SYAcFTVRBSB2XF/g9GFWUQNRIf8Kb9GMDCGfikJNdyzXBL5HefIDhrfe1SJCO7
	Ik2kAZSuO3yGeL1OJRNpBfv6sjNhSHGSTWb3dGWpjz9eoA3F/PHRVcs2v7bi3+Q1RN+JmQxJ6n9
	Uas7NYm6zZia5nG2r64fwdMfxbBLYQ+nYeGOQJF4zDhtAvoXMeJaWkB9gq7P31AwN4ynGJkxh0i
	gccohg0Ou9wklpXJNnwK10a
X-Received: by 2002:a05:6a20:4393:b0:3d3:af66:9f61 with SMTP id adf61e73a8af0-3da3a16b389mr43628321637.27.1788846561929;
        Mon, 07 Sep 2026 22:49:21 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-334fbd5e6f6sm25690109eec.23.2026.09.07.22.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:49:21 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Puranjay Mohan <puranjay@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH bpf-next v4 2/7] bpf: fix typos in comments
Date: Tue,  8 Sep 2026 11:18:48 +0530
Message-ID: <20260908054853.13820-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908054853.13820-1-hemanth.selam@gmail.com>
References: <20260908054853.13820-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_224922_794211_7C894713 
X-CRM114-Status: GOOD (  14.97  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/linux/filter.h       | 4 ++--
 kernel/bpf/reuseport_array.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/filter.h b/include/linux/filter.h
index 00ad8b63aa47..4eff6e601b05 100644
--- a/include/linux/filter.h
+++ b/include/linux/filter.h
@@ -147,7 +147,7 @@ struct ctl_table_header;
 #define BPF_ALU32_IMM(OP, DST, IMM)				\
 	BPF_ALU32_IMM_OFF(OP, DST, IMM, 0)
 
-/* Endianess conversion, cpu_to_{l,b}e(), {l,b}e_to_cpu() */
+/* Endianness conversion, cpu_to_{l,b}e(), {l,b}e_to_cpu() */
 
 #define BPF_ENDIAN(TYPE, DST, LEN)				\
 	((struct bpf_insn) {					\
@@ -1029,7 +1029,7 @@ static inline u8 *bpf_skb_cb(const struct sk_buff *skb)
 	 *
 	 * In some socket filter cases, the cb unfortunately needs to be
 	 * saved/restored so that protocol specific skb->cb[] data won't
-	 * be lost. In any case, due to unpriviledged eBPF programs
+	 * be lost. In any case, due to unprivileged eBPF programs
 	 * attached to sockets, we need to clear the bpf_skb_cb() area
 	 * to not leak previous contents to user space.
 	 */
diff --git a/kernel/bpf/reuseport_array.c b/kernel/bpf/reuseport_array.c
index 49b8e5a0c6b4..4de08abfd94e 100644
--- a/kernel/bpf/reuseport_array.c
+++ b/kernel/bpf/reuseport_array.c
@@ -207,7 +207,7 @@ reuseport_array_update_check(const struct reuseport_array *array,
 		return -ENOTSUPP;
 
 	/*
-	 * sk must be hashed (i.e. listening in the TCP case or binded
+	 * sk must be hashed (i.e. listening in the TCP case or bound
 	 * in the UDP case) and
 	 * it must also be a SO_REUSEPORT sk (i.e. reuse cannot be NULL).
 	 *
-- 
2.48.1


