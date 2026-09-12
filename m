Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E4DC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 20:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmMs3gRal1z49mHzxWm4Gkbi6oU8/Tm+5YR7zF+GVoc=; b=L3C75FddnagRwEeBIjTCkfW3gO
	3XiELR5OiY7VYqiomB5HQ23O0rPUtL1CAtQZuaDyYGLsRedi439+KBQI8rVryMROcYaDfukQgENf4
	8ibaXLiZ9wOFsVFCM2htIBcBkLdWYu3E+Iv5yx728C5T5/auoYqJaks/dZyE0RX+WqrmQC1022tj3
	WFR0Ils4s80QavM83k3QIgIbmzI/G8kdk09/oxV6TPQimX8waTegryvPF/O0AgmgLBkzJmcUs+CjK
	yHjvUOOHZaAccqul7HHZqzAnff1TkTLUVD4LDVkVmKXDo6CCfL8+8XMCI0p1AbehviTV2aItgvxJ9
	JYOSa4XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ugl-00000001CfR-1JWf;
	Sat, 12 Sep 2026 20:51:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ugj-00000001Cf5-1Qsj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 20:51:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CI5Jwh3729795
	for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 20:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KmMs3gRal1z49mHzxWm4Gkbi
	6oU8/Tm+5YR7zF+GVoc=; b=Ay+SGGoTAZSu1hitwSPfrGlcXjYxxexyI7ofZ3Y6
	S+tuVGB3y0mr7m67JyYXEJlJW7PlccZgEc5xvsTuQHApcViM4YazCNZjHozxlz3a
	vegeaylaaLj5z4zMPpM8bbowTD3CA66pMa/dI4PB7kfL1mgRKjr2ZksgcVuJWnPN
	NnKVR3DLLdPHXjfPqUQESfIWJfSuThchTAiISC/VjCGtXk1ZB8Spp3fz4xAOSkcd
	lwj/k/GWkDSyBs9IUSXv7nKyy1QD63t/UklqOTL2RJXXnxzXWR+DNLQ3o+OTIbPX
	+8jM/y+FVyLRp8lNvY6i37zAvtO9rlN5p60ncOWElO45wA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d1wa6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 20:51:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9399b66e0e7so471562385a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 13:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789246262; x=1789851062; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KmMs3gRal1z49mHzxWm4Gkbi6oU8/Tm+5YR7zF+GVoc=;
        b=hVTZ7Tz/BE1anH1tTER3ik+NZbVS/4KZBUkHEjgsCnBPRLXUMGYtVeDItqJia1DgIW
         LGKZk/JmLZfFFZHyMHSkD6ofiHGikCcHjmlpzu4+GhFmOJ7GH1EDNYBxD1vU3Edf9ufe
         yzsqjKBSppRtZ0hR6b/hqug61237S5f4MGtxY+PlLHR/Hoa0EMLWMq9XvR6cFrAhR2dx
         BOLrrXZBS1W5Ilh3IRpdn3U+xF/6YYfBsBSSugj4x5QMiFFiSQYd/WlGE6/wpWldMmp2
         FDxIxF1b3lysR+ArzN9NrT06mvwcukTHPtYJXOlUylwQJRIUDVlr2gLSL9eMO0wd/MMg
         W4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789246262; x=1789851062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmMs3gRal1z49mHzxWm4Gkbi6oU8/Tm+5YR7zF+GVoc=;
        b=Y6vpnMFVrfetkrS4oxqUd8L2WfGdiiZKprf6ZXZzS/u1b1X+zll0PhlSrPvu7jNIz0
         gMVQIPQ5gUF6HzYD9QaXAJnad8Zp0PnIE/blQiyWkHvbSltPBW6sIbsr/P1Spcp1Yed2
         n7aUZ+cPu0xAciNHquhf6ab854OR4P0YPC8ob0Oe1MdQvTz+Hj1l0Tt4Vi7pv/2R217L
         iM4QvZYaODwiov6NO1wPUGPgaDlkm87RsgGEz6NjfVXEHdhPIaOFyMIwSMRJ2utSd4hZ
         iOYshIEiRiNwFBMHhXySmZqZTDlV7X9XwEblIqpts5FICjTTv7tgpp7yBKSObiJPzr5j
         oRUg==
X-Forwarded-Encrypted: i=1; AKwUvBzrNCUAyvcxxuGYku+hKN4dlm16/t0N/0JPqel8/9/WhiM5DdrGO31YJcLS7utnix6ounvqZGMCRZZtB0gTBBKn@lists.infradead.org
X-Gm-Message-State: AFuF++nb3axXhxcK52P2vSRJUNtMOyovuVe7iNAqMfwlGmgEHTwYTraD
	hIvqqw0X/tES7STdZwjpjJ3tyB+c/eMBJPrc2zQmcNjSFu1FOZK90xyLO1OhKvb1ogvFD36BBiq
	djWUltj7e2TRsz9+eHFFNHBesp9b+yamImss67JIakPX3Da1eCTtl7KwmIDuoOsXZkHlJobl0Rv
	NhKg==
X-Gm-Gg: AYBFou1qZYyVR9DySoevU37/gY0Nji9/apdf7kp/yTtxkSmOIGpl32n/vefx9BbW7gB
	VWLVD/04qajYZec08+43DlIwy3zbvW4QzZ4ndKNWstLRg5KjUEQ9sze6T/9Qa9k6xnsfaICHzOU
	lCxMwCRHJmvrQtXh5EUTOtScQDmsAW6S9zimvpKt5+o2jQRPPKLTv3XN20A+7DEAmtdAtn1B+nv
	EneUg1ogkRvAk9dMKztYBWgCss/ctMKXezGVaauvx+L3S+N3oGcMMLGsQ1WkDV+5Fw2uWkIQRkO
	08EQm7r5uGJ1zCrlLCWgBcTnqEdkd9IPbJJUuDNg764l3zTGIBo2evxkVLfLxhFOwgfiwKqNyg+
	k8cgeHmuY421VPg==
X-Received: by 2002:a05:620a:260f:b0:939:3a81:326 with SMTP id af79cd13be357-93a0390793emr670206685a.37.1789246261935;
        Sat, 12 Sep 2026 13:51:01 -0700 (PDT)
X-Received: by 2002:a05:620a:260f:b0:939:3a81:326 with SMTP id af79cd13be357-93a0390793emr670202885a.37.1789246261354;
        Sat, 12 Sep 2026 13:51:01 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fc02sm14093160f8f.16.2026.09.12.13.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 13:51:00 -0700 (PDT)
Date: Sat, 12 Sep 2026 23:50:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/4] firmware: arm_scmi: Fix
 scmi_protocol_table_register() error handling
Message-ID: <k2agmmtgq2tbx2zyokidn3dsdkcjpdjbasx7vlch6b3xz5sjuk@pfhc5npwwegc>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260911152329.5822-3-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911152329.5822-3-johannes.goede@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMwNCBTYWx0ZWRfX1MF7Ljnzd3iq
 7jFh0Aoni7K9YEHJTvXc6+75QfOCYErxliYv4e3XUd1b2a598T+VcPaNuEsw+iU3QikbOrvqU89
 QWeXkr44nVCgIWb4JvLx539O3o6AOM0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMwNCBTYWx0ZWRfX16UYfhYA0Aoc
 PSNU364Th/eC9hxaEabXL8eR0Ko2J8igLia39nq3szjMNcj+fHdti0xXoDa4YR2E2Qty8xE5ZUb
 hfYTKIiiST+iCOTbgGwyzYx9lBmATnsRWFqYdrYkqjV30Kn60EZPB3vFRv58b6bA/td4mLeo4cn
 +Hq8jaZqQi1IPlGq0KS7gZwpsID+yKyXKKmVVOJck6xmp+HyE6MHMEbHn+7jd1zBFahWmW7XWXs
 mKDoP/e3RGW/u1lX4xMKQEfJBqeqOF/XSxHVTJHkAXLsTD7PSkbXS45R9jq77iqU19X9jIanoDf
 wb284FWlOvfkOiFAG1zv6HZccHsUFZZWE6EQTHaJkyNN4JHT7462zqLMejGJeh42VUv6JG10Qsw
 b5OWLC2m9jLcPqYrZ87NsmZ2B93sk8qJ/E4Ywda1twYm7kidxmkxyrleaVyTJ3UvE0nglJoCIqo
 PussXos/axnKkgp3kwg==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa5bb37 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yiJOAx8gJh0FWUIRsxYA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: aVg8QxDo0jl02Q-QKJFv9h0NZaxByq7O
X-Proofpoint-GUID: aVg8QxDo0jl02Q-QKJFv9h0NZaxByq7O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120304
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_135105_402770_E7FC7E8D 
X-CRM114-Status: GOOD (  15.85  )
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

On 26-09-11 17:23:27, Hans de Goede wrote:
> scmi_protocol_table_register() stops at the first failure to request
> one of the scmi_device_id-s into scmi_requested_devices, but it leaves any
> previously successfully requested device-ids in place.
> 
> Unrequest any successfully requested device-ids on error to fix this.
> 
> The code manually unrequests these rather then calling
> scmi_protocol_table_unregister() because one way this can fail is because
> of duplicate device-ids and in that case the original device-id must not
> be unrequested.
> 
> This also moves scmi_protocol_table_register() to below
> scmi_protocol_device_unrequest() since it now calls that local function.
> 
> Fixes: 2858f6e5f064 ("firmware: arm_scmi: Add multiple protocols registration support")
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

This was already done by the commit:

2224b622260b ("firmware: arm_scmi: Roll back partial protocol table registration")

