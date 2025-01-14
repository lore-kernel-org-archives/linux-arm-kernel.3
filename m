Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E963E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+iFfCSA0esMLhZDHY92zW4RJncb7ADni12U1qFlLKc=; b=4xxTW1EmueJILYyVafg1GYFSVZ
	Hfx6ZcJzQvPk70egNGikDaWrsOHBOIK6uHo4LjW26Mqdb3DQHNoU8UnaC20sdb1Nrl/QKUcaa+Wdt
	DpepK53xIF0YfCOmAIVx6upDeL2N6X+LaVagWJoLZ6DTbDSAyDBl6mVBtt8yymWBsNVobkiigU8E1
	YnQY0MNPp/8zDoOgtDHd2DaejFWTHa8Y/2qq/oKbEzaOKPPbMSbcEXcabo+PVuCW/NyzYsMMDm9lL
	R4B9jNhkbRADEM63WSWB9VYBFZYDAS2NbLAta0iBW/OsOee8rfFX0dfPPZhD0DQPV77yQ2Z5xKyTj
	/bOq8QZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeQ6-000000088wr-1dYI;
	Tue, 14 Jan 2025 10:45:14 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeOg-000000088k5-0TtF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 10:43:47 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ef748105deso6668533a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 02:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736851424; x=1737456224; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U+iFfCSA0esMLhZDHY92zW4RJncb7ADni12U1qFlLKc=;
        b=q34FODaWfJWNOp+CmxH668G68SFlYBE8L/4qoC0dpcrl+/xnrdXgKgZg4Xba2589Lu
         KL3VYE8kOEpFc05u4/GDy0Nn1NXpwjWnSlq0Ws1Q79q/8cmkpgfQVeLoW6+t4nUCNycE
         ziXfnnAzshnu+WKpqYCEa5VDmfACL+yjGxnkASBWH7Axi3mumR9YmMSJ0I3oRTb0eWhg
         x6PMtNaWHuRIyOjkPuU6UqkeE/1VF3hjKtNpUYSTYE9qg36KjzoqqPtxad7WW7ELcgVI
         sI36Ub3pXuaeoKzBhZwr+j8C/LB7o4VNqNJBZBptsYPXD7+29EXF67ERZCD5r/ys3LHW
         CBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736851424; x=1737456224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+iFfCSA0esMLhZDHY92zW4RJncb7ADni12U1qFlLKc=;
        b=O7Uwvv8wK5DTA3P+hHMPD64iPlZbpZNGhtRHWbxtiRVNsqq1Um1NMrxAJJ+zrCZ9qI
         aYbllq1YTzdealRw1TRVaN816SIzmd/FUnNTjsiGAlHlK/mqGBIgDhwqVgol4XkCsct5
         yQonKk0NW0v3M+zGkk2e6dLNW0wrDEypY6xVkqocrIV1GEeKBbIpWnZi07ebVr57AJgH
         dhRsR8tO9wVJ2ba4OcqOVub/w0iGHdDsPy5f8yKu1ftC+9c7PX3Kn2C5HYDwcDWgaUNZ
         6GfOrJSkMFaQ3ViJl/mdWRXH8vpugWbTR0iw1XpRbYyyWfSbEwMrGfR0Ig3dOd3GSOSc
         7a4w==
X-Forwarded-Encrypted: i=1; AJvYcCXc5WZg51OIxvjfoJazXsu2U9MAqUjV/4fCXiX2ER38fwDbymooxZx3D9kqtq//biVAqO1HR+vKBSTd4gNt2rZZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyZH9638ZOz/qvOHuWijG/au2pwpA4fYLucuOVJwOTp6QtpzhOG
	IIA6wqw5jjTYMmpkskeT1sOgMpxiJqD7lFaLLhOz147YU6OZhi7x6VKfAoCD6S6HgMnomwnw894
	0k5JSXUfwHYHwdbI2LoPBXy/CNqo3fp0RGKMx
X-Gm-Gg: ASbGncvaB6q5D7SullI8/KQD/7CfEzSsi98+wX9gaxz4fvbJX1y/w3o8vt/+5eWgmKP
	QEvsmwq9mBXG1TF5F8+TjOMkgh89Wk7NjeamUXdAmvEJXj8+NhD55kT9uKk7k8exhabvW
X-Google-Smtp-Source: AGHT+IGczXH0RwSvDlb2KRoPip36lSqxyB+OuiMrmApQOWno0b47AQpdfRInLeDgapSvPtkwUC9nyMn+0RAYGxD5H2c=
X-Received: by 2002:a17:90b:540f:b0:2ee:48bf:7dc3 with SMTP id
 98e67ed59e1d1-2f548eb321emr37372999a91.15.1736851424249; Tue, 14 Jan 2025
 02:43:44 -0800 (PST)
MIME-Version: 1.0
References: <20250114-kcov-v1-0-004294b931a2@quicinc.com>
In-Reply-To: <20250114-kcov-v1-0-004294b931a2@quicinc.com>
From: Marco Elver <elver@google.com>
Date: Tue, 14 Jan 2025 11:43:08 +0100
X-Gm-Features: AbW1kvaVa5-9nPmDbOZJ9N5LtR4pKYs5_Kxyb15S0vct137T7GGOlb18swg2wtM
Message-ID: <CANpmjNPUFnxvY-dnEAv09-qB5d0LY_vmyxhb3ZPJV-T9V9Q6fg@mail.gmail.com>
Subject: Re: [PATCH 0/7] kcov: Introduce New Unique PC|EDGE|CMP Modes
To: "Jiao, Joey" <quic_jiangenj@quicinc.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_024346_154169_F0A65393 
X-CRM114-Status: GOOD (  26.31  )
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

On Tue, 14 Jan 2025 at 06:35, Jiao, Joey <quic_jiangenj@quicinc.com> wrote:
>
> Hi,
>
> This patch series introduces new kcov unique modes:
> `KCOV_TRACE_UNIQ_[PC|EDGE|CMP]`, which are used to collect unique PC, EDGE,
> CMP information.
>
> Background
> ----------
>
> In the current kcov implementation, when `__sanitizer_cov_trace_pc` is hit,
> the instruction pointer (IP) is stored sequentially in an area. Userspace
> programs then read this area to record covered PCs and calculate covered
> edges.  However, recent syzkaller runs show that many syscalls likely have
> `pos > t->kcov_size`, leading to kcov overflow. To address this issue, we
> introduce new kcov unique modes.

Overflow by how much? How much space is missing?

> Solution Overview
> -----------------
>
> 1. [P 1] Introduce `KCOV_TRACE_UNIQ_PC` Mode:
>    - Export `KCOV_TRACE_UNIQ_PC` to userspace.
>    - Add `kcov_map` struct to manage memory during the KCOV lifecycle.
>      - `kcov_entry` struct as a hashtable entry containing unique PCs.
>      - Use hashtable buckets to link `kcov_entry`.
>      - Preallocate memory using genpool during KCOV initialization.
>      - Move `area` inside `kcov_map` for easier management.
>    - Use `jhash` for hash key calculation to support `KCOV_TRACE_UNIQ_CMP`
>      mode.
>
> 2. [P 2-3] Introduce `KCOV_TRACE_UNIQ_EDGE` Mode:
>    - Save `prev_pc` to calculate edges with the current IP.
>    - Add unique edges to the hashmap.
>    - Use a lower 12-bit mask to make hash independent of module offsets.
>    - Distinguish areas for `KCOV_TRACE_UNIQ_PC` and `KCOV_TRACE_UNIQ_EDGE`
>      modes using `offset` during mmap.
>    - Support enabling `KCOV_TRACE_UNIQ_PC` and `KCOV_TRACE_UNIQ_EDGE`
>      together.
>
> 3. [P 4] Introduce `KCOV_TRACE_UNIQ_CMP` Mode:
>    - Shares the area with `KCOV_TRACE_UNIQ_PC`, making these modes
>      exclusive.
>
> 4. [P 5] Add Example Code Documentation:
>    - Provide examples for testing different modes:
>      - `KCOV_TRACE_PC`: `./kcov` or `./kcov 0`
>      - `KCOV_TRACE_CMP`: `./kcov 1`
>      - `KCOV_TRACE_UNIQ_PC`: `./kcov 2`
>      - `KCOV_TRACE_UNIQ_EDGE`: `./kcov 4`
>      - `KCOV_TRACE_UNIQ_PC|KCOV_TRACE_UNIQ_EDGE`: `./kcov 6`
>      - `KCOV_TRACE_UNIQ_CMP`: `./kcov 8`
>
> 5. [P 6-7] Disable KCOV Instrumentation:
>    - Disable instrumentation like genpool to prevent recursive calls.
>
> Caveats
> -------
>
> The userspace program has been tested on Qemu x86_64 and two real Android
> phones with different ARM64 chips. More syzkaller-compatible tests have
> been conducted. However, due to limited knowledge of other platforms,
> assistance from those with access to other systems is needed.
>
> Results and Analysis
> --------------------
>
> 1. KMEMLEAK Test on Qemu x86_64:
>    - No memory leaks found during the `kcov` program run.
>
> 2. KCSAN Test on Qemu x86_64:
>    - No KCSAN issues found during the `kcov` program run.
>
> 3. Existing Syzkaller on Qemu x86_64 and Real ARM64 Device:
>    - Syzkaller can fuzz, show coverage, and find bugs. Adjusting `procs`
>      and `vm mem` settings can avoid OOM issues caused by genpool in the
>      patches, so `procs:4 + vm:2GB` or `procs:4 + vm:2GB` are used for
>      Qemu x86_64.
>    - `procs:8` is kept on Real ARM64 Device with 12GB/16GB mem.
>
> 4. Modified Syzkaller to Support New KCOV Unique Modes:
>    - Syzkaller runs fine on both Qemu x86_64 and ARM64 real devices.
>      Limited `Cover overflows` and `Comps overflows` observed.
>
> 5. Modified Syzkaller + Upstream Kernel Without Patch Series:
>    - Not tested. The modified syzkaller will fall back to `KCOV_TRACE_PC`
>      or `KCOV_TRACE_CMP` if `ioctl` fails for Unique mode.
>
> Possible Further Enhancements
> -----------------------------
>
> 1. Test more cases and setups, including those in syzbot.
> 2. Ensure `hash_for_each_possible_rcu` is protected for reentrance
>    and atomicity.
> 3. Find a simpler and more efficient way to store unique coverage.
>
> Conclusion
> ----------
>
> These patches add new kcov unique modes to mitigate the kcov overflow
> issue, compatible with both existing and new syzkaller versions.

Thanks for the analysis, it's clearer now.

However, the new design you introduce here adds lots of complexity.
Answering the question of how much overflow is happening, might give
better clues if this is the best design or not. Because if the
overflow amount is relatively small, a better design (IMHO) might be
simply implementing a compression scheme, e.g. a simple delta
encoding.

Thanks,
-- Marco

