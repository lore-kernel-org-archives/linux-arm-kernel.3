Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B01EEB28D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 06:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQ77QTJWVPIZC+3oQok+biilGV/ElhSJIADxlZKOIi4=; b=t5ESASRuF2XMpvMAqVNN4Gn5ns
	KFb1Uvf+hDWfYyNK61zA6ltBARwccE581LmLYkji8e4RHI3Khag6lV2e1T7U4ykLej3BR3K5R44tM
	b307Q2pxMH6bv+j4jEpnH0T2Y3hbaGzu4jHZo8H2qYGnNryM9E6zN/D/LKoa0EzVP+Oqblf6S3eRc
	RbPSt2KYgnXuYdSPBIs6RbJXD7Uf7EWJrB8F77oiFacL7lQrr+AzKvLl0ZPWSg/dvpW6zV94CAVQD
	nFssahJmBJ1BX1s05kY5hxUAqOIDQZICMJixfJTYI92icne1NH/bMh3nmE0CDlgonemSxbPM+g5tR
	2xXET8Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voFTB-0000000Ax6P-3Eq7;
	Fri, 06 Feb 2026 06:37:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voFT9-0000000Ax64-1GiF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 06:37:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6160xc9u2058318
	for <linux-arm-kernel@lists.infradead.org>; Fri, 6 Feb 2026 06:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YQ77QTJWVPIZC+3oQok+biilGV/ElhSJIADxlZKOIi4=; b=PMdB0EygjMwZ2v4s
	8JWvxgJZt8aBWH/dFEJ92zCZnJ2gL7g2Kb+jSOCvCR8XuCgViI3hNnrL6u6mZtqq
	I5ASHxMsmh/SFTukk3uadZXbBeeES5mkB7HGuDNpdXvMYGuho8j8ea3t5yLW0jus
	AFWPKzh4WOFrte/Vvw0vCwGPKBLrktHLRiesGy2fPzFP34JpMt6Q6xeecvOrzuss
	ZwODlJHN/7GOi2d30ezxTx7cGwU6rD3R0aFYGPVkrBnrY6d0Mw8Jx2uB6M/AY13I
	24j5+7od4inTon7ffDGJeEZO7r4LQWuYxsOwmj1jGXFYZ0+kEWdHVsmNV0SwDSTW
	o4maEw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4x8bjku8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 06:37:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b799f7a603so9471667eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 22:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770359849; x=1770964649; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YQ77QTJWVPIZC+3oQok+biilGV/ElhSJIADxlZKOIi4=;
        b=IoBlbiRWeI212n9DJJJ/zgi0sqUW8tghO6COc5CyRAmb1oB54e/GRe37SAmVE0OtmZ
         9qgFnkZvKATN7KrrA1kJ0aIKdOW8cHq/86swqNXGEWHzw/k8Vq3mAsKATLbLiSub/z20
         cb4BvwGC9bmJ7KM1eUMLOeUH+eJtnARn4z/5N7Fti9dJE1C2CULXFynW1+HR7gwQk91w
         no0VZ8uWrlNCbkLtfIVfBXsnqzidp1BUdHhIh+QDQOGvxyro1ph0RRLLOdH0md6j+TZJ
         NPy1R/t/7N3xfSpe59ZVIm67ngU42ROgOKmsgnBLp+RS55GaR2RtwDLiwgAZCl6BJLU3
         dt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770359849; x=1770964649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQ77QTJWVPIZC+3oQok+biilGV/ElhSJIADxlZKOIi4=;
        b=fW+pp7MNeCOCf2sIpk1un4Ul2WQRKJdj1ylS1H7rt/XPpreQcFlOWcaujmXJMTUEPM
         TjJ+TI4UZQUnmnBlMP3v8cacPy2vgEdTwPC/8h0MRY1GDXuMB0PNKKTt4saPe0MIPssu
         iUmlAh/JkmU6s3RtgSJkF5M0WPBL+b41q20QdlkvD0ld0r+msDQPxXFgQL9O86SM0tif
         vzENBrBq+56eCklQTN9hnVdG+CnlnAkTag8Gnctv/Pmp3iTuK9xy/JDiLYvSUSJ2RR8d
         mFknPom4aXMjyty8AbPAZL+bqSoxgSqabk3IKPJs69uzqiUzcEH0hQORSD8MdLyamLxx
         kzgA==
X-Forwarded-Encrypted: i=1; AJvYcCWqH1e/Rxr5ZqU9bd6gJsb//Q1Q5g4ilcAlrdawSM5KrYh4EsF/mCmBETyQkfWbTAoIrrK1uWBqDA+gncvyjNrA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6P2Avyf4oJ5x0MUFfMLmSUChdoGMJWC1xCVN2mwfdoydMUxTa
	tSENW0Am8VMjF6yavj7gUzKD/vYhFb9u8np0v6K+H5XBC7AnGYIbSTos5cl+oUqVGDh0HEeGa8s
	TqSf1Cj7GWlhDTnTFVt8oA/tXXFgQ3UU5D2C+SZyLPrupk2V74nnqqDCu8i0dEmorbksctbpky/
	hBkA==
X-Gm-Gg: AZuq6aLxUSV4k36+CJMH8tK7q+lYdyG66fr7bSOn3czaNvkvxmCpZCZ+ay/xsOcq2nu
	7iskJI1AoNJaEPDUuvBBdEuZZpEYVvOXUFGEsgrXEgCRdU+7Kz2XxKRoJVVgFHlqxz4uzJE+/pH
	iGLo8EJ+LbgYEd8HM1Uv9lFJXmUjpTFAZebDiw7dHKBut2spv0i3pKmISAytXtzKUV2MJIonu9e
	qCF3+oCOPddTY86VxkLU3gN8G82/RcDBv7aAqyf2iHNUE+1eKrOGMkj/5F6rwQ0a7VgC1dx1U9Y
	I/c39WmbbGWtO5pAbRZW6+7URO+Yg7fZ7KYl8WKKGqczTPqUMYDEBXsn7iCOGAsbpvH1UQkd2oL
	MwkSZfpFpEXutXxBpMP+pMOLnaVPfboL8/Hxlm9alC5o=
X-Received: by 2002:a05:7300:fb97:b0:2ae:5ffa:8daa with SMTP id 5a478bee46e88-2b8563d94dbmr847091eec.5.1770359849125;
        Thu, 05 Feb 2026 22:37:29 -0800 (PST)
X-Received: by 2002:a05:7300:fb97:b0:2ae:5ffa:8daa with SMTP id 5a478bee46e88-2b8563d94dbmr847072eec.5.1770359848561;
        Thu, 05 Feb 2026 22:37:28 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855af7806sm1181131eec.10.2026.02.05.22.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 22:37:28 -0800 (PST)
Message-ID: <8ff96355-4a53-4790-9d2c-ea7d63be77c4@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 22:37:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: smccc: add support for Live Firmware
 Activation (LFA)
To: Salman Nabi <salman.nabi@arm.com>, vvidwans@nvidia.com,
        andre.przywara@arm.com, sudeep.holla@arm.com, mark.rutland@arm.com,
        lpieralisi@kernel.org
Cc: ardb@kernel.org, chao.gao@intel.com, linux-arm-kernel@lists.infradead.org,
        linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
        sdonthineni@nvidia.com, vsethi@nvidia.com, vwadekar@nvidia.com
References: <20260119122729.287522-1-salman.nabi@arm.com>
 <20260119122729.287522-2-salman.nabi@arm.com>
 <b5fd72fa-fcde-4f7a-bfad-17465d7e3841@oss.qualcomm.com>
 <c29f4a15-1753-42ca-a4a4-ca429053163f@arm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <c29f4a15-1753-42ca-a4a4-ca429053163f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GaoaXAXL c=1 sm=1 tr=0 ts=69858c29 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=6HHVuAIMxnVHkOBFbdoA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: bxJ4gZru71pSFglQjulQaCBHK1DCjW1B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAzNiBTYWx0ZWRfXy/OrfZa7US6d
 78NwdWLX3DuHzq3zCN307giuok2dY9dnrTFBsnDJXnsEIfNWg73Ud2UJJS8yKpTUyzR2JETUecz
 sgvK+2x+1Jkj3mj1QLCQZDxCdav4naDrthpKKneSUNR5O3giUztpeqzNZZ6oGy2HIWq0hawM8Z7
 lGjSqTYwIpk4PO+NpONkTkjI/sszpghG8IZN1LMeiKYWuf3oxiavWzZwx7YTL3tBWhMoAk/PYL0
 RoxtzJjXv+uclgfhUWkMO3RJyFZc+Vb6XgrnCrHfp0dVwrwcR1IdWedL2XlYN4rathMPOGDFpqm
 QmNHYbhkfvOSyGIKjscvmJS/D0GYSRp5VNMUnDdoFHhMrCWu8cqraJlc5vTFH6GB5/oowsV5pzr
 vNCK6tfWdqBvGG/Roi89qc/nBSogaCjo8NrJmbCtyf+HxZC5qPLYsKP/k+TW8BObdB+ye1rTNU9
 2/bTTEjVTBBuPUyCfzA==
X-Proofpoint-GUID: bxJ4gZru71pSFglQjulQaCBHK1DCjW1B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_01,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_223731_369795_0A858A0B 
X-CRM114-Status: GOOD (  17.50  )
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

On 2/2/2026 7:52 AM, Salman Nabi wrote:
> Hi Trilok,
> 
> On 1/31/26 01:35, Trilok Soni wrote:
>> On 1/19/2026 4:27 AM, Salman Nabi wrote:
>>> The Arm Live Firmware Activation (LFA) is a specification [1] to describe
>>> activating firmware components without a reboot. Those components
>>> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the

s/paylods/payloads

>>> usual way: via fwupd, FF-A or other secure storage methods, or via some
>>> IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
>>> at system runtime, without requiring a reboot.
>>> The specification covers the SMCCC interface to list and query available
>>> components and eventually trigger the activation.
>>>
>>> Add a new directory under /sys/firmware to present firmware components
>>> capable of live activation. Each of them is a directory under lfa/,
>>> and is identified via its GUID. The activation will be triggered by echoing
>>> "1" into the "activate" file:
>>> ==========================================
>>> /sys/firmware/lfa # ls -l . 6c*
>>> .:
>>> total 0
>>> drwxr-xr-x    2 0 0         0 Jan 19 11:33 47d4086d-4cfe-9846-9b95-2950cbbd5a00
>>> drwxr-xr-x    2 0 0         0 Jan 19 11:33 6c0762a6-12f2-4b56-92cb-ba8f633606d9
>>> drwxr-xr-x    2 0 0         0 Jan 19 11:33 d6d0eea7-fcea-d54b-9782-9934f234b6e4
>> Can you please explain or add a note on why we don't have name of the firmware
>> as the directory name and why you have selected GUID as top-level
>> directory name? 
> 
> 
> We obtain the GUIDs of firmware components from the LFA agent in TF-A, which does not provide their names. For convenience, we have added a C structure in the driver to associate each firmware GUID with its corresponding name. Because new firmware components may be supported in the LFA agent before their GUID-to-name mapping is added to the driver, we avoid using the firmware name as the directory (kobject) name.
> 
> Additionally, sysfs requires directory names to be unique among siblings. Since GUIDs are inherently unique, they provide a convenient, collision-free choice for directory names.


Thank you for the explanation. Please add these details in the commit text. 

---Trilok Soni

