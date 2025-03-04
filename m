Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09EEC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 00:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDRlPmyHtUNZ0yOQY1bkQ2kEbwvsRJ/+HMV3GdLKk6A=; b=KxrVLgQsYhAGB3hEOhyDYLcqnV
	Z5eulADSNJCiOnBr3g8EFlI4yEWrnIN+o6xB2vfNm7E3/O9CnJ+uUD1ddCXlg+yzDJe8LbzssvLs6
	YpffU4+XhD3vDshbleK3jspTOqEn2pXQLbVDBT8f1YRxE4W2FQ25UkVkHqyEUMqa/LVkp2f6ZozXh
	lecLb8ctrBv2W/lX+4tCwRKnsQIQZvP3BbyPyyUkUI42XcyiRCHatZYQ0bl8HFZHAL7/RKzubh+yJ
	jmX5raaSAWS7dz6ti6MXiI+DkosQqJvYXYb5KlghaFDAx1EUixFnpaUtwDAZROBmQkTICegi7DBP6
	FjCw9qvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpFzM-00000002dmP-3GW1;
	Tue, 04 Mar 2025 00:18:24 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpFv2-00000002czC-0EPI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 00:13:57 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2fee4c7ef4dso6987187a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 16:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741047235; x=1741652035; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDRlPmyHtUNZ0yOQY1bkQ2kEbwvsRJ/+HMV3GdLKk6A=;
        b=F5PUbqv/yry3NIYI0C9bkoBTRl4r8HQexrP4k1dOQv8JvxAzV1YJ8o5WuMFk+2+651
         22TzyRXUgeYdiStmCDd5isFFInzU3Rhy3EMHZM60b/g8esHvGbxdAraqO/CqHA9a/O1T
         0Jfiuh7MYrWoWQ026h273y48GdBy3TlpdjaPm58Wy3SzP7XCCDC4w0NmGiZLgq+ASmZ9
         7nWG1+kVzXUuY0hU3EdrENQ7UxEkAHyDJ7srZqAnMXChJqVQjcQtGnxqH2XcBSXsTN/Z
         Qtx+D6oQ3yICxsBXGk0wL0Xi+hhy3JdlKVA1ZI/GkPExHMLb1ZJKXx/rFETEdZrGb58s
         MYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741047235; x=1741652035;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xDRlPmyHtUNZ0yOQY1bkQ2kEbwvsRJ/+HMV3GdLKk6A=;
        b=foZpLrk7y9eGfNMDrOL04BZ/pIoG7cgyPzH93ab1IEadHJr6cSlwriMA4laxSSis5B
         A5f9aQ9tjYjsdDnPDpblpuHjTC1GHh2XtS3WaQUaRuf+t8I4TApKrt9hRHzQGSwQyFvr
         nhyMU1x2yqH2X50+80vTFD8myndJvxFmDCyhrP1Tlk1399o4rIlFl/vhydzb68O4gTTd
         IbgIspP38/9CM4bM+thiJAOGpOWBjHJc1n/beTKRSVy7NZCwJY5wX0kHFus01S6bsegk
         jTIPur2J5sG2fTTD8kW+v10xAt3mgkm/KNxXtVS5hV91PXIzkcMaN0OPMHiAYn6om1vS
         r/UA==
X-Forwarded-Encrypted: i=1; AJvYcCUDsr8RHa8PlmFncZQT+a+XIX6tqlInbbzt3ouFumSnPPnuvVbrJxJjJ91sVEOjzajvpKEmyczyRfadRjKK9Sve@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt/R3x+mYV7On9AnH9BvYuoeU/oPvPjWlnh+/Ks1+yShHtpllC
	b9K2bwqB3llH3cE7WZ4cL4Ad7pOWKBIgPvH/37N2A8IPQL8bZNNJGr5Yx/pMnG7wfBAQcm+u0Tw
	2p4UfkkXC0Q==
X-Google-Smtp-Source: AGHT+IEdt4cHd77mRMPQGhwekDKbD+CN7Z/qOgmO85qt0Zhy9STzN/3oNCxHzMYfYpYk9NYtUNA1zbaLFqDQeQ==
X-Received: from pgbdo4.prod.google.com ([2002:a05:6a02:e84:b0:af2:37c4:2ad])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3a42:b0:1ee:efa5:6573 with SMTP id adf61e73a8af0-1f2f4c9c8d1mr28131587637.8.1741047234794;
 Mon, 03 Mar 2025 16:13:54 -0800 (PST)
Date: Tue,  4 Mar 2025 00:13:50 +0000
In-Reply-To: <cover.1741046028.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1741046028.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <e64f97503ec5b0e811ce7ed3534cd754ba81fbc3.1741046028.git.yepeilin@google.com>
Subject: [PATCH bpf-next v5 2/6] arm64: insn: Add BIT(23) to {load,store}_ex's mask
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Peilin Ye <yepeilin@google.com>, bpf@ietf.org, Alexei Starovoitov <ast@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	David Vernet <void@manifault.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long <longyingchi24s@ict.ac.cn>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_161356_085533_54DE5191 
X-CRM114-Status: GOOD (  11.38  )
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

We are planning to add load-acquire (LDAR{,B,H}) and store-release
(STLR{,B,H}) instructions to insn.{c,h}; add BIT(23) to mask of load_ex
and store_ex to prevent aarch64_insn_is_{load,store}_ex() from returning
false-positives for load-acquire and store-release instructions.

Reference: Arm Architecture Reference Manual (ARM DDI 0487K.a,
           ID032224),

  * C6.2.228 LDXR
  * C6.2.165 LDAXR
  * C6.2.161 LDAR
  * C6.2.393 STXR
  * C6.2.360 STLXR
  * C6.2.353 STLR

Acked-by: Xu Kuohai <xukuohai@huawei.com>
Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 arch/arm64/include/asm/insn.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index e390c432f546..2d8316b3abaf 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -351,8 +351,8 @@ __AARCH64_INSN_FUNCS(ldr_imm,	0x3FC00000, 0x39400000)
 __AARCH64_INSN_FUNCS(ldr_lit,	0xBF000000, 0x18000000)
 __AARCH64_INSN_FUNCS(ldrsw_lit,	0xFF000000, 0x98000000)
 __AARCH64_INSN_FUNCS(exclusive,	0x3F800000, 0x08000000)
-__AARCH64_INSN_FUNCS(load_ex,	0x3F400000, 0x08400000)
-__AARCH64_INSN_FUNCS(store_ex,	0x3F400000, 0x08000000)
+__AARCH64_INSN_FUNCS(load_ex,	0x3FC00000, 0x08400000)
+__AARCH64_INSN_FUNCS(store_ex,	0x3FC00000, 0x08000000)
 __AARCH64_INSN_FUNCS(mops,	0x3B200C00, 0x19000400)
 __AARCH64_INSN_FUNCS(stp,	0x7FC00000, 0x29000000)
 __AARCH64_INSN_FUNCS(ldp,	0x7FC00000, 0x29400000)
-- 
2.48.1.711.g2feabab25a-goog


