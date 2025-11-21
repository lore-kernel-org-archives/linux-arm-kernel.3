Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78B8CFC279
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4yMm5gRaB703rYohlWyjuL3DkCaUbLUnDXibYrUjg0=; b=PCqL6AnvlcZS5v7PILd1Iigyab
	0xP2FQAw7s1ixoxc7fEh129BOm06tU3evwngh/TD7nDnJX6LXqv7nZ4aCfh3W8IL8LVEdUYPyjVIZ
	kEZeJzA7kRkK/1f+QPBYaRe55GeBGsTXw+dy5LERZc1ysIOK3iuGtYkNg51kBroDyUIf0A9TcsO0k
	WbfFF5IorIEA9g5XdRTlg/vohRi3wfVuEmyKnBLva6qpL5bkvDcXHE3dIpnbd/Iy8wnyyMpKJHSh6
	A9CmOgTVlgHlkSasyL0TUBmgbXo1P2o2zO8hNYkaFyeCJTWX9lrBtl4CnAesUnAGfs0gX9qa1k5eC
	PumzwsMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMST9-00000008Xzh-32KE;
	Fri, 21 Nov 2025 14:50:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMST7-00000008Xz5-14WR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 14:50:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL8Z2m13139807
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 14:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4yMm5gRaB703rYohlWyjuL3DkCaUbLUnDXibYrUjg0=; b=Io0bpT/EpkpXSFLs
	D91WsCR6qVXIp/UbEh+epgzpRqth9vIzKDpVF4kI+bw1DeoY0rzGBSd9wltA1VfO
	O8OLJFFD6DiQHsaBDr3tlaMvNtvrjSGV+N4gD8bHLg1WfMZvseQkHFFO2hU3jD4y
	WOhU0hdEkQs07PdQj7NfpnJU/XZANUq6oW70ofjyNY9tfaq0GtswfqtQGrv6tuGO
	KPWUNqwhnbmn5b9qNQ0ycvRd33eNdoiv7HRK7MdcAxP0GCnkwXOD/EIvkim1eLzd
	93arcj2qwfEkGcsjHDpBChKRHLR4+P388Q635cOe/f+nEhbu2lnxb3TfgIaDy6rz
	iO3h0Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmpph8w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 14:50:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee409f1880so4123061cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 06:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763736635; x=1764341435; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y4yMm5gRaB703rYohlWyjuL3DkCaUbLUnDXibYrUjg0=;
        b=jbbNUYNAS+wLiEjqajScyx2IOOyZnW/aQR8FGRPun2QW7JlsATUmuIp5CvsJ/G7pdn
         h4IbsVSftYqL9t8RjKrX+H9cPXMtSV7uaZ65U6DEzR8g3UQTglSJrn8An3uHgCSnKk6N
         9oYZPy5hQLXRoMLQV7RFuxXvXYDYalgOjUdLRIzPYrbnNqeF/k9k8rooGL7AQ/aqdrbO
         ZmWbPQ2snxeeaWrZ9xUuttieTh8116M5bJshYAQyOQshMbW7kr3yhxuERT5tv8xGzv7t
         QZ0YcidTRyD4sxM3PU86gu+MSNVzrwgab2iw4K/GQdXnRMiLwZrHYxg1tgbLx/OwEPRS
         3jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763736635; x=1764341435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4yMm5gRaB703rYohlWyjuL3DkCaUbLUnDXibYrUjg0=;
        b=Dg6vSwq2ozEkZcSxO0WGlz8ioSP8qtKVV9rp/iw5MTvsYzvPjVmMbfvZ7xTJOtc+8C
         uyOBu+juNRNhwj4tiOAROlroWqfdvNEULAEC10uMy6vnA++CPvYeKDQahE3YE8r3ntIJ
         GQWXib+IDAtlSM8SXqlxtgEVj3PNISo3w4qyDB/wWAV6qc+1ptHgkrAEZIaT1rOduAXV
         sk1p/+MQr4l9aNGhOSShf7vtxHeRbIy8pNvEhSxsbHAhrJaqIgpbYeYMvFhz/+3PFvXf
         MeEwoHVmE1OIGaOs99aCE1l7BWC0XhvPWZIwiA+wo4kAbtYy3eXxtawjlp9k8D843Oob
         TrCw==
X-Gm-Message-State: AOJu0Yw+JTAQDkRMygkSBi3+aabQPUr5+IyMTh1SJU1h2IsvcZueb6PQ
	cZYZ0P9eSiOVeBikdns6gK0WQJrRN/0SDF06M6bShBq96p9DBQ2r4Sg0wZ86nGORPAhQeqfw4Nh
	QXVFJwoMZ9iQSmmtyiSWgoPM03PFG6CBIzxZmn3qnGnlj7A0Q1BtF43WbZ6AuVL9muo4VjTuojD
	FbLw==
X-Gm-Gg: ASbGnculFD1zAr1ISz1N++MkHtVVMyddFHyZTF0+1g09ncuz31tbX86PS1E+7I7eAR2
	vUxvDYGT9RWbLLuQRVjkeuVZ3NlGbkMJ53NpobNQ3an/uw56CtIc7MXOsRAt3IerrO72Olc/11b
	+MPOHQNDcPUgRhSjnfk0Lnf78aq1aNlngmt+KF8vr7PMZasMdFQR0uQU+0tE9VJykOKZ2nTcZr+
	hRXSuII1JFrF1i73FsmeO4TgJrKUgTjIiKWSJedYEzA+PMZN2zjReS5Yc4vaXXShteLhi+tJAIL
	t83RUs5oT3rE10qVrpSNROvRkpTc0sKMN21UyLSgtTIGth7979Jmcayj8cJuugQpxMn1IJbUfur
	dBLRGzHjZz6hDd2mKAtiEWaRXlDbkyNYKnls5BdM0sT2ujFcscqlwDro5IwapNe3NWo0=
X-Received: by 2002:a05:622a:151:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4ee5883a43cmr25444401cf.1.1763736635180;
        Fri, 21 Nov 2025 06:50:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxj2AABKQQlV7xQ2ap9JjI3812ONi/dGdeAeCium8JGunYEAvRHgpsHbcoAjOYZET5U86ETA==
X-Received: by 2002:a05:622a:151:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4ee5883a43cmr25444141cf.1.1763736634749;
        Fri, 21 Nov 2025 06:50:34 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363b5a46sm4708560a12.8.2025.11.21.06.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:50:34 -0800 (PST)
Message-ID: <3abea679-fc83-4157-9d2d-587354b85c68@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 15:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpuidle: warn and fixup on sanity check instead of
 rejecting the driver
To: Val Packett <val@packett.cool>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251121010756.6687-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121010756.6687-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CcpBTxziC_3KRCO8Bm3nqqD14qbCsm_c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEwOCBTYWx0ZWRfX0CAXJCinZnEF
 288ZUGtWiSa3akLhli0/LprDdSEM0eBqoK/8hw6q84KG8ZbNpee9KPKZnOWk/XJYCjZp1whN4US
 A1G32SYhHWhQy4AtIB60ndPXPo563bL6EsNjlWOeLYfl/6p4QMT67teHE64cZp0L/g9uF4yZX8A
 suE7wBTXC/9ZU4Whm93m0vTWmffhQvvzQO1NmRRqS21GVG6CpGc2nWMTBk4FUplxv02PONf0iis
 a4defkcnj67GTKpChcSz6dYiifclags8Kr5KNJNhXu9LCJnUquDXB1+GH5RT1h5+NtiBklWWXYV
 afQxPL2UXbhzSTfyvQqfzA4odSG3HpSdYaHuShx0Oqq6AWGpw1kcOWK6Q6FzHpJ8elNBwEjp+0h
 cQ5MIf8wGINJXw+DMyFBFeSniJxxpQ==
X-Proofpoint-GUID: CcpBTxziC_3KRCO8Bm3nqqD14qbCsm_c
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=69207c3c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=2g0XylBXbUAb_SZQJ8YA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_065037_327408_A5C64D4F 
X-CRM114-Status: GOOD (  14.89  )
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

On 11/21/25 2:06 AM, Val Packett wrote:
> On Device Tree platforms, the latency and target residency values come
> directly from device trees, which are numerous and weren't all written
> with cpuidle invariants in mind. For example, qcom/hamoa.dtsi currently
> trips this check: exit latency 680000 > residency 600000.
> 
> Instead of harshly rejecting the entire cpuidle driver with a mysterious
> error message, print a warning and set the target residency value to be
> equal to the exit latency.
> 
> Fixes: 76934e495cdc ("cpuidle: Add sanity check for exit latency and target residency")
> Signed-off-by: Val Packett <val@packett.cool>
> ---

FWIW this is caused by:

--- hamoa.dtsi
cluster_c4: cpu-sleep-0 {
	compatible = "arm,idle-state";
	idle-state-name = "ret";
	arm,psci-suspend-param = <0x00000004>;
	entry-latency-us = <180>;
	exit-latency-us = <500>;
	min-residency-us = <600>;
};

which notably lacks 'wakeup-latency-us', which triggers this code path:

/*
 * If wakeup-latency-us is missing, default to entry+exit
 * latencies as defined in idle states bindings
 */
idle_state->exit_latency = entry_latency + exit_latency;

which fails this sanity check because 500+180=680 > 600

(which would have been good to note somewhere)


+Maulik can we fix up the numbers somehow?

Konrad

