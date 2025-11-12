Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98230CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 14:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTbuJi3FxUPkkWHKpmQ79xCiSdbgLHZBGK2oKYcauJw=; b=GblZD6VgaOZ5jUW+BdGdW/W4Us
	Ku3paTXYQ9VISBrwTRUVVRxUmBxfG1H3iljVPIwzFv6pCdxCkGnAxZmhq7LPVcVRh7HvM/KSSvBVK
	WkdEoP6HuLnUqg7UwlOq8T+2qUz+f2lMlUMLx59ehi/pgmfKH+Rh/nHZU9hJD1TqujgucVwObZPLs
	nC+1Bw5c69yfZAQIF+V78dMaHFltborbaQwobyf9q+tlI0tlecr+cafllVeUvueq2upoNYGsoIMt9
	GZF0b/KfFQQB/k+xGlkoq0IZC3Jwp5Wi5zck2owRjnUIj5W4NHtWuZsicYHmUgI8KfpAhrzwnf1RY
	gCt5nNoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBcy-00000008uil-0VXR;
	Wed, 12 Nov 2025 14:15:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBcv-00000008uiN-3MhD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 14:15:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACB9I0L3060096
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 14:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTbuJi3FxUPkkWHKpmQ79xCiSdbgLHZBGK2oKYcauJw=; b=hlG5U3TohjmX4ClM
	fRmUhB+jeUucmH3r8qCOseKTaySRZtmTOBvAGRJ4JW6aHkxhslDqAh1XYSiSVsFJ
	po5HZYh5AADDR6Z4WO7Axr5BsWoJ2VyhTuSAHY/9YiM+SdG/rmVza0f8IFvAG+bh
	3l0iqhR8p1IxpWG2ZXDKCMp0KvZlpQOzvbUdyg5h0TcKoIF746oQCeM7MPK7aVuh
	+UJdwm2fheTdiC/BuI8kT5Na7lwwmJ0fEVvoZq3XER3k65xnr6iIyjFWuT3peoJr
	CNgR/jZ2qMG/34Ij/Zk0TVSaKhq1legtEY2LqbVeV6oJfFKz4OzDIkfy1zz6R1ET
	6nMgFQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac988kbej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 14:15:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3409a379571so339273a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 06:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762956911; x=1763561711; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aTbuJi3FxUPkkWHKpmQ79xCiSdbgLHZBGK2oKYcauJw=;
        b=ECBwIC4dPGvWBOMDQTmlVHNTf6q4RDbao4cRQp9lBsgB97v2cuEDRYYyx2xh7G4w4b
         iXxES1m+h43vl+bszOSWs4xeOpU95mVT+fwYn9zv/VeDBVrgVVKAm/sxlbQbJkNQ9yfH
         mfH+phmOWD6/tCjemwUtBgXGh03iUH5xPtcL0reUSovAzDRpGJa1pfU8zNCRal0Y+DYf
         WOTQAbPlsq9phzPy3tDbqoxF81k7tk4ox9QOnN32kt9ZLvokmSc0eWobedg5FpBWCHhj
         panqkONQ99LWTCtfjqxY8AAT5CvCogbC6lzd/a5ZH7yf8yB1WWfOkFAxg8FEpc2mwGft
         nwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762956911; x=1763561711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTbuJi3FxUPkkWHKpmQ79xCiSdbgLHZBGK2oKYcauJw=;
        b=F5ciE8kiIwdBxWkhPJ7QABDgzMyQbFy83nr7cEFQzYVIyTTN/oflSqwEHMShtcStiZ
         kxNUUXJWhekawYmz8kBvN6lBCa2FPJG/1rPF6oS8K2kUyXYJLFQMcZv8HCUJ9iLys1dR
         EGsImy0Zsia0NiXDL8F62LKBOW1C4ngaue4uIfl664sVvqm3NIFJxB7eu/eQqE5Pn3DN
         Qrv3zD7Jvl6Aeohp84YL3fvEccfNnaZ1/tF9QJSUmyKhd4fJwOC8Hku/IrKrK5AJUXQk
         qL65RhFVdnQiNQ9f7FPXBMHQdbfdgrdZbY6F55SfXo2emmQFOHPGXqnMx+UycAfedQd8
         2L+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVvD83bUoSAsrY6O5BOt5f0Acf5o6wtEL5RUUQk/aqFseKuhSTvMnGuAwd5+qHyezSWSJTS8Qv5HS9TBzOPzCP@lists.infradead.org
X-Gm-Message-State: AOJu0YzcPTuQgRbh3ObxS5Cp27fa6J1KF0Y1NWpdRKH8eLd2E2WPNQ/J
	C+AleWNPa++i+TAAJA1cL/2LBtTrPXle5rmS0hYgdwVEDMg7ukQfhpw78k8rm3P09k9BofcmE0c
	edWdKLTXmRy6eZqVpNHe6xz/trxKNt6aBeOxwqSZXQx0MCyEe2wuiMmRTPeYKaUuSXUdAoq07aW
	S+mA==
X-Gm-Gg: ASbGncvIgI6MxWCzC6POECPA+ya3B/+ezRVGNXFyIT2cVrdzVrnXKzPq3xHM4roX/qT
	TAfKpbCOT3YoABYhE4Z2u9f+3HoGUFzB6l4gdrZXT1H7tqTjJsdjTD+dAYNys4Xeph/PycugY0x
	95G1QH8L9I9Fbjj6vInd+dUv958WuC2c0bUC9WIDbLZjebsV83dcmKHcpjoEVwG+pxYmx9pIkqz
	Qf6mvU3S4OQ0Pzb91Myggs7dBLmsxO8JR1xRdAtzPs8wZXOl1tzvToAJK9fHYpGXkPCN+FcuLer
	mEvzpb2lMzzqoND7S9atBM7ArwOaIyeuzP0hnSxP+3X/qzf4df65kz/s2f1ZEtbbMcCuMqN7X0B
	KIVGnLnQb59fnTjSC2cQX4xqVms+cHAcZ0UD0nDmoOBkqYVe1mnGEhsdu
X-Received: by 2002:a05:6122:3714:b0:559:ef6d:b3fa with SMTP id 71dfb90a1353d-559ef6dceeemr260926e0c.3.1762956177647;
        Wed, 12 Nov 2025 06:02:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDhrwzbfO9vyPZvREpumsSUOwwsoGszLlpvZhnJmg8bsJRAFxwMnbB6qzgmnQ6CjNSL43L9Q==
X-Received: by 2002:a05:6122:3714:b0:559:ef6d:b3fa with SMTP id 71dfb90a1353d-559ef6dceeemr260791e0c.3.1762956175682;
        Wed, 12 Nov 2025 06:02:55 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f86e9d7sm15873200a12.36.2025.11.12.06.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 06:02:54 -0800 (PST)
Message-ID: <02d7c0a9-0d24-4fd8-980a-da9d7307588a@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 15:02:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: add actlr settings for mdss and fastrpc
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, dmitry.baryshkov@oss.qualcomm.com
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bibek.patro@oss.qualcomm.com
References: <20251105075307.1658329-1-charan.kalla@oss.qualcomm.com>
 <eb596f7a-e13b-4edd-8ee7-05424ea3d9e5@oss.qualcomm.com>
 <c4b1df46-e4b6-4d95-971c-7aaf33bd35f1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c4b1df46-e4b6-4d95-971c-7aaf33bd35f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OvsgCinqVh51k1AB6s9YLzF14cGTZSvL
X-Authority-Analysis: v=2.4 cv=eO4eTXp1 c=1 sm=1 tr=0 ts=69149670 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COuKgFje69h7aUJomk8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExNSBTYWx0ZWRfXyQyPHgL+OAJU
 ImRJMUqO2E87VCj0Aepk89Ag8jlT+v4RjaSJZFIuBZHf5YyfdgSGQWJQkXomhwZJr9Z6ZEfssIA
 lgb9xg3FJxDfDlZmVMUKgmY1BdEnfCDgHl0Po4/p7uvHubtcilo0/Ozpfop9Fj2aDjLOYb5NvgJ
 0S1Qa1FiDFecwTpayrWLrAuY/1yCWEd92PMm5jN9FzzTIuuW1qRGvHTjxNEHNhR5kPk+66F/6NF
 eJjzwRFPx0Dm34ygKK/X6WFOzQTaiZUPIJlpW/XgrUmpfbaTNJpZMTBzINZOMDSHNTR9eG83Zok
 cRfQYpszhCkDCQPziqkJvg8PVbqn/VtUPx1g4JfqYDKAAyTJdsrPedK/2ZTZeKhgDbEG/s7/glM
 9928q6OtQKw+tDbyvP6x/0q4Qhh1PA==
X-Proofpoint-ORIG-GUID: OvsgCinqVh51k1AB6s9YLzF14cGTZSvL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_061513_976991_BDB6ACB2 
X-CRM114-Status: GOOD (  18.87  )
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

On 11/11/25 3:02 PM, Charan Teja Kalla wrote:
> 
> 
> On 11/5/2025 2:44 PM, Konrad Dybcio wrote:
>>> +	{ .compatible = "qcom,fastrpc-compute-cb",
>>> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>> This will be globally applied to all smmu-v2 targets with fastrpc,
>> starting from MSM8996 ending at Kaanapali and everything inbetween
>>
>> Are these settings always valid?
> Oops, you are correct...this settings are not always applicable it seems.
> 
> Example: lpass compute and cdsp compute node uses the
> "qcom,fastrpc-compute-cb", but it is for the later that ACTLR settings
> are valid.
> 
> Then for these cases, should we be extending the actlr match array with
> additional compatible string and then add them in all the device nodes
> that require actlr setting? example:
> 
> @@ -3119,7 +3119,8 @@ fastrpc {
>       compute-cb@1 {
> -         compatible = "qcom,fastrpc-compute-cb";
> +         compatible = "qcom,fastrpc-compute-cb",
> +                      "qcom,fastrpc-compute-cb-actlr";

dt-bindings (and especially compatible strings) must not be altered solely
to work around a driver being suboptimal

But because you reported that these settings can change both between
platforms and instances of the same devices on these platforms, we could
possibly reconsider adding ACTRL settings to the consumer device nodes
where they stray away from the otherwise seemingly reasonable baseline
we have in the driver so far..

Or we could introduce some more bespoke matching logic.

I would like to know more about the scope of this issue, i.e. the matrix
of (soc, device, actlr_val) that needs special handling.

Konrad

