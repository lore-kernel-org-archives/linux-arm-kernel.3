Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB020C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkdiBF2IWGfWcg5OnqET18ZOvzF9PCNRUzrg/Kdn0K8=; b=uC5gs0oosVc18+BrOJDvlydTw/
	zYHlx5iMQBEgRjNMTnRUvOjEvo+a2AWq1BlPMeajh5E7ZrSSUL2J9IVUJXqwh1D6dSqXD1NM+Fk27
	A+LJ8rLZYgFq+398exhHUpewH/4vHP0GHNkldXZv+DvkNCoNkifzUfNjGifM83nSDI27lLA1yvdC8
	YfejUaLvKi7R0sqMZAScuIJZmvH/w7hjJSCjTYBN9ocKtUmdIMUJntKAg2e4mgpCfTgcihcbattPl
	Gfc3mfn5HLPWPU2nMKrc+MHR529ro9AqmYW7QVawu9H59uvCb0LUDbt0tsdihc7oghmWMrS5bo9VX
	OWYqac3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c0L-00000001r2q-1K6l;
	Mon, 21 Sep 2026 11:16:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c0H-00000001r0J-2ReP
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LkdiBF2IWGfWcg5OnqET18ZOvzF9PCNRUzrg/Kdn0K8=; b=k03j6PVXqm/IVkfgDW3vrUcZr8
	V8C5d/eQ5TiQwnfvO+WBGIF3fR6sm2N9PQuUoX/8/Lp7Q0U5P4WI7poC30Brv9Anoc9CbkO6xuQH3
	lhO48YmHYL7vD73yKieGZxfwcQn6bFyMH9cddqguJziq5OsKKcl+PV6iWhNWlNAO+z7okHanPsrSI
	Hsrl9j8ygenmHZizpC+CojHLYoL4CwIThN33ye9exPlrodDwTChztUKmHzEPlZhBZVwzz1m7RHsDt
	kCtZosnmMc5xhdudlbGMBndfcSuWCgvi5Yw86sOeWHxbA1bTG3xnmS4XjURzpML5gHS1gXP4h4QaT
	OXo7X8VQ==;
Received: from mail-pj2-x27.google.com ([2607:f8b0:4864:39::27])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8c0D-0000000CBKO-1AIQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:16:08 +0000
Received: by mail-pj2-x27.google.com with SMTP id d9443c01a7336-2dd77300825so28698175ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789989363; x=1790594163; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LkdiBF2IWGfWcg5OnqET18ZOvzF9PCNRUzrg/Kdn0K8=;
        b=kLJEABBfuCtvjuk5HnmOzlT47fqfz6zO2dv+ZNJ3u1oB6JVWXzBpXaxxhjXIsko9j9
         tMcjEoCHQcdyJXQAUJufnIqek3TaJ3gBc4KjBe/qfNV5JhIWOLXWbAToIyKQrGKJNuzI
         Qgdc29filzHufFkG9bIOdB2JNFpoYU9/orKrm4Vm9hOvaX7WEK8c2sLH2xpRiDxn1HhV
         XoqzRxizGHLzv6gEdPoSmyLaZJKtKtXrNzzDDZEOzMcSPwUCMZZ5zplK3+9nVpyyq5ek
         SDq/+KGcSnjrWc2jvk+5KoOgGZlnlD5aWnwHo9XjNEWKPTOnodtbflXq6Up4hHj5hKtO
         CfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989363; x=1790594163;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkdiBF2IWGfWcg5OnqET18ZOvzF9PCNRUzrg/Kdn0K8=;
        b=dh1zHxvEJvNg89442/If3lvEbd9e/qBgbannJCbT7CMRkoZsB80lIRb47M3JLtzz23
         uZn/dugKAajOlqqtLGX+5vGREXrE2U4hxA1gzbvMX0dlF7GzKfOTSBQdO7unB45SNqhD
         xPxZ7geSj+/pQ/4Y9yuSarbaQnRtPytYWl6e6Eq2oqZ3giPVAFYOjel8kN7irCnTa9dL
         NZaXot7+tiRjdYPjCQV1hERPH94vd7Oeb6IXEGUdp9qfKYiusuYvvv5EHUm/7mHfXRCv
         bLpZG9XRO0ldT6Y89B33hGLHKc+8uJTy6OFjBa/DXzJByc9N3OWivglZ5wZXGEZj4n7y
         cQsQ==
X-Forwarded-Encrypted: i=1; AKwUvByFhwiJCZR5e6YDGko9BgmzpRSJuJV5LyvjKG8NbUVQ5QKBrBjqNU20DLmkKX0WAzlHQ9bvdVHUox0eeAsDZBoV@lists.infradead.org
X-Gm-Message-State: AFuF++kUdb3NIIeNtheu+c+d7dY67TZ+oiH+H7ZefT4HIU4F/+O2QVi8
	oBwHiCeltsNWtKN8GbszT9Sw0WUmiXTMKBtZHoWxZQDPRUunIWgJQ8KEJfVghgZoltk=
X-Gm-Gg: AYBFou2d+4APCjGnDIyrNKvjnrx/7QdB3xOJklZHxZDO4KIF6d+dJEBnA3bFO5d7uwp
	tKrjVcdkJkeNOP9utaQbxkq2Wd917pMJlG8RxCl8qbU6y3IibVQe1CdNFIUz+mVa5xNwjMZP1Fs
	Uz9rfDGaPhurLRBICUnFInNR6GyDWgbrrNbKRybo/HSG6tqqzvPjHSlLhG7//M/xinOSPmQfTdX
	558rMVDcQzhu6wpaoaZzrtni/4ctD4UjOFJpkQd0oT5HLbE6KGl7X4VoRDWcNxKBt46nEak7BTA
	3dHhHxe31MIBPTQySLOc7a2IK3JNt2afKcT/yBBcIsBlGC89izoODLH2WQmKMWLfR6drkb5VOl+
	s2/UdISCanDT/wO7iIPMcs7iWBOjH3zrtqDrCFPSi9aRqG97OfzWGUTvw9H6VS7XP4vsibULOF4
	FY3cI/DBvaiIu8NSHXYXYP/+aXVM58hh+60BXlVmmpkTjRkYtg7E3NsRpaDsMjXnliQ7DdFvN/r
	4p3PLyZfKpAOoDCGqGQu5hWq5Ys4tTdKCo=
X-Received: by 2002:a17:903:3c05:b0:2dd:4070:8eb with SMTP id d9443c01a7336-2ddb1b97f0amr160128205ad.20.1789989362987;
        Mon, 21 Sep 2026 04:16:02 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([240e:694:e20:401::8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba651sm31831125ad.53.2026.09.21.04.15.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 04:16:02 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuanzhu <yuanzhu@bytedance.com>,
	Yicong Yang <yang.yicong@picoheart.com>,
	Susheng Yang <yang.susheng@zte.com.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v10 RESEND 1/9] riscv: add SBI SSE extension definitions
Date: Mon, 21 Sep 2026 19:14:58 +0800
Message-ID: <990ca6db19bc476f7533f97d48e2030b509633aa.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
References: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_121605_839691_4BC77ACA 
X-CRM114-Status: GOOD (  12.82  )
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

From: Clément Léger <cleger@rivosinc.com>

Add definitions for the SBI Supervisor Software Events extension [1].
This extension enables the SBI to inject events into supervisor software
much like ARM SDEI.

[1] https://lists.riscv.org/g/tech-prs/message/515

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Co-developed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Co-developed-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/include/asm/sbi.h | 63 ++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 5725e0ca4dda..4e54d79ba543 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -38,6 +38,7 @@ enum sbi_ext_id {
 	SBI_EXT_FWFT = 0x46574654,
 	SBI_EXT_MPXY = 0x4D505859,
 	SBI_EXT_DBTR = 0x44425452,
+	SBI_EXT_SSE = 0x535345,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -506,6 +507,68 @@ enum sbi_mpxy_rpmi_attribute_id {
 #define SBI_MPXY_CHAN_CAP_SEND_WITHOUT_RESP	BIT(4)
 #define SBI_MPXY_CHAN_CAP_GET_NOTIFICATIONS	BIT(5)
 
+enum sbi_ext_sse_fid {
+	SBI_SSE_EVENT_ATTR_READ = 0,
+	SBI_SSE_EVENT_ATTR_WRITE,
+	SBI_SSE_EVENT_REGISTER,
+	SBI_SSE_EVENT_UNREGISTER,
+	SBI_SSE_EVENT_ENABLE,
+	SBI_SSE_EVENT_DISABLE,
+	SBI_SSE_EVENT_COMPLETE,
+	SBI_SSE_EVENT_INJECT,
+	SBI_SSE_HART_UNMASK,
+	SBI_SSE_HART_MASK,
+};
+
+enum sbi_sse_state {
+	SBI_SSE_STATE_UNUSED     = 0,
+	SBI_SSE_STATE_REGISTERED = 1,
+	SBI_SSE_STATE_ENABLED    = 2,
+	SBI_SSE_STATE_RUNNING    = 3,
+};
+
+/* SBI SSE Event Attributes. */
+enum sbi_sse_attr_id {
+	SBI_SSE_ATTR_STATUS		= 0x00000000,
+	SBI_SSE_ATTR_PRIO		= 0x00000001,
+	SBI_SSE_ATTR_CONFIG		= 0x00000002,
+	SBI_SSE_ATTR_PREFERRED_HART	= 0x00000003,
+	SBI_SSE_ATTR_ENTRY_PC		= 0x00000004,
+	SBI_SSE_ATTR_ENTRY_ARG		= 0x00000005,
+	SBI_SSE_ATTR_INTERRUPTED_SEPC	= 0x00000006,
+	SBI_SSE_ATTR_INTERRUPTED_FLAGS	= 0x00000007,
+	SBI_SSE_ATTR_INTERRUPTED_A6	= 0x00000008,
+	SBI_SSE_ATTR_INTERRUPTED_A7	= 0x00000009,
+
+	SBI_SSE_ATTR_MAX		= 0x0000000A
+};
+
+#define SBI_SSE_ATTR_STATUS_STATE_OFFSET	0
+#define SBI_SSE_ATTR_STATUS_STATE_MASK		0x3
+#define SBI_SSE_ATTR_STATUS_PENDING_OFFSET	2
+#define SBI_SSE_ATTR_STATUS_INJECT_OFFSET	3
+
+#define SBI_SSE_ATTR_CONFIG_ONESHOT	BIT(0)
+
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP	BIT(0)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE	BIT(1)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV	BIT(2)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP	BIT(3)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPELP	BIT(4)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SDT	BIT(5)
+
+#define SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS	0x00000000
+#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP		0x00000001
+#define SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS	0x00008000
+#define SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW	0x00010000
+#define SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS	0x00100000
+#define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
+#define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED	0xffff0000
+#define SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED	0xffff8000
+
+#define SBI_SSE_EVENT_PLATFORM		BIT(14)
+#define SBI_SSE_EVENT_GLOBAL		BIT(15)
+
 /* SBI debug triggers function IDs */
 enum sbi_ext_dbtr_fid {
 	SBI_EXT_DBTR_NUM_TRIGGERS = 0,
-- 
2.50.1 (Apple Git-155)


