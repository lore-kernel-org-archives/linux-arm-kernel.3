Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFA260A260E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bZM9J3q+;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=agcAolRh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W0oLRP7RmrwK+s1WyDoN9zSSlBczsPl1G7flMYO8vs0=; b=bZM9J3q+6x5tnai4knCoo2auOz
	jTLlYWWjJ+BbY0v496nWFDv8PBOAeqWj3WUiMkRFlB1zAAFpaH6E+YoYeFFoJgiQWNg8BhiwMHoro
	sneuDaKtEbumXv/Td1iXMDc56ZQABsU3xyqtEoIXO924ZZCgHGp2IxybRg5hoIbmuaUR+JQ+hdkEw
	C9iJ8mT+FGyuoWtiKgTFvTEmZyoE71FgqaC3lqgX3AAt8sTcfDBuiz47VEjpVMNRbnv/yuAoMxaHE
	Db+CKBfkZChQ5xVrSA1bpDGRYJUBbH+TTjV8C3WyCjGQJa7fXT/OURL8eaOQr02UE46RQ9zXtvhrv
	Lmw+KnKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYC6-0000000CFXs-3NX9;
	Wed, 21 Oct 2026 15:25:34 +0000
Received: from mail-ej1-x646.google.com ([2a00:1450:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYC4-0000000CFW2-23NC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:25:33 +0000
Received: by mail-ej1-x646.google.com with SMTP id a640c23a62f3a-c438ca31778so66126266b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 08:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792596330; x=1793201130; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0oLRP7RmrwK+s1WyDoN9zSSlBczsPl1G7flMYO8vs0=;
        b=agcAolRhLlWKMj4fUr9DohEBjPBFeGtpUaPiaiNNNzABsricwcsDd9AQoIlE3aol3C
         pe9p3jJawtWlDO1vCYtrm9fodwk8Vhq/VhYE5/eBjTlaIrXlD3lsyvMue568XEoUgLtu
         pFpmcpSV/MzTudTMDClO1rayFriFg/6kSn2a/TrbTzL3f46lRkAO6uR4613gWH+JuHaF
         lX55ctAR0VHfCHlFdEXL/BZ2+ecGviOMw54HMnN71joRyUIqLNSg+o4M+ZeWFzrL5n7Z
         aQwWGfOcfdnanTYvhNQSO1+BMK0IuQ4eqSnh5cmB/JRi8EzN9lO2z4dSdZ3xRVWYQMvp
         BodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792596330; x=1793201130;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0oLRP7RmrwK+s1WyDoN9zSSlBczsPl1G7flMYO8vs0=;
        b=TamQcRX7LnWi7jzxREFIhqVnYHoiVpXrkPItZRDc0pK62dpurfqw+8qRdT+akmIJHu
         eFSfhQjftU1p+eg7c/AKZ9FaGWe2fxF24Nr/EvrRURYctiBD5GhJF7p5ZSHn9wkefkhr
         fiBtHbxDTOjaUj+i3K+G96xMiWGPvYn3s+xM58AlXCbUFuzeUr16PZYPOA62C+23rfDY
         /nnUd0L/A3d/O0ACGy9GSZiDMQ6C+Ulzoi3ue3zMH4H5WFWmWrZvv7D4L265LrDJpjrJ
         FCuMoEEkZhzxJSq2pp4uH1KHYVTDMbYjSkgi18s2zFvGgczCuZTY9R+3UX9ZoNlF6s4T
         D/rg==
X-Gm-Message-State: AFq9FYJ74tCgxbumw7YzKi1virImDIZ2okT48I8Owt2y2bcIEWzV+9st
	YshYnvxfgC9ic4NlgG/QwnUkKq9xUqwswXNXlv2VAwP2HUAiY9+Dkd6yLMbK/UhMS+snbybOO6+
	4R17Si7GTma+BfC8D+Q==
X-Received: from edqo20.prod.google.com ([2002:aa7:c514:0:b0:6b1:dfff:2ee9])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:dc8e:b0:c44:14d:d95d with SMTP id a640c23a62f3a-c46796ec9bcmr208718966b.23.1792596329153;
 Wed, 21 Oct 2026 08:25:29 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:25:23 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021152527.375070-1-tarunsahu@google.com>
Subject: [RFC PATCH v2 0/4] liveupdate: Feature header ABI and named handler
From: Tarun Sahu <tarunsahu@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, joro@8bytes.org, 
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, arnd@arndb.de, 
	David Matlack <dmatlack@google.com>, jgg@nvidia.com, robin.murphy@arm.com, 
	loganodell@google.com, oupton@kernel.org, kevin.tian@intel.com, 
	alex@shazbot.org, dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com, 
	will@kernel.org, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Alexander Graf <graf@amazon.com>, Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com
Cc: linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
	sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	iommu@lists.linux.dev, linux-pci@vger.kernel.org, kexec@lists.infradead.org, 
	skhawaja@google.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_082532_551153_785464F1 
X-CRM114-Status: GOOD (  19.43  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Live Update Orchestrator (LUO) and its file handlers currently validate
handed-over KHO state using monolithic compatibility strings ("luo-v5",
"memfd-v2"). Any change to a serialized structure, even an optional
additive field, requires bumping the compatibility string, breaking live
update between adjacent kernel versions across both forward updates and
rollbacks. This series introduces the feature flags per serialized
struct to communicate between the kernel about their active and required
features. Having feature flags increase the compatibility matching
granularity.

This series also renames the file-handler and FLB compatible identifier to
name, extends LIVEUPDATE_SESSION_PRESERVE_FD so userspace can
optionally select which registered file handler preserves a file
descriptor by name, and replaces monolithic version strings in serialized
payloads with a fixed-size 2-bit pair feature header
(struct luo_feature_hdr). So in future, If a change to a subsystem
preservation can not be handled with feature flags, we can attach a new
handler to support the preservation.

This change is motivated by the LPC discussion.

Named File Handler Selection
============================
With fine-grained compatibility tracked via feature headers, the
handler and FLB compatible field is renamed to name. When a subsystem
needs a genuinely incompatible new handler alongside an existing one for
the same file type, struct liveupdate_session_preserve_fd now includes
char handler[LIVEUPDATE_HNDL_NAME_LENGTH] after token (keeping
min_size at 16 bytes for backward compatibility):
- Empty handler (or 16-byte struct): selects the first registered
  handler whose .can_preserve() accepts the fd, keeping default callers
  on the original rollback-safe handler.
- Non-empty handler: selects the registered handler with that exact
  name and verifies .can_preserve() accepts the fd.

2-Bit Pair Feature Header (struct luo_feature_hdr)
==================================================
Each serialized ABI structure (struct luo_ser, struct memfd_luo_ser)
starts with a fixed 128-byte struct luo_feature_hdr containing:
- size: byte size of the enclosing serialized structure from the source
  kernel.
- flags[15]: 15 chained 64-bit feature flags entries. Each entry
  encodes up to 31 features as 2-bit pair (req, active) states
  (enum luo_feat_state: LUO_FEAT_DISABLED = 0b00,
  LUO_FEAT_OPTIONAL = 0b01, LUO_FEAT_REQUIRED = 0b11) plus
  LUO_FEAT_EXT_MASK (bits[63:62] = 0b11) chaining to the next entry
  (up to 465 features total). Because the header is fixed at 128 bytes,
  payload field offsets never shift when extended flags entries are used.

Each subsystem defines its feature states as a static const u8 array
indexed by its feature enum, which luo_feature_hdr_init() packs into
the payload feature header. During deserialization,
luo_feature_hdr_validate() checks the header from the source kernel
against the feature array in the target kernel according to the
per-feature (req, active) truth table:

  Source Target Action
  (1,0)  (x,x)  Reject -EINVAL: invalid source kernel (req without active)
  (x,x)  (1,0)  Reject -EINVAL + WARN_ON_ONCE: invalid target kernel
  (0,0)  (0,0)  Accept: feature absent
  (0,0)  (0,1)  Accept: feature absent
  (0,0)  (1,1)  Reject -EOPNOTSUPP: target kernel requires the feature
  (0,1)  (0,0)  Accept: ignore payload data
  (1,1)  (0,0)  Reject -EOPNOTSUPP: source kernel requires the feature
  (x,1)  (x,1)  Accept: use payload data

Structure Evolution
===================
The relative order and offsets of fields in serialized structures must
remain unchanged as features are added or retired. New fields are always
appended at the end of the structure under a new feature flag, and
retired fields are kept in place so that the offsets of subsequent
fields never shift. If the type or format of a field needs to change,
the existing field and feature are kept intact (and retired when no
longer needed) and a new feature flag with a new appended field of the
new type is added.

In the target kernel, fields of a LUO_FEAT_REQUIRED feature are
guaranteed to be present once luo_feature_hdr_validate() succeeds,
whereas fields of a LUO_FEAT_OPTIONAL feature should be accessed only
after verifying that the feature is active in the source kernel header:

  if (luo_feature_is_active(&ser->features, FEAT_X))
          val = ser->x_field;

Changes since RFC v1 [1]:
- Renamed file-handler and FLB compatible to name and added optional
  handler selection by name in LIVEUPDATE_SESSION_PRESERVE_FD.
- Replaced the 3-mask (supp, req, active) + variable-length FDT and
  feature-section design with a fixed 128-byte struct luo_feature_hdr
  embedding size and 15 chained 64-bit 2-bit pair (req, active)
  flags entries directly in struct luo_ser and struct memfd_luo_ser.
- Replaced compile-time bitmask macros with a static const u8 feature
  array per subsystem packed by luo_feature_hdr_init() and validated
  in a single pass by luo_feature_hdr_validate().

[1] https://lore.kernel.org/all/20260903023452.721732-1-loganodell@google.com/

Tarun Sahu (4):
  liveupdate: Rename handler compatible to name
  liveupdate: Select file handler by name in the preserve ioctl
  liveupdate: Replace compatibility string with a 2-bit pair feature
    header
  mm: memfd_luo: Add the 2-bit pair feature header

 drivers/pci/liveupdate.c         |  10 +-
 include/linux/kho/abi/luo.h      | 367 +++++++++++++++++++++++++++----
 include/linux/kho/abi/memfd.h    |  39 +++-
 include/linux/kho/abi/pci.h      |   2 +-
 include/linux/liveupdate.h       |  18 +-
 include/uapi/linux/liveupdate.h  |  15 +-
 kernel/liveupdate/luo_core.c     |  27 ++-
 kernel/liveupdate/luo_file.c     |  64 ++++--
 kernel/liveupdate/luo_flb.c      |  16 +-
 kernel/liveupdate/luo_internal.h |   3 +-
 kernel/liveupdate/luo_session.c  |   7 +-
 lib/tests/liveupdate.c           |  22 +-
 mm/memfd_luo.c                   |  16 +-
 13 files changed, 481 insertions(+), 125 deletions(-)

-- 
2.56.0.212.g129ede20d9-goog


