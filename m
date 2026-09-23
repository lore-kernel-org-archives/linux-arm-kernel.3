Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E6CC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6aJrQIUE12s0cEQsNzDKJFIqPllp7aIt9z6KSAydC0=; b=heHSSA9LHgftQbc8UfzwX3uQq+
	DM4rcaQtu30+7xs8pWVsaatmw7Ovn8LHWkHgdwI8NANHbom25DT5WAwSls0fO2OQQTc9mKlxALK47
	biEXgEQuKVow01JOJIZK1LqBH+q+feiF/VoiSglYCNsDpzMYIXrwxqjvyd2roq0NrPYDEQvoGpuql
	OmPfeYMhSf8gGqepf1aqNNw1o501VPyCyQxlrzyPktqUuIJpSFjq7Tw5KjJ5+Yi8vVPWBo43s+1r+
	/5MkJjXOCDJhkbd8AiNc0oJxeatl1uXF9Xte+rj4nW42JHAkEBrxVd7sTzH8hqIL/KhmUtBMCspMs
	EWsIkoJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MDs-00000008Ggx-3KqK;
	Wed, 23 Sep 2026 12:37:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MDq-00000008Gfz-2X6I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:37:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbSnr2443254
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 12:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q6aJrQIUE12s0cEQsNzDKJFI
	qPllp7aIt9z6KSAydC0=; b=XSof8/Qe47i4vOA719Hr5gDs7gElm34+jE3Oe0C0
	I8S+v0w3GrG/1N/lu5TklX/5KAdFCVkgwqQN1mt9cav1M3tpmO+UNicc7cFpZsxL
	QB9QzmvHypTekCOjfDLinag0iXAIQz6rnSAu8//Cy8G7/riQq7BeEbz0cdGz6KuA
	QjxLfCn1vtt2ur9REWe00aaB7XcFXyb+cx6lRwcORGPodqIId3KM4/uQ56juHhus
	8gvYjDRT2KQqB4KttfR+UiyWoO5Ld9ArY7sgO4uAheFeqdI6uXQ0V5+lKYz/nW2O
	jCTZoRR8X7s2O9S+Bx187f2QdtyIg1dHh7jQir/FcXkRnw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7gt4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 12:37:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so1051494a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790167033; x=1790771833; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q6aJrQIUE12s0cEQsNzDKJFIqPllp7aIt9z6KSAydC0=;
        b=jTJpCe70oeO6yWBjO1DCkRP/2O3PSK1rJO2EA1+RcZkjrDU4DHBTJqEl7d6NxZnJcE
         /7ots7iSgApIhUFmRoaB9JcgG18mKI/W7y/7Jg+cafCGjULFMUOk/075zAbboR488QG7
         j6Qw3rtJv19d0AoTdFu44FZp3vuY9nM0ApAzWiajOMJtn/DwOQ9L0IKRGjXHLnHoL5I6
         Ss9fmhharHEsWPXAc2HOZyHCujBVW4uAiuyY5gQnGMjRiCw0xoiPutpeHKH52n0f9RtA
         m+VYqqlzBSX0LuQxjOy1JfO3hRFItYeU73cTJILcPTf+SQM/UVk3RaXwhbvm6U4vDAy3
         Rieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167033; x=1790771833;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q6aJrQIUE12s0cEQsNzDKJFIqPllp7aIt9z6KSAydC0=;
        b=KiLQ3X9A+DBkBXG5KaeQQH73NdWe93cKAZN4HNJd0Eg2NOqELiwM8MdO/RB20yTUPk
         UMw9JYldP3DsodaZrz+zbRarLL4IQz+ItWffhgPpZFoVuMM+F4Y+hkHiyAgEf+JUKqv1
         04rTeAvta47epqxsPOw8Q+91N47+JEXn1Z9YPpZ3ums7M7YMX/EQMwtuj5Iem98ovbkf
         GzbGJZ5IiDf+F9xVC8wgc4y7BIYCMmYliqLXSZymwRqDWKkvs+90WX1svgRY4ZySiu+B
         ozNR4nqG5ERNAWytVX7ZPHLx6VQQXQSbLaVMY2q8+odoDEuz4S+a/WT40FBSnQCh2bH/
         roJA==
X-Forwarded-Encrypted: i=1; AKwUvBwhRJv60ibQHx7ujTSHnWOB/LoCVYY1RVvBmqnGBVruVqkCtkKshiRYG1QNX2x3g/P/RK++DeWDoyH2IOLuOV4/@lists.infradead.org
X-Gm-Message-State: AFuF++lCkqWPiwVxDpDnvcafap9xf4qzNh5bIxb+OzgYPg4Z34Grmmdd
	ATT8I8a85h7RRI6b8WBm0A7WF+1g60/br2GjMfv4ihSjRCWd7hQz0l4xespYJu1CJnnNHdiZh2U
	1cSCkmsmuQCEwqJwIisjJSw409kaSGOH6bqe5LAdjP0XV6YhQ8GNCEVl0XN3cBZ/0JP/ti9F683
	BvJg==
X-Gm-Gg: AYBFou2AH70UGw7eogCnyLpUWovoWgwst2GykSQTeH7vILlvLUmp9MPp/1h47IU/dg5
	ilmlGP84jDAkA089n/S372fctb+TOAFU/Wud8vgfkf2kv5bzzlVPjcSoyTocJksRb9r4xM3S51P
	EIHdlYQD3LLGs7Es9aAzRavjq9k/B7mO4f8nGvgM2/JoxDV/Iie4pMtXtsxf2Gbdyg2aN/ktdLV
	iV/6IJaXqS5fPOqFHturLLJmprJokaxIHXNPKDRfIee0Stil3H7Wk4X/7MVStFvZhV/crqF9rEB
	83KFcHlaSbQ6oXTL4Kz8C/wjC5zZJXQJB4inBLtuB9vVclM5Rq5gCchh2RW7c5RdALq2XBm7TV5
	LLWjscSHAh3aMZA==
X-Received: by 2002:a05:6a21:6915:b0:3dd:a196:69e9 with SMTP id adf61e73a8af0-3ddf830eef2mr2433400637.68.1790167033160;
        Wed, 23 Sep 2026 05:37:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:6915:b0:3dd:a196:69e9 with SMTP id adf61e73a8af0-3ddf830eef2mr2433366637.68.1790167032567;
        Wed, 23 Sep 2026 05:37:12 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3ba8b6sm990949a12.5.2026.09.23.05.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:37:12 -0700 (PDT)
Date: Wed, 23 Sep 2026 18:07:01 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Subject: Re: [PATCH RFC net-next 3/9] net: pcs: xpcs: add custom platform
 register accessors
Message-ID: <arPH7aUUyM0ZLXAr@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-3-4b1c682af70f@oss.qualcomm.com>
 <be09d6dc-c1c0-4a0c-9836-2b686ad096f4@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be09d6dc-c1c0-4a0c-9836-2b686ad096f4@lunn.ch>
X-Proofpoint-ORIG-GUID: wvSVMeNPl3ORn4xkI9DLvwm8vLZ96y_L
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3c7fa cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=B2OTbEDsPxpMJ7_uHOkA:9 a=CjuIK1q_8ugA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX77WpHN4cSd12
 rQpwhTKGn6AlS+gc0i3+VxZdSPR7ecMW3LU4bdly686FWXR0iFXN48+WUOT0xzrsc+IGBxnSjjW
 cRlS1YymLxruPd46XO7+8C9+XzlRsNd0e1TO61uhaZ4RcWf+rhRx+eMNXgnRDVBeIgVKYLNEy+B
 3emfCOOdQWEvLB4uUz9tIu5zvBPkLDech8WRTcqyQp/fZmkWPu0GaCR0im7/bOOa2Mdc13RNDNX
 U5juU04KVNUGUepJ4KTZfJ/4JFwmkueF4xoJHEjtC4vUih6p6E8lfxKUBA74N90IS9feHHA6Kxd
 m1ziPl14wwZAmtqGvTNjG2wq0ymTWTJX+yDdW23dytqQDRb57TabYVUa3jlmk34UDCvPRXfa7dT
 j/KOmB7WwPQ30piW1B+Wr0OGQ+Byq7E2qbci9WhQIy9yQh4Tt2Qx8fXSo2Umu0J/eVEUlLlWGoq
 eXe3ojKPw5pyuO0RSkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX+GzbBXrqUFrh
 Xcmk/aWTjE6QVY6iJB6s5Vo/R7T9vTpMKsZiMOjJ0gRG0pM/VrQOFUdOGnb7e53QQfPty9L/vxE
 JkAGbGzMVVhSV5fBhQejdnbcXgFsOu0=
X-Proofpoint-GUID: wvSVMeNPl3ORn4xkI9DLvwm8vLZ96y_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_053714_648127_05043E21 
X-CRM114-Status: GOOD (  19.34  )
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

On Wed, Sep 23, 2026 at 02:18:17PM +0200, Andrew Lunn wrote:
> On Wed, Sep 23, 2026 at 06:37:29AM +0530, Mohd Ayaan Anwar wrote:
> > +	if (pxpcs->ops)
> > +		return pxpcs->ops->reg_read(pxpcs->pdev, pxpcs->reg_base,
> > +					    MDIO_MMD_VEND2, reg);
> > +
> >  	if (pxpcs->reg_indir)
> >  		return xpcs_mmio_read_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg);
> >  	else
> 
> Ugly.
> 
> How about changing pxpcs->reg_indir to an enum, with values indirect, direct.
> 
> One patch.
> 
> Then look at
> 
> 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "direct") ?:
> 	      platform_get_resource_byname(pdev, IORESOURCE_MEM, "indirect");
> 	if (!res) {
> 		dev_err(dev, "No reg-space found\n");
> 		return -EINVAL;
> 	}
> 
> 	if (!strcmp(res->name, "indirect"))
> 		pxpcs->reg_indir = true;
> 
> 	if (pxpcs->reg_indir)
> 		spc_size = pxpcs->reg_width * SZ_256;
> 	else
> 		spc_size = pxpcs->reg_width * SZ_2M;
> 
> Look how easy it is to cleanly extend this with a new resource name?
> And add accessors using the funky mapping your device has. Another
> patch.
> 

That's a better idea. I was debating whether using pcs-xpcs-plat.c
with this HW was a good idea, but what you are proposing should hide
away the ugliness. Thank you for the suggestion.

	Ayaan

