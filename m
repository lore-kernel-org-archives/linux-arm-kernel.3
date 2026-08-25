Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B8AC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 08:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYhkDV0y7XOpWdvVDzgGnrF9K75KOavFDUraFzDkeMs=; b=A70ZDaTL76NXB9berEkuxp8BZq
	zGzMhNRLIKy+s9R1HfE86Qy+IojWmC9qJ68Zcum3IO7f1OmzND56d6dyAdLhjBoOrHpo1kzylDk0T
	sKXZ7jam7GueWcjyUnpZIwHOJ7NG5J5WmpnNrAA9WIelQsA7/dCbs8Hhjk0wBwu4SXLfxBYZqQJTW
	ryH2/0OtVg2HOZJMIo5MNYwD5cTpANp4u+X5urzOg9kNnS+PWY2Unpc8iAiVEfH9WKhCbnOQ3S13A
	b52qyw/zr2V5N0qnkJLEFwgHF2RjAcgmCSz+9aoAthPNJ2gENwvmKlPy5SAFL63V6t2lbVWtJxO87
	Ffsdu3Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymWY-00000000Noq-1etv;
	Tue, 25 Aug 2026 08:28:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymWV-00000000NoM-1Vcb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 08:28:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88Qga196255
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 08:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bYhkDV0y7XOpWdvVDzgGnrF9K75KOavFDUraFzDkeMs=; b=hb9oUO/W4rgIbipL
	mGFectRAfdZBqpJCcwpB1ofAMp8oW3JaDF/3oGnhjjRjyg2iyuqKO8sZObFeUYzW
	7XE0gnADDbK3HC628p4fbs6euvMI8a5pHQLTHFRdEUTtzDrjSyMl8nZt+7N17gNE
	a6Ag6K4qIJCWKEDkW55cbGE9Bb5mQN0xLyYxDpbZ3+xtMAicAQYhWwoBzYbBAnYd
	oJwJtB4UzeKUTFlm5AVzFHjTPEw4F5dMM/OUaIegUF5KBLFbnNTX6uozastRZTGS
	gnZWV3jfiwK+AQ9Q7JIXqTIyUAS/+mlc7135RIl7S8IhUUXRL+FzM+CQev6emWL5
	r1a6XQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93pvgwyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 08:28:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ca37ce4c3so8534961cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 01:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787646524; x=1788251324; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYhkDV0y7XOpWdvVDzgGnrF9K75KOavFDUraFzDkeMs=;
        b=O+3M3nVrCDCBP2GBCdoP7b/lkuuSU/mj7WgAU7wYChhAtORDITj5BjbmjQSe7jIYE5
         yGHNLrdTWMJyLaYvFnvXMzCoguy1YGj6w99yQQaxQv8y4KSAO9SWyUt56RsOMjwPMShF
         OhuORw3vmdJHZ2LW6uUu0H1wQ3BxIPxf20bDO+p9WuX8tkpBYq4x1Lf0cebuJp8/lEi/
         XEgf7jjDGQt211PEcz9yAGpgJHTixVKmbJqPaZN9ZWR4pnsjDFPHi5K6clJzbVdz79Lu
         HRcxMcXF3lczzODGybDJSjGqpfVL7z0AvYj9SDipKds9WJUiTgBkp/fQod2O7MQBTgEN
         mSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787646524; x=1788251324;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bYhkDV0y7XOpWdvVDzgGnrF9K75KOavFDUraFzDkeMs=;
        b=KdPQtDC5WndZrMnNgJv34CD5o9KdHCS/XE64SjMAQSvZEnCdrUCzEztMEJ91u7bZ4P
         Mkyzgg/UjUy23UjH2FQ3uBI8Xa/g3AR/tYBXkyyKJEx9gWEZw++uq33YY+0CFOLIYRWH
         kDgDKmcTgK9aVyrspQcNkJSq3BVSuLGGyuMT55J3FtOm9Y7RSLt9bSgKuUcps/04ufXI
         Ipk6f+2/WNMirgrsa2GVCClq5LMn8NZxE3pFnPvk6BTEGa8lLsH6fCyLNqcvoeo/gSuY
         AA3xpvW05VCeZjLc6/ZHkTJY4s22NCPOl2I//nQfmNgQTcFclZE5Uatxzqowm20FQOEX
         8p4w==
X-Forwarded-Encrypted: i=1; AHgh+RrCgOSwRUULkOaJBbQVKmZ85KTJOmdx7txZWM7dYEaJjGqxDwHdT1k+eYCHgJrzkrCcvW7pCR2of1MgvtrjpHxc@lists.infradead.org
X-Gm-Message-State: AFuF++mOGpTF0h1KwedK3fI/JWNXPChVRtNe5tOF2T8H3JFNwVyjsKjm
	dKlIoCAu4VxSRAXDFIYv+zvYqRZc97nZb5lvdTbq+cgqPFX6jx2sq8K/ThemJH64Dm1/rAj+0HD
	0/TKPD99n2Kj1CFQv6o6r91my2suNZyf5jtXLAtdsQ9F11r8ewhs5vC3bnYfA4aqkBajJ4YAxuP
	uNDw==
X-Gm-Gg: AR+sD12jTSYgWdephCdZ33goR5GObiTblPo6Z84D/uxQqacTzxqXvxFmfmArANaXbne
	bWeX0cCz9vT1xGihw5p36DKFCTmJtX5LDZdlG04opFdj7Yj/YpgYP9s1iM/XA836+66U7hOwqMB
	p58vhIkHvSNapDaQsejfGQLSghjrABWvFPNeUM9HmHg462yj1l5Pw1SLB4EjT+t/snzYNrchBa2
	HdsxyRs6pwUIbFbngf0XmaL89CC6hSH9YweHpDEUQ3ItLUN/Kw9ziNuVEEXX9a5iioMBI3e0fxQ
	gs9N0mn7X4yO524rB2ZibFB230hjWy3Yb/G1pW4O7FcfeUs4oQrscfD8/kOPhIO8eNBaQwpzFO7
	CxHf0ByNzXAhA6AkZMIac37h4
X-Received: by 2002:ac8:5f50:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52df5a35311mr225835701cf.4.1787646523884;
        Tue, 25 Aug 2026 01:28:43 -0700 (PDT)
X-Received: by 2002:ac8:5f50:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52df5a35311mr225835341cf.4.1787646523448;
        Tue, 25 Aug 2026 01:28:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629a901sm1820302366b.25.2026.08.25.01.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 01:28:42 -0700 (PDT)
Message-ID: <8d8f7742-fd4a-4605-a9b1-153ace9e14a4@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] serial: qcom-geni: Use geni_se_set_rate() for source
 clock configuration
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-4-61171ab1cdce@oss.qualcomm.com>
 <4e0d636a-7975-4711-8070-6f71957b754e@oss.qualcomm.com>
 <17735f83-fd07-4fad-97a3-727cfbeabbcb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <17735f83-fd07-4fad-97a3-727cfbeabbcb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA3MSBTYWx0ZWRfXyOCCijb6ExEn
 JxFMH9wRDCiLaueQrY6LXz1WEFoP09gPeMQjB6f4jFWlKAG4iJlsotcNtMOUVjjBtTGwB+ua2Ie
 ISbSO2UdyC4KLkqX4IZC2uEI8fR5LTQ=
X-Proofpoint-GUID: t_WJTcEezd4JwYiQgvU2_jGhQZUP-vzj
X-Proofpoint-ORIG-GUID: t_WJTcEezd4JwYiQgvU2_jGhQZUP-vzj
X-Authority-Analysis: v=2.4 cv=Ru716imK c=1 sm=1 tr=0 ts=6a8d523c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=CZKBZ6wm4gaK5Uy4Yf8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA3MSBTYWx0ZWRfX72mH0KjVJDKH
 JgktvwCTrpUnMjBuDqot+7X+6p/KPEmJyneiY9tr6ivoecPd6RrXDScGui+Mv2nk9H+MCY1P+zt
 7iRxKH9eUMVRYkk7LyLba7ZLgCvI6JsMPwAf7lHmScDHOlGjty2Ksyh4BxPTLjI46cv5kvEzzZ+
 cZ/8KHKiQ5DQcGIemSKNJsyewRPjkL4VATh80uTQbdR621b16fP5q9ZN85BoJ4Y7LCvRAoGZ8+C
 onNPYaMJvpEvP4M7RsRDSQWjhmx+YC404K1bDat97PkLaHm7n9Btr32HzlloHsPbKH9D/4pnecS
 ZrkfcR3lM95ZCv5fnOAdR7DIxbcKZUKl10BQ74Cl4ecE4IIO4QIsExijc5OPztuIq3aQkvkbz+z
 Jtj81+oReaSEbTJVaOO4gcU2iGIpuG4nG2+Ci5rnVtBMwkjHBDyuWG/PzU1tvtFU2AHdzBwef/p
 VLLK5LtNxjeqQJENYvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_012847_516996_CED4FFFD 
X-CRM114-Status: GOOD (  15.26  )
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

On 8/25/26 6:00 AM, Praveen Talari wrote:
> HI Konrad,
> 
> On 24-08-2026 20:35, Konrad Dybcio wrote:
>> On 8/4/26 9:57 PM, Praveen Talari wrote:
>>> The driver calls dev_pm_opp_set_rate() directly on uport->dev to apply
>>> the computed source clock frequency, and dispatches baud rate handling
>>> through a per-variant dev_data->set_rate() callback that either
>>> recalculates the clock divider (Linux clock managed path) or selects
>>> a performance level via geni_se_set_perf_level() (SA8255P firmware
>>> managed path).
>> [...]
>>
>>> +    geni_se_set_rate(&port->se, 0);
>> This ends up calling dev_pm_opp_set_rate(0) [i see this is an existing
>> bug in geni_se_resources_deactivate()], which removes the power vote,
>> but does nothing to the clock (neither set_rate nor disable_unprepare),
>> which will crash the platform
>>
>> Both of these calls (new and existing) should be removed. Clocks will
>> be disabled by geni_se_clks_off() in geni_se_resources_deactivate().
>>
>> Then, we should do dev_pm_set_opp(se->dev, NULL) *after* they are off
>> to remove any trailing OPP resources (i.e. icc votes defined in the OPP
>> table in our case)
> So, if I understand correctly, the expected sequence is:
> 
> 1. Disable the clocks.
> 
> 2. Remove the OPP/performance resources.

Yes, otherwise there is no guarantee that the clocks have sufficient
power for a given rate

Konrad

