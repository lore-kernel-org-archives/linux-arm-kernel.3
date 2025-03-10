Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0ECDC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 22:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DVCKVVXkluT/sD5JcZAkD4DoB+y+dtTT3SJUvxk8QfA=; b=oFPg2en2DBwhY5eDQmwltTB4df
	eT0pHyQD98wxg6yIEUGUGMHq+s+rQitXygFYy4tSg+XYvG2se1YD6w/K+vM11/A3P7GUNslRzm+8U
	QrP3LR7G52l6J5XF+SfiWlJ8Dh4KcxB8co2D9Na770a+aEQGmw8O0bfP6ujEt8AFjTL3WeLY4zss+
	tWHCM1RAunSeyG5rIgBFW8d41vcEVCygD0EST0R9B1VFjFqL6jrc57Z8fMCzNmUsGuqrnvkSxxbUG
	QQQ+/XvIQZJyKHD99BaXAI2KHWCmumenfRCpAngCZZuxQNywvG66y4uVe472NjbwO+iz9f0NcfwhR
	lPn9qV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trleq-000000048Hp-24Zd;
	Mon, 10 Mar 2025 22:31:36 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trldB-0000000485c-3LNA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 22:29:55 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-223f63b450eso74107185ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 15:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741645792; x=1742250592; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DVCKVVXkluT/sD5JcZAkD4DoB+y+dtTT3SJUvxk8QfA=;
        b=FjkQd5tnniBXU+cA8jBXSUwlT10+SFNTvL4a8XITGM1oFthltvT+QFgal3CUDIqeCq
         FU21WbufjLWKn/289rTGjY/a2ctmEp3Gw1YkqNQlZkmccDS3Y6lNfNdrJzCUYFZuwBA1
         1xg0+g1phyy3d3hIZUg2u0NKQ98nK9UP90k2xYidMKCt1M2Z6vVZ+ECzVU79ed/5q/Ri
         /HONjMviGhlnl6lykS1KmYdNPaYFrk/YsckmMRG5HzU5jmcAEQyphlmtIHaGR7AX+NxU
         b6Iyc+iPi/Z1uQ+FMJQ0rQhvT4QlGhuuTptcY63vTMjLkCYfoRNLM0/NEgl7GfWOa+kp
         vztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741645792; x=1742250592;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DVCKVVXkluT/sD5JcZAkD4DoB+y+dtTT3SJUvxk8QfA=;
        b=Z+OS+ICkZABETpPOW14aB1OEHrRTQKI06Ge6sCpd/L11PUFJc7SS3gQqjmb8IlKrvA
         YJG1WDXKnRJOMongvNBeWRYK5+spp7Eq9k/WrwzE0mNSmEFz6KMu3NXwrEog8UplzPpz
         BDad3Sxo1jkbkfPtaHoCv9EVs4ThFQgvB6/VI/lML48zDlbTA5EnKjtDP8SUQqLm5jNR
         20pth+8LHIPSDgyb7d2asdNOmtjoyae6qCqVrBXN3wkajzfifH3HZ/4hVFXDBB2KvrQ6
         DDGc8DP5q53b93JIQb8z2hgHn4RGcRsdhjhDpTcCJZxUnmqOXmCVnUwatbi/ZL4mLUKX
         3Hsg==
X-Forwarded-Encrypted: i=1; AJvYcCWaQCFTi1oe5oHub9MQ17yioJOINUvufYyakXOoTG4MPFZY/jPWzWsr7d4JkGYs08rFakPL7Ad87NRMrZybbGhh@lists.infradead.org
X-Gm-Message-State: AOJu0YxbtHaSnESKc6SoggIeXky516hIpni0o1govORaa0aZlyT6YLw4
	Szecsg5qViCEAzalu5dDd13DOan0XBPTIGggiCTRwUWiD2+iV0AxcDQ3+XeCgJYoZHywtgKv82t
	i6oJi6qZXM1JR71yaJRLiVfkgMw==
X-Google-Smtp-Source: AGHT+IErwZKMWcXlcDBPbOmTkTxlQqL7Li6tR8rQjLEAzGJVnzPjT3+n2cYiqVnL4XEpSZHvkglTqKeqQnP297PlqXI=
X-Received: from pgbdo7.prod.google.com ([2002:a05:6a02:e87:b0:af3:27c:5603])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3a93:b0:1f5:7b6f:f8e8 with SMTP id adf61e73a8af0-1f58cad4b2amr2359639637.6.1741645792028;
 Mon, 10 Mar 2025 15:29:52 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:29:43 +0000
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444; i=samitolvanen@google.com;
 h=from:subject; bh=S6dZKRDvk4ycBh4lQTb/260u8CBi/1VAPZFB45kS0CI=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOnn06//e3Nm8RKf25ozkpa7lii+uqtbzHjVuTczcGrS8
 z7+57vXdZSyMIhxMMiKKbK0fF29dfd3p9RXn4skYOawMoEMYeDiFICJHFjE8M9yh9rzT9zHqoP1
 zYuqE4QVREuXr1m0/TLnzXtdBZPd+J8wMsz6oLa5I6iYTz+rJn7+EVexiREHGx+/3SZ87TGXqJ1 bIRMA
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250310222942.1988975-4-samitolvanen@google.com>
Subject: [PATCH bpf-next v8 0/2] Support kCFI + BPF on arm64
From: Sami Tolvanen <samitolvanen@google.com>
To: bpf@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Puranjay Mohan <puranjay12@gmail.com>, Maxwell Bland <mbland@motorola.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_152953_837393_3F241B50 
X-CRM114-Status: GOOD (  11.67  )
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

Hi folks,

These patches add KCFI types to arm64 BPF JIT output. Puranjay and
Maxwell have been working on this for some time now, but I haven't
seen any progress since June 2024, so I decided to pick up the latest
version[1] posted by Maxwell and fix the few remaining issues I
noticed. I confirmed that with these patches applied, I no longer see
CFI failures when running BPF self-tests on arm64.

[1] https://lore.kernel.org/linux-arm-kernel/ptrugmna4xb5o5lo4xislf4rlz7avdmd4pfho5fjwtjj7v422u@iqrwfrbwuxrq/

Sami

---

v8:
- Changed DEFINE_CFI_TYPE to use .4byte to match __CFI_TYPE.
- Changed cfi_get_func_hash() to again use get_kernel_nofault().
- Fixed a panic in bpf_jit_free() by resetting prog->bpf_func before
  calling bpf_jit_binary_pack_hdr().

---

Mark Rutland (1):
  cfi: add C CFI type macro

Puranjay Mohan (1):
  arm64/cfi,bpf: Support kCFI + BPF on arm64

 arch/arm64/include/asm/cfi.h    | 23 ++++++++++++++++++++++
 arch/arm64/kernel/alternative.c | 25 +++++++++++++++++++++++
 arch/arm64/net/bpf_jit_comp.c   | 22 ++++++++++++++++++---
 arch/riscv/kernel/cfi.c         | 35 +++------------------------------
 arch/x86/kernel/alternative.c   | 35 +++------------------------------
 include/linux/cfi_types.h       | 23 ++++++++++++++++++++++
 6 files changed, 96 insertions(+), 67 deletions(-)
 create mode 100644 arch/arm64/include/asm/cfi.h

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


