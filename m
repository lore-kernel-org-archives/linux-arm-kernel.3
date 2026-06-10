Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF57CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 09:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5PkR6CHd3r+6amgLa4HebPTz48NfUJqUcMMEOkBLAc=; b=ttSzFNUHT2irPplHQClMR6xhYX
	ZsnBIIaPQYOJ2tCWBvMOsNbEGTAowqakOXeafF7My8WMkwYPcNaxsfJqQfAYjUN3AQfXvjw0qa89m
	rjkd+LZgjz2mkV2EWFt96Kfbh6ALhPDHZq4Dun0TuocKrfu6/kAI57XyiUybjN2pNmXs9uovUX3L7
	DgZrOqgIKhGP5hmJl/Ybufl+ksaVYZ9JGPmuHNkm2acL20X3C5A4TVx7dBD0HVNPVs2Vt10cBIVKE
	SpO6I2bhPRGWsrH5xAMKPutoNjo+lpUFwF+BPcUqscOVNwoJRKju7LF1lCu4DTEevkCb/JfiBXOzQ
	PlBPoF6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEr6-00000007An3-1hla;
	Wed, 10 Jun 2026 09:04:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEr3-00000007AmT-41QD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 09:04:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iWnI904046
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 09:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M5PkR6CHd3r+6amgLa4HebPTz48NfUJqUcMMEOkBLAc=; b=aryBfVqXsEgh9zsM
	/v4aLu414nbl8lmj6H6Vz18SNHc/eYDVX/Rmy09lNyJvFrzlB3jwp3FHsyCGADmI
	gqLuwl4MPjk61kV82VzJYqVaH+Ef3nXOuRusYgHnTHsP16Hs5tVE6BQLbAcHSA0i
	WP11zFo79aZWgJPJdVINtqrr8jq11JHd9r6NBk0mvx9GHeiis7nMHFbfuETWaEUU
	aDbCqfUetpYThMJ7wLpeGME6WN7ZfCOsUWxCkKA4SOzvUiGzZEojXcEliO3ncWhe
	fZ6ARqky3U1lPC9Zc2i6fa/EmfpljG8lxBjiP4S5FiMVE98axePmjy8Ga5aoJ6vp
	VemSsA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epuket64c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 09:04:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915a547f4b3so156114985a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 02:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082248; x=1781687048; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5PkR6CHd3r+6amgLa4HebPTz48NfUJqUcMMEOkBLAc=;
        b=XemR1JPVYF9swcRMZeBcvJdVf1gJKPHo4+a7WeRJQOZxRMAUSFAi3EwVp3DBYOQw7L
         fDApv9Xw6zGxnVKLS1cvVsk77QZxLog+q0g4aPb2q10e7sBmAPCy86VQ5FXgumtdCK0L
         rA00aMoc/HQ8KVyk+m1JLbrQrgA5Y4Af020ZPx63bpJAN/UWBXnpjLP16ojTBf+QTMzH
         kDuGRroCueL+UFTIYJ1Q5rawyi0APhqFKuTUqybz5+3aKGK/jTNu3CZWJ/fLHhFk39gc
         9jAkJ6XKcDPuPi26b9qg2UPfiarbh6sHILY7Rcr1+T88PRQerpB4SJ43tCshD5uGHAeE
         d+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082248; x=1781687048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5PkR6CHd3r+6amgLa4HebPTz48NfUJqUcMMEOkBLAc=;
        b=DPFfSmO81DLlMNmR33CcYBH42kAn4d/2awMpLBixPat5x1iGcMkbx9hyYqV4bE/Qun
         ad2p6p3R8NOj8YNHuyxztbjQvBypcPc19U6rXOMhmLtxJojACspBqapcp+7sZwALeqkK
         7z18AZAcJ/SjF0rP7HENFoRNJXg5JmhyddVzYsGGm3fwGiKOFMEPttwcYqmyPaQvdCiC
         rZSujktKa+YhnEOh8r8oQAllFPV3pvRXJxBOtkneF4l9Y7l7nKENF5wEWuvN0BoDCL7b
         m/3IPB2F99ZS9ZXUqJamAFODlCRAyJUzKcFr9mF1/2EHYUi2L92i/YytGa3fC84QCyr0
         aOag==
X-Forwarded-Encrypted: i=1; AFNElJ9VOQST07I9kyuqxNpuZ29bk8pFuI+6V/Bn9iu1MtQ3e0E4Us6GvibwOpK7sw6NmEGGTtB2gL5tGK5umoA/SKPh@lists.infradead.org
X-Gm-Message-State: AOJu0YzOClk2IWncAXllQ+4kLEvGMezC0Df9r6Ardat8YlwyzOCl+WmN
	uYdR207KFq+0Tf7T1Hgi32aWp/lPCHHF8bnhr0TK3hoRLkjACyaVUdM5yNXIM1QWnZ3jIigPGnP
	QtxQDgTZIBdimajPFTa1QPqhtJi71MPMVRKjuMnN/B9FxZP7bFDL3odJARVAvU50xr9SkY7/dnt
	7v6Vs6sIc6BA==
X-Gm-Gg: Acq92OHlrZNQ5+0+xVyqW3QZCoL6WCaa/QdBQxNn6ZA/fn7o3QL+rcHH9umV/c3Grkb
	BamTbtNYXE1Isf6uqV3Y+y9pryBBkAiJUKerO1LFoJiuT+3Abc9rk+TTiIEdGop3iYBVI2GJhyx
	MP0d2p9crmoIeESoojKxjuAibwSKcwjtwyPx3QAs3bttVFUIBniAuHKbTqtUmPxlooylNLiLMJH
	9zRPZG2e0KYAC1jTIipMNUYSIaeR0EfuTiIM6olQlif0UTWzrB/kYUyj9GJiscp3AG1nVeOvPyu
	ic21ddQh0gm32F5hx1yqswCEIWLoCk2IWKK/72TwyCb8yL1ND2oMoLFsZo1EEyq4BSY4d0B1UEY
	qDeDGmq4HfP/b8q7uNqJHTpbfoilYwCdq7lqY7F6z/gKVG8gLRznst6Rk
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr2200093785a.8.1781082248134;
        Wed, 10 Jun 2026 02:04:08 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr2200091085a.8.1781082247666;
        Wed, 10 Jun 2026 02:04:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176fd14sm1165456766b.11.2026.06.10.02.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:04:06 -0700 (PDT)
Message-ID: <67ff0f25-b2bf-4880-9559-e37ef4e2c6bb@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:04:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] clk: qcom: Make important ARM64 drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
 <20260609-clk-qcom-defaults-v2-3-0c67c06dca11@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-3-0c67c06dca11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfX3IveIfPPJABW
 IUsDCA/B+fywT36bb+5nNRSkRiHBW8iNmGYIU1IMKM2VLEojzYIjI/WKI6Id2NUidCYHVgs2IzR
 wY2kUX45Emf2G4yYLd8aSyNFTp3cs7/7lTdUHjyyZrkGK3rIR2XVHXhlYkov5VniZ0RNYtnbQ7u
 iUamRPZsOstsDyQS02YXPnWYBmaQulA1K8L7PKTCkU0bfm0EI6n9I2niMNRDCxlh2cSsT6JU9AO
 L4pXttwHaRpQhmuna0VLAocgQoy85Yx23LXsvmTsyd4zcwvLue8bZYUJjmECur8GeFhCh7wvJ3c
 6/Jyr9hUEVf2UbGgMtqaH5Xv7jr+2lyIjUUxBw9p6PAdk5iA3wV4jmODyHfOvs/fn9rCodPVIVg
 gpsKMxytAe442YuBirhRPufUapjPfYYYMmiFTbtG+lQu8IM8SLb4NeNMfkt9rU6ig1+pp00lRD9
 8tDnLVkK5h958xxd87g==
X-Proofpoint-ORIG-GUID: eTNbnGntDrJlwFFoS2zIiSMkfoV2wSvV
X-Proofpoint-GUID: eTNbnGntDrJlwFFoS2zIiSMkfoV2wSvV
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a292888 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=YbJbqLu5s_8SUIbSLSYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_020410_133644_6AD76259 
X-CRM114-Status: GOOD (  15.25  )
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

On 6/9/26 5:32 PM, Krzysztof Kozlowski wrote:
> Clock controller drivers are essential for booting up SoCs and are not
> really optional for a given platform.  Kernel should not ask users
> choice of drivers when that choice is obvious and known to the
> developers that answer should be 'yes' or 'module'.
> 
> Switch all Qualcomm clock controller drivers which are chosen in
> defconfig to respective default 'yes' or 'module'.
> 
> This has no impact on ARM64 defconfig include/generated/autoconf.h,
> however changes few drivers for ARM 32-bit:
> 
> 1. multi_v7_defconfig: Enable QCOM_CLK_RPMH as module, because SDX55
>    (ARM 32-bit) uses it.

FWIW RPMHCC is a provider to GCC

I think TCSR_CC is also a good candidate for =y, as on platforms that
have it, it's necessary for USB/PCIe/UFS

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

