Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BD6C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ZGn09uCQecSpHGhjI37UCupzc36L0CgFZmzAcMQoKM=; b=lEfN/RsxFEXEbqbtlV54OtHlAO
	bZqj2Lqe8wCrKc5Jud546OYWfCrJkFxeqeiV4x2kbD1l7rcIR3apRym+lJi2Z84CH2Re2s3bnY1HB
	Fdp0DOjmw5RqTiRDHbFXYs2CbjBmRDrH6iSfz58OfKfAfHzQfrm+LJQcd5AMRr7wch31nhuCbwCdT
	mESn4CkKbhW21xuyIYjUYaw7JoRnJEyY2ysSRWhlFdZ+S66WWqw+us9KsofgsqUa/mBgfIyRh7UC4
	bgIlaBn+OMQhjmWWxLEtp2QLvW329Q6mp0LrOnMwMiQE2C/KygJ/m3GUUHkCtJuXPX7Rrw05N5sPI
	o1IHJO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdUC-00000004QBL-1jlz;
	Thu, 27 Aug 2026 17:01:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdU9-00000004Q9x-0raE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:01:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbm9V058825
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ZGn09uCQecSpHGhjI37UCupzc36L0CgFZmzAcMQoKM=; b=jecm9R016Au4SOfa
	9DHqvLJPactOk7aQdK/C4SVlQIDFnr46AJq3kT1lRpuuzEuEStjSDhuWZmBgFhwz
	+tgf26c9sVpNxGmxBxVJKgPo8eW8YRfojy/11FRy9/tXbIUvFT1TfgQ4KI2g3dio
	U/qubr+FLspGfIB0dJYsqmwmjLn+q2pPEB5ISe67RM2QzunWZDMDi+jnlzc7hGIH
	vBhKrjHxmmNe63U6F8+esRq4NhYizZhKei7/m+4Ujojc7EZ7NDs7M5w7jdR5CEPh
	yVwGzKt9J5X8o3P1gx6ZSVuO8ThEdUAk+MeKeJl9E8tazr0mt+TLc3A1As2Jakl0
	MWu9Bg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gak561hr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:01:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8544b721ce9so250800b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787850111; x=1788454911; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZGn09uCQecSpHGhjI37UCupzc36L0CgFZmzAcMQoKM=;
        b=VAnBzXS0ha9jX2KCx00Ea+yNjUmkPcoOJkvfKQFmOV4/4PpaZ+i2PFmc+5f+nKLzgm
         dCoMQIWjWL2Nhz0wddfyn6XcMj5a+H1Ww3eF75Gp4Ak+NmZM9p4XrWthd2J9GJb/hhHd
         CJQNQ4gHxa+0tj3Ed8Z3CNquryTTp7FEv4ENL6KiP2hxHyDNsr3W8xsg7nirgjzpKRyf
         fbVgh7iZeCZi6zNYBhzBkIdBA0CJslLJtfiN/A3VeY1CzmdN80Ds9TLs5WfXCeDphPyV
         c7NTyftjhm8/f5tT9+dz4b8niCnZBUxQkSB2vmSJZ5vM9S75KzI/BPyi7mKS6uRp1If3
         Mb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787850111; x=1788454911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZGn09uCQecSpHGhjI37UCupzc36L0CgFZmzAcMQoKM=;
        b=EsjKc1CSsn1jmLorN5aC2ie4uVbTRPnHIibHgqQ7vdXZMxOj5ivEnJGpBfCI1mu45Q
         BwJh5EzuRtY60oWVI6cJaxLgxpRWVVyj04DU1H+4I8NdSavEbodAlP4ZbHSkKt+LT/7w
         xFucwzfodL+3LPNlmCgryx75rBnOa7D4qsb6hjBgCA+Fr3O82fiNScTaRlVA6xZeoNbi
         RRi/Z6a+kz+Ty6jACd6lk4PgWSxwnJZBxv3YC8xkv7WTtr6l0BJEBCe4+g6MhnV8HVsO
         v9gibnjTEbyw2rb+PjdUOVkJukS3huuLrpADfIJ5yTGJVfoJb63dq009GPRcGokq53/a
         FWRg==
X-Forwarded-Encrypted: i=1; AHgh+RoJNH1hAEGsnTdH3PNEWpM00BduCb0znoGx78jt4XR6FWYNuEJqCjBQUv7TjCezpT1tOuIOWcXnrV+IJy3FNs8b@lists.infradead.org
X-Gm-Message-State: AFuF++lFiMQV36XQ9vpnunkYnMmje92UOEyihKhup96BSM5PvdMC/G5v
	J8dRQs7WEg6T0zxZwsVHK7A9llr/XaN/HJ0MfTs0vgC2n0UMJoMBN8tqXxOuF+nELG3F2q9Fg7S
	pVums7aWSt+94lOWAv+9CBwf2Jh3kWbUkIu+bFtBoQCEOCprNqcTXHRKMuhqCrqILRkm8pky/XS
	2B3A==
X-Gm-Gg: AR+sD12JL2eWjt9VI84GBrbCGxtGtgPLxU0qhSXIXb7G80+itpkBVGtn4brdJygcpgd
	nBqOtpyvgECzJ6COFDRfxKUWwjvgnvShBX1sD3Eyo1pnFabtknGHyFAlHKrxlyMq0j6g6LLdGtL
	xKIO6yx4/QBuG8yRkxob51Kf4h8npHtOSflEQgU0lkaKSMjIuLzGR6Rvx3C1EgruzebsnuGE0r3
	gNoR6j4jRe0ZdisQWGiVeSVKrdXYIAqqmX0NNqSlWhO2OLs2uw9ccx1rtvXBG6InNe4agTQ55+r
	Zoitvu8HXFIcCgGGrZwCtOtnhSyQ1UxHbjJSr78PYmjIJvjpWI/H9g18F2NbD6O7HwuO5+Snk3x
	SWGav1HG51qYwxq+j8m+K41gs89MZY+w=
X-Received: by 2002:a05:6a00:4b41:b0:847:9aa8:d3bb with SMTP id d2e1a72fcca58-8562953f64dmr1115446b3a.12.1787850109621;
        Thu, 27 Aug 2026 10:01:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b41:b0:847:9aa8:d3bb with SMTP id d2e1a72fcca58-8562953f64dmr1115017b3a.12.1787850107481;
        Thu, 27 Aug 2026 10:01:47 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535cd81d22sm2404824b3a.35.2026.08.27.10.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 10:01:47 -0700 (PDT)
Message-ID: <4466c3eb-4de1-4240-8fec-765a4910b217@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:31:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-6-196e2b306368@oss.qualcomm.com>
 <20260827-predictable-mauve-catfish-3d5ad0@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260827-predictable-mauve-catfish-3d5ad0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0NCBTYWx0ZWRfX7Vz5LYTTL3Iv
 8VRjthY8/cP0lf74YMdukoKeVnWBE5v1iaq7sndmTZqHOWFGCdWP3GoDzDSVI1SInvNfc0JIY63
 B3+zycfy1oYIXJ+1zHuZW+I8VOp2RuI=
X-Proofpoint-ORIG-GUID: kCkzttIHxRUc42AftN4T84eVXSfo_W6A
X-Proofpoint-GUID: kCkzttIHxRUc42AftN4T84eVXSfo_W6A
X-Authority-Analysis: v=2.4 cv=G+Ms1dk5 c=1 sm=1 tr=0 ts=6a906d80 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=WTDSa4fX56zQulHxy5BIwg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XeEooGCi7Zy1lAdgIjAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0NCBTYWx0ZWRfX07z7V1H5WON4
 pa2y1svsovv1IFH181ORnSbWWky4Ryt49KO1ERoG2ZRuVe4RVtHVW/6pZsKDOwG23nHFVeilMOM
 W7vW4LUjwRJbIY/ShfMB8r+yMeGwYWsFhk2ehMK3JCNavOxC1O0xXt3gr+78QJLGaDWxuhBV6nK
 hIt7QGf3yLSnGP+cbqtvR7scx24I/04NDwursEgpwGtFHlsf6hjPnvExdowUnLR2UwmO5qmvjLj
 tppsQb6o44WlJtxBHECHbaQPzdlXSJKfZTDzidcXQNUF5E8wrHkn4HU9oshDeABDL1t+WNkw9Bo
 1qZ8NDFGFxRUpOufEYHDFeAYG+pspL5VCfAHyA4lwhPzAPKL4sN/JAKZ9XF82qMaiNFYzC/+imv
 OHGKgnXwiPADDRYS0vI0/mGMMRBjldKfk3VoXcCw2kQHjmjwwzDLmayC92k3mbTfNYqaQw9hj32
 bRQ9rITkQ4RrUHBMsWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_100153_374067_9BECC2B2 
X-CRM114-Status: GOOD (  15.07  )
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


On 8/27/2026 5:50 PM, Krzysztof Kozlowski wrote:
> On Fri, Aug 21, 2026 at 09:38:59PM +0530, Hardeep Sharma wrote:
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,kuno-aggre-noc
>> +      - qcom,kuno-clk-virt
>> +      - qcom,kuno-cnoc-main
>> +      - qcom,kuno-dc-noc
>> +      - qcom,kuno-mc-virt
>> +      - qcom,kuno-mem-noc
>> +      - qcom,kuno-pcie-anoc
>> +      - qcom,kuno-system-noc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
> Missing minItems. I asked to open other bindings to see how this is
> done. So for example you took qcom,maili-rpmh.yaml. What do you see
> there but you do not see here?
>
> Best regards,
> Krzysztof
Apologies!!

You're right, minItems was missing. Fixed in v4 by adding it to the 
clocks property.

v4 : 
https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/ 


Best Wishes
Hardeep Sharma



