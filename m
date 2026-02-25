Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A5CEFB7F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 06:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aRRYrwJJKmmym1rA1RWT0WjPr4yt1zKA44KIR1qeZ14=; b=M/dKDngZ+466d0
	xTQK46VvwFygoOXGqyVOXKlEkkGG04U4JBWuM4nvcmCFLMGEhpLMG9uWVFTXGrc2wfohoSoaSevrd
	IKPMXhNdIZ9YK+4h8xLAHox3OMWG/OKBTnEjKzLNB4i1xqUnDG6iuwWDPkiydUYkXiA0w4KTarsqg
	xl6ZkIoizNqBDt/CPT9dU85u7TfDWbOiHPOb1aWff0Mp25gof3Qu0LpRWdTQ+GxnPWGdHAow8mpTc
	aWnrLFn2F63rH0HBkfeACRAhyrIrb8WRrMHj9OFeuV0Jb5n8xME9rmIT3zpguh09u9Y/vYVMzVm7s
	hMecr9qoPFPqMNlOeZdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv808-00000003H3Z-3333;
	Wed, 25 Feb 2026 06:04:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv805-00000003H2L-38z4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 06:03:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771999435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aRRYrwJJKmmym1rA1RWT0WjPr4yt1zKA44KIR1qeZ14=;
	b=ED0AT9XoG4FNxjEns/V9xY9ZkLbZpfRfz0zk0YX3Dz1FpKJu2W2TbbE931NS5Rg9lAK5Jh
	l5ivrJ2nKgcCbKfL2MLcGIV0gcsWK2Zma3IMYSdegJJ7TzIANX4SJhf2+w+suu3TzZfrPu
	7XjXely6g3Jk6LEUW2fwOWre6WJyqNk=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-_B0dvsddMl-2DPyiKxLXmw-1; Wed, 25 Feb 2026 01:03:53 -0500
X-MC-Unique: _B0dvsddMl-2DPyiKxLXmw-1
X-Mimecast-MFC-AGG-ID: _B0dvsddMl-2DPyiKxLXmw_1771999433
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8244d786b23so2566457b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 22:03:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771999433; x=1772604233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRRYrwJJKmmym1rA1RWT0WjPr4yt1zKA44KIR1qeZ14=;
        b=BeR6SWBktCvyCpiBj6bUirvGNgu0Vsowtbb+4YutnLqWArmZzwS2N8JjwzkRiUo/Y2
         f8Re91agaOROR7cTuyl/Rmp1853HnZNVYLOHkGVZO7Hxu+/hIfgdLZbah9kbaWF4YGD+
         Y259t74qjwSDPya8W+JA419lzzdYkvG4KSNe+pDCEjktNRZTJlzuxZ7uhlaIzHCsZGJP
         QGiwjiZKsxzey+bM+7Mmjt1jnbX6AU/ioVcLMXJRa/QuncRyzS2/Slh46TFenNFtzc5E
         7JYrj+1oKiOTGcA7QbIAl/g+dml3rrvjIeC5yni1raxqqte0WGVV8LDCMb0zJBS3f+Ne
         B9JA==
X-Forwarded-Encrypted: i=1; AJvYcCV5q+hC9I+Gd80CY6NjaLk+aPQWBNCFvSnuLWj2BVct/xm2XXG5jHD8TwQz+foDeendqe4f0ZDvgF3Cer1218u1@lists.infradead.org
X-Gm-Message-State: AOJu0YyhzDlO6d1DsVpl55/QzNWb8bSEw4WevL8jSk344+W2eqHugGsx
	kVcL6HqctqMihmQxtfrIxe3n0yS+0YWA9Fnk4LlhakOC3IoGyhh0VCruHq/kVgul/dmdiZ50xTD
	7MmhffzYOzFXV8gBqc5eCY3pqhKsNNmI8MqlKvclqsWl4M8XAPHdCCDPD08oMdFSqjdn//pGWTB
	Wk
X-Gm-Gg: ATEYQzxElF38JBmc+kh1R/idOgoJvGKaWF8QJHlBil65qxN2eoeGrJj4hOSWGzz3oal
	NSMBse/7pZGqnd3jt9+Tts1Dt1QlqTX6fRFvtDvzB/IrUQ36mjnyj1qk2H2pxp86aiigC5Kx+bd
	aKazC2kA62/J1VaMM8QsA3kzZaw0pF0NdIILL9jEHyprE0h6Hy/zYugdv6MTzX+C9mxvT4lLTuz
	fyobXqG8MDtwdYgkXzt7/2zo+bbSRvZHSbgkQiQjWzvOLVD55od5QS7ZAk+iZPRAyP0f5/T7MU8
	5kVLZc1o206gI6v41T5eqzfYPYO0egfXBnoGcHnpX7F1tlp8nBr+DMHEFf0i6sCIXeJi+96M5IZ
	Va6pFdcslDrP+
X-Received: by 2002:a05:6a00:ac3:b0:81e:8e66:38e0 with SMTP id d2e1a72fcca58-827249f8d7dmr1267962b3a.20.1771999432585;
        Tue, 24 Feb 2026 22:03:52 -0800 (PST)
X-Received: by 2002:a05:6a00:ac3:b0:81e:8e66:38e0 with SMTP id d2e1a72fcca58-827249f8d7dmr1267934b3a.20.1771999432047;
        Tue, 24 Feb 2026 22:03:52 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8ecc83sm12341778b3a.62.2026.02.24.22.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:03:51 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 0/3] kdump: Enable LUKS-encrypted dump target support in ARM64 and PowerPC
Date: Wed, 25 Feb 2026 14:03:43 +0800
Message-ID: <20260225060347.718905-1-coxu@redhat.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZLd7vFoILmv6cfrYPkK0MGxXLrcHR3S72l6sMOgeMLk_1771999433
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_220357_883749_FB459BA4 
X-CRM114-Status: GOOD (  14.14  )
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

CONFIG_CRASH_DM_CRYPT has been introduced to support LUKS-encrypted
device dump target by addressing two challenges [1],
 - Kdump kernel may not be able to decrypt the LUKS partition. For some
   machines, a system administrator may not have a chance to enter the
   password to decrypt the device in kdump initramfs after the 1st kernel
   crashes

 - LUKS2 by default use the memory-hard Argon2 key derivation function
   which is quite memory-consuming compared to the limited memory reserved
   for kdump.

To also enable this feature for ARM64 and PowerPC, we need to add a
device tree property dmcryptkeys [2] as similar to elfcorehdr to pass
the memory address of the stored info of dm-crypt keys to the kdump
kernel.

[1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/
[2] https://github.com/devicetree-org/dt-schema/pull/181


v5
- Improve commit msg [Christophe]
- Fix a compiling error found by kernel test robot

v4
- Make arch-specific code more succinct by printing more logs in
  arch-independent code [Will Deacon]  

- Also use device tree for PowerPC to pass memory address of dm-crypt
  keys info
  - powerpc v2 patch that passes the dmcryptkeys kernel cmdline
    parameter:
    https://lore.kernel.org/all/20260106074039.564707-1-coxu@redhat.com/

v3
- Delete the property after reading it [Rob Herring]

v2
- Krzysztof
  - Use imperative mood for commit message
  - Add dt-schema ABI Documentation 
    https://github.com/devicetree-org/dt-schema/pull/181
- Don't print dm-crypt keys address via pr_debug

Coiby Xu (3):
  crash_dump/dm-crypt: Don't print in arch-specific code
  crash: Align the declaration of crash_load_dm_crypt_keys with
    CONFIG_CRASH_DM_CRYPT
  arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel

 arch/arm64/kernel/machine_kexec_file.c |  4 ++++
 arch/powerpc/kexec/elf_64.c            |  4 ++++
 arch/x86/kernel/kexec-bzimage64.c      |  6 +-----
 drivers/of/fdt.c                       | 21 +++++++++++++++++++++
 drivers/of/kexec.c                     | 19 +++++++++++++++++++
 include/linux/crash_core.h             | 14 +++++++-------
 kernel/crash_dump_dm_crypt.c           |  7 +++++--
 7 files changed, 61 insertions(+), 14 deletions(-)


base-commit: 7dff99b354601dd01829e1511711846e04340a69
-- 
2.53.0


