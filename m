Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C41ECE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcuRUUrpMUmurCMk/WunQ3qmMdUvqKgEyZujMl9eoWo=; b=HiinZi8cIIscFJkCWF+iF2+DaF
	jPsaMm/9u3UTxgNBaFFmU+QOv5EQGat3O6M5xu58y8Ek5/+nKSdZTGgwTq8dLAbmxDH0+FjxgRN0k
	Mbch6RgF1mwiUnP+gl/XQMv6FDWfIem6+n2eG82uZ27vXLccr4OnWiYYadGSt/C/y+a7YRJJ69pPH
	zf1QyvL/0QT/xGal1wsTGs3Ncb9ZL/xXrm74A+YfsUxB9GDfmqoBubhsPHcQ8SElcuydQB74t1obM
	d6zAUimZkPk276lr/nTD6tWQ/p/9cdjQ/i4bfpF/0qsdU80mNCLkd1iJttoGjN1CBY55TO2xpAL19
	Yj2XlU2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9yA-0000000H5YS-3KeC;
	Tue, 18 Nov 2025 00:53:18 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9y7-0000000H5VP-0Elh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 00:53:16 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7baa5787440so157426b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 16:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrife-io.20230601.gappssmtp.com; s=20230601; t=1763427194; x=1764031994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcuRUUrpMUmurCMk/WunQ3qmMdUvqKgEyZujMl9eoWo=;
        b=PEiRx+VEEpiiREzdmAS6dji/YjBlHh66RPlFLazUBOV9x8RwmHwqom3C8NtUp2zJq/
         Q2IWCPhK2A/0sjmYcyzlUOQCBUm6V+tstM4kMomXVtkTEjLGvkpvLq4FsC6NkQpsNjRw
         fXZDISI7YbrWrXfzx/lRY9izwTcaE7Drcs/e4/OFUogeefxPdf4dj1HojHTrNapZ2XNm
         Np+pWizwu43g697gXAdu4xZx7KgaM4dFPjSIGFIdRAWoFmMG0icpxNaQfEvEAlFByzH5
         g/NKcj537oIgyTYS0PkL1Y92AqOM6rarsVFZ+zHkqz6ejefnaVtRIikNxg74QL4iDwqA
         sMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763427194; x=1764031994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hcuRUUrpMUmurCMk/WunQ3qmMdUvqKgEyZujMl9eoWo=;
        b=ifYu7P7X0IGAlc/PS3fTLWn7TVSLgCxG4uy25DN8IYSCZ5CWyLlR6VDhXptP+AGbp1
         GkyaiS4RxaBXtdXzrB5CEUWLWjn7lx0wsfoeF6iJ/B+t+fh/2dts/Aa3ybzw2v2z6M6O
         9BmWZjXsL3vHYiHCRZyzB7uD4uQinUUz4amPLVkxOJsYyMKhmOvIpVMs7E/wiFllRkwb
         yTCElSWOlXozrRj6W26njvMuxIoRvNQU5E5oO3mAlANEcGfS76SzQFaMMP2FlxjU8Lzp
         Ycpit8byLPEZOsV64bRLwsjv8Ec36GPS998SZSKxgigEsGAptnwDoj355/Guyif3iVs5
         lEqg==
X-Forwarded-Encrypted: i=1; AJvYcCWYaOqxqpfr6S7i5cLqLGPGIFYfOCZ9B/XrQZ6UgkuneI6VenQC8ZgNVDG7uxmxuMAVwBsbQlArzFCYIHU1oMeY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx38Am5OkirriY9GsKNRr6po2szci8TZeBPqz+dEs+79gj/udUB
	5ukRbqZAHZEHQwq6hOMZmk/g11+hZz9ajUK+wl6UQeLF+WmOyveIEA/0EMfeG3SlJi8=
X-Gm-Gg: ASbGncs3JAj4CzelacuunP4eRjqthfgpU+MQvc2NHqxIhgMxtmg9pKF9oFCR+WUrVAx
	OwCUi5U/S+XxNIUulRVBD/83W7In0INEGEC6LMabQiI0KOwvnFfafTIldxBKomGHXdt8UqnupIY
	n271jTcEOYyn+gGu+GhVl3YbGF+An6tOL1BOX9fH5XpA1G9fPEHLKDIXTE1JI5gFJR0CSwOAf8X
	JCYv7aPXcYdkcTbP9AxhC4ZpvVGbFY1kYiOWR0MldAnDaPyY/GZg9m0Tf1rOPDZ8FcOmDq94ISY
	ldi/KfgCnJ+Ek7zopb7HVmZ7HFWoQJouz7rSgK9QZ7TvGRRdWAXlvIPJlAlVUdTn5mksP06jlE4
	avRL6boF9tfEvMjBW5u2HDA/8zUDgym0qTsyQaXEtAAqQ2HxKU8sqmaDWKa05KFq8
X-Google-Smtp-Source: AGHT+IHKa0TQpIk3ZCC102SD0uVPqHW4J3CaGovuSZooSd+82JPVtQAFEykilK1Fg8MDDO7aWQzABg==
X-Received: by 2002:a05:7022:b92:b0:119:e55a:95a3 with SMTP id a92af1059eb24-11c796a9cc6mr281075c88.5.1763427194062;
        Mon, 17 Nov 2025 16:53:14 -0800 (PST)
Received: from t14.. ([2001:5a8:47ec:d700:ef59:f68f:7ffe:54f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49d9ead79sm67568555eec.1.2025.11.17.16.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:53:13 -0800 (PST)
From: Jordan Rife <jordan@jrife.io>
To: bpf@vger.kernel.org
Cc: Jordan Rife <jordan@jrife.io>,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>
Subject: [RFC PATCH bpf-next 2/7] bpf: Enable BPF_LINK_UPDATE for freplace links
Date: Mon, 17 Nov 2025 16:52:54 -0800
Message-ID: <20251118005305.27058-3-jordan@jrife.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118005305.27058-1-jordan@jrife.io>
References: <20251118005305.27058-1-jordan@jrife.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_165315_092448_00813C7F 
X-CRM114-Status: GOOD (  11.46  )
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

Implement program update logic for freplace links.

Signed-off-by: Jordan Rife <jordan@jrife.io>
---
 kernel/bpf/trampoline.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index 010bcba0db65..0b6a5433dd42 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -614,6 +614,21 @@ static int __bpf_trampoline_update_prog(struct bpf_tramp_link *link,
 					struct bpf_prog *new_prog,
 					struct bpf_trampoline *tr)
 {
+	enum bpf_tramp_prog_type kind;
+	int err = 0;
+
+	kind = bpf_attach_type_to_tramp(link->link.prog);
+	if (kind == BPF_TRAMP_REPLACE) {
+		WARN_ON_ONCE(!tr->extension_prog);
+		err = bpf_arch_text_poke(tr->func.addr, BPF_MOD_JUMP,
+					 tr->extension_prog->bpf_func,
+					 new_prog->bpf_func);
+		if (err)
+			return err;
+		tr->extension_prog = new_prog;
+		return 0;
+	}
+
 	return -ENOTSUPP;
 }
 
-- 
2.43.0


