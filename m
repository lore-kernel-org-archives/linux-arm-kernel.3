Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A126C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 11:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n762/MxYtv1d3KOPSEF5oTaF+noAfHsJGw6J2wXrY+s=; b=QTyyKaLo9ZSoBzGShYxXGwM41t
	Ap+AXNierlrXcpyJHEAVhWVKsdlSue6gGVq+i/Pr9lnRvs/rl89xLD+n1BrPdz67CV12PeewdxYix
	kS0yVYahCTaYhYaAiaV/0rgnCc9xcxcgr1JWWe1py7tYG6gfub5DPj99ISXlTJEYirHQz2pE9H9s7
	rEdNaNdU7LsgkSrS5wwdZpTfvCTFwNch4Q/1voXulLrOEwGbghRJaitkkIeaxG0lklOtFmynchze1
	qHLQkQibw5NPzAI0oDNTQ8DPD7yvYBkFEjdc/fyrOGKistNrM2VpKoypOHsCvGDLwa/uoR8NVB7Ww
	Li0wSEhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqZr-0000000GvFO-05Be;
	Mon, 03 Aug 2026 11:11:27 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqZo-0000000GvEw-2YD7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 11:11:25 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ccdf36f63dso128885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 04:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785755483; x=1786360283; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n762/MxYtv1d3KOPSEF5oTaF+noAfHsJGw6J2wXrY+s=;
        b=mGP1u7vy1HsY3uDL3JJdbINQyqHMzyhbPzmrYdTEzcHNlTl49f38zpnLPPLX75Hjc4
         322Hie7Qx+Nsk7WVW5bp7mVazMo07uWb58cqtpNHcQhy4xU99zYsq26sgdqiUvkYqhFs
         bXwljBh8UBc8IoWH5gYFsOCsrCrTtuF3fZih+vLgRcizZc9HXA9fyuKiyF5InyMH2u8Y
         teTwnH6jXu8VUijf4geqTef9ca0P3NVHOZ+EpnAivrJ/MUB/WikCtRh2GjknnwOfCQqs
         NyQ0rxYS67sf0kdC5fZtSJmjiujcopMLyCAuyrCDBqeW+YNB0miiTEK5OwwLGIwBxvnf
         kOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785755483; x=1786360283;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n762/MxYtv1d3KOPSEF5oTaF+noAfHsJGw6J2wXrY+s=;
        b=PvrgtAPVh0ibkOQQCzrO62/umDm/PCZpMrJageLMBDG2dfBx7mI3eWeJp5T+73Uq3/
         F1MGnmkH6R2DNB6Tki6zd5PshKw8QupTKva1GEglYaJd+5dUE6CLEz5gYJG6XoC+r14A
         9dhfNOZ0dF6/cH9QUkU4f/3k6klkooO6mByXdLND8tLY5EwCu3+niuzsFAC9DcTlhy5E
         pIgMKTmNiA8LxUiYTq2qM9rVWkee17C2HSO5jbDTBSEH3hOVrExUUowv5N41H33piGP1
         R0lCe4dXrooO1+a2+j/Z1vVV0W1VYis+Mn0rdneZhHsxW7qKXgZeWOaQ2Y4gh4hla743
         bmEg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0dLbjb5EkI+TeiQxJW8gNNYONCj9dg8PBwfdlcn2Dk4btRfZpNXDFxuLXm4LCvQNWfblPxePVR9QZ4KhRg0r3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsrf/s8Q7lFyJx6+wiB2KNo4XLibidYFVy8527hu5dB6KTNIP/
	bKUcuHRU4mORnxrrSHIxOKyqLZrFsE8XvaHrbdpnE2xbP4/Z6lvjKJrdYi5ZZV+gzQ==
X-Gm-Gg: AR+sD12UeKMx6ZdBpY/vEMquvkRitBPeGgbP1vG7JLAWWa6UM/glObk3rng2waOtOhU
	iQBB4RhN+qznH+IjUp4yoAAaljtsRnmAnOeP1dg2JEkCp3OOvFPMHDQQI8Kif57TKx7PqDV2AKG
	FaAQWLzRGjyKYrno2O95cnevVz7da7yklYP/Nk9+tjO0J+OXjA+3w00PVnFcBsKbMiuUHjSoPZ5
	x4pfL6AnZc9QB1IXDeSN86m3QHg4BwdErQBmuB3+OdNpfij2K4B/JQSX0caknhiy9bC3XN99yOC
	6hCQbB1YRG9AKEw7MJn46J1kL1UQkdFETvG2GWqpoL+8EHYLfdtSq/LbwiJ3JvwcvcWDMaQmHtx
	vc8qdJeRpuFmr+JVMx1ddFhYgzF5egdjLvgsb8M2J3LkHsP6PP3wEywdLuizVHsmQAuy/WTuMBC
	Zmi3zieAkuRC1Tbzbj06rGbPDMJ3U7hSCNsoUMW6SOUNJMbquqqIHjZSIxhzsDJelP8KeMG+nxX
	/0add1B0r0WlI3ftIHKdEI=
X-Received: by 2002:a17:902:ce0a:b0:2ca:4bb4:4bd with SMTP id d9443c01a7336-2d056f86736mr14315255ad.5.1785755481934;
        Mon, 03 Aug 2026 04:11:21 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30a43a6sm3840095a91.12.2026.08.03.04.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:11:20 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:11:14 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Subject: Re: [PATCH v3] iommu/arm-smmu: Use pm_runtime in fault handlers
Message-ID: <anB3Ukk7JM42Wgpp@google.com>
References: <20260630-smmu-rpm-v3-1-f69874a580fa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630-smmu-rpm-v3-1-f69874a580fa@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_041124_679290_F7369447 
X-CRM114-Status: GOOD (  21.82  )
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

On Tue, Jun 30, 2026 at 02:32:46PM +0530, Prakash Gupta wrote:

Hi Prakash,

> Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the driver")
> enabled pm_runtime for the arm-smmu device. On systems where the SMMU
> sits in a power domain, all register accesses must be done while the
> device is runtime active to avoid unclocked register reads and
> potential NoC errors.
> 
> So far, this has not been an issue for most SMMU clients because
> stall-on-fault is enabled by default. While a translation fault is
> being handled, the SMMU stalls further translations for that context
> bank, so the fault handler would not race with a powered-down SMMU.
> 
> Adreno SMMU now disables stall-on-fault in the presence of fault
> storms to avoid saturating SMMU resources and hanging the GMU. With
> stall-on-fault disabled, the SMMU can generate faults while its power
> domain may no longer be enabled, which makes unclocked accesses to
> fault-status registers in the SMMU fault handlers possible.
> 
> Guard the context and global fault handlers with
> arm_smmu_rpm_get_if_active() and arm_smmu_rpm_put() so that all SMMU
> fault register accesses are done with the SMMU powered. If the SMMU is
> not runtime active, the fault can be safely ignored as
> arm_smmu_device_reset() clears fault registers on resume.
> 
> Additionally, disable fault reporting in arm_smmu_runtime_suspend()
> before powering down. pm_runtime_get_if_active() returns 0 during
> RPM_SUSPENDING, so without this, level-triggered fault interrupts would
> cause an interrupt storm while the device is being suspended.
> arm_smmu_device_reset() re-enables fault reporting on resume.
> 
> Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault after a page fault")
> Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> ---
> Changes in v3:
> - Add arm_smmu_rpm_get_if_active() wrapper that returns 1 when pm_runtime
>   is disabled, ensuring fault handlers work on non-pm_runtime systems
> - Disable fault reporting in arm_smmu_runtime_suspend() before powering
>   down to prevent interrupt storms during RPM_SUSPENDING state
> - Use pm_runtime_put_autosuspend() in arm_smmu_rpm_put() instead of
>   private __pm_runtime_put_autosuspend()
> - Link to v2: https://patch.msgid.link/20260313-smmu-rpm-v2-1-8c2236b402b0@oss.qualcomm.com
> 
> Changes in v2:
> - Switched from arm_smmu_rpm_get()/arm_smmu_rpm_put() wrappers to
>   pm_runtime_get_if_active()/pm_runtime_put_autosuspend() APIs
> - Added support for smmu->impl->global_fault callback in global fault handler
> - Remove threaded irq context fault restriction to allow modifying stall
>   mode for adreno smmu
> - Link to v1: https://patch.msgid.link/20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 92 +++++++++++++++++++++++++----------
>  1 file changed, 67 insertions(+), 25 deletions(-)
> 

[...]

This version looks fine to me, 
Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

