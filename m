Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C74CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 16:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xA0Pw5Ltim7xa7TG+yFu6in4RZDMahQ0O7HSJsSCKNo=; b=nY9e+roc2mIlpacvogXuuTeCr9
	DNMUlcXJo6zOpZ8Ef0hYz1vpjduBXV5mH/ZNN2PBNi1CddIIQfeBGHjsWTGS6DSdMXOT3tTOlL7ZL
	aYWi9w0kTZbN/anmfoD1eJChxGc7RmBTkrlzbZ0yojH9ekvl6sMwmmkvcsJAbBoLM/PHFtL6vDWWo
	cblV5eK0NBgy3wd1N3bP3mycFWBIhdhbCw6LllhuHkaHX1QqhiAflpfSD373xqFnAfvOGsAgF0Efr
	zjcfNwMTqiF/hLa8HHIKh8ceZqTI617d0roEdMVjk/Eet998kJYcL8w4Z3jF5028qewC0SCzOOZQQ
	dzyKrlxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc46i-00000006dmi-13AW;
	Tue, 23 Jun 2026 16:36:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc46g-00000006dmI-2JtC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 16:36:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZZUw134206
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 16:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xA0Pw5Ltim7xa7TG+yFu6in4RZDMahQ0O7HSJsSCKNo=; b=hBFwZWrJs9byP+c6
	hYYxGCrOpcZvXsOg28ZB6vszdjmOpDg5xjYrgaWLAB2QRTDOU08+5R/jYG5PW4FS
	oxjsRSNDoQUVy12asRr0bOypqvLuU6vrk6G47EpAVfFk8HLlyP686H+77ABbEEYA
	CcxHT/jCVFeID3l5ZwEIzPeOxzdL8PlqaFaPe+NsskCv+8g5VF+O3L0wumSlg+dE
	KtVB6yhhIIBls4mTfu2atPJbChIapUxE/rqVXgMsopdhWqe6SclBORTCeYvs1uyJ
	MLDiUDeHXl8Rn/zAi6anLruZIogLZQUt//ltG0ncMJjjmUWxg347N1RjLaDIdZdy
	xIcNVA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr321ksk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 16:36:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8d37bc61dc2so318276d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 09:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782232573; x=1782837373; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xA0Pw5Ltim7xa7TG+yFu6in4RZDMahQ0O7HSJsSCKNo=;
        b=EAirTk+8hMWSypgJ7Hu1BOGGfSOyBhCHHNgGOHzx8zhJnO2XQvHg0I5aAVKVT7SjA6
         9JWfAtXOMstjOmLSGCFlKg6FfL6CEpDPAzJY7wGNUQ6IZPL3HhqAghoQvF547SiQYDYS
         fAw98He38Kx6GvtGPXrjNy6AKrWu9gN1ZgWDLi2ag54HYu3CEpPacD42n1sC+Iyyg1pn
         mjVsr7+ofsskIDaXSFw62BmSXOWHs6zcI6+H0PVKDE/NCMRCo1cqPclEVTtvrnI/unoS
         G8MGW+ftFZw4RD5OoFbaASf596xx5GNura9Ft4YVHCFZR27Z/DTZy6S6CkS/lv66Viq3
         TqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782232573; x=1782837373;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xA0Pw5Ltim7xa7TG+yFu6in4RZDMahQ0O7HSJsSCKNo=;
        b=PIbjyZ74ouUQEuA7F9qljQrpyvU/QC4MZUcbI3vRbYEYNvW/nM/hZbcMLYP6yMfgcU
         +ymabKKmTUeolfdpl0K4YrrEd5fvFovQanMjIrNMKN7dLipIJCZlvhTsIAVejSuu2dC8
         zDw3gMa61QCEeQjN8aFzrrb+8QbX0Y8td8zp3yTbNIuAEH2LOwCNcDuFdcpnasQwxIU3
         4r2uBuA6b4K0f34vYNTLN/gtNtDaPoqVsovg7CYqM20KC2/kuRFx9Ch9Mk8/caT1EyZ3
         E/Eh1Yrj87vqi8RzIO97q59GnVdJ085c+kmFl3AYWX8u8/ZMsdqXK1Ybh6AhNZ2lqpJ1
         aTAw==
X-Forwarded-Encrypted: i=1; AFNElJ8dyoIOfZKRDSgITKCvWGiLbm9bKN2r4oVojfAPYupKZyhTvzJ2rB1flTb/QpVrP39/W6P4O3pUlcvDy9zZh45X@lists.infradead.org
X-Gm-Message-State: AOJu0YzEA5GrZ1MYmn7HnKS2Cgv+ZbFqmmg5aecog/qJ5O+qTMzEUyLd
	0j4Ya8YsJLA+99o+LGQ56x0dd1tkxjVtvmPDmCu+4OThu1z8pBcdT0maChn8aKwc2mTD6Ypy7QL
	KTZxCYmfgOJhkrEoGwcM00JmsgLQBdhEd+QPxiPVnRv4wKfPhJMiaRMMLgtC5EfDIN5D43aAhGX
	jUSw==
X-Gm-Gg: AfdE7clzuJGTyHFfG2emR/Ly09X39e0Ye4RSDd41PbDMdY+CUQxaBQ4srtnAu6EFfrt
	W0r531PGPzgSHa663lZpMtNI96BobSkEnyCAwWhdPFYdGrjdC2AMLPa8X/V/G/joc3gACohclBL
	vsOuvaLaDvyCNZZXqeCx743P9SfYa7DqLjef6C3gngla5ZZ7gK4HhC03BzjFZTkOvd6LxPmnSZh
	246BAX2373CjyNF1Ai8m6N9rJU9+v/djuxCqqAymW2d04VGs3o9cUUQbKgc/0x742bIaxM3+hTY
	6HSqRWngUVzuQGPmegC6PfItvcC4Maj3VmVmn1HIJJ0YHyM2eRn83x+uVjNJqGNXsRLY/7bS+6C
	jx23e3pDVVh15bbaVhPHBwINRvm8miyDFHBQ=
X-Received: by 2002:a05:620a:6781:b0:926:e8e6:3c28 with SMTP id af79cd13be357-926e8e65d56mr123258785a.7.1782232572839;
        Tue, 23 Jun 2026 09:36:12 -0700 (PDT)
X-Received: by 2002:a05:620a:6781:b0:926:e8e6:3c28 with SMTP id af79cd13be357-926e8e65d56mr123255785a.7.1782232572407;
        Tue, 23 Jun 2026 09:36:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69555c45sm943642e87.36.2026.06.23.09.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:36:11 -0700 (PDT)
Message-ID: <45794082-0c86-416c-a2b1-76ab4f20d82d@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:36:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] iommu/qcom: Enable clocks before hardware access in
 qcom_iommu_ctx_probe()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-8-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122034.1166295-8-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzNiBTYWx0ZWRfX9+s3L0GAzvkD
 ut1pqY8LotoqeN78CxNOMyRZ3Q2oHsGrYoK1CDFpeogJZsX9pHL1pz6DqBtVkzawLTVm01g0riU
 kr2KKxDv8M16P/fftXuXx9XZxWVzej0=
X-Proofpoint-ORIG-GUID: Gt-3XCjICJxPmAowCwVwIgg0a2CRJMKq
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3ab5fd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Yd-jd7UEqWDYs8h9-TIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzNiBTYWx0ZWRfX3mOSTHGX3QT+
 5UExavBk4meUtBD+PS6n6toxu20xsODkCE/DG2EeGKeeJJB6dC1SmqCWRZbInmvgKGFvxm263ws
 genGAxxpTtgOKpt76KHstgcNiJyXIg8+yA7J6x1GCjIOtQIBJNOTnFdFlz3RwZOdVOF6SIy5hak
 eK0xg7cr23k6jR3ZMUDU1kd+NeRCMrrUJqgi9rKzLceg/E67cZEEUalnjFfnLOkGaUFu0P8ZVVq
 Hj6XN8ctz6TAsWAiKHmR/Lqrd4WlMGTU8NLmBRcTTtckEgfguq8E0tK8bRkO00aExZf6xpng4nW
 3W3mMl3rsrpF/JX7pDUyDifW2xaU11M38hI4GdxjO8I9JItc+3ey/YIlYqCCgH7q1ZKhHU3dtln
 9rCf8bQ0Aq9F1wNOEPzfV2W1X7L8rW2bq2XPkkhjWOlIZYd1WOfAUtLkn0xxKv4YdeDwSWwyXeB
 ZW9CFNCH+rlOZgC96Nw==
X-Proofpoint-GUID: Gt-3XCjICJxPmAowCwVwIgg0a2CRJMKq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_093614_716917_A2FEFD7B 
X-CRM114-Status: GOOD (  13.84  )
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

On 6/23/26 2:20 PM, Mukesh Ojha wrote:
> qcom_iommu_ctx_probe() reads and writes the CB_FSR register to clear any
> stale IRQ left by the bootloader. This happens during
> devm_of_platform_populate() which is called from the parent device's
> probe before any pm_runtime_get(). The parent's clocks (iface, bus, tbu)
> are therefore not guaranteed to be on, making the register access
> unreliable on rebind or after a suspend cycle.
> 
> Use pm_runtime_resume_and_get() on the parent device to ensure clocks
> are enabled before the register access, and release the reference
> immediately after.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

