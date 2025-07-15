Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FA1C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 04:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1G81B60xsleyJTfUNHppUdfBzYqz0JcVfIPyN+RmVmM=; b=qMqQdU+FVqR1CsDiIj0D3sdiya
	gh2vlpgLRSbFZ1MxckcKP4WGpdZ9O1WO1+0+zAPNfkSlOscPtEyzW++uzqtSbHlaBQLipxidrYFDj
	yJtIgVXKe6KY15v0weXHIXkb2TITkDcHBeZMfT5O4gFz5TiziAPJSI2qhFnb04Q7uT8PrvqLE/Wec
	9LLww4OxEZ7//lNIRFrc3zUzgHAr5u5vLFV/vSi2+PxnH/zG5DxOqO+rUGTQh3IeWlIJyp8zEGHFR
	ULg7IzQXOLYqhiBJ0kJSAXiEiaE7W8YCP+v66Lwn7XiCgd9pT6qPnfCjTfEnbwTuF87n3sWZTFBYO
	Cul9j3Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXgT-000000043RO-2xow;
	Tue, 15 Jul 2025 04:54:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXaB-000000042gI-1ppv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 04:48:00 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGLHCv012384
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 04:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1G81B60xsleyJTfUNHppUdfBzYqz0JcVfIPyN+RmVmM=; b=lTHCMFWJPCu8e0E9
	V/AAabygrTtorP9ChfuHJ9QbaufTRbwAtIY2Rnsv6uzT8ZS6xO8bM8WClCszfr+3
	2UESTZeWJreQfs82l6td3wsLsNo7xAOgkgkMFCVK1nxaq0nL16cVvLakSs4lN89J
	WI/HZUoYudLihQS+dLl2FY30gwZV4AIZufsJl3kaOVET2/9yrljJ0YedI4ElPHlF
	nypIZuCALT0fhRhoUCP92kBc2JHq8t5L8/TG0IZzx2QRtDJhe4uc8AqC8RkeqZUF
	csLwdvEUN5twDhMSZpwg9ST71WieDwSh9lhcEKT1jzmlpYdexbtdvTGQO07ozx5H
	+o57kw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w58yhnnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 04:47:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74b185fba41so4489596b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 21:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752554876; x=1753159676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1G81B60xsleyJTfUNHppUdfBzYqz0JcVfIPyN+RmVmM=;
        b=nqjdPb+PIf+o7v+JQHMEoBJaA1jeHFDD0VidRhhiLi5eBskglugkc7GljZ2rXgnynw
         3G2yxvvOpuym2ozTKxya6aoFSScqUyOYhlK1NFZ7PAVNwkhbg2wjxiLmJukFjAyit/cf
         /S+eH86N2nb63MyiGtGNa+MBtLLfB68+Q+UAzyC1Nof2aChpJa/0rQ2tbidUUaDou/9r
         4srssWzHmB1UnnA4gl8SLH1casdxfezVubMDrvB41PXtOssqY4UFSU5prKFFHLNi8E1w
         5iTkkoqcRvg5jXfJ23jMqvCioGzLHTfMTe4WLV1JHi3dS0t57lJeJvRl0KWi7lyagwSK
         fV+w==
X-Forwarded-Encrypted: i=1; AJvYcCXvDWkWyW/FGEfzCNwht/v91jsXYyMTBKOIAg8XkIQoIoQGv1zIvtok9bA3n0tuIMBIfITwqfYvyfcmmSFy3TPd@lists.infradead.org
X-Gm-Message-State: AOJu0YyNZ66Q6xETiUuR6Hx1vCApCSqn3PS155qOm4F3bUVLXJ55EtEn
	rcCRVH6HccNcY54P0V0x49fL+l83ZYtGYL4ltIjwGVPY/D5ZNFepxS2E+hlYRKbBdypFZtFO58V
	+mRo7ndfQj3xud/ea1jehUSSLr2IOMmdV+p4VTRBykCw15YCBac9hVIhIDF8Cvg2yaHBS7wSUAz
	o66g==
X-Gm-Gg: ASbGncuEDn2y0+1b1wcO07TolwJ0qXjD//hhhHifbKKM76DeAWZsH+Ohgvergqi/vxr
	8rxc5OvoX7+64oUme6T+N36VC9T1FOzo304onQQGrSRQ20tjrGLblY7aFZFOcjgTXSg40xDL5Y9
	hOPQVaCDuxYiIhYwG3tnKqE2X7wPaMcKxz1BObBX/gbXZj0xLHOpwguTdTX2nlP20CZyqDVQtaQ
	rzbUyWtNh74PIAPLRJ92ctu3qlUzmg6sAcv191ZYfnb/7X0VG6kzvUKZ7J8vpDGWL2xDYGqXXH6
	6MqMG8xZ0Qs6k4kCG/f/sJeCHjuFTCyvtSobmqBDWBSOTKoU7rTKs7/7iTRAqUzZy2hCBPg=
X-Received: by 2002:a05:6a00:148c:b0:740:9d7c:aeb9 with SMTP id d2e1a72fcca58-755b4cb576cmr2345382b3a.21.1752554875852;
        Mon, 14 Jul 2025 21:47:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLw7QsQsRMoAC5kgpjcNQia8kN0Ju9KrU7l9OxO3SkPSGi12dP1bd89nTq4dVCoxD0vfJycQ==
X-Received: by 2002:a05:6a00:148c:b0:740:9d7c:aeb9 with SMTP id d2e1a72fcca58-755b4cb576cmr2345327b3a.21.1752554875237;
        Mon, 14 Jul 2025 21:47:55 -0700 (PDT)
Received: from [10.219.56.108] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5d30sm11715343b3a.5.2025.07.14.21.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 21:47:54 -0700 (PDT)
Message-ID: <08a0b50c-76e3-5c34-22b0-74b8d20c8e63@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 10:17:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 01/10] power: reset: reboot-mode: Add device tree
 node-based registration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-1-b2d3b882be85@oss.qualcomm.com>
 <5zlix4hfxkz447g6e6imjlatmnf26pvunnsmfkol7mhvropq6o@k7wr6h4hyqtg>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <5zlix4hfxkz447g6e6imjlatmnf26pvunnsmfkol7mhvropq6o@k7wr6h4hyqtg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA0MSBTYWx0ZWRfX1GscBKapjYmV
 osudpm9ZmyLFJWBEciz11YH9Y22VZqG06jwmJYVeLpT0gWwf9OwNKxCYWLOYGuQKgObpQnL01wQ
 LvWb6vm7xOHVe2oAdnBQpn9v87UP13ftCjOMK9Cqm2KVwXr/AQ7SqB4uqB5SXD85Eor9dDf1R9T
 sksJbfXAhYpBEOn0w2QgczQ1dURkoHey61yNdAN/c/cnQnq+zxVhRDwkeZzjVHBZ0ns4yO2/maD
 Kz9w66qbFEWsNLAT9rFQourH/Z6+K8/8qtjHbY82NQspDjJhOU5+wjcYwl93e7wZYrrZI6PGsz8
 iLYu/kA3dNrVwQ9kYtA0vdXTQOq2FN7+38yHOwgasKrm6uR6slcy8+HgEcVvFXCipHbM0iLdiD6
 AOrQk3uP+UWq5biA5WWKFO8TPFTHdTpRES59+3DBIi85TtQware8utzD78TriiAF+Ima0MlU
X-Proofpoint-GUID: gfvMaMi6inyAz8dkGGYi8M9paqfwo4OP
X-Proofpoint-ORIG-GUID: gfvMaMi6inyAz8dkGGYi8M9paqfwo4OP
X-Authority-Analysis: v=2.4 cv=Or9Pyz/t c=1 sm=1 tr=0 ts=6875dd7d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=w5sRTUNUNuywR65qw8YA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_214759_589360_A231EB4A 
X-CRM114-Status: GOOD (  20.16  )
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



On 7/15/2025 4:41 AM, Dmitry Baryshkov wrote:
> On Thu, Jul 10, 2025 at 02:45:43PM +0530, Shivendra Pratap wrote:
>> The reboot-mode driver does not have a strict requirement for
>> device-based registration. It primarily uses the device's of_node
>> to read mode-<cmd> properties and the device pointer for logging.
>>
>> Remove the dependency on struct device and introduce support for
>> Device Tree (DT) node-based registration. This enables drivers
>> that are not associated with a struct device to leverage the
>> reboot-mode framework.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/power/reset/reboot-mode.c | 23 +++++++++++++----------
>>  include/linux/reboot-mode.h       |  2 +-
>>  2 files changed, 14 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index fba53f638da04655e756b5f8b7d2d666d1379535..61f647b23959789a313f3af0bd967abcad45fa43 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -12,6 +12,7 @@
>>  #include <linux/reboot-mode.h>
>>  
>>  #define PREFIX "mode-"
>> +#define pr_fmt(fmt)	"reboot-mode: " fmt
> 
> This wasn't really tested. If I remember correctly, it should be defined
> before the first include.
yes. fixing this in next patch.
> 
>>  
>>  struct mode_info {
>>  	const char *mode;
> 

