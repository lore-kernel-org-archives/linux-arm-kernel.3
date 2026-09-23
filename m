Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56567C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAmI+4l4jOMpvFGgOUL3UKDgOJQ+P1Ua774K7isTWf8=; b=EX1LzPML5dvKI4hdrxKdQ2DPt2
	FHOAVtod734fX786mC8WpwF6tr29E6fKund3p0OOJaFQFPYIXAw8FbGuoMrGQx6XTjN166UIpMkVk
	nwqSQ289XNjRBmTed1KqztS+UWyUUVCycPkMEzoNtfxLN3LvdYlbGISbU6/pRjEDkel5EbX52zRrq
	A2sukuytiBw8CrctIidD4UK8ytRTQYzJvVjlQ1cboAHC4c9Bo+K43yo7LcuX4fbV7dg+fpYAdMWsD
	UxqbNEg15tOugB3OUogTS43PF/lb1AZyuzBZ6ZEUZlYeynDQDjba8Rhzs5rLmHthVGD+WUinwPtoD
	r+CfrrgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9P71-00000008mky-1465;
	Wed, 23 Sep 2026 15:42:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9P6z-00000008mkX-1fR8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:42:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbuPh2639024
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 15:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lAmI+4l4jOMpvFGgOUL3UKDgOJQ+P1Ua774K7isTWf8=; b=jHOVjEwh4O5Fd5TV
	s1O4AgA/k83pSLHZXHr4MCtkqPzjalzaR8gQnJeLLql8C+fZtkxV5fSBROrqZowY
	cn+WqQCfLkPs+qAkMBFHpsXVb4suhO0wkNo5plb4HeT3ekACo8kX5EkTKwTcRaD7
	i27vMDQbe9PEwDgFw2ya9MQLbOzGboRY7T53860rPRLuEMLzPHzLguhtRTO7zp5N
	/fQIW77qNgZ1zdmnlCoqOfSckoEUM7WVxtkKUyTejkRA9dHpV9udyaVR7bBs3Vb1
	XVCpdlCsR41bs8ksQZKG1mmZtcgwtI+Ev7GECaO1PCmZB47sPGE1z0db2gDkcZcc
	5H1h8A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqje2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 15:42:20 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-982a39e0c4dso273200241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790178140; x=1790782940; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lAmI+4l4jOMpvFGgOUL3UKDgOJQ+P1Ua774K7isTWf8=;
        b=GpAPwksqErt1sfwBCMe7cFFsheWyc3FNin2iAvHiuvvKcvhc/Z/DUOEd1UyOGK6Lhv
         ZUW3l/IEizeWmkveGnmkH+3FXcsCZzoffZBXAdVKvl1A/6D59M14NdIYbQLuo1nMtc76
         DKpEO4JxjSlJ00Il+0c711nHUXDq9nNnmNx7fu2tW1JmOtzdnqqyuwfM+1PS6t3GXiX9
         pRqEoJH5VjtXEPpe3JAntCmPChT2NSlTS1AWcNSxz0C2TksrwIn5XHdUWhFsfiaYNwlf
         VCVhUXdwY+USl50QqA2hH3+AV5rrnqwaak8bmUmnc1Ys71ySIyXnlwU+rtnhSSZZQFYl
         1Baw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178140; x=1790782940;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lAmI+4l4jOMpvFGgOUL3UKDgOJQ+P1Ua774K7isTWf8=;
        b=z96ATv6sYeyn8FwS3wmOk3Kxbcy1Q/LH/ozFoYENx6goWzi9cExMwe5J3hvCy8sHH5
         iBSEy9FNdhLIb8cpRqWtJnvG72rpWHoicziDyNVqzLw35Nkpb9OllByq0q9QoIj97Rkq
         aEj7YAIBhFUrTkHCjLRZiuIO/vf6yXICnS+nkvmzOuk2APor1S46f1ryNgM8rJ23/akj
         paFvIACcbFNRJajmTmqsQqPrzFGo8rBKfyNCdpI/boc/I5oAz3/nhEXrGXzfiLbtwiOf
         Y2FUHI/4ip021nrQwQa0oao5JhnwY+UH/9JsFdruyvouN2q1LrFJz/gmgH5pHEgH1LMd
         es8g==
X-Forwarded-Encrypted: i=1; AKwUvBx2Q3utxbUCvQlaBTrIkWz4SYH4oFuenNrdmQbJa4nXpRf0m26eHuHa3Qu0ALom+nz+Q5HOmPyhQpaKZbd5ofAv@lists.infradead.org
X-Gm-Message-State: AFuF++lKSav5uCOGJAys1XRtytpzFfPuFZF1Avydq0BWZcvio3fDccr7
	CEYUwTGGzWzMwSh4lZpZwbuIUSkOprWNHAKRqz6PPLZBxQFJty1YMbLI8ubMfxwMnyVC5U2p4kf
	cTOBE2v/PRRbCOH819CEGv4fgvggkaGcuf7WUWfd/Ch8g3pcPbFAIxVAYCAO8uIjmNWkbgYxcxo
	HU6A==
X-Gm-Gg: AYBFou2uCe4S4RnqMAH37ShNMHy6rl3lZQbldu+mzy1KbcPVgiVBD3seyl7D1sWCydz
	dEdn8aduNXjecZsYC+1md2+ORTaW4R9+NaBJKRsIJaqnv3FSaTTSoSQ4J4n+E8/iVMAneCQJWwS
	KntJVkUMhwZiRUYFSHzNplt+XzvpsG9ExTipkd1msO4qwWUQMWWpJERLBIlLVgwjftqaihPlJOT
	ptxJE+eDZS7T2dKh8VJ435YwtQxjnlNMW6EUMbdcuSfiIctyzbDMPCb6uF4Zkl5iUNcWE5BsBoP
	Okf53Ed6B5HJUvmZBrIfGTXt/C+fvZndAR2ohUHPJNKu5iygXmt5Pjxz38UIfScsT9ZjE2I0TYz
	PF1hFsWuG1mw0sT1V4EfiZpynHg2mXJUngJaYIpNAHs+qmgHBKVQei8I05G2/ReZvC8PNhjoViY
	5O1bsvKPuKR9c+ZHyA2D/2SYI5LOqVpVaw4TmNGq5KThenGOJ7d2x1S3rAfSRWyJRW3g==
X-Received: by 2002:a05:6102:951:b0:7a5:213f:9a1f with SMTP id ada2fe7eead31-7ac1db33a7amr2601063137.18.1790178137727;
        Wed, 23 Sep 2026 08:42:17 -0700 (PDT)
X-Received: by 2002:a05:6102:951:b0:7a5:213f:9a1f with SMTP id ada2fe7eead31-7ac1db33a7amr2601039137.18.1790178137281;
        Wed, 23 Sep 2026 08:42:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c6022sm144907666b.14.2026.09.23.08.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:42:16 -0700 (PDT)
Message-ID: <839b884b-9db0-4215-9715-40549d1c6a26@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:42:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
 <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
 <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>
 <arPMAXs4jjUeu1DE@monoceros>
 <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uC2TD64_6TbM0d8JhMBNoTqAg0mz6rgx
X-Proofpoint-ORIG-GUID: uC2TD64_6TbM0d8JhMBNoTqAg0mz6rgx
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3f35c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=IpJZQVW2AAAA:8
 a=wmcOPm1-qqoyX47EQMsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MiBTYWx0ZWRfX7IdlxICqXhzz
 AD/ITsYgAnqF1QWMbkjcS8VB5U4v4Ov8ZJgwcrf9pO2328pEd9TeBxk9j8iAdchJErErUi2UVZc
 ldyzW4SuyA4rXSrfJEijiiciyGSCWI8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MiBTYWx0ZWRfX+RKHEYY34lSg
 z0x5HoBiso/fOFoSo+At75ADxtTcfLb8n5mzbSp+ImwOrqhccKVxnW+dm3KKSYIuXmG6We/5ESy
 o2dlO9272Di97cIWHfYaLG62fdTtGXWARDHgHNJqERoRXbYb02i82UBdQjnp4n6eWYV67UkBV8W
 YO3xtr/vfRg5Ysards+HRAxXRRJOgWVy57/YLYrsTX+5F2Ye+3/3i9YNKvl7lJKNTDcyGkqZvwY
 y7xUHrWrxAdxxIWLu+kbaje4ioC2FICnpzJ+Z6Q+fQgf8Jp5q7YYC4DtyzhbbS+Sudhutu2BEUf
 w6eq3NMyCb5QkXpfczww/F60x+U5PrQc/aBUjv/eyY2KkQKuAdTSBID1fxpGdG0d9iVF/IqQPli
 YAB6awv0enWCCpSL7gM5kSTo6vHbyl/fymOkqRz2v/AtX81Rhuf/L452PDQSpAvyPPDvwSwz+j3
 1BT3i5Zo1683heeNFAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_084221_442653_1FFE5131 
X-CRM114-Status: GOOD (  17.55  )
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

Hi,

On 23-Sep-26 16:25, Sudeep Holla wrote:
> On Wed, Sep 23, 2026 at 02:55:26PM +0200, Uwe Kleine-König wrote:
>> On Wed, Sep 23, 2026 at 01:01:44PM +0100, Sudeep Holla wrote:
>>> If Uwe is fine, yes I can take v7 as is.
>>
>> Fine for me.
>>
>> Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>
> 
> Thanks Uwe!
> 
>> The nice thing is that the device_id structs are not API, so this can
>> also be addressed later if someone comes up with a clever idea how to
>> implement it.
>>
> 
> Agreed.
> 
> Hans,
> 
> There were other changes in bus.c that conflicted with this. I have
> resolved the conflicts and pushed to my for-next/scmi/updates[1]
> 
> If anything is wrong or if you prefer, you can post a rebased version
> that I can pick up.

I've given your for-next/scmi/updates branch a test run and
the scmi-cpufreq module autuloads correctly, so everything is looking
good from my pov.

Regards,

Hans


