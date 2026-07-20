Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97681C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUztZ0b7q+NpMvvYDHyOAMUqlB8mjssu5zGv0A0NKH4=; b=CuU80hAopdWAjxI9K9FY2j4eBh
	3cBIhGdW8ZAsac7HAxELHG5I47gOcv7P6exh5c//ftYpoiSv25OA/hc7hf3i7UrY5m6G/9W7RhyJt
	Q9M4jPwjzFTVaVr5JOApKhCLwoOst6T0IAbFOeVN53l9JiJ55sI/MfH1UUqtYVdRI7Pb8NQ/hM7ts
	9//h4fvT3YRJ5FlOZfexJL5m8EqQzX82YfwFCFtapJuopIJWrEfexbM2Wp7xZrRIs3xQPDHRZGXbk
	G9j3ruSmElJbfFZKWBqAvFQdaktpJinx95qE24tMJ2cj2iGrTmRNKJ6juPftNFU0LzW0oO+iVxrmB
	M42q3Kjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliLe-000000063tD-1fkY;
	Mon, 20 Jul 2026 07:23:34 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKR-000000063FX-2yed
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:26 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so4153910a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532139; x=1785136939; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TUztZ0b7q+NpMvvYDHyOAMUqlB8mjssu5zGv0A0NKH4=;
        b=s0Sq00ahcMIchqG/50nbQDGcgvGSG1gwwbfmc9oMZG3oHTCH2MtP6UU5P4/iK+WOtV
         +hlmK2kGHhBjxmIVEpjBscpu4B3ACvt7OjDiTw/FDHUfU+p/JFgsDlcqQqWTk7MjxyEO
         g+XNOCf2W+pjWcY/kENhKgEhR/5OdbfRrk6bP1eGrqMXdO1vVwXu3AqC5DnSMH/AkAEY
         Nz0YB/67E3xdd5mjvnuja+dpPImFTegm9i0beCjk7Wq3FHCtYAoc9qTfcUmk6o893yrL
         DWKR2dIjWU5g4jFUHhRbGdrBaV6wCH3C1bQQcWchB+8Nc8fJ1T4pFbAfnEC8cQ6uzqCS
         eGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532139; x=1785136939;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUztZ0b7q+NpMvvYDHyOAMUqlB8mjssu5zGv0A0NKH4=;
        b=nHaZpp6BceHhONjx0pgjoYrfw68NwtF5l/qocmVuLvkVV6QO3KjiPKUhxlN3U6+w9v
         xpDNkMVrKe1+E+MNk71x9548boKrG2hpkkR7NOgZcEwE9v/4BExExy7IS6aaWxKl9+Bj
         s2DTV7RbdFqOZqbZDdPCjsPebDzpGZDBLjDvLrNnB25eRYlgesYWIiLF7WU6/mfF1t6+
         xK20NlFjeyRmH5Qc8gM9dqqwtfEWx3Jrx2Cy2NO58EB5KASE2yanXaRdU2+EVXADxF5d
         oAEp20UTZ0e56DwngXz793pD2cevqXn45KPsseF4vCLQdnLbGH9JAoG4AanVRd18/YCB
         RYfQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbuUtTgH/Gz9xn+SZ7aO7+Tx7Wm7J/OPVoxOZxZcN1AQpXK+01ZmqpRrJDfaqLsNi/TU5tEAItKyR+PvNHd1WN@lists.infradead.org
X-Gm-Message-State: AOJu0YypT5bO47ozuPsl//DuLXMWfk1IO26mAKVUIpjnrCT/vHb15ZXC
	+GZlfQYscq0j6G7XXScix50VGVzKbdt1v3ZZ7Qw3sBAJVM/NxbaFBs1S
X-Gm-Gg: AfdE7cmOMJaKtYYRKvPwbuQ3LeWc+xiiyO0oIaNdUy591TeaMotNAaQGEoOFRXDpH1I
	1sHKIQ/LbYiIp90LJG16XMtFUqCaRbHveDeckRsG/R25JhI+rGwc5KuE+aAkyfd3ko88xW0i/5A
	mkIM/0dIbT7t3s4inFIU3oGTTa0lXAeU4/JTgcCbZFNyTpN75IuG05nEDEjjLw2HPnUaJcC0pxY
	fLRnBBp6Vlmp/l0cDIxwXCtnoRPPxJBF2oDg9o/R5+b6Ff+yKIRw4+LY0ZPtbRnUv5G2kFRTr22
	Z6jp0XEvzNoI45NpZy9QkdiPS/T8KnHsF8z96G/+7p2jCu4oPSLQEwrOZA+iYDYiWX0XMZy6Ug5
	GncKL7RrHg8DC7UM4g+1DDZ8R54fARypeY9Wd2sMp4Vr9LD1TksOk1BalkTKgXWxBn/jumXPwnb
	BSaiCmTDPs0vKxFoFUHW1ic2QaCnKM
X-Received: by 2002:a17:90b:4a4a:b0:37f:9ce1:7369 with SMTP id 98e67ed59e1d1-38e4b54c1e4mr13295798a91.31.1784532138762;
        Mon, 20 Jul 2026 00:22:18 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:18 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 09/22] RISC-V: Add Ssccfg/Smcdeleg ISA extension
 definition and parsing
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
In-Reply-To: <20260701-counter_delegation-v8-9-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-9-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211937.543975.4322402942834410024.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=542;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=y1PqojkleYsBjG9eN+IIxqwXAQObYxTJP42EfflWB+Y=;
 b=liGw0+KRk7gLM9mGkWcbN8G4nDkwP2C2I7Zb7ri3m83b9lEN7e/fB+kwHHa/mofODnnb2zsUF
 IyWdYB0weUKAFFVTMYgNMYOglCZKygWyFNgG8v9xFhmJJw7QYjPTAMU
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002220_631880_62F20ED2 
X-CRM114-Status: UNSURE (   8.93  )
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

On Wed, 01 Jul 2026 01:46:57 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> Smcdeleg extension allows the M-mode to delegate selected counters
> to S-mode so that it can access those counters and correpsonding
> hpmevent CSRs without M-mode.
> 
> Ssccfg (‘Ss’ for Privileged architecture and Supervisor-level
> extension, ‘ccfg’ for Counter Configuration) provides access to
> delegated counters and new supervisor-level state.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


