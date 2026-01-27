Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC798D2D8E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vfcCrO11hLSQ7AmKAqjdnGN/XAneF5vhpmb7O0mZ9M=; b=uI2oGixMtBx3aCQPfpkuSWe/5v
	HV22xK1oX8b5gV8ixnlz0+NP57zlK5ozK+Lx8ziDymU1cV0LMNaoZUetS6lA99t6PpIALD787yMJd
	fcVHPj2W353HbxNJADwua1XTt+epgqCl9KxevLpw1OxwsZ74VwvKb872jgcEIATJbSVefKf21ruhK
	rmdHe+HJevvz8cza+SxXMncjIv60zTo5GWnwgFkxl/tEq/U9j0KLJQZzRq0I3XAGUAVF8TAGoKmQh
	e+7BOcUALTs4DR3Ax11Bl4us9oIKqBcF01QVlzcVbh8onuKyP8lQATzxQCmoJT50S7+RIeTmvbsnb
	kGcWyMXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgN2-0000000E3m6-0C3e;
	Tue, 27 Jan 2026 10:32:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgN0-0000000E3lY-2NB7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:32:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4UDa43714705
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4vfcCrO11hLSQ7AmKAqjdnGN/XAneF5vhpmb7O0mZ9M=; b=dtyHl2EwYjnSGDY1
	op/tKu0f6EGKlGwMX2zTNgOpJN+h7S2fQ+dbx8V0D63kzEtWu2lw6b/Ur15voN2p
	fnR9iQRBpxtyJdBhp/yBH6jKrcQADNKb8Zzthnasim/1cOc/af9dZnQwcHCEGMzB
	ZA5Bq5QauM3GedKd49IuVwa6kO9hNb3O55I6eBKxYvfQPko3y2KCYvCetTwVWXvK
	Htc+HbtDyas8jhDN5pzDOxF0YefYXGF0zn7ZWMk7RKYIApVqfUcoAb+54OHfvmk7
	pRSqkQmi7adqrBPG/CWSRQuwac+Fk4yqM6iB0VAvFwKBURZVvifSDbDeL2eKJ0dI
	QQiL3g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv0an06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:32:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c69fd0a87bso555216585a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 02:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769509945; x=1770114745; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4vfcCrO11hLSQ7AmKAqjdnGN/XAneF5vhpmb7O0mZ9M=;
        b=A4so5j1mz6QBEV0RDcDHb6J2oNBV6Cs2RmA9crDFiQ1G3UHB3E+ga6lv1k0obHYphR
         3/cDd6kM7ak535W11YGIxO0qOzZ729g9fCZIZMJ5VYBOIKGXEi6cpfyI70l6WhoR2rtb
         qNOrofBvznY/prHc3o+JlSobOpGTq+1mLab9X497HI5bt/Qt4/vPq6TQIeT8DKgbUQtJ
         EjkkZWRIzGokurrgHAv8hdLRy+ZKPe3EzCLCDxu1DaBLZlyX/I5fSAKpvQo/jI+PfNmm
         hOEfFLl8JtOEPb3IU+o+oPHFYbqCvaPR2DovjgOELYvs15I2Cpwo8SMI70wwQPydp86O
         giPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769509945; x=1770114745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vfcCrO11hLSQ7AmKAqjdnGN/XAneF5vhpmb7O0mZ9M=;
        b=S9/Iu/bqCskMd1EBln25Nyp8+mufn0LnVKqykviIMSqtC3hbHLhWJB8C3P7YLChHF8
         C6RGvI9ERJO4MsWyA5pHNGr2rtF1S7A7lNwzU0/lgZNzpTOXoGSsZT7ffN8BNRNdTJLB
         yCnaPEZf7A0J2R04dUzJ3CtfGORC2ZecajwehPbYaobPAmSj0u1QFWuBBijZk2lIbV83
         LxGoUU4aaLCAceWb8VT+r/PEb9nTVDncCcS74WAtZgHQffpEE+eSa+bkk6Hij5LzLahg
         S6e5pZRziy7+gqnaUiacTEkccEmJVTusaO3Q2q+Y/R/v1AxeOE+Yo86E6m8/fVom1Y+s
         LPcA==
X-Forwarded-Encrypted: i=1; AJvYcCUzUHwLqkEVhYuDdufD1rfpCKf5rwQFncxQoh2ZKYkiGMhGYeoBGgD9qFNMcO8BvmIt1fzwAp29KJ77vHCB++rL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2FLDxvfiyNBoRDa0ps0HpHbddfvzJy2N1GSPCUwdrLLvyzLFJ
	cMLoRWP52wfIH5VLwDJLNZ4mveymfmczHAThJxHStS6/IcEkwxze3LYiArMY9LhvjUAWbuX7mrv
	j5fzLgGYogBiSUzaeh3epNx6l7/IZkJd++eyggHbeUp7URnxF0UJ4yvvW6LpjUyyGxr9IeERDbp
	OwWg==
X-Gm-Gg: AZuq6aJ30jKHCwb30CroZI+ea4YYEAW1RdgfhUKRfLc2VaZyOBy8Y2GWFlHB1/Jc0Qs
	a7IGqg95wzTHfSVnfapicrTQNWqGtJ8miXdzjUF94etBAeOMrX169MOxOIvxJunvVFB2g1FcNou
	yLLUNNo9sK8fNb12PYUANahQ3FdMjPJW0Spc4vsTSCyN84gCSpP7Lx25j/gEHd63JIOSihBxobm
	68POPff97yt6SZKRyIGjn39NekTK1FJl4ibLcFMuiP2UHdF3iXB25gcOEiShqY+Te1A0AjZJmwV
	Lvmsv1pZsdUVTnWetAlA25JDzVL2kAabsTZ14emCdlix5DBvjWDVeVnh+zNflHSGlNW7H+o7dX9
	7qZaz/Hdpw7mSG3ReytsdlFtQtCtBN5AI1lS+ZPY2lyQS00D/z34ygPKwyh0y9AAqvJc=
X-Received: by 2002:a05:620a:3199:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8c70b91afdemr91632085a.3.1769509944812;
        Tue, 27 Jan 2026 02:32:24 -0800 (PST)
X-Received: by 2002:a05:620a:3199:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8c70b91afdemr91629685a.3.1769509944389;
        Tue, 27 Jan 2026 02:32:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b6ff080sm742606766b.38.2026.01.27.02.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 02:32:23 -0800 (PST)
Message-ID: <18099460-bd1b-433f-b700-1cdac65273e8@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 11:32:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/7] qcom-tgu: Add support to configure next action
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-6-songwei.chai@oss.qualcomm.com>
 <f211054c-ecb7-4f90-b9ce-9fdd7710c8c4@oss.qualcomm.com>
 <c1efbad6-4ea6-4261-b7b0-7cb8081ecfb1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c1efbad6-4ea6-4261-b7b0-7cb8081ecfb1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wcPF0DHtWEdl1Uo5lTj6QVMU2aiSVxER
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=69789439 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8YFCAo1tzF019N3mk9oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: wcPF0DHtWEdl1Uo5lTj6QVMU2aiSVxER
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4NSBTYWx0ZWRfXx4ifgOsMO48L
 CgANALgRe+lDNPc/XWPLm6MFYw1e9h6vh5aSiij6we8md6sKjBvfEPser1xmZCdRgOI4SzKy36/
 46Vsb6c8A8LCIrs/WpuyrhRqM/uM0KbLLmrlCR6+T+0BuD4DTKSo7PlkkeT4ogQu9Sh9a4lkITz
 DlXTNax5P8l7iq6Ag6V5U0oElNJVpc5brR4VFb6OPAP38CaKSYoDpy1ZFhjOh9SXxCfKQGZ2KMD
 sLsbClt9gCKDr9GNq77Wb7+9qk1LpbYvDOIUFxbIyRhngI+uZutenKiiil14LdLbJl3aXHjeV/Z
 zqrziPKTRev0R3FLMKiYXfqSJ0VFQSHN5PvbDtzgAg4Qh2pYjBFO8ZQbDpD2oTh5X3L5LkCpnU7
 aEZG5nzCq3xLl5wQvmLm3lcN708gpOROI4RFjS8PHwJJjaNAvGWlTjXyNqbDMjZNrZWJ4XkQj9m
 tqL6kWk0IowTgJg/QxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_023226_724991_3D7871E1 
X-CRM114-Status: GOOD (  14.87  )
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

On 1/27/26 3:43 AM, Songwei Chai wrote:
> 
> 
> On 1/13/2026 7:15 PM, Konrad Dybcio wrote:
>> On 1/9/26 3:11 AM, Songwei Chai wrote:
>>> Add "select" node for each step to determine if another step is taken,
>>> trigger(s) are generated, counters/timers incremented/decremented, etc.
>>>
>>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>>> ---

[...]

>>> +    select = devm_kzalloc(dev, select_size, GFP_KERNEL);
>>> +
>>> +    if (!select)
>>
>> stray \n
> Will improve this based on the comments above.
>>
>>> +        return -ENOMEM;
>>> +
>>> +    drvdata->value_table->condition_select = select;
>>
>> I don't see a need for an intemediate variable here
> 
> This was done intentionally, following the earlier suggestion in v9 to
> introduce named intermediate variables for better readability when dealing with allocations.
> 
> I’m happy to inline the allocation if you prefer the simpler form here.

I don't mind that much

Konrad

