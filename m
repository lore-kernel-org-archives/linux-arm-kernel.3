Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243E3D64088
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 20:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cs4riM3bHa8k5Bz+RTTdkcSvQ4WfTHc0avDjKefuDVE=; b=mpsa8eFtUxrmV3BuF9UH90ZZPM
	mLTSzwuCfQhSlbN9yHEKRpVW9CJBazzd3efi0/U6BEBSPV/n0AcfXqzEwVQzLlB2pY2RDie/jiAD8
	+MS2GoOyUzHXI4L3EvZ/VTDtrxiKPlUjAmKAgeBH5EXImlpl4s8uCG4Aqe5F2d7Db4Nd4iecX0dIg
	NaMsKOx7ftI5q8kHqf1ng2NcAYaQ8Rjw4lwNeuzcYHjjmx00ZGaDxY/CL6ad97u+iJBCXGj07M1Ko
	+woHt6SpU7RXji62AtTdZoi8Cj0YeG3O/s4C1/YyUw4KM1GRikKd5MHqKJGTnNKO+rl0rGi9lv1vE
	F1EXtMTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9VqI-0000000Bvdw-0qFS;
	Fri, 08 Nov 2024 20:44:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9VoW-0000000BvDb-0dt6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 20:42:41 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8EYPT9012196
	for <linux-arm-kernel@lists.infradead.org>; Fri, 8 Nov 2024 20:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cs4riM3bHa8k5Bz+RTTdkcSvQ4WfTHc0avDjKefuDVE=; b=msVIlfGJmYYq4RsO
	Bts3cVJc41YLj/q+wQ4jlIlKXERWkayuE7XW7C2biT6xHcTD49tB5Qm0VvgNppsN
	6kAcfPGUPNydfjEiUVNOi98Zg6LNLNE3K0CN8hLinDzZ2d56mQLAzcgo2FqfZafO
	S7GU6Fo0sOUT1+QMt2gSZL3VvkrM1BrVen0dUHceH/UXTYbAjuIT85DWn+4a6+35
	0Yk6bxhuSU7wBD5GZ/mCmiF6cACO3TjAsPTH9tnxyAV9wdtytEymrwm+otESx4aj
	tM5uWjSLnGLdRZmlVLD58i0Z/GLnUi/Tx3MOAk7AQ5WMj9gunM/H1Xzfbfp7zzqx
	J5y1HA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42s6gm2jvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 20:42:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d37d9868b8so6033286d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 12:42:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731098557; x=1731703357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cs4riM3bHa8k5Bz+RTTdkcSvQ4WfTHc0avDjKefuDVE=;
        b=ZUHxQnUZUD5mKgXR1BzUGd//kxiCiaFefICJqUi1XaQxeVTxJPvaNoCDpRLV2OVfww
         yGjiRRI680eNAQO08Vhc3E8O344nav/AdFMBz+R73I3yc1xBlQ7HmlMvXYLf4bIMzfyC
         ay33xNQL6ZLTQz+PQBjNJGFvBgkYvZv1INNrIDcIk4dJ7cxs9K1hFW1udloke7ansWVq
         A/+NUi5Q7tl614jYRtWD6R930baE3egMQIa/F6mlPQ6GNrAiDzkewX1tQwrCqqLiVL3m
         EdyDeDJm/X4RRHqA3/6YWTj9aeLUiM0ecjbEp0L9tgIY76VjTZfsMDW5HdeNxb0uuyzx
         dtNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg8JHnYtjQWZwdkjOnEo3tLuOC1i3r76FhJl3cfpJ7MAvM6rOqq+371FYJ1oeJNrTd1mZ2FOEBBvgdZJHL3o++@lists.infradead.org
X-Gm-Message-State: AOJu0YzZbLl+evKGyhZKZSa2Eg9w+hT1tMyXJ+I3kDoV+ghXR/UWvQcm
	Acs5idpt7FVVnmmKkCeh1I5nfJWjCL5ua0aw7zio8OAHfEDdDp6IVTZs2C+n6pJzt7VvKen/1wY
	Teask9xMTlatojIuzbIJ5SyFvF3m4zCMTe2RC+WFVex5+W73fAcqv6AeeYIMwZ8+VbiQocsbiyg
	==
X-Received: by 2002:a05:620a:2995:b0:7b1:aeb3:8cc8 with SMTP id af79cd13be357-7b331d473f2mr259704985a.0.1731098556961;
        Fri, 08 Nov 2024 12:42:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmGYROupge46jG1nBI6/BcoZ4PyhzcR055xXlljdy1aNTPHHNIcEdgg6Cg0UU3ilkctF1xDw==
X-Received: by 2002:a05:620a:2995:b0:7b1:aeb3:8cc8 with SMTP id af79cd13be357-7b331d473f2mr259703185a.0.1731098556608;
        Fri, 08 Nov 2024 12:42:36 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc56f1sm275188566b.92.2024.11.08.12.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 12:42:36 -0800 (PST)
Message-ID: <1c5b3bc1-0e35-45a7-9895-27e3b4982426@oss.qualcomm.com>
Date: Fri, 8 Nov 2024 21:42:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/6] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
To: Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, cros-qcom-dts-watchers@chromium.org,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Shivendra Pratap <quic_spratap@quicinc.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20241107-arm-psci-system_reset2-vendor-reboots-v8-0-e8715fa65cb5@quicinc.com>
 <20241107-arm-psci-system_reset2-vendor-reboots-v8-5-e8715fa65cb5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241107-arm-psci-system_reset2-vendor-reboots-v8-5-e8715fa65cb5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9-SV6_U8bvaR3dHoqUUh6PZ_eiBNNTUF
X-Proofpoint-GUID: 9-SV6_U8bvaR3dHoqUUh6PZ_eiBNNTUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=878 spamscore=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411080170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_124240_357929_F4DF8EE0 
X-CRM114-Status: GOOD (  11.85  )
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

On 8.11.2024 12:38 AM, Elliot Berman wrote:
> qcs6490-rb3gen2 firmware supports vendor-defined SYSTEM_RESET2 types.
> Describe the reset types: "bootloader" will cause device to reboot and
> stop in the bootloader's fastboot mode. "edl" will cause device to
> reboot into "emergency download mode", which permits loading images via
> the Firehose protocol.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

