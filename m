Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B0FCCF2C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 19:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FrRLzPVLgizd6wdoUjViFGVj6Wd4K2T/hBmEhjqG+OU=; b=XS/mjXXDnP8yt8v6zL0t0etsKH
	mXjgRAumcf1aUtXoyKWrlCrpFZCKa0Psy4lwdeRBZRwDwSQ3gnEuTOiX8DNr2efdtdw37xHQz032j
	pOOrHxKXOvEjbbfkkz0gw3cd73PH59+hgIkXdqIo2g5qYZKn2w2Wwq+s6yahk75aC6sOuLSWznVPC
	V13E5KoGiD79RdzCxths/633wn0PBbSgQb+tR5Wz9CqJhDOQ+xseFWZnZdA88cdVrrr4zd/QJwSNb
	C9UhMewPxaiRw2gBYGz1bTqKhMXMi+0yWv1LesmtxRRueCYoneNFavFZ2tud6gzdT2yS71zvP3Z7C
	y3oH9JEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnse-00000003vKk-1JvV;
	Fri, 16 Oct 2026 19:46:16 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnsb-00000003vK3-2Cyw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 19:46:14 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-35ef6b49813so480553eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 12:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792179971; x=1792784771; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrRLzPVLgizd6wdoUjViFGVj6Wd4K2T/hBmEhjqG+OU=;
        b=h6vFkcdtEOYElf3lft+4/4Ybd8nNJ6gPBsvLfWmw0r7yKwIxYlggBfpv7hX3111hv6
         jFfKyIf+FdQpglj91Sbd2xxUvHWxEeoLi4hxqYluAGwATIaxyWBkfImOaIjHz4WyeiZg
         tzaSNdWX216wVSCaagF1uQOFC8S4jiioBpyTmOnhDq9E3ieFhidx/YHZN3x7FSXGqmn2
         qT96gGdR0zUjDF1sJX+qzWcGvIQ9zZ3fgZOji3reBBiARUUmlMsTsxS8eb94l+4vVWO5
         rcvr25hlSnr0AHAzwjnU7RQux5+SYp5a28gioiS9hw8uxSEmLXL+5YmlrMbTTDvBs2o+
         GzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179972; x=1792784772;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FrRLzPVLgizd6wdoUjViFGVj6Wd4K2T/hBmEhjqG+OU=;
        b=KCpxfq+w2A9ewhC4lADQ3qksaeu/Up5An3UWpAqGBqP3YxqyTLFeV80x6LXf2YX8uc
         DmdwBfKKwOWh/bRFG7fd+aTkR666sI94B2hIdADL01PW6VQA5QIrvJZliTHMc+owqp0l
         CAb0wMc+r95cn6AMnK1mtitLpRnq8WZoKs1IIAOa4+HwyX8ZwU3NiJ4erGoTdkY2XTB2
         ajnUk2G4Kihktl+W/gZFKuyU2ZFQ4MWFi5TT9QSg9T/sbUfhFJl5io0YzLH+Sgjc7qGH
         /vqVtsMqT3vOP4UnGt3hkGmeERvahmWvEriEcAydMiHlu9JEOtn7Dz9LBe4n/otLZw9J
         csug==
X-Forwarded-Encrypted: i=1; AKwUvBzDir97zAjsaBpLUMT4DBDdyHmoLnyWWP5wKi8Upq2TzZXHEiVx6XB98qi7V4eONjiOOVwoj9tau591ywvtMskF@lists.infradead.org
X-Gm-Message-State: AFq9FYK0rslHUvvqSBrgLq+7q/HaHkNrSIBi1WXko/2x4sGsl3BbdKhf
	un7NcQ3iVA76aZPucmO+LIF+2E+S4086+wMfBt3xQv6h/Xt2/kAaZSpK
X-Gm-Gg: AYBFou2KK4JWzYkLGmZAckhx2vBWVtx6n7OqV1bRyiYG1cerPnj048QoAoCYg/lrFFV
	uOVu+JCdbJCatSvOyAfCompt9ItGpa6O9GaEUcGKe4leHl1p0cWfojIaXgkDWmWzPi/qFd7Nwnn
	PRwnNTBd1eVA6YCaZkmOrPQOl9nHW2GzfFzZ4RtlWVQGqNvmbcZFWCbNDNvu9hzqvuTOirBM8ZZ
	yXI3jY77tTu7IXXVC35iBo/XVbPHU/dFe93lgzNupc91DqIWdKkUWQn/EOGf0Y+2jThZ7aoOUEa
	XGoLa8MUcvCOT0IRoEMzjdtoJwDaY69i+UXViZjtnwKfDASVCHXkkbJLXpIEEDc/MxKg2NS9f3A
	6ETuW3itEhHTUV1OOUNSz/hJ82cAvOgdS4ldhirQbIUkQ69dtZfndD2alOp/EozcrWfgiv4tqj1
	31ph8PCpP8gzGDPc1Dv/NgzD4QQw2CCnAb0t1ZRnGbPjooskFUCeIWR5OYwJ+KfSU4
X-Received: by 2002:a05:701b:4212:20b0:143:3c9f:10a6 with SMTP id a92af1059eb24-1850c40d561mr1220093c88.4.1792179971397;
        Fri, 16 Oct 2026 12:46:11 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm11008321c88.16.2026.10.16.12.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:46:10 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH 0/4] arm64, riscv: release shadow stacks on failed fork
Date: Fri, 16 Oct 2026 16:45:59 -0300
Message-ID: <cover.1792179433.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_124613_575139_91219F81 
X-CRM114-Status: GOOD (  14.00  )
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

This is not a port of the x86 TLS fix i sent yesterday. That leak was inside
copy_thread() when set_new_tls() failed, so copy_process() skipped
exit_thread(). Here copy_thread() returns 0 and a later
copy_process() step fails. The concrete hole is clone3() with
CLONE_VM|CLONE_PIDFD and an unwritable pidfd pointer: put_user()
returns -EFAULT after the architecture has mapped a shadow stack.
exit_thread() does run, but arm64 and riscv did not implement it, so
that mapping stays in the parent's mm.

Normal exit already frees via deactivate_mm(). The failed-fork path
never reaches that. The free helpers already refuse a foreign mm
and a cleared base, so wiring them to exit_thread() does not unmap
the parent on !CLONE_VM or double-free on a normal exit. A
successful clone3() child with the same flags exits through
deactivate_mm() and then exit_thread(); that is the usual teardown
order this series also enables.

riscv's shstk_release() comment already described this
exit_thread() call. The architecture never selected
HAVE_EXIT_THREAD, so the documented path was not connected.

Do not free on a copy_thread() allocation error: the child still
aliases the parent's base, and copy_process() skips exit_thread()
when copy_thread() fails. kernel_thread() uses CLONE_VM, so a
failed copy_process() still shares the caller's mm and the mm check
in the free helpers does not save us; the kthread path clears
inherited tracking for that reason.

The selftests assume /proc is mounted. A clone3() with a valid
pidfd must succeed and write a pidfd before the rejected calls
count. ENOSYS, EINVAL, and EPERM from that clone skip; any other
error fails the test.

Sixteen clone3() calls with CLONE_VM|CLONE_PIDFD and an unwritable
pidfd pointer leaked 16 shadow-stack VMAs without the fix. With it,
the count stayed unchanged and call/return on the parent still used
the original mapping.

Base: 2f2f7eeef8b0 ("Merge tag 'soc-fixes-7.3-3' of
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc").

arm64: QEMU 11.1.2 -machine virt -cpu max, CONFIG_ARM64_GCS, one
vCPU. Unpatched ss_vmas=1->17 (+512 kB). Patched ss_vmas=1->1.

riscv: QEMU 11.1.2 -machine virt
-cpu rv64,zimop=on,zcmop=on,zicfiss=on, CONFIG_RISCV_USER_CFI, one
vCPU. Unpatched ss_vmas=1->17 (+1024 kB). Patched ss_vmas=1->1.

Assisted-by: LLM

Iván Ezequiel Rodriguez (4):
  arm64/gcs: release GCS on failed fork
  riscv/shstk: release shadow stack on failed fork
  selftests/arm64: GCS must not leak on a failed clone3
  selftests/riscv: shadow stack must not leak on a failed clone3

 arch/arm64/Kconfig                            |   1 +
 arch/arm64/kernel/process.c                   |  21 ++
 arch/riscv/Kconfig                            |   1 +
 arch/riscv/kernel/process.c                   |  18 +
 tools/testing/selftests/arm64/gcs/Makefile    |   3 +-
 .../selftests/arm64/gcs/gcs-clone-pidfd.c     | 355 ++++++++++++++++++
 tools/testing/selftests/riscv/cfi/Makefile    |   5 +-
 .../selftests/riscv/cfi/shstk-clone-pidfd.c   | 317 ++++++++++++++++
 8 files changed, 719 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c
 create mode 100644 tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c

-- 
2.43.0

