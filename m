Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819A5C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3KV6RuBnnb3kSlImB7scYqnTaYm6MjcG3VOHCy4kfM=; b=SDuscrZoxBPlo8w71HqorEEn5q
	fkvXT2pucIuaZCL4YoIgkEl3NVSvACfC+KNG9bd2BWEC2ojSoJh/mzLzZ0deg2jCqvbxLzwKQhKR1
	Drs+HYJXymj9PkOK2+lZtc+2yxWrYj8Katx85LytEAyrOyKVGtLnnUw3U7mMGSWuc9C3zSbweJ5ep
	NVJFSWqXmlIrUl/fevGSrwJtNfhdqVhvZVaWq4vx12oI1HrfekWVa4rAqt/Ar4W4cRgW4riMzIM5W
	rnwrSIHdFNykeBXjELLw18OH6PmklcJa8Tmtd5O60k6Go61n/RJ23d0t90G224dY4sibphHub57F6
	aSEuJfLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oiM-000000086Ri-2rre;
	Tue, 08 Sep 2026 05:49:50 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oiK-000000086Qw-0zGG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:49:49 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84eb992a881so2862338b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846587; x=1789451387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3KV6RuBnnb3kSlImB7scYqnTaYm6MjcG3VOHCy4kfM=;
        b=fWTf95ZIw+76F7jOvRoPGBvpkrPtPuA74EyDHk1JgEGQmuge3/8gw03HzvL6XMSkpY
         /sdnWAtbRaFA0Ki5VhV2Axwy0ztX/G/yL5vX2/bP1cHOR5/tm124VZDkmfFMDBYnBMXO
         ru1fB3MowsE3OBUtk2APQibQO1WCUYRkDmNqoivTOmuNw7viVKQsEg+SrSKP4D1V0KBr
         Vg9R+nnEaGCGr4PiZXWzkOPlDjnJdqJqsUSjKN2IEwjl5BRLgMBgCUxp06K/lD8sIRPu
         EVQLGbd4XEJ9kdQHPRCMsXdQcVrP9LyfLkc3TBYa4L13UTjr2wPlhzMLeY/LGdwqwj3V
         YXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846587; x=1789451387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/3KV6RuBnnb3kSlImB7scYqnTaYm6MjcG3VOHCy4kfM=;
        b=RrP3vsXLUt6ODoCR/+4Tg3yIvcrMucUDV6U/6T1kwcv4nKQ8eh9gpjkZpfS0i3pXpM
         s/AFPxWm9kVUYQfVVBV/kYs+sjKQWZgFF5wkMobSixuy7+iOlYRdX5OEjRosYuWQoTA6
         DMc4E/QqgMbOrYdbXAUHgCSD5iUqsd2J7F+4efetmvqF9RQkg69kAb7PdBzEgh2KO7wo
         iO5+hEod6qvaVLWrBl0NzJraLz6hDcXqs6PkQHi8vf5iBr+VcO8ciFJNfxiDNMF45BnE
         FywH3qjKSUY/pEC2vemZ0Wargv/4/kMF+eGWH86DwUYfj4Hl3+NRNZVMY6mbZ8QFigMN
         U3hA==
X-Forwarded-Encrypted: i=1; AKwUvByw0bV21WN9xztcKYHoSU6B9dUJkPtv8uNerLBToZjr72oceYWg0ylzjNjeZl7rFZaqXDdknDEZyOo/7Re8j6gr@lists.infradead.org
X-Gm-Message-State: AFuF++lUUULcMAdo4+OpxLtkFU3amPG4pNg5mz8KSlOw4x/s4DzLnE/9
	mcsZBTMm5o037lX7cGRdUntJRAQlvenPPDWFbHb9dl/qyzBALEorzg9Y
X-Gm-Gg: AYBFou0ExCtu6S16KhVq5BPlVOCVR8AU4fxemQhrCD2RBhPBeQ1M7U3RlysJHQbWhDy
	3LNkJfOzzvkJvb671P4BCHgnKujt24JTyPlhNoslrKf/O90CwWWv963SLhJ4w7GUSbde0yo2hnS
	aiB6U/x9x6mHLlSTAo/Wwl4AQj5OBETWS4qMY5qJLz5tNA83wS7smSdWdmUa1A/UjWwl/LkhdLm
	4xgBaszvcS/ZNAhN5OSDEfBORtytGOanh2itXqVuDEy9mmuuMh/fNhjXzFMZ+an/WA+H9l+DE4d
	u4zFSmHkZRTAUXJMly80BPzCrL6EG3kABoOHrpQfkZ0jjv9ABlh6Z6uIWwGU4me5aQBb0HZhBRM
	xVzcKwhl9hpOUIeeZ1iL6AqImfWaj/v82qzRLpRQM7l70lx5fp/hCH0TuXCTikxWmVt6hyZjpAB
	vRTwIPogswBJgmvNV+2jkPDWby76lMonombBxwm8c2qua710V817hlCF7whCRf4cCBfIr+va5ui
	bwRsiwfFQPl2w==
X-Received: by 2002:a05:6a21:9204:b0:3d1:60d3:99f8 with SMTP id adf61e73a8af0-3da39b7183emr44883342637.5.1788846587447;
        Mon, 07 Sep 2026 22:49:47 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-334fbd5e6f6sm25690109eec.23.2026.09.07.22.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:49:47 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 5/7] sparc: net: fix typo "evalute" in comment
Date: Tue,  8 Sep 2026 11:18:51 +0530
Message-ID: <20260908054853.13820-6-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908054853.13820-1-hemanth.selam@gmail.com>
References: <20260908054853.13820-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_224948_270683_D473B4BD 
X-CRM114-Status: GOOD (  13.56  )
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


