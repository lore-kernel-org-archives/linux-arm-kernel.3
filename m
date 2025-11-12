Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4616CD3429
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 17:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M1eCAhXmDr9+kBNATXdCTz8d5iMFSVRFKM18smgzemg=; b=M3jftw/mFzeNYVKcO7LkLLCFqQ
	A8oSUktreVdC/orFu1YCZj3qVnoQPcwxwXhJTbjeSstwvyXbw2oHbnnJEBg6dIaBk9xYYIMZyNSgq
	DqMrxBQPuWqVyeq0N+Ha6Q+cuVLxYgdP6o8qckHqQx3KWfXeoYZY/vlw010OYYQYn82tg9x4yS1C+
	ekRgi/H89WtRK/WTOr9AqQ6I2S2Cny8W/4jqMfnVUMvQLTtj9YHnDSHTLKYw33VY00inUXiUddaqR
	uoFRgupU1L5/gwXSPJn28k+TkQdD+TcD4x06YORft3jcA9EpUhH0oV8Kfoki1tOtkG+d7Xypg8mHH
	mxnHM9mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJF2D-00000009HF8-3AWn;
	Wed, 12 Nov 2025 17:53:33 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJF2B-00000009HDs-0BZ7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 17:53:32 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-475c422fd70so8010275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 09:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762970008; x=1763574808; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M1eCAhXmDr9+kBNATXdCTz8d5iMFSVRFKM18smgzemg=;
        b=eqG1HgsklB9otifRrKfEbjc/k+OJ+uQtp4nTLtRYg0rPiAeH/zdL2T6cXfwNPiqHP9
         1CSbqXteDKxAMB4G8X0stbj0HUfJoDuWTsQG66k2NH4tNCPswpcA7ueB0HbJwHXwotkC
         JbeiEbHlla5Pfzb6AvLF7pVobS0IC8gVl71Gh8y5sG/xukzrBqke+Wakw4The7uAmlxN
         CaIiYVQFhDJNBphmDodz0rcH/o4lw+JWHPwQX0vAw3s1sUC/P0biIzDBOnTJJSrkFb1b
         uzNcTlmpV/LZyEZTQL7fuXBGTBUu6zbuNHn0IxTvvY/BoeSf0BKEpbEL0qKZLJAwR8wW
         fh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762970008; x=1763574808;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M1eCAhXmDr9+kBNATXdCTz8d5iMFSVRFKM18smgzemg=;
        b=imeKUFHCVF7lKt9hBSAhFdWrSI3x3L2AS7YgcCi4QWdg58boRMq22kZ9Qt+StrCxQf
         2t+4lf2gmc5hp0PFzIW3PFsXA2Dl6XmfoJLow8PDDK0IvNNirUnQyd/EyLUUkVONyLBY
         IusKRaMHrmD0/kumt7k+hqB0jc0/kFZ+ooiYNg17tHuPcJ6YfRi5N3W5U4VhKU3lwtvW
         S8anMiEnqxfl4wt6A1YTeq2NzdfRUHsKD8tNi3zj7ekx2+07kLXRWEpLpeyaeG8A407i
         Y4OQTxjKw1VmRfc30UZYaLK9LIM7CGtLbOmNtrY8uhXw9qlYpbDrXNWrSvxMNeMZgEnk
         ePVg==
X-Gm-Message-State: AOJu0Yy1rmQ449Up+uE02a9m5y+uiw0ESNUncaNKH83utIuLws/vuyYr
	D6pR2i4AAdS8HWaiulQoRB9We0K3ViG6pkmJoqcJK6l9YxXURs8hofY7d6+EhGogut2r+FO0Ba9
	jcEorPtyIevYCXZaSED0jBNh/K3npO9/u4GqZ6zhsdht2A6Nig66ataxjwPGgU3+QjTS8ut0yR5
	MdghmUr1reUit9xiYojfrnqD0TuEResBsVMqejT/Y7TFEC
X-Google-Smtp-Source: AGHT+IEebGJGBdHFsjiiDR5eFS/gIcIUAP221Wu8xdiSKNctgoPGWLYMxUjGOPTCDoUPoQqvagm6QWkP
X-Received: from wmg22.prod.google.com ([2002:a05:600c:22d6:b0:474:979d:a20d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b13:b0:477:28c1:26ce
 with SMTP id 5b1f17b1804b1-477870413femr35612675e9.7.1762970008205; Wed, 12
 Nov 2025 09:53:28 -0800 (PST)
Date: Wed, 12 Nov 2025 18:53:17 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=753; i=ardb@kernel.org;
 h=from:subject; bh=OcA6f2ob9JexwbEKAOgfU9lLkm1nmoT5BKN+Rc8QMNs=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIVPkZO8+rxsTspMZEmK/NDTOd/rLNdEg64pOAff0YyzyZ
 Q0rMqo6SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwESM/Rn+Cngdzch9I/d1ntma
 Pw6L/JTj9JSFeebsEvS6cDrC7E1fLyPDt0cOs58aB3/KDpey+/IguqF2yRfvPPmWnzXP98/wMs7 kAAA=
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251112175316.2841017-4-ardb+git@google.com>
Subject: [PATCH 0/2] efi/arm64: Simplify SVE/SME state preserve/restore
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-efi@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_095331_115056_029EF502 
X-CRM114-Status: UNSURE (   8.31  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The EFI specific SVE/SME state preserve/restore logic is unneeded, and
can be removed. Patch #1 adds some lkdtm test cases to emulate the
condition under which this code might be called.

Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Kees Cook <keescook@chromium.org>

Ard Biesheuvel (2):
  lkdtm/bugs: Add cases for BUG and PANIC occurring in hardirq context
  arm64/efi: Remove unneeded SVE/SME fallback preserve/store handling

 arch/arm64/kernel/fpsimd.c | 130 +++-----------------
 drivers/misc/lkdtm/bugs.c  |  53 ++++++++
 2 files changed, 73 insertions(+), 110 deletions(-)

-- 
2.52.0.rc1.455.g30608eb744-goog


