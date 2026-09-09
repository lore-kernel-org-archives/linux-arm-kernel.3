Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DDEC79FAF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 00:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NMfJCAHR4nbef25SYQadjU02CUOu7/eAubuekR/5WSw=; b=Wuwf6pLIUKj5tbwECBKCnzedEi
	9BRKnpygzsVjPfCVXBUfr8F7uqOZbpr1Xv1TAdGI46B9wJ+fOnbFUXFS/flwMCmoMdOd8e3+ua/q9
	2Wuh4W8cQMC7G1wOjarkPXWV17fRbWMywh652y3mU0ncsKiYOQ5vLh5kQxFji7guRqmupix94uvgT
	HsKr0v8NPqTWHZjDfIZ34/Xr2xUPdtzgc03k2F/Q8XsKdX31mR/2rNx/4Mr52eMxer/Pi35eTDu0n
	pT6BneZTBQfkEM0Lpf4I8rMr3p/hLB0jN23Cl3ATL8hTFWuoiLgCImFHoC7Ze1MFr2ASUbbrMevQl
	Ib2VL6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46JD-0000000AVA7-3TsE;
	Wed, 09 Sep 2026 00:37:03 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46JA-0000000AV9f-3tnL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 00:37:02 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso6375195a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 17:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914220; x=1789519020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NMfJCAHR4nbef25SYQadjU02CUOu7/eAubuekR/5WSw=;
        b=fJAdUSbYML0SSv01PUf4rUSBdpKBCaOTLLrSpC7zCrjx0OW94GncH02mLPR7mb+6jA
         Ew1P8yet1XhjdWRt9VdLQVlNhCe8C8czm7ulmvEK1a/TBqKh3FXTa8DHmGCPKmH29zJO
         nHNyh8e0wT+ksKNJSAR5IB/uvJlGUH7QKToJp3chmVNxIn8v+TRzukEMdOrh6UImlSsb
         ooHdQPfkuqG952tdGUW4nUOKd3I5xOq9RbUqmaTwRYT/j7dHYN8CQsAJ8dY2MXiUAnIx
         FFklyWKdBpoTL2cElp3xMozgEzx2QRobgmamt4a1l3Jc3VEqF6PphOrAipEB+CBch8d/
         WmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914220; x=1789519020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NMfJCAHR4nbef25SYQadjU02CUOu7/eAubuekR/5WSw=;
        b=SrOZMNaJCT7U3eXHTpVOX6Uc9HsdmOC5czvL6OT6XcwHkzfMvK2tkjBUj/+83c92FQ
         Ei7XAmp+SzsgPCNx0v7STbcBN1MoWM/Z0KswKo5g8RRbN4kH0qXrJbVps9StOEmMMqjb
         zzx17Ap3YWzBtmUUlh0O1veBzwcvf+xeij/r/3eQy6bL9fMkKVWxsiJXAXstYKPpGURN
         DSh/qzEwkLo5X4w1hmxi3++lAZrnw8DukFnooWw0ziw852NONvjhNScetGwE027Bcnoi
         dI+tV07q8hOv3GYog066CNxsfQ7pFnf+BbAxAeEv2xu+8Gxe8R0RN0eek5oCWhrlazxV
         vU9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxKsTKpYVXoGBYDOoxYcFYYuX0axoo3uM0RUkjJZwY+Z4hwQRR5HLMUbG3qCZ0I8ruos/JkyP/dm74tOY15ghc8@lists.infradead.org
X-Gm-Message-State: AFuF++kICaW9s2ajEU1Y9a0WXPS8f9TO77UCQdcAYJh/tw+i8DXI3Nov
	KEtRY1uCZqUUaniuDj2a0zMRX8gEZ9pRVUC+LAC5HOqUokQPdekSgXCZ
X-Gm-Gg: AYBFou11KKxEL32X4alOpaT1b0yFP81W1h9wTt/A1KEpfA8cvSDKeLciXS3qR0MtX9F
	LT9CcM8pLbE8LoIfzPDzjLcfyIn9IePVvgFUTCRjHNy5ZMxBJj7x6D00RAHLK7lV/A007YZU+rK
	kADicKa/xtHLcaVNE06RflsJQeDfOYJ47aKjBLOXjoDZGd3nKgYKNkdxKBRiBsUKu1VSyg5U85C
	FqFQPz3pMGrGYHGwkgaqIbfi7VdRQjrbg8GQztojCdZ4oY+Zp6kFkHaQX2ot4kgvQVnZFbeeWOG
	jJsNZlr27pyrOdmAYiJVuENblj2bZydzsztkPqt2N+yQFTdcMv8FV+4iRUnjNLavdqmNcJtBrZU
	D8erDiMM0QOZr9zOnpaYpf/44kxo8b1Wk689QXo2DPmh/467i3Lj91rWd7KlcUJHFGjdqYU9+Ze
	qqtE/PLdt5Z8P7dxa51oLUH2KI9IQwRGCiQycutsajNRdQ6IzvD1XsMBg5KemHSsZF+NiTWao=
X-Received: by 2002:a17:90b:544b:b0:398:c8ef:3644 with SMTP id 98e67ed59e1d1-39b26203e7amr45538678a91.15.1788914219921;
        Tue, 08 Sep 2026 17:36:59 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacba5sm36402826a91.12.2026.09.08.17.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:36:59 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: [PATCH v5 0/9] Bug fixes and enhancements for kdump LUKS support
Date: Wed,  9 Sep 2026 08:36:42 +0800
Message-ID: <20260909003657.1570544-1-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_173700_993583_C9929E4B 
X-CRM114-Status: GOOD (  17.31  )
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

Hi all,

This patch set brings some stability fixes and improvements to the
recently introduced CONFIG_CRASH_DM_CRYPT feature [1][2] (which is to
support LUKS-encrypted device dump target),
  1. address several memory management issues
  2. fix race conditions like configfs writing happens concurrently with
     kexec_file_load syscall
  3. improve configfs handling
  4. update documentation 

v5
- Changes suggested/inspired by Sourabh
  - Fix mistake of unlocking a not-acquired kexec lock
  - Only acquire mutex lock when is_dm_key_reused=False
    - Patch "crash_dump: Read the number of dm-crypt keys from reserved memory" 
      is now a prerequisite patch for 
      "crash_dump: Disallow writing to dm-crypt configfs during kexec_file_load syscall"
    - Release the configfs mutex lock early in crash_load_dm_crypt_keys
      (previous released at the end of kexec_file_load syscall)
- Address the memory leak issue reported by Jinjie when ARM64 repeatedly
  calls crash_load_dm_crypt_keys and also rename
  kexec_file_post_load_cleanup_dm_crypt to crash_dm_crypt_cleanup for
  readability


v4
- Changes suggested by Sourabh
  - Add missing newlines and show the return code in logs
  - Return return code instead of count in config_keys_reuse_store
  - use kexec_lock instead of mutex lock to ensure serial access to is_dm_key_reused
  - drop helper function crash_hotplug_support
- Add Reviewed-by tags from Sourabh

v3
- Changes suggested by Sourabh
   - more robust check on crash hotplug support
   - use configfs mutex when writing to crash_dm_crypt_keys/restore
   - warn the user when keys have been restored
- Drop patch "crash_dump: Release reference to a keyring at correct
  time" since Guangshuo's version [3] is a more complete fix
- Adjust layout of documentation for crash hotplug support
- Check return codes of the function that
  restore_dm_crypt_keys_to_thread_keyring calls 

v2
 - A different way to address potential double and UAF issues
 - Address several issues [5] scrutinized by Sourabh based on
   Sashiko's review feedback [6] on v1 patch
 - Other improvements like logging fix and doc updates

[1] http://lists.infradead.org/pipermail/kexec/2025-February/031850.html
[2] https://lore.kernel.org/all/20260225060347.718905-1-coxu@redhat.com/
[3] https://lore.kernel.org/all/20260704112509.3717884-1-lgs201920130244@gmail.com
[4] https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git/log/?h=kexec-fixes
[5] https://lore.kernel.org/all/972b9a73-d066-4a38-8a4b-fe7d1ba2944b@linux.ibm.com/
[6] https://sashiko.dev/#/patchset/20260403100126.1468200-1-coxu%40redhat.com


Coiby Xu (9):
  crash_dump: Fix potential double free and UAF of keys_header
  crash_dump: Read the number of dm-crypt keys from reserved memory
  crash_dump: Disallow writing to dm-crypt configfs during
    kexec_file_load syscall
  crash_dump: Free temporary dm-crypt keys_header buffer in kdump kernel
  crash_dump: Only use kexec_dprintk during the kexec_file_load syscall
  crash_dump: Improve readability of config_keys_restore_store
  crash_dump: Check the function return codes in
    restore_dm_crypt_keys_to_thread_keyring
  crash_dump: Disallow configfs/crash_dm_crypt_key/reuse if crash
    hotplug supported
  Documentation: kdump: Add arm64 and ppc64le to encrypted dump target
    support list

 Documentation/admin-guide/kdump/kdump.rst |  20 ++-
 arch/arm64/kernel/kexec_image.c           |   1 +
 include/linux/kexec.h                     |   6 +
 kernel/crash_dump_dm_crypt.c              | 171 ++++++++++++++++------
 kernel/kexec_file.c                       |   2 +
 5 files changed, 148 insertions(+), 52 deletions(-)


base-commit: 28924df2a08f440c73991b83028032c901de2ae4
-- 
2.55.0


