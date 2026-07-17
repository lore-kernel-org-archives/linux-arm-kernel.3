Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB01C44516
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4m4mhHCdwe+iD4gbi28L8euNiv4IB7P2LYKO26utpc4=; b=COlvs5OBn5dttfEij/FAtrnbi6
	4XorRxV3qUmzA5G3nvMAOOKB7akQFUYJ+dM08rzEAWTlEaEaCnE4o8Ds7kyoRDOPMzWAsvw5J0lMv
	TRyQxsqUYf4FQ8mc/c39d/eICGG9ofzG+XMUHBpi9ulBha5NzWA3CegsPDo84uw5hPPz1ycCij5Ie
	H+fwmEZYmpWMZntmT5laDPQo42FgvYA43E6ylzY+piyz/ctYHV2QC1savuvZIOdjUWc2Sk0zGfIfP
	u0BjbT3hNkXyE5wJSzB0LRp93dCZvbBD47jFkahxRPSoytfifo2MMdZp6XPEVzUV2/KedTc+5CycW
	ePswlosw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfLo-00000001tsp-1ssP;
	Fri, 17 Jul 2026 09:59:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfLl-00000001ts2-3IX9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 09:59:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H9L8BP1461608
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 09:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4m4mhHCdwe+iD4gbi28L8euNiv4IB7P2LYKO26utpc4=; b=Qov3sl3XOGvuaaS9
	FzJ64v8p+4oY/aWx3GR75C+9X6OpIO2Ur6Y/TrlskZq7xyE4qWVcdLzgAK1OkjcW
	/O1PfaH+hCukscfvU0Usf//CEk+9veVwA/G6+tNr3UL5NsUHHrdRVPTjn/Y0TlEb
	LEVvhlslkKG67+QUs0vgfT3Af3AdvBk+sINzKnG390ybx+UpMIayENdJnYE4m9q+
	c7Cr5MyXPrw54nkerytxqHoMPPoGxBTdNvngbm3R4fwW13K8hB0gqkBkCFZ1fwq/
	eESdJxByGALHzIP2JC5Y3tAe5udjJlu/OgjRhjaDv5y/gVkCUi4NqZU3eFfD3YZG
	4XXPdw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfg4g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 09:59:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6cb57d25so185626185a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 02:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282359; x=1784887159; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4m4mhHCdwe+iD4gbi28L8euNiv4IB7P2LYKO26utpc4=;
        b=JIfv/MkCTnCieUHGBNrHztwRCdfH95ZB1gyio9QFfk4RNbNZagZj+u7FPJc8Hhg0CR
         qbFU2b6M+Bgl3C6ZDNLNx8jkWkqxoohofWxpJkkJkJ2pUTUCkuOnFvyLJQK2HfYEPCol
         LNytZH2431tdNtDcntFV9xyK2cZJ5oDreWuXwPFTAVRo7VUKSd33fEaRXLyA7LJCZTZF
         NEnNbFWRzTEpg7+I305VV7P1e/JoXRVV5gVdQ0QGe+pWDHQBWrGWvZk7apa4/jxQTinv
         4J2jKCFtm2XK1CrdlPtSuCBX5Rh3kYqMdXSDWwVQDdbxmP29c/eanzWJkfMhOOvAdmFc
         AZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282359; x=1784887159;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4m4mhHCdwe+iD4gbi28L8euNiv4IB7P2LYKO26utpc4=;
        b=CmBBD/FgvR6rHUoD//gIL6Vz8qGkCQxpHa1LGItXJrWW9Kaxysp8jTqtw4NmV7Z6A2
         SjCVf6AdtfkQFJhmfkUvvInoY1SkQ4F48IaNCrTMHzWJFSMQdhefrK6ktBWREgG/lDw3
         xQkWfMjB+M2PSUAC60W0MAAxJuC6CEuCsPMiUvI5BwZpgbWXijPCHz9l44C9EXhNqqio
         aP8uHxMb+3pCpi/Kw5bFOCIZX0zCr8mZ3TMWUZv3cwyBySidJodhNg9ACQVNPMMK1XfE
         7q5lodR0vjce0dF36TVmJJle2cESRuZ6R/dOfAXvoMGA2/O8VKw0G7BeOusFdCy5e6mr
         UTRQ==
X-Forwarded-Encrypted: i=1; AHgh+RooAUcFZiw6XDIPeQPOtooVOCXYzizVmZU4Gr8yj2datvMnyVPKcDzuhWwzKFFmwE7OK9u5hu+wJH4/m8bU9NrH@lists.infradead.org
X-Gm-Message-State: AOJu0YzvTSConYjMxoU80+l+oTa6TA1nTmoQCwscyy2pP+/9l/LJCE8h
	ayg3pH3kg8pCghkzAsPJE9CX/CTw38WQ7c0Nk25fuUQ3KeA/qBLGxPOhAZEx4ffkMF06BTGTMJE
	RFDmGFTRh1CDkuZQOYTcjIx6BcHzLCloYW7F+VF7ze70e0FXCWjTTI+5hqe6cPrDaMkyC39aHWh
	J32g==
X-Gm-Gg: AfdE7cnALtIiYbDiqu/tRU5bdLcDWXCmx26HjEe/bzL9s33OEVRUq4yab3iZmSf1jwu
	7uEFmgQ7uikO07CzjZgRyy+pcN7pMDmBnSSpF7FI84Hv2YCUvrawx0fJQtoiEAGAd5fG0Y8kyrt
	rOwEf1eg7TH4gZN1yFSS+51nd0H8tYHkAQkWW1yAqrOwe+xdAlkrEbMchKXDuWrzyRi5OE0Mufr
	d68bZMFKO6GQTvpe2/tniNIkkMJFk/dYmP/KD+FBM/aKNSbcX3gNDns2oRkLQf+KZYkHVL3mBjW
	4tywYiSINyhzkBQWsmvBjRwkYAYcomqLe4myQF2W0cdfg2qd/wtw4Rmt7mDT9gMPmF4ssuvYdwQ
	gefyzPs3agTtBw5hf+rp12Gv5
X-Received: by 2002:a05:620a:4396:b0:92a:228:1bfc with SMTP id af79cd13be357-930b3e2e4famr170490885a.2.1784282359420;
        Fri, 17 Jul 2026 02:59:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4396:b0:92a:228:1bfc with SMTP id af79cd13be357-930b3e2e4famr170487485a.2.1784282359012;
        Fri, 17 Jul 2026 02:59:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf5df5sm50044466b.61.2026.07.17.02.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 02:59:18 -0700 (PDT)
Message-ID: <f7de5852-c255-4a17-b87d-c9a4542255f7@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:59:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: eliza: Add GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-6-c9f1354dbd29@oss.qualcomm.com>
 <10b0ad51-8766-449c-a51c-979364e6c781@oss.qualcomm.com>
 <5fcc0bc1-7f9e-4611-be77-42860e0f4c74@oss.qualcomm.com>
 <e8255fe2-a67c-490e-a905-ed056c6af950@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e8255fe2-a67c-490e-a905-ed056c6af950@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfXw5EYZgmM9C0I
 B4BdQUKN79ydBEfE4g2mFymkWY+FcV/Co7QV9oi3kbgS/mKVycs42m1YstId+D5ds7bM7rv57zY
 CjzI33l2B8w4xEPsbJig93UJMnsSGTMFr78ghTyDbJ6OulXFyM+9OwmlLo0TfLxHAORAYqoL32j
 R/nsoC1cyIFPKQyecjrpehrLSL6iL9E/kfC1K3nsO3w0/vPAp/KWxxSQfdTzaSEfqnSF6f3IkD6
 uLacQwE6dGZyS1SGrlQexTuGR76TPiEzFEOWu4lkVFKyHiNnnZ4rtz/GWz+Voy3vtjXwUeY57aE
 evS4qBVzjgzYnIkeGy0C90SLCxnSWYHpj1l5pMkNPQOCZlJZLfLXQu2jzf2BkljduAfzrfcoBOo
 o2nUJ+aThGUX1eCc0YdiBhrNIi4MW8oRpqoOK+zDYXUgViFFsLdVHl5D6gq3dlLJWocD9sGMaZy
 3yZcsuziUi+1rPQFaiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfXw5WIdBxod65P
 NDve2NWNNyOwJrkh+32ETcPB1/yB7tsygkKam1C1ZHDnB/3rpc0Rob7imIJvPZJzqb7ql/SZvMI
 Czgf3GxC1yIIQ+rgcu8cGVwWmRbx9Ls=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a59fcf8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hbrWYzUuUx-UyiL5C5EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: TpxUG4wz2aL_SqNTlvfwZ-z7b9JH3R3d
X-Proofpoint-ORIG-GUID: TpxUG4wz2aL_SqNTlvfwZ-z7b9JH3R3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_025921_951113_9295B3D1 
X-CRM114-Status: GOOD (  18.31  )
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

On 7/13/26 9:47 PM, Akhil P Oommen wrote:
> On 7/6/2026 4:38 PM, Konrad Dybcio wrote:
>> On 7/6/26 1:07 PM, Konrad Dybcio wrote:
>>> On 7/5/26 10:14 AM, Akhil P Oommen wrote:
>>>> From: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>
>>>> Add the nodes to describe the GPU SMMU.
>>>>
>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/eliza.dtsi | 38 +++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 38 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
>>>> index c5635f22e2a7..e5b8377e6c3a 100644
>>>> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
>>>> @@ -2674,6 +2674,44 @@ mdss_dp0_out: endpoint {
>>>>  			};
>>>>  		};
>>>>  
>>>> +		adreno_smmu: iommu@3da0000 {
>>>> +			compatible = "qcom,eliza-smmu-500", "qcom,adreno-smmu",
>>>> +				     "qcom,smmu-500", "arm,mmu-500";
>>>> +			reg = <0x0 0x03da0000 0x0 0x40000>;
>>>> +			#iommu-cells = <2>;
>>>> +			#global-interrupts = <1>;
>>>> +			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
>>>
>>> 674 is the correct globla
>>
>> (modulo the issue i explained below)
>>
>> [...]
>>
>>> This list is not quite correct. It must be sorted by the context index,
>>> to which a given interrupt corresponds to - the driver relies on that
>>> to give you information about where a context fault happens
>>>
>>> Moreover, I see that the interrupt sheet has the bug where some
>>> interrupts are offset by 32 from the base vector, and others are offset
>>> by 31 (i.e. the SPI number doesn't equal irq vector - 32) - please find
>>> out which mapping is correct with the right folks
> 
> I reviewed this and looks correct to me. Also, this matches the
> downstream configuration. Did you confuse with Dest Port vs Vector ID in
> the documentation?

What I'm trying to say is that the documentation is confusing, we've had
that issue in the past on other platforms. If you see that the correct
irqs are firing, it's fine

Konrad

