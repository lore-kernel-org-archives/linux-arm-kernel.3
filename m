Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A172C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 18:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvCuCj+1hsq0hf2yMIZAP5CM6LznakfZh7U1V3Cg3gU=; b=3DTwVsCTwuqyNjXiBViREwDpCJ
	BvEptv8nwzOoyXSC0bkBKTaZtn7222SaHqQE4yFnXSnigFXfmh5aOsVxcNEMig5bikcfg3b73Jz8H
	tgVu53d9GffBI3lZKfXUWp+5Y0b2Kf4W1sEIvXRSw3Ocx/nSOxTdKaUAUgFaV0s5lZdyhBgRZghwJ
	kURlzA1swAhWFFLcH7aSph58MN47511lhm+f/tuiSwjjpKBnHT3ko1VPEcMFNXbK0SwERGN4t888u
	hRhLBGSLwNdS96fgNLM+WNn8A3D0QyfIbO6RmXc7hmN4RCl786Dc0aIoJW6Dt7K838f8jI0ODCH6U
	dvmqSDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Mbl-0000000CZon-3sBv;
	Wed, 09 Sep 2026 18:01:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Mbk-0000000CZoH-0f6A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 18:01:17 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7LVQ2562038
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 18:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvCuCj+1hsq0hf2yMIZAP5CM6LznakfZh7U1V3Cg3gU=; b=kVXwzG0rArK5FzXu
	IsAToYikSvB46NCL+MJV9WEUbY+uXtNRkuT1IyYz45OB3NY0IzgjLBAiZhr4UmBw
	FiEwVh+Za3t+/7falVzFeotH5bAiNlJfTBKjOVC6pW3knTU8R9E9jEWefKIzx/SK
	8UYSDgwUx7gSi2RiE0D3n+ZmwqGnPvk8C2pCw0k9GbgCBHYiUz+AugH4ovuOup5t
	uHKzskCJjrIaMO/oERxlm4qPOCDnta23QmGkbl92DRkq2L4Q3rB3QQu2vkG9YSgN
	1cYZjxlJWL8Z5gNcB5kioAFg1JW2xFndXlUX5rw39v3PEQRAo25OItMhmNm19uQf
	/QJ3bQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj28x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 18:01:14 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46524220c5aso7623560fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 11:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976874; x=1789581674; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BvCuCj+1hsq0hf2yMIZAP5CM6LznakfZh7U1V3Cg3gU=;
        b=h+NXBJmZjsqN78QBDfgDmx2xHOt59WIEMZ09UetLjdXiNfzEeB863X16nSj5iuHxbL
         8rbdcV6OHWHStiDDfyV0u71tN774ctu9VVejQzdexn52FmoDMBATvxpkuDZ/E0/skFO6
         pmLAysNxE0gCuzyMKI+vA68D2s3nxNkg/FJvZmpveLduHx9paked7wV825HkHXlF1J1y
         q++4UaQwEHafHlTzctnZtDajzBLuC7ediHgE074DF9hhmvcEFHYVCQbTttAkZ1tYR6M4
         yZIe2pj9o7O4i5LEZW3wA3P6ZUnyY1de427hExkagTxmndIYvmECUNlAc2Cj0onR3cDZ
         F63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976874; x=1789581674;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BvCuCj+1hsq0hf2yMIZAP5CM6LznakfZh7U1V3Cg3gU=;
        b=KjXcDV+Gk61cEgjUvx4iW1kmQJEdAqVFKKAIGyWyIOO0Y0ORHiuBISyipsSW1ZpMsA
         yCMVHOMCmRdRt6UW4Sn5l/SBrmSfXLOoDxIf+26OQBRbGtTTFvCYlcOiLE2FaMvMDNEa
         frTavivw2zUx3bPdxHeL/jPOzbcOJHzcuzrj+NBPGLHqrLQnp3fp7B7FuQtdCndJHCu5
         rbw3FFwDEBurybAFWbSH5wYvHARolTrKq/tGowXqPYRdNgmf97HpM0H08HX9wrIyh5iS
         nL18eoKNh44hyTatJqSVijAAjq1oMwAXLzVbwcj2AxOIVv2eTNPekyLQEcdsYSpICMaN
         Cv5Q==
X-Forwarded-Encrypted: i=1; AKwUvBy7fBmplXsL1bqbeVoA659HNkQ1PfMrs2VuK8UgwUW4m52L8rQa6J42ItDXU7MLQdZ/wpoCLKjXQADtzhkeZTMW@lists.infradead.org
X-Gm-Message-State: AFuF++lKXlT+mUJl4SCWO86cu+2woGWBB2IPOA4XSkc/TE8iKywgfyZX
	5kO1j80xiEVcZF3Dx2EdAcHUnkmdHzQzLcrNGrHjLU52+5CAXE8n256lGzp4QENzSjAnn4h9t4v
	a7jy2YYYIFi8yIhUEsFHOJUtqi06nf2ffvjV8QxLy4YVLjQDzYe8rcvviLcRnFuMid57PwQJ/cm
	45gQ==
X-Gm-Gg: AYBFou3A2OdPRgfaK4ib0UjtI5r8k/zcY+lSFo+RzOHpGVUMyWEyZ1MT8MWH7wyw5pk
	6jTz82N2jGiMNNYEuxQGjtjZ/z8gSSWG182eQavx6/gBmAddmEOk3ycLl/sXxnZrLI0vr+h/j9v
	TJlwhpdAsIgCpEBdcNNPMCeHs2Fb5bhfiYxzjEy4PS1QdA5kT0XZGmwc4oXv+Oo4g96I9krjDD5
	O8jRYAr2oYPGR9X+CVepBpVm+QFlIWGGqcyZg25BlX4e032kol8nvndqXXb/jEpJkiWAJZNqLgy
	+ZjKT5hIoUuFyZcaKZX+VcYOKXx1GRlAsQ10w8M4OZZ9RIUgKsDL+DcdMiKe0smdtotLh6fVhqK
	Ul8kzC6zTTHBlQr0MKsgIO8gVsYg=
X-Received: by 2002:a05:6820:4df3:b0:6be:46f4:2908 with SMTP id 006d021491bc7-6be46f43c91mr2959539eaf.55.1788976874256;
        Wed, 09 Sep 2026 11:01:14 -0700 (PDT)
X-Received: by 2002:a05:6820:4df3:b0:6be:46f4:2908 with SMTP id 006d021491bc7-6be46f43c91mr2959494eaf.55.1788976873782;
        Wed, 09 Sep 2026 11:01:13 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1435c2ae6b5sm280583c88.1.2026.09.09.11.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:01:12 -0700 (PDT)
Date: Wed, 9 Sep 2026 10:59:54 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, bhelgaas@google.com, praan@google.com,
        kevin.tian@intel.com, kees@kernel.org, smostafa@google.com,
        baolu.lu@linux.intel.com, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, skaestle@nvidia.com, mmarrid@nvidia.com,
        skolothumtho@nvidia.com, bbiber@nvidia.com, harsha.v@oss.qualcomm.com
Subject: Re: [PATCH v3 08/13] iommu/arm-smmu-v3: Disable PRI when no IRQ
 handler is registered
Message-ID: <20260909105954.00002181@oss.qualcomm.com>
In-Reply-To: <20260904141525.GT4157646@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
	<0b5282c7e850f1a1c650e43670899b4ef5335efd.1788222486.git.nicolinc@nvidia.com>
	<178846311318.1308030.4956293524348641228.b4-review@b4>
	<20260904141525.GT4157646@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX/CjYqB2qhHHF
 IcUX8w4dfMCKkKlCCT3DJQxCH75wp527oW2cOQbiEMO3lx54aORpnwJ7tROLFkSLXVcTzaC2yRw
 Ia47KRo+AqAgyQ2jnb1o2Q6rDAPn3EQ=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa19eea cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Ikd4Dj_1AAAA:8 a=nKlBY_KgISjqlfJ5XcQA:9 a=CjuIK1q_8ugA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-ORIG-GUID: ot-32GbbaO6KYdRuAxrawc34O3tFQ2Q-
X-Proofpoint-GUID: ot-32GbbaO6KYdRuAxrawc34O3tFQ2Q-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfXxo8B0Nyu+DFH
 inuhNK7PQsaO8lPRRPnRllR7PVR+d4usJelZh/9NToaerksUV/C+YSKuusnlR6Q+fDMvzJYLUag
 r+QUJdj/YCZGmXITBgiH9SMh4Vg9+9b5gjW5ooJoICPemBJ11LjxDe95qp4DwV8Bqte887ibGV+
 5h9hroScGUPLAwWa22F68QxcKeiBafdh/CLPZjHuxuZOj46XqLF14Y6oOPnTzD/U28TECezWS7Y
 7WmgcTdckvwXJelaoYyS8AmnZ3CTTHUszZwFEaXADfVEczqZq0stzKzVhtQyAOLUO7xl+OOnO9y
 YE044rlObII1E0eE47dy9BpbrXuOLaVSAFlwKn9NBvNwY4MZ4Na6ePnD+sxzaFqiO9u3Vi1WqU3
 ffqc2EQpzmzst8D+M5iFS+SlDKI9KQxnusR9wFgpUN7I1WeMz3POUGBWMwBGqHyfktjAloohK6t
 nj+NhIb1+t+8ItPWYGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_110116_318833_D623DCC8 
X-CRM114-Status: GOOD (  28.03  )
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

On Fri, 4 Sep 2026 11:15:25 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Thu, Sep 03, 2026 at 12:18:33PM -0700, Jonathan Cameron wrote:
> > > arm_smmu_setup_irqs() has three failure paths that leave the priq without
> > > a handler: a missing priq IRQ line, devm_request_threaded_irq() failure on
> > > the priq IRQ, and devm_request_threaded_irq() failure on the combined IRQ.
> > > Each path warned but kept ARM_SMMU_FEAT_PRI set in smmu->features.
> > > 
> > > With FEAT_PRI still set, arm_smmu_setup_irqs() enables IRQ_CTRL_PRIQ_IRQEN
> > > against a handler that does not exist, and a later change would then have
> > > arm_smmu_probe_device() call pci_enable_pri() on PCIe endpoints, allowing
> > > them to issue PRI Page Requests that pile up in the priq with no drainer.
> > > Separately, arm_smmu_device_reset() has already enabled CR0_PRIQEN before
> > > it invoked arm_smmu_setup_irqs(), so the hardware queue would stay enabled
> > > regardless of what setup_irqs decides.
> > > 
> > > Clear ARM_SMMU_FEAT_PRI in all three failure paths, so that subsequent code
> > > treats PRI as unavailable. And disable CR0_PRIQEN after the setup function
> > > returns.
> > > 
> > > A kdump kernel cannot service page requests: strip FEAT_PRI when detecting
> > > features, so downstream PRI setup is skipped.  
> > 
> > Dumb question - why can't a kdump kernel service page requests?
> > I'm nowhere near familiar enough with that stuff and I suspect I'm not
> > the only one who might be in that state and reading this series.
> > Configuration choice, or a fundamental thing?  
> 
> The initial issue is the streams are left in whatever state the crash
> kernel had them in, so it can be generating a bunch of PRIs with no
> place to put them.
> 
> Though eventually we may find a device where dropping them is not good
> and they need to be NAK'd promptly..
> 
> But I think the real motivation here is to save memory in the kdump
> kernel..

Got it, so design decision rather than fundamental.  Maybe tweak that text
to say 
"A kdump kernel doesn't service page request" ?
> 
> Jason
> 


