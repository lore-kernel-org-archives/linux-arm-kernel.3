Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A796FCF31AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 12:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjIW02mFO0A6VGZGfOH2io2QOGdWVsO8GYlNGpyrH5c=; b=m8x9JnmsG4C+dO+N2wo0Oxaa0G
	/DBzoeWtB+OR8XAvO2dEcfwzjf4Dl1m/RXTu3XgiXE9avPjpR2sDeNpYDSi7AuXLi6MCMcW7rKrmF
	Nremp4F4eUkzBmN2S3svT31BGOpolDX1iKd0v7J9lTolFFhSzWnK11D4T4yPrwAEIp5mCpcWVU6ZL
	PowS/iIiBuJNvbKS2kBtHWXsHe7f2zffev+BPBtQ5w1FWKxQEtm11klVehefH7Tk9gaopvEsTHh+D
	Dqk75uYtSBKPdQs0fH2P6Ind0FjAp7s3jOZXU5DQ991kW9gaMl9hk+DqHdPgxWw8Fkux4lr6S5icI
	kcon27TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgtl-0000000359I-3eOK;
	Wed, 19 Nov 2025 12:02:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgtk-0000000358v-0D3T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 12:02:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7OeEK971631
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 12:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TjIW02mFO0A6VGZGfOH2io2QOGdWVsO8GYlNGpyrH5c=; b=Qqqv2tTv/DtFrkg3
	1YpcLnS8VMCN8V/UcMglE+p8moZrX9vEd5DvTkVNSHSgNGkIy1dk3F9k4sG4bIu9
	GapzFJeZ9oF6pxuP7Lum3Gd0hdhjMt8zDdP+L3tujq2VCxyxlKe5ykdW/cr8+OYd
	MDNLb4k8v8FGjuR+mCtF9NP3VC/5vWH0GVa9Bh+8ncrSLy3q665pWykZy7/Jx6/S
	+fmHhF/BPoO4SuUpPj6Y2jXGt4Uy1wHerKSo+x7NO80iGRhHKLXTWzwJe1HHXprj
	IvmE/fT2IuU+EO6bgl9jvZBknD6zMaQK+BETBFYBur+5jzYC6VyjrAq8Iw7WXTfa
	HHuk6A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9fu8u96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 12:02:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b80de683efso13235808b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 04:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763553774; x=1764158574; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TjIW02mFO0A6VGZGfOH2io2QOGdWVsO8GYlNGpyrH5c=;
        b=VvvtCwsbgwdPQXJSxQzDRIy+y9DuAkFXI6UiPdfNpLYfTDdsBajxmUZBeh114hOD1G
         I5LCoYZYVDessLEvQ53wCrG/83kO2HngQF3cuhnesyOFBoLGA+0sazCcWjvFQzCXXuxD
         gb6pe0N/mo7/W52HGgPeOtIklFpb2e7CL8fsxbWEXxCRow2nFYPzHBIimnX2Z7I9d1je
         DCTKlsTmTiOpHEqhYmCxCcL6TKKJKPwfq9U3CDoIMwnJ4luP+PjlhphNspkK4tBPOHNA
         UyHD5ZGTrOShdZwBNvDPbSQ2dKb+qNHYhD29FaCDxpDf2rT5ZqzU4aM4Y/WpxKALzTVa
         AlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553774; x=1764158574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjIW02mFO0A6VGZGfOH2io2QOGdWVsO8GYlNGpyrH5c=;
        b=EoBusFtkfe1jSOSATHICx/cmu05tp2MyXX5O7YyuS1X4dPmBFkdcqOb34wZvPNt0ww
         ZIC5zC4M+4OYhphe52LfFpaQmb9gFYS/H2dbZU4PCVz+7o6EK5xvTiKTwrOOaQNhd1HN
         VegOibNN5y1t6foJSNtSSUOAxMbbX5ICWpekwU7Nilrt7MuNAatTS8IBcsdhd5PPu39o
         9FBp7vzSsoWfTCU6ooqgGso0kuU6GyVfhIjKYBZfrUvAYEU320CXRNEQ7lJFbN3f2bOG
         i/mMrWS02dFn4crghN8bnykdtdxyh9DXuTWpDQzQkl2vRbSKhcoEC788ZbFSe8UHtptN
         jYbw==
X-Forwarded-Encrypted: i=1; AJvYcCWSQlldbkKJCCZ9M8RXyruBy5iB60ORfRezrzUyajU2Bt3uhiDPdmFn7aOrNY/MY8bZaer5ELOSI1nqccMhlrPt@lists.infradead.org
X-Gm-Message-State: AOJu0YxYIIvpY1PC4kMkoEV+o8aQVD/u4dYVCoG02Gp1r6c1o9bfAkKF
	v0rT606RJ0VHfFnnM5/PHdzMtS50C10J5EEa2UVHCGsQmne1S5sOe+0W77UOcbkqlWt0GMXcnVq
	KIf359cx+d/FCKhL1TFqW0Z2kUpCo8Errq1cxTRs9fx++0sUK7N4tU4j3adma7LX9cX4rYQ5hk3
	itvw==
X-Gm-Gg: ASbGnctvXV8LPYrCmjZ5M/kBlzeJn/nwEVv7vUo178RqyD4H75g4rzORGTKcy+xLfNu
	4g5PAqWjqctTLNsMVdhFAoISXDhbRV+a2u1OBNpq55iU9uKfu9fnaq3jmEet+9GW40ox7OWKo1o
	jXdT3koFJxlzsH1T2Au4kXLIT3/ViYOmwM3li0woZ+1d+PQOmzdb6PAjZMLoaIOB4d8JBAiybDH
	r4rnayjkxr20liMJSrLBzeiv9bSTlYvfHtp39YZ0ZMsEVm6PIG9m2lS3ZNIocRyjZu4/A2T8a01
	8QSs9HubvPDgve4QIR6BPD5MNS513wzRbV1liPVR92nEDbm0dqodPXUdjZuf2kkBqIIV1pZTFc+
	EGZoM/aIvL4WwNrG6u9kYL2ubg91PCMHicQHdpEbu0p8=
X-Received: by 2002:a05:6a20:734a:b0:35f:aa1b:bc00 with SMTP id adf61e73a8af0-3612f31b05bmr2773359637.59.1763553774390;
        Wed, 19 Nov 2025 04:02:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNbO4ggiX+mrclow8f9c4D5FHCa9+vVlDZ9B1otcOfIurjoU+/vUjVkaZn/JfwG7EJs2K2WQ==
X-Received: by 2002:a05:6a20:734a:b0:35f:aa1b:bc00 with SMTP id adf61e73a8af0-3612f31b05bmr2773313637.59.1763553773847;
        Wed, 19 Nov 2025 04:02:53 -0800 (PST)
Received: from [10.219.57.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37517864asm17995503a12.17.2025.11.19.04.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 04:02:53 -0800 (PST)
Message-ID: <682b1a0c-644f-2aff-1860-cbf9a53bc62b@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 17:32:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 07/12] firmware: psci: Implement vendor-specific
 resets as reboot-mode
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-7-46e085bca4cc@oss.qualcomm.com>
 <aRIfc9iuC2b9DqI+@lpieralisi>
 <80e68e44-a8e0-464a-056e-9f087ad40d51@oss.qualcomm.com>
 <aRxmWrAkD0Vu4pF+@lpieralisi>
 <1da024e7-efb1-3a1c-cc13-0ae5212ed8bd@oss.qualcomm.com>
 <aR2P4CxQNebac6oU@lpieralisi>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <aR2P4CxQNebac6oU@lpieralisi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA5NSBTYWx0ZWRfXzY2gDCxxrNow
 dRtlGk9CW9cttOrvs3cTQipUPTJELRmvKEMb9PjvfHNR3AqN4/Ce2Sph3elCAqn5OnDY4VmvtUX
 V5JlW+/zregXlQSJolbwMceOmryzJhLz0UJBjgNTsSVdIxBNqdUHmdrrzzdepl/bp/tDR+GykeS
 6FxRRFsUdmbggN936kZHla6OdGneWhZ2aCRdXYYQMZHQTF5YzVhozX+n3oqFdk9vwJoX5tGJWNs
 xTdAdOAbUpbHbVjURA1m1wS2LkGjCSXtrYHUJwWB/bgyUh26ZJxaiCJo03PQFjk0KwesWETfL0H
 LjnnFpYVgFEbPPA6/oSpy8Tgyrazonyzy4FeoUDC5OkWR4r09KkZHkwI8yV4xBluSrG/sUKyga/
 ac0Kd3WvYe3P2t5LZ5iCOCY5lHGKNQ==
X-Authority-Analysis: v=2.4 cv=KZTfcAYD c=1 sm=1 tr=0 ts=691db1ef cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ZSC80-7iYZ4hBk_6gz0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: lvdw0SOvM3P4tIc5BXih5Ppu5u2zWDi4
X-Proofpoint-GUID: lvdw0SOvM3P4tIc5BXih5Ppu5u2zWDi4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_040256_121924_395125C3 
X-CRM114-Status: GOOD (  18.72  )
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



On 11/19/2025 3:07 PM, Lorenzo Pieralisi wrote:
> On Tue, Nov 18, 2025 at 11:11:33PM +0530, Shivendra Pratap wrote:
> 
> [...]
> 
>>> Yes this could be a potential way forward but that's decoupled from the
>>> options below. If we take this route PSCI maintainers should be added
>>> as maintainers for this reboot mode driver.
>>
>> you mean the new psci_reset driver? yes. Maintainer would be PSCI maintainer,
>> if we create a new  psci_reset reboot mode driver.
> 
> Yes.
> 
>>>> - struct with pre-built psci reset_types - (warm, soft, cold). Currently
>>>>   only two modes supported, anything other than warm/soft defaults to cold.
>>>> - vendor resets to be added as per vendor choice, inside psci device tree(SOC specific).
>>>> - psci_reset registers with reboot-mode for registering  vendor resets. Here, we
>>>>   have a problem, the pre-built psci reset_types - (warm, soft, cold) cannot be added via
>>>>   reboot-mode framework.
>>>
>>> Why ?
>>
>> If we want the new psci_reset to take the reboot-mode framework route, is it ok to
>> add default modes (warm, cold) in the device tree?
>> If not, then the design of reboot-mode framework(power:reset:reboot-mode.c) needs to be
>> further changed to equip this new feature. 
> 
> Well, yes, all it needs to do is allowing prepopulated reboot modes on top
> of which DT based ones are added.

The mode-cold , adds a third variable to reboot-modes as the first parameter for 
invoke_psci_fn is different for cold vs warm/vendor.

cold reset call       : invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
vendor/warm reset call: invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor, cookiee, 0);

Each mode will have 3 argument - like:
_ _ _ _ _ _ _ _ _ _ _ _ _  _ _ _ _ _ _ 
MODE   , cold reset, reset_type, cookie
_ _ _ _ _ _ _ _ _ _ _ _ _  _ _ _ _ _ _ - 
COLD   ,   1       ,    0      ,     0
WARM   ,   0       ,    0      ,     0
vendor1,   0       ,0x80000000 ,     1
vendor2,   0       ,0x80000010 ,     0

So reboot-mode framework will now define and support upto three 32 bit arguments for each mode?

thanks,
Shivendra

