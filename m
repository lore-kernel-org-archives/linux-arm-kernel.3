Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B76CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 13:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWjqgXqaMryRWoWPpxKyf9wQ2j7ANbAzyzhN2DMzuFg=; b=Sf+Zk50pdwQkN+isuAgHfdbGSF
	+rVaUZcGE14LBpW4sKlxnwQVWqg6jT7chq6smLXTCntYF0guIUr/FsLK95gQm4wkOXwTFFR3RQx3y
	KlG9agpyzHJs8q2nJ1bqmYdhaDzRpjdn8fAennxF6SN/mK8d+Xy5cbq3et0v8DAYdzvQPPn8zNmeJ
	AjSoxZH6MXjJvd3sNf169p6Ma/j4UJ/+ETdyUi2FpNuqZL+TRRhkJHwWgMgOqlFX6NJZPKhqe09Xo
	UDU8jySm3SxnMYjSq1scVgJCbajCzL96nmMKjxDKzbHBxbEmhDAENGCNnNhXhMnoonKrKmkqc/LmC
	rxzQ6jdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxIA-00000007RbN-44oT;
	Fri, 29 May 2026 13:30:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxI8-00000007Rau-3dLm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 13:30:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDL3Os2335129
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 13:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hWjqgXqaMryRWoWPpxKyf9wQ2j7ANbAzyzhN2DMzuFg=; b=Vukhh6zxXtDgPfLe
	lWBLq4ebh8PoZTuu+0X7Mv3gSIGoWD5n+ySalceCc8X6mBHY+5ts37JMavRK5Q5t
	suPNECaPJ0fCL8mSJoDNBcXntqXqNPH9bmwXgIZrBVk0Ekw6B3sliLp3U99WMlPJ
	nN10WVlVMe9p3fVi3xsO9lZXTPvgaRat3w401+yN+0tN2qzzwgCE1C4I7fzk3xkw
	NBI2bgwhcxBOrzPi0Gwgg86HoTGg2xUGseiELwZl1vvuYJLV/sa4jjkicUd4Po5P
	gXE591Dw7Q5gR7MChKuWDiN9yA7v2wIUHnuitRND67uJ5ozeG4c0OxsuUVW40Hu2
	IJvubw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef4jj1x5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 13:30:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4530a90fdso103442185ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780061422; x=1780666222; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWjqgXqaMryRWoWPpxKyf9wQ2j7ANbAzyzhN2DMzuFg=;
        b=dbyOlP1+cTPVzGNR6M2vtHReQ62f8OtQRS6/CrEaFgwB2KZ5a2h5hdjGyet1sLbYy8
         vBNiSDFwh03gojyDRcVUSq6ZaCf7nNvwQBLOjcAhmYs4FxNAWUtKyKezlu84B8pGHW9s
         j7FqPh9Lco5WUYDO7iKcvIhhYHxhU80QfkiOF6c9+W8YLLGaOEJ6mpLKHezIykgc3Cop
         7DEBA2Bh1OgE0JBREKB/ROdsm5z2wYeoJjBdUedQzWZBXfByo78XBLO4YEmygb09wwsK
         sV9ZYsKz5fkD5UvvSid7lDAc2TYEGABCUyciSxUuJI9KuA16nMa1gmRkzpa9JVhaO0Ty
         ICoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780061422; x=1780666222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWjqgXqaMryRWoWPpxKyf9wQ2j7ANbAzyzhN2DMzuFg=;
        b=hccMTk4vKi69YXJJ7OKoE1yXllXFcRc74D1Ws1PNWf8QUIvAWXt3Itq8cxM54EdbjE
         H4vM3I7MbhBwDYIbw4m2pe/GJNJd24Vno6EkjONV328kBh1gvRjE5j1qpjzEXxPVKg1f
         xib1+3HwazYCYtcMkyirXD/2cs4UJcBv6uWd7Bnld0hGA1BC4THvru0NfyVkjK8/c88Y
         QKp7LoLKsBSMmkVVuHropHzvG58Sm5h48JzQcq9oNAlYtAOrYCtwwZVNp6dlNYzYnk+e
         8g398prScb2fhcSb/gRn4J2w+d8Q+aNn+rJS4xBmizLogGya4yDzoLI1B+tppTQmTj54
         iLow==
X-Forwarded-Encrypted: i=1; AFNElJ9awUvwcyEGxVwJ8qXD6EFhQ5fC7HBvF/ngzSTEpto69RiTsNs/K9id7g6YRvERFBDXsLp5bs6da7OzVAegpIMo@lists.infradead.org
X-Gm-Message-State: AOJu0YzuA5JPl6Ob/RLMZKdDNBuiU+vU/nXuA58wjikqJ0mKc/xoGq6B
	lmOmBhyUhobwUEd+yL+Xt24ZN8v2uB88Xqgk90wsdKkZ5wTtcR7xTIWDA01MHRLEjLeONT2da6G
	ksXEuIDPfpGI4kfmJHSqez18fzsfXEnFAqCZftrtuoMDQnW8Gm13DMCTHUloe+4QXCqA+YxyzUa
	pcKQ==
X-Gm-Gg: Acq92OE+Er5N7Cc+uXgil77g1/7k51UrBDmoOk3A5+sXVS7oW+Y9Yba8BVvIugvr+1p
	y6dDfjybVP4m3ae6nlDkHiepyImB3uJXNHLEFj0zqttFxBLsQlb6CeL0CS9mgShn2gwjBwNEl48
	EsDXcD8cC/AtsrntHKYWEIF7XnUAtridhcSBqwzhJRpG4Nvgb7AzrB/GTHe13fyigI/tIB0hZ68
	xFy5qxrng7MiJ89lXvqvoigolDZfPbeZLYnAmfWUgs0rxmNnLUlbhjg21chWtaDlXVO2vtNtnte
	XSQbUjWDteEnleTnIJkJiBXxiyNCMsVYJw9WaiQWRaWjaC8CMM+Q3yx0nUgbasWhQCkxAc0Ajl2
	Zr/O8eAwU3AmgFLBbzwkYAIx0afYgd5VORbDCeO9oTYQHMPUoMHIxH8iMFI64c1y+Igs=
X-Received: by 2002:a17:902:fc43:b0:2bd:8db9:cc0c with SMTP id d9443c01a7336-2bf2050c287mr38769795ad.6.1780061421537;
        Fri, 29 May 2026 06:30:21 -0700 (PDT)
X-Received: by 2002:a17:902:fc43:b0:2bd:8db9:cc0c with SMTP id d9443c01a7336-2bf2050c287mr38768925ad.6.1780061420801;
        Fri, 29 May 2026 06:30:20 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c3d6besm21715725ad.74.2026.05.29.06.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 06:30:19 -0700 (PDT)
Message-ID: <0c6636b0-f6c7-49dc-b335-2b4fac16b848@oss.qualcomm.com>
Date: Fri, 29 May 2026 19:00:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 00/13] Implement PSCI reboot mode driver for PSCI
 resets
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEzNCBTYWx0ZWRfX6ukhqx3TIyzG
 jzHoIK/bk9loyePQ5WDfETnCiaonNnQ+wZOHdazIhmJaZ9hB7fHfhUzdTfb3YAPh/BRdYPmG3pV
 K9PvUk6a7gbsQtsogUgVRRkIEOMBwEM7jRdokICnpFPn/fWWD9DTAssqJGjoUOX9rDpClbS9T7s
 d8nV9PZ5Ze4sxD8ie7sUco5lfcKIxvsfqT5H18Ud5r2puz4PCL5KVw6BaB93eMxIYKulo9DJZY7
 aH5BmE8MMfBe7Lzf2S++JUaG143sVaC8CgOUEI/3Mq2F3RgipdkFZGs0aIOvojKlAmRpgZawVOW
 3p/lS2H9PyxkDjhKWbp+mKcDFK2N3hyhHFM4qJkuvvyJp7NMQkeeyomm7puFInvJ+16tPrHTbs6
 Cr4URXFNb9g2yl3yzSRqOCVC3Eysp1eTBCfaiteGWDdg+sKwdMSUpaWEOPMO7PVcsYY23tbXotQ
 FVATLyYpA+O/AWBG5Qg==
X-Proofpoint-ORIG-GUID: OfBAMhZx0jAe7669SdM_syaV7uFiAD10
X-Authority-Analysis: v=2.4 cv=Tt7WQjXh c=1 sm=1 tr=0 ts=6a1994ee cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=C-2j67T39HWltiyTxO0A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: OfBAMhZx0jAe7669SdM_syaV7uFiAD10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_063025_049643_EF572BB4 
X-CRM114-Status: GOOD (  14.02  )
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



On 14-05-2026 19:55, Shivendra Pratap wrote:
> Userspace should be able to initiate device reboots using the various
> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> patch series introduces psci-reboot-mode driver that will induce
> command-based resets to psci driver for executing the device reset.
> 
> The PSCI system reset calls takes two arguments: reset_type and cookie.
> It defines predefined reset types, such as warm and cold reset, and
> vendor-specific reset types which are SoC vendor specific. To support
> these requirements, the reboot-mode framework is enhanced in two key
> ways:

Hi Lorenzo,

Can you please review the if its aligning towards the suggestion in v20?

thanks,
Shivendra

