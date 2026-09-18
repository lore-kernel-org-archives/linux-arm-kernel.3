Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2D6C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkWvd6wXs7ggjF+yLAJdymgWMfkLNdqnHiJr+Shk/Qk=; b=nh121SBp0AeMe/+trOVCgDMQgz
	kmPrrPNyFbEuoHRuWBJ4cEkbAZQdq5NijwD06xPZgWnLMqi1JEX26ucvn+K9R7SMBsePUfWogdBHo
	nisEfrnT0CjbMkFpwzdROs2+/9nqjv1X62qXPLy9s+fE1W+9bi0jEd0iUfr2ttGq2uewqUI84dlKZ
	1tfjH1r+nqIrjhSQmPDWlb023X574TConB8oTsPRuqcH0CL7dXE7TB2Zy/hh4+oStI9qxpAWigFvM
	t/9XtnrGbor2yJCtFcYj8sl9kqfJIYmZLPbbwbTy5CalFrXIQT/DJEE24mvtELoIq/r9N6JGVSb56
	IEQXm3nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Vdm-0000000E4rL-2sQt;
	Fri, 18 Sep 2026 10:16:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Vdk-0000000E4qU-2tWO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 10:16:22 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dsY4139321
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 10:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lkWvd6wXs7ggjF+yLAJdymgWMfkLNdqnHiJr+Shk/Qk=; b=m62CTU1YnGapAeDc
	+qy7Soc6UKFvvtv+bZtezgCUvRpCy7x9WoLiUAuzSwXaLcsIs2vpyBQiqiD1qxlg
	4gu7HD2oaZnE2c7oBLTBTO+ZWNzFqctmWuwsEiFldYgdTJI1Rc94jm1zTORMfwdN
	Enz3kgmWZ7vAm8RKEXb5U1ZAo6GvmEqCjfSiyLzXlWYp9N82JQ0iDG1ZmXKQAU1S
	k92qUVLmxi8kWdJo5RtKARbqTr9LqLWILs3fYPDOjPlkn2jQ4D/Y3XpEGvCNjPOp
	IX43ijDUmFzVlZqdhl1kH0lIZtaqNdTTlzNNRRWDhO1K3MV6JGS43+G8Zm/8vCwc
	aiiiwQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2bs5r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 10:16:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e8472ee1eso12235036d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 03:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726579; x=1790331379; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkWvd6wXs7ggjF+yLAJdymgWMfkLNdqnHiJr+Shk/Qk=;
        b=OQR+b0MERZowvf0cPC8OTQjPbFZp5j7NRsHzSJxsb1ou5/jCb2D/mMufmGbnf5/dlP
         4Vb4WslXcFSqCCZBESv4p0OLV9FiqfV7/x3Af3vH1QON2AapS7qAQbNFh0eTcxHaDpr6
         NEMnuExTPVeQP53Ig6v5GMfueqmJAA1Aq1cgaK40a31/JxfbMGPke/L9vG1yZ76veNTj
         PKt9pTldGJbT/HeZUu/KIJcrpYjphF7XSFqHfYAquFxGKPAmhonkUG5XxliO3EJX5QUQ
         Y4FMW7aG6+jLTfAzkwo47/GdrYbmZ1euoikTU54pKWikjNiPGKU7uw7vuUe55yNYv0fi
         JdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726579; x=1790331379;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lkWvd6wXs7ggjF+yLAJdymgWMfkLNdqnHiJr+Shk/Qk=;
        b=anHJjAGXTGbBqNu0kyrHFCKKp0Mi/qbXG9bFgIr0ZZWDgd8fG0biDLYVKe2kBUASVr
         CI/4c92Y0sowGJa18jDunK4vSGlZO8Q++gbLLVnDKnaHtAyApJxa8VtjHzvlKgArRQV0
         mntRM2Hqo8pojOk1lsEohzDgyGZ1couNJw8sWgT/C+f+EAQ8dswM4H/dYIP2fPUFKvkm
         IrcZeTjjB9vayI7iyt7jOOVMhLkFQUnjD77EN5EEXCUmikUKYaIYNEdIZytmuucSuUsn
         M9j7Hj5wiAlAV/Dk+iH9C/4O+eOme9NDASGGD6ftw8lIeIOlfcxXVfPSI7KA/SeLJA4Y
         pQgA==
X-Forwarded-Encrypted: i=1; AKwUvByz4nzhAGUcqn/dXl5fofSQOqYtcrIAftOWLsRNQMCgKUsyMvIkvocwJoTwMmSeZtNYMeLOA01KGDc+u4dZY9LP@lists.infradead.org
X-Gm-Message-State: AFuF++nFVz66IQ06jR8r2r8nQATNhnILv9UMF/emHy+1Sq/i0r3MHJ9p
	Zj1rFtZFe7awuwLipVnvBq5dtkwAqYkHbfVZXIXVNFHfjg5FCdFI5DPs7tq8NddNrlT2DqJYvKC
	LDa6KXsn+aNRSWRlaHuVeRRcHt8IsAvFEgGwnhqt4crNQa6od1fiENSy8/ZcHiTmA0YJ1jNcl8+
	Kdfw==
X-Gm-Gg: AYBFou1Tyfqv4Mq20Emt++Itdptx9NSFvR+PaNTbAS9GI2PwsHK19pQjVsDjok+CUrt
	CALNSXH8VuT10EwmSnBPJfGdDBjMQhmvsRo6ByY1gaZwXImIQvcnS6s6EhTvCKQB+h+uWR9FJ+L
	xbXJ/RjZLJD+GeZG0fVS2/06AMqN7TnI6MTcRkbD1qi5TcjCvc2GCdWzA83UkfVgh1gh4YZTfQb
	L8ktpK4lMNPyDcMj6tFnoNk2XQECkrzgx8UW9S5UH5QyArmuBGxqsDkOZskxEpaGQR+/B4aDSQh
	oajMbAgj61d1Y9oSbmt/o/uscLdx5UaZ9OkrpjkAdZFb6VjGGCF0Y9hhmQ6NSQNd+254bzNyf4d
	fEkXYDY69FFJoLCAF1F3yf6YXRp93X3HpF2u4MLyYcLe4zuypDKgpcOCpfZPiQIc=
X-Received: by 2002:a05:620a:2b96:b0:930:f337:ebeb with SMTP id af79cd13be357-93bdc6d5ad6mr217943185a.12.1789726578885;
        Fri, 18 Sep 2026 03:16:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2b96:b0:930:f337:ebeb with SMTP id af79cd13be357-93bdc6d5ad6mr217940385a.12.1789726578407;
        Fri, 18 Sep 2026 03:16:18 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd17051fsm147325645e9.0.2026.09.18.03.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:16:17 -0700 (PDT)
Message-ID: <dcf28454-a583-4f6b-a11e-483d63be3bae@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/imx9: Constify struct
 thermal_zone_device_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <5cce9ea713edcf2aa3c0efd5d31e9d9fd9f40a88.1786220585.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <5cce9ea713edcf2aa3c0efd5d31e9d9fd9f40a88.1786220585.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MiBTYWx0ZWRfX3tZT/3JQY3pY
 Iy0J5ojgdBMKMCjCAyceFgo59Xg8Hpq/E105BLhu/4sC1GfJ1L+3InSkwadCFxJL0UUnDO6x9Kk
 rO9Xr/3Z1THF1TBF/gZwKQ0Wf4mF+S9Jpzy1fHuQwfuMlc1pYYT1/S6TsMKiVgxtQezityfzhVE
 Np1YSOP74He85Y8ARl4U9pIpSEOanDWfYNnmOtKf2F8VBDpuffPNakSFKhHi7NpDMeOuxdnZ9hX
 lrCi+HFs9Opjt3Jd9eNlgNDBSr4XmhnVbyerVhxwAMLj9iXQf6mfYg4eK6Rx2n9qzdT2flWtvyP
 MQlUTn6wBEQTDSHlazZwVPTRiSkayhPJinfV02BHI1ZAa2NGv7zT/nLFFEFbqgNzcBihSpL+GE7
 iqgRrwPlVLSJ336Ndz0kJ5xh1IrlhbAKOEHKfHKKGKA6J/v3nQixckdnymkOWUngrGuCyrVSHFQ
 zZNYsTDr7LxW7/wl4cg==
X-Proofpoint-GUID: VtzonYpTKxB9VbNiIzBwOvlmnL16SW-a
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aad0f73 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=_H6WjYdI7YG0SsD1Ov0A:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MiBTYWx0ZWRfXxgz/dRhV60Mx
 Jtnrhu1KOONasnZjvIfsvf3MwADoUSLJJdiqwfRfWwHX7RuyWF3sPaXtgEErKaUs8G1ujfW/42r
 AIWKJf4KiOC5uds32AgIHX2sFFRudhs=
X-Proofpoint-ORIG-GUID: VtzonYpTKxB9VbNiIzBwOvlmnL16SW-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_031620_845771_EF804213 
X-CRM114-Status: GOOD (  11.90  )
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

On 8/8/26 22:23, Christophe JAILLET wrote:
> 'struct thermal_zone_device_ops' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>     text	   data	    bss	    dec	    hex	filename
>     8567	   2144	      0	  10711	   29d7	drivers/thermal/imx91_thermal.o
> 
> After:
> =====
>     text	   data	    bss	    dec	    hex	filename
>     8695	   2016	      0	  10711	   29d7	drivers/thermal/imx91_thermal.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied, thanks


