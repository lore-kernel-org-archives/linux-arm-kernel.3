Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3D2C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 15:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cn5tyQX/xC6r7LynCtZ+cKfCSqVjcFVIFtjOQjXs2ws=; b=wl/PtvfwqZueVDxlMLbUAPOqkx
	tNLLxYwJrh0WsQfGx8NZzuwt7kD+C6d1biGz/RK1q3o+JuVs0SMKA5TMWs4nkSUdgVXcsui7VirxP
	4MzVLli25/QcRI+IrONiD0zJK7Pt9fGiPGgT8GHpoDsi5+gNAtdkK6ihjSKLKwWh9NgF5VBGZWlWK
	46STrdGPhRwnj3zWNUoqRPYiXXWPzAuG2S4zlzigXYniEyTEqT2w5ub7mo/zJUUfvSizsHRH/Hk5E
	v2Gti/yH1UExmUqMe0QQJxtVjAGcLkh2uK/ko4BK1MQX1mE5xLHwwNyCFIxVdQEPWLZ1gHLRad5Az
	aCNVrOxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udVw7-0000000FS9V-1tqO;
	Sun, 20 Jul 2025 15:26:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udVte-0000000FRtY-3nT1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 15:24:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KAYbU9000528
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 15:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cn5tyQX/xC6r7LynCtZ+cKfCSqVjcFVIFtjOQjXs2ws=; b=aPpK+mCfhjIK+hdD
	kc7epzo/3ZcjON3f1eCOhZl/+jNOdPGmcQe0iNhhRhkIZJxBFvmBjEoG1lDhrawW
	WKq8fUcUjITAkKZzMs73dSdMwxcenkCPDRygzrp9jTPA5TCb+IpU5l1TO9gUjEjn
	ONgP98f1kU/BXLkWA+J5p+fvp4ddAsZCNepIyspJVfaCI6rC/WhfESxgFavA0MQj
	xyUzWh6zHybxc0wpKiHYy6v3wdM1ZNTEUA9HpxdNwFdx7oe51MwYXq20yqCTd74B
	OuFamdAimiUVF3VTbfn1qr3alGcNCYIS8se8lgB8HqvLoCOma2tcZP4HfSkiwwsb
	fGxYvg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451ac4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 15:24:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so3744156a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 08:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753025051; x=1753629851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cn5tyQX/xC6r7LynCtZ+cKfCSqVjcFVIFtjOQjXs2ws=;
        b=NobIwCOoz0T5pUwT5Evs4d9rqP3Lj3zkhumKuB2F3/Q2xPvf+eMWVuewis2Bv9H6kY
         0ZWQ1A8/m7aRlYo64xqOOjanFcJfxbV/0ZoeoMcD0/MCNsSKW92ti7N52Ayc8KQXiakN
         0xber8uagDwta1OC3093ZO2fUteHOWpC647DNbZgQIEpoipSkqN76q7oTO8HuFZptTeb
         YUSfQxC2gJE+C1yOcWy5ihgrK2/wKd7HsVHw58kaSU1BTmLuGoFmX0MD6hcy45ykw6mP
         3QYXWa2O2FVavzbZ8z1Ujim825h2ScvUHibb+l6+vacJyl7/FNPDZJ2WyV+bW1Ehic7i
         Jpag==
X-Forwarded-Encrypted: i=1; AJvYcCVSHkoSl8VadIpKpjwE6Ukn+HaLr7UjciDWKlBbdaADvNOGeXOVBSOcttnZiTRlymMzzf6Hp3V0AZNW1cl0ue4G@lists.infradead.org
X-Gm-Message-State: AOJu0Ywuefz74aS5DWcByXiHsbUUiTYoQZZBQWrvfwYVSQsoogkqyEtI
	zZVmY+T2kPNJi2ZrNuGceMCk1KAFTOqvTr/0MfxKNdePac5HQYFYq/B7J19W1tudJvprj2PXY1j
	o5c37GSZ/krnvLgezyAm7T9Rv36WqVzfd+kk60uynATC1RoQEIRBKS5kfZw88TtvayKybOgwf52
	Q+2A==
X-Gm-Gg: ASbGncuLJVtMhJpPGmO0fHrMytjGU83upKPZP0MeY9TYCvNRJecYV2XPiOfqwOwemS6
	Zf0vsg8I358PoqYYHGI6l85jhOZUZyN6SMVmWJa24t58LwaPdTANVAJimhX5UkFKYRcah3h0uQ8
	7zmrED5WEzJff/fEPRsUMG/SOEeXynLTJPV/l4fgOJJ0kIYEB/NlArFew7xHZ/VTSn5ANXwU9WY
	94TYAvGwXq/Xl5ohNRdgmyD97tJnbbqcx5iiKk1OqmiknHbxhkZ1SdOSRDJ1ehxS2vExeZQWMeG
	vb85VseMwcq8EaOWH2gmbAwCcZGsXupBTQTbCKXgmNVz7OVTm5tCWbWpRhJNM6KaAZ3NMxebj4G
	B
X-Received: by 2002:a17:902:e845:b0:234:d7b2:2ac3 with SMTP id d9443c01a7336-23e256b5f6amr233001605ad.20.1753025051558;
        Sun, 20 Jul 2025 08:24:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUOqsroGWNvuq0aBkHthsIfTFvGKyjKlWXBZvHeY8vMrQhZYhY78dv87gCgxB4llexBH7YVA==
X-Received: by 2002:a17:902:e845:b0:234:d7b2:2ac3 with SMTP id d9443c01a7336-23e256b5f6amr233001145ad.20.1753025051069;
        Sun, 20 Jul 2025 08:24:11 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b561bsm42672895ad.89.2025.07.20.08.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 08:24:10 -0700 (PDT)
Message-ID: <d604104f-837d-34e2-ac62-261a8ccecfed@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 20:54:02 +0530
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
 <1653597d-4d6b-a771-fbd8-c129c630ac0a@oss.qualcomm.com>
 <6227828c-5db0-41c8-956f-eea6f790ccac@lunn.ch>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <6227828c-5db0-41c8-956f-eea6f790ccac@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687d0a1c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=AKgrFWMC3jRjh4njwhq9Fg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EyloEgBdZQ85O2IC3a4A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ncBpeVtLZKI67tYcdrBph9YgqI_halVm
X-Proofpoint-GUID: ncBpeVtLZKI67tYcdrBph9YgqI_halVm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDE0OCBTYWx0ZWRfX19UidfZff/mt
 8ugPexHeD4UBSi3oG6/N4w2qnZS/0AV05hC1QR1ZF5JBjgUgOQokoWv91Mt0LKOAGS08bmcWlJd
 mlXoihyyD+UNmPbn52xL1wA5hZLjnlNdLopDeNxqG5QKyzaR0K/iZRkPrXIOmF/cLtGT+puBxuQ
 JlRXCiV9lh9fJfmTgMt6kkye32cUyqzfXry2Yumunq9khKhWaDTdJoW+9a6nc6+X/38/Vk7BXVM
 f1cPT0ez4SNvzsGg+PvdxH0uoRC5sr040IBhvgqinJxAbUvkPElmx5GL0BYgBF6i6+eSws417zy
 fY7x9RgL0vyDBZeMewA+M3ryEMNIFSmkADi/+cSEFGKknzwXTK5qvJtku2Xj78gYeVOCMzL3+Rn
 xwsREh22LZ6NdEKs2cdGYYsrP550qfXQdYJjQo3K+f0KsGzCcjFdBIggin7XpBakU3fy3WE5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-20_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=814 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_082415_066421_5D1E962F 
X-CRM114-Status: GOOD (  14.94  )
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



On 7/20/2025 8:46 PM, Andrew Lunn wrote:
> On Sat, Jul 19, 2025 at 11:07:47PM +0530, Shivendra Pratap wrote:
>>
>>
>> On 7/19/2025 10:27 PM, Andrew Lunn wrote:
>>>>>> +static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>>>>>>  {
>>>>>>  	struct qcom_pon *pon = container_of
>>>>>>  			(reboot, struct qcom_pon, reboot_mode);
>>>>>> @@ -37,7 +36,7 @@ static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
>>>>>>  	ret = regmap_update_bits(pon->regmap,
>>>>>>  				 pon->baseaddr + PON_SOFT_RB_SPARE,
>>>>>>  				 GENMASK(7, pon->reason_shift),
>>>>>> -				 magic << pon->reason_shift);
>>>>>> +				 ((u32)magic) << pon->reason_shift);
>>>
>>> As a general rule of thumb, code with casts is poor quality code. Try
>>> to write the code without casts.
>>>
>>> Maybe something like
>>>
>>>       If (magic > MAX_U32)
>>>       	   return -EINVAL;
>>>
>>>       magic_32 = magic;
>> sure will update it. And in above, should it be recommended to add a explicit
>> cast(for any avoiding any compiler complains)?
>>  like: magic_32 = (u32)magic;
> 
> I would hope the compiler/optimiser can figure out from the test the
> line before that this is a safe conversion. So i don't think you need
> a cast.
sure, thanks.
> 
> 	Andrew

