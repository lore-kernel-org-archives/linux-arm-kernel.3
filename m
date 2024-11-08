Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360E5D64089
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 20:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VdJcdmEbuUjsz9W6dsG6F13BKeiSPurxezaypVBjUh4=; b=AV6HJtr7I17TF8FRdWXCKEG7gp
	UtNt5JEx/ClYKKalQUbwdSQNDuRUHX2NMuGjlnpac2ZfAbxcQMgIbZpDEY8nyJAtysQ22U63SVAEA
	sju2i9iqq7WcWryUqVaUKE99LfWeIUV5l7ZWciLCduxURRPkyXH/f/ExDAH02lJXkaUWPDtPxlWoy
	rM8yl4keoKie5qAk11KSzPc6bpsfLUC5+FLXFzmamdE28PDC+RaZIRUNI30e1xCUE+7BS81zX+F5Q
	678MUGTf/OC0VrPOWDzwkullD1GYGZrz30rwFNvHaeHM0ylla1MNJ/kcADCm2674tPlcpHWZ5Ecjj
	7sDj9gOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Vs3-0000000Bw7K-1QT3;
	Fri, 08 Nov 2024 20:46:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Von-0000000BvHY-2cY2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 20:42:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8Forme030533
	for <linux-arm-kernel@lists.infradead.org>; Fri, 8 Nov 2024 20:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VdJcdmEbuUjsz9W6dsG6F13BKeiSPurxezaypVBjUh4=; b=oUv6GFYhboRpAupQ
	o1N+ky3RuUB/q4tQBmntvG7rlQ6rqEY2Eu/Ko74+7HK2GiTBtw0kVLWKBjJ6ebWq
	YJNQHRJqix2lHQIVGHJGzpufDoF7K/dUKHh/EchecdGktjhKxHR201/WTbKPzLLN
	rn02LMen3StTASNEaRib647Bb/a+/OGLegr7GLchz3m01Zh3+hrIUj+rlaLAyEvu
	jCrDzXshGSdb5+5hFqBikgNaxfVVVFuoFgg2KVjxHi8z1CjSyh43hFcJZgvCcpVS
	yaW3Qn/WANnfHbK12SMzMA9bTQWbRrhhLwqxLQge2gQXwQXV17cIm75u0LVyPtVp
	rxnKKw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42s6gdthc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 20:42:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbf4770c18so6593426d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 12:42:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731098576; x=1731703376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VdJcdmEbuUjsz9W6dsG6F13BKeiSPurxezaypVBjUh4=;
        b=DV1s2RyFyTMyH5Gv1Z7hrPZW5j8ImEYXUR0g2OYSK/cyTK+kNlAckQcDj7Z9riWzds
         ypLbm9xFfFRsT7p6GtUmUv8yuEULFjPvvrbfDR9f5qRTOxTJ5qcxOchq82z9HF3ECIZX
         7ercCx5lIepRvj8CAFyfD6OdDNwlzfk0je24zVJNPu5pCHhLc8KE0BM9v8okyeqwyUwT
         +3D19dLq0Z04K58+oUV5qK6YEcjd9qZ/1hm1urVOJRrgkZkFGr3rDYRC4J4/QjJLjh/v
         AXgGNVsIXJR3GKdXR6iOIPXy9CtcbJtbLrUOqjv/QN31KLm4XYB+oBA10JI5EEKZ9GY3
         5rEg==
X-Forwarded-Encrypted: i=1; AJvYcCVMs4baAqw4NKFNmn7Vux8rIZbVjn3Yv03d/gdyDOwaLk0bjOsNVmyQxujbaDhtLzjRrIJ/zNXSKm+4gKJptkDO@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs//byC/19vAXwffOvwfDv0UB+HwdRqW1hN4eStRqUo/F5Mh1T
	0a7fPC1fgCqsLZpSahE6a/tXIir0C47RLMm9B6+Qfo9V0NEKd7EBXH/nijuUgRcpGixpy4QbHCX
	VtspdLDaXoGsyj4i7yOcUCS5QCjW+KjUVz+rrlC8WY8ZGfinIZvs1KR/LoJP56QzTEOJMxrAyUA
	==
X-Received: by 2002:a05:620a:2a07:b0:7b1:4920:8006 with SMTP id af79cd13be357-7b331e4cf7emr229940185a.11.1731098575765;
        Fri, 08 Nov 2024 12:42:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2rPJ8TWctxcZMgE4zJgB8rPLFwzZPX76YJC1zO5aP6gngaNdRzDusbilO7NPwDQ+LrWVpzQ==
X-Received: by 2002:a05:620a:2a07:b0:7b1:4920:8006 with SMTP id af79cd13be357-7b331e4cf7emr229936885a.11.1731098575404;
        Fri, 08 Nov 2024 12:42:55 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03c7ce0asm2314144a12.85.2024.11.08.12.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 12:42:54 -0800 (PST)
Message-ID: <cf054b7e-3ab3-4b33-a165-49287cac6515@oss.qualcomm.com>
Date: Fri, 8 Nov 2024 21:42:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/6] arm64: dts: qcom: sa8775p-ride: Add PSCI
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
 <20241107-arm-psci-system_reset2-vendor-reboots-v8-6-e8715fa65cb5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241107-arm-psci-system_reset2-vendor-reboots-v8-6-e8715fa65cb5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5CBJbdEpE2HkuDYCqL3yMDzftwzl2APP
X-Proofpoint-ORIG-GUID: 5CBJbdEpE2HkuDYCqL3yMDzftwzl2APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=945 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411080170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_124257_814579_AD135571 
X-CRM114-Status: GOOD (  11.93  )
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
> sa8775p-ride firmware supports vendor-defined SYSTEM_RESET2 types.
> Describe the reset types: "bootloader" will cause device to reboot and
> stop in the bootloader's fastboot mode. "edl" will cause device to
> reboot into "emergency download mode", which permits loading images via
> the Firehose protocol.
> 
> Co-developed-by: Shivendra Pratap <quic_spratap@quicinc.com>
> Signed-off-by: Shivendra Pratap <quic_spratap@quicinc.com>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

