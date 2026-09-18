Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517E1C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPt4UPchwds0HyAFeyAS2O3QFIIxm44YoVgrGfIwWCM=; b=0QlB57Ng+7YiHpOktNZpKag2t6
	1dnbfPYKxfMh68Qx1iWG+UYocar2MRyCdmzK9KAcC91EqcSDPaYoKjtaq6Mud9et8ssZhTZkIQq36
	hKw5jeyjLj9rCoTq3aW3K3Y9OdPUI3KbhkwtoHh+B1t1+dltmt0AwUNvW5iOgtyLQxoLKBEeEbrYc
	BqFNvvGXwobnZvIQNxVz+V9gESv93d0m54cb8ewo9YGKh5h0Te27hS935gs0n5ONtFQdeZUV8uGSE
	22MkvesOMwTsWUeJQxdH2FUTX/7KbXxM7qUKvdkIkCW7j4HWvmSXDOi5EgTuiXKk19AqJA0XSrepN
	s43WyTPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UvX-0000000Dx4w-3URr;
	Fri, 18 Sep 2026 09:30:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UvW-0000000Dx4T-1Efa
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 09:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sPt4UPchwds0HyAFeyAS2O3QFIIxm44YoVgrGfIwWCM=; b=b30B6hM5qGgR7kDM8/tb48iPFZ
	OGmqYOI4RrnqWzz849xzdky+MlfmHdW23M2KV9d5dyCIPX277Kg46ssv9nr2TJzGJISqa52rnt2X7
	3k+Cg1xw/ol48/O97tNqTSlzb9PpnXpVXpU9gJBZ5pbxZPWj0alyJLh0WxC3uOYKHYb8DHX820+Kr
	q7ISuRjP5eXV67mZmLlZH/HcstNyVg+TcjwhZ27FX4dZt8fl0N1I0FlUTgXFyMUmLzWaNT/j23wbJ
	aNUJ3m3B+5k3J8JANhSH6EC/FoijUcEUpSYT1/sIhMfhjaVIKYlTEtK0QAoYoRu0dYtZf+E/AxRx1
	ZBsmw6FQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7UvS-00000009rRY-2YNf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:30:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I601TC2660359
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPt4UPchwds0HyAFeyAS2O3QFIIxm44YoVgrGfIwWCM=; b=YLPoiHxsIe8HtJiX
	oRFJRCjiOGzRoV9uipka15Bze9kbzS8DzAO2GzdTk7SGkPMz/qKuOT74bkrHyt6K
	rWWrh0X3aG6oRE9542rI9flAMwzY8xHW4ZPa/yYPwwmJQZojBBeH1DLbzMQPHF+6
	9FKrkHY/AeqYfFldo8GkzOvTpp8EquXjwbv8JQZjEtlmZHEEaanMTbaHt2ZCtUlM
	gYWcp7P7Dg9YNt4OTIumt21JY7BICjqNpWPn69RHGGq8JAFV+Z/xsOqTrzotEcQi
	JuYhYVpylKaFAIYS7LwfInhuNiU1pemnFoMSyuDAws5Ov1DJ5lI5F50FY06FzO18
	sYAdSQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjttv6b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:30:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1e564fd5so79285985a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789723831; x=1790328631; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPt4UPchwds0HyAFeyAS2O3QFIIxm44YoVgrGfIwWCM=;
        b=XqDLJjKVGh9K/03RbcWrt8WH9zLDm0SzkxP5G7BGhk7hAd8y7XtiDX5jUDV1TQulN/
         imOPCd2PDOG1V33ySnkyTVrILfvEhL9ce0bApADTjc0ppIqCEqKh93bryXrTVob5R2Q3
         rU9BToxgUGImp0k1p+dFFJ/OpHVDhuEEQQmlL8uyjtR5b0JZAQBdDnkU/h4k/cocOptl
         E0IMGOpx5FNcy1elgaiyXQ5uMG56c1YYCe/TfHDZ1/+Lhz3p55t1gSh3lLW/Ic+aVWeh
         oyYBZxgk3zGpXGG9QI4hxDcGRAtBKtMySwC8YJvfXBV9So4YKwXiNJbzr5BqN0rNBPl7
         QyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723831; x=1790328631;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPt4UPchwds0HyAFeyAS2O3QFIIxm44YoVgrGfIwWCM=;
        b=kIzW6qs1V3KeMVjGWvqV6MAtt3lGb2GNL3/L37ESV3n35oTzsky2nv3d/NHyctj0Al
         6gGHJwsvqmNVHpI7Z9O4WH7nT+gPzRz0PgJaepaNCz4n27QQGAKL9YNaKa2PVYvYVV9E
         fOCQDQN3VLHyLgBe5Gf9NWvJIGTLIqyZNTg8Od2hYGSgcSkgBaz3wykIzeet2lduYsg4
         e7KiHEt1mh0qUa079791pHIQJAZ8ncR7Ny/rNijJ2bVW1Pw9fY8d60iS7TjayZjaFvL1
         FXD4aGKmeR9ozop/wBLQd/wFL5Mgn8EvOz6aM05cvii6Y9HVzGIMM2Z2BY7RiPFSlEkW
         89GA==
X-Forwarded-Encrypted: i=1; AKwUvBzeCM4WvAQFfipswA5JrACDsl2Kjc8WEdpqPmj6zPhpmgTHhI3BVxE+dKCpvJmB6d6pQAxrH72+mFJHs9zTjg/j@lists.infradead.org
X-Gm-Message-State: AFuF++l3p8SRsC2caV9/+ev54hKRW2CLIqW6r4dTBK6A3Fl5WjGgj6HP
	6osHn/P7iNeH9vZTNitf/BL4wtheHVeSNAppd3iSDMgR3fpU5r1JL7cbI+HRC9glCdg3/Ian0ee
	27T7Q3DvrTl+GuY3VVMyOzMOxw+/AJG5t8t5SBEiGgTnCTtUR5vXYxtTgNPSJ4w9zOUi6cALK9L
	wprg==
X-Gm-Gg: AYBFou0MiVmHRXMhswfcXHVjL9Apo6RjD21T5PEDTB18irZJiwJ+K0ICbSmQuNGJ7Q8
	bmtt93+dO+lHqtTUTlw1ihpK1nHyybIPfE6pW1kTyEIzWt4EDRKOnzAB0aMbHr3JxflvGejj0MX
	wuzLp4BkLeSFAhj7MzQz/anSnHn8bCHp7AP36H5QvGYinP1dfGbp8Ti80XREtLQSfvrVh8+LiDW
	3MAcbQeZ8rLJoh4R60qqf0LTusAcoyp+IROKhNK84Zzjbs4M3JsJZjsqqGi7ug0bEydN41fgo9f
	A+6X5iMKKCVxtkl9CpThXPsZ+N9NmYhllu2YrExc8QVxXmI+mL3k8rhp0i5+dUcGCE+hHilLRcK
	aRbFCMdrniP68NBLmQJFSK47nsoXIJPgBRvA9ohVopDv7XGhyu/+w0Z/XENEYjX1qt/uGni28uO
	9fKY7Vyv0pXgH2jwLApf1FJgI0xX2lT/eUVsXZWzUPMkFd0FJ+dKI=
X-Received: by 2002:a05:620a:4385:b0:93b:d7a2:83d7 with SMTP id af79cd13be357-93bdca24e18mr230312185a.70.1789723831363;
        Fri, 18 Sep 2026 02:30:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4385:b0:93b:d7a2:83d7 with SMTP id af79cd13be357-93bdca24e18mr230308885a.70.1789723830923;
        Fri, 18 Sep 2026 02:30:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6a06sm36747966b.53.2026.09.18.02.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:30:30 -0700 (PDT)
Message-ID: <6f1870b3-c01d-4434-a7e7-64c82cb8db41@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:30:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/4] firmware: arm_scmi: fix module auto-loading
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260915-origami-ibis-of-love-adaac1@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260915-origami-ibis-of-love-adaac1@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfXwwbL8qkVaCsF
 eKTFaLa0LXpTViwcS4ZKkOixfldk3jmG2aaWdriEWZPVodReOG63Uh/Rb4o0lNnPSefrJJoDNHc
 UnyaGd2NyoK579VsiCQsI9ArkobEdyKWnOu8oXDTf3jr5u9dFfe6Itwcrnc4aYlgHOHCcXBVmL1
 ZrdT968V1F8GZitOagbPtZzQKK/w5eH7ok4RKXvyPuSedNT3VOA0apUG7DPAYaFmVuWiGMsHANW
 KcqZaET5xTdtEpwSzsAptuXR/a72Xv8BrjpBwACaEtPjFmdJtBXGM2mBirIW4dWt+M/gXcr8K0e
 7v4qyLe1OGo2r2/iwNrX48tR1KR9vXkjDMrCMCKv93Q9sS23CDqmtp30NXPLrjR6Ot0Y3eZ0g6f
 DVPFy4Jsdza5gP2MKi06zJgy+2j/1O92ycVbfnIWJBwqxu0i/y8w7GvusYbVYXleBZA5iCejomv
 SBxg+EWDMGhqf69wUyQ==
X-Proofpoint-ORIG-GUID: c9I0wveCIji8u77VkFnqsz_zgDCJtkh4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfXzcFnSjiIOT8k
 340onWMWgqfNURjQY5I5qPSxZ/5GbPRaKSGeQFJYGNK0hfxioGbP/HqQinhl3AtV/xmo/xHRYoH
 TdV9QFaDGQ4C/qor/wTA5mKlwk5TX14=
X-Authority-Analysis: v=2.4 cv=IP2XmQvG c=1 sm=1 tr=0 ts=6aad04b8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hAX5TG2nhHmSM0hg0PEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: c9I0wveCIji8u77VkFnqsz_zgDCJtkh4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_103035_234619_2C014247 
X-CRM114-Status: GOOD (  14.27  )
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

Hi Sudeep,

On 15-Sep-26 16:24, Sudeep Holla wrote:
> On Fri, Sep 11, 2026 at 05:23:25PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Here is v6 of the patch series fixing arm_scmi module autoloading this
>> combines:
>>
>> 1. Patch 1/4 from Bjorn to add support for scmi bus modaliases to modpost:
>> https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/
>>
>> 2. 2 SCMI bus code bug-fixes.
>>
> 
> I had a bunch of SCMI bus/core driver fixes merged into v7.3, please
> rebase these changes on v7.3-rc2 or above and post.

Ack, I've just send out a v7 series which is based on v7.3-rc3.

Regards,

Hans



