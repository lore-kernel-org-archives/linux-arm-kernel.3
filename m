Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9BEC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 04:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lk88M/pDZxe/5FAVj+dp68PIWOvqnCOJ0AD0p9smdgE=; b=qk+ftsnHoCyDZf5OsruAj/5c6A
	2IbAKmc38JRKiZpb9H5e8sZmtrfTk/4N+x+iCmFHnXzYSqvlYzW6mXe8zF8szt5JPP+bcL3So7kGq
	PnIn5L8vAqSjsOBAeapyX7Ee1GRge1G6Nc18XDSXVGzrPxbKR6j+dQnD9xBu/zXoLsTm7r4ygmQPX
	yqQdf2GMUUB7oDMZeFrfjLaHDv4tX7ms/+F8qd9+ha0EQCE0/muOH/wkfK7KIgg9fmbyjHT2sx3OC
	EbVzXG0fOrvw9fMx4bOUhODFtdllEb3g44Odc+DBWvMmzBS2WlV7ZHSzo3aUkz7qWf4luLbD9SAq9
	wmca8TEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RKv-00000005srg-48Dg;
	Mon, 07 Sep 2026 04:52:05 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RKt-00000005sqQ-3axd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 04:52:05 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso2203922a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 21:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756723; x=1789361523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lk88M/pDZxe/5FAVj+dp68PIWOvqnCOJ0AD0p9smdgE=;
        b=Hb/eyMIZf2cKTrIvVPbOzTqAGE7jFZ8qyZvPl47he0b5vz7sHogUJv1Ov97O3xBcNn
         DSQSe6KptaNBSM7C/5CDSN/Cbfx8i8UfjTzW90pP0xF8X5PTto82t7CvV0VVn3x3pH4V
         lZPCu6bu/IdBn0sFjnGsbUsJolSCoIXGVfb+P4hmFe6wjbJwoKz7FyWR51vbOVrmzG7I
         cuta7aE3aGtM/CQXV6BQxyIle45RAZJltpYLBnAyZ2uqbSluIOJq3ccAzmLteGPp25TU
         enpmfq2FJzsuI2DvNXtZqL9ZMw/X8xeADD8yQQet7a9mGNtaGEY8lQPQYs4DcNuWbJTY
         Sbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756723; x=1789361523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lk88M/pDZxe/5FAVj+dp68PIWOvqnCOJ0AD0p9smdgE=;
        b=Km27gKhHq/oDlsFibDPFWEwKrRbXR51//uODseoOUEsxNv5vomtiKK9CbAPjeAwSiy
         JE6bKpJWTCpFxU+ZDKSmWseZYWBzavTzSMeLU4rxZWN5LyP08Mp5iVBkgbAhE2X11wRp
         lvfZ9OQLemI3gqtuGQ2QZPuEwHhYGnx0IjCRtNfZZ5Psky6xfxRnKTjhuPizuSexvLcO
         eiRdYbMl48ntHGcMiHPRjbI3tkQ7XEIZp4sqLCvAkJVkbdlNxO4ki6mASplri2CUrHPt
         9ESOyJB1h6mUkD4P4Izg+EHulNBQnHcqNfn1A1vBUgYIwT+cCxoeX3fHMdilIwESW+Rs
         vWuw==
X-Forwarded-Encrypted: i=1; AKwUvBznHWXbEFHChJIzidzOC27VkKzehuyApRHs4Rm7fGTe7QWi1CZ3fAuq+4yPvc8yZnP4JjFG6XpiqIvDX9j6RF58@lists.infradead.org
X-Gm-Message-State: AFuF++kTMSBTp1HDfAj4smekhRJ7zeTTcCgHKQeEKmKnZSuZ2exm19k4
	fKay+dLB/ywTRZNjA6v/V67AraCrBzqvdpu6Zwj43tCIZGP7CSHAMT8M
X-Gm-Gg: AYBFou3PzkhDdn2Rpq16WClY42P7EJqqAKHClSCQQtg1Me2nMK6ycJvDt28UnKZKdHW
	X5maM8f85eUt+ObookrtHQ82Wg62okh5LlZne3tN9QdMqENRRzYTluOIklihFCNSDpi8Buz/3Nf
	Tn2B1+cgURBiTGJX4d4FjjHAbwRlNaNxxBoUae6LT/24ffKmx6RIsbgNNPWOOERvHnOimoWBAmA
	dv1kaq0ZdsRvqOHfpLDIkjcANhCfxScmC/UPajZGqvqTWKddwHbB5L4VNUelpDBU/LHXPzr0Yui
	PLytj+VftGwSetG7ZCFbwkyaHVUMw+bpTm2tBEzJmemDOcJOaEe6fyNyLt3NS/fkIkukACDgSbC
	QlM2WU28jvhL8Kb7PH4HOaFCsczBLQFQsoO4rqt97KkyMSvRl85LaBXd1/Ar4oK6btZSJ/PydsZ
	w0XTJd4IUCSUhFE6IhHim5W8ruFPJKQ89J/kRUM/1SmwWFv/fsMfV74WDBWE55KVnybj6VRe+9B
	Iqm8K5e3wanMg==
X-Received: by 2002:a17:90b:33c9:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39b26122fbamr28838386a91.1.1788756723030;
        Sun, 06 Sep 2026 21:52:03 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm21979675c88.14.2026.09.06.21.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:52:02 -0700 (PDT)
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
	Christophe Leroy <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v2 2/7] bpf: fix typos in comments
Date: Mon,  7 Sep 2026 10:21:30 +0530
Message-ID: <20260907045135.13317-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907045135.13317-1-hemanth.selam@gmail.com>
References: <20260907045135.13317-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_215203_923750_50EC83A9 
X-CRM114-Status: GOOD (  15.60  )
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
 kernel/bpf/stream.c          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/filter.h b/include/linux/filter.h
index 4a9bc6a848f2..0a067c2e923d 100644
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
diff --git a/kernel/bpf/stream.c b/kernel/bpf/stream.c
index be9ce98e9469..54f5be1289d2 100644
--- a/kernel/bpf/stream.c
+++ b/kernel/bpf/stream.c
@@ -24,7 +24,7 @@ static struct bpf_stream_elem *bpf_stream_elem_alloc(int len)
 	/*
 	 * Length denotes the amount of data to be written as part of stream element,
 	 * thus includes '\0' byte. We're capped by how much bpf_bprintf_buffers can
-	 * accomodate, therefore deny allocations that won't fit into them.
+	 * accommodate, therefore deny allocations that won't fit into them.
 	 */
 	if (len < 0 || len > max_len)
 		return NULL;

