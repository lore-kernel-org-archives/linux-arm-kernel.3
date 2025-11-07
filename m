Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD02CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVnCGM8cdwol4pZjBWecGHgQ48zUJyNe3I+X4UXo7pA=; b=JNk7w6zJhbexarNIP1IWIKUNJu
	D79cwK8iesUDMKeFW8Bht0Su8uTo3bgzb1eNhPjPT6fEhqdb/Y2sgwfcB9x3ibD5W4oC21jkH9z/2
	ITCyega6HEyc2t/tYeP5O1UFtMO/uD+DXhDvpeVsM978BcJmQlbEZ6dsOMC/LJzzsBPVMqLl4/0It
	p+ee/64mkg+ri7rFG1k79mKgRUQzBGiwXzJIJqAW7LmyGa242khEzdtJwxdAY2KaR+a3ldDEy8c/Q
	f8Etr5m+l3g4ecwJ4w14QuARPy2a55C6GZfzy9cXrILPmM+F9OYtmDkdhdQTeXu+tOGBp1XyE/MZ0
	gxQKuMMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHW5-0000000GqFK-1xP9;
	Fri, 07 Nov 2025 08:08:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHW2-0000000GqEx-2lRr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:08:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A73NIek1866714
	for <linux-arm-kernel@lists.infradead.org>; Fri, 7 Nov 2025 08:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVnCGM8cdwol4pZjBWecGHgQ48zUJyNe3I+X4UXo7pA=; b=C58NAE8b9p525Gky
	G2vFjZSFtFQr3c+PAxlCUvzMVaYoP/PefDeocRMcpiHbs5HD54E7lHnSOvwiVifa
	K75kEGN+gTBqZTKBJJ41RldeBRpy0E2Jc4BIZz3jslomGfj9kqy5DD+mY4U4CW3W
	Kyt+rPtSc2GTDYJ2Zg5z+yYVysVU0PG5iePyjsHFssLedj6auI4TurEv6dFT7cQM
	CqeRe07SU2fG6LXxlMo+sfZBsqnwOSKr6ysAr67GSze/qo86hW/rqOzRPdDpls/+
	+zqD3GPPt/0gVrWpDXixUbBwPLklm6UP9vJVzEVO8Uc7eCoRZs9nw96xZJ5JmU/e
	jZy4Pw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a98ta0ptk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 08:08:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3418c17d21dso601353a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 00:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762502893; x=1763107693; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVnCGM8cdwol4pZjBWecGHgQ48zUJyNe3I+X4UXo7pA=;
        b=e18MFyerPLGHSM6AAmJpikIe9vxCScmA9UCykXK/CEMBAy+2N1Vd93dtiFw8wvC8nK
         Q3yd3Rrb1IFSPVqw4ZRQYVLwsgeJ1B2VIh0QbbxNrLggu+gih0yFeqyc/YExOY1Rhomq
         Vnjdbj4MUUxUWYFoaXir+ky4ucv4cTStvIE+MhsarFa+OyjpQhYe6hfc6nRbTMVdx65x
         v4hQHWOxRtLX/Pbbwv5EpUWu4OCVFur39EbSxI0sNaDUlV6wwxeUS7FPC2sNPCQ9QcUx
         proVhVFWlVn9sthYoJg3ZzU5e+Hz7ooo6dESs/Rsm/8zhMDNxJ7XCipGLQRD14UHd6tr
         Je6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762502893; x=1763107693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yVnCGM8cdwol4pZjBWecGHgQ48zUJyNe3I+X4UXo7pA=;
        b=vbuFJsfGGhR88jiUNDVa+fO4JWYN9zEKFDZALqurwVH08TGN0OYHUQB3KJc3aeXBmj
         knrWpwOa7YQpDKwz+YiYuDY/PrK245oJEI3wKVtaMnepni0B6DaFIVE/+BtW1+FlVCGi
         7FJPk2Euntd3kJ7veUoQwsd9wHAg4lEFHXfI0dJYM8z3lvc/BiBakIbrNzmKI98jL0oi
         Pj0iHxdI/NsbliJRy0pmE+QNJ42ih3waUSF33Bf5NhgqXz8F6ruCz7hL2ro7yXERdY5c
         e5L3t54rQUoQ5HJM69oNUFz3HM/rFoaAL8LAW7GFXg2yTHVPoP0Eeb+TKKq/guVxNqFu
         l3bA==
X-Forwarded-Encrypted: i=1; AJvYcCXHVkPLaG3u2yibeeY5vWOD924gM31qnSLMo3iRpSeQIdNZI65E/TMKUwf9RiIfzzg3vd534TIum+/3mrNG5SvX@lists.infradead.org
X-Gm-Message-State: AOJu0YxklJyniay1TrnsAQawRGzjs0cvXGRE9vKfjQF2ojGPckN52fgX
	FxJgnhoLdS6jJ8vQf/Oojm6QpLog5iO5vkzKJy8FQNN3TMvn4jIdR4xK+J14yauVnOMRpyqy+j1
	ZBkX5ZpXKVyPVnoYHng1QZlCWsyeqbRt5D/Mb9gzl27W9hkTqWS4wezZVbfqsfTsAA37gMKo13V
	Wk1Q==
X-Gm-Gg: ASbGncvs5I52HSelMmjAm7oRzQrvzlMX0Qz2ot+zXFqdytql4iu50HFBHlQqhizj2dN
	MWtGs4VraoiRg5ZeZlPS0T3BWx4VME27DGQvFL8sgQ85oAxaYmRnUKbgZ/fKAPrhApvvWrG0Z5d
	WH54w1HGCXzTuxoEyACKd/C2pYoGTFncbzplFYEMHUh6Q3Cg4jYcU8qUSykZdu8qBEq39dfZnvk
	90DKOQEHQQwjNbHpzF4vgvFB8GjOpa7eB9Zo4mNszanfnHj+wlaU1yztImtdvRymZ7KQACoSCqt
	t8IzbkCUMmtPo14GQrYSQlUj5xv4nfkj8DMM2vh/B5ydzmuSZHwjqa62f4IdgLBJ2KHgo1iJ98I
	VocodpyHQDppZyjCJ
X-Received: by 2002:a17:90b:2f50:b0:341:88c9:aefb with SMTP id 98e67ed59e1d1-3434c4ea126mr2240853a91.5.1762502893230;
        Fri, 07 Nov 2025 00:08:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1FwVg6yQU1EcNZvCXM3C9fT1xMu8vEORqyrlogZ+caF7N9+pZ1qv8BXFFp26cya3NewfKAw==
X-Received: by 2002:a17:90b:2f50:b0:341:88c9:aefb with SMTP id 98e67ed59e1d1-3434c4ea126mr2240800a91.5.1762502892681;
        Fri, 07 Nov 2025 00:08:12 -0800 (PST)
Received: from [10.64.68.86] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c3357bbsm1837440a91.12.2025.11.07.00.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:08:12 -0800 (PST)
Message-ID: <ee2ddf1f-0403-414e-a77b-9c20431c50fb@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 16:08:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 14/14] arm64: dts: qcom: qcs615-ride: Add PSCI
 SYSTEM_RESET2 types
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
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
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Song Xue <quic_songxue@quicinc.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-14-b98aedaa23ee@oss.qualcomm.com>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-14-b98aedaa23ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA2NCBTYWx0ZWRfX1oIdUBECEwQl
 qsWSqpDQ6tn5jwPzhtxgNdFVXuCQdKVhAsSpdPVYh5+gzjBhWpWS1Cv7/YpHqkVzn79da9L11Il
 MCQz8q9HT/nAAn4Kk3zgj+/ERBtgOtGM2xZOQi625xJwZ412FkKVex8r87Rywoys6qDUo6MrBaO
 grg+dt83XtQAjJJUB18IetFAfvPCjRLPFM4LXTcH9rsZPzkW44iWS1Zg8xCS6BrdWCl2vON8cfJ
 qTyj1/na4Rf1KElLQxkEmy1y7lW+EpAI9snROwf7aIhtYGLI3UbbmMxY/A5qGKSn46oCCw+tDb/
 RmJGyJcOcUUE3M7GblVUN9UOiTA/x7NhaQ+j69YujTQpXQ//1ICJYlD9DsEuiWBVYYFEL2UqnDk
 XvPefwAutlElhK8rifBcJ5s4GEVtaw==
X-Proofpoint-ORIG-GUID: PMWkc3-J0XuDL5VPPL4G9Rq08W_qtxsM
X-Proofpoint-GUID: PMWkc3-J0XuDL5VPPL4G9Rq08W_qtxsM
X-Authority-Analysis: v=2.4 cv=G9IR0tk5 c=1 sm=1 tr=0 ts=690da8ee cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=n3IlsZjKbDuTWdq3ZzcA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1011 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_000814_713069_2A60AACB 
X-CRM114-Status: GOOD (  13.54  )
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



On 10/15/2025 12:38 PM, Shivendra Pratap wrote:
> From: Song Xue <quic_songxue@quicinc.com>
> 
> Add support for SYSTEM_RESET2 vendor-specific resets in
> qcs615-ride as reboot-modes.  Describe the resets:
> "bootloader" will cause device to reboot and stop in the
> bootloader's fastboot mode.  "edl" will cause device to reboot
> into "emergency download mode", which permits loading images via
> the Firehose protocol.
> 
> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Tested-by: Xin Liu <xin.liu@oss.qualcomm.com> # On qcs615-ride

> ---
>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
>   arch/arm64/boot/dts/qcom/sm6150.dtsi     | 2 +-
<...>


