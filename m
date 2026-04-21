Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B16F8FA78
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 13:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0u/vOf9MRjGdS+aUvxA7BuDlL6EoYtTCq2GhHcWAQUc=; b=v0QbU8pG9KCoDudhiPLmLRTW14
	iwwgriqc6lu+SXFAqJRAwlwVkEf+5bcs38T7y+odDgFXtVzQVV+j/4ZLlKlQqTosWgIxPrygs94qI
	CRIBzPMi6e2TYmC9I9Ru/cKFHxrxcR+a7tU91ivxoZq3/wbNMYBERsbc3ditfOg+uIgAYrgKKBJre
	3jjcLCYELccBoCkic2YVyV5zwziVUgI74kB4X9lupbSX+zLDMYcW6f60TmcnvEArkHNAiRE8X0P7G
	3vQaKh5yvRQWRRhP5hRcgx00pUpiXial61nJgmpGFsyIHiHHOwSnVBYcfEEDGzbHV1PDZ7mI2HM9g
	LEQWyRuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBX9-00000008hQS-02nX;
	Tue, 21 Apr 2026 13:52:59 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBX7-00000008hPv-1lu9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 13:52:58 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-35d95017a68so2805271a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 06:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776779576; x=1777384376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0u/vOf9MRjGdS+aUvxA7BuDlL6EoYtTCq2GhHcWAQUc=;
        b=L6zzdiff8z5KgCbx3ifAtlpoKwsOEhoxOtuZCIQeP3pIKgXmaSbHkAmyPAKQRv45Y0
         jJVUNBVgistskddrSmP8Tce+5J/k5VU/1QXDXL9BQ1jDUiIZwy64jhFpeYrh3yJbvsvb
         CyqY1RDwQ9uIjQekWSqhfoW7p9GuXyyIkQ4LX9LYIZRg8PRaWGEmugt1KdefBh7m27Px
         UlKDt1T6u6Bs+IW+0NF0/7GWgSm0CDJkNNBo9XukSTgXC63Kj5J9qr2lgVd9wkRUviIG
         5vFifNf9QyRW3fW/CAEqGC72NPLQThrq0LDmpGWAmKBMFtqlLSGwR4vnIb4O0gSm2dsH
         yQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776779576; x=1777384376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0u/vOf9MRjGdS+aUvxA7BuDlL6EoYtTCq2GhHcWAQUc=;
        b=NZFIU4gwr1Vmis5KdoYKNC+TeBoOWw0oPmc+38BwoJjlEDzComhHr7yf2jbPOxtYXZ
         dI7WpJp4PC+Oh9c2v+m3KJa0CFxAyBGrgTDLhk7ySYG8b8fJoHZP4HuZ2Vnc4DoXPkkn
         215XGnKYL3tIWWizVEUnhkDGBmmdVOPOcNVkd0FBnVIJTF0Hd8yxFkLcsQi8CmHMBu5W
         5kAgdctAb5Lu9PVPWlfb+Wx95VbDVypqj49Fg9nzH+mxg7b7pKQr8Q7B5ycMM1OZJkLt
         NF1jooBizC3sY9nxI9wTgMznuzNMoOLIRSU2e4PsFxaqHOudYM3z9EpPRBqdkr+7//jU
         Xt5A==
X-Forwarded-Encrypted: i=1; AFNElJ/T4rNCGrm27jhSgBIUI8wmD9HREQtMGYE8Di8TEohBMhh/I+UgBJw+HKyG7YxYFNcvJPeoDmaBYRAUdCEKxnof@lists.infradead.org
X-Gm-Message-State: AOJu0Yy62n1Y6nrZ4YTGKexgbG3S1wzynljsRxmGwn9L4+EY9VvNDB75
	S83YWirdMmlTOdwmQ09u2fK66H8Mqhem8Itl4xx1JiibahBg3XgvyyPJ+ZJKvsHSj7q0Dg==
X-Gm-Gg: AeBDieshE5NUFBV/ixaXUSReYhH59ebGyEmcb2OcwxkzkxofTuFPwxRpn05cSIdKtFh
	NnqxX364ZzmxlL7ajOGl1TkeRWPlefPrMe/EL5aR2xIZzQwDW2sJwJ0uYSMirU+XdSzZGYuJFk6
	nogt6rR7jRCqIzKtEhccVvq39xp+Mplv+mGWPwhoXFUc0XjB7HReVDDgJ+9uwsE0rErz6D69cN8
	fax7ExZfUNYw/iHp6I2cPXTta4WXdsW317rzo8ywRkEvHY3ElhQIP9JVThLEvhqsoX8LEn6iIUZ
	LICOUnjUK1CtiqiSSfs4TEdCefsiZCctliJr10NEccuaccTaBv0rue3l7wfZX6mDKfx+B5Iz9nO
	ektqwx0iyVeP1ulvyiMzQYvim0nfvC/bdVLbeNzuW2T2VTcYj2Zhj/stGEv/IkAqj5skhh2qrMz
	xNgl8R2o3T0Y59uBM0RpmhtbE2tNtXncf9/jzCFet+mJX0xY9rq8A0rbc=
X-Received: by 2002:a17:90a:f16:b0:361:4521:d311 with SMTP id 98e67ed59e1d1-36145221bbfmr11784735a91.18.1776779576240;
        Tue, 21 Apr 2026 06:52:56 -0700 (PDT)
Received: from BF-202508301248.localdomain ([39.144.124.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa33486sm165571555ad.33.2026.04.21.06.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:52:55 -0700 (PDT)
From: Jiahao zheng <jahao.zheng@gmail.com>
To: steven.price@arm.com
Cc: alexandru.elisei@arm.com,
	alpergun@google.com,
	aneesh.kumar@kernel.org,
	catalin.marinas@arm.com,
	christoffer.dall@arm.com,
	fj0570is@fujitsu.com,
	gankulkarni@os.amperecomputing.com,
	gshan@redhat.com,
	james.morse@arm.com,
	joey.gouly@arm.com,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	sdonthineni@nvidia.com,
	suzuki.poulose@arm.com,
	tabba@google.com,
	vannapurve@google.com,
	will@kernel.org,
	yuzenghui@huawei.com
Subject: [PATCH v13 00/48] arm64: Support for Arm CCA in KVM
Date: Tue, 21 Apr 2026 21:51:45 +0800
Message-Id: <20260421135145.14789-1-jahao.zheng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318155413.793430-1-steven.price@arm.com>
References: <20260318155413.793430-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_065257_460023_E32F55AE 
X-CRM114-Status: GOOD (  12.91  )
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

Hi Steven,

I've been testing CCA patch series and noticed Realm VM cannot boot successfully when the host is forced to run in nVHE mode (e.g., via `kvm-arm.mode=nvhe`). The kvmtool debug information will be truncated in set_guest_bank_private_gpa. 

Currently, in `kvm_ioctl_vcpu_run()`, running a Realm VM (REC) bypasses the standard nVHE EL2 stub. `kvm_rec_enter()` directly executes the SMC instruction to transition to the RMM. Upon returning to the EL1 host, the code falls back to `kvm_vgic_sync_hwstate()`, where the VGIC save operation is explicitly skipped for nVHE. Since the EL2 stub was bypassed, `__vgic_v3_save_state()` is never executed, and `ICH_*_EL2` states are lost.

To resolve this, I have a couple of thoughts:
1. If Host nVHE mode is not intended to be supported for Realms:
Since RME implies ARMv9 which mandates VHE, running a Realm with an nVHE host might just be an unsupported edge case. If so, we should explicitly reject RME initialization or REC creation when `!is_kernel_in_hyp_mode()`. This would cleanly prevent the undefined behavior.
2. If Host nVHE mode is intended to be supported:
Since RMM should remain agnostic to the Non-Secure VGIC states, the burden of saving these states falls strictly on KVM. However, the EL1 host cannot access `ICH_*_EL2`. Therefore, KVM needs to add specific logic for this scenario. We would likely need to route the REC exit through a dedicated nVHE EL2 stub to invoke `__vgic_v3_save_state()` before dropping back to EL1, rather than jumping straight back to `kvm_ioctl_vcpu_run()`.

I might have missed some documentation or comments regarding nVHE restrictions for CCA. If this is an oversight, it would be great to see a check added in the next iteration of the series.


Thanks,
Zheng

