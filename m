Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E63BC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 16:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MRdx+gc0EMLY0d6Erha0DN+MIlH8OGd0Gb6t8SUPIg=; b=nFIe4/xJl3Fp+RR3Pc6Ic50xKC
	zOdNGG/6Yhz4qLJuFg093EZQbDWMD2C425lfrMnIm4MxWnY1ZJciTKrUT/16LDWtsDPH7Y/7ZBV8V
	JrMyMPpt0SFGVSMzGroevxtrfM4EQNjm1fFnSv0virB2bZAtYr4JNKsmpsEeyw/A5o8D1ZBkL+JnY
	+5BtXzIPAuc1MI/ieMAMdaKGvL64UyLRdWggBX2lT79Zn6vzBls/yDicAQTlEbE+IcUdLDEGuo7jG
	UEQP4LnawtrPFrRJmqJS8MY+Tc2nRzSGMKvEFpmNjv5AYxOhAMRHPXtajBzvyT3pA+EDrA/8l70ND
	zv+BwGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Z2-00000008czx-1Enp;
	Wed, 29 Jul 2026 16:55:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Z0-00000008czZ-1EpD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 16:55:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TFweoN2095406
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 16:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/MRdx+gc0EMLY0d6Erha0DN+MIlH8OGd0Gb6t8SUPIg=; b=KfY3ddSORnegGDMY
	6AtquYqE0rRowUtwL9SaVDvw/yJbaSf2kyeqNPB/PFzrfl1f9iPAqgzRz9yOsukl
	6GmNLzV3/4cvWv/066RiQGUdpLpJm73BQ2pxg+QxF3iCxUHuoR2xCCR5zz1ccmy+
	fjQU8PWVMIuPVpACvASrBssjypfvr/O//0q113W3LBksWIN5WszoWSn6ObBG9UNB
	/T8wclutkbynluN4LHfw/ohGLhePwQJFzXt045QvV9DNUZQJMky1Br8KFUgc4pHM
	GtAYK/4LtEJFLxQ7nCBoSA648aR3FIOHuIf8AKiL1cpx4Bb2UfmbaTJcZf303+LG
	Mr9aIA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqmmu8afj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 16:55:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90795449fdbso2126296d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 09:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785344125; x=1785948925; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MRdx+gc0EMLY0d6Erha0DN+MIlH8OGd0Gb6t8SUPIg=;
        b=CKPLUWKft3levea14kDbQmvZz8GjtbOy+i9aUINpxl7xRFzD5M72bX/z+SeCCNTZoa
         am2pfD6mFIjGMUWoT8AcmXyRdMW9dbMqvwcmnc5knv5JHEPTInogclfa7p8kaQzznz+e
         HZdWEcA8hXBjhm0F04TgC9YU1xzkHMd6VrmpAvBQi5NjMszlclxbjSugXasNMTTdHvTW
         L2tNNXpmgbSj3weQpSXPAR9GxV2ww8iloYWIxAlJJMBtkaNrwjcGuT8HsyqUyjMilxym
         p/VhMaMtDMzbeSpIV7tcipbx2sdLYJ3hZ0BVGHEDh1zpXGXezokYTD8i5Rk/BbuDfN+V
         /7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785344125; x=1785948925;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MRdx+gc0EMLY0d6Erha0DN+MIlH8OGd0Gb6t8SUPIg=;
        b=AaDNfjmGB/QUwz3ygY9OS+P308hMikg+HHJHeOW4B/qDdmlGhsRH6VUow7x/lCbOyC
         SRQ79DoIpjTWLacL0Q073I0u9fhy6UbErmOE3Y53dNKv1afv+Ds1QEPSIQC8yQxV2q62
         uy/z2KjKSPI/po/mtc1J0BpdPhanaLQV+/Jov5TF9Y9qS07qMonRv3+38IViDYksOubt
         YL/v6UziDwcZSTnWH7En0X3IGGjLpW8Vp9DwUz8BxxU/Ka42OxqtxZ8LnnIGyV6vv0xj
         9gr4DFKfu6MEC8qRaew726Dli0HuGYy7k75eKRM/ezi/moDajIaf6s20s8E3fr3jYRTw
         ekkA==
X-Forwarded-Encrypted: i=1; AHgh+RpFU/oGIvZtDkSnZYMHHmXrQfDw04hwVskWA9Eqjog0d2YA+dkNER5K9HuC1zKN4GJGruzX7lu1pPPoqSqOMrv4@lists.infradead.org
X-Gm-Message-State: AOJu0YwqCuQutGS0OGvrqPT/5lCScwdV91SfMZsPDhzpsJ5Jh/0BvL9+
	VIK2MjH4zRmOchaSRtFO+43C2ZyN7qqxxvah8LZ0wSOwMhs9Crz0bwcGTlwT26cNgRnhRVbwnBS
	G3mHDf0iRrCh8qp4wr9s1qnbqWapkvAY9Mx+zCALs5e5q9SGLdlDsv5HyCJ0e6+ICES6q/+E+3u
	bWQQ==
X-Gm-Gg: AR+sD12QAQ9tKJiGZV/A/Qczeu+Vf84GF0Wp0c+kSscFcCj4yhzwiNK1MP9Ky3eKTFs
	HUmyW74d7sNqc3Ns5uS9LOF1iVw89G0kacTLQYvFl5s86LGgrtuOuuxVBIoXZ/cgBfLyoIJ1ypZ
	4CczwV7TtT758z1G88Xhg9ofAHht+pvdsoEFU+S1CGVN2UzLoa96zapBhTxK6ZBExRmnQO1wiMr
	WMq5DzXUzfq6uAaerGEESQwO6I4LA7nHTmh+epffk8ASu703x3Do5KoqQXAPPtlkFm1sJIO8992
	f69gRbhxCqJjd7H06CstryIYdet7LXIpEUp7m7J6k5+N0lytg/ADh8sKnK9TvTo4rDn71fGMdF4
	MQkqfV0psEMWzJb+pIlZAJxXM
X-Received: by 2002:ad4:4ea3:0:b0:907:bdb6:9e82 with SMTP id 6a1803df08f44-9081cb1b92bmr93043486d6.3.1785344124750;
        Wed, 29 Jul 2026 09:55:24 -0700 (PDT)
X-Received: by 2002:ad4:4ea3:0:b0:907:bdb6:9e82 with SMTP id 6a1803df08f44-9081cb1b92bmr93042606d6.3.1785344124049;
        Wed, 29 Jul 2026 09:55:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83d271fdsm143607466b.28.2026.07.29.09.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 09:55:23 -0700 (PDT)
Message-ID: <50d9d0e4-28c9-42b6-8b71-e75682b4959c@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 18:55:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce - Remove driver
To: Eric Biggers <ebiggers@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <2026072412-decrease-sandbag-70a1@gregkh>
 <CAMRc=MeFoG0UXYOAqYhCiKBTs12EjX2-Bz4wDnbeYXmQA3-OaQ@mail.gmail.com>
 <20260724141414.GB1876@sol>
 <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
 <2026072455-subtly-prayer-0a8a@gregkh> <20260724150932.GA6763@sol>
 <2026072428-ungodly-outsource-b20c@gregkh> <20260724155144.GA2032@sol>
 <20260728152241.GA4281@quark>
 <15904301-fd03-45e5-b909-dfce52449726@kernel.org> <20260729145520.GA1702@sol>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260729145520.GA1702@sol>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEzMiBTYWx0ZWRfX12ahC7rwblhq
 FDIm/3tpoXny3AyxUAObdWV+XJeLUsnsOblPwPQTtLM4DvQFo6NSSDoxg5mdNZ+shWJY/Wt7Ay7
 4TjgAJMg1TltiWVVr0vnlq8WxArdiG8=
X-Authority-Analysis: v=2.4 cv=dbewG3Xe c=1 sm=1 tr=0 ts=6a6a307d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8YPMGcnm5QQmhjRosbIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: YZ760nwC84EH_qQBIEo5gLxsQL_sQN4s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEzMiBTYWx0ZWRfX0kgxHucoEkXU
 YUzXIDMv87AwaautZh8UwHiwYY+Nd17JJv2jVUs9MtVzdwO66Pc0jD9/tiSB6suIsgkX/fGcVDE
 dNHBMdx10OKkC22jEqqS13Pcrjf+wtIoGJkQMTH1V23+n02GkiQ/AVMqjW/lgglaUStUXBzMnwH
 acMQ87k6nmem09VY/DGxDCJ8Syjz5iZ1wXyTncWDHfq6B0aywUAswOx4y3SSVsB75tQsx0EVjvE
 Ge4BxtMedfhK4/Icw+6HrtUVjhxex8vZt4geSThFayLNl0tdqH+ibhKW6Vs67CjDtfE29Hcmifb
 rThyxu451MEh/R8TsB5ZEwtdy1N7YrsWJc0hB9NP92iwFgB9SEfLLdPdjX72DvjW741HLfLHZty
 aJ7T5Grfe6jhKgtS0+JOvY0NpFtFgKpapYHf0MsfhC73mmYHVFp5cbxSoP/lRsKLtfMz24WUU1f
 Tf24Hcg2mOvTgMteclQ==
X-Proofpoint-GUID: YZ760nwC84EH_qQBIEo5gLxsQL_sQN4s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_095526_375852_C507B23E 
X-CRM114-Status: GOOD (  16.78  )
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

On 7/29/26 4:55 PM, Eric Biggers wrote:
> On Wed, Jul 29, 2026 at 10:02:27AM +0200, Konrad Dybcio wrote:
>> On 7/28/26 5:22 PM, Eric Biggers wrote:
>>> On Fri, Jul 24, 2026 at 08:51:44AM -0700, Eric Biggers wrote:
>>>> It is consuming a lot of the community's time to help maintain,
>>>> including dealing with LLM-found bugs, with no clear benefit to anyone.
>>>> Even considering *just today* we can see someone sent a bug fix:
>>>> https://lore.kernel.org/linux-crypto/20260724081537.191992-2-thorsten.blum@linux.dev/
>>>
>>> Another example:
>>> https://lore.kernel.org/linux-crypto/d5de5a55-eb35-4ad5-8d53-12e188e156cb@oss.qualcomm.com/
>>>
>>>> It definitely *was* causing problems before it was disabled via the
>>>> crypto priority system (which made it unused in the kernel) and dropped
>>>> it from AF_ALG (which removed most of the unprivileged attack surface).
>>>> When anyone accidentally used it, it caused at least a huge performance
>>>> problem, and sometimes other problems too like filesystem hangs.  It was
>>>> an issue for years.
>>>
>>> This actually seems to have been an overly-optimistic characterization!
>>> As per
>>> https://lore.kernel.org/linux-crypto/d5de5a55-eb35-4ad5-8d53-12e188e156cb@oss.qualcomm.com/
>>> this driver drains the battery on every system with the module loaded,
>>> even when no crypto requests are actually sent to it.
>>
>> Unfortunately removing it drains way more battery, because the buses
>> never hit sync_state and are kept at their maximum frequencies:
>>
>> [   18.021823] qnoc-glymur interconnect-1: sync_state() pending due to 1dfa000.crypto
>> [   18.029605] qnoc-glymur 16e0000.interconnect: sync_state() pending due to 1dfa000.crypto
>>
>> (it transiently also pins DRAM and friends to max-freq which absolutely
>> kills battery life)
> 
> Isn't that easily fixable by marking the node as "disabled" in the
> device tree, or even just deleting it entirely?

Avoided? Yes. Fixed? No. The DT is valid but Linux can't deal with it
[since the driver is gone]

Konrad

