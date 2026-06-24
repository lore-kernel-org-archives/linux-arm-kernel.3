Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2D1CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 14:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5vPsYKU56GjNxiaGkkNL7c3r/LVlhBv4KmGsmspM40=; b=blCFN2pCKe7G6BTQcL0c1pPuWe
	/sXFF3yc99iMja9+MGxsecKBDNgMqE4XR3zn8HH2e36YjH8EVNPYUSJq29E1N1U9tQDI27JTd1Bhx
	1NdY8k77mfW5RZETvVdmeY+3e7QAes6kBXjOTSRjrK0kvOcTedGBIgjWqDvo5yxlp5i27UnK6zM4q
	wy5aSP+xAAELuZlBH9uFfzJ7+CgO01JTeq+BobmH4XN6CjkIhARDfAJNoayJRIiCHgiN0GhrCiatq
	xJKcBOgnue+KMy5qbuJJejy2zLAyQ2HzUv5WSqycek0rqC5e7spwOuoPCRTpOA2PKySbuFlYL8JnT
	x0AYBqzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOBm-00000007sby-2wcT;
	Wed, 24 Jun 2026 14:02:50 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOBk-00000007sbJ-297B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 14:02:49 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-693c69b97e7so1980612a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 07:02:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782309766; cv=none;
        d=google.com; s=arc-20240605;
        b=BjqaG4af8iQ7iuKrXY3lIx7M6cwlKR9CMa6r9hOkY/EPTQ59MfUnam+rqchoi9JQqX
         LXQ5srV3MGbjz1JJJ5dbErB6QJFYQtGZt2CKChkRmlZo2ZJi26h87fI1HV+T5Gbx6UnV
         hbjmx+/StL3519BDxicvpmgKxoU8oF6VkaMPZ/ofMQeZMZKjEPX1vs1sji0nOcWV2BiB
         NCP4BT2Ok4hVT8BWCv5SuFJaDhodtjpJ7dONkFwTLOWHImFdzE9DyBPKNLPZipqOIVdx
         BcbagCrKthtPws9WokkbU2llXoLENxUCRQyAntL/vC1WLhkDrDexsnesu9R29nsQI7UF
         bcyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=C5vPsYKU56GjNxiaGkkNL7c3r/LVlhBv4KmGsmspM40=;
        fh=2EYBISqD57rVOSA1S4jHXz0yJtDEW/642EDLXXWX/kw=;
        b=A8Xtl2lFPoKd8jvWZtoSXJKFRcXInkQKqLGcwuY8BfA6BynITK1Q12/T6RlUXRlAYZ
         feabGutRNk9HtGFbgnYD0Dz+6KEgCKXbuH9cHbp4UbQZby8pvzbZpTmUw9AVJe1EC0VT
         oOhK/XNhSPVbItWw7GSxxhhoFPkyv9Ps+lIYZOFXZK0FQl5GiSWE1V4kxpV8z+Xa//qn
         GWGonxLvvM7v99W4xwuT1QntoISoH+ndlviMPnAMtUzfcC8Hkdq2vgHCLAjEzmdZACLt
         RwOp62xpP7w8uUSqzAo+7u7ezkqRqF/zRTGN0+kpFUuLkCVeY6sweNtCTdODBgfnqf0l
         +42g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782309766; x=1782914566; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C5vPsYKU56GjNxiaGkkNL7c3r/LVlhBv4KmGsmspM40=;
        b=wf/WLmcwStKLk7lJjw9zMumSUMmWA73MtEdMQcFHjp+tizKMDVwWafR5mUFHfLBSwB
         2gXmXOTpw/UmT1ctAaf/AOfkF6axUL8LzbLrA2naZcv89hozRl2wADhmCiDIbTfja6HI
         BEnV5cyGdycy240uuPDokiZfCKyBUWWT+6MayphkBO/Ui9MZJg2ibd1CTJUFqhWgRHiW
         Zc5MX9qMgoznAmhMUyRyQWE393+WqcHDo8cDyl66CdYczGn/b6s7PhGQ9Y9i4VDyJcrw
         /QEKBbHFCAlIRCan9mm8eolbW+lZF8n+C3JhYuzOE9OKszJ/gcNyZjaZeI34fYvZlmd3
         j1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309766; x=1782914566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5vPsYKU56GjNxiaGkkNL7c3r/LVlhBv4KmGsmspM40=;
        b=CDLGd10+roXBmRgklBiMptkGk8rLedzeckUIi88YjabXfsu2JjULQuwdCWHlh7Enzr
         j1Naa3o3ZNk4Kc9FhVG7GHVi/QACer/d3DN5657uhCMv/5T5liQMmSwmNywgdJm55EfY
         BUY9uE6sO2aTxNBpCX2xuzst2S03T7RyRZ5RbH19CqQXthI6C+Jt+V09xHR59xYgzxdP
         OI+Xs7fjKUhCa24adtmR2Tdzwc4OYY9d+btrVOZ04EF3gCr0NCB6VJrUvcYwAcOPq2Co
         Op6VNT1cMO5LuhWGfCAVFJiHjGkYo7VrLVT2gTVj8Ldc/tmwrIw5h1LIM74WVeF7N4yy
         MjUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7723bFgReLostkpVvoLpKeI8BSrnLCTw6RjNy+Riq51zsdSQYl2b1yJ6y000E1ZYEe/memq9MPOa2NlO3mLvR@lists.infradead.org
X-Gm-Message-State: AOJu0YzLDKkyTlpcO7fI+g1MJ9s53SmLMrO3ldWliQB8anSXIVUlR9Kk
	Y9iFHa50Id6DxVIAnQxDG4BFjygsB+JYBHgfy3jdALiCsYveeLQzmZk2UHQTarYhpJRNeq5st5x
	hVVUgax8cblpRpQFuo3FmvyBT7v3o5TDacs9faCM8iv+CCAImv8iaKQ0=
X-Gm-Gg: AfdE7cm+5dCnTpffcX96tmTIZ0Q6aHylHVh6jy1oBNxyVNV8LhWaEcyHDgNy0TgD3AA
	joGokON04akf76SDLH4Qi6g3sAk4lNcvsbqvl1IqejSTeCLwiq3SdxbM06ttl0m3kUyV+v5PbCk
	Q38Fz9skgUXZWiFhWZZVK0RgBWC13OnwX0ocp/8tElby0/zUBnykTjc252XZDyKbBy3cV9EXN4j
	5O+9+xdkhTvz0MxNISi+Suu0wIYI8JxDSDxDnf0/07EPKXsB7wSCXI12xLg/Vs7rBehYzYGAVMN
	KsqDY5jl9e7iIuYGQT2lAjJP+8ww+2Q=
X-Received: by 2002:a05:6402:440b:b0:697:e953:d14d with SMTP id
 4fb4d7f45d1cf-697f3aa2104mr2007565a12.17.1782309765856; Wed, 24 Jun 2026
 07:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260619163854.410392-1-tanmay.shah@amd.com> <4a4e518a-61e6-4beb-aaeb-5056fbe2a07a@amd.com>
 <a9baf2c9-d4d9-4152-9188-c33fce2daf15@amd.com> <59d9a4c9-1f12-4de9-a0d6-613d2f5e9852@amd.com>
In-Reply-To: <59d9a4c9-1f12-4de9-a0d6-613d2f5e9852@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 24 Jun 2026 08:02:31 -0600
X-Gm-Features: AVVi8CeQVOpe99Jjc0PPT9NZRQIiG1kyiEoqLQu9TzeJnqoNqUneCuzFYP-6rA4
Message-ID: <CANLsYkyChucfAY1wKvxAt9-tCX=2B5L9=4bbBA6XvnpBnLZD5Q@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: xlnx: refactor start & stop ops
To: Michal Simek <michal.simek@amd.com>
Cc: tanmay.shah@amd.com, andersson@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_070248_591779_8D6BB4E0 
X-CRM114-Status: GOOD (  28.80  )
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

On Wed, 24 Jun 2026 at 00:12, Michal Simek <michal.simek@amd.com> wrote:
>
>
>
> On 6/23/26 00:29, Shah, Tanmay wrote:
> > Hello,
> >
> >
> > On 6/22/2026 7:25 AM, Michal Simek wrote:
> >>
> >>
> >> On 6/19/26 18:38, Tanmay Shah wrote:
> >>> Current _start and _stop ops are implemented using various APIs from the
> >>> platform management firmware driver. Instead provide respective RPU
> >>> start and stop API in the firmware driver and move the logic to interact
> >>> with the PM firmware in the firmware driver. The remoteproc driver
> >>> doesn't
> >>> need to know actual logic, but only the final result i.e. RPU start/stop
> >>> was success or not. This refactor keeps the remoteproc driver simple and
> >>> moves firmware interaction logic to the firmware driver.
> >>>
> >>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>> ---
> >>>    drivers/firmware/xilinx/zynqmp.c        | 93 +++++++++++++++++++++++++
> >>>    drivers/remoteproc/xlnx_r5_remoteproc.c | 68 ++----------------
> >>>    include/linux/firmware/xlnx-zynqmp.h    | 12 ++++
> >>>    3 files changed, 110 insertions(+), 63 deletions(-)
> >>>
> >>> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/
> >>> xilinx/zynqmp.c
> >>> index af838b2dc327..f9a3a95b0638 100644
> >>> --- a/drivers/firmware/xilinx/zynqmp.c
> >>> +++ b/drivers/firmware/xilinx/zynqmp.c
> >>> @@ -1513,6 +1513,99 @@ int zynqmp_pm_request_wake(const u32 node,
> >>>    }
> >>>    EXPORT_SYMBOL_GPL(zynqmp_pm_request_wake);
> >>>    +/**
> >>> + * zynqmp_pm_start_rpu - Boot Real-time Processing Unit (Cortex-R) on
> >>> SoC
> >>> + *
> >>> + * @node: power-domains id of the core
> >>> + * @bootaddr: Boot address of elf
> >>> + *
> >>> + * Return: status, either success or error+reason
> >>> + */
> >>> +int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr)
> >>> +{
> >>> +    enum rpu_boot_mem bootmem;
> >>> +    int ret;
> >>> +
> >>> +    /*
> >>> +     * The exception vector pointers (EVP) refer to the base-address of
> >>> +     * exception vectors (for reset, IRQ, FIQ, etc). The reset-vector
> >>> +     * starts at the base-address and subsequent vectors are on 4-byte
> >>> +     * boundaries.
> >>> +     *
> >>> +     * Exception vectors can start either from 0x0000_0000 (LOVEC) or
> >>> +     * from 0xFFFF_0000 (HIVEC) which is mapped in the OCM (On-Chip
> >>> Memory)
> >>
> >> here
> >>
> >>> +     *
> >>> +     * Usually firmware will put Exception vectors at LOVEC.
> >>> +     *
> >>> +     * It is not recommend that you change the exception vector.
> >>> +     * Changing the EVP to HIVEC will result in increased interrupt
> >>> latency
> >>> +     * and jitter. Also, if the OCM is secured and the Cortex-R5F
> >>> processor
> >>> +     * is non-secured, then the Cortex-R5F processor cannot access the
> >>> +     * HIVEC exception vectors in the OCM.
> >>> +     */
> >>> +    bootmem = (bootaddr >= 0xFFFC0000) ?
> >>
> >> and here you have different values without any explanation why.
> >>
> >
> > The value in the comment is correct, but the check is done for all of
> > OCM address range. This is just refactoring of the interfaces and not
> > the actual logic. There is a separate patch which actually refactors the
> > logic, I will send it later. I would like to keep this as it is because
> > this was originally there, and the intent of the commit is not to modify it.
>
> ok.
>
> Acked-by: Michal Simek <michal.simek@amd.com>
>

Michal - do you prefer that I pick this patch on the remoteproc side?

> Thanks,
> Michal

