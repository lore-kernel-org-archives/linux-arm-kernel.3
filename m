Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10491E6F095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIOcga8tvuCYdI0XxRB15D3t5J8mAK/U2/1owCkkFt0=; b=Utx4Qb8Jwr/DVvdWqEg7AAj+0N
	HWvjgBrLEFSoYCyCPi4UlxHwa2nJLUPJe1+RmytzbUoyR98R7FjZV1iVB0ifPJ4wFa4HgM5JCUJJ3
	pjWF4P0tvdaiRBb7LfsNvqCKm618/h+Wg0F6wFxfSzRDRNdOwjGeKXQCSQHGgDhuAsT/LiqFESIT0
	KjVBLxRLsZkWhA7bkToNej4cyN/tWWxIQT27b53mtSQkechIHtOKShtsWGWGTnR6Gji2tbka/sLWL
	PuWPybm/HAHk1YOFnLk3FgVeh3ZQHVkiSPTL2dAuPTIsRKDWa10Vf/FmcBGxqtqqUkCeo1HBdyfET
	QxkgY/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4R2-0000000Fi5r-0tn0;
	Tue, 23 Dec 2025 15:36:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4Qz-0000000Fi5N-0KpT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:36:26 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN935m02747194
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QIOcga8tvuCYdI0XxRB15D3t5J8mAK/U2/1owCkkFt0=; b=WA+y+jVcfROyiOFN
	DyMr5YMeUmVAFQLQ4pceMQsDTopTzp0Zyo+o9F/OwZH0vkA6I+MUtaw0We+H2R6H
	I3hoLqYBPYYPR/EdMnpJnpEsagYwA9qg99YIM4ll5rVKupbaBd2xo8VX8Qg40h+d
	1ghBZkDl+5o5XocYjeksLft6s0339kPhSyFpKUD3x5A8ppuhSSGBnkqEUfjMEc7e
	6dL7VdlfEzQibLwoNxuDUyan8Pt5hoIV8FiakEObXNxqTk+/c6IIjZO0j2L5QMz/
	+G8ea3q4QvHOJwPWAXLO80xd8oY59qYkhPVfypXLXxCFbe/+6E+fU4de0a337xn7
	4HEyYQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5ctju0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:36:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1b39d7ed2so112255091cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 07:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766504183; x=1767108983; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QIOcga8tvuCYdI0XxRB15D3t5J8mAK/U2/1owCkkFt0=;
        b=FWMjuDlzwteHi6behU8KjTPh9hzn0s3mlnL9eo/DGfA+19XYnKZVlCusBtSTFW2cgo
         acd1+E/kvVemirWRvEARNFpBJ8bV3+A1NmAao85gxn1WNUERs4/3/9J+OZUCsuX6wFaO
         NU0xBs8aSsq3YaWtxSLZ6Ol1B3nROc+K7y4AwVxnX1RtgKk2q49CveVMvUWIFYsdyULz
         qbx5chNTVtCVjzDfAMVTXhjS0nMqSbUbU6rAw30fZm2wisXeJTRHZ1DalSxtImRMuKfH
         r7WwjTI7J6MZ3O3HU9EP+4KQr+VkiZAK9X6ASpBat3fUCYH/S32kAwJhSAqXPXAUByBB
         bmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766504183; x=1767108983;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIOcga8tvuCYdI0XxRB15D3t5J8mAK/U2/1owCkkFt0=;
        b=anGbeWWhYrRxZhQ4TTHbkEVoBdyM7H2PUxHPaIHeij/D8L3TYYIu7gRnJ7fho72FSJ
         7+9gtQprto8L/MZV2UnbixWkYTA0rV8iocFW44DNnuiLjUwLwo1ipCvd+2T6i30YppEf
         UncPopqbZBN7g44JkPSK1RtyziZvFIqpAOvPpe4ArGVx0WlJ8xES0ObTInV0XMbiqNw3
         g534LhnBGOsIM6lWZf15w378sHWgy0hqLemuVaV8MsUQPNrWxJVaTNQkJioX2w1Axufd
         UHfecceH0Eem4MH7fSky2vnsA4Y9YlxpwZj+kWqzqd14kma7TPDwHR7i61varrCid7Cx
         bF8A==
X-Forwarded-Encrypted: i=1; AJvYcCUXNbOnP3Wf28EdjpK5u0QhMaXT2VP+1YLhjmzMDsGFCYcYDz3znsi4tTJ3DnW2sl6f0mWLSm2DKaSViLZ8ZQ5G@lists.infradead.org
X-Gm-Message-State: AOJu0YxwMA9seKKIH3h795M1ZW2d/VJCLUkh097MpZyxNDBKQvCv0Ur6
	nr6KbQ+DCCzNkBCUl88R3q0yQSQHAD8Wqha/bj0hCMkRM/TqhzDmMCO43u1djZH/VDTk7v2b+Gn
	chDNdhlg3NWFGuZDJiq67a16w12mL9I3Hw63LvVVvXVa9eUR8jOyMfC9rhrRu+rjiPem/fuU90U
	kAfQ==
X-Gm-Gg: AY/fxX5qQD7BKB9krJkNAIdw2Gk2p/SM2j4WuR4n/33o4ZnWKYJoKWCmiooHSvpA2Bf
	obkV/xsDSZqFE2SVRppjfVEHVSBO2b3Mj5awo1/7VDUw0F+xVTnYOCTyxd0hM0bmjlpwMSMJ8Ey
	2hFu0lDg0yQSKQslQKFLWI3Peck74eY6Ct8zYNsYZdMi+vgAlATb1xl7MAUEbFeqByhl63MrZCM
	taaXCHz2WlJKZtNWrNg6sit6uqL41JMeFkdWXyv7vt3O2VC4J785lWnaTsRgQeax7O8udEm+gKL
	tAZKYfB/jJFPPdglilWf7uxKYCzZDkE6VNXJXbsp0vAnvgR/+IQOCmq6NmH34ZjqY18q/xEVZWA
	J456TLIIy/CboYkijoZ8FRnfiTkLzO7hC+nIx7+RoxNbwwjIHKXo+cYJZjZQ7/RtCPHY9tEN6
X-Received: by 2002:a05:622a:1248:b0:4ec:ef62:8c81 with SMTP id d75a77b69052e-4f4abd8c6bdmr187097841cf.47.1766504183081;
        Tue, 23 Dec 2025 07:36:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFa0/vT1HdK2OeKDFzVcVkE4/C2AtPTPDM+HTiFFP6jGO71ylf18KEo/MBPNRWSVP7s3lEPag==
X-Received: by 2002:a05:622a:1248:b0:4ec:ef62:8c81 with SMTP id d75a77b69052e-4f4abd8c6bdmr187097391cf.47.1766504182508;
        Tue, 23 Dec 2025 07:36:22 -0800 (PST)
Received: from [192.168.1.27] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a604f5sm1460739266b.11.2025.12.23.07.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 07:36:22 -0800 (PST)
Message-ID: <cd06d5bc-ee77-4e04-ade6-6d650527378a@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 16:36:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Documentation/process: maintainer-soc: Be more
 explicit about defconfig
To: Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Drew Fustini <fustini@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
 <87ecolxlvk.fsf@trenco.lwn.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <87ecolxlvk.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyOSBTYWx0ZWRfX7ekBLgT1Op8K
 Akdy0a4ioEj+7Tqj5b9LyVWEflo6XbjWsdw8uGwDv6/JYtQLPwKchkwNdPFp7gJX6TFmJUB1ZuO
 EV9L7EwYySIOJGIFI5FGw1XTyifitlQ3UycekDXazVX/DviUqK2eC/h1aY4Kxw2OEMtd7NYhUwt
 EqePUa09UbmQdaZhJSPAqa/LfoCgbSSbIvEZpheWBwEV7yPSBwjaSwVk4+LucMtpcp4PQAoVPfu
 dL+2tNBtWRw/VgLwZG4CfO5K8iDBttSRB8Y6VBaFs/LvRqPm6VN90xIC0GgVA5LlF4yEQFOgov6
 Lnxf5ysEDVg+TIp9kAJPrvHDPbgjcXqhpM2mML4iK2R8pwdzr0jaJMdlnS7C+2mSqdl5yueLmor
 da4iUpNcoNWhScWL6vu8nCftn2mpgeHA3/6/TUIh5X9vmBjaf0/QR2hQVPYO4O1Ss3XV4TwMuHu
 C9bqdbS+7HSY9pj+Y4A==
X-Proofpoint-ORIG-GUID: 7NgNGgNc8cTIQcdij1uNJq6BfekIwg7m
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694ab6f8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=NA6n-xKotOlSH5BGWq0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 7NgNGgNc8cTIQcdij1uNJq6BfekIwg7m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_073625_137283_BA796B36 
X-CRM114-Status: GOOD (  22.78  )
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

On 23/12/2025 16:23, Jonathan Corbet wrote:
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:
> 
>> It is already documented but people still send noticeable amount of
>> patches ignoring the rule - get_maintainers.pl does not work on
>> arm64/configs/defconfig or any other shared ARM defconfig.
>>
>> Be more explicit, that one must not rely on typical/simple approach
>> here for getting To/Cc list.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Incorrectly addressed patches for arm64/defconfig are around ~2 per month...
>> ---
>>  Documentation/process/maintainer-soc.rst | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
>> index 3ba886f52a51..014c639022b2 100644
>> --- a/Documentation/process/maintainer-soc.rst
>> +++ b/Documentation/process/maintainer-soc.rst
>> @@ -57,8 +57,10 @@ Submitting Patches for Given SoC
>>  
>>  All typical platform related patches should be sent via SoC submaintainers
>>  (platform-specific maintainers).  This includes also changes to per-platform or
>> -shared defconfigs (scripts/get_maintainer.pl might not provide correct
>> -addresses in such case).
>> +shared defconfigs. Note that scripts/get_maintainer.pl might not provide
>> +correct addresses for the shared defconfig, so ignore its output and manually
>> +create CC-list based on MAINTAINERS file or use something like
>> +``scripts/get_maintainer.pl -f drivers/soc/FOO/``).
>>  
> 
> Like Laurent, I don't see this as being effective.  Why is it that
> get_maintainer.pl fails here?  It seems far better to fix that, if at

Because there is no single maintainer for that file but around 60-80,
depending on the context (who owns the CONFIG symbol). We cannot print
all of them and finding actual owner is not a trivial.

> all possible, rather than expect random contributors to notice this text
> and work around the problem...?

Of course better to fix the tool. Problem is known for years (10? 15?).
Was it fixed? No, although in August finally Sebastian Reichel improved
it a bit (See 750b54513f69f1046895346ea97cc3d96584355e) but did not
solve it, because people do not run get_maintainers.pl correctly.

My template reply, so often pasted on mailing lists, always suggest to
use --no-git-fallback, but it's not the default. We could try to make it
default, but it won't solve the problem - output will be empty:

get_maintainer.pl -f --no-git-fallback arch/arm64/configs/defconfig





Best regards,
Krzysztof

