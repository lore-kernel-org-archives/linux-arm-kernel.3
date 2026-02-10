Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD7BEA811B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 14:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLjK0kCKrATGfaPh5ElTpixsSxExbQnUw/DqSkDBNQs=; b=hZ3Lm3o9amrhCnIekQfsaXJ34a
	07E5hyewdk6pUvR/rC3CdAMbxKajq3hJzYbB2bQTC+Fx3AMu6Vf8EWbGcWTrBzik7LDuJAsDMrseJ
	Mca7TNz7fyC7+AbSOX/PJ3HILPN+cJD8ChcNnlPQbnrt+VaTahONthSGGJ6kaJTavCw69uNGmrVth
	l78/HVHz2+kVEgdFnfv3zvDPC1rRv75uhKtIAIdLCv1Mp0jHl8w8TEepIOs3g9tWJwiFSaltmtA/L
	BCc0xMR6Cl6xTIkZssT4maJErZPBTXW0i8d2eSvP4G5QvYAmiBgQEV9f1PMXrwQnnBrFSIttUf1im
	92drYC5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpoMu-0000000H1kD-27Ov;
	Tue, 10 Feb 2026 14:05:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpoMs-0000000H1js-1nOe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 14:05:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7Z2mT2169220
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 14:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLjK0kCKrATGfaPh5ElTpixsSxExbQnUw/DqSkDBNQs=; b=YU+3tYWy2leWxh8D
	GcgRO0HY6/Gntupiz2x0lk6uSchQM149lFqk7+FNoZ7onkZWldOE0vNIzBa9TxT9
	vVaZJrYU8AzBqC2o136vYWDeWRwfQPa2mrM8+kdHuqS8h1I1LaM+tug4AO6fuWTR
	NjllLNp3pIXKqZ9OfNNfeHNfWgZc0Cgk0WBkUckK9qn02HmCvbfSFY1TmozNxWrA
	ocfpkhM+r7FfM1KJeE0an+8RNhfQKARiF+jJ8+79mNbRD4iYca8pzZ4AYWmHLoVG
	hoMz0G8zX1g3UCERplX2zYuoJ3ntc9BMUQ88zi/iktjwp3ixM56FSvCzreiDORq+
	KoOePg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c80drs72y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 14:05:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3561f5bd22eso908277a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 06:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770732329; x=1771337129; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cLjK0kCKrATGfaPh5ElTpixsSxExbQnUw/DqSkDBNQs=;
        b=A86SeB4nSOyRrRWpnUx4BZXuVLTvCLNZatGZnss+DFDNO/bhgSehTJGnSaL3o8bLoV
         3rV6a2zHpliNkDMRnkEiONH5VM3WE1nN+/k5cZqRWbfYaHDXC6NcuMSmaiQPJuvTXadN
         +kxWKe3N2m42v51dOVKDmFOC0jGq3ovSDUTciQc+DjEKVyZUanLU3VOBvCenyGk20c5d
         LRwpaq8xkWrLwPuEsEA6YDmEh2vppD4WcUTzDS03sV7GqugCDtCFFNjIgBPwMUYMfJNw
         MHgtkvLGo6SLYJTPhNNZckrA1Y38X1xBpwx/xCO3OdcoiqBUv1tLanSoXXywdjP+IKs2
         3t7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770732329; x=1771337129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLjK0kCKrATGfaPh5ElTpixsSxExbQnUw/DqSkDBNQs=;
        b=lVOFmOyg+J05Ft0EBo1EBeixXLWV1dHLp7pStbUkcEdIHojIfE/ie5HF/zbKtlgV9u
         l01uSL1Aoq7PYWB7x6ygrBsanmFvRKj91JA1VUi0KEqCL9+xrKPR3Z9xc1kPdMcO0kJf
         GfcnJXwzo/oSITVvoRviRRZF7CGRFhiYbPRMk5nLGYqnnTWmcGYAa6Cwas8fwN81oGzS
         Gy/lJRx+a0D2VNfwDUsSBsEhq7V+dA6yDSZJZoLAbk6lfMS/0bNZKBkbG2eZ5QSpXg8e
         Qr7Tvr2OtHHMLHA0RvAXWigPkAO28I/cXrGbT2j8ft7EMFpMUBNvVgM/4x6uw0+o/a7i
         SYlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5GUfGi7hhA3oigvvD96euyQDR86kWqrbtGn7P7RH8UyvC0z3nFm7I7P5ELkYMh0lqcP7KpjnskGM+h1SL5pq3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8kK/4HCNkCpM6H3nkUTrLDHCVbHK3gJ8otwpSOROuIh9ZZdQF
	aL6FX7chPHPtUha6f4NyC9dQF5ipqX1UPIv44tJt4of7ED5UeqcWJZmCeTV6Cd1wzx9hKnQkSsO
	ggeBQng/swCLJNx7ZgbjCjmMmBBiXWFSGtl7SqEz8tJljN8PY+Xs034hh0m/UlFx519Sp4TS251
	yEFw==
X-Gm-Gg: AZuq6aI/8KRFas71ngSt8HWjbiwjydaG91dZVRPxg0YEdH3fEDQhzNuEXE+IxIVc/pu
	TqJF6J4XvOUaWYP38lbWvsyilJCFe+1xJAfI9f2V1hgSBSQOIjlalgp3HFtm8UKmjZVeEzm6UPa
	Pe6LigQQlwm8itBluj7+1mtuNF/Hwsts5oWZM0s0ppAQNVHnIu2rPvF4pYmtueFELjwQCMZ6ohX
	TdaV86NoXvhK3OrfRwBbqIEpXP3CeTaIGQYcvZB3FFMoZxZCfI0uC+4O7QWdR+3d9edWNWdG87v
	AWbAxqjY9bys2xlebLvtaNH1YKhJnVDe6Rb9nmtOX7JG2P06OkrRP7iHskA1LYup2j+38OnMiYS
	SBft0ZNoPJKkZwcNQweQke1BwSm51cU7JZ/sWBN1Phf8nrk0Lx6eyH2q4
X-Received: by 2002:a17:90b:5746:b0:340:f05a:3ed3 with SMTP id 98e67ed59e1d1-354b3e2ea5cmr15423135a91.17.1770732328696;
        Tue, 10 Feb 2026 06:05:28 -0800 (PST)
X-Received: by 2002:a17:90b:5746:b0:340:f05a:3ed3 with SMTP id 98e67ed59e1d1-354b3e2ea5cmr15423114a91.17.1770732328193;
        Tue, 10 Feb 2026 06:05:28 -0800 (PST)
Received: from [10.219.56.177] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824587621dasm10223703b3a.54.2026.02.10.06.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 06:05:27 -0800 (PST)
Message-ID: <61f166a0-44b6-a917-66e4-1e1230fa1115@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 19:35:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v19 00/10] Implement PSCI reboot mode driver for PSCI
 resets
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <2dcd9e3a-0a40-0dfb-29b8-99b70b73a59a@oss.qualcomm.com>
 <9e9b9faf-7c5d-2e83-a8ac-37afeffd81d4@oss.qualcomm.com>
 <aXduTklGm6AOeaGG@lpieralisi>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <aXduTklGm6AOeaGG@lpieralisi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDExOCBTYWx0ZWRfXyb+ixolOgAKT
 fN8xCCUcp6Ke4WLnmhOUwFdC3dmwyCZlQnS6MngVOzGytJYzP0NENqoBkARwf5qUrPBgRJ0YNhk
 w2epzO0xx6L1CHF62R8PgP4uQyBWL+hc+X+sm6ADo97gKzQxKFkT71jk0JUUA6S3KMwyNsApE8T
 SXL4UccpsXu1R74nhSKFAeacb1kFbxwtjrOuTIiwlTAxHg2r8zl2WqlwFRZeo4l8vEj8B8uCnoY
 2xF1tI7EhrTJ5RcgCogFHTvYuRLOvdBXGPcNepSEBw+L5YSqX8cz4sMg/EG+KT4ute38KTooJFI
 5dvX2WqOBCoGl8mhByQJTte+1lhE3WKEc/deiBb/lLj9Xr7wl1FLbtWoGSOGEFZYPkaDbsXRBxN
 4XFBDA4xoJkAT/s2iXGh+Wa5PzJSk6NBdYd8njPSdPU43XcYEQ892Imw4z6ysJn0EUpq4zp6zuU
 V3nbYDPfzzM4pPJAEhw==
X-Authority-Analysis: v=2.4 cv=fd+gCkQF c=1 sm=1 tr=0 ts=698b3b29 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=hP7UyYXQfnt6fAoQBTkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: FS2qQl8dJWmW6I8sVZvTO09IpPkN0Zuk
X-Proofpoint-GUID: FS2qQl8dJWmW6I8sVZvTO09IpPkN0Zuk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_060530_481680_CCE59649 
X-CRM114-Status: GOOD (  17.16  )
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



On 1/26/2026 7:08 PM, Lorenzo Pieralisi wrote:
> On Sat, Jan 24, 2026 at 04:08:11PM +0530, Shivendra Pratap wrote:
>>
>>
>> On 1/6/2026 4:38 PM, Shivendra Pratap wrote:
>>>
>>>
>>> On 12/28/2025 10:50 PM, Shivendra Pratap wrote:
>>>> Userspace should be able to initiate device reboots using the various
>>>> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
>>>> patch series introduces psci-reboot-mode driver that registers with
>>>> reboot-mode framework to provide this functionality.
>>>>
>>>> The PSCI system reset calls takes two arguments: reset_type and cookie.
>>>> It defines predefined reset types, such as warm and cold reset, and
>>>> vendor-specific reset types which are SoC vendor specific. To support
>>>> these requirements, the reboot-mode framework is enhanced in two key
>>>> ways:
>>>> 1. 64-bit magic support: Extend reboot-mode to handle two 32-bit
>>>> arguments (reset_type and cookie) by encoding them into a single 64-bit
>>>> magic value.
>>>> 2. Predefined modes: Add support for predefined reboot modes in the
>>>> framework.
>>>>
>>>> With these enhancements, the patch series enables:
>>>>  - Warm reset and cold reset as predefined reboot modes.
>>>>  - Vendor-specific resets exposed as tunables, configurable via the
>>>>    SoC-specific device tree.
>>>>
>>>> Together, these changes allow userspace to trigger all above PSCI resets
>>>> from userspace.
>>>>
>>>
>>> Hi Lorenzo,
>>>
>>> Is this patch series now converging towards the design changes you
>>> proposed in v17? We’d like to conclude the design so we can move it
>>> towards closure.
>>
>> Hi Lorenzo,
>>
>> Can you please review if the design aligns with your proposed changes?
> 
> I will try to do it this week.

Hi Lorenzo,

Any pointers, if the change aligns towards your suggestions about the 
psci_sys_resets?

thanks,
Shivendra

