Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B70EB597B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 08:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G1KvghMrg5FQLYtugCrRlvN5/+TeaaG+RNwvPgguvEY=; b=3EEF36G96NutMk
	IkOz4CUfqdR3VppDhwYK1slrOciGdf2nrkVhT+Wm+pD18ARN2CdaisHv6lwQGWDqSZluL6kv+eHKB
	a3Ou0Vr65XdMyzyAx8ZePP/DwKeyiTtyIpnTTtxZI8DFHpcpwgAt1oaaVWQfvzyHdgV+Yo/RKG54P
	H9qqePgnbYBcnFeNtmqL8aSBg+4s0KRdy9mWaoEk1NKhVWj2FkOAvd2jpzFqytgzHJv+KHdb0p7lR
	fD2HakqEOglJgcf4ZFPiPCJXsV+dSVx9ncb/Uyphh8y3pW59uSjeaqEvVJ4vcR/YCVBstkJNGBeny
	vSNGZCXHsx4OIEr4e4ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq5WB-00000000O0L-3A3I;
	Wed, 11 Feb 2026 08:24:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq5W8-00000000Nyw-1BIR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 08:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770798249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G1KvghMrg5FQLYtugCrRlvN5/+TeaaG+RNwvPgguvEY=;
	b=RoLDxS1t2M1rg5JM2bTEhKw3w1PhNwBmcsmmYM1j4K4xBMqBRQ8a71LdKmRYISXWgHcwL5
	ccoPWzgncTk4+03q5R1LLu2VGaUsXD/2ZTNL70o7ist8/4kWF20WeNxjP59WL/zKoSR/CX
	CqbC7TLIdl5aN4/aruIVDio9hjMxSNA=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-2PWa6x9xNmOVzfxfcRvZ_g-1; Wed, 11 Feb 2026 03:24:07 -0500
X-MC-Unique: 2PWa6x9xNmOVzfxfcRvZ_g-1
X-Mimecast-MFC-AGG-ID: 2PWa6x9xNmOVzfxfcRvZ_g_1770798247
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a946c0e441so20358625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 00:24:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770798246; x=1771403046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1KvghMrg5FQLYtugCrRlvN5/+TeaaG+RNwvPgguvEY=;
        b=AUlFjtSqDA6G2mhhstcDiRw8XhamOdhdASr1Kk8x0T5q+XikMKw3mFdYdA4pyHeo0i
         frdAX8hMzT1mP9jzeTlkELZqWXlGzW3wWCrwuqpUuOiusrXjRpl5JgEae1UBI7qFO5Jh
         tHSyzPUBJ0SbruGQYCsE6aJY3S6tyQ/sJwTXCvmAQdogYhVjghgZCgag2MBSbWZ9CZ8+
         dv+GNPWygH/VojwOu0wk6gpIA7D8z+DR0oj8iXfYS0PjYTimeJc7XFYsv2oU7X0n8HqC
         o5D//OtBKwTux5QXKgvQ52dixxL8IIuu1zKj50Evf78IkVmxw4gU9/otdqbwXkYmOVWu
         O3oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtBgaXYL+UvcI+HhFXWh13nrUqVUvB/BmxHq0l1y+rfVmOp4xcs60UH6JGPzMS2OFHcTQsZmX2KjCVFlOqBT9k@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3mQGPN8BOa8Tja1aFVTWasSFTJ8aGOLv69xCGmKBSRTZXEBMV
	YfrIqgqILAL/L/C1WWYcZKHJz/Q/04RelTUg324PaTgQZHupFjbcvSyXUgzqWJNmQY3KTuB97am
	MWFJzJL+0JM8/okb2KuhzRp8QssKkLa0qbQmY0BPiNLo/bD/DWGQUfFl4MEk0VRBkyEtf0dRbo5
	mno+exEyNQz9w=
X-Gm-Gg: AZuq6aK+YNzlzYN1DZK12VdcstHOcwGJwbeb6dyNDRzhotFdJIOYerMaIbS/yjCSsIl
	RpHi3gZwFjmrCaRo1ErRFqC0jEOZ4Tru1eKFYnjHFTK13RBT8xVqZ3ktZGkzLGA0VTp4XQ1SgT1
	H48j5rqnkst4SIeCj88KG8eRDLZVSTiz3rh18E1Hz4yPD381t2m3JZHzATRc6m3/if2BGhYcHAc
	9yI6EuWRkNOy7gwL+p4H/DFJWlRvZalEqVG76i972L9lXCvOpk3u+xkFLGKARmnjgBLZ5e2e8Jf
	DoJjNRxh87XDR1GyNxxiHPUqB3PFeRLaQgsrfRWypx5zJntUYk4AYEN/ceIgI3+YCR1f8YV/L+J
	lWYU6BlUm6n6z
X-Received: by 2002:a17:903:985:b0:2a9:cb10:42d with SMTP id d9443c01a7336-2a9cb100bcemr122999085ad.61.1770798246168;
        Wed, 11 Feb 2026 00:24:06 -0800 (PST)
X-Received: by 2002:a17:903:985:b0:2a9:cb10:42d with SMTP id d9443c01a7336-2a9cb100bcemr122998855ad.61.1770798245566;
        Wed, 11 Feb 2026 00:24:05 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2984ab0esm15186415ad.9.2026.02.11.00.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 00:24:05 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 0/2] kdump: Enable LUKS-encrypted dump target support in ARM64 and PowerPC
Date: Wed, 11 Feb 2026 16:23:58 +0800
Message-ID: <20260211082401.2407853-1-coxu@redhat.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jh9qqXETkR8Vo0f8z4g8q0yoa6zT7x4UbeFqp65HI7w_1770798247
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_002412_396459_91026268 
X-CRM114-Status: GOOD (  12.84  )
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

To also enable this feature for ARM64 and PowerPC, we only need to add a
device tree property dmcryptkeys [2] as similar to elfcorehdr to pass the
memory address of the stored info of dm-crypt keys to the kdump kernel.

[1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/
[2] https://github.com/devicetree-org/dt-schema/pull/181


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

Coiby Xu (2):
  crash_dump/dm-crypt: Don't print in arch-specific code
  arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel

 arch/arm64/kernel/machine_kexec_file.c |  4 ++++
 arch/powerpc/kexec/elf_64.c            |  4 ++++
 arch/x86/kernel/kexec-bzimage64.c      |  6 +-----
 drivers/of/fdt.c                       | 21 +++++++++++++++++++++
 drivers/of/kexec.c                     | 19 +++++++++++++++++++
 kernel/crash_dump_dm_crypt.c           |  7 +++++--
 6 files changed, 54 insertions(+), 7 deletions(-)


base-commit: 2619c62b7ef2f463bcbbb34af122689c09855c23
-- 
2.53.0


