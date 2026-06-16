Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F25CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 00:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+I5JPJ28+2C5Ptq2qq3gPPxEl8sJtso7kvE/1GSrC98=; b=zX6bpEjeNhuOG5xMW6RAL2Inhb
	cNen5fGFi29dAwexsPnQQeqK3K+hl9az8rFvSdWW6ulYozjuBus1UYpvR1ZOWud9JbOwZ+SQMUdeu
	z/6yZE7opCNKg6AOgixx9W8gRbz+Fmk7AW/iMX5AMQOjcZEuR5AEQuV23rIL84NkJPZUFXTSgCA7g
	LLTwecMUOeZvkG0L+fwDRKRyMihzdQ7c0q63bv8Kfomx4LfAe99shtub8m1O8uxXE/x72FGbqtWXF
	ZyNKWZLKorIK+sygGgyUzBlkDh8Z1KejsJbSrcqWDCVSQ6eLX8oiv1TQFSFlijIuI4HRwxzree6RX
	hsvf40Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHZP-0000000F0rB-0kHZ;
	Tue, 16 Jun 2026 00:22:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHZM-0000000F0ql-34ES
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 00:22:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ1CfJ1219872
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 00:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+I5JPJ28+2C5Ptq2qq3gPPxE
	l8sJtso7kvE/1GSrC98=; b=exV7vkjmYRiBrHACB1F964JIl6zOi5w5Ae7TN+Eo
	O9OsDnvYllYprf0DquCfhY0PjaFyJOxlUA8qaF4NcwghLLEP/aO2CMrilizZBr+s
	lkUGeGBQEeKQOvAD1ZvHqDH7VHfR15M+4nTzc6e+ZinGV06a63H7si0stkWmqrFT
	3oWyTSwPv8NSvretIH8b/KGkVzl37PY+TuishGsPKk9eTvBaxDsF6FVoY/W1kusK
	kYPsV5YAv0RjAEzlLR5CzouvhkDN1/GLRjZ8mbOr8+KynNv4u5dZKm2DdSpN27Q/
	SLptKqfW7BR870293tgLOP7YCR2lzfz8LJrqke8a9kYZng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etevx3rbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 00:22:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9158e75cbc0so595431585a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 17:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569339; x=1782174139; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+I5JPJ28+2C5Ptq2qq3gPPxEl8sJtso7kvE/1GSrC98=;
        b=Ab56V0/BtlLCGl/sYVrR9LvoisVvCAmxMu4S3c/KZCZm8EpWJ8/ToBdp58pYcFEIFE
         144FIbUWSUunr+6hgGmlv4njNdrNjNCQ2BCzi9aB1xQ9XMnkyXvvBXKwcu30INSljXuS
         62j/id2mXpFRH7fgVWM26NYLfDb59Nx9KuoLq+6V9gZaXH4XMC4SlpWxdF8ZaLkMFui7
         ZuuCn/7rrq6hC8yq7EPSIhnZ/U1PjnrYjr8LWWwOzrnq2fGd4rtewT8HWyPy9YNxoqs3
         rGoHXXz0u4OlSDCbuh5DUctbbqOrJirm1AOwG7ZqBDYkIJN1cHx/CMp7ZpIv4f7p2yqE
         J4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569339; x=1782174139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+I5JPJ28+2C5Ptq2qq3gPPxEl8sJtso7kvE/1GSrC98=;
        b=po0bYqOEbJwYFva5U7Jr2OZbTtR5i1ggEkOTT9En+H+8AVrw8Bvc+QYYV2hO2IhoAu
         Jjz7n17qqWBN9c9gTJHyjIPmwEhdf08cj8aDvf2wsBziMhUM486qFaztPk+/YgT64FXZ
         HjUN1N8pB4xNEYaUIGSaOaPh5m8MnVxmJf6lgo18Aj/4UJ+PnZjbgXb9le34R092VMiW
         RgkByChdWHZA9ABXFQDQHD8n03srJ/GzhE/jMLwgSg6QV1RE9H/2HNcqsPvzlvHajArs
         HGdGGK9b/r6ShBPeyTyujJjzesWOyW9+BUl3l5Yt5HZLhtl476XQlKP79sEmLg7AnRVb
         /tmw==
X-Forwarded-Encrypted: i=1; AFNElJ88h/z5OelEHolG2efrMBsTr1WQMe9i7KZUg3Js1cobKMlMPWFbW+Tx0yhTvs77B9Av9QmQC3aeVmeM9QDV3BMe@lists.infradead.org
X-Gm-Message-State: AOJu0YwZtDWDA7BBERcxwGbKtrBhfheGuj9agy+wgSPEsgGnuxGm4tFr
	FICIcz0ylLMgtKGLQtm8eSoJpPSwn+bdUApV4/LXCKyoU77FCeB4SlTjWkMpv9FV8EdGCYST1W2
	RrbyBxAP3G5HHm5AHo6jl3nE1YlPvlE4Hw6bIxwefTbJtXcTpKpcC0ITObAqAbFWDbzl9l6pjrw
	Rnyw==
X-Gm-Gg: Acq92OEI8I4KW0ELKi8sc8hDGZoD5hX4VstorXdvJZGQsFcGe3a5fyzs9qPHspq009Y
	DjE7/vIZdQ/zvNH+DQP0REjzhHTzA2UYVkz00P76d+Arav1ysHKerR5UwdsRXool+Ui8CKJO/Vb
	JaU/bsT+VW37G+4lL82dTobLM6Qgj917J7If3q8W/UoCw564Ice9g/r2mis++/pqIF6y71GcrrM
	DiUfVnwthw81/jkC8QKlPNU0cQflGkTZHzxe93qB0wiBniZ5MJRW2u8+DaWyZR8FRenDlJ78Gy/
	A1jS4cY1TkD/GqIEf3m0WePMS912et7FzBKnZ7Gpt5eJEN9y5ACyFPmqI1irNat645G8/6q2dDu
	Bf364q4S2Et3yWgfmYhehetGK0YAnFM7cSoPnWAU/H8rOrewNf65BbF3ULgTtXHM7PMRs848aq+
	p9y/xGIc+zkzOZ5198tpO74O75DPs7xPKoyU4=
X-Received: by 2002:a05:620a:240f:20b0:915:aad5:e961 with SMTP id af79cd13be357-9161bc2369fmr1782860985a.19.1781569339078;
        Mon, 15 Jun 2026 17:22:19 -0700 (PDT)
X-Received: by 2002:a05:620a:240f:20b0:915:aad5:e961 with SMTP id af79cd13be357-9161bc2369fmr1782857885a.19.1781569338549;
        Mon, 15 Jun 2026 17:22:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16fee3sm3056234e87.31.2026.06.15.17.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:22:15 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:22:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Message-ID: <2i6yzwu2yk5bngq723g75yeqzeg4ihvtbuydzunceltl526tjp@vnt6nmxxkfut>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
 <8518a085-b8b7-4ee6-b08c-8dde3971a6f1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8518a085-b8b7-4ee6-b08c-8dde3971a6f1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: W0TcjwFrqLpQSJPZHYM4X4XOwKnQ8pXZ
X-Proofpoint-GUID: W0TcjwFrqLpQSJPZHYM4X4XOwKnQ8pXZ
X-Authority-Analysis: v=2.4 cv=f8t4wuyM c=1 sm=1 tr=0 ts=6a30973b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ak52lZM5eA1PxQ1fx0cA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfX60uOnB5hjoPv
 X9s152FkqBdGX6VeCK5EElQkO6HrmXynTYtTX8uTt2YDiOcBOJmVj8gMy4ZGcKMMNDmnA/vE/Im
 3HIzfONbKsv/Qb0lvFsI/2BYUixK5Nw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfX7I3aZCo4CugO
 f/ALp+86qAGwA26d1m22L8Hq2Pso2+00EP3ogAHu8IRmrRPm+OkpY4O53johu+2IpXNIpNs61pP
 nzXVCwZT9HsitmRCFDFwHo7fELX3XYe3PTvvmmoFbeW+4IYmnYohE5f48tS/8abeFdOOHkD0GMh
 jzEWe1yAy1k8U8i1Q7L3Y6IPgObAwXAWAqZccob37vEfFWLTtlhxqbxPDj5nxbXKqU6sD8dfQWG
 epKlfdajWJdw36tFQGuirP45ggKikNhUeBM0RDKS1zihLuvFbBuBqWAtBu/jxk/oVVLw1CNjVjr
 b86fb6hcPi+RfrDlPNvHVEOu9dzLklQBsWpRN42YJ4/0qy/pCXc4KbP6g7eEhmeI1Shx88GmE/o
 t+NWXsMM4GduLJAOSA9KuI/5MW7LwxkRd/qiNKa0tH2cNiMtHTyIkrC/h2iY0hXhnCsaTAq3S6j
 Si4mD/yIaIauSOXrBNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_172220_895181_488A7D15 
X-CRM114-Status: GOOD (  37.41  )
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

On Mon, Jun 15, 2026 at 06:55:45PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
> > On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
> > > On some SoCs the SMMU registers require an active interconnect
> > > bandwidth vote to be accessible. While other clients typically
> > > satisfy this requirement implicitly, certain corner cases (e.g.
> > > during sleep/wakeup transitions) can leave the SMMU without a
> > > vote, causing intermittent register access failures.
> > > 
> > > Add support for an optional interconnect path to the arm-smmu
> > > driver and vote for bandwidth while the SMMU is active. The path
> > > is acquired from DT if present and ignored otherwise.
> > > 
> > > The bandwidth vote is enabled before accessing SMMU registers
> > > during probe and runtime resume, and released during runtime
> > > suspend and on error paths.
> > > 
> > > Generally, from an architectural perspective, GEM_NOC and DDR are
> > > expected to have an active vote whenever the adreno_smmu block is
> > > powered on. In most common use cases, this requirement is implicitly
> > > satisfied because other GPU-related clients (for example, the GMU
> > > device) already hold a GEM_NOC vote when adreno_smmu is enabled.
> > > 
> > > However, there are certain corner cases, such as during sleep/wakeup
> > > transitions, where the GEM_NOC vote can be removed before adreno_smmu
> > > is powered down. If adreno_smmu is then accessed while the interconnect
> > > vote is missing, it can lead to the observed failures. Because of the
> > > precise ordering involved, this scenario is difficult to reproduce
> > > consistently.
> > > (also GDSC is involved in adreno usecases can have an independent vote)
> > > 
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > ---
> > >   drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
> > >   drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
> > >   2 files changed, 57 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > @@ -53,6 +53,11 @@
> > >   #define MSI_IOVA_BASE			0x8000000
> > >   #define MSI_IOVA_LENGTH			0x100000
> > > +/* Interconnect bandwidth vote values for the SMMU register access path */
> > > +#define ARM_SMMU_ICC_AVG_BW		0
> > > +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
> > 
> > totally random numbers, which might be different for non-Qualcomm platform.
> > 
> > > +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
> > > +
> > >   static int force_stage;
> > >   module_param(force_stage, int, S_IRUGO);
> > >   MODULE_PARM_DESC(force_stage,
> > > @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
> > >   	}
> > >   }
> > > +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
> > > +{
> > > +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
> > 
> > Is there always only one bus / path in question?
> > 
> 
> <Apologies, missed to respond to this query>
> Yes for TCU, it needs to only have a vote on GEM_NOC interconnect
> while accessing the DDR in downstream path (client->TCU->DDR), which we are
> addressing here.
> Hence it's only one icc path in question here.

Again, you are describing Qualcomm platform, while the code part is
generic.


-- 
With best wishes
Dmitry

