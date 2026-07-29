Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B09C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 00:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7jYWGw53POFllg0ieqjSR4fZVEzdVp2GRfz+60jKrRk=; b=TMfBqG1AdcM7KYT3ECiJb/xTCd
	ebBQpl2eZ3IdToK4yH7Rt4f93duveVVJdUByk/0CGqK4/RrsV3JQ/WxaqjwBcYYSFyBZcMzfW4/BE
	OOuWNgvez9aOPiZsz5WCEAXgCZ4S4RuTseVgvK1qohqbe+EKntmF1fABa7VMJQsTONVv7YxgXhgD8
	esyI82ZRniYy/F13b+0XDAew/DEQ9DDYmw42JMY2oMOyGT+o9ETINnVzvpbfnc/Kc29ixw8kniNTC
	jlUDPPSesZnXhS0jwIYyr8wUiZuX4dF7Rnm18wZuzFxYA1wzw1YGk1tCIZlsTCrNVke7irTH+IZ9S
	tRc0yWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosOM-00000006XiU-1Rcv;
	Wed, 29 Jul 2026 00:43:26 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosOJ-00000006Xi7-3qNJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 00:43:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso2662925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 17:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785285802; x=1785890602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7jYWGw53POFllg0ieqjSR4fZVEzdVp2GRfz+60jKrRk=;
        b=mtwsLSsQzZjp67zRq6jmgkDU+xi8RZQgdZyaRWNLZvHbn3TU9sDUu0+FF66d1KaB1J
         JkigJ3O9jWDtDl/Zi2KNk5GAR5EWCTgK2i7T4vWBF1cJRy6+AuoM/2LJSIoGxZgg+MBR
         Z1JB1aCJU6nGrch9RTYaZ4K4G3LEwOnJ3JJ3Bt63cnNdLyqVV1x8W6hUyAMzrKLrWp25
         zsnbv90/DepsFqgNc54pQprh9wpDuuKVUquQcbmhiHDeNhPKigf0QUDB0koNas3pT7fO
         bU5B1fXISafxa1aggyspYdcJf0DypPF9g9IjK0sh8LEGqkx+gLiYVCTsPr3cyDYUAB3H
         8LNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785285802; x=1785890602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jYWGw53POFllg0ieqjSR4fZVEzdVp2GRfz+60jKrRk=;
        b=O9LNpgDED7rtNLRhyrNZJd3jrjDxv/O7+wPhjHXgjVabPVN5sSUYCh8BQuDQ4cHymJ
         xgTxCupyKOhQ6XIL7prYs0CpqA9V7WEP/zBejzf6TkYj86Edm/2S6Ce9XjS48958IfDm
         job5FrwDj5MmrtPjMaQR0QPYae+80Pu9zKWxwPkUpDyCbT2e0XcZUKFbLoxjmdugj8lQ
         OUOJSBVavp5aaQeuZO/SDT1q9hm6qma2F+xyEY2gnm5t5cujH5vyk22m4jyy9jYCT7AS
         YeZa2xWDYVK+a4W0QXziFv2KHbc6f1KlEkQOoX5spugC27LXunELSJ6SYWDvgP8q+QUk
         FeeA==
X-Forwarded-Encrypted: i=1; AHgh+RphSF9TY/jQ0cFALlqWUFfYNrumw4yMOMrYp22xY3l6uk0r8WuUvYsMCpPgtAovcMRglWOGr9h+iB3ExgD1Elek@lists.infradead.org
X-Gm-Message-State: AOJu0YxOY8QpTWONpW9u+tgSNjKa7gKI3TgxYV03qagCwz6Nnng4UCUK
	IAV42NGLLVTBDXdPepGFaxGs+vKRYevc8UQ7rSInFSECfb2qBgssVkeb
X-Gm-Gg: AR+sD128bZfNUkZuaD8bYFzOGzwqsAz0CqmyRxiNeWPNwSiTtQ1xko5Pe99Cqz682LQ
	0gZUNulQTdf43fYyh6I1SqR9cp1XgAOVcIFes+GVr1X6WD+dR1zhP257T+plf719ws/1hPjvjmu
	L7LMPyCa9WxDvK6TkXbuqAFYGr36Gg4VmP9y2qhV9jeW9cRs5nXTLAXEqp1sh1iaML2c3dehywq
	UNJFctEJ/1L7N4PYz/h2WGw5cp62alTPHw0kzWtPc5AtnfQ5//ylb5Zyub5HeVO++ESiIOyhume
	HhLNB1jR7L0MopERc3JE3NoU5r2Uwr6rsMSEFNnBbRHgkUQ8g4soDQQAFXKIeuHH/d0gfbfeuWZ
	VU43qkHxzw6ZaltKteIg3mIrXsdxoFCDrBozshIuLoKUFXhhIrLo3Pu5sntt69e3yzLbtmZFgNJ
	FWiXwKPz/E5T+6tn03Q9/yLS7s4S5wz4r1BqWkgVlR7Y0HWo6mQ6EOJ99DNKJN0KzeoiudiJZge
	BPdtXzcAIzmFATNoSKM6N9It2JNHF0SGj/U8tmCUVcP+XZVEV6a21+JCUY6TGx1x0952Wh5lwbS
	TWhyG1OnEgNo1QCUthA2oTGKDQpduEGeW5AYvIamoCs6ZB2jIUatjLQoIaDy65i6nLPyJyI92eK
	DgImp0A==
X-Received: by 2002:a05:600c:3b1f:b0:495:4cba:e288 with SMTP id 5b1f17b1804b1-496c653eb6amr48053165e9.15.1785285801374;
        Tue, 28 Jul 2026 17:43:21 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-b323-2b01-0d98-9fe8-a4cd-78ab.310.pool.telefonica.de. [2a02:3100:b323:2b01:d98:9fe8:a4cd:78ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm2827343f8f.6.2026.07.28.17.43.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Jul 2026 17:43:20 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 1/2] arm64/fpsimd: ptrace: Fix inactive SVE and SSVE regsets
Date: Wed, 29 Jul 2026 02:42:54 +0200
Message-Id: <20260729004255.15630-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_174323_977920_0BED5DF1 
X-CRM114-Status: GOOD (  15.24  )
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

sve_init_header_from_task() takes header as a pointer, so for the
inactive mode

	header->size = sizeof(header);

stores 8 rather than sizeof(struct user_sve_header), which is 16.
Userspace sees an impossible size smaller than the header it
describes.

The inactive-mode check in sve_get_common() compares header.size
against sizeof(header) as well, but there header is a struct, so the
check can never fire. Reads of NT_ARM_SVE and NT_ARM_SSVE for the
inactive mode therefore still return the other mode's FPSIMD data,
exactly the situation the check was added to prevent.

Fix the size, and make the check return the remaining membuf space
instead of 0, which regset_get() would interpret as the entire
(zero-filled) buffer having been populated.

Fixes: b93e685ecff7 ("arm64/fpsimd: ptrace: Do not present register data for inactive mode")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Found by inspection while reviewing arch/arm64.

Confirmed in the generated code: building arch/arm64/kernel/ptrace.o
with arm64 defconfig and gcc 15.2.0 and disassembling sve_get_common
shows the inactive branch storing a literal 8 into header.size, and no
compare against 16 anywhere - the compiler constant-folds the check
away entirely and falls straight through to __fpr_get(). That is a
machine-checked demonstration that the early return can never fire.

Runtime tested under QEMU TCG with -cpu max,sme=on. Before this
change, PTRACE_GETREGSET(NT_ARM_SSVE) on a tracee outside streaming
mode returned header.size == 8 and copied the 528-byte NT_PRFPREG
payload. Afterwards, header.size is 16 and bytes in the userspace
buffer after the header are left untouched.

 arch/arm64/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 4d08598e2891..2a72c61a8af9 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -801,7 +801,7 @@ static void sve_init_header_from_task(struct user_sve_header *header,
 	if (active)
 		header->size = SVE_PT_SIZE(vq, header->flags);
 	else
-		header->size = sizeof(header);
+		header->size = sizeof(*header);
 	header->max_size = SVE_PT_SIZE(sve_vq_from_vl(header->max_vl),
 				      SVE_PT_REGS_SVE);
 }
@@ -837,7 +837,7 @@ static int sve_get_common(struct task_struct *target,
 	 * from the other mode to userspace.
 	 */
 	if (header.size == sizeof(header))
-		return 0;
+		return to.left;
 
 	switch ((header.flags & SVE_PT_REGS_MASK)) {
 	case SVE_PT_REGS_FPSIMD:
-- 
2.51.0


