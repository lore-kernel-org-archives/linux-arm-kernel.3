Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0889DCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 04:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/wdRyhztOnxEiG33RJa6Kf0OnFSv+4r6++4AXqf4jY=; b=4mdRg+iPZJSBaplxN45KTdorbi
	w66FtPfEydEIValim+7y7LQzCZ6897lw0UYH2eulNQunPQoHoo0/a7lr0pJsGWW4I7O0uY6ckjuKe
	HKzDfQGsGvweV1uFPt7/DTxCYjcKbke2T7X4tCZGQ9QXfYi7B/10tLKb9DjpqXKukEnZXBx4OGRp1
	fL7+BQrWk7Zlyds2aZOnr7G9lSesfTmovTjxBPt+BMBIaM1y3ryZNX0wh/5sdWn47fohnkrFerwnW
	id6SMi/enbkELp/v2yBNnojLJP6xEM1N0h+fwFxjkwW7X0mRKOvfhmbVZoiGpUU8pXFKyQY7N61/w
	DXGZj0dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6i4q-000000059PH-32Uz;
	Thu, 09 Oct 2025 04:16:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6i4n-000000059Oq-3ZvD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 04:16:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5Kg9004535
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Oct 2025 04:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z/wdRyhztOnxEiG33RJa6Kf0OnFSv+4r6++4AXqf4jY=; b=XHZFYLgZg2Ow6PRS
	JUclyU+TF0z+pY12ZqtzQNQ8VrlNuUg4Xhs2eCmPHAsMuCEbCoWLl6Ys5FMv8+E8
	89gfBpvct8WYZs9kbHFEk6okh2RczPluDauSmMVRl+lkdVU96NV+QtPgzwPUWJQm
	h6zb3/e4EaXHY0MBqFk9RCBk8n/AJAm5HY9N7x2IE8aDV9a4jkhwtqTyXNjLHRaC
	t0b0eyL2VXf5Fr5Q1DHjvqo+HSD0rwxgop4rzn/M3rRAe9+rD5erQYhu6h0y+N+r
	oyPAcpW4+DhSvZFelpYG8LFvhxtKhQzLFhLqm0ZFGIv9n5wijiJW9KMVTFbQUaeS
	SGgAHw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ksd71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 04:16:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b633babe5b9so164096a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 21:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759983384; x=1760588184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/wdRyhztOnxEiG33RJa6Kf0OnFSv+4r6++4AXqf4jY=;
        b=gJmW7w8j2ez6tiwOrCpSDYwvXiUCTcn+7A1jOdvpxGqtwVHSDz3OCedoD5xvCJTjw/
         DFsKKbd70x03w6PBQJRfg4Gk6dNgVtWNWS8aEO6vJLvBOmTx6NtKXHc9no8w+QRK3RNn
         ji+e8ILMGt7WtJwB+ZGNABODlhESd3zYIeL3gny5d3pUMYO5RnGHV5Wrr8/h3XBsyZaJ
         zCxbdYr0GS/yEFkfZ0jCDCRhQzcs86r6kvp32/v1GkgKMz3BOkESpWX7xL3o5me/kjXI
         j2SwxiEAM3iYe505G02nrbhXPyIqVxs0IVpUlje26GVvzXRjfdlTNyvgHRfGiWL1SGy2
         RVNg==
X-Forwarded-Encrypted: i=1; AJvYcCVPhI9r6+wS7t1IEJeIs6USXurHo06rdA1cjlNYunOzGNbBesymsiQ1RJFYGShxcOYqSA+IAHY9qSbPwj3ABlCk@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc79CdlsxK09IBAV7yQBok8rHlqRDqMxLLg2pQW9cegp09OWUh
	6o9A6WWraAg7JLhp0rplNnUAfNsaiAZMprP7rQwthn6hnzlJVZoNqVdCsZG6AzLV2XXOFcOc+xF
	HQW1v3PLoFq/Awj58uKs4K7cdohxS9bFB7a8FH3h1/qt3zN9kxC60h2cmAUdaFMATdH5L7TtXWP
	CDWA==
X-Gm-Gg: ASbGncsYRXAj0DS4WGRxuFqdK+wRHID3XwcGRk+x0XMd5b2VQ2QwtO/jnNmA17kpKor
	4jh9eh2u9hEbZOS3MyZynAL6esImJc6HsIjQ1NZvVY8I9gf7Y3s3CSj6Lm1Y0Al8mu47hDGWpwy
	/65L42562Yd8MHH2angTuMcTonOm7HTKOd4/8yz7VdLtcI24aSk/j+1mct0RJ305al4uwpyZ1Lc
	cbST/pSCEsUmyWghdCmE+7Wo1LDBIzjmURxlI3FDlOiu5AmqZCDyPT2tp4buCOf7Zao2WrjriNX
	79tID1rEoQ13W0gWf+mtPocJeG0aikL+9bErkOq1srpzt9qnzZRFnb8V+bSzca03uiJL7OVVNxE
	PzHSa3z76tq6Vf4KjtPZOdax3D5qbJRREyXGFGJWsYw==
X-Received: by 2002:a05:6300:619c:b0:2bc:1f29:1232 with SMTP id adf61e73a8af0-32da84deb91mr4229044637.7.1759983384481;
        Wed, 08 Oct 2025 21:16:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfQd96vAGN51vtHjr82AtIlkinA4yVsIrZBAw+ojodJrmawHih66RQcFW7/2SrnnG0euQhHA==
X-Received: by 2002:a05:6300:619c:b0:2bc:1f29:1232 with SMTP id adf61e73a8af0-32da84deb91mr4229010637.7.1759983383989;
        Wed, 08 Oct 2025 21:16:23 -0700 (PDT)
Received: from [10.240.201.55] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794dbc5a6c5sm1359671b3a.54.2025.10.08.21.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 21:16:23 -0700 (PDT)
Message-ID: <090c08f4-b1e8-4af4-b665-7894a1443ebe@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 09:46:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 03/14] power: reset: reboot-mode: Add support for 64
 bit magic
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
        Srinivas Kandagatla <srini@kernel.org>, umang.chheda@oss.qualcomm.com
References: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
 <20250922-arm-psci-system_reset2-vendor-reboots-v15-3-7ce3a08878f1@oss.qualcomm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20250922-arm-psci-system_reset2-vendor-reboots-v15-3-7ce3a08878f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX/RphxRlsxVFC
 yH0GUKfaUMF2W5oO3pLHOSo1jHViLKutM2wae3gUtjLnWDTo6j31gV/z12ZB00l8nTPl+c4/AAF
 raXZhaNkjB6udeV/xg//h1Q0azX7PvklNS+YCLKbiYglx3jqXZAKZCyptYMmovH/ELtRz/4872W
 qKtU8LrG7PguHmHrzZ5vqiHwMFWq1hfTc9rzMvXI4mkM5C5fO+egy/SoZ+opiUR4eEBbO9vUtLS
 CVzxKcnPiQVM5n7JG1wp9CI2PdiiKgM2c9yg5UaxFylm2YGAGEUXl4fuuE6nPYSnzMvECI6owen
 ZtllxkllOphcRd0MV7FZxwnHbvwit9j1F68k+kQrFYQKomv7WBCoS3cfjiaHe/d7IHMwD/5687l
 OGxnTCfUh2eYSfbHjgz26rXV63N26g==
X-Proofpoint-GUID: 5bwfd2wkfbRXeu3dagNekhiBgKPXmunD
X-Proofpoint-ORIG-GUID: 5bwfd2wkfbRXeu3dagNekhiBgKPXmunD
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e73719 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=xyQZWzCWjP-v2z6xiYIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_211625_896192_7D200E9B 
X-CRM114-Status: GOOD (  18.92  )
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



On 9/22/2025 7:10 PM, Shivendra Pratap wrote:
> Current reboot-mode supports a single 32-bit argument for any
> supported mode. Some reboot-mode based drivers may require
> passing two independent 32-bit arguments during a reboot
> sequence, for uses-cases, where a mode requires an additional
> argument. Such drivers may not be able to use the reboot-mode
> driver. For example, ARM PSCI vendor-specific resets, need two
> arguments for its operation – reset_type and cookie, to complete
> the reset operation. If a driver wants to implement this
> firmware-based reset, it cannot use reboot-mode framework.
> 
> Introduce 64-bit magic values in reboot-mode driver to
> accommodate dual 32-bit arguments when specified via device tree.
> In cases, where no second argument is passed from device tree,
> keep the upper 32-bit of magic un-changed(0) to maintain backward
> compatibility.
> 
> Update the current drivers using reboot-mode for a 64-bit magic
> value.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/nvmem-reboot-mode.c  | 13 +++++++++----
>  drivers/power/reset/qcom-pon.c           | 11 ++++++++---
>  drivers/power/reset/reboot-mode.c        | 19 +++++++++++++------
>  drivers/power/reset/syscon-reboot-mode.c | 11 ++++++++---
>  include/linux/reboot-mode.h              |  3 ++-
>  5 files changed, 40 insertions(+), 17 deletions(-)
> 

Reviewed-by: Umang Chheda <umang.chheda@oss.qualcomm.com>

Thanks,
Umang

