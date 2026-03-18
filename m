Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8971088E45
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 22:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWL0RuLJN0YCYwd7OUvYKgvM4/v9ZFsPnPl8Rwt0VYI=; b=uVWnhaAdTA6QBr3GgkWE153mcU
	gJcbTE7xkJeTGo9ps80+tLaQ7RXk6BJP6vRN/mfRjXhofceqTxVajuNOGO2jWCLOws7F3kUhTAAkN
	9g6Y+svxyNF4PA21o1RQwnnWg9YIHT7LJrhk8PoqM6hwyMu0EYnR/czwKuZsV9E7p7EKaXq9lXDdd
	xNdxtWddFoWAzbW5lMIgGQmNWsi9+zhCG8q189weFMfjKsfGvR/1Mx1TsKsS2kBHlrFLYc3wQYZMT
	fYYFWRew3mJPZWkArzs4NN8EV/m6jWU1DaPsCUQ3YTwsyoTsyok7WnDVsPJtLLeSEk6h165XD4fBX
	LHYV9bvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2yyQ-00000009P9f-09hp;
	Wed, 18 Mar 2026 22:02:42 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2yyN-00000009P9L-3Dmh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 22:02:40 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2b052562254so29635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 15:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773871358; x=1774476158; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWL0RuLJN0YCYwd7OUvYKgvM4/v9ZFsPnPl8Rwt0VYI=;
        b=gekisyMb1hsJ2EpZD1bkeTZUugyiEa6KXBfANvJ+ZBYZ9Z7S0qzwn+K+laY1nztNxT
         TDWj8/BChSqPyZxNP+SUqZEYQci3NTRd9pYaRGrn03HnK/lnMbsgBjARSOa7ucccbC08
         fDTrfX3IL4g4tGaDtWMDy2tKn2DLABrefr8Bghhk5tD45/uEyhRZ7qj7+Oz2DlnBm7Zk
         KL8fIyL+v7Pxz37SSRhuPg7G8qmqF17QJjCAQstJ6p+vfyAxDdBAmWe9xi7JjS+cIAzl
         27j7orKjgyp5OsU0/TX46d+e4FV005JprZ0t/D8Cu6BjczEEEB7chPJ5VIN6Cwvfg+L+
         jDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773871358; x=1774476158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWL0RuLJN0YCYwd7OUvYKgvM4/v9ZFsPnPl8Rwt0VYI=;
        b=dMqRHjiPUB4Rnlg6TM82T9Yi64ujIjpWEbpOfduR8QG0m2xshcTmXeqb+wBMeRfbi2
         fCsOQwtLFityJT3FmzyaEYOl6IXria/rPbsCNYVw2Ds3YMQiH47gIj03HqzEgMODKFP8
         P/eghFDug5AtQvb0xVzC3pO1TgvgxJMJvJTlK4vCkAlZ6i+Fa70flOHFeuk/YCIWyAKB
         1Q4G2I3qJgK1H3mBEHN6HopP9VrNzmHq+inFHmxDlvlezKtrAbmF5qZ0w6lGQ81/vLFS
         siQDecgaShKxKYyzT6sJEbvLTnRRSQWqMNTUAkjLqm1gtd0GdnhECnPtPBPVMGLytdhP
         75pA==
X-Forwarded-Encrypted: i=1; AJvYcCUF4WfgIwXrp6UvEhgd5HAhWoz1QMC1TlzpFZ/b//pU38AO+JoYYVJdMojuQPWsU+/lE15ojljEc2F31xjV3xmz@lists.infradead.org
X-Gm-Message-State: AOJu0YwC1dH965OrrbhyL2AtANs0vE8ZKCyIW3XvUPGKIZwV0uVDYvlE
	8nUsUGx/jsnt7eayRteBdMYCYdkDoFgL9AsoEDt/9+iecbJ70AQS4t6iR1FazLynlg==
X-Gm-Gg: ATEYQzz2OhogXKXpflj2uMJtFpIQB9m1bFLQ6ogXRGiDDn2FnqHTsbaR5KJ8VZ2LMul
	X8aE4x82JM0ojpX7SczzW2hbodE9GecwqnOvBVEl47HajLzn5XRxoFnghfHfLdEqksLjvSltIr9
	KL7vEcDSbowqvo6G4lIeODNq+frJEL+OyETfVKOKVzWw7Vx6QVdhGY0mW5a+FsnQXA7/1Woo7lP
	/9XhWnBX2GQCUI5Aaij29ZDErqKDlmTEVsT2Lq9fm6/IVxZ5p5wM0Iov/4ov9N1+/0+Cq0IiqYt
	1f3OCtSf8AHOg3eLTtOCBZpRsKgdGs10AG47fhP1fhew56X9AUCemlRs+klLjiAnB49Tlg8z+bZ
	WwpYsRXMeqedRT3C35rS8AXWcjtfBILp1ko+sziDmOZxmJHbk5KHnhtwdowdcdNNtLc7H3DPp5m
	0XqZ6UKQxZUku0GpIWjtJk+DHuV1hk7HpKIURlBYPMXFW7WmDId3CwiOz2OZVAOw==
X-Received: by 2002:a17:902:ebc5:b0:2a7:4151:2c74 with SMTP id d9443c01a7336-2b077df2de7mr1074425ad.16.1773871357349;
        Wed, 18 Mar 2026 15:02:37 -0700 (PDT)
Received: from google.com (168.136.83.34.bc.googleusercontent.com. [34.83.136.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc62e4b53sm576347a91.7.2026.03.18.15.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 15:02:36 -0700 (PDT)
Date: Wed, 18 Mar 2026 22:02:32 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	bhelgaas@google.com, jgg@nvidia.com, rafael@kernel.org, lenb@kernel.org, 
	praan@google.com, baolu.lu@linux.intel.com, xueshuai@linux.alibaba.com, 
	kevin.tian@intel.com, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, 
	vsethi@nvidia.com
Subject: Re: [PATCH v2 4/7] iommu/arm-smmu-v3: Mark ATC invalidate timeouts
 via lockless bitmap
Message-ID: <absfAT4jgL2f3UfR@google.com>
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <0c5525367cc67ccc84a675544d1d9f8462704065.1773774441.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <0c5525367cc67ccc84a675544d1d9f8462704065.1773774441.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_150239_831626_054625F1 
X-CRM114-Status: GOOD (  19.41  )
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

Hi Nicolin,

On Tue, Mar 17, 2026 at 12:15:37PM -0700, Nicolin Chen wrote:
>An ATC invalidation timeout is a fatal error. While the SMMUv3 hardware is
>aware of the timeout via a GERROR interrupt, the driver thread issuing the
>commands lacks a direct mechanism to verify whether its specific batch was
>the cause or not, as polling the CMD_SYNC status doesn't natively return a
>failure code, making it very difficult to coordinate per-device recovery.
>
>Introduce an atc_sync_timeouts bitmap in the cmdq structure to bridge this
>gap. When the ISR detects an ATC timeout, set the bit corresponding to the
>physical CMDQ index of the faulting CMD_SYNC command.
>
>On the issuer side, after polling completes (or times out), test and clear
>its dedicated bit. If set, override any generic timeout, return -ETIMEDOUT
>to trigger device quarantine.
>
>Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
>---
> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 +
> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 20 +++++++++++++++++++-
> 2 files changed, 20 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
>index 36de2b0b2ebe6..3eb12a34b086a 100644
>--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
>+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
>@@ -633,6 +633,7 @@ struct arm_smmu_cmdq {
> 	atomic_long_t			*valid_map;
> 	atomic_t			owner_prod;
> 	atomic_t			lock;
>+	unsigned long			*atc_sync_timeouts;
> 	bool				(*supports_cmd)(struct arm_smmu_cmdq_ent *ent);
> };
>
>diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>index 01030ffd2fe23..9c8972ebc94f9 100644
>--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>@@ -445,7 +445,10 @@ void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
> 		 * at the CMD_SYNC. Attempt to complete other pending commands
> 		 * by repeating the CMD_SYNC, though we might well end up back
> 		 * here since the ATC invalidation may still be pending.
>+		 *
>+		 * Mark the faulty batch in the bitmap for the issuer to match.
> 		 */
>+		set_bit(Q_IDX(&q->llq, cons), cmdq->atc_sync_timeouts);
> 		return;
> 	case CMDQ_ERR_CERROR_ILL_IDX:
> 	default:
>@@ -895,9 +898,19 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>
> 	/* 5. If we are inserting a CMD_SYNC, we must wait for it to complete */
> 	if (sync) {
>+		u32 sync_prod;
>+
> 		llq.prod = queue_inc_prod_n(&llq, n);
>+		sync_prod = llq.prod;
>+
> 		ret = arm_smmu_cmdq_poll_until_sync(smmu, cmdq, &llq);
>-		if (ret) {
>+		if (test_and_clear_bit(Q_IDX(&llq, sync_prod),
>+				       cmdq->atc_sync_timeouts)) {

This will not be set if a software timeout (1 second) occurs. Do you
know if the ATC timeout of Arm sMMUv3 is less than the software timeout
in the driver?

If not maybe we can handle the software timeout here also as the cmdlist
is already known?

Thanks,
Sami
>+			dev_err_ratelimited(smmu->dev,
>+					    "CMD_SYNC for ATC_INV timeout at prod=0x%08x\n",
>+					    sync_prod);
>+			ret = -ETIMEDOUT;
>+		} else if (ret) {
> 			dev_err_ratelimited(smmu->dev,
> 					    "CMD_SYNC timeout at 0x%08x [hwprod 0x%08x, hwcons 0x%08x]\n",
> 					    llq.prod,
>@@ -4458,6 +4471,11 @@ int arm_smmu_cmdq_init(struct arm_smmu_device *smmu,
> 	if (!cmdq->valid_map)
> 		return -ENOMEM;
>
>+	cmdq->atc_sync_timeouts =
>+		devm_bitmap_zalloc(smmu->dev, nents, GFP_KERNEL);
>+	if (!cmdq->atc_sync_timeouts)
>+		return -ENOMEM;
>+
> 	return 0;
> }
>
>-- 
>2.43.0
>
>

