Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C505C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 20:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7pSUQeH5Lrvt0EMFJOLbDrvaxQumdeLy18J1Lf0zrkI=; b=gqqg2tJD0DGWWGYJDTssdqyCR+
	JEb56xRIDCzjUgNF8xZl2Ug/k2YBUJQ28T4DKjiqUM7nF8765hyYYHP4QLXK8nC6GSPs0d9GMQEfP
	LX8+Wlhazd5qjXWTNKnFJEJgTmmTU9A0BtwGqZt1zsToCDfnl6L5J1+MxEnZPzeTNWXAZXne8FZ/d
	Lks4HdQGxeWivGs4jcKO7cWzq/aXQWwHMyRprL+c2BrfFj50iPVGuEO/YPmk2iVLNXsfzfyJ2IKMz
	7dhV5qfp9QxcXDRBG0VV5SP/fqB7RFJyPSsi2KDTsclFsG7+e5yzjri4OTprBxX1kBJyLlfXCfu8z
	rVy4UiMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2yBw-0000000BkPM-3RnS;
	Thu, 10 Apr 2025 20:08:04 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2yA9-0000000Bjyo-1nVp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 20:06:14 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-736cd27d51fso1042258b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 13:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744315571; x=1744920371; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7pSUQeH5Lrvt0EMFJOLbDrvaxQumdeLy18J1Lf0zrkI=;
        b=pblFmQubq3j5hq8UiO2eWG8bxySRg45OWvbL3fRnYDULxjm0OfRd2m+cBfs15heYVy
         zwQHmHu1c027TzIZ7HV005euIh83SV1/STw1S7i/bNPz2qvLjLydgqmpoYrwjO31rN7Q
         LhCZSzMJ9RoKidqA+Z+2hKun+R2h+/a0DBCdfF/rX85tNZSe9rkd1S8yJvo6IDwUOk9d
         CNizZT/cLgGRAB1K5BpNJ0JVAIFawmBMHfPYn2u6AExUzXiidIhjH19EI4Dy7j4gjuGE
         wMfE5JRKQv5/NwHpHYUUHiENn4g8sT12xLIrt9U/DiPOERo2vnVDubKQNZ8C9Gr2uZaE
         0nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315571; x=1744920371;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7pSUQeH5Lrvt0EMFJOLbDrvaxQumdeLy18J1Lf0zrkI=;
        b=JQo1PWIBpWvj0BOg0tJ4upF9YBJIel/OqKckdMdVCsCr7KW+PH7KBwAGkVQgEBxJam
         dRPGw5F0ZfVQqvdzhvPg1KQpQFWF9J18QMh3bErCy8YpXT9fZASf/Q0mMI5ZX2d2o7+h
         bFdKUKqCKH/nrXumrHAEIdKKYCy/HwOkTpwq1Npzoui+hkhVYfOeux+u8/ljY5oCFk3Q
         UYraDw5PWJEcbhFciSdplwDmyr897wXtfUyvTdcTGCdT4yW5G2jr7LGreC/OrEPGpaXI
         V8d6zqc6a9vMFir6AZoDt9eu8lXpSodpab6SWBlrFhuJDHYgQUeciAxORyEaPLFQVNXo
         igtQ==
X-Gm-Message-State: AOJu0Ywmlce0aqL+HESG1yTSu7kgjogkQfPapsoMNnDP2h6WoeQc76w9
	6mOf5xS6XYMnvRdsVHd3TQWWq690n8q2QaxrIz9DbJ9ISYELjOsfz8DMwkvZA5K+VeV54vjHXQZ
	4AKElTHtRx8DVbSuNceftxg==
X-Google-Smtp-Source: AGHT+IEFY0BUcANrZbjV5gltSeoBNFc21eX4KgKyp7o4ToqSuaxwepzIYnw9qq6LUoi355oYUCPoWXUNl7Jn10mExg==
X-Received: from pfhq17.prod.google.com ([2002:a62:e111:0:b0:732:858a:729f])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:240b:b0:736:a694:1a0c with SMTP id d2e1a72fcca58-73bd12bef8dmr194135b3a.21.1744315570672;
 Thu, 10 Apr 2025 13:06:10 -0700 (PDT)
Date: Thu, 10 Apr 2025 20:06:04 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250410200606.20318-1-dylanbhatch@google.com>
Subject: [PATCH 0/2] arm64/module: Enable late module relocations.
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>, Roman Gushchin <kfree@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_130613_465631_AC50D18F 
X-CRM114-Status: UNSURE (   8.27  )
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

Late relocations (after the module is initially loaded) are needed when
livepatches change module code. This is supported by x86, ppc, and s390.
This series borrows the x86 methodology to reach the same level of
suuport on arm64.

Dylan Hatch (2):
  arm64: patching: Make text-poke src pointer const.
  arm64/module: Use text-poke API for late relocations.

 arch/arm64/include/asm/text-patching.h |   2 +-
 arch/arm64/kernel/module.c             | 129 ++++++++++++++++---------
 arch/arm64/kernel/patching.c           |  10 +-
 3 files changed, 89 insertions(+), 52 deletions(-)

-- 
2.49.0.604.gff1f9ca942-goog


