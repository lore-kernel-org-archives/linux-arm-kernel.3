Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4487CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 00:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i20IcmKQCtSpRNFUs8gx8htgmWtH8qlgtcQsTvxKC3o=; b=k9ShcWfo5rXQb1vl+IdjxOM3hT
	4hihiCL81p4u29cPH22pXIN7DeZ3IjosJ6cd8y8xkGQ5JEqYdKCXX+YR0dQGL7L1OoT0oS/bal940
	N+FwKr0NsMQc0FknI8ELTGgobxbYZnft3mGc2O8MkjW7HG75FKDi9sSakvmP7Bi3H11P1lwCdptzv
	rrKEUsZIl7YJi/6VThYFTVp1dDhrFPuMJKoMPL9czTLYlmrgasVgGrtN04NNYVBynAW3kC9X20UhA
	lvt9I44l7+bQOIz3HGh9bp/zfJGWYAPJa5Pm3MQuvUCBhcWHvPQvwpPX+1vu/SljUOLxAsLMq5uKk
	UBAicoUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHVP-0000000F0HT-1mZW;
	Tue, 16 Jun 2026 00:18:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHVN-0000000F0H8-0N41
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 00:18:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIx0Vj3577885
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 00:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i20IcmKQCtSpRNFUs8gx8htg
	mWtH8qlgtcQsTvxKC3o=; b=ajKrQt38ygS+n4lMp6F59aVCCgMCTv03uQ+bp3rr
	uB1127SRL7ivvincdM15beeF2Rj8Zk99pApGrI5U93riFFSBjkFkzuEIaneSZcnE
	Hh7wNUPL3Cc7z7z5ji9NfKuaOKimTwKP9IYrtkwFGrIBhltO9JzWcQjYBn2k6C8N
	13cZgqyrBXi9BMoU0qKal+v2iC08L/se0psF6wS9V7y6EFB7SiVZJz86jw7WV7jA
	VqO7X76mmzCpncUNKHjMjoyamhZzZQ/lauQM5vZm0rQ0fTBAdcQ4INkYtZymkAoV
	WnBq+W/2BsLjM2YE4HR76i5mTqv4yjlpy4TgnhY+/ipmBQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete983vdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 00:18:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915c364ae3bso760778285a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 17:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569091; x=1782173891; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i20IcmKQCtSpRNFUs8gx8htgmWtH8qlgtcQsTvxKC3o=;
        b=N9a0zCoymRo9L+GzUZzv4Pot2eqmuM3Bxo7rnGKnf/7VMv7JL104pDRZrUDI7q1D7I
         C/AT4y/jTbqSOy6MJgTOIhZssCB8tH5qzZbGp1Oz1fSNOS+952sBKsO9gQuW18TpS84r
         1o7xhOial1xyKMP2r8vGTtr7rvE2YsA5TX7jdPqzeLd3FVjCSMmcW4jF9zVTDa6NfWRU
         mq0DLwb0pkITeTq5gmTL8eSU8C+jS9o95VnVZIySQUEcXUuEMoUCI/766YvxBX+sErEI
         3iOQiODrHOlFycDYDn3gbYA95q3XvZunzl+FUSG9VwNc4Mu3wbN4RAckJ1mZhW5NRKd8
         89Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569091; x=1782173891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i20IcmKQCtSpRNFUs8gx8htgmWtH8qlgtcQsTvxKC3o=;
        b=B/qD6OCVuvzWFKLxgYPnM5yXbDciuVbXqVRSKuosyoxrgkpZ/1qpcvI6AblRqrxOAR
         aPPICzsUzetFwrdgW+RH9oLw9PagVeoObZpu7KryICHtyYi7Y7pUEaOkajkJ4TtXDB/g
         1+iY/BjbEhfYZ4R29sixczprzYNh5v11BpS4IX8hv21qq9/TqvuiPALg/9ZDYedKCoaF
         ectlbFaL4QfCc73/418oJSI6bsCFZPxGOOBmwEKCb9RcgMGxwMhhzCgYojG31XsBibG0
         xjU0Y4rAzNDkQ/PW8ro8ALK1Wam8h/vaXtLpXlzkGVSFEVm2UV0U7QXGaqFNds+ydSZU
         eUbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+GuSuNMduufAbUo7CQqCmO722YTysKDMgH63Y4eAMgP2+cN2B/KJ8jX99FAj+xETFx/sPRLub0SsWbUQ0C7GUL@lists.infradead.org
X-Gm-Message-State: AOJu0YxkB25ZKml3IQv3GW7ume8aicvk8mAVWRy7HUkUEil2n4uWnx2g
	u/eAoeDUWPGTxb/MZt5yiBjmK3j0RMQOxOnCp5woaR5/wRkKAqzWiyPclsLAFAismzC8ck5KK/P
	4kuL/YUA/Qur/CnQ1LGC/JvLGLx8HOds+lpPpNOQDjS9ERcksSuGpJqcodNCa841bTR5SXMxlUW
	4owA==
X-Gm-Gg: Acq92OETuEOBWEkLvSYgQxvlXIragdqxkrQ3nNiSM6w/xYspicGDfYhhS1Y7TZfatZI
	pmYqHr6pMMJ1DLPpy4G4YxtztmBdGIwL5Qer7LoRMmNv3aPCu/nkhbWg39CDZkDGUIRUqixlp4s
	I0Eqnfl7jqvYJln0UDQRTqEWG89p7bLvkTUspYYmbFp49aSmmszcefHQ9SHWKBaUxQwts4sIE65
	nLxzMoKFTN6QmWZwAYewGLZM/yJKxAO7LIcleamYNbpXWco3plGStk+rUHBQfEHEAk9jt30dOnP
	3OnZhe+8mxk5H4G21QHjB0GSkXBF1E0rbXj23mrN+yzLbvWKn1B3EqvfJhvP4PrE0kNnZXi01fT
	46KddYPmgOSYRODMVWwy52HafSveJZo1t6bti9dBRucNLDhFCocpq+cBr2YBV8EBGOZnhRPlPqc
	Edvum6drH17tH03Bh+vIrGE7QJFvRmnPA0TQk=
X-Received: by 2002:a05:620a:1786:b0:915:9229:4223 with SMTP id af79cd13be357-9161bfc078bmr2522039185a.58.1781569091134;
        Mon, 15 Jun 2026 17:18:11 -0700 (PDT)
X-Received: by 2002:a05:620a:1786:b0:915:9229:4223 with SMTP id af79cd13be357-9161bfc078bmr2522035585a.58.1781569090689;
        Mon, 15 Jun 2026 17:18:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c059bb8sm2529131fa.10.2026.06.15.17.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:18:09 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:18:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <4wu33lbglqmqywhwntxx467uigkpxzctwkdtues4mcpbzjrqyb@jokhryzdph73>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
 <1b5ef5b8-c9f2-4eea-8040-22c1d704b529@oss.qualcomm.com>
 <0ded611e-1932-470c-8e80-9a5e94268583@oss.qualcomm.com>
 <2roy5rvazzb5p3vl3dyutft635n3acwssqnqvrzqziivh3ebq2@wptxg7exupmr>
 <a1db573b-bcb4-44a5-89b6-6d1c76f4a18a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1db573b-bcb4-44a5-89b6-6d1c76f4a18a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a309644 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=V2S91bIb8oTTECmzoZMA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: xyAv36pRzLgnOP5DCZ-qBOO9UH1rA_YD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfXzMciLVg2JXT0
 ATIatTBeKGyAwUr9ff7+9IrgkE8jiNbjgfy4w03/pJ5BbtGw0eOMcp8oEl9iTceflTEX96S1bs+
 zew1PziMDPKgte+BGjtmnqW3Af6pkEY=
X-Proofpoint-ORIG-GUID: xyAv36pRzLgnOP5DCZ-qBOO9UH1rA_YD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfX1n8CnCOldpYT
 NQGn++khRrY6p/9ADOmhViwC5LzytOORBRc0Clxw86FieEj0qPdt+iTjL1quWDIzBj5XeH1rcj5
 ttUQTulVLXEk5AAT7xCV3UxrxOn97Sx/3woKaUv1Sd0urnGZTt11Hbdt9JTdwX7/J5xZFCUEyX1
 fHapGsxvKaJQxOhPm2l2U3mIgUsfkASZDesfFjvTWD1nL1o/CYprUZ4f7VlrXZFe8vZFH7Nk6O6
 lioFhozIu4MMcgJStv5g2kyIjsmLjf5VKaTnfTSNgz6vszbRvQUaPqaHI6zWC3ztiP5bEmwSECa
 yLry4pJxq+LTSy0XTKVMHocJi3LSITZwN4gGgsXJi3+hD/i/r2jYiMlV2gpTB5PWdxjF9tz0r9w
 wmI6/9pPwXkt1mzN1q9i0ZqtkzTjNcz+dmewnIs8kehEBXV9oFQuQCqeOWQVzULZW/P+4lsSIa2
 RPALHLX41R6kq67+BVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_171813_132248_B749C87C 
X-CRM114-Status: GOOD (  34.27  )
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

On Mon, Jun 08, 2026 at 07:32:45PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 6/8/2026 7:19 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 08, 2026 at 07:14:43PM +0530, Bibek Kumar Patro wrote:
> > > 
> > > 
> > > On 6/8/2026 3:22 PM, Konrad Dybcio wrote:
> > > > On 5/26/26 4:42 PM, Bibek Kumar Patro wrote:
> > > > > Some SoC implementations require a bandwidth vote on an interconnect
> > > > > path before the SMMU register space is accessible. Add the optional
> > > > > 'interconnects' property to the binding to allow platform DT nodes
> > > > > to describe this path.
> > > > > 
> > > > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > > > ---
> > > > >    .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
> > > > >    1 file changed, 27 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > > > index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
> > > > > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > > > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > > > @@ -243,6 +243,13 @@ properties:
> > > > >        minItems: 1
> > > > >        maxItems: 3
> > > > > +  interconnects:
> > > > > +    maxItems: 1
> > > > > +    description:
> > > > > +      Interconnect path to the SMMU register space. Required on SoCs
> > > > > +      where the SMMU registers are only accessible after a bandwidth
> > > > > +      vote has been placed on the interconnect fabric.
> > > > > +
> > > > >      nvidia,memory-controller:
> > > > >        description: |
> > > > >          A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
> > > > > @@ -602,6 +609,26 @@ allOf:
> > > > >            clock-names: false
> > > > >            clocks: false
> > > > > +  - if:
> > > > > +      properties:
> > > > > +        compatible:
> > > > > +          items:
> > > > > +            - enum:
> > > > > +                - qcom,qcs615-smmu-500
> > > > > +                - qcom,qcs8300-smmu-500
> > > > > +                - qcom,sa8775p-smmu-500
> > > > > +                - qcom,sc7280-smmu-500
> > > > 
> > > > This is a list of targets that happen to be supported by QLI.. but should
> > > > this list not contain _all_ Qualcomm SoCs, or at least a much broader range?
> > > > 
> > > > Perhaps
> > > > 
> > > > if: properties: compatible: contains: qcom,adreno-smmu
> > > > 
> > > > ?
> > > > 
> > > 
> > > As of now platforms where the issues [1] getting reported are added, the
> > > list will grow.
> > > <We still have to evaluate and test on other non-QLI platforms hosted in
> > > upstream [2]>
> > 
> > Do you really need to test, which platforms have an interconnect, or can
> > you predict it by checking the SoC documentation? I strongly belive, the
> > latter is the case.
> > 
> 
> Agree, for interconnect path we can surely predict from the SoC
> documentation,
> But for the corresponding FLAGS/values (MASTER_GPU_TCU, SLAVE_EBI1), it
> would need some testing before finalizing the change on corresponding
> platforms.

I'd assume that corresponding values should already be known. The
platforms are not new.


-- 
With best wishes
Dmitry

