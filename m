Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891BACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 14:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjXlGf6kCK1SRmg1a5VtEsJaR1Zk+XRBUVbJsc742Xk=; b=ebaap9rJdgrrLQw1O+JyBV0xcN
	cMZQodznD2FR7mipTAITeURLMy0a7qV/m0me5ewzVB8Q7QHyg+Hd1rpQi18HXNNcyPiOJv2FQx/SW
	yAoHBD55GWBHTUbek7yVWAHY2iTU9tOKtbWLwmBfD226apTdNLr939HjCFL60D6GVMoi8/gdvCz1/
	eKykySGmna2TCJojpGrgvQe5kFhMdvRuTEfI2bxMkjfhXz2ANB8PExlkepmFPQpLEfBa/c+fWhEVZ
	/LZ+xtZ1+tdZTgW46VzztZH3MlXo9XSIe4do75rm5Yrfu+XtmsMf+ZXuoqfZaC+MQ21T7+OgK0GHY
	H4cczjHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIT2O-00000005bXu-1vi7;
	Mon, 10 Nov 2025 14:38:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIT2K-00000005bXX-3H51
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 14:38:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAD140P3676944
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 14:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjXlGf6kCK1SRmg1a5VtEsJaR1Zk+XRBUVbJsc742Xk=; b=Fs/1mSr6ibXTZsBm
	K5ACt9BDv18vhbSavu73Iw/bUfBeSMqG7PKz/LE6fa3WvrCs53lpV5uD38jrsVYT
	Lzpw3TaCvOuBJYvrK8X+QejBmwOf4xpqIIxkvBIuGFQQWx1iwazN731vOfPTfVDW
	buOdmttgzcjg/yKdGIZsnELNhOAt7w095Q1A//CC1fIhwKZmZ25t1hY17sr/SX7t
	k6haVM9zF1eFi4QBlG/VcSq2if1FrHkoGtm/w6qrY2XhWbhWyleUkZEKZLx1hflH
	POTYPJ6J6MNQIMYGIiUF6Vr/7q92cffk777Huwd3iWZNwM24E8o92VkFv59jC6P7
	x/DVOA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abgjh893t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 14:38:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340c261fb38so7143416a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 06:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762785506; x=1763390306; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DjXlGf6kCK1SRmg1a5VtEsJaR1Zk+XRBUVbJsc742Xk=;
        b=Ypp/YMeqpAnldTfPulRDZ/ZCJRVYzoKhQnCcC9HW8t78oF8YtD2zU4y0G82d8bh2iI
         bv9/LAVQuL3TpCFMmtkHHEx3QhnGVoLWx/3eqiNIkBEXPOh6d7uGwFRKWMpkTIBaNBqI
         ljA6cBaFrrdeRGRS27iRc08nDQBJuWVQXPtfRaYxcLlXkSj/TwwYsbN8NjFz/RDA6Duf
         Prgw+qPvTHQEPSkjO9hBkdimQOlv2uNfO8jAd76rxV2PDf2o0nkCI3IVQxp1N11TJmCC
         QYGBmrIbkonkhFd7AKSYSWeONr85zcSnRRyWoiHveGaJp4dXEry7YYWXO8WRxz7LxySW
         pNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762785506; x=1763390306;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjXlGf6kCK1SRmg1a5VtEsJaR1Zk+XRBUVbJsc742Xk=;
        b=tc5OAFq1pYPvNb5iwr/hhSU78t/7SNTDKb9Ts+Dn2oMCprU+kT8UTCKAX+G7dTjY5U
         1CTdsD9qL27EfE6uGIKW0iyq2Hmc5INvMEH2AqpvXncs+v7e64DJ+TGvw2QfhV/AfT00
         wABIjM+bom1k67saV1UFhnTYrz59AgdHe8pXCkgYIYUU3xFxcsOWv2FRnfZnwKvZWnX+
         4cwl8RtmrOMf+tJ/Qm8sv8rlnIvjin6FLpYP9uQ/77ssVv8Y6pvd8Lug8d1rnl/dOANv
         mTPDWHi4RkSlg4FuBJEn/Y5uBPmVY44MxgCEoNNX68o96rJ9y9nZ4Kh7SpkNd4ebTAh1
         xP3g==
X-Forwarded-Encrypted: i=1; AJvYcCWVrVj6wseJ00ALxMF4I4DUrzSqBrRfG2KnqC/h2O9Zgq+XppfxJgLh9mWjF8x+/N/tl4n8LC7T9OFUcMna2kyO@lists.infradead.org
X-Gm-Message-State: AOJu0Ywptt1Y5SdGJAealjre2TKsg0jZS95B71VUjJ33/59h7XS3qmYc
	AU+vb1s0G0NgMXglKDoU5Mo3DYP8wGDPPir1HHSsdyp/ma934sHs7EzefpKjPXwiezP+7nF58Gs
	zBXhB3IMSv6o7YPvZq+fGMCO7Z3uinWmN1C8oRt0ibAZGGf5K1R4CYwxeytBqQNhugJRQNljQc2
	IE4w==
X-Gm-Gg: ASbGncvdTbZqv31IkoyBSkn1shZsckaXdypIqgArbq7ABoWUBm3ldlChgp7Ydp/a3fR
	GSYd2g41EFtcyMn9l5Kz8Bc1nZd4nbvjM3BnOcJnfXAe8pbxBxNjxfzE+huqH/yIlGzjih67Id8
	El13+tNk/Dx+m9r54VM1m8iLQtMSlTj9Qft3FJVEw4s/xW4ggmJ8/6398HnLwRXNC/NGejWbgGs
	X25QiqYJK5Nh4/ZetbAAShT4i3/iCwN1fq5F9YZ5QCkSPp6QrMM5qrhr3uwhbLm6+31iBLHrBhU
	Q3uHGzMH1EGpjNLvM/o5i+sddTghD0kUkTD/UwSvt6nqyRl4mMvko19h6ILwrG354bvABL4sYV0
	injUSuitDQ14kgF2OTzoT9Er71+D8ENZX
X-Received: by 2002:a17:90a:ec84:b0:340:bde5:c9e3 with SMTP id 98e67ed59e1d1-3436cb91ec3mr10817668a91.23.1762785506395;
        Mon, 10 Nov 2025 06:38:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcDiYkW+6pedjCMiR1BaFljPhTaDiM32XOE7C47GkBGlZcqk0BMUcwHHXae+/cHPVW0xghTA==
X-Received: by 2002:a17:90a:ec84:b0:340:bde5:c9e3 with SMTP id 98e67ed59e1d1-3436cb91ec3mr10817613a91.23.1762785505845;
        Mon, 10 Nov 2025 06:38:25 -0800 (PST)
Received: from [10.219.57.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d0aee149sm8431073a91.1.2025.11.10.06.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 06:38:25 -0800 (PST)
Message-ID: <16521e84-9da6-53a7-febe-9decb6970c06@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 20:08:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 03/12] power: reset: reboot-mode: Add support for 64
 bit magic
Content-Language: en-US
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-3-46e085bca4cc@oss.qualcomm.com>
 <20251110134529.uljjqzb3vhda3vya@hu-mojha-hyd.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20251110134529.uljjqzb3vhda3vya@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEyNiBTYWx0ZWRfX12HSragmYfbi
 93nr20bgaPylnBAZAnj+ORbq/lEPY68CX0wGGZ8PnRUytlkJ/m79iONEV1GMfyB/pfT9Fn5RCIE
 HuhAb1F1Js50eHumQW7U50VKIFuEnKW+90r1pSvmAPeQGfqmvcou/pIL7vM91nXMJrEzT49QFHv
 GH/g6EDf8uE0EhP0jwYqzrdil0wILY8clLBKPBqi0T5C8lf6mYZTacjsQOTY2HUtokkiwUQ0Yzl
 x4hbDkRZdUzFLGaeJGhuY973wvDmC2yduC6vxuvR94AiErC80w8zOEC5gAnHrohkpzGiJXBpQrH
 I/D9IVQlgIlBBWrWaNOcEBxQp0TDEaOSAnxguWioxE6ISGhqcwNc3obV3Xh1zVbQ37Hxn8Vlce+
 1H+LCfBXXxi5tshX/5Fuz777xeJPkA==
X-Proofpoint-GUID: J_8zt_nGMZ8Ivsbs4G74SLVmnmcimtL2
X-Proofpoint-ORIG-GUID: J_8zt_nGMZ8Ivsbs4G74SLVmnmcimtL2
X-Authority-Analysis: v=2.4 cv=La8xKzfi c=1 sm=1 tr=0 ts=6911f8e3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=vG-lknqJ1RofaPO6YZUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_063829_042142_8841C497 
X-CRM114-Status: GOOD (  20.42  )
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



On 11/10/2025 7:15 PM, Mukesh Ojha wrote:
> On Sun, Nov 09, 2025 at 08:07:16PM +0530, Shivendra Pratap wrote:
>> Current reboot-mode supports a single 32-bit argument for any

[SNIP..]

>>  
>> -static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
>> -				    unsigned int magic)
>> +static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>>  {
>> -	int ret;
>>  	struct nvmem_reboot_mode *nvmem_rbm;
>> +	u32 magic_32;
>> +	int ret;
>> +
>> +	if (magic > U32_MAX)
>> +		return -EINVAL;
> 
> 
> I believe, we need a comment in all the client driver.. 

Ack. Will add a comment.

> 
>> +
>> +	magic_32 = magic;
>>  
>>  	nvmem_rbm = container_of(reboot, struct nvmem_reboot_mode, reboot);
>>  
>> -	ret = nvmem_cell_write(nvmem_rbm->cell, &magic, sizeof(magic));
>> +	ret = nvmem_cell_write(nvmem_rbm->cell, &magic_32, sizeof(magic_32));
>>  	if (ret < 0)
>>  		dev_err(reboot->dev, "update reboot mode bits failed\n");
>>  
>> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
>> index 7e108982a582e8243c5c806bd4a793646b87189f..d0ed9431a02313a7bbaa93743c16fa1ae713ddfe 100644
>> --- a/drivers/power/reset/qcom-pon.c
>> +++ b/drivers/power/reset/qcom-pon.c
>> @@ -27,17 +27,22 @@ struct qcom_pon {
>>  	long reason_shift;
>>  };
>>  
>> -static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
>> -				    unsigned int magic)
>> +static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>>  {
>>  	struct qcom_pon *pon = container_of
>>  			(reboot, struct qcom_pon, reboot_mode);
>> +	u32 magic_32;
>>  	int ret;
>>
> 
> Since we are doing this change in reboot framework, client driver should know about
> it too about this new check because of framework.

ok.

> 
>> +	if (magic > U32_MAX || (magic << pon->reason_shift) > U32_MAX)
> 
> 
> is this (magic << pon->reason_shift) > U32_MAX really needed ..?

Can be omitted as we already checked magic > U32_MAX. Will
remove it.

> 

[SNIP..]

>> diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
>> index e0772c9f70f7a19cd8ec8a0b7fdbbaa7ba44afd0..3cbd000c512239b12ec51987e900d260540a9dea 100644
>> --- a/drivers/power/reset/syscon-reboot-mode.c
>> +++ b/drivers/power/reset/syscon-reboot-mode.c
>> @@ -20,16 +20,21 @@ struct syscon_reboot_mode {
>>  	u32 mask;
>>  };
>>  
>> -static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
>> -				    unsigned int magic)
>> +static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>>  {
>>  	struct syscon_reboot_mode *syscon_rbm;
>> +	u32 magic_32;
>>  	int ret;
>>
> 
> same here

will add comment here.

thanks,
Shivendra

