Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60000C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxyeOcoLjC3T2xwCWZvRjoeExdTH0SjUCC/Y0ERYeNQ=; b=dNBK5Vnq0gpNfuo5zxztcfqt6N
	Jy+FQn4GvoslxjNi7eyIW0Z5+RQgB/kAWs8NydavTD+7jQ1bk40r7PUuXOwGb+MzX9ztZArBjV4Jf
	Rmsr55kvXnGZxfq/1g1rofub5PZiG4v0Af7lP0p3XBLahECIFamH+9j0/jWtGMeB8Y31SV+GmPiYN
	2K9/MmpSXLaHNvaUv/OwYEZjKTCZ1xr/AGT0Q0TgGuPJvR5ydFTwcOf0TcF+hwRbnkT0y9l6osDQv
	h3U5OCm86012DKoYZbUzXc3PzsWwtf6LNyQ0YrVVrXcoV0nOKXIzz2dthGZd9wjHmj1vGQDJqVJBi
	x6SsPWHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREaW-00000005EXr-3lHL;
	Mon, 16 Jun 2025 18:29:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRD0d-000000053HF-0v1E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 16:48:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GEPmd8016919
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 16:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lxyeOcoLjC3T2xwCWZvRjoeExdTH0SjUCC/Y0ERYeNQ=; b=d5Xd7REYM3S9gnS5
	n7bYGFpFbiw+1+kJ2EqZbnWEMgfB2xuele5T5Pwm9aKsDRA78/EKtOy0F2QNTYzT
	KJvLT7ey6fAz3mjnpAWR432o8QADvN+IEnRwpM9Yj6bc0Ge8sjvzz0ZWiAwbFZTq
	nSepVk6eUNbh2ajDno4AWOc80XhTQlCWJcNa+Xm0CfPGPAoe58ojfQ9t2H2KbETZ
	z7mYYqFgR+aN0ahVuhbD8tNmbaw4ythr6pL1F0kGDSq4MFutDxLYRwjZC/QWS+ot
	Q/wBmVMGl0R5Qzntex2p8lKoFoNZds64/OuZsZjde6FVoaFAvIo75Ja0bP5wgTr2
	Mlo+Yg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928md7jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 16:48:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2ede156ec4so5871054a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 09:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750092512; x=1750697312;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lxyeOcoLjC3T2xwCWZvRjoeExdTH0SjUCC/Y0ERYeNQ=;
        b=mZS35vvXFw0F2lxzNWVxB8smY/N2DYF/n+4kZnwR2IUzmXhMZbFxhlzEKOuhGb/3JE
         xJMF0ls8HDiU50bq1j2NksojPFXBy0w63fo07ia9kPDLoruuFZgQcyF/R9NpZ6VT6IRg
         MP83i37ZZEXOlwDgQ2WTx7g3g+6wZPAY8Hn/AzzTIGAUkmzR7eyxkK5Q8DqblLcgirWV
         /6VYed84sgAFTnD5CD0LU9fbMKvqI9XYmlyc1lzG7HzGa5lVv4AnWIUBhWB3RS0I+0+7
         PUJZOQ9wLEkYD4itNmxoOuhkZku8DdWf5OdBgO6gvYCG3Ti3r7cGk2gS7s/CoVQAoIQn
         SO7Q==
X-Gm-Message-State: AOJu0YyvLbFd2jfXFoFBUWnJEF+HmPIu8L70ePiqWYVdRsrXeexCJV9r
	dEQX70Tt/Mt7EHQRoQLGy13keLaL18uT01sSHpkxdJQoit1vc56mzAakez8cWGjkcImGBiCSb8d
	OFeW7CJc42nTY0I9UUndWfqMqjkr6BaNarK9MhLuI4BkXW1eBwCBOTfsHuBVMfekT3pOZXk7EdZ
	ndkw==
X-Gm-Gg: ASbGnctbfwBmJYkgcICVLjYGgNrjjGgDh9FtSZmCiRlno6QIjtk2XLW6GN0tVEVJ6Fb
	iLgCq/GG8y2/aLPEPmM1kOFu8gucxpibKzfK6sjygALSKPg4OVNSJXRlLFPPrisv+VvfwyWywmM
	jQZ10fEI8ESGy8uRyLT4qjRyBgb2FgSUGn95ulNZI6sNIOB+D5qPGfPTsQ4iIcj/YvpuWCctbG1
	sASSR4Lf8D7FllxOGr3huDQRh3mFH61+ZJzRx3SY0oN3B3PypO7uOqYn2HDoGID8Mt5hMwtPADq
	6h2X0YUv12ZZT1/Yb5Pzl4jrxn/182NtMYswKHMWHA==
X-Received: by 2002:a05:6a21:318c:b0:215:d611:5d9b with SMTP id adf61e73a8af0-21fbd4bbd5fmr14908419637.12.1750092512624;
        Mon, 16 Jun 2025 09:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiRsfJISsTnkxLW8qZGNZNt7p0Rfn9bVYWR0l8aBesdxG90+o4bb4c6x4zbi0HdUx7zVZcJw==
X-Received: by 2002:a05:6a21:318c:b0:215:d611:5d9b with SMTP id adf61e73a8af0-21fbd4bbd5fmr14908365637.12.1750092512245;
        Mon, 16 Jun 2025 09:48:32 -0700 (PDT)
Received: from [10.206.104.82] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1680454sm6019135a12.37.2025.06.16.09.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 09:48:31 -0700 (PDT)
Message-ID: <31c50188-986a-44e8-8765-c1fce6ad3c2c@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 22:18:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: opp: adreno: Update regex of OPP
 entry
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <20250611-x1p-adreno-v2-1-5074907bebbd@oss.qualcomm.com>
 <492417fe-c086-4980-b108-0487bad08155@kernel.org>
 <d482653e-5c0e-4b03-98d6-2c898b445917@quicinc.com>
 <750da319-d25f-454d-b376-ebbc194e0e41@kernel.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <750da319-d25f-454d-b376-ebbc194e0e41@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDExMSBTYWx0ZWRfX5CpZ+bdsOhx+
 tHXINnVTS3bk4pSj2YWNcNm3YD/o6y0ZqDVPpLSCjY0LZ3RRmgJB/QVZAt1e7j/eV+h8F8wIPhb
 riSmU3xF8Cmi8e/M0myIrtrWavEkRDYcfJKEpwhr1tf6lknvLk4nbK2ffG3qa8iG0bb6uy+M+il
 DrlnekQm2dt506fmCP9JA+khm8F9ga8ep/mCcX8OwIgV/eUXIT1OfwNEzbwiZUlIk+c4Gb6xkzk
 UEtiP9mA9L5iwqIAJXkuvfnZWfb5iF7xoymCMlJy/lwFXfqUvnhB6MVXO2HeXjK67H/TLUCfN0s
 RAr91sW2eoZ8FlpBo4YMi6JUA80uBJ/pk++fEnZcjsx3NOhWNh/8GIw++4pkp3pJvtDfI7u6JkO
 pjosB2cczgcpzPzNH73NqKkabX++IVuv4v2N2x4b9jqY92OPHDdrKYzjDoolEumJqLVQt8Xu
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=68504ae1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=DDAlTcr3_WI9VELS8V8A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: ZXIhRv5ZW8dY9wwiU22ifL89f2G2U9Tq
X-Proofpoint-ORIG-GUID: ZXIhRv5ZW8dY9wwiU22ifL89f2G2U9Tq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_094835_264379_74B982F3 
X-CRM114-Status: GOOD (  14.97  )
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

On 6/12/2025 4:59 PM, Krzysztof Kozlowski wrote:
> On 11/06/2025 14:24, Akhil P Oommen wrote:
>>>>  
>>>>  patternProperties:
>>>> -  '^opp-[0-9]+$':
>>>> +  '^opp(-?[0-9]+)*$':
>>>
>>> Not correct regex. You allow "opp", "opp1" and all other unusual
>>> variants. Commit does not explain what problem you are solving, so I
>>> have no clue what you want here, but for sure opp1 is wrong.
>>
>> Just to confirm, would this be fine for the requirement I mentioned above?
>>
>> "'^opp(-[0-9]+)*$'"
> 
> No, You did not solve half of the problems - still allows "opp" and
> commit msg does not explain why "opp" is now correct. Describe the
> actual problem and then write the regex solving it in specific way, not
> causing other effects.

Gotcha. If we want to be super strict, the regex should be:
^opp(-[0-9]+){1,2}$

I will send out a new patch.

-Akhil

> 
> Best regards,
> Krzysztof


