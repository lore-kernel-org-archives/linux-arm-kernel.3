Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9A7D59F65
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 19:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7zw95KXqsc0jEsGVbctdtLEJt7iNPCsXUr27V0IUis=; b=XUDq1xBK4PAVLx5ZMWpe5+dIbo
	YIWLX1iL7xxWmmvNNyyBdk+t6I7flBXhVGtW56W6syDIgdEImSNn2QQuQVIGJ8NZ4rmo/WG3oYA0R
	Kdla42GJO1XM5iFEtqRf5hiugSGQIjc525XKY46D8wKWxZEqXG1/MZ4ecwjswiB3Qh/9AwrIw1l15
	LNmPHN5yIoX19jVTCJk1ja+YbIb5BMQvswYrXMH95PcSoIzQCQ2ySdXTADSgcNg8sVkBwQVC4enOh
	HpaMN2RR1S1uc5YCVpIeLuP/NSBTnojA0BF3D4WF5xak6QZEtEH8UDHy/30ZrNr4Mc3bOvTXxuATc
	f9zoYSKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lGn-00000004QfV-1i0H;
	Wed, 06 Nov 2024 19:00:45 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lBh-00000004PhF-0sgt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 18:55:30 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e2939e25402so177753276.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 10:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730919328; x=1731524128; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h7zw95KXqsc0jEsGVbctdtLEJt7iNPCsXUr27V0IUis=;
        b=QhpvQZti4OJZOpAf1l1+e7bOk7G0pRb716SeUyZw6EKIaeG33wfI0wqw0mQ0msCKhP
         UpVU704x6ce5K6ZW5fXFerfwFUexuLEInxlpELCUSfg1X7NRwrdtirIJZIVcC4rFYgxp
         7pG0VqNpnDqTEXK1KG8v1kDoI1LShu4RsIRCyRfurbJD8040ereUW0h0nEM0O36A63sj
         dNUm6zlicZo9ATnnSvflnJZBWs/njCrAvX2DhLfETTQJDlyMVEQI6a1/cRYGyx4Rz35h
         ltudYcXBNH9lWRXgIXor2HDzStZXvpoHBKymhBua6qhL1DLXGFQSIg/h8cb+3Dmpm5BC
         AmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730919328; x=1731524128;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7zw95KXqsc0jEsGVbctdtLEJt7iNPCsXUr27V0IUis=;
        b=aQZyJKkRDMHiCTfMN939s0wh2wYhObv5NKbzroNmzoqwKGSa1O0+yQ6ZQckPQK6W8+
         G6+CFtiXNV4oDZFAVSD2K3RHdjJFOL2j3A1KyRfsxVmyXKl1q3l8FayJFa/bUzDmdhQ2
         2Q+UfAM9T8NboD+c07+l5AGnpogfx/+ydT8nwMeoXsB+wMzboA/3rMZdy+xyWuVkDL7+
         wz1mNzBStk7fKG0H0JLcfNCGSvHBYsxXhTADiH9DKuFD6looj1dPsohXFnwEvK9oCi89
         hNFz8ohIKrjneycugijFmxWCd+mol4AJcTVD9IDbn4NkVu67sWZ01Czs9jU6ZOP1TafR
         AI3w==
X-Gm-Message-State: AOJu0YyskCMm7dggnZXJNgG9rFeeJTlWEo6AG7Z+ipZH08BEjkcN/22u
	RcGU1EJtvkAcMmqh5r1Ullnk7JoYbAzrRW6/EpsBg8pWMg0V3vDTD7AkLv8OIdyCRFArSHFaa9b
	G7sNb582C4Yi4uT+AEZzBCRfvNn80RZ8+XG5cP8SQQUwanHpNodNSkjPBlMQ7aVj0HNocshGaCo
	MRj5vf4CYBwKmsPRTMaJIjW9pnKocWB9In6ZHScr/f
X-Google-Smtp-Source: AGHT+IGXmbjUyumq+Q1xPHyL3Q7ZMGMe/qHQUihhxdCf7z8vw18tey1+7Lh8unD2dQ2/MQD8x/Y98L0E
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:360f:0:b0:e20:2db0:932e with SMTP id
 3f1490d57ef6-e330263e7dbmr19862276.6.1730919327325; Wed, 06 Nov 2024 10:55:27
 -0800 (PST)
Date: Wed,  6 Nov 2024 19:55:16 +0100
In-Reply-To: <20241106185513.3096442-5-ardb+git@google.com>
Mime-Version: 1.0
References: <20241106185513.3096442-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3232; i=ardb@kernel.org;
 h=from:subject; bh=QH9bIf3UNp68ffMG5pH3fC91Bht166rtqMNyCQzaOSs=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV1791ST0AK1BMfHfhtj5xkcFmvVbMhO/yDyyeF+R65+g
 /KGy2UdpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCKnOBj+2eZY84aZh78snKn4
 sSeK5d6MOPOTU5TjE302rlg2o1bzASPDPPOvAuXLHjpE2n/JYa9XyPL+NOdUwft765ZuL+pVVfT gBAA=
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241106185513.3096442-7-ardb+git@google.com>
Subject: [PATCH 2/3] arm64/scs: Deal with 64-bit relative offsets in FDE frames
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_105529_286888_681701DD 
X-CRM114-Status: GOOD (  17.53  )
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

From: Ard Biesheuvel <ardb@kernel.org>

In some cases, the compiler may decide to emit DWARF FDE frames with
64-bit signed fields for the code offset and range fields. This may
happen when using the large code model, for instance, which permits
an executable to be spread out over more than 4 GiB of address space.

Whether this is the case can be inferred from the augmentation data in
the CIE frame, so decode this data before processing the FDE frames.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/pi/patch-scs.c | 34 ++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/pi/patch-scs.c b/arch/arm64/kernel/pi/patch-scs.c
index cec8f0a52bbc..55d0cd64ef71 100644
--- a/arch/arm64/kernel/pi/patch-scs.c
+++ b/arch/arm64/kernel/pi/patch-scs.c
@@ -50,6 +50,10 @@ bool dynamic_scs_is_enabled;
 #define DW_CFA_GNU_negative_offset_extended 0x2f
 #define DW_CFA_hi_user                      0x3f
 
+#define DW_EH_PE_sdata4                     0x0b
+#define DW_EH_PE_sdata8                     0x0c
+#define DW_EH_PE_pcrel                      0x10
+
 enum {
 	PACIASP		= 0xd503233f,
 	AUTIASP		= 0xd50323bf,
@@ -125,6 +129,7 @@ struct eh_frame {
 			u8	data_alignment_factor;
 			u8	return_address_register;
 			u8	augmentation_data_size;
+			u8	fde_pointer_format;
 		};
 
 		struct { // FDE
@@ -132,11 +137,18 @@ struct eh_frame {
 			s32	range;
 			u8	opcodes[];
 		};
+
+		struct { // FDE
+			s64	initial_loc64;
+			s64	range64;
+			u8	opcodes64[];
+		};
 	};
 };
 
 static int scs_handle_fde_frame(const struct eh_frame *frame,
 				int code_alignment_factor,
+				bool use_sdata8,
 				bool dry_run)
 {
 	int size = frame->size - offsetof(struct eh_frame, opcodes) + 4;
@@ -144,6 +156,12 @@ static int scs_handle_fde_frame(const struct eh_frame *frame,
 	const u8 *opcode = frame->opcodes;
 	int l;
 
+	if (use_sdata8) {
+		loc = (u64)&frame->initial_loc64 + frame->initial_loc64;
+		opcode = frame->opcodes64;
+		size -= 8;
+	}
+
 	// assume single byte uleb128_t for augmentation data size
 	if (*opcode & BIT(7))
 		return EDYNSCS_INVALID_FDE_AUGM_DATA_SIZE;
@@ -210,6 +228,7 @@ static int scs_handle_fde_frame(const struct eh_frame *frame,
 int scs_patch(const u8 eh_frame[], int size)
 {
 	int code_alignment_factor = 1;
+	bool fde_use_sdata8 = false;
 	const u8 *p = eh_frame;
 
 	while (size > 4) {
@@ -245,13 +264,24 @@ int scs_patch(const u8 eh_frame[], int size)
 				return EDYNSCS_INVALID_CIE_HEADER;
 
 			code_alignment_factor = frame->code_alignment_factor;
+
+			switch (frame->fde_pointer_format) {
+			case DW_EH_PE_pcrel | DW_EH_PE_sdata4:
+				fde_use_sdata8 = false;
+				break;
+			case DW_EH_PE_pcrel | DW_EH_PE_sdata8:
+				fde_use_sdata8 = true;
+				break;
+			default:
+				return EDYNSCS_INVALID_CIE_SDATA_SIZE;
+			}
 		} else {
 			ret = scs_handle_fde_frame(frame, code_alignment_factor,
-						   true);
+						   fde_use_sdata8, true);
 			if (ret)
 				return ret;
 			scs_handle_fde_frame(frame, code_alignment_factor,
-					     false);
+					     fde_use_sdata8, false);
 		}
 
 		p += sizeof(frame->size) + frame->size;
-- 
2.47.0.277.g8800431eea-goog


