Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC71D5B86D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 22:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihsSrburBQzQCLrZeOr5x5sV998XLhEapswC945EWi0=; b=39bVAqROFWZFkm8Tkp8XRFqLDx
	k3xlWpsAgeZB1OO8VlTAXdpHgGa1MWfngvieH/wcpEr7skm4fqeAsjKPDbziOnXn+VpTAL439MO3j
	ydP3pM20Vo+00ir0zS7Dr4uZfbUopnlxdjPiVn7tbuWYqgHkCXTXQVzmc7IJ/InWUVl/QYKHgrvL3
	U57Kcmq//ebbM70c0Xuv7HKTSQSCt9HKr7TyuaPXAFB0wauqr869viCcyRGax0/1Xbigqal06cBCq
	jXNqJACx6HWGzj3qJPTjnKiwd2zj23nPJyb7Mwf3lKWwCMcrc/X+6OZ9hIhEhLtltzQdxUFIA3BfU
	sKTRIssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGvG-00000004LjU-1mLW;
	Mon, 15 Dec 2025 22:20:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGvB-00000004Lib-1aiH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 22:20:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFGjELA1824346
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 22:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihsSrburBQzQCLrZeOr5x5sV998XLhEapswC945EWi0=; b=aJ6qlYrF5F+kxK37
	4jpZ/4sK2OqRkNLuabGgGSRqYmLMtSiSMXR+uz6eFyYAb+5UX/T7pcXjI4pBz+k8
	2ihWtK2mL6CLIW+SjbIzd2Ck1JsUaJQnFtnmwYK0v5s+ksL9kflEWHlSI4o2atcV
	PYOqdCgO/eVyF65pcrcYNHpMb2EcEIUHR/pqL7LHLm36rI1rv5uLidB4ZpE2ZMnY
	6MqwrFAed2E3b4cf/jQjh9wRwMgRHQhVtqqcHU9cLcpRb3pTpBJ3STQojVmUjAM0
	eOnM5omyBFfPcSTiR2x1LtCGNEFGcJgn9HMhBKETIAial05+v/sW7HNoQB4OGu9r
	LwnhCg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2p4f0x53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 22:19:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b80de683efso6697533b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 14:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765837198; x=1766441998; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihsSrburBQzQCLrZeOr5x5sV998XLhEapswC945EWi0=;
        b=S28ZOnivczoaFlRiZssYyVEkYcN4tAfbBXrLT0It+D9yVI5uBOmdge2oQki/9IuZqa
         CFX7NCef62mVaY9UaymSc3qGxJmy64mJBnmvLv7uYsSsOckl1XlOTMakpH9ZNfPTIckR
         yRUMymQ8nzF/BN2GKXPrcaGYBJ1JuEsK+LJguo2i3KjiCrci27dWVOAHBaHkpiJEczX5
         x0jfGlzpm6OOu93shcg5I/doR8Rur6mneb/9OO1UjCQSnSc59VE9yV5E17RjdBJ6Y9gM
         vRNTQXz8LcYVak25AaPQQfhUaDU3dZ/pDSgFLJ0M8grCODvXOL0tE+jm1r3mveZoHHtK
         xeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765837198; x=1766441998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihsSrburBQzQCLrZeOr5x5sV998XLhEapswC945EWi0=;
        b=Nmes4CwLqPk4JvocjNHK/Aw26dUh93QwXaI+AdCXogxlZX4B7EF2XdMeYaYXRG9Ygm
         bLt0MQP7UVYGktaAdjZwP7GA1LOsKB7lEVzSCE5A+Vuvush/ZVeIKiMoSJXuw3hda7nE
         rxRIwW3ieshD+vsvZRKK3CprxCLPTHwolNeL3KSUIlTNplZgKdxcMtjIJQXFQGdd9YC+
         N0LJKDAWDt7gmeN7HQ4kf2EJr+KndUv6xQdb8fW7axdN2TrE+cBRdp8QNS9JklrBl/UL
         CtX9bBHA+JWAuH+PBlpxw6CeQvgHeGISrtdCf9s2j8yrxdeeo9R5g9w/uSgD7Mcs3twZ
         pyOg==
X-Forwarded-Encrypted: i=1; AJvYcCUHSfo2Pz8me/Hiwl+EGA+gRf8skxGB7M+OZYEcFyd0sNlT9SBrA2QXVhq2a/rb3x1cYoQESpDFMWnufTa8/3ws@lists.infradead.org
X-Gm-Message-State: AOJu0YzD9P2xwKvxWpPQ6XAv3fzgobdP6Dfua4nAVUC+lA78x9lE8WmX
	T+QrK4h0WTa/B1/EDBHXU6WpJTvwfQYsYBbiYfol5O5c1rGzTxJZfmnZOi6lUSJrxDciyuEX2ra
	YID1b6rSq5xN8EpY3RH49jh/7nVH1m004pEJX2vzVOR9KXNnFxTZVuP2X+2ZZneJeJq7Whn26tO
	nhKw==
X-Gm-Gg: AY/fxX5IoQCW+AoOk0be4jMSVTD68Lf9LENa6hBpL/AiMKejP1qUWM5JONPc7ygngpV
	euMazuybsD1IYfNJr6zPAidNIsrV2NyVUy9Z0BE5AvCfkEaiXKS3N9422fyPORljfwJgfq+aKNl
	9Eprp7HiCBZsORqc5Pyf6r4QSnxax3uUj9uPE6edG3Bd1yaICRZgQSng8e/WvFArFwJ2nXIKjy2
	QkHjBFGdvRL1nYjlu5id3r0MBmAt3/7YNt9wUPVWzoxBpBbaMa87XH8YzhFv8S5yhWGgnnTCpCd
	YESMvD9k6dXC7r1jgvWd+A11DM7ZpaCdOpGR/DUx3xmMiz97Mvv7T1UC/07DXFF+/5OgDXevx6c
	PEBcBtm14rK6KqFmRLzhovEIU85FZyVIgtemoVoSXvGemBC26GdRJxo93m2DCaEkXHtX7Lw==
X-Received: by 2002:a05:7022:248f:b0:11e:70d8:5dbb with SMTP id a92af1059eb24-11f354760ebmr9481070c88.7.1765837197647;
        Mon, 15 Dec 2025 14:19:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNdW/Y+tjK5Z/LanDaZsTUxNDNJ9VP0kfwVTCegek0t8BJzH+p43HEhdFaZEWPXUXemJd4YQ==
X-Received: by 2002:a05:7022:248f:b0:11e:70d8:5dbb with SMTP id a92af1059eb24-11f354760ebmr9481035c88.7.1765837196927;
        Mon, 15 Dec 2025 14:19:56 -0800 (PST)
Received: from [10.46.163.175] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ffac2sm49034782c88.11.2025.12.15.14.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 14:19:56 -0800 (PST)
Message-ID: <b904647e-050f-4283-a24d-71181480dc7a@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 14:19:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc: cristian.marussi@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        mike.tipton@oss.qualcomm.com
References: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
 <6af5945e-7d5c-4596-ac42-c5898b4c49b7@oss.qualcomm.com>
 <DEVEXHI9CEFA.19RL3BXTV8E38@linaro.org>
 <20251211-masterful-caterpillar-of-love-bc2d4c@sudeepholla>
 <DEVFS1MAP8J6.2263USIPE4Y74@linaro.org>
 <20251211-wandering-magnificent-yak-5fb19e@sudeepholla>
 <DEVGFVA8N0N9.13ZJADVNM9PHO@linaro.org>
Content-Language: en-US
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
In-Reply-To: <DEVGFVA8N0N9.13ZJADVNM9PHO@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _Jc5hiYnrO9UQf__KkY02zf87xv4RFBq
X-Authority-Analysis: v=2.4 cv=OK8qHCaB c=1 sm=1 tr=0 ts=6940898e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=k9gND7Zxdg9d3DGUrpYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _Jc5hiYnrO9UQf__KkY02zf87xv4RFBq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE5MiBTYWx0ZWRfX/4RtLBpAIfpr
 8NXy5SSRPPNXP6sXyd2mU00BIR/u/wLJ5UQul4m9XO+OFJhNkDsUsb+2LkoL78qGfEoLsKMC6Xo
 cA8iU1Xp6ftXh9NGFqXHiG/M1AAXWrL0MLW6aXtFnNyBW+6xbxLbxdf9luKSSNXdEIKXq1Y4Ypb
 9bLX+ZuYoTS0iQhgEqtdalzgThpM5hKfpX/gg+uWOIrIVll5JcquZMv1ULeGlVAl2owtM1Wt1Uv
 0zoAL3ABq6umrKM/h1onzxjvcYV3HVtcVNBx/wSY8Bmy8V0dOKnYzGh0eEmLTH/Pa5TofiXbB9V
 OzUIB037qYD6TnZHxFA119pQNTRtCpqfxL2GnI99+YWaEWcMlGAzWHiicGczSqSmXnRiZg41s4c
 6Oz7qCwwYgSnQdbhM9gr4hBMU3+AJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_142001_538129_70330209 
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

On 12/11/2025 6:25 AM, Alexey Klimov wrote:
> On Thu Dec 11, 2025 at 2:07 PM GMT, Sudeep Holla wrote:
> 
> [..]
> 
>>>> Ah good point on confusing commit message. I just assumed it is limitation
>>>> of the implementation. I can update the log when applying. It is not spec
>>>> or protocol limitation for sure.
>>>>
>>>> How about this ?
>>>>
>>>>   | firmware: arm_scmi: Increase performance MAX_OPPS limit to 64
>>>>   |
>>>>   | Some platforms expose more than 32 operating performance points (OPPs)
>>>>   | per performance domain via the SCMI performance protocol, but the
>>>>   | driver currently limits the number of OPPs it can handle to 32 via
>>>>   | MAX_OPPS.
>>>>   |
>>>>   | Bump MAX_OPPS to 64 so that these platforms can register all their
>>>>   | performance levels. This is an internal limit in the driver only and
>>>>   | does not affect the SCMI protocol ABI.
>>>>   |
>>>>   | 64 is chosen as the next power of two above the existing limit.
>>>
>>> Yeah, that sounds better :)
>>>
>> Thanks!
>>
>>> I also thought that this was a driver limitation, not the protocol/spec one
>>> as stated in the original patch.
>>>
>>> I don't mind updating the commit message like this (but I am not the author
>>> of the original patch).
>>>
>> Vivek, are you happy with the above edited commit message ?

Yes, I’m good with the suggested commit message. Thanks for clarifying!

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> 
> FWIW, with updated commit message feel free to use:
> 
> Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>
> 
> Best regards,
> Alexey


