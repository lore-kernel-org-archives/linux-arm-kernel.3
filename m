Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10818CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 17:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESUcyV5xX+vb21rsW2egvTcS59htvpVkM14wkZr1uQg=; b=OIxSDX8ek3xraLvNQUKNWs/MAR
	EG/V9W0RlGxYNJpexhl2xxL3Nev5gdkN0eNUp2vYlhc9yBtiMvol/z/yOacBmMio/g4DhYGRYghgG
	PBzTPs1OLOoyrxSPLga7CgMIHz+q8fy03q/v4YZ8C57uDP97gq64egSwsN83q0IgwlLzQOASUTPnk
	cky6IM/UeMjXgpARb9DtUnaXc6QGVJkBcW8ZE0eTfL2grqWGF8klTbEfO3n+V3+08USVCq8y4rwzN
	QuIxQrTaAuRsdycIU15dCLtF9ri3SlcVG/Bl91ddbmHsBLmLn9kdJ551tO+iUc5Jj4K8K/fL7z9z8
	tszfWfgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeGJ-000000064Kr-0Y3f;
	Thu, 28 May 2026 17:11:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSeGH-000000064KQ-03UW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 17:11:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46A3A4617;
	Thu, 28 May 2026 10:11:06 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE2213F632;
	Thu, 28 May 2026 10:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779988271; bh=n4tNgwyatQTQbGW3S3TfLyFi3VbFJIQEFLRlL5eOTs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwW14eWzh64FMcKAN7Zcl33EPwg88MkcPsfGUleJH935xNACX1Jt4r6KKr4FrYh7Q
	 nIbaDIIRw1khb+iL5/lLvAMA4+GkHiVpHc5wmNJk+ZzxXLclFYnHZPG+b0+M/hhFBa
	 okv3UQ9AmmrlgWuJEAN7vNWeyGcimtShxMeQDM5w=
Date: Thu, 28 May 2026 18:11:08 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
	tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 3/4] coresight: cti: add Qualcomm extended CTI
 identification and quirks
Message-ID: <20260528171108.GI101133@e132581.arm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-3-d21f4f92c51e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-extended_cti-v9-3-d21f4f92c51e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_101113_098402_F4C6875F 
X-CRM114-Status: GOOD (  14.89  )
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

On Thu, May 21, 2026 at 08:16:29PM +0800, Yingchao Deng wrote:

[...]

> Qualcomm implements an extended variant of the ARM CoreSight CTI with a
> different register layout and vendor-specific behavior. While the
> programming model remains largely compatible, the register offsets differ
> from the standard ARM CTI and require explicit handling.

I cannot apply this patch successfuly. Please rebase on the latest
coresight-next branch.

> @@ -726,6 +734,22 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>  
>  	raw_spin_lock_init(&drvdata->spinlock);
>  
> +	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
> +	if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
> +		drvdata->is_qcom_cti = true;
> +		/*
> +		 * QCOM CTI does not implement Claimtag functionality as
> +		 * per CoreSight specification, but its CLAIMSET register
> +		 * is incorrectly initialized to 0xF. This can mislead
> +		 * tools or drivers into thinking the component is claimed.
> +		 *
> +		 * Reset CLAIMSET to 0 to reflect that no claims are active.
> +		 */
> +		CS_UNLOCK(drvdata->base);
> +		writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
> +		CS_LOCK(drvdata->base);

Sorry I missed this piece before.

Can you move this quirk into firmware? I don't think the CTI driver
should clear the external claim bit as this totally break the protocol
defined in PSCI. A clean way would clear the bits in firmware and then
CTI driver can use the CLAIM registers.

Or, another option is to create several helpers to bypass claim
operations for Qcom CTI:

  static void cti_clear_self_claim_tag(cti_drvdata *drvdata,
                                      struct csdev_access *csa)
  {
      if (drvdata->is_qcom_cti)
          return;

      coresight_clear_self_claim_tag(csa);
  }

  static int cti_claim_device(cti_drvdata *drvdata)
  {
      if (drvdata->is_qcom_cti)
          return 0;

      return coresight_claim_device(drvdata->csdev);
  }

  static void cti_unclaim_device_unlocked(cti_drvdata *drvdata)
  {
      if (drvdata->is_qcom_cti)
          return;

      return coresight_disclaim_device_unlocked(drvdata->csdev);
  }

Otherwise, this patch is fine for me.

Thanks,
Leo

