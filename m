Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C42C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 12:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66vOC3/qlK+MyX1ZwSFINvuQl7YeMvvNbUSCtqoe2Dw=; b=1lJKOO+ntag5q5cgi41VgdoMSg
	B09onEap5HXkfQtXyYMcbbltRn6VFP5ZSSzZIN1Qd8hitjRczlxLx26AE4dcDL4a6mAaqD0GeVlye
	ILpof/KeFFMhbxQfDC3CiJcmAvNX82dZxeBYpKBeKbTFBLiwy7hOqqGGSyxkaO11GmVdsdQKSJfAY
	7CqsznAtWGB4ZWYVnoDMl1bt8Xa5dcaniA3/L3q364V1bvdnKHRYKr1p/tFBVHJ3XLxt5G98hFuz6
	Oz8L+5Eg5Qk5WBdn6v7w+LRKIQX2Np4pEdmcGCIpXNvD0EQiO8C06P6B+UQN0q0oIuTTphWNa+0tm
	/1osEYvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugMfR-0000000EOsm-44To;
	Mon, 28 Jul 2025 12:09:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugMaN-0000000EOSa-1xac
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 12:04:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlQ9M031293
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 12:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66vOC3/qlK+MyX1ZwSFINvuQl7YeMvvNbUSCtqoe2Dw=; b=oXmc+B86PKUWLJVm
	QmOpYEtQ3X4JsvXSyBAVaGeN1yGLf7GeUn5xEjkuzpWAWLaO6HyuZWPubGDWatMF
	2RtLNtrcea4FUlk1nFQ29VO9pWFmUWWeypasRwXZtoIhJS+bP26mbjzM/fdYObcD
	EsZ6QMmFwGbS3EwxC6tXisZM+cPgtOJWcPaNpmngAI4t+5ysoc1LjuSvHUHtsdci
	hpC7bRxWV27vCsWKzkEnxaAy3l4RpZP2QOoH5Ke1xtRHgmxceUPBPkoUby8J2MG+
	GPeER5xrSghPrUu2Z4HhXPbu2ZZE5wekUZ/5S9xfcCOR2v7Y09zGMwSg0CV3X1Ux
	JSf9xg==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1x9v32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 12:04:06 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3e3d7e44a9cso14946305ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 05:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753704246; x=1754309046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=66vOC3/qlK+MyX1ZwSFINvuQl7YeMvvNbUSCtqoe2Dw=;
        b=P6deVJULeYTA4RW2oSTUkQNfRMk5CE1ew7+/y/fu59Bwo3ndBaq1EMQe6J1nIiI9qk
         88Sp46mvRpkSCQXOXyGdi8+Ajd5W48eRW2pWuHI2uhnMORXuyfkZK3zXX5dA09eCso+L
         /TndNxzpP8pofAZxp1LVuQAVH1WxBqSeG00Obng52Tlf+iQQeoksaG2MC8O1fzKxjlJF
         EhosCJP/D9R3BushtY+tSCDW/dAFRmH/346luhLS/FULrdHrO8Y0y4GL0UPbyIBYyQBA
         vCOG36dGRy1qEPhrXeYX+cP4Dl8mVPN+++s1vzRLr5/QtQ1zd4meN7tCNwCTcrRmTN7H
         i95g==
X-Forwarded-Encrypted: i=1; AJvYcCWmdDTExK8TKE36IQiSvzLO9qRU8+c3TTH+BDN6zdkbbJCCxVJpjY9+9dwD2mganhSGgCAbYfJKfIg4/cUfp+qg@lists.infradead.org
X-Gm-Message-State: AOJu0YyYSRPXutv4KlIRXVVgWCNn2gEuHTb5n+tU57M2+9MSLYCi1tgS
	wWMFckpGZ5TUiVqho9AaqDMCMmy3TTtu+2BChqr790cKWtPkjivNH5QMUgqvDdyT9WMKupRyS5L
	eJXFTiOVESITDt3zcpE2chjw4mFHLbwXnnNdWo/6zXOtzFkaY7Uht2YZ06PMdtWYiG5ifO0iRq4
	ZkCg==
X-Gm-Gg: ASbGncsxvRIRGX/xGEsH+tU7OLMyeQm86mLnN0hb61jIJkd5PvvRWgessNBscZzThCN
	5yFtFNwP27uwlMZjEuhiIIwAjaTlSHzfw3Qk3RPyD+Dk9IcV8fE5KsOcmpRq29b1HV9dfRAa8oK
	hgFnp6x/U8wixln7fWAThWM4keAEYDNdPUuV+VZiFog93FNUHYo0qIcTMbIbbV2MbJ6KH9MBzr4
	9joC7n2acM0XJnsyTBuCad0V+ebRFfZ2gzL42/kdQTUIa+7IqiDez83uRjdc84t4Cv0tJJw3+wS
	d+HImKcaS9up7zTD/QKIyPa5X2vaBx3XvSatOyYyNLBYBfiOrWZJvhqL/pcXLPpDvCj6Hp+uOSe
	Et6xDBT+v6MHwuOoODk+Uk6haST9fCNzyLbK5ONV1uGIlqmp1dmd0+W0+TEKfU76oVLDSD3i26g
	gaU46Qg+ZbTQDd5UXwIw==
X-Received: by 2002:a05:6e02:3707:b0:3e2:8a58:7f67 with SMTP id e9e14a558f8ab-3e3c52e6ac4mr173518235ab.11.1753704245661;
        Mon, 28 Jul 2025 05:04:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+zIpMz+L3rJ5NWcaLcGYendd5twzo270GnZHovgracNvGxzH2qdsYSFiW1xnhFedlu22Z8Q==
X-Received: by 2002:a05:6e02:3707:b0:3e2:8a58:7f67 with SMTP id e9e14a558f8ab-3e3c52e6ac4mr173514325ab.11.1753704241592;
        Mon, 28 Jul 2025 05:04:01 -0700 (PDT)
Received: from ?IPV6:2001:14bb:cc:47df:318b:ca77:b793:45a5? (2001-14bb-cc-47df-318b-ca77-b793-45a5.rev.dnainternet.fi. [2001:14bb:cc:47df:318b:ca77:b793:45a5])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f42b6edbsm12086391fa.98.2025.07.28.05.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 05:03:59 -0700 (PDT)
Message-ID: <5e2caeb7-360a-4590-a36f-ff1ec4c20d31@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 15:03:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 07/10] firmware: psci: Implement vendor-specific
 resets as reboot-mode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
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
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
 <20250727-arm-psci-system_reset2-vendor-reboots-v13-7-6b8d23315898@oss.qualcomm.com>
 <b81aa592-a66b-457b-9f42-df4505b28508@kernel.org>
 <3gtlf5txxtioa5bvo6o467jupyoam4hjhm2mdiw5izv5vbl3tz@drndgp3tcrgo>
 <bcef34c3-98b4-454c-8138-c73729e17081@kernel.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <bcef34c3-98b4-454c-8138-c73729e17081@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA4OCBTYWx0ZWRfX7pSFB4cC4km+
 l+CvBaC8raBLHJgtWBZp8sI4qyqzHXi6CyqfX/ibP4jX5cWJq+/9+KIj4MftL18N3/LEC+gNSR2
 pdLruGFa+PB2D8/9RC+LKT9AIt/t4qwnM3d/gUAT3lcUss7ULKkYCzMqzl5DA3Ux39Zo4WfwUUE
 6lnUDhUyRbd5tJK7LAIkr47OnaOxhPzVJTOc3G1waovuIdSYGPl1xpM6Xf33+mn5EmLK7c04B44
 lw5kh4b7WEzgb/V5rnvy91Lt8VJzNLYzKCQ60o/DtJY4nMYn9gUdKcUo+9jkW3HFl/AOgGsElUq
 yJBGHijF6tD/RJ6QiCmDOAxMoTU3GWk4nX+4TObdf3Zayd6JKLF618deU6LcKNPI/Aitwwrgtoi
 fA2/fpMOBbn8FndfVvBnG3avEhIQidSVmw10eFGtjEyEsUAoQsXCjjXn1ip/bqds77PC4dEz
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=68876736 cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=jG_yPd5o3CEIpo8lzG8A:9 a=QEXdDO2ut3YA:10
 a=mHQ74H5e8mo-RpSg_uaF:22
X-Proofpoint-ORIG-GUID: KRuMNaivAvnHyFdXE6w3ee_bhCXaxFQf
X-Proofpoint-GUID: KRuMNaivAvnHyFdXE6w3ee_bhCXaxFQf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_050407_531984_2ED1CA2A 
X-CRM114-Status: GOOD (  23.17  )
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

On 28/07/2025 14:52, Krzysztof Kozlowski wrote:
> On 28/07/2025 11:44, Dmitry Baryshkov wrote:
>> On Mon, Jul 28, 2025 at 06:53:14AM +0200, Krzysztof Kozlowski wrote:
>>> On 27/07/2025 18:24, Shivendra Pratap wrote:
>>>> +
>>>> +static int __init psci_init_vendor_reset(void)
>>>> +{
>>>> +	struct reboot_mode_driver *reboot;
>>>> +	struct device_node *np;
>>>> +	int ret;
>>>> +
>>>> +	np = of_find_node_by_path("/psci/reboot-mode");
>>>
>>>
>>> Why are you looking by full path, not by compatible? Is the ABI - above
>>> path - expressed anywhere?
>>
>> PSCI node is required to have a node name of psci, it doesn't have MMIO,
> 
> This is true
> 
>> so it resides in the root node
> 
> This might be or not might be true. It is not defined by ABI. Anyway,
> you answered where the ABI would be documented, even though as I said it
> is not (/psci is not), but does not answer to first part: why you are
> not using compatibles which is always the preferred method?

That's a good question, I've added one from my side: why do we need an 
extra late_init call.

> 
> 
>> and the reboot-mode is defined in the
>> previous patch. So, I'd assume, the path is defined.
> 
> As I said, path is not. only psci/reboot-mode is.

Do we have an _actual_ use case where PSCI node is not at at root node? 
If not, it's obviously a deficiency of the schema. Could you please 
provide suggestions on how to describe that in DT schema?


-- 
With best wishes
Dmitry

