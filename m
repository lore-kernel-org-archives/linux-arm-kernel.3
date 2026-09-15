Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DE2C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 23:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lyKoyOjIfv9w+YYrFTayF9TTz7lNx0qSbUIbPxqiGT4=; b=e7k8D6ez7x9QoberqHf43mB2Vd
	ljh03k9uleQAQXk84clw4PDbPEWmREsP9dToebIDa1OAGA14EHWTDFqtPOyj4usYY7CkOMkv9RR0b
	V7AZPJdLaFUXY/OkQ0gTyhadklLjBfJBHFhgSTDY74L8TSmSLes/3WcICI2JdG9mN3kxOu6IkoK4A
	oVvBPQaOBTpoyGTE3Q7yIuv/VdKXKwojsSV55zZlZpv/xAmAjCW9xdmidrW85LclHNlOGH6sxGCrj
	5SVMs7ChJU+FtoYIbgEVSeQJY1dX1sGRNYkZfCiigOR/BB4BwAo33l6hnaO/CEe2aiO1APo/q3CUL
	CEd0DlAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6cSm-000000083i5-2zp0;
	Tue, 15 Sep 2026 23:21:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6cSk-000000083hl-1kxR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 23:21:20 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FM38VN1932207
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 23:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lyKoyOjIfv9w+YYrFTayF9TTz7lNx0qSbUIbPxqiGT4=; b=jVpHuJyz5nF9Pyx9
	Tj708RnGg7QJ+1opQNvo1W8ygwGxR6NC70o3BUHhcVherBpE514SfP+NY5+NPq16
	j2TH2PItWV2fIywzy3mtzfHg0lgKAaUrviCR+aXtDtivg3iBqMua5QrklRE+spVg
	2znFZG+ETjCzNKIu4wtcwYHzGNlkT9Z6FvloXPl37G8gW3rufmyQD6ps4SgC2FCx
	2n2U9z98pkQIsC2Mek1rhQ1m8e4153RORiqLYddRQY+OigO6AqFwi4xjmyChuRCL
	J04NkXLsAVm1dTJy1Lf83wzFU2uSUttWpWfyAaVdOGbIWMnTtlPh1IDJ00MFXoDn
	ESxApQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefp8879-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 23:21:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so6947224a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 16:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789514471; x=1790119271; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lyKoyOjIfv9w+YYrFTayF9TTz7lNx0qSbUIbPxqiGT4=;
        b=PRISAqd3ldZmd0DtvuA6jPON7F2cu8v6CLUPhNhxaaZ9ze9hFXWB1xxpcA/K0WShL8
         KX9OlRXI0bzuzi2yy4ytMmeEXB05xrtzhqB2b3ErXzfR+cUON4Thc04OWs7kQqWNi4Sv
         c9cqtCDJWW1C0ig1GLWrUY5F0pg90tLX5sgjjJOUiXjEMd59rd14kmjWmib8MfHKaJQN
         4/Qdib3i9Tchw720BmHh0nvYfelzjxhkWPQ+9zPNhzpM8BiYtCGpCUSXQgaWYhJ3kKjC
         +vQxVoU+wgoHBgyJE7nFrPLM2mwyn6eBIehTd35H9KbzHO99SYl7KM2klHS0mo7jmFZh
         oqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789514471; x=1790119271;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lyKoyOjIfv9w+YYrFTayF9TTz7lNx0qSbUIbPxqiGT4=;
        b=WWVS5xsp6RWVFsW23kq/KUM302MlpYUa+xxbz7OZSc8uLJ3DYSkVLspqv6u/NPHu/O
         ylJmk4b5NLVjDVTHw3SFsCVLaUIJyHLAxPISYhIVtwNacJVpBb/7jTVKzfhkf2F/sl49
         KvndN3TW8/MFK2Dm496w0pknNK2B/gfQd6/mwXsXLnrfhTE5e8QrKP4Pu9EqErjiHJjg
         q4LXoy19wObC81jCnUZJKrx3EWjaY3di/6rJaHtG7HaywyuiWAhi9BbYawqfXVstXU88
         N8AmtdE041F5KXpjRjbgABnAthU9ykJTDXq0plh+pTzVyU5iHNP5Zpo2aX3RpBHh9b0v
         2ZZg==
X-Forwarded-Encrypted: i=1; AKwUvBybqvXS9IuCm0hx6OvXTLGe9a8mRkAWjep/1aLLKsF3nVRzKhZTP5g3bBXmKQ2iSN9e2X5WXet8Btzr3kFQmAxs@lists.infradead.org
X-Gm-Message-State: AFuF++mCXvWNsQtqXo1TBhxt58HcoOzcC9/k0vMmY1m0WJZk3mnFFLYs
	0R20JKtgVtvGKdpaBA2T3XxE922VAlto+Q1P4OOBiqeoDC198BosFwgC4mUkPpQtAvs5G5NXrmw
	LNJmd8bC/QSKXBqnQXgkJzdDOdV6O2AzYr8v+kMYEZ3rjoCrezHLbOIfmXR7dpMurvmNdgMTOXI
	2haQ==
X-Gm-Gg: AYBFou2590SP8FpSAfC+00qr/7HPghX9NxHG7R7XWBKGbFicautcqtXFUbEjNNB6LB1
	1CNnjYcIu89dR6EPa5t30TiBUBS/d2ljsOhoxLYue0SZZ8NkU9lAAhQr8giiyT+Y1vIsy9bODkF
	ubtf62orpv9BBhJEPZXgFCD5XATMrWVCwctDaMWrO1uAHet0KQFImtzkwOSYb/75uZGWSkFMaaj
	gZtjk8lKXD+4t4Dxvl4Dx3rdeIVOT9TS0ybnFCa3RFa6zbM2NoBuSuOv09p/XQSrl79JfrO7E4a
	cEW6dcN8Q+WCQePkYO7gIWYWPj6taj7pNR8oCTihDJcWi3Miquw7YimMbkKC5IvEMOZOgEkGBFA
	62ydO4g5r2vOKaCxMGxkeoDJQae4=
X-Received: by 2002:a17:90b:560d:b0:39b:3109:10ce with SMTP id 98e67ed59e1d1-39e1e45cbaemr914866a91.16.1789514470764;
        Tue, 15 Sep 2026 16:21:10 -0700 (PDT)
X-Received: by 2002:a17:90b:560d:b0:39b:3109:10ce with SMTP id 98e67ed59e1d1-39e1e45cbaemr914831a91.16.1789514470342;
        Tue, 15 Sep 2026 16:21:10 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d11cb3sm1432321c88.6.2026.09.15.16.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 16:21:10 -0700 (PDT)
Date: Tue, 15 Sep 2026 16:21:06 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
        <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
        <kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
        <baolu.lu@linux.intel.com>, Jean-Philippe Brucker <jpb@kernel.org>,
        "Eric
 Auger" <eric.auger@redhat.com>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <skaestle@nvidia.com>, <mmarrid@nvidia.com>, <skolothumtho@nvidia.com>,
        <bbiber@nvidia.com>, <harsha.v@oss.qualcomm.com>
Subject: Re: [PATCH v5 08/15] iommu/arm-smmu-v3: Disable the queue IRQs
 before disabling the SMMU
Message-ID: <20260915162106.0000145b@oss.qualcomm.com>
In-Reply-To: <0ca69e93a9370e4e172e4335104859648b8755c2.1789446520.git.nicolinc@nvidia.com>
References: <cover.1789446520.git.nicolinc@nvidia.com>
	<0ca69e93a9370e4e172e4335104859648b8755c2.1789446520.git.nicolinc@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfX6WPfIJhYgM88
 4pB9P9/ossTynfiRnCWRqNNFTeaws1CjEx726llIfA3YfAhT7Ha9SHylfj8MFYQSwX4jkSy2cSA
 IrOcY0xeZ2gtJ9a6lX9A8faNaSpnprQ=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aa9d2ec cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=qr_CdHuHKQtOmQRTACQA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: wFR6xG56PpSd_58sYLrDiWLumdM2SxcO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfX4DWpms7/cZN+
 2ZesMAOmldv0bLFaYL9Tfqg+KBvMcCD+sLnrqQS0pe/YDJlRYg5EAWNUuuYStyK76y7V/2CwzcN
 YjJHMjlQ6lDrHc9er3GNTM1j3pOkj1KfQJ/QkVTADHIJOWi9LMzIM4AplUDsZrV7z9EjMAbR2EG
 rmlSq+ld/8DeR3YuIWF3caJ/W3+bODwgqpPQHDT2fOq2cSN9zUeGPodMqbZq+6ixlVwH1AMjOT2
 tH4fC6vnuS9zEO8dX1eXum9+bUrMrPEbK/vl+LKVexe1GhgsOejaq95yCh4b/VDDnWLF18UnvHb
 1WW+eQvgs7NjpFmZo3DZPlhHW3Laaaoyxo/pr4CLlUDg8DL6DFyIzKnJrn1Axb+ug+9JDjIMTuf
 ufKtNRq7bgzmxjmP803Oyo08B+ot+oJu0Ozow2AHyHZfz4Wht1qk8/4PGyANc0jH3o30mQPw1ur
 2TVc7T8yexXBzlxUBcA==
X-Proofpoint-GUID: wFR6xG56PpSd_58sYLrDiWLumdM2SxcO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150341
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_162118_999861_B8E6B63E 
X-CRM114-Status: GOOD (  19.56  )
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

On Tue, 15 Sep 2026 09:38:20 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> The EVTQ, PRIQ and combined IRQ handlers are threaded and issue commands of
> their own, e.g. a CMDQ_OP_PRI_RESP for a page request. Disabling the SMMU
> while one is in flight hands that command to a queue consuming nothing, so
> its poll waits out a full timeout.
> 
> Two paths disable the SMMU while those IRQs are still requested: a failing
> arm_smmu_device_reset() returns to a probe that disables the device itself,
> and arm_smmu_disable_action() covers an unbind or any later probe failure.
> Both can run after arm_smmu_setup_irqs() requested the IRQs.
> 
> Disable those IRQs first in both paths, so that no handler is left running
> once the SMMU goes down. arm_smmu_device_shutdown() needs no change of its
> own here, since it already just calls arm_smmu_disable_action().
> 
> Also clear an IRQ number when its request fails or is skipped for a missing
> ARM_SMMU_FEAT_PRI, keeping disable_irq() to the IRQs that this driver truly
> owns.
> 
> Note that the IOPF queue needs no such care of its own, as devres frees the
> IRQs before running the release action of that queue, which came earlier in
> arm_smmu_init_queues().
> 
> Assisted-by: LLM
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
I'm still not loving the disable_irq() in here just because to me it
feels like it may end up masking stuff we ought to handle more carefully but
I don't mind that much

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>



