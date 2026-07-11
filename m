Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62861C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 07:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3W8w4TQDb3xLJXJv3Lhnq1MhB2LIvVOPRYt4ylCCbT0=; b=eOHmU1/RG2EqQPweg7VDIx+oxb
	9JsmsOi3NUXkPswzRPTS8KzoYbggj5WgfyKpRKotyZRrvEu/pA8DeHuUEzJMEafz/5ZmrNWtC8DE8
	aGw9oUKrlSDFi2GZRAKjFxKQ6sETHV6p2fA1Jb+n9wfFxITR9I6NzBtrCDH8Lciy30435WgSuQDru
	KwxAV3rToCvs4npyN33MlGHTrrRMqApwwI4HinrcmeEQ8yv7/ftNFAbfHCGrN8QbIgFEVI0q3hwZC
	aHA5oRf3ZzZPh3PzDih0HQr2BeMqal6KJAX0bvOz0BNJP9QiU0o+Aq49ukqyLsz4bWnxywwz04vKE
	nvSnljnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiSNq-00000006KYY-25lX;
	Sat, 11 Jul 2026 07:44:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiSNo-00000006KXw-09C4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 07:44:21 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66B6xSkc3141550
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 07:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3W8w4TQDb3xLJXJv3Lhnq1MhB2LIvVOPRYt4ylCCbT0=; b=p1kGabnZrUBJ2hlY
	yuorghfaDblqSdhiYlm7ctULfYW560j+L7l7+iB67vL341qh7nyxHnWQ3vWOf+JZ
	AyL+t/ITqzPyNPIRozB7MX8mEBWt+AvBtzfnRvLVuxL5wutnlAqMyCSiPFm+lHJ4
	5zNPRWE26Tp3vKzWOJ5TYm6fPNn3tnJGEZMYI+XOjqwA1q91QDMG/ygGBWECuMPj
	Z4BKER6Cv7GHz9YukZfOSC6BM2F8AATDw/MGHYxikN133urbTv+AIvifq6YwvJrc
	1nnbg79iFo9Kz57dXBNr1W3jPMJYNz2mSpDjJZtt2iZySZWN1F8lp5ezAH8V+q/X
	PVWFdg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeamrcav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 07:44:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a97644aso17626941cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783755857; x=1784360657; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3W8w4TQDb3xLJXJv3Lhnq1MhB2LIvVOPRYt4ylCCbT0=;
        b=gr/lcC6JqRaek0Txyukjmt/AruJ01kXPX5N2GRFDtaPnSzJ5ZsbbnqPI3xLgQ814bA
         Iq8TuPvn2me+j8yijFA3cRboi2SLkDZXRaOyLRDeDqtW1CddMjZNCZFsevu+2cLSIwko
         B3rWfeZHlzQ18bniUnqfM7FX+J7wVkz1Paw7yMSz7yoyl7G8Agv3v3WdxdgplRfoOT04
         ieBRXngy5torm82dHHBAz6Yms4g+YNiFE4khV8JT9WZenODVtRxzJMEEdKuoV/+CEIQ9
         9QpJX4yRz+soM0CP8AaV4c+99c4/mH3kyc9MbPyOxedsP4ani57ukB/jRvMep6SCXYwD
         Me+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783755857; x=1784360657;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3W8w4TQDb3xLJXJv3Lhnq1MhB2LIvVOPRYt4ylCCbT0=;
        b=XGidcf2clnzLS7i3CrVeWDVW1Y3C7XBdJyjXdJa+dyO0ydWvJMc7vdj/04msM06VGy
         P0ofZPq1xo0DGj48K8u1zXFs7R9nEdEpHimMWFnRJQcuYTGXyF/4QXjGW6J6w5EOLLwW
         q/9weOf98CDssg851TqKnmEm2zREPwCRkUE6BWByBHbFr5HzNGWPTPnH1kDJypqcbxcj
         1KTLia13YoLqMS6MGpXwpkZTpDqfvdYYc5P6JY8oFvq/xH6jrkTdA9KgsvlbJtJsYXma
         5cFyrE34OINlxnRqN1qnJerImINT0jWOJowNH4tnNZBa3nmw78IjQbOvbU5U86qZVqAo
         X1/g==
X-Forwarded-Encrypted: i=1; AHgh+RrQLk4jazphKp36i2BeJcGovVNuIe7QGebqf2Tnk6I1Vw+lzzNmzCUvWTP9x35dPVAa5xjXl87cUNqwQKHfG3tM@lists.infradead.org
X-Gm-Message-State: AOJu0YxIOL9bdZS3EuGHyECgoKNbmOPcUM7s/0ol1mzBp9ca4jPCWQS1
	42b4e6Fa62MzYrtJ1Us4eCRe3V/mKSgmohT3tXyg+H8GBaoVkGuJSfja0NMV+e7sl/elqk/VB6K
	6/flPuardqbPxGuDyO/PJ8Fqy5LVUHU72yfzV8ec4Wuq7GpnaZzb4Ey20pfB88JA85HLE0bhnFo
	ig7w==
X-Gm-Gg: AfdE7clOFR5ZbTA/jVou4ksZgDW0mfz6PnXeeYxLKe4m0xGIECzBNDz5t2U9kGal3dG
	dpGPnXgm/wZZ6/v3wOW5np0gODTh17WzvOQuzVMGzlycXvu/V3vvyPR/8/YQbiWV5KiHg5FS5GT
	jLhoWDrmDfI7yNC4SYDh36gr2EnVdwFIVbLE7EZE+jHaDHrBEM61gQOoXQZCHJAOnw21zv+M90w
	F5j+gnpGhae7zJ0Xx2F5mSh5hCv9P+KTxnxHE6TijlzwgswmSP8BuPStiqE1ukNqmbQ13KDmom0
	ONl3yM46bajAZfF6bn0oMAcK7x3QONJMISAr+Zfm0XSB7f/1n9KzGR76S9yCIFkONGzUBgu87Tk
	ZLH7Z96JKEgc33CY3CU69bx87iXMTpqfRJikyeSu4
X-Received: by 2002:a05:622a:1b16:b0:517:7e26:369b with SMTP id d75a77b69052e-51cbf0fa21cmr20914721cf.35.1783755857559;
        Sat, 11 Jul 2026 00:44:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1b16:b0:517:7e26:369b with SMTP id d75a77b69052e-51cbf0fa21cmr20914501cf.35.1783755857118;
        Sat, 11 Jul 2026 00:44:17 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f4f09f89sm171709435e9.10.2026.07.11.00.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 00:44:14 -0700 (PDT)
Message-ID: <bd5541d5-cd5e-4961-bec0-c9550c72ac65@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 09:44:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: st: ste: Correct indentation
To: Linus Walleij <linusw@kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260706101823.341230-4-krzysztof.kozlowski@oss.qualcomm.com>
 <CAD++jLkQPHfq=_D_TPMbmmA4JFwbhhtTC+3Dj+uD2P6LFNtfUg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAD++jLkQPHfq=_D_TPMbmmA4JFwbhhtTC+3Dj+uD2P6LFNtfUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDA3MyBTYWx0ZWRfX9trL+pbAH4iR
 3jj7BLiQDo2eZEJUYUbNVYSwln9dnJoxh1FuDjNRgGJAkyG2skMmgkv0hCbr+adcI9V6bEW5MAs
 voVduGmGZHlWXWhk7GepNDYrpwGHNOw=
X-Proofpoint-GUID: MvooayN8H4MHCPiUXAlhhPJ_pJp0s_Ja
X-Proofpoint-ORIG-GUID: MvooayN8H4MHCPiUXAlhhPJ_pJp0s_Ja
X-Authority-Analysis: v=2.4 cv=dJSWXuZb c=1 sm=1 tr=0 ts=6a51f452 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CB77b5ot5C3TfE58PeUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDA3MyBTYWx0ZWRfX5FWwpkdXc4Pp
 dsU12+9ad0MV8LBKPKWgqEuIf2TwSKnJuv4S2hxIgG4ytWpqxwaVF8+gDrB3AfNAEh4vkit8gec
 g2tNtSrjKxMY6ZahYPckr59Dn7Y3iKBmrgC4m1c4BeEjitDP59LCxj2kcp9WCfQUXPiW7sBrezh
 W5bZY5znS0077xczLtSCWWH8Ww72VIIGT9YO1X88JknROV6x2sdJZ4wVhGbtQ0qUT5itfs5wLeN
 wceCAcy7Xho6QVL8WH5UIOCr7ryoDayKVpud+Q7PsvdiIN5WFprxG7R+01bUku7lPT7sPcj13Vb
 PfJGQe63vbxeDA4Qkr9BFFc2U85zMqUo8jT3EoytL5RqpBdKoRBsPsKxGTZzLTO9fxvBDV84qSY
 aUPHFR77ucJuW09lXMp2EpzOQFjoeyefH0ZM2aN/waiJjKPeiGR6ZlFN4O1AHAJ7zku7xYetF/5
 aTgjfZQXXbi6CzZFOHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_004420_199328_B2806226 
X-CRM114-Status: GOOD (  11.78  )
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

On 10/07/2026 20:53, Linus Walleij wrote:
> On Mon, Jul 6, 2026 at 12:18 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> 
>> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
>> No functional impact (same DTB).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> This patch 2/2 applied to my ux500 tree, thanks!
> 

I think the same time Arnd pulled it into the soc tree.

Best regards,
Krzysztof

