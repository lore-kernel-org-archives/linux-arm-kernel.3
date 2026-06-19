Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40C0CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 13:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRfoyPQGltYSRfxFZr8LolOMz3lbDOSEI4D1n3rMg0U=; b=I4a9ru2+SKnSa8n2OPT0VmWw5/
	/jpegaJZns9OMWXLdbSSpVpP4wWjMjg5QPc4aDX3iJckRtZvaozdgusdKCJZ46cEJO+jkHNG3RAen
	ZzR1hRMiBqyY9Y6UbfExMMptv2FmbTliQDTczmOwrVBL/3cPsospcnf19tETxS21dzAHbB+ggU7zp
	ecl9i7Z54WSJz2C95UXG9eanuIhkKOI77bUfvXUTqEEYqWUZBfsVuP87qWCuImwDoOipcA9OT6BcZ
	/esh4R0JzggwHRuE+7wi9li+fFZ3++7T78MLgNOWjq21AtYZBAxUYpFSi2c34oRq8aqssS/dCviKK
	qKCgaOtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZ0x-00000002SaW-1sen;
	Fri, 19 Jun 2026 13:12:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZ0v-00000002SZz-0dCg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 13:12:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JD9T33291349
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 13:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NRfoyPQGltYSRfxFZr8LolOMz3lbDOSEI4D1n3rMg0U=; b=DzanUwzYzk9w2Wzn
	f2lfzsZUjTymklzrnsb8cRGHznXx1jppvjnmevQ1qfWaf2eNwGWehwauL/3+wo2F
	COhk5zenHTfembdrc7N+izw5OAk/oS/pjaHdXYe1t8koUbIKglI4w8MBGDt38So1
	DihcbIzURhCGIJd2c1/P8zeDnCDO/lTG5gsGqhvDt95ikPurg2byggA5KkTHo9gg
	kdjIuJNV1Y7ON2cRjzpeGnoI4CWT8bQPelL3zl8mBHfX3IzQ5yzxdMiWgrfRFM2l
	Lym1ZMoA0+Xhz8Xcns4pwAASdAHWmfBStcA/rkPfKdTf0wowUk4ECSuNoPxfDQXZ
	qkqAHA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm26bw1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 13:12:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c2b64850easo44016885ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 06:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781874723; x=1782479523; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRfoyPQGltYSRfxFZr8LolOMz3lbDOSEI4D1n3rMg0U=;
        b=eQkllkt0kF4C3UZTks+EWvcOVgol7FzrraLxU2HLF2FDB7O2zPakQk2esFywnpucLc
         MZRbzrODAAcyA1fMF6vfk8gu655FjqefxKbmW7HD3N5JnfBQF69UDxOU5s1VnskOLzjC
         VPx7CcNHa/h6xKa7D7afVKuqSCE8TxO0CIWBpJe65jjZIB/EAX3WoOArnhrklrI5tcvz
         FfGHP3RUvzNuz9xBFqv8h5ZeOaa+uKH9FZysOlu3YEOZNU0Zr5Sl81dhcmTLVPcWlgN/
         95uVnJKU/C7mFQ8H8XfdECl3QEHDN+rMgGrlsYohdzWSprG6i1PP9zrtlbXF4SpMmQ6P
         bvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874723; x=1782479523;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRfoyPQGltYSRfxFZr8LolOMz3lbDOSEI4D1n3rMg0U=;
        b=VILEcX2fSsoTXjnYoQhpOqxCE8VetZYNHU6rjIn25MD4ey+OelwuHXEuJLbzCqB//Q
         E8LdC4rbXG3mAd9y63S3w7DVEBdjS0pZubXiRGBNlCQZ58ztJ+NfSEkGFZV4ELlwvGXX
         iSjCFqBiDNKGzurCEYQUQeWrceIE2Nlgy0ssudQJsrRUS7SgzauMVNE/c6WEek55g9So
         bTlbWJtvxW6w1HvYiBt5Rk2d076ZRxPj2tqnuirw/fMDRkwQRJUoVvGoNWleL8HbspOT
         Vi8Udxa8ls99Opc18fLHERntE0o0xM0tb8hOzId6Ync+/cqP6Grms93roac4KAD8JBat
         Y+VQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JgSI1Eay5+7CY7qQuUHPBaOpuPNrgaO/AnHowWMbkRtd7gCrY3mX2gJb1JvqTeRGc5dfgfGl51Rt7T7wV7CL1@lists.infradead.org
X-Gm-Message-State: AOJu0YwRNg1ywBpk4WvDl8BrVWAEDhnFiofkrPOhmD07wXwF/UqGkVf9
	fZ4i6hY+YjPL3BE7Ed4DW+b7WSIKT4y2MO5JpSvxIfq3+WCYXsEx2rgyXTan059H+lgr82tq/It
	5sjQRWH18sp+St4bZXm3Xe1d2Lp8pSm7gGkBD02M7V011yONIrhxv91IUuoESC/8hPseLMHE/BT
	z1OQ==
X-Gm-Gg: AfdE7cnC+a40X418uCKmufhuF2v9xBSjZ7sYTcdh/AhDicgU+LqJQEvL4gJ383GD9P+
	5bwxUNYoExlPDQCFEvNZCQdfpuEDAqWK7+1veyv1KgoP3C5niwnet+qTSVwFuhlwVBv8vM4zWdC
	o8Rpt//PDhP/sZo/q+mnBREqwV9qz5FvoKXsyEhPibM99ps7xtoQHsqXemkKlxY87nZbYq8AECj
	/elrMpM0D44oTg9qniBsZVUX+Mfz9xfCIT108XmTmED9nXr+KnQatK7EujZgGglOrQYKYm9JAQU
	mRKOXOegNMAEOKcuv3CrIBHaeBOSlaOvXJMXmcZFsouS3hMAZ8YZdZfVosftrmcbYXpd/XH2OaT
	7apjyugi5Gy9aEqGIH1okEE8iUJVMt8hyVQs=
X-Received: by 2002:a17:902:ec85:b0:2c0:db23:4c1 with SMTP id d9443c01a7336-2c718c77ec9mr39866985ad.5.1781874723148;
        Fri, 19 Jun 2026 06:12:03 -0700 (PDT)
X-Received: by 2002:a17:902:ec85:b0:2c0:db23:4c1 with SMTP id d9443c01a7336-2c718c77ec9mr39866605ad.5.1781874722686;
        Fri, 19 Jun 2026 06:12:02 -0700 (PDT)
Received: from [10.210.86.66] ([14.195.1.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7316d44a3sm19597625ad.13.2026.06.19.06.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 06:12:02 -0700 (PDT)
Message-ID: <ed070807-d2dd-4f0b-9ba1-8d2c8c93c30e@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 15:11:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: defconfig: Drop unused Ethernet vendors
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
 <20260429-defconfig-v2-4-e4ed4186028b@oss.qualcomm.com>
 <CAMuHMdVH6-5ZAjTyF3m=wF5-XiSDqwcgRhZWxJv6y0FoCnk4MA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdVH6-5ZAjTyF3m=wF5-XiSDqwcgRhZWxJv6y0FoCnk4MA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDEyNCBTYWx0ZWRfX3Afkz8X+WUXS
 +O1Shu/32fq0KgnKK1dV9QnGJXFsVcJI0NFhAn6M5DzZmvMKzp2f3+MNjeFQIwX74pOuX5jN39r
 7LhVljHtLVBBfPrfFSXVDocWqrmexkQ=
X-Proofpoint-ORIG-GUID: CbOzwMVOQHWRqNX-HdQOx5wztZOXEhb_
X-Authority-Analysis: v=2.4 cv=dL2WXuZb c=1 sm=1 tr=0 ts=6a354023 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZwZsPVarQD+7k2c32RDHKQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=1SjQUAddwDT2XRhnGokA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: CbOzwMVOQHWRqNX-HdQOx5wztZOXEhb_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDEyNCBTYWx0ZWRfX8nX1yqUqhf3i
 9FtqVLBgk9mPE2oTtmaQPjc//q6N7ltvYdY/BuJvGXZ0FOpInTML93r/XwTb61Mh9dbWmKZfSqc
 Vxff4n1cOiFu0Pnk4dsUGMHyt45SaPmiAKhmSJAS2A7/v+OoQqOXlQtmhWHUnzSV47Q1V2/Ct1c
 tC/gPKanCCYTej24Ne90/D2UkvxJtUbZKHDiKEXnSXMPdy1z8bxQeuepmjey7guBy5liu/8sE+l
 SGL/wSdt+L+51Tk5GGeZnRIK/QdqInt/SS34Bv9pCvPaR1gqA7FP48ewy+akeTfWgVz97OoHuTv
 9O1iYzLKNXRs3mABkmTS4742mFi/ex0mxqlkfziVzB279bg3FuzdlSDXJEcVk8I9baZdt7IanWK
 CuE077hfT+cgVBOpDOb2OigP5XFth4KLNeg4NxnmAUizUzwqU1tI2Ch2UwOLd8eA5kCgY3t6oBe
 PyuorjGEAzTizTCfMBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_061205_224208_AC9EC361 
X-CRM114-Status: GOOD (  13.93  )
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

On 19/06/2026 12:12, Geert Uytterhoeven wrote:
>> +# CONFIG_NET_VENDOR_ACTIONS is not set
>> +# CONFIG_NET_VENDOR_ADAPTEC is not set
>> +# CONFIG_NET_VENDOR_AGERE is not set
>> +# CONFIG_NET_VENDOR_ALACRITECH is not set
>> +# CONFIG_NET_VENDOR_ALLWINNER is not set
> 
> [...]
> 
> I am not sure this new policy is a good idea: none of this affects

I would not call it new policy. Just an idea which got accepted. :)

> actual kernel size, but it does increase defconfig size, and churn.
> E.g. for the m68k defconfig, I dropped all these disablements
> several years ago.
> 
> I don't use menufconfig, so just my 2€c...

I understand, feedback accepted. Patch got merged, so you know...

To share my point: I don't edit defconfig by hand but through
menuconfig+savedefconfig, thus size of defconfig is acceptable to me
price to pay for smaller menuconfig choices.

Best regards,
Krzysztof

