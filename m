Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017D1CD043F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 06:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDWKmfMAAIQKR/wtVg52c2k7p6H/btOMvPSVN3ySifc=; b=Jc9hBOg/nHzNXuKlnL95eXTarp
	oe68tEHKDPUYWYxRK8mI74Xb66Ps/9/+CzXVwxrckhd2EwRdJ2D9fXjFWODqa4lxJlW8B3vI6zwEr
	KRs5QufRoZagKKALyjJ4jt8cBWe0+lbKqwB8BoSK44BOqMQQfpja4cKbXNSPPgKZBpI8KXYAmTiGg
	aMSs6vxxg8zfQxmNzT4QKxCSQDwJakT/B7PLhwhzzxizXaFmI3S3deA8dVDn/QonWv+5FzLUBFrIs
	zwPEArtqdb/Ete0Cmq8b0g1x1MsYBrVI6MQ9Qvki1aTitT93ELszKds4YufMfbpUgdP1RFxvil0Wy
	Q8UyuykQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd0b3-0000000CTJC-0uPS;
	Tue, 06 Jan 2026 06:31:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd0b1-0000000CTIo-0Ugc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 06:31:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063RRDF2432438
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 06:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RDWKmfMAAIQKR/wtVg52c2k7p6H/btOMvPSVN3ySifc=; b=n0QJ4LOzR4aY0S7E
	CAsIkrc+bylTq/cjMlqCNsdZwO/wIphHWiSxSIGsv3xEsz+M9hBPHtzFwHSFwUH/
	1sDbZ5cgrjRlbpFDhPk9VpTCxrz5Vee+sOEq0z49NUkp0ke+heuvhwGoz+kHOH5Z
	0HTOo4P7KIjA1hgfw56bnWHDPfyHTBlE75eLmpRgtDOAsDmzlItTUy7nJ/Nbz+gZ
	XfPOeAQPm1vZTKXIEGHRuUZqETIgIBfUKiUOKc57b/lg7Is2rfjpvvE5alzk0L5J
	CcnYYrnjDrnKqg5KJyZTSm39U03bfrEkq/i1jwokIPk3/JRP+zB5Pn7uSqOSiP5P
	GPmNHg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgr738t7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 06:31:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so1543584b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 22:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767681070; x=1768285870; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RDWKmfMAAIQKR/wtVg52c2k7p6H/btOMvPSVN3ySifc=;
        b=TkVwbBgoI9xDknFt4k+gXrp5lG8nLWg1Q31Ne1Guz7PNdep157kUIUapdmPSnjnz/M
         g2320d812Et+AeQUXzFdIvxm38RkbYsfGmT4c++MQUSnXQwFQbQGL9NzBlnHKBQDQ4hK
         /ad1u9nezrL/ndIQpN2Olzyvf3SrtKd/XcpNKoXQJR/Kx3IbUbp/wFBdqVMByzkqaP02
         aCAFvcqN61xOl/eVXwwlxL1hB0cIVKr5CONPhjMw/KxQuFKNCCoix2hH2CZdTUAXMaii
         +OY8S235OdNPTQfys3y/yYHZ0JuU2+sY+EbMd2n1JGyNt2ISB4/xtli2cYD9eqp0Bu8B
         KLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767681070; x=1768285870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDWKmfMAAIQKR/wtVg52c2k7p6H/btOMvPSVN3ySifc=;
        b=SzGuNNB3QlmWCpI5D2UdDXQVvUOM6xM2ivI5xpgyMTO4WAviBI9NuYVl/W2Y2OUS3G
         Ey65gBOfdXVrdwF6ej15zcurvPrjswl6GCATi98jqJnZBDk0s4se8pDHx09094UEpOE9
         CbBoUGrdytFCHCiG9S3O1I15c8Ii/f75Z4FaveW6LFbTWDlwbMj2K4JVj4zdVH7fDHv8
         03pkkr/AF/RJzVEQen0vFfYkV29jV4mVZLX3uiejNKYEBr80PfQaUDSJa7sXe+EISILj
         sMWH086A44nsOndPptEMhOJILUR8kE1QrFJ6MTyl3LrBrZVjRbdjRoRL4NdpUwle1BG8
         v18g==
X-Forwarded-Encrypted: i=1; AJvYcCUXjP/rRqHZjKU2ekfse8LIXDmhUBRu/VgEEP4HoEhESSwA82rtOsxbenKRiSbmSBqhjAReLaqBJlQNFexRi7C/@lists.infradead.org
X-Gm-Message-State: AOJu0YxhYajRHAI+WHH0WZDOHIixb2ahWB0BWkJBSNc1/7J+Ctg3Qw72
	W0wsSLs5FHlnbSxH8K2YDfH4pvZ1w0kg4acuUrZVfDu8kjZ++YVZiHUV0IH/l+7AXbVIfS070Oa
	e3X61bgLrO4LwMQcjMkFSAtrfoiPldehAemNXyOGGaEmSqwQK8wOj+Nw1BsEhDnNnQr5/qnjo/H
	SLMw==
X-Gm-Gg: AY/fxX6haPanstZ7p6B9ZSDYAF6hPOLguZ2LoIupqlhTc/80n8qRs0BDsh2ItG0Knxg
	z+e0jahUcmxZRiL3I/hjar5x5kj8M7YUJtJzYjASRhC3V4NGB75bMKT9F0d8/vON3teohyq+GMD
	aJWL0CUuXM871cIaQ45dCglKUFLZCjspZJJQBOUPhtsLCm6qtUp4Sp0YeksXnKFSRvnpfA12dYO
	Dselc/kKcR08duLGFlmnagdPZlnmTgROTMJerPK41ehIY2bx8yPoMrEYzXgWsPAilUt0tmrUta9
	VMeEnq+EC9pMp+Bc5i8HWbQZEqqg0ZrPYSM4bw0fnu5ftuYP0qy1K9V7i90KyyuEFZ3IZ9KlNI3
	C8q1IMKP0i0q2TwD3db+ROxDufMBwlrgUjRg5DFGR4L0L
X-Received: by 2002:a05:6a00:44cc:b0:7ff:b07d:d4fa with SMTP id d2e1a72fcca58-81882be1209mr1870835b3a.56.1767681069751;
        Mon, 05 Jan 2026 22:31:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/vpXsfwuFIlKNlWeDvpXegR4zTXn7c2rAirDsOY7syntOF57m7Ik/8zN1pNoMFJhmyuAbiQ==
X-Received: by 2002:a05:6a00:44cc:b0:7ff:b07d:d4fa with SMTP id d2e1a72fcca58-81882be1209mr1870798b3a.56.1767681069241;
        Mon, 05 Jan 2026 22:31:09 -0800 (PST)
Received: from [10.219.56.177] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e755bsm992670b3a.48.2026.01.05.22.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 22:31:08 -0800 (PST)
Message-ID: <e4b01dc7-02dc-060e-d1a6-abd2c801a78a@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 12:01:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v19 01/10] power: reset: reboot-mode: Remove devres based
 allocations
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <20251228-arm-psci-system_reset2-vendor-reboots-v19-1-ebb956053098@oss.qualcomm.com>
 <CAMRc=McEB+yVYxropzsqLExZCU5Pd_iy_=5N3pTxu28-ZX=7_w@mail.gmail.com>
 <acbb37a1-3189-4d4e-5c05-55b13cd40a7f@oss.qualcomm.com>
 <cvmtn335gwnl6rvmlm4vgyablsj735rknga4ffv53gpk4k7d6g@tt7ebuyusocu>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <cvmtn335gwnl6rvmlm4vgyablsj735rknga4ffv53gpk4k7d6g@tt7ebuyusocu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QrxTHFyd c=1 sm=1 tr=0 ts=695cac2e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KAb_rDcQEDUYZVoDp1sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: oqrBbwzvhzGBX5Tdd99Mp3JzrJqUZ37l
X-Proofpoint-GUID: oqrBbwzvhzGBX5Tdd99Mp3JzrJqUZ37l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA1NCBTYWx0ZWRfX0iJThK2SwRZh
 VXPrkyjQrO9OEqprs5s0gCuPgGAnP8MrZYAUVvqJv6XPhLFghgAD57DzbPAg/Jd25cNq96ts2l4
 tLdQ3+LLNFOlqzh0EyI+kiEBFtqOvx9ZBHzRe86qcOcCJYw2TGE3to4VHZtccwsDSwWkShEe2jb
 oZul7r/+chzR5Z4IHR5rCW1MHzfKQHA1PA3hYRq+8Ychn0KuzvZjfexaXg8cTk3AAka4C9nEds1
 FzKjzix1HFo5larupvvutbgZnUeftVghLZ3WPvExJISpXDChggACrjgK+DdijvqoiJSdMpxinfe
 HOY4oTaIgI+t8ziSxCmOMtgRtL935m93/ljTrFdCYtiLV6EE4t9nrD0leSK4A1/TIi2zd7vNWfD
 29nKFTWMIuRpytUCzNB/EN8+jSikZn7z4Ft3KVT7rp5Tf98HhucEHss/gXTFYzSxUy073/dnpZC
 scNIjUG3V6vgtLFPObg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_223111_197888_E83AED95 
X-CRM114-Status: GOOD (  15.71  )
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



On 1/6/2026 3:01 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 05, 2026 at 11:46:40PM +0530, Shivendra Pratap wrote:
>>
>>
>> On 1/2/2026 3:35 PM, Bartosz Golaszewski wrote:
>>> On Sun, Dec 28, 2025 at 6:20 PM Shivendra Pratap
>>> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>> [snip]
>>
>>>
>>>> +                       pr_err("reboot mode %s without magic number\n", prop->name);
>>>
>>> If this is an error, shouldn't we bail out?
>>>
>>>> +                       continue;
>>
>> This is not an error as per original design of reboot-mode framework.
>> The code as of now says, if the reboot-mode node has an entry without
>> proper magic value, ignore it, and, process the next.
> 
> Then why are you using error level for the message printout?

I have changed from dev_err to pr_err. Can make it pr_info. Will
that change need a mention in commit text?

thanks,
Shivendra

