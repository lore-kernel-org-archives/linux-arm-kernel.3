Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B750D6AAEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 18:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcWidb0g7mISXBlwewytBfawymICqfUvqsWYOfnAtxE=; b=jZoU3cNge8jNoUBW7SLxOTX+Rz
	IJyTod4yzGPbOdRhOy7Ue5hNkhr8vFJV0S8p9/IZXNT0F1mQq2e/9BIc7d0GEpsLvr9bQyf6tl+uq
	/DElOrhZhU3I0fDx9jtS7w99AYiWTdCf1g5B/Lr/1sDu112EkwAbPLWlBe1cxW4D8CC58OO4GttqB
	J5yQ0ZVkoD2yMSXn49FApqLoPzOmmc0MGijo6YUUaGfUmxGoShFstSR4SwF281Y96n37EaLaGUawA
	JeqWMUdPfENlOd7MgiPCDCFayS8gNC6epizVbzhXLz2l0E/02LNhj/6npNNwqmm/x7vugX9Mcnb7L
	FPXG1QUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MwQ-00000000fyS-2cBJ;
	Thu, 02 Apr 2026 18:38:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MwO-00000000fy5-107H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 18:38:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4Xwe2255131
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 18:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wcWidb0g7mISXBlwewytBfawymICqfUvqsWYOfnAtxE=; b=LNUDSLVgUIcXvya/
	zWZIFsBMCsN/bRBMhJrU7x8hMg/Z67l1Y5/FoYuVPER1k4t5QAoYDK92NhcHScQ0
	UDuXxFtYAIUWqfotqoVDWWFcGlspviMxtczSkVsA0VLPeTk8NDHFnTWTLIGZbwy1
	Ylyrmo/UtBbTlAvABsBKwn4u+H8XzIUpQSpiyuqq365qFTjCUC2JvJan/ADvkf5G
	fhjvZFtVfzMjTt+lKi7zJx+o5x6NozPs39lfyeJm5ruGYsnV3wCYzLgGeNc/baP/
	Cq/+YfU2wDMPO7SU6Wvs1gUfVk3uL1nUXlzxhZbI7FNtqPE0g6I/EhLE+gEzsdeG
	Znv/Vg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9n4t2b7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 18:38:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76cb2dce57so585054a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 11:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775155131; x=1775759931; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wcWidb0g7mISXBlwewytBfawymICqfUvqsWYOfnAtxE=;
        b=SjPn1fUBP4m4xkHk0pakhZK1na/F9Tm1MogmmcI1RQwOAdlMEA04SU6DwBadC1gpSG
         Oa3PmSyzBEjlHpCi8HyWH1oiaIaCtL6uJL37JIBqF3yOMWtgJFiFnfKq9IW5Zb5EPW9o
         9gtU7C5lnbzRQ+Iz6ryqMdjWN+iVlBNVMs6LasL+g9JeL9inAF6eclhPuqJBisi05CaJ
         lr8dQYIZU3llsG9whdAnOhko5yx2E8bTQrClDlkqimPMB0XrKo3HG5qZdlx4EFtbv6jj
         0w7UNAuRWtOyshBnu+tRbwOTahmNu6tbS5XVZRPQrm1/AA15BmfafCiM03xkz8EHuMOB
         hnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775155131; x=1775759931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wcWidb0g7mISXBlwewytBfawymICqfUvqsWYOfnAtxE=;
        b=Kzymgm/tfPg5sgc/Td3t6NquS8I1sbDm2i/xtdoaE2rYL58LmR1L/5Dl26YxKe5JXz
         uKhSK7/jdjg3RBo2fxAYyKOqIR568EZfsdt4DcJa2uPyoEzICTu8M2YyvIyMsPMudHDr
         AGwiBknVi5wna5rhU0i2T/fwJxNOT6oHB8FlFyzmhQUHzW0WMXFW79bOgyNkBbvu/H/F
         uzHHUDgSj2D1FF/MystzCrhjt9DfS5hEXmH3zpJFU9Iy3/CNIx6ZjOmGrinkiBcfWGH1
         PIqT8YVfCyBvPoVEZC/9IatWLFavx04wl0BAUzppGGgnh2Y7XLSfEXM0q0blVho620Se
         Xjug==
X-Forwarded-Encrypted: i=1; AJvYcCUok9Wd0RwRzGFaREMy1i8Sb8GJAzhxOjaiesNn8/vpeLwkY166axTF94R339V58u6Jxy4feYT1zEmyfCoLEUV+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0objzpEnQ2roaBKIYgLjGURcTdBV1X0viKugkAsqV6PbUH4jS
	8Dw0acAS86HdBe+eQ0F1fh8mpme/qwrClSaCXnjVMe/ShSwifB4LI4ydY5CeE3WuZYCyVpQh4NW
	hBKNpuGi9zGh7pdS8YLMfXYggubl+OsxyU6W0uoAWWxjM06yH/chnpPWQsAi0P4aoO7meLzG4Ti
	XqPg==
X-Gm-Gg: ATEYQzyqEZK0Y1BGiwbvgP+mQEhaSP/MfsNzPd9mlS8R9IAMl8R+jVCxp236ubMid6o
	KunVAD5+eCNSwFk5LCFSDeVKPpUTzm311MxU7Qe9snRArE4OSgGui3CTZz1NHfm1wTXc1jE02gs
	fogYozLRTET2+xGwybxhMlholDSopAMMtf+iTUwsWX4AAxjSAYcJaQzD9HUjmTg4XOGu8M8YMuQ
	FRKBrtAgU1+YY2wMpU4r6OlssxED7lXsrHA7CU0LfrEYG1juGHO1KcYMe9lhpY1OREaQ1RCxjAr
	H4u7U+YBlokLGy1sZrEYnMPpyS4MhzKPK5smeixwlOzSoP0nOuKtOehjRAKSQ8QVA46Hj1d+ew+
	0pVtYYhz9kTwbA0/RF/hRnKWG6Udxi+I3cm/KhyogJIStiR0X1x1lxwSkkA==
X-Received: by 2002:a05:6a21:32a6:b0:398:6b26:dbfb with SMTP id adf61e73a8af0-39ef773e5aamr9643381637.49.1775155130816;
        Thu, 02 Apr 2026 11:38:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a6:b0:398:6b26:dbfb with SMTP id adf61e73a8af0-39ef773e5aamr9643328637.49.1775155130283;
        Thu, 02 Apr 2026 11:38:50 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.227.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76d2684b75sm192469a12.14.2026.04.02.11.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 11:38:49 -0700 (PDT)
Message-ID: <65c52a56-9c2f-4afc-afa3-a574df0aa045@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 00:08:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
To: Arnd Bergmann <arnd@arndb.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <acaMPgRALnoUIHMC@lpieralisi>
 <93a78bc2-4fd1-41bd-bf4a-b433b06fc218@oss.qualcomm.com>
 <ac0trUGsRBLPS+ux@lpieralisi>
 <f6ed07b1-8bfc-49ea-951e-b590bf8b299a@app.fastmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <f6ed07b1-8bfc-49ea-951e-b590bf8b299a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fI5wIkPKqpe5pCtQz6PgEgm6uGjrXTSo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE2NyBTYWx0ZWRfXwQe3yQ3MdUdA
 GYh6M0EOcwS3DcHDNcA9Awh5gzZL7jhgxqo2UtsvOxMb3dzv3t98C8WJSR+V5ci1ljzrdhcfoOl
 VIcRt11ssLebnQDsqZWNdezo6QGtAM/Wn7VeDvZr2qp4g2+6cvp8BdtXDL+u0Q2f30WCvVvep+F
 8xFxek8WCCy7rscpdb/nJJCN7as/us3+R2KafGSvQcJnZ4KQasM1yHrLFIeZP8TaUDs1dA/goKI
 9BqEdIUAqi2+gEjvKur57MIS2EU4VrPjtw2ns/DlLkfFb3+DyAn0Q5WY1lyZumCm/COCSoGTWbz
 ylN9Cgz+hDwAgvm0OtoVDaEDmf7UsPvsc9e7qCKAZEK4/iZRgaqC2P4pXu1Qh1szCPDYg1fJb7B
 eRvqBBf/ZdS0aifCpQSBed7T9+TepCuPDHxwP7sdMdK6sCfKFUWYGsfgspS7pHCVQEvHZunAWK8
 +aa1vcseL2WDjfoSyiQ==
X-Proofpoint-GUID: fI5wIkPKqpe5pCtQz6PgEgm6uGjrXTSo
X-Authority-Analysis: v=2.4 cv=Ap/jHe9P c=1 sm=1 tr=0 ts=69ceb7bb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xCZvIt4Xq4xTzMb426/Gcg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=wAd9VK4cKAlaSywWKTMA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_03,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_113852_312967_DB914C54 
X-CRM114-Status: GOOD (  25.60  )
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



On 01-04-2026 20:26, Arnd Bergmann wrote:
> On Wed, Apr 1, 2026, at 16:37, Lorenzo Pieralisi wrote:
>> On Tue, Mar 31, 2026 at 11:30:09PM +0530, Shivendra Pratap wrote:
>>>
>>>>> +#include <linux/err.h>
>>>>> +#include <linux/of.h>
>>>>> +#include <linux/psci.h>
>>>>> +#include <linux/reboot.h>
>>>>> +#include <linux/reboot-mode.h>
>>>>> +#include <linux/types.h>
>>>>> +
>>>>> +/*
>>>>> + * Predefined reboot-modes are defined as per the values
>>>>> + * of enum reboot_mode defined in the kernel: reboot.c.
>>>>> + */
>>>>> +static struct mode_info psci_resets[] = {
>>>>> +	{ .mode = "warm", .magic = REBOOT_WARM},
>>>>> +	{ .mode = "soft", .magic = REBOOT_SOFT},
>>>>> +	{ .mode = "cold", .magic = REBOOT_COLD},
>>
>> These strings match the command userspace issue right ? I think that we
>> should make them match the corresponding PSCI reset types, the list above
>> maps command to reboot_mode values and those can belong to any reboot
>> mode driver to be honest they don't make much sense in a PSCI reboot
>> mode driver only.
>>
>> It is a question for everyone here: would it make sense to make these
>> predefined resets a set of strings, eg:
>>
>> psci-system-reset
>> psci-system-reset2-arch-warm-reset
>>
>> and then vendor resets:
>>
>> psci-system-reset2-vendor-reset
>>
>> at least we know what a string maps to ?
>>
>> We can export a function from the PSCI driver to detect whether PSCI
>> SYSTEM_RESET2 is supported, an equivalent of psci_has_osi_support() for
>> instance that we can call from this driver to detect its presence.
> 
> Sorry I've been out of the loop for this series for a while, but
> can someone refresh me on why we got back to mixing in
> the 'enum reboot_mode' from legacy i386 and arm32 into the new
> interface?
> 
> I don't mind having whichever strings are defined for PSCI present
> in the user interface, but this seems like a mistake to me.
> If at all possible, lets define your own magic constants that
> are not tied to "enum reboot_mode" or the legacy reboot= command
> line argument.

sure. will remove usage of "enum reboot_mode".

thanks,
Shivendra

