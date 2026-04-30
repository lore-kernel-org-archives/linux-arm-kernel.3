Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD73BFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 08:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHn7aNKe8Z0UpZANHbjAHiTC29hYbOiQjktEyz/Ro2M=; b=XXNL79tahB8qC0jy7jjpOLXTEZ
	Mpwb17dzL/unltR/W5cfypSMGLlYnk6EYyg26NfvAWYaIOLi35c82F2Qtkw1sGudaKRyxIXQvEYXv
	xiRvXAhWOcT87+1VFH2F6g3iLKnXG9vms6/c6b75vh4zHMIv1NUIZ7TakkGagv+Yqof3lSelsH777
	6UFe0bavlFkTsY2dD+cEAkP5YHqGlki3mqaPYJgmWCguVtaBanmDFEeMleqq7CnW5N6FJb1fgII+P
	GOL41lJJ35kdu2N27eiPFQTyMWq4aM+HixDbIZ4w/wrdyPZqWexhe+iHez7QKMfaKzTTpogWy6yMt
	kFeab7Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIND5-000000053wJ-0qcX;
	Thu, 30 Apr 2026 08:57:27 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINCz-000000053vD-2zNa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 08:57:25 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-652f220595fso619917d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 01:57:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777539440; cv=none;
        d=google.com; s=arc-20240605;
        b=gyvMn4VK+8wBxIl0CwVy1uPb0ltmT30UF24UTanMwl6tSIjDGKdSDtzhx/uCshHW7G
         /9SnGkel4Q5izDfNwu/X+zU22pnbcHSoFB8yut/ykGW2r+2/D1yl+DPQ7hwHrK5ffaQ2
         bP4lgUPdjR+RRQO0cZ9nd9NDm/8Iz5sqZmdk5rEGmTKGE3uxAp5p4/tFhSjNXLq3R/Li
         DejHNENFhc3pEsRSAEB0ILpS+Itf9R0hLc7l1uM9Ty/k/JP6mUwa2G3adT5/WXKKJsdl
         LiEZmNf5YrvwQllYXZ3Mk0tA8mGpjjE10u8Uzwl13qPfnRzqDLG7bB29yKZwfoFpxltK
         jSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WHn7aNKe8Z0UpZANHbjAHiTC29hYbOiQjktEyz/Ro2M=;
        fh=QV8tM6n1GC5Si7ifCS2Y/GuaGWOh1Q/SoQF+xPtgKs0=;
        b=YdmqEH8Rw1K/Xao+lWF4ODbK9FAwaEtLt/k16uIV3dB+pXZ4fT4JKHcXgU4uLZXASq
         Y3y+1TXkDTFThCDaFs3wE4MkbZAs+T6UhgTzkIsApJEt77v3fHA0Ys5weoczJJIdDICl
         WCshFFGlb6G2eSXUlsRidjJthLWTGBZsCLpStkBzNPevDfGhyItxuho2+LkAOKp5mvM9
         0PR9eT9Wq/wkhC5lV3QWm1wmx/jWyotaJq3MvqrlnrW4Mek0iQhitTBSsFpUumKWiSWa
         5ZfLD7wTrGgYPm2F15jke7PR0qpmmSHLFYiqN1wrb3f/yeRNwz+k6Skt7X6Kpr4BU/c+
         z4Uw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777539440; x=1778144240; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WHn7aNKe8Z0UpZANHbjAHiTC29hYbOiQjktEyz/Ro2M=;
        b=mIBewLK8M7wVO3UTuRwrtlDvYdIXKM3d6J5HoWWQSGnc0AxZ2cGtXQA6AmD9x7kVCr
         nSFaB4NUAj1L5xZpjzxVUPajMPAFIW1jeDDQFL7KDCbc2a9pvh3/Kq4ephV2c19B/Gai
         Vnu7Xsz+29wnI9nB7vc/axixOSz2or127Fc5Za5c/5HmjDHYjSHaGLTpB6zqN1i11Sdm
         GABWUwqo9dZHKrXPTSeu50n7UBz5M8Ghy02hRzQLbfqVbtLCsJizrtj9o1ozTqxbQPNh
         WytTWuFKao2iN5jjb962G2wCVSSZpc8p4ACdZqGGTy3HOh59eFWFsVh+i40I2xNvbNxN
         +N1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777539440; x=1778144240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHn7aNKe8Z0UpZANHbjAHiTC29hYbOiQjktEyz/Ro2M=;
        b=V9800ntUM+Y0DrY6idVKpYIJZd2eYjVeoJboraVLOQnJ/qWBvz0zNaplHmbN7l2FXp
         LIoEi/I7vOMY1iu9pF9ZfP2llb/u9CiKe5ZplboVDj1I0QM2xv/nZPQSdC58bs1g8h91
         wdkv38gP9zYbrajHKPFK0gbkp3xb3ULLaYlfxCW8an2nY82JhxdTzjrBeQoN9SZj3wjg
         muT/7JLTnfm/KpGb2/0a4zbOkuzcfrkADha8QM9DbmJl+00ZX+6ChvZ+p0EbuScXrhSD
         P2gcfCTOGPgognzLugLQ+KZyuj4ZQiZbPwczt+FdUP3T33Y3TShIdZwjxMeWnPMa+lue
         XnZw==
X-Gm-Message-State: AOJu0YxNYy/229FITZQXRW1Rm5C4owbE5vzN9d8AcfkkzZpwJeq37tjt
	BrBg7xs7EXrws1VL+xQhAG4MBWR8PneMBxApP4T71kGAmrqg/5Kb12GmBcq8REwno7ICksrt/Cm
	jtzfJmwHs0rjk/BNDPExpRiwEXJTSRVqFQ/ELxCbCGg==
X-Gm-Gg: AeBDiev8sb+l7VuAeQh3pTVe7bQXgjxoiXR0MoBIAk7zXIfhQWakqs+E9yL5Xvz6Nid
	6Fqj66Hxl2MmR1r7WcwKjYtiHvN2L83fQBAXa0jU5La1dgB1CtZXMyPBdw2TQkFlmLaGBxBG8qJ
	IejuVaVVcom2jzWW7eFjF3hhktbAPRRCiSvO1Gq8K15wZbaPNQ9yzJJT7cepUGKB3pYGpUEMyk8
	S83IqJxOCW3wM8qVbaCZduHwRKiRnJGd9dE8zFNEJ8mYDBpCFhiMhuDqJ2Ann/cldgXbn7rcvOx
	cOwAb68cx0oOs7g6QOrPpR+LCJ7BnNtr5DMSfQG+s4Ctgnl248QK/oDudj+67iiOFFxJ2gBPYkg
	XlA==
X-Received: by 2002:a05:690e:1698:b0:651:c782:6a8 with SMTP id
 956f58d0204a3-65c18b3e650mr1335368d50.15.1777539439953; Thu, 30 Apr 2026
 01:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260427160547.3129448-1-sascha.bischoff@arm.com> <20260427160547.3129448-44-sascha.bischoff@arm.com>
In-Reply-To: <20260427160547.3129448-44-sascha.bischoff@arm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2026 09:57:08 +0100
X-Gm-Features: AVHnY4Jvy3n3XpKrxh1FlvrSB6Vt4VXuFhqD0yDhLAN5iHhEm91Tb3vWrZI7GfM
Message-ID: <CAFEAcA8m1Y-8=+7RZjte1WBwycgnHEx_+yiU_ieriZr5DbQKsQ@mail.gmail.com>
Subject: Re: [PATCH 43/43] Documentation: KVM: Add the VGICv5 IRS save/restore sequences
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, 
	Suzuki Poulose <Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Timothy Hayes <Timothy.Hayes@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_015721_791631_72B99563 
X-CRM114-Status: GOOD (  29.41  )
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

On Mon, 27 Apr 2026 at 17:22, Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:
>
> When saving/restoring the state of the GICv5 IRS, it is important that
> it happens in the correct order. Failure to do so will almost
> certainly result in failing to restore a guest that is capable of
> handling interrupts correctly.
>
> On a save, the ISTs must be saved prior to saving the guest's memory
> as the guest's LPI IST is written to guest memory. Conversely, on
> restore the guest's memory must be restored prior to restoring the
> ISTs.
>
> It is important to restore the IRS MMIO registers by first restoring
> the IRS_IDx registers as they define the capabilities of the IRS, and
> are used as part of creating and managing ISTs and SPIs.
>
> In order to restore the ISTs themselves, the IRS_IST_CFGR must be
> restored prior to the IRS_IST_BASER. This is because KVM extracts
> fields from the CFGR to determine the size and structure of the IRS
> created by the guest. The IST itself is created as part of the write
> to the IRS_IST_BASER. At this stage the remaining MMIO registers can
> be restored.
>
> Once the LPI IST has been created (by the aforementioned write to the
> IRS_IST_BASER), the IST state can be restored using
> KVM_DEV_ARM_VGIC_GRP_IST. The SPI IST gets extracted from a userspace
> provided buffer, and is transferred to the host-allocated SPI IST. The
> LPI IST is extracted from guest memory, and is written to the
> host-allocated LPI IST.
>
> As a general rule, the IRS_*_STATUSR registers can be ignored on
> restore. They are not userspace writable.
>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  .../virt/kvm/devices/arm-vgic-v5.rst          | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>
> diff --git a/Documentation/virt/kvm/devices/arm-vgic-v5.rst b/Documentation/virt/kvm/devices/arm-vgic-v5.rst
> index 38eef7cc63e3e..1c55f5040757d 100644
> --- a/Documentation/virt/kvm/devices/arm-vgic-v5.rst
> +++ b/Documentation/virt/kvm/devices/arm-vgic-v5.rst
> @@ -201,3 +201,66 @@ Groups:
>        -ENOMEM      Restoring IST state failed while tracking pending interrupts
>        -ETIMEDOUT   An IRS save/VM operation timed out
>        ===========  ============================================================
> +
> +IRS Save Sequence:
> +------------------
> +
> +The following ordering should be followed when saving the virtual GICv5 and
> +IRS:
> +
> +a) Save the ISTs by issuing KVM_GET_DEVICE_ATTR on KVM_DEV_ARM_VGIC_GRP_IST.
> +   This MUST happen before the guest's memory is serialised as the LPI IST is
> +   stored directly to guest memory.
> +
> +b) Save the IRS MMIO register state in the following order by issuing
> +   KVM_GET_DEVICE_ATTR on KVM_DEV_ARM_VGIC_GRP_IRS_REGS:
> +
> +     1. Save IRS_IDR0-2 and IRS_IDR5-7 registers.
> +     2. Save IRS_IST_CFGR.
> +     3. Save IRS_IST_BASER.
> +     4. Save the remaining global IRS MMIO registers.
> +     5. For each PE:
> +        - write IRS_PE_SELR
> +        - save IRS_PE_CR0
> +     6. For each SPI:
> +        - write IRS_SPI_SELR
> +        - save IRS_SPI_CFGR
> +
> +IRS Restore Sequence:
> +---------------------
> +
> +The following ordering must be followed when restoring the virtual GICv5 and
> +IRS:
> +
> +a) restore all guest memory and create vcpus
> +b) provide the IRS base address by issuing KVM_SET_DEVICE_ATTR on
> +   KVM_DEV_ARM_VGIC_GRP_ADDR
> +c) initialise the GIC - this sets up the default state and creates the SPI
> +   IST - by issuing KVM_SET_DEVICE_ATTR on KVM_DEV_ARM_VGIC_GRP_CTRL with
> +   KVM_DEV_ARM_VGIC_CTRL_INIT

This isn't going to work for QEMU, if I understand it correctly.
QEMU always creates the whole VM first, including creating the
VCPUs and GIC, telling KVM what its base address is, initializing it,
etc, before it starts an inbound migration. So the memory read
is going to come in after step (c), not right at the start.

> +d) restore the IRS MMIO register state in the following order by issuing
> +   KVM_SET_DEVICE_ATTR on KVM_DEV_ARM_VGIC_GRP_IRS_REGS:
> +
> +     1. Restore IRS_IDR0-2 and IRS_IDR5-7 registers.
> +     2. Restore IRS_IST_CFGR.
> +     3. Restore IRS_IST_BASER - this triggers KVM to create the LPI IST.
> +
> +e) restore the ISTs by issuing KVM_SET_DEVICE_ATTR on
> +   KVM_DEV_ARM_VGIC_GRP_IST.
> +f) restore the remaining IRS MMIO register state in the following order by
> +   issuing KVM_SET_DEVICE_ATTR on KVM_DEV_ARM_VGIC_GRP_IRS_REGS:
> +
> +     1. Restore the remaining global IRS MMIO registers.
> +     2. For each PE:
> +        - write IRS_PE_SELR
> +        - restore IRS_PE_CR0
> +     3. For each SPI:
> +        - write IRS_SPI_SELR
> +        - restore IRS_SPI_CFGR

More generally, if your API involves this much in the way
of complicated ordering dependencies, it's going to be
very bug prone.  From userspace's perspective, this is
not a very helpful way to design the interface :-)

thanks
-- PMM

