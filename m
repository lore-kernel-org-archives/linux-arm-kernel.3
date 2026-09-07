Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B2CC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3KV6RuBnnb3kSlImB7scYqnTaYm6MjcG3VOHCy4kfM=; b=m/duZU4BtaPeP9sk58Ov2Hi9pk
	ZmTxGaZNmXwfNipjP5qhA8mRWS/zF83aC5LCoEWNGaN4nS7Ph/ctV2tAykDeBPwmganOikP8aTp2u
	A0TQYHCIJggFtFeCWhFRzIpXqqYVO+H4Q8nbvEnlWofOZFuB8J6E3YQN9tH3U2xv/7QEtdOGb3hUl
	zP/Toue6NMRNDyCIAGdGmHaN1IhoQsiSHXnoGTZWORC8aSIe1fJJBHBWo/+V2IXqh/tamw4SDp2Pd
	GO9B+VTxiIiQgVkaCUwba/C3/Nmjjo4v53iCV7L+kmTpT1igqjPmLEEgOt4KOKoiRtjHD1es7aNiv
	uMehXOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y2h-00000006jfW-05bw;
	Mon, 07 Sep 2026 12:01:43 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y2e-00000006je6-0n6y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:01:41 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7f4b94d72acso2946697a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 05:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782499; x=1789387299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3KV6RuBnnb3kSlImB7scYqnTaYm6MjcG3VOHCy4kfM=;
        b=Hbha3RPdkYC1oYQqvFUbqC3uM8N/D+c2lIaqjBjTcYqMB+DruVA0VJOybHYSFPFFqw
         5/4nNtwtwg4X2YkFWLMCjtXo3le80XIjWDFbrCAZ89pTRZIwBWKcI0gA5eWmUTzhZcSd
         p/QYk+ihGZAMs16iicu9pDFznSIELaxpVPAC1J2dXD2bu//jHFVB9Na4JGhgdkYiUb59
         WgSz0FJ2+t4MPF006j44hR19ut9Tq7KNILEoPbaCC4qS+6PXoswL0P1eA0IIZwzN/aO3
         fDYdml9NSIcgfvq3IuMOHyTOcX5KR6WRiOpdhBVTXVACRrL9yLlZBCzCoxkqQFre0SjL
         h6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782499; x=1789387299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/3KV6RuBnnb3kSlImB7scYqnTaYm6MjcG3VOHCy4kfM=;
        b=krxfL/kY4NILH9nkR40TluyyzSwpZLOdVw4IyZRxyYb9Otfy+1tLwJvYpbMqWqNTYj
         /AM3lHc/x7FzEYpfIv1b11IxxaHRIZo8i5DAx2emL3/b2bAKqmdhHqhRxnB3VhRqgMy3
         9ahsh2d0AthpO4vPhOtMCNw/+5pO+gqOOPVN7+mgsQfe2VZxTkGZQOvMe9MQc9M8by2w
         4w/Mto/s1062zXwqeGSu/wABqf+aBxJzQq6enhMdXUnWzkN0fo0NBepRC6pB1sQqubLj
         2qSfJozff2RQUUykl+gaDAfdLqHZ3jVtHtKlNfXWurbfsKX5uFf305ggEebG9kipqsFc
         xA5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxYE5DYN5xAN5V0I3GM3qNO//jqr30jIBAiQIj3adpD6j2IphpGfX5ExDbELS5KLKnZJMU3SduAeWeVWoUntmSU@lists.infradead.org
X-Gm-Message-State: AFuF++khORpA+0AwTISmkvt4ZfhyQKWY0/WnXRs0nVFaMLC1bVoprkbW
	WkhNkSCqQIljnor2LUgy+IQiCR8KrX1/VapnFQh+p3FW4dGdPilRI8G0
X-Gm-Gg: AYBFou3D7LOZc/nkda8HoHAxE6qWZvfdi5Gnl5WSZu7Myd/nQcapA/IeIS/NF8qV4px
	gxp9RD+LDDSAJDe0hv5mCekk4YlwYmuf57NUdJ3WaEihtyUjYpY0+H0LY23J6ICmqFYN1Zr3cT7
	LJXRl3X54i9KTL5544N4fiHepKoMl0H0jdPD3HLNOwF98HpLZar9hAj1TbUCkNwVEwojHGJixpR
	Y2gFRkXMrQycdxTdwsxZmLT6FCU491eLZO7mh6R5EuVWMXALJRrWsuWi2NOQsevPWq/8YSF8wUP
	kFkH/1JQoH3SAx2G6BLSeSmXq2uAyNgDaQf04to9yQ8UTN21cpAo9lcVaqrb+SwaAtZjmZm0rH7
	76w+8ckNmUD+HAKSWbV6dozBm6xWLmTClOaBOnAAxshxTM7jHvj1IvUwNmIkniLOWGomQ668NPF
	Nu9+ZWfgClqZbjfG/DKUIIx9b+S/vvUuNNvQeQR/4hrKx9njKcMHalSwJM2vzvlHc4fxfqoQ7YB
	zGUT85PE4XfEg==
X-Received: by 2002:a05:6820:c91:b0:6b1:535a:eb8 with SMTP id 006d021491bc7-6b6fa8e02aamr12552198eaf.2.1788782498996;
        Mon, 07 Sep 2026 05:01:38 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm31244462eec.1.2026.09.07.05.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:01:38 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 5/7] sparc: net: fix typo "evalute" in comment
Date: Mon,  7 Sep 2026 17:30:41 +0530
Message-ID: <20260907120043.36894-6-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907120043.36894-1-hemanth.selam@gmail.com>
References: <20260907120043.36894-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050140_820858_82885F94 
X-CRM114-Status: GOOD (  13.30  )
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

Correct "evalute" to "evaluate", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/sparc/net/bpf_jit_asm_32.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/net/bpf_jit_asm_32.S b/arch/sparc/net/bpf_jit_asm_32.S
index a2e28e0464a3..81430f065ac9 100644
--- a/arch/sparc/net/bpf_jit_asm_32.S
+++ b/arch/sparc/net/bpf_jit_asm_32.S
@@ -195,7 +195,7 @@ bpf_error:
 	/* Make the JIT program return zero.  The JIT epilogue
 	 * stores away the original %o7 into r_saved_O7.  The
 	 * normal leaf function return is to use "retl" which
-	 * would evalute to "jmpl %o7 + 8, %g0" but we want to
+	 * would evaluate to "jmpl %o7 + 8, %g0" but we want to
 	 * use the saved value thus the sequence you see here.
 	 */
 	jmpl	r_saved_O7 + 8, %g0
-- 
2.48.1


