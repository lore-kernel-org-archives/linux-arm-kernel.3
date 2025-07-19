Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089BFC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 17:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZljlJT2qbBwi7FRDYe/gjY8HI2+8fcJAaiOiTqbESQ=; b=VbdUJPHnSggQ4/ccSrBGTqmQUm
	+TKCJjZdDtUuJhFbp2Jg6TPybKEdFww9zj/T60zerb0qY6serylHRhyCSb+sI3q2gMjuQMAAMXkzF
	3hpr1F0CKVCHjjWO/T47GPllbO88yibagyisMTMt9+JhPCEGjkVW1q0V77JyuUhIAHQu6sssYQiqm
	lEiOes2afFOg3ek2W3ZX/WejKYPobhrpmjYZJBp1PuoOQdEN+nZ77+4zycEXI5Tf9ejihgaCS1Df4
	tdYY9YbmyOen3gZ+g5lmD3P8YzpZcqqq3yqdhBxo3WtlkdrZAFDs5gTqhaY836401JfPSiUladiGL
	//shL6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udBY3-0000000ETsO-0r2h;
	Sat, 19 Jul 2025 17:40:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udBVX-0000000ETh4-3t8Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 17:38:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56JDXqVe017308
	for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Jul 2025 17:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FZljlJT2qbBwi7FRDYe/gjY8HI2+8fcJAaiOiTqbESQ=; b=oL1WctaNTr2hoM1R
	AQtzwh9PTmZV6rRngkX7LxxhiA3DOUH87RckIoI4QMw/oPasgyI7m70T2RVOvSPa
	g3xFlS4+l8RN4ADGonFuWdYl9Wybvhun//i18RHqHxoXJUObrtse/7BjggXRbbmf
	LFFieVicZm5vOzmnXW7DoxphK+cWSiNSSj9EdX9rvnu0yrk84wXCyhhERHKILDi6
	D0ee9GJuqCZLZ4Piscbm4yFs4tlQwFij5TVMY+kQEqCa0BARtWVqyCqb+MdU0wYG
	LKbB/DTaXMEl/2lFRfJO31y8nW2IdPHbyf1/4nPQrjNBCqMtBYU/L1F1jdK35Yd8
	IwXtdA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044f90s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Jul 2025 17:37:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b3f321dc6abso1089469a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Jul 2025 10:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752946677; x=1753551477;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZljlJT2qbBwi7FRDYe/gjY8HI2+8fcJAaiOiTqbESQ=;
        b=wvKFjFPXMd9aTzMlTklhx+AvcOhUpENTatVia56Z21QfNRgHgFDbHUSG1seEBpUCeR
         DRfvZXg+j3fR/ChWn6Ci1YcE58er/RVROxFp7h7DqFa2Y34ENSqrxMaOGnnFJmgo00oD
         gbfZRXMjupxxjLgxTxx/gHw5MPiu9Bq5qP0xVzpR/YFh74+UZKQ74YxJ4yySVVKLOpTv
         Qtby5YyN8ht2d/5q3Z1Bu3Vtp4K1etxzeL8ck1nm1VXPGqWcfBzk4sGKCdnYgn1QouEY
         nOYf9KBlv48wOgpjOz4iliti2RrlbGGCO/Dr5WmxBKIJize+Ya0RW1u9rF3wBngthuki
         M89w==
X-Forwarded-Encrypted: i=1; AJvYcCVLOSaKeThZ2MWapwWTSzBHJ/c/GKN1Cxio9suqThDDA20wv6oS0bygX+byKCXxAZ0o6SQKhXQ4ev5mXIXLOSG3@lists.infradead.org
X-Gm-Message-State: AOJu0YwvkxzezdWQh9NgYH6iJOJ1mOlkXDpN4o9nNCCb59OzCX6Svmon
	VYxmqbgf5bwgzkEHdhVdQI97YCc1W4Zvl5eER85DjxtJtDhDNiry9EKzEUT29G8NyhDuZpyhKlU
	U3N3iTowMPp/fKmTUd4qjulGtwV6EV2Z+uvFuD0zoV4+rj++ag2BQZU6NZ5vKC1ZqzxJOOEAM2r
	XUvw==
X-Gm-Gg: ASbGncsOS5gi4B/WefRJtMEdRv/VmGPXnkJ8UIKfe6F4z7QgEffH6VqHF+PDySShp3Q
	u21JcPPM1LGPpzms4pzMdvxE+iBIaxYisSIbzQbvosg1JimkLG9RgmmcJH318Z2Wp0WR5l55w/t
	TWpP1nM3A62hUu4HV/VgMN5oocAr9hM5XTm9I4h9fy1pt/jlZRKcEgNzoU8UXTFZYYkWdL8Eb6g
	7gJv1iN5cwk5jN1nQE8hDSk6NzOTlPMilLue4smeIfrqR6WqE8W+Yk8JgH2McMidvMqN8cYVAxO
	/DzE/eB7kwTqVuEmygCB5S4TLGqykoHiFZeCdL8IsYW4Q0vManklxXstXiF6TD6MHdaXPlYsI2F
	e
X-Received: by 2002:a17:903:1a45:b0:234:c2e7:a102 with SMTP id d9443c01a7336-23e2576c1bfmr203194095ad.43.1752946677270;
        Sat, 19 Jul 2025 10:37:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmsqS+oyiroy7F7asjC+RhuXy5jbyXwVyJMviTpt16hI2w+2DRxkm7tSvxqRyFMSouRG3FRQ==
X-Received: by 2002:a17:903:1a45:b0:234:c2e7:a102 with SMTP id d9443c01a7336-23e2576c1bfmr203193755ad.43.1752946676803;
        Sat, 19 Jul 2025 10:37:56 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.231.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e2d7asm31792585ad.1.2025.07.19.10.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Jul 2025 10:37:56 -0700 (PDT)
Message-ID: <1653597d-4d6b-a771-fbd8-c129c630ac0a@oss.qualcomm.com>
Date: Sat, 19 Jul 2025 23:07:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v11 2/8] power: reset: reboot-mode: Add support for 64 bit
 magic
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
 <20250717-arm-psci-system_reset2-vendor-reboots-v11-2-df3e2b2183c3@oss.qualcomm.com>
 <6vlm3ybjpy2jq3cr2pzj4vcmqwoissdml2xmhfzlulfbrpzakt@xrepu6c5zykb>
 <713b2cc8-1bc7-a8b7-678b-5fc7fe25615a@oss.qualcomm.com>
 <8d4a42b6-657f-4c30-8e25-4213d8d53a89@lunn.ch>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <8d4a42b6-657f-4c30-8e25-4213d8d53a89@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IqmNdxARqKOeir41ICA7ipqOcTX4wriw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDE3NiBTYWx0ZWRfX7v2LQO2jwyco
 iy+uFwjbTfeH0REaKHt5eGBWaHPwoEkc6euNn1CMSaDw7NwcelJpXai5yA78X6AmGBy65MXCkWL
 +1+VVooPUxCgJM2LDzt+jozktAX4XpC0eA/WDnn2z/MR4QzKy3xuDEQtpz4GdGcRJVQqtvSZJgc
 wkzXl0SyavhFwxLHIBhjM6B0n/lVIkGX3Cy14G4iaiURkRMtit0R8phNpW+0i55hUdEFAzJDdi2
 L/el9oCT6GEdNY4ceXmcbZAORwDX/iV5EAha/4UrGFMqBz2xB+SsIdSTtiTIKRfFNnkQbVAqpqd
 WcjReh1q5/SkCdK56JDZIUgjIlD4smgcsyMt4tkmZK0e8/M8ihN4+SrNZZqj/T+oapcGxKZzCFb
 HKPU7rYe9R1ZZ7WgsRHTQCgRTxjlHfoy6KlUA++xNtzNMe3ou+Dd94/RVuJWE6BYf6iUs8Cy
X-Proofpoint-GUID: IqmNdxARqKOeir41ICA7ipqOcTX4wriw
X-Authority-Analysis: v=2.4 cv=YtcPR5YX c=1 sm=1 tr=0 ts=687bd7f6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=PsbcbGlCJbaar3GLNM5paQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=vijFQojot4H3nP37T3UA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=776 suspectscore=0 clxscore=1015 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507190176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_103759_984739_F4CF5403 
X-CRM114-Status: GOOD (  15.52  )
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



On 7/19/2025 10:27 PM, Andrew Lunn wrote:
>>>> +static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>>>>  {
>>>>  	struct qcom_pon *pon = container_of
>>>>  			(reboot, struct qcom_pon, reboot_mode);
>>>> @@ -37,7 +36,7 @@ static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
>>>>  	ret = regmap_update_bits(pon->regmap,
>>>>  				 pon->baseaddr + PON_SOFT_RB_SPARE,
>>>>  				 GENMASK(7, pon->reason_shift),
>>>> -				 magic << pon->reason_shift);
>>>> +				 ((u32)magic) << pon->reason_shift);
> 
> As a general rule of thumb, code with casts is poor quality code. Try
> to write the code without casts.
> 
> Maybe something like
> 
>       If (magic > MAX_U32)
>       	   return -EINVAL;
> 
>       magic_32 = magic;
sure will update it. And in above, should it be recommended to add a explicit
cast(for any avoiding any compiler complains)?
 like: magic_32 = (u32)magic;
> 
> You might be able to go further, and validate that magic actually fits
> into the field when you consider the << pon->reason_shift.
will add a check to see make sure the value is in range after "<< pon->reason_shift".

- thanks.
> 
> 	Andrew

