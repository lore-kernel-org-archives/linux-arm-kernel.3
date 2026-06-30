Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE10FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTGAsdnDk3YDYOmMUnP5PozA/Se+PfLlWukFWbC/M+s=; b=jD6lM/mnSFySIB48TgQT5TL/BZ
	PHOnp53o80q7W39TXBy6NQeH59B5vSlrDFAXWFDc+pLyw87OT5pavW5KKlRK7MCSUnSEY7a+rwv36
	JF9c+ACuDiZcaIksbzxQcaqQYUQupdnrqoM8mJ2vwYHLUtuTuGaL7WL4MF+VPDpipr2iKvNtMmrAY
	XQz/aCRjwFpv1GbhYdVeMMpQHxZC7KQBj+aKRMRkkjtQQTvWaGnrZIILjBn+Dw0v2RAXGCf4c6X4+
	SpHskTGeFJn7lcHvo9WIxyeCKM/oVlTL012SRcK3R8jpP7VnpdtJ3D3jKflRbPW44zs2piCR8yFFY
	B+25Ba8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYl6-0000000HC6c-29JK;
	Tue, 30 Jun 2026 13:44:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYl4-0000000HC5W-3kke
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:44:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mnKN1542037
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 13:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QTGAsdnDk3YDYOmMUnP5PozA/Se+PfLlWukFWbC/M+s=; b=n4i55shHAme8fsZV
	f6JiqSMAT2VnkPr1L9+xExOWVIXGKMW5MBAZjbUI9JRTFw1ekg8d8J/6EylyiMx0
	3hHQLbw8GS18tXhIhagG8VXc+62ACN1GmjcoPCrzZMMEcGgjTRI+Bxpr/5RzqW8Y
	GQiCYlDJ5puHks6dFXDmovNyu0OTrlzyXV7ILvkYlwyThN7mXtzf9EdvMXqfJVPy
	KyKQKfL0ayLCwwSULymunW1Q3Hw2qHm01wl3zLZcSxBkRgm6mKpEkPeKV8/Cz8Gi
	LpZnqTaKSQfxSZHBAkV3FtVVGfyhPjtNXxLW+4O/mCkr5rIu5bFFgNBe3F0RLaLK
	5Ps5rw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44v4jr7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 13:44:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9667280edeso1410100a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 06:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782827054; x=1783431854; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QTGAsdnDk3YDYOmMUnP5PozA/Se+PfLlWukFWbC/M+s=;
        b=G9Q7LkmfPY9ZiPu8xQC13jwzMq94KFwudUoagS05L3pfVkC23JtchOpQQrJkGhxA8I
         cfyWTQUW24ziuh7CrfP7Vyaa28Qrwy2oEh+I+u/RNx7ZnuuA7B3kCXkU2SpUHu82/Dnt
         mDogIpaoaxhkOCkbYSJ0LFHXru/Y7Ue6jR5fHQ/g+aKVuIYhURtZo6BHF2AHi0Xk/1RK
         VWw1ESs2aTVVN6uiQIphC3oniTRL06yVZahD4WKFjmrQRm3C1Q1N/d4VlDtMiXgsS9c3
         D0OyX0PcAiSU0AaheshRec2DBh9RxL8cZnwcbIzQtOKeXuGu4lq3u3rzB492HtM2Ml9C
         cxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827054; x=1783431854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTGAsdnDk3YDYOmMUnP5PozA/Se+PfLlWukFWbC/M+s=;
        b=FCpjaOGssgCnQmlBKd0MgSBO/GrqRKiUlKPxmRREXOqXksOvLG07lx6Z4GVwNtLTXB
         Ow5AWxa8/jThwgtyjNERdjI4PoM9cBv/VaKoFcumOS59MpTq/UVEZLE1KzBl/1ACdEoT
         Z1KTe3h34p40k9lw+ZUuLY54GagEjpjPFUrqdmtwpwx61j+1uUNda+/5r5hhiPoTXVTM
         pBTecA3AbufA9jraoDV7cWa2vgbjdTnsbCrCKApN4heTbT48h4FSERbY0n8XwQp7ouJF
         isFsyyJRS1zLdJMbQQM4G/rs3eo8bcpLt6sv/Q3eVq0yhziGb0lWAJieEr2/TkXhQ5V7
         EObg==
X-Forwarded-Encrypted: i=1; AFNElJ//h/+eVw6j7gnOFv5rk8vL2z5/oEqGl29A5F46yli7XuDECaxWCQZCy5PofVL+0K7fJw77mnVlkLR27fyB68in@lists.infradead.org
X-Gm-Message-State: AOJu0YyMEI8LHHLI3tNGfSbNquD03ezQVUtT6ShKGOtfhnHoHOpmWH9d
	WDTxpbScvainWXKdCXbX3GYswF9uuZvh4jYD3cZx7BOmbA5B0mmbzpqKGi0jyQN2Lwg14s8s1Ep
	VXZEIl23EvPii1jTPjQGJMe0MdVCj7MgQl35Zryocnlv6DX8DmqGQiV+IAixltWX3rDIrCCe/UE
	s1Mw==
X-Gm-Gg: AfdE7cm5MmZYE7ARip1dDl2Njo9A/ZX+OTFC36kqCWjvyj/tnz6o8vgF7agv4po6hHz
	oiqsQAD8u+37cW7vfNDf96849sYtb6RLTf5WM7edLpHDYxa5a4w0tAs7+QOH3m2FkYtjxaBWRML
	Y3HTH9GFPo9HGdfyUIdJeVnCaWkRkiBU7jrUwQu+1KiCh7PveFfsOyu7F9B8TFizcow6J5dyCJe
	mOi2OeqruSqVwFmxfU6OApMb/Vpnf/7KWGRVJBz8liPj3/BF50unCT31M7UXAW9Lqg7LczlKJE+
	mJCTgTTBtH944TEUeTiGfPVYUdeH5fARffEG39uqBHXaSSX5eFBvqW1Wiq0dOi3n3PlD+RuNdGb
	tgM+tafnFLX7dw/wAnjE7OjDrvktDHTvqOn5uzAw9xlYZB83d3Ly9tehkWFoZzhT+r28hZSJgdr
	k=
X-Received: by 2002:a05:6a21:4a97:b0:3bf:6c08:4ec6 with SMTP id adf61e73a8af0-3bfc54b0b9amr3319187637.59.1782827053679;
        Tue, 30 Jun 2026 06:44:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:4a97:b0:3bf:6c08:4ec6 with SMTP id adf61e73a8af0-3bfc54b0b9amr3319152637.59.1782827053220;
        Tue, 30 Jun 2026 06:44:13 -0700 (PDT)
Received: from [10.133.33.69] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bc06e0b43sm1616501a12.30.2026.06.30.06.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:44:12 -0700 (PDT)
Message-ID: <865fcbae-10ad-4f6d-8b57-474626b71e36@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 21:44:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
 <20260630-fix-tracenoc-probe-issue-v3-3-7201e1841e94@oss.qualcomm.com>
 <a88201a7-0a00-48d8-97cd-300d6aa5fc88@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <a88201a7-0a00-48d8-97cd-300d6aa5fc88@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _xSl8UnxWLHlIEkKq-psM6GDoxsseW4g
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyNyBTYWx0ZWRfX3I4WoZv442NB
 vv8wylVmw5fmBvi3ZX5NK1Ksw9kIOhpM2cBCl07IJxb+VLFO90pphXE5yoTe5lvgasfW8F/OGmq
 mL35HocwXhUyhaCRskA02MDmGwghnYs=
X-Authority-Analysis: v=2.4 cv=JI0LdcKb c=1 sm=1 tr=0 ts=6a43c82e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=v4hQ5fjKkRTF_-evxhYA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: _xSl8UnxWLHlIEkKq-psM6GDoxsseW4g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyNyBTYWx0ZWRfX1ZSS5Avp2pBH
 D9Jj6k5AdxsIz0UXZACrKtW76KtRJFlZiUBGWfwrP31javYywj5pO8r1rZU6cskqu5GwXeG+faS
 /luz7ac/QRVCDD66LVg6Xibb+YZ/VVXD0DUioV+lggOttQtOOiV+T1ewfqgFpR9SsezMODjVeJM
 fet0I0v4LQqHSYKG/wcV5+0M9Xhufj8VLRbwWpOXjQ4QQunzkU3+4fEmM58MvHDXytgxgPHSPCv
 O4vZmYQM2FT3bws6ppDnkYDMnS5ZKyLBOeW36O85TWkFtf2AtJi1Y3Ka9ltJ27tdjMRcYCTSwgI
 rgVE8m3ktTMtdX96BYt/ocCoiPieir1JuRBAXSjKUdWBWHoSWC+YJuD4G4QgZDtnYN/PsjbUv0b
 JCsJCvPkbDW//dvOQ4B5N6riyy46ydiKZ20uqackkehIpBmhSk8F7XjX6P6Xhyh/BeAjBAj9j8d
 RQiSNFEg1x3QV7W2Y7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_064414_942389_38573B4A 
X-CRM114-Status: GOOD (  15.92  )
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



On 6/30/2026 8:53 PM, Konrad Dybcio wrote:
> On 6/30/26 12:36 PM, Jie Gan wrote:
>> The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
>> compatible, which places the device on the AMBA bus. The AMBA peripheral
>> ID probing fails on this platform, so the device never probes.
> 
> An interested reader would immediately expect an answer to why that's
> the case
> 
>> Switch the node to the standalone "qcom,coresight-agtnoc" compatible.
>> Dropping "arm,primecell" makes the device probe through the platform
>> driver instead of the AMBA bus, which resolves the probe failure while
>> keeping it an Aggregator TNOC that retains ATID functionality.
> 
> This describes OS behavior. Move your message towards the other
> compatible not depending on reading that ID register.

Thanks for the suggestion, will rephrase the description.

Thanks,
Jie

> 
> Konrad


