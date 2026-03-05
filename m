Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A32F30946
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 11:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSJ6/gnzvyp+MqZzEwrFuS8ohF6YfunLzHCMX8kNpaQ=; b=pWwpuTzEpT6O7IUStQsIe8Mbfb
	tIxQ2mBiwldyVApDZ9spMD5GE9MPqD5tJYAtpfH73CsFX8xTAYmZR2JKTQdrJWEOmcaXIjuqTeIPs
	lfXPUpIUksqFLcLbK5AhZbUGtbbcJPZbzkstzx5z7LvrDTxZrNdIi0uU1VjO7e9IoGl0A7Oj0Gk0s
	Hc2kSgOTEmVjzR9tLuqG172vxMH8PtcPBZ66ileybGxLSZ+e8f00skWm/HZffy1VTfkGnaxRY3Bvp
	QsMhJZ1FH7+0IW/kTVblM1ZRDggMsjCzpg+EIbxB0XCK2pu3GOWTeN7a2gswT3xXjR8MOeUpDbiDj
	PvKBixbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6xz-00000001gUX-2nBK;
	Thu, 05 Mar 2026 11:34:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6xx-00000001gTT-3Wzu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 11:34:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFiqk935975
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 11:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cSJ6/gnzvyp+MqZzEwrFuS8ohF6YfunLzHCMX8kNpaQ=; b=fQYop4yF7vuy3qOe
	SQNlA0GzPEYBIK6g9wicUqQfdMGRMSN4l0hcBfQszns815TIMW21nTuryuPvFAVe
	2biFBZXeMbsr1ZNTHbusT3vq8LyjivAAK4J/exGhVOuIQCdFeU+t/Oi4Pzi2acKw
	MiimDKLV+OEYf1f6mpsZ6V/FaAtwV75PS4ABZG/m3hVFfx6UUra9yrrIi6nyPTK4
	3dXNhKeygP/VjS5+9sbbtFiJV9Mkft0Nm9o0Cwa3DbneVjpYcenNDfVGZhEOVGPR
	3CqqkmAhs4w3bLel65Iv49QkRfVlATTtWjEA67k/O+tHXi42QH+hKoPD6wCJyZAN
	vVw7kA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq04u1vd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 11:34:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a0100410fso17814376d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 03:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772710444; x=1773315244; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cSJ6/gnzvyp+MqZzEwrFuS8ohF6YfunLzHCMX8kNpaQ=;
        b=Vn0p5/E2beTYll8h9Ze+9DOEFdliJ+v0tGttzJ0/aeZ7GK/mTAqqYAayXVPmkY/YSk
         yOS6eDzVB2QEpaApBU5L+EWCWMsAIuwazQXBRe7IwQ6w2pIj3c4pnzT8LyqszvNQ99Cd
         x4CampcNmY/zoJfMRLq5BPMUafnlAXDUg0cthe8YP0+7DbwYtt1dts4EiNQrJcNtR5cL
         c/uT5LI/t1c/Fs0oZTd76DlNI+S2EALiZwo0XyvwN0LLxEP+yv3kPx3nVfbJMNByL9qr
         dgkdxeHmUjzz+yJVZxzwW0SvYngWyuc3a0wNSLOy8YUizBWRmmLOAAkDBEz/ip1mmU93
         iRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772710444; x=1773315244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSJ6/gnzvyp+MqZzEwrFuS8ohF6YfunLzHCMX8kNpaQ=;
        b=NKX+9AI6qlUKecjgZyFfCdeHftGUpZgZliTRi2fx9sj0HHlLrqCXsbK7KGS+ce8ogC
         /HblqCASjxgQygJD25V7Q/YT5mU8Pmm3W20OMgV7eB6tC2crW/pGbgbRqUaOxZCS/vxI
         bRBlN0aeIWBa80b0FhKBrlYcITpzvHM5d88xb0sY12qQo93YGZ5PEwpu+MZgtX1ytZCt
         lhShjGOzPSysGOoK6mz9KQ5Lk0+pDGkU8Hdfbt0kRA1dTa0DQU5AeNIgSO4iVfTyjtcm
         7pLpNF4MjAQcScAZCQiB3WfjJyAYZFHt2H2aSvIm1lQdqRIpDAwKDYpE9SY61B2HZw35
         LOiw==
X-Forwarded-Encrypted: i=1; AJvYcCXytacT+o3BEw8pXTAVgUM+PxOX7fqslHDuT+MecX0189svkAQP3pW48pnPgetOgoeUUAyKNqNzBWoknCVn1UFy@lists.infradead.org
X-Gm-Message-State: AOJu0YyukZLPUnsyC6ambkpJR5PanVUyXfqStNFUhnhUX4enfJihHgZh
	hYzz5C76nr53KfEKabitdWVmt3u3mRux3rQZ5WjqzrfRnZlOu0LYkGRLH9Xpzq3GaegswmTyQKA
	RqDfcejovjKUK2efnwJyF+wxQ0hUw++vpEUnVuBeXSKUj12eMQLQkS1HYFJG0xYzMN/HneOvn7K
	kfJA==
X-Gm-Gg: ATEYQzymKzRIbFJl8aGQ+6eTOFSOuLsxfK/nUgU+sGGnvjZnS4DmkEck52v4ucOrb+e
	2NPhkCfmvgDohnJ7uJ+has7hiG2a1C0UIUyEu/3uiTGSb4fbg42kwpq55TZYEBUGTxFzKuA1HOe
	Whjownkfd8YDz583QuYXGZh/N4u/HMeJpURO5TTuw58u9Osxf4+cATPYERC8Ow+RucM/SqiqWFH
	dpZFVXIkI0YMjcF06EZe/iq0u9qJs6s44118zbIRqORWYY8BJ4mTGt3zz2yrIOKBlVhZE6oTA0V
	SXZoEVTAses0befCZpZc6ocAR8zAC366emuZHusDzQBl6SRcl6fmHdLXlD/zbVBxO6nPVwzzm1A
	PN22d4np0vDkfr/u86t4a7DIDoCpo7dbUO6CPF/ObObHa+9pBA+1g3ehTRHVZSP8q257nTs0W8w
	peFtU=
X-Received: by 2002:a0c:f103:0:b0:89a:f84:fdbc with SMTP id 6a1803df08f44-89a19d22811mr51378526d6.7.1772710443707;
        Thu, 05 Mar 2026 03:34:03 -0800 (PST)
X-Received: by 2002:a0c:f103:0:b0:89a:f84:fdbc with SMTP id 6a1803df08f44-89a19d22811mr51378356d6.7.1772710443302;
        Thu, 05 Mar 2026 03:34:03 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac546ddsm895276666b.20.2026.03.05.03.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 03:34:02 -0800 (PST)
Message-ID: <4d4cb697-17c0-4610-b498-04a3bb252923@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 12:33:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 08/10] arm64: dts: qcom: lemans: Add psci reboot-modes
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-8-cf7d346b8372@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-8-cf7d346b8372@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pur1W3N1L6jAZ-ljFDd95CxGGIzwaDTh
X-Authority-Analysis: v=2.4 cv=eqTSD4pX c=1 sm=1 tr=0 ts=69a96a2c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=RY4SAwMzpmrxGTDjaQ4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: pur1W3N1L6jAZ-ljFDd95CxGGIzwaDTh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA5MyBTYWx0ZWRfX8B5qy6z77rP8
 iZDBCqJ4S86fjm7AV6//WvkGQsC9hCpFsW7zNBH0mG13kA0kCHEQFtY+vBKoemTpiShpX21p3Pd
 Sa+8iKz21g1+duB64y8ztlZ47E90eyEdK0HBKSS7zu8OPb5IJW92p0TvPZNCzAduUctr4ZPFK2c
 a3xbXUrlr94vohA+5U3edRISK1sdRzCkDmwWxK4BHVqj9OSACi/k90WhVLfDcaPZZ2a/9KyjLJ4
 yTkEUcqglhpys/2ZR2LCtar4Xr5vE8RRV9oQxfNgCTU6KSPLeuBNYhzCcq18Mj3VYfGUUZyZZex
 8rD737C1Ssno8NlxhbEMb7f+iz7r2T4S5KVp5D9HHJ2ATmqxSg9tbeh0xC0SV0Xm7G+L3xvMUZS
 q14dCB/s9ckjZ2yl2C37fzCz32nQJEnzhgksUI5GCit9N22I6me7VUGjBSDx85vIm01AtOtwnbV
 Wk3IViUiGkCQJrcRInw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_033405_892716_70AE89AB 
X-CRM114-Status: GOOD (  13.91  )
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

On 3/4/26 7:03 PM, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for lemans based boards, for use by
> the psci_reboot_mode driver.
> 
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
> 
> Support for these modes is firmware dependent.

The previous patch only enabled it on a subset of kodiak boards,
the remaining ones do it globally, even though you claim it's fw
dependent.. this changed in in v17 apparently

My fear is that those may conflict with other methods providing
identical identification names, i.e.:

psci {
	reboot-mode {
		mode-bootloader = <0x80010001 0x2>;
		mode-edl = <0x80000000 0x1>;
	};
};

imem@f000 {
	reboot-mode {
		compatible = "syscon-reboot-mode";
		offset = <0x65c>;

		mode-normal = <0x77665501>;
		mode-bootloader = <0x77665500>; // conflict
		mode-recovery = <0x77665502>;
	};
};

will the syscon write apply and the (unsupported) PSCI_RESET2 gracefully
fall through?

Konrad

