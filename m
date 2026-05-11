Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D52CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GyxyJ8YMHXnlmbNNr4fpkzjHzr/ZBksEYUIqB1ntQ8=; b=J5PHOlLaLQKqto3EPPobzE3bt8
	F1o20FcSqsqfnFoBtTErClQ5EhvziQvid68ydjDhKfsXsIncNC7eEmrxLi03LAO3Ov7qs9KkfSTF+
	vY1tQanwBXFVKzs7U5ZXotJ2y6vCuFfRoleaQUslCds27nCs7Dlt4vW27cW7xIgDFhaJmXBfooPhn
	SfaePuWGtAeuLZYItPsSudWC3Jvsk2x+m4SEdO24d+vmsFI1nOUVQKioR0dFx1qyU8gRVOPm76jo+
	C7ws40q/8C7iCJuco08DnIeqIkOfEFWEGzlv93Qy24hEwoHhqQgIBFHF1vhc7pn79dkpn8ZemvmPO
	MAfu3htQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNPj-0000000D26y-1dJk;
	Mon, 11 May 2026 09:59:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNPh-0000000D260-3V3U
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 09:59:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2GyxyJ8YMHXnlmbNNr4fpkzjHzr/ZBksEYUIqB1ntQ8=; b=gFoSP1EAC7bRmOJsmRfWW6AtEt
	8m9RQHRS5y3tkgfm5rSkcIbbuIf7pGmof5pC/p2YsNHQ6eY1SBs1Zy2Q5xdo+nNASybqPfNR67lLN
	j80ysJKiZrOwijXtxFZ7qbpKNRFyn4iHi7JU4WXKdAfGo+FxEmzHVXshqSjRm9dQPqn3bofPkz9Oz
	SIXK811e36DpRq7stoY04PKxNZL/12hvf+apyDIzIjGaiY3LV5Ds/j54LnIwtab64eQRlS+kRJKsI
	Ump2806u86uPbDp6UcrjmJYJrt0g5cifg7E85VU/4H6sFJ1/NG8KiOkmcewK7ogjGMDV3FWAZJDKj
	bfosOI/Q==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNPc-0000000BGt7-1B04
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:58:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B6BfIw2236722
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GyxyJ8YMHXnlmbNNr4fpkzjHzr/ZBksEYUIqB1ntQ8=; b=WfTrO292h1oyY7SC
	H4ICKr8oF7tHCFWjcH+eL0ZiE49TmC0BQpNU5g3PJfoTG2u8zWPKPIf5EYwAUVVA
	nt0cGR1qtAyZLliu/wkNcKQKtOiukarUHvykj6oScQYBdJpf9Kf0nSQhFJGyBjXz
	V8G62bC7lIXU3a8bTu1GP12w4zahouKasI9ExRrRxzLzb7uguS346OyNx1SBHCoJ
	lw0W+9ipN6Ldwx1Hotglj+Do2Y1Atup88qBQfFI5gux9derobu0yK/QQxoxjP7Of
	DBFgXdE2tVU7jr78yLxEFtofZ5dDjvUwN7HO0106vlN4ruS7JtzVZ710hb5j9cG7
	4s/fTA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1x79nch3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:58:51 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-633526aac65so22887137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778493530; x=1779098330; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2GyxyJ8YMHXnlmbNNr4fpkzjHzr/ZBksEYUIqB1ntQ8=;
        b=O6vEKDn8XtIQ8w497PT6xugEIZFd4JLEZvDWs4amhczsRZ1PTUr2M+hc5PGmy8viJ4
         WFyicmJAYB+MN9jrQ7u7YmhyJzIiN4yovh8yLItiHy81iVnZ6nn+HuKi7ooeAcMlZ8st
         bl78w66r1vGGscHPRm5RSAQ7FI8jbNBqcM+s7HsP1rvLqlCgUEY2BytrFEEQotbnh0lN
         1F0+s2YpVe8LOO9wNJZNr9XDXs0O9ACESBXQDiDN5nqoTnN2yZWmRvffJ+i/mocCun0z
         6Ddw3WIddw0JL+J8c7J7teSM95j6lTYT6yufayCB4wtNm5nyyS9C4yz05d9EZLKOKFkE
         wymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778493530; x=1779098330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GyxyJ8YMHXnlmbNNr4fpkzjHzr/ZBksEYUIqB1ntQ8=;
        b=qEUgznPBKJb58CUlOCD1wvsoJThM1R/7Da3vmAgxYglU4JQZHlx4YAeBa6DYZw2ffe
         jDosUYANSisW+o9iOTHwsoMDkO7oBH+3vzHPiI+oNohXkMzJrYf0fHeqk7N+GrPyLUqk
         w68gC6a/8dD0jYUoTVITN47wtGjh/u4xroZeq7Rn4tOxulg9hDpgAipZrvNmI0SY2Q0q
         jT3mKqmimm9zU8rdgdLZZQJ63uNroHwFSI6tsHJnGDuFRRASPLQGwkaee6GAJWRU7dl4
         Iw1bSohknDK+Imz+BkKz35FOX+0ay3VH5pkBybQPL00FS8fnnlIjZzf4PqPN1Id5+ai0
         nCCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/NMT4/ZkG5hMdhdsyyN4vgeFzf91c0nXIIsouxUFpnF4qAnwrYxyZJEVwG+vOqWwIbNABW5IGjFRf4KabFInxP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/u7KHy/tKABZKS8xZD6ziKjjPmN/TGun7nc5c0jPwu6naA6az
	HJFtosVsI9ra/Cf3RwFaTI9GI7iqMmJdBh6b1Ga5GBzYDU6QU7GbxzXzNlUK7ddhQZ4Q3ZG2w/r
	jYkEZzEafvLzY7/bqe+JZfHspnWMGMGaPEK1axh3klpyML450EiP5ZV6ZGRTyLaR657R091rOnK
	KBJQ==
X-Gm-Gg: Acq92OG1Hqn1g0TEdT+bElg6snoG6u+94fXkYyoKmqlezMk5z4AZO0a2KZoC0Bu6WmT
	wXP6EoncxsvXf1pjaXebMQkyJ8egUwcGc6YZPtZNzjZYcH6Zec6H8ybvIRgW+y8br5llFoKLwWh
	pz3QCTr4rnplh6zNQAso990WcDbSIP/S1zJmvn3UAaGe4EPSt/Yp4e4NQSgpjkpYhbnJu2ZbjyO
	DvS5hK0me1dLUNwBHGBeTOjRKjD9r33VuxWMZ0acPjz2jZHETfUnG7EAU4kT0vNAzwopZwBxoCP
	iuAsya4oT/NfJW+jukC1UkG48iDWuOQ1+jk0lZqpy1JrfNIvLshf+f3Ht1oiWp1BDGnECg7MOWI
	OcvdeA1zyH8mAb36H+aD2voWqaQiziha+VibQZY+f4diF6UFbEzIXrETczAmTAMdGadLYN0Od6G
	6NqdE=
X-Received: by 2002:a05:6102:31b5:b0:631:437d:be97 with SMTP id ada2fe7eead31-631437dbf33mr1451668137.8.1778493530234;
        Mon, 11 May 2026 02:58:50 -0700 (PDT)
X-Received: by 2002:a05:6102:31b5:b0:631:437d:be97 with SMTP id ada2fe7eead31-631437dbf33mr1451644137.8.1778493529767;
        Mon, 11 May 2026 02:58:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac11b7084sm468659866b.28.2026.05.11.02.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:58:48 -0700 (PDT)
Message-ID: <1b32c112-916c-4e7e-9600-e2d95bbeca7c@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:58:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M
 regulator
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-6-3ebdca3e4ae2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-6-3ebdca3e4ae2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FsWCUySQBw5gpheuvztXmdXACVFJD_hN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwOSBTYWx0ZWRfXx4D8KkyTW2oN
 gZpIwl+X2/dSjhOwHhyHOWChaR1fe7SuFNnjry2uTmMv7Ra5jwygUKk2CIKCAk76tb6ZQ2iNrY/
 Agx79F6Sf26HtIJHxQENYEy7bne8aNrcedN/yX8vzKNJmaEd0RQEc9QMuN6yB8dJTZlU72Au6uD
 JAq2/8NxmTiTVA4Ap91EQQlw4NZHpC63vXSGw+t0YcCmpyT6GR9D4IJdgKwCE4xjYHdfdxxVBY4
 Bdj3FcW+O3eqViUOGmeYf9qmKenU95oosjyb+h35RNXhp4ujBhph4U9tuLEJPmoE+rVdJ9cOzUG
 nR9D1g71itsKgNfosvXMNU3fIMw2mtWl2kxZpOMtDOG5jidwoHiv36SpqwyrOO2EgFiQqwFrYio
 cOmmP/xdUOBjfKKi3vsGaatWdPN7ZDNQYyHlfpN4AVB+APpy0XUICxFiKuQOsPFZXjQG706odAB
 t/7Gk+gU6bETCtTl/kQ==
X-Proofpoint-GUID: FsWCUySQBw5gpheuvztXmdXACVFJD_hN
X-Authority-Analysis: v=2.4 cv=Yvo/gYYX c=1 sm=1 tr=0 ts=6a01a85b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GLZNN3U5Jx1TMTuK2tQA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_105857_979380_E9E6B547 
X-CRM114-Status: GOOD (  10.33  )
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

On 5/8/26 1:40 PM, Wenmeng Liu wrote:
> From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> 
> Add pm8010 L4M regulator which is used by Camera I2C pull-up.

What about other regulators on that PMIC?

Konrad

