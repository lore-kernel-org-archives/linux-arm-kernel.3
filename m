Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8917CFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 20:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utFZGAmkY5HSapsYpTO/OWvfTIFdh3s3Nz41thxW7Qs=; b=0IVG+Xo8JKxrJLG13MfPqTnLbp
	IUqI1oW2CR/16ez6bg5c4ZphI5eXbJoDU5n7idJzAOGfnTbKY6l+Pjfkq24+p6RVlsviiaj3lN1id
	gJnrsE6rdk70lb45Y8KL7yMXtB0ITtFHLfsapLiKhmHXEmI3+9RAlfzaHov/hkppfUa+7vga7D8xo
	fgzmEYrpDaJ6kAhstErIHrUokI37vcRxZtNOT3NnGWcSfv698HBxm3mkIjKrQsYCQRfIo48QiKWBE
	C3iKJYkboLsApNOzUdlvKzCn9xIGWoFzsnkgYmvi459QP0rhxQAwh5TYowKyu9ai+iFYUsGch6anM
	JLfcXpeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJdSA-0000000BgB4-0oAe;
	Sun, 03 May 2026 20:30:14 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJdS7-0000000BgAP-34fH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 20:30:13 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-79885f4a8ffso32778007b3.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 13:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777840210; x=1778445010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utFZGAmkY5HSapsYpTO/OWvfTIFdh3s3Nz41thxW7Qs=;
        b=TdQDQI8AEG8mpKdkyHidn4yfUK2xgys3IfZdyBVDU0yeh3UOfDd5HoWBk9KxiHwXw4
         OYzrKykL5AXNE7+Hl7s9kNYDI622CKVT+0zFgl7MkAqS1OHXlbNI+4/RmCC1Pr4Oy7EV
         t8ohH2r7Sj4PFD/IWtTeSb/HsVqQwA1EPbDwfa/+cUlRZKz5fJinwdVqwxye16q7Nfa2
         M2xt6BInPWDdHV+sHVoZtBvHQ1FccBJgzyBujnusRjxswgZqVzfx1sOvgTOGcGTQhNJi
         100kBOTYIi1/AaJTEtrx+cTd6H7rRHEJWpwHFmmJab3K/b0ddAbi9ay7dSYVThe4iZ1Z
         NJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777840210; x=1778445010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=utFZGAmkY5HSapsYpTO/OWvfTIFdh3s3Nz41thxW7Qs=;
        b=YZUJ1Q7xrOcmA76bpln3lRQKSrEC9S2akkZt7OwWOoOyPD48ZmLBkXXqsNr6KVQbbg
         fmy8EG5bPCAbDKgKtK7komUQ/h+YftYdV4V1pjybeneLbL0Pu9WFZXsXYHIyT96anV95
         N7Cwu35lZPW9j1wjDgML9+H796HgO5WXvtbruwOfss5VepyBDetoQ/l0XhA4QbiuYF3S
         u/fjrf2P27FBhdRystF0OfQzguSGFOGsUcURsf6vTfwaCAkkPNLKRX1JVC3z9yBJFCDI
         5tvmOyc46c73bMVhzrZnbZwzVU1d2rn7p/egrhTb0R0c1AwJFph8M+ntRiIKk4w1PkPF
         vhWA==
X-Forwarded-Encrypted: i=1; AFNElJ/3VKOXV4d0FyIB3n0I2foaa8+0Nac5j2C36H1XT4SIYGk7TyAdvM9tV543/bzEGhotB1GV85CfN4CRoYf+k37V@lists.infradead.org
X-Gm-Message-State: AOJu0YzQuJtsK1BjJH8t9U6bhGaNme3rOJudK4myQLqcvqC1DfMyMMF4
	tpU5MlJrONm2v4E33U4gM5Er8PWhvkMQAedC7wkf0pS49oKJhSJAzIUp
X-Gm-Gg: AeBDietC0gHwBUyM0ZKdVXiBiQ0C2hcKIph7nMiTtvySkReRCa1Uc2nhV06GKV4LjB+
	rKK6dqOxrTFAhdIg4VTacwxs+gAaZ+Mloh/L7apipBlVjefWV6WfGRAwLAPsWkb/anaBi1NkgOL
	4SXc9TnHqj40ZsvTNrwt4dTB+A8fUJeHRoojg09FYxIvVlPFtFZG/mxdavdCOhLM6xT12z37fKC
	v5XD9CXqr4xv0n+QKEvSR3Gkwac3yE2Y9QBIVeUqX9GQC7VYISlOLPMmzJaRIO7xN+0lazR9qm/
	52RoO7poH5mwqNacTzWTc/gEV79dE5T+CUpSzra+WksXOjLCyJdalz4tI98+0HVmgksz6uNNO89
	8ADnOGfYBAJy4CwNvD46GbyvYXQnStlVBxOnIAu+xG3mybHLD8vUuDHGMbj/GHVqVSlAFjeu2Zq
	i/R0jImLStcuH5Bdxp1y7ycJk0CM8HgIG5CqKXkatWaxR40Nygxxla+Rms20n6C2YD95NtxQxcq
	9b37jVUwA==
X-Received: by 2002:a05:690c:c4f6:b0:79a:40fb:9346 with SMTP id 00721157ae682-7bd76fabc9emr76374857b3.20.1777840209910;
        Sun, 03 May 2026 13:30:09 -0700 (PDT)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66525651sm40140327b3.3.2026.05.03.13.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 13:30:09 -0700 (PDT)
From: Steev Klimaszewski <threeway@gmail.com>
To: krishna.chundru@oss.qualcomm.com
Cc: bhelgaas@google.com,
	bjorn.andersson@oss.qualcomm.com,
	jingoohan1@gmail.com,
	jonathanh@nvidia.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	will@kernel.org
Subject: Re: PCI: qcom: Add D3cold support
Date: Sun,  3 May 2026 15:30:06 -0500
Message-ID: <20260503203008.287559-1-threeway@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
References: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_133011_801958_8DBB18E0 
X-CRM114-Status: GOOD (  22.48  )
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

Hi Krishna,

> This series adds support for putting Qualcomm PCIe host bridges into D3cold
> when downstream conditions allow it, and introduces a small common helper
> to determine D3cold eligibility based on endpoint state.

> On Qualcomm platforms, PCIe host controllers are currently kept powered
> even when there are no active endpoints (i.e. all endpoints are already in
> PCI_D3hot). This prevents the SoC from entering deeper low‑power states
> such as CXPC.

> While PCIe D3cold support exists in the PCI core, host controller drivers
> lack a common mechanism to determine whether it is safe to power off the
> host bridge without breaking active devices or wakeup functionality.
> As a result, controllers either avoid entering D3cold or depend on rough,
> driver‑specific workarounds.

> This series addresses that gap.

> 1. Introduces pci_host_common_can_enter_d3cold(), a helper that determines
>    whether a host bridge may enter D3cold based on downstream PCIe endpoint
>    state. The helper permits D3cold only when all *active* endpoints are
>    already in PCI_D3hot, and any wakeup‑enabled endpoint supports PME
>    from D3cold.

> 2. Updates the Designware PCIe host driver to use this helper in the
>    suspend_noirq() path, replacing the existing heuristic that blocked
>    D3cold whenever L1 ASPM was enabled.

> 3. Enables D3cold support for Qualcomm PCIe controllers by wiring them into
>    the DesignWare common suspend/resume flow and explicitly powering down
>    controller resources when all endpoints are in D3hot.

> The immediate outcome of this series is that Qualcomm PCIe host bridges can
> enter D3cold when all endpoints are in D3hot.

> This is a necessary but not sufficient step toward unblocking CXPC. With
> this series applied, CXPC can be achieved on systems with no attached NVMe
> devices. Support for NVMe‑attached systems requires additional changes
> in NVMe driver, which are being worked on separately.

> Tested on:
>   - Qualcomm Lemans EVK, Monaco & sc7280 platforms.

> Validation steps:
>   - Boot without NVMe attach:
>       * PCIe host enters D3cold during suspend
>       * SoC is able to reach CXPC provided other drivers also remove
> 	their votes as part of suspend.

I have been testing this patchset with Mani's patchset that is supposed to be
related to NVMe on the Thinkpad X13s found at:

https://lore.kernel.org/all/20260414-l1ss-fix-v1-0-adbb4555b5ab@oss.qualcomm.com/

v4 of this patchset *boots* along with Mani's patchset, however, v5 does not,
and unfortunately, the machine does not seem to get to a point where I can even
get logs from it.  Do you know what I might be missing?  I have *not* attempted
to remove the nvme drive and boot off USB to test it.

-- steev

