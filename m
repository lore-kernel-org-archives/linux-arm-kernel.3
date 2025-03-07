Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77796C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 11:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LHGAvVOy+z7tslJkuRFoq74XjD23wZovKlYyMhZTzi0=; b=Dw+hmlmzfT9GtB
	5GWViUffFLlp7KEi9O9flXat7+6KQRfqZEkVaO0c7Az8UVZuE/PgzSn0nl12X3EMws2U/+N2jVR7C
	73+tczbdAJF4TUOz6tF0uxocu3gwbkx2dKKjHmUCnDU8/q2d10PVIgc41v1Vb382IodewgyMo/amK
	7xXKwcuHqQDNWsfl1QNREkLzDRlQDyPb8plhj40b/9v43M0dk2m3W+pl9MxBmEd+y/0DZVGFT9Zme
	0h05HiuP5S2nDFswNKkaMlJg61as8OYOLNjklyY/VjtsgM1NrNdMMPhC46Rx/v7AL4PpoJP7SVHdH
	N5SqLvvZJQi2Vx+F7NKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVRZ-0000000DxV9-2kV6;
	Fri, 07 Mar 2025 11:00:41 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVMc-0000000Dwlx-3y8E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 10:55:36 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22355618fd9so30706915ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 02:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741344934; x=1741949734; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LHGAvVOy+z7tslJkuRFoq74XjD23wZovKlYyMhZTzi0=;
        b=ObawM1/mZPr49stjpLg9fmZFK4OukuGIE9yyB3/fjn12Ryf5HO7nOZVzdl5hdZk6c/
         +8dPGs8J6f9gxuhrQww5OBLQd5lWCu2LaH/DwFLcpgYi38J7PfeS/dLVva+FYT74pybh
         L1Gu3HS+T13x+05JiGhK4eq64OWWO+9r3+SabfpIr6THSedozqEdk6jw4FyrnfzCgfQm
         /SazDZ1F7qoXmC0ru9LoX4i03JTAH6876vpSv4dy0YQl3HdEZX7lyuT/KgMLC/AAYcdR
         zOWnaQDR50hJBM0clgd4Ux1P+kPxNz06+tc8UsPXRmjCZVwnf4KWl2qdDIjflR4j9ywT
         xWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741344934; x=1741949734;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LHGAvVOy+z7tslJkuRFoq74XjD23wZovKlYyMhZTzi0=;
        b=N8+Ot/c2rTaM10rnaE4GgtcunfmTWhJvnQR2tGiKzI0dfBzA27kRoEfHN1sJeHWAdc
         yMN5qDIUSJGkIRdBJgv6ZRbDA5jZuNsUlYoSrhYn3gJOnEqsEZBYb21Edd/zn5/xcsJy
         I9dpC790eTT/XFDlNeo4jEAnW50KNksmDjpWYXdV7hqal3LI4tvCX9rA9rtQEltXqgrt
         uo4gN3ub8m2ibra/1KgkWeNtbDrW/beUrpNg/S8WaRWEqFOGQ/YJzQSoJxTd9fd8S6tb
         7JEdpsILkIA8tZJYb9eIrC1iYNUrvId9zzmtqoc11V1dyKHhcspD+XZohTjnddPi6e4z
         M82g==
X-Gm-Message-State: AOJu0YzDGEogGcoHP5aVOyJaht2oBpvOrp6CiZkNdl4dREBB9fcK7cgW
	VQ1hEOnXoMyCKFTg0sJ2gjA8Lw6iB3N+KIhPfZ/VjI6SW7wAB4xkZENTm1WcVBM=
X-Gm-Gg: ASbGncu5nv5jK8lqZcxH0/c1gRePKhUjydNwh4FST540WO+hrq7VvHbJLqO99ppgwxi
	qF8fpV9/y9GB896bJKwCZMQV+OeOLynUPkp/XxFQNwCRZi6PgA9A+WSm9MDXb3U9XblPPX3wPzG
	4pr8ZqrOIjiGxfuSAJt6KEuUVvcXcqfoOXImG3tefoeWy3QdwSe3mwsM2JjpZY323RJtSLkYg2x
	ALe2Jb5yg3Nr9XhY4mD+zl5i4LBGO9yTNh6Lhe81UU38s5KgzWXDbjHIaxONNABy6+LhHZMdup7
	nN4fW3TA/0vLwRP3JSDJbBEOoyZBr7VITKtyE3aMMc+g8Ois
X-Google-Smtp-Source: AGHT+IEiVKc2iHhF+yedYxasrw/RgvPlEuNFYHbgkXWiWq7Wuopt6Hk+svT+6fLFsvnb0h5t9ef08g==
X-Received: by 2002:a17:902:e811:b0:221:78a1:27fb with SMTP id d9443c01a7336-2242887fe65mr42409665ad.11.1741344933733;
        Fri, 07 Mar 2025 02:55:33 -0800 (PST)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22410a91e66sm27027945ad.202.2025.03.07.02.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 02:55:33 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 0/3] KVM: arm64: PMU: Fix SET_ONE_REG for vPMC regs
Date: Fri, 07 Mar 2025 19:55:27 +0900
Message-Id: <20250307-pmc-v2-0-6c3375a5f1e4@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ/QymcC/1WMwQ6DIBAFf8XsuTSAtZGe/I/GAy5Q9yAYaIjG8
 O9Sbz3Oy5s5INlINsGrOSDaTImCryBvDeCs/ccyMpVBctnxlku2LsgmxXX/1E49OoT6XKN1tF2
 V91h5pvQNcb+iWfzWfz8LJhhq51SvuGoNDkbvnrY7hgXGUsoJXHQftZcAAAA=
X-Change-ID: 20250302-pmc-b90a86af945c
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <drjones@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_025535_115437_54CA8C44 
X-CRM114-Status: UNSURE (   9.96  )
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

Prepare vPMC registers for user-initiated changes after first run. This
is important specifically for debugging Windows on QEMU with GDB; QEMU
tries to write back all visible registers when resuming the VM execution
with GDB, corrupting the PMU state. Windows always uses the PMU so this
can cause adverse effects on that particular OS.

This series also contains patch "KVM: arm64: PMU: Set raw values from
user to PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}", which reverts semantic
changes made for the mentioned registers in the past. It is necessary
to migrate the PMU state properly on Firecracker, QEMU, and crosvm.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Changes in v2:
- Changed to utilize KVM_REQ_RELOAD_PMU as suggested by Oliver Upton.
- Added patch "KVM: arm64: PMU: Reload when user modifies registers"
  to cover more registers.
- Added patch "KVM: arm64: PMU: Set raw values from user to
  PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}".
- Link to v1: https://lore.kernel.org/r/20250302-pmc-v1-1-caff989093dc@daynix.com

---
Akihiko Odaki (3):
      KVM: arm64: PMU: Fix SET_ONE_REG for vPMC regs
      KVM: arm64: PMU: Reload when user modifies registers
      KVM: arm64: PMU: Set raw values from user to PM{C,I}NTEN{SET,CLR}, PMOVS{SET,CLR}

 arch/arm64/kvm/pmu-emul.c | 19 ++++++++++++++++---
 arch/arm64/kvm/sys_regs.c | 44 ++++++++++++++++++++++++--------------------
 include/kvm/arm_pmu.h     |  1 +
 3 files changed, 41 insertions(+), 23 deletions(-)
---
base-commit: da2f480cb24d39d480b1e235eda0dd2d01f8765b
change-id: 20250302-pmc-b90a86af945c

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>


