Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325CBCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfzQDEt1pCJotSzJosKxmaJLh3FzpNGs30nqV1AQIaw=; b=GCOmi3vbS1w95vlscd9yNsh2+x
	o9Or8z0KgPejENThrsj3mIXVJspEtMuX250m/xeuJuHToBMmJdjBRuF1r2lnSUUS7AlPuxOKaG8dY
	uApWxxVTQXLDaeJDKaGh+wkG9r3PN4UKWRZ3AreDX9q+yUHHVwdo7X6QaUYLS3rmHHgCY0XDi0UVi
	p1YpKNWI9RLnjd4njlkzEa4qt+LhRsKSmNn1nW/ClosgGX3zr68kh08OC20FmOTeYZqQLSZsmDgLk
	ixUJ8WdeYqIhjM3bYnZK+aKI0N4A5sFMmgw2r9FvFoZbZeICdJ6xtNV8J1h9E4vSONyExGHS6TqbS
	Jpij2BLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf2q-00000009ScA-2rMD;
	Thu, 11 Jun 2026 13:02:04 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf2h-00000009STd-3KcN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:01:56 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490ae016853so15635625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 06:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781182913; x=1781787713; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfzQDEt1pCJotSzJosKxmaJLh3FzpNGs30nqV1AQIaw=;
        b=tm7po8RJexy3J8PE9pONLD2B06EZOsaWhSm2vQIU5Slgs5s0x+8Z7PclBqvExJVZFW
         QeVa/5Tq+8j2Vco1vSOsJRMkYEUK7NnbLozuAxWTrLEvf5CFCp0m0KLGpjauq9krpDmv
         c7Kjt2eIEwMDDjXyaLOLSTQ+VHj0OiVXnvAaa41q6fXkwNzIDUoBevQvB80cAyZhZKZd
         gG4Kp4TQiwX7qxxqyUp6Cfn8+zexoMRNR4rbfyjtpsOGZCwTfI2/mxCClkNwgXzHDfwX
         z9BaUN6mEc+tW7c05+jfIPBMJTwIxjZ0A79c3FVDrxvO8yZfRF6RQ9FqOTZGKBIDCMen
         mOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781182913; x=1781787713;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XfzQDEt1pCJotSzJosKxmaJLh3FzpNGs30nqV1AQIaw=;
        b=LyEEf/VNPZHaUD7jqA/OtP6IpgOAYE4TLnfbjegDESaff98Y11OuR7uolKxhzfJwTf
         p4upyVJNcUFF3VhqSSSv6YaeWNgz77X5uoRRAh6ot+rs3xDlOMVxbOtcAM608mYFdXZD
         c0fZ2+shuCFFUUu+ZCbRV8nElpDIE+v/W55/UyJzL88nNCNBMSjXvVwJKpeAXk3RTVxf
         1ZHhxIWoswE4B05l29Y2uQTCNm/1YrXX7yyH64ac/xUkCPRYAoS7nCaSuNgnaEKXGXPj
         DLturP3orpEz6HPDMwBUCI3zmDcXcaHm9+d1p6snyKYTOs3ABS88rsFEWVvX3hde9dOt
         Wx6Q==
X-Gm-Message-State: AOJu0Ywq8z4MX91n73/oIt6MOgbPUV0VMSi3k9T+FdPUszmhFdFuRJY7
	nZpvlnaZuYNfHGcO0OtnlH5WzDxQ9WBBaUmNhQD6ZMrYdMxDb88xw1sInkV1ejkiiJQbNJ+bdYe
	h6CW0NyC6gzRESHG6fVSaNyDRD8j6or4OKhVXA7Srag3f2StKBgBIjbBNNUQEDiOAeiJflp+NPH
	ZTOKtqZeyeF5xQVsTuid53Wv956Y16jJEXE1enKQSSjM7fjBkxDk+EH6MiazO7
X-Received: from wmbev16.prod.google.com ([2002:a05:600c:8010:b0:490:48f7:e94])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:e547:20b0:490:b58b:a8ca
 with SMTP id 5b1f17b1804b1-490e5639e96mr25676555e9.27.1781182913390; Thu, 11
 Jun 2026 06:01:53 -0700 (PDT)
Date: Thu, 11 Jun 2026 13:01:42 +0000
In-Reply-To: <20260611130144.1385343-1-abarnas@google.com>
Mime-Version: 1.0
References: <20260611130144.1385343-1-abarnas@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260611130144.1385343-5-abarnas@google.com>
Subject: [RFC PATCH 4/6] arm64: mm: add helper to fill execmem with trapping instructions
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org, "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand <david@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
	Yang Shi <yang@os.amperecomputing.com>, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_060155_838047_188F7EE7 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

Implement the architecture-specific execmem_fill_trapping_insns() helper
to poison executable memory regions.

When CONFIG_ARCH_HAS_EXECMEM_ROX is enabled, the execmem subsystem
requires a way to fill unused or freed executable memory with
architecture-specific trapping instructions. This implementation fills
the specified region with AARCH64_BREAK_FAULT instructions and flushes
the icache to ensure the traps are immediately visible to execution.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 arch/arm64/mm/init.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index c673a9a839dd..71aa745e0bef 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -408,6 +408,20 @@ void dump_mem_limit(void)
 }
=20
 #ifdef CONFIG_EXECMEM
+
+#ifdef CONFIG_ARCH_HAS_EXECMEM_ROX
+void execmem_fill_trapping_insns(void *ptr, size_t size)
+{
+	int nr_inst =3D size / AARCH64_INSN_SIZE;
+	__le32 *updptr =3D ptr;
+
+	for (int i =3D 0; i < nr_inst; i++)
+		updptr[i] =3D cpu_to_le32(AARCH64_BREAK_FAULT);
+
+	flush_icache_range((unsigned long)ptr, (unsigned long)ptr + size);
+}
+#endif
+
 static u64 module_direct_base __ro_after_init =3D 0;
 static u64 module_plt_base __ro_after_init =3D 0;
=20
--=20
2.54.0.1136.gdb2ca164c4-goog


