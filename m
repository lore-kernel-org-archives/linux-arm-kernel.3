Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A8FCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFek1k0mWh/Ty3927Ox1UTfk318qie1Wk1ylGq+Jroc=; b=jHSPt9ewQfXRDWT6NxTN1buDc8
	Xph/QqP+sKey9c3JaRa4QqxcACVJJL5Zf8wcJRJWnd2TzUJF7Pq2m6+12sLN2skGJFcIO2zN+5HJy
	poVMnsCG6oVnfPHXGcb6kwXe4Ypylxai01ABfgyonu9eynWT4M/4s0QPilFaCr2bz9mItcKHLrVBC
	FAaO3La7IWvd8IW6MbWDdhsd2Vffb/P5dXmr9LncDxRAwE8y+72OPa7iY0OWMWXmrT8dWizzzZG8Q
	a9VqImgnewQH6AzfWLwuhTbROVSu0JJ7iqy+hrZOTmb6wxvXRoiyW5XkhonKDBMk2tI/f7Zmpy8Po
	B5JSsU+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKS1-00000001eKn-0enw;
	Tue, 19 May 2026 13:25:37 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKRy-00000001eKM-48hl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:25:36 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-8b7dccd6fe4so35057036d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779197134; x=1779801934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFek1k0mWh/Ty3927Ox1UTfk318qie1Wk1ylGq+Jroc=;
        b=KSQgSfUAZxOsDAW3S7CH/qBpH1+Hxaqyqcz0FEGBjMvATHQpnfDUEwWe0IlyUhH0WH
         JDWqBrpeJbLgheUpcSmMlXidm22JDCqT+LDqYZTyOFtR7kaKpLRHgYGU1I5ysqBdqWGi
         5Wob6bc0/yfAcHSvHLxJF7OEMlLh9NZ0shXLaYNGUkvUBSblVSKDZLuiV7vI3v3og4HL
         PucD1yOWl3DjhqocjwqN8M6yUFkgKerq1PUXXBQ912+sIMeQCR+/xC9+j+f9Ia93eJy+
         Wc33BS9SwBygkSkiLFxpzO106PuJ2pi/k2psZNATYs6i4lXjJ0f88+9A+mhbjIgjAFyB
         NRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197134; x=1779801934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yFek1k0mWh/Ty3927Ox1UTfk318qie1Wk1ylGq+Jroc=;
        b=pRRETzbExx2yDlRbtDB3XEMmsIQqbuq/8heR3zaTVSAXcHmOA6xj9LSJ992e0pqi0B
         D1wROM386zo/TNmudxJDKIZvhxsmlJ+FFUEnM/YtM7uQLYeFaN9jfW4mZLp7G/xEf73A
         Dmn36vHLuHaJRoBgJbWsgDtssIk+/W5ciwDvYyY1mAmwY6+BYeYkKlIRN56yj6YyVDw7
         4M5g7Xigp3h3/BbfqxUNVMLJJN0Q3oJSPtRFKGf9ioKrxBgcTJHFHlSp0fOWYBENE+Tw
         t/IW55x1QQq/U0WPo01er0Az6c5BV57b4ehjwb3RR0Mau8xGM48iL59TuDbYWE+NM8OL
         J6Gw==
X-Forwarded-Encrypted: i=1; AFNElJ9QEuV7ng62G84FlmXVmW9vvVWZHcuQ/TyZSYsgG5ap9ITDBEAzsh6/yurTWblSPG0uuXk9FVeC2YX64o6Rt+3I@lists.infradead.org
X-Gm-Message-State: AOJu0YzDu8tpf4q7CHcOC4x1NdZ1JWIr/TV5LIIte5go5b7INr4pRB0y
	Zk+wOI1EhHNqx5a1N9Ok6HEwFbimlH72n+euyU6TMH+KeYffDz6NYxVE
X-Gm-Gg: Acq92OEYue+TD2AJLRyWXy8t2uJiSHZlNZJsw82pCvDolL/C4XTd1J5doonnbnQGkiO
	LZTvoBYzOtz6fYAZvPoPwcSccx5sXKnkHAghNuMvWuE398So9GsBsTo4qPGm5EQ5E4a1YeIU6xc
	XGNuBSecoTTXgsnn2rdkaX1b/UCzfvqZ7DopomAvL8NpOOTxN8GkIWg44emCwZ6NovIr10BGUi/
	PMPa6k8SiBUWljP3lV+n9l+vJ7k6Bz/M8ydNL0vkxkfD7tqQNnGC6Yz2VgZpY6baMhd/3S47yiJ
	cZHBqlw39YvV3wKe4hVABq8OpaHatxqrJmNPQTXsaOgz/L4PK2dBR9dPilhCGaaSMlB0LDnZ0Fz
	hvNawVmAao/Yx7D4GW6j5J1IGjYnwg9lzA4Ia4qxtsey8PwX1mB2ipbCWYsv0qFrT5TusB+mmL5
	HX3Qp1/qVKRgxUodhA+I80VoEROPM7rj2GFU8kMSFasYUeLJ8JXu3ig/+m7g0SiDfOvi6pWj69D
	SXVGIjpudNj53ni5g+bLUb1Q3DonUw=
X-Received: by 2002:a0c:f08f:0:b0:895:498e:e9dd with SMTP id 6a1803df08f44-8ca0f64306bmr262712696d6.2.1779197133608;
        Tue, 19 May 2026 06:25:33 -0700 (PDT)
Received: from server0 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca36097a26sm90563716d6.17.2026.05.19.06.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:25:33 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Yao Yuan <yaoyuan@linux.alibaba.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: vgic-its: reject restored DTE with out-of-range num_eventid_bits
Date: Tue, 19 May 2026 09:25:19 -0400
Message-ID: <20260519132519.2142458-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260517174955.273004-1-michael.bommarito@gmail.com>
References: <20260517174955.273004-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_062535_037997_404A008E 
X-CRM114-Status: GOOD (  13.59  )
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

Userspace can restore an ITS Device Table Entry whose Size field encodes
more EventID bits than the virtual ITS supports.  The live MAPD path
rejects that state, but vgic_its_restore_dte() accepts it and stores the
out-of-range value in dev->num_eventid_bits.

Reject restored DTEs with num_eventid_bits > VITS_TYPER_IDBITS before
allocating the device.  This mirrors the MAPD check and prevents the
restored state from reaching vgic_its_restore_itt(), where the unchecked
value can be converted into an oversized scan_its_table() range.

Fixes: 57a9a117154c ("KVM: arm64: vgic-its: Device table save/restore")
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
Changes in v2:
- Trim the commit message to the root cause and fix.
- Shorten the in-code comment as suggested by Marc.
- Keep the validation logic unchanged.

 arch/arm64/kvm/vgic/vgic-its.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 2ea9f1c7ebcd0..1d7e5d560af4c 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -2307,6 +2307,10 @@ static int vgic_its_restore_dte(struct vgic_its *its, u32 id,
 	/* dte entry is valid */
 	offset = (entry & KVM_ITS_DTE_NEXT_MASK) >> KVM_ITS_DTE_NEXT_SHIFT;
 
+	/* Mimic the MAPD behaviour and reject invalid EID bits. */
+	if (num_eventid_bits > VITS_TYPER_IDBITS)
+		return -EINVAL;
+
 	if (!vgic_its_check_id(its, baser, id, NULL))
 		return -EINVAL;
 
-- 
2.53.0

