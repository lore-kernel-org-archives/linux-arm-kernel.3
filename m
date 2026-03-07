Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02404F513ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 14:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHc9Yop6UwHuJ8YhS0DP8hG5UB7Mgty9EtZ2lKjiKSo=; b=yzbjLxTZCFfN8djQ9sX5tPv8uj
	YJXm5NWuSP0YzjuVUliEUOCY1f87YST2ZJsz+yTDkiKvzhkC0dSNEEWVNt085paLtm9MJzh1wrYEE
	Srk5JjBIwtvQTuBO1BKyXB85NoaQD0/MlNrHqmWywD3FDdakl4Outy8TnAs3olKtN5QEzb67Thqvg
	2/n3/IUTIPxH14PYYX7G2JAcWKqHW48rie9J7hcCd6/LLHMpOs1X4Vj2n0LMsjUCTJ6VtBFEOkeNf
	K/pi1iLMWoQBBljgU8Rj5WtR2meY2J4PPNKQd55Ri8Tk119/3+7SG0MR4WREFBOjVTtyHRe2BJMnX
	QyFAzXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vysct-00000005G7T-1XEe;
	Sat, 07 Mar 2026 14:27:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyscp-00000005G6y-00rq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 14:27:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276rKcv2491046
	for <linux-arm-kernel@lists.infradead.org>; Sat, 7 Mar 2026 14:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RHc9Yop6UwHuJ8YhS0DP8hG5UB7Mgty9EtZ2lKjiKSo=; b=pXGmeh3rLsGbGf9P
	TFfhFpNcHQd1WdI+9oWyWa4CEiofenqebjfJzErrnmnvOzYfu4L5CmikWwaNbWGo
	ADX2S0iafS2mypSIxASRba6fb/u6bS19KAAFeb587aAboUmsTczePQG33FiZNeJG
	v1kWo0ua3+/jUNLNIyRVcM/gLlTRfIYN3H5/AvSGHa31kvJtH51ZkA3+Y1fns0hd
	3pvfNHT/C4QTevpbBzN4Vqjj7I3RLM7i1upOzZs33VWrCKIHHhreVvsZjagtjHiG
	xt7HW+lrIixDiB8SVgKlmeMaMi9uQQQWozXMlK5zgX3MZwsSwxRH1qMwYFsZEq5P
	Oi59Cw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc838wsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 14:27:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7fc27cf7so4677185a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 06:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772893645; x=1773498445; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RHc9Yop6UwHuJ8YhS0DP8hG5UB7Mgty9EtZ2lKjiKSo=;
        b=HoXTLuRIN8RzyrAnQiYz2XVsTbAR1Ja/deZYgdfghe6qwPUDkXy92j5sknPFACDvcE
         oFJsVvKVk3aIDyb9cX5W4UrVU2aeDLLrh3FcbgxXBmEu9SW857MfYE0S+d5x4ulSK6y4
         j+rwUkMl6WSpp3r4sKDm/YVL1MD1kRqIFfX5IajoPIhitREL0rQd1kXSDFoJum8Ae+Ky
         vDzh74zlET4jlNAHCgRrFC2ysZIV9GLnVkQhga6HM6NN1ZVioK2Oia7R9cvsM6a6r6HP
         HsJWtq5qcilrClLkW7WZxhNa1rNa4P1CRPhXJrGBrYADKsh6KL2xgbKTM7FnLgYB2pmn
         Kvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772893645; x=1773498445;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHc9Yop6UwHuJ8YhS0DP8hG5UB7Mgty9EtZ2lKjiKSo=;
        b=rtL4iMuCBz9BYfDn00SMuo7wBu0im/owEJbwkHRZ6TDPdRaxeNntVfWCqP15eZnfkT
         jQZ0bVHup430R7ZKK32iRzzF+TN51IxEIONcOjfmywEGh8ehF/ef9Fnaj3bUog6Ewtse
         ZYzyD+dE0DgSJsyTM8Bp/B3Maw2X5gmiNMyg1Vflk5o8uhN5dOAU1YX8w7B5YP24brV7
         hyIEtj0VZf96lOXS/B0HkpYeshMhDHG7MK842Q2fj9UGLohQCHZxDgAf33BltVgFUs78
         OQMmgqQj9NqTRr+YtOVT1awx1kqrVkY6Ku9si3N10nB+BdBOCeTB2GoCV5IohiuMG8Vt
         iLGg==
X-Gm-Message-State: AOJu0Yyh4XQ2AOtETrqdQ9g0jBq0JbabYvaMUuSTnqffFx9/xMsJW6Fh
	t5msCEgHvzVsTg55DT+XXJMg6YYoNGP+RGQsT/3XI0tPe7OzPnUizOz1pK0iNZTxwelq6aiReN4
	SVqBKO+nPXCUJy1+T+SrAg8SApqCaF0gx/UnHoyQlBBD6dONRW8JoLDUeQuY4SVPKIZDyUhe44K
	SAxQ==
X-Gm-Gg: ATEYQzwKCMO2Bi98Q6yiH+6yh+sePzzKnIPdFmpO4g7Wtls+ES5M4oJWR3vm2vnj3yz
	3KfA5NMR0ToKUwoAAmgteYdfbMm5w19UPIXFhl+Z8PeIC55cOSG685ExiEBITsnFTrl2hmhid/k
	U1W2KSaE5bdt8fALGc0O9SUIbRy5GYAVtlrfXIkP0wqj9KV+78Ow+tePhyyK0u7S7kOQG2vJgZr
	qjaGy1ogT56ewRm6GXjR1rOPjxMDcgVQZnRrQxfu2r3YmskNTaMJMQRWuWQ0cG/m5bM5gSU62ZY
	WDYR6MWD4gmE9304mHDjTCbRT5KDuQUg1PZ/cuD1h/21UgX4NkEKRnSwhKb2m3LPYvzvVGQomE/
	kil7F+8VzXaLdBcRSB80MInZLTWYO+sPc6QzX9aRZS/Uwfnn+
X-Received: by 2002:a05:620a:7102:b0:8c9:e8e9:9bf5 with SMTP id af79cd13be357-8cd6d43fa2cmr719887185a.53.1772893644837;
        Sat, 07 Mar 2026 06:27:24 -0800 (PST)
X-Received: by 2002:a05:620a:7102:b0:8c9:e8e9:9bf5 with SMTP id af79cd13be357-8cd6d43fa2cmr719883185a.53.1772893644402;
        Sat, 07 Mar 2026 06:27:24 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada9116sm11326990f8f.14.2026.03.07.06.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 06:27:23 -0800 (PST)
Message-ID: <31a75415-43e5-4b4d-aa6e-0e58519a3d1d@oss.qualcomm.com>
Date: Sat, 7 Mar 2026 15:27:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm: multi_v7_defconfig: Enable BRIDGE and DP83848_PHY
 for TI AM57xx, AM437x and AM335x
To: Parvathi Pudi <parvathi@couthit.com>, nm@ti.com, vigneshr@ti.com,
        linux@armlinux.org.uk, ebiggers@kernel.org, ardb@kernel.org,
        khilman@baylibre.com, arnd@arndb.de, kory.maincent@bootlin.com,
        tiwai@suse.de, andreas@kemnade.info,
        prabhakar.mahadev-lad.rj@bp.renesas.com, twoerner@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, pratheesh@ti.com,
        j-rameshbabu@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
        danishanwar@ti.com, m-malladi@ti.com, krishna@couthit.com,
        mohan@couthit.com, pmohan@couthit.com, basharath@couthit.com
References: <20260307133237.743059-1-parvathi@couthit.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260307133237.743059-1-parvathi@couthit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69ac35cd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6R3QHofTwkjtAvzY1wQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEzNiBTYWx0ZWRfX/79PEnlFQRtp
 WQj0vVEMbbf8x+MIahDXfg//46tMuEc57E7vrI2aSx76xBX49H7zpUTi8XAkNVEqZ4SWxTQysiM
 lrB2nlniI51fDQzGloSddF7b91J+qUkQiX8KDnZgdz2Sqr/k37x7h7rFtXIs9nERFc4+ugZWM2m
 hthAqxFyKnxO+h1aEwyPSIkh0DpOMXWSn10vyi/fbwpZnXRQxfpEpiUArntvr0+Vo4GRVwYOc5h
 xG+ijHAVU/SyRYBfA4pDCuYPKjmZGq4nxV7XG5AsoHTMFFbBpUMnoRolSGs+11dLNGErBiecX/P
 OfySS4wGoFxMRP760agJ8N3HHgzl2bdN0hUbnBnNjVjkTnDgdao3YjvLQuzQAFMXzNkFKGVMXhT
 Ozyt41Ao/7Yv0CpoB0FF/icasaxom1UWXOUiZHVzUHZM2iTJQlQhdiVko8SgQQV5gFF+/ycmyWz
 C0Q0qR8uNCkQmb2DDKA==
X-Proofpoint-ORIG-GUID: tD0uQCv7akCU7OK1u5h9tJjys2NL44o2
X-Proofpoint-GUID: tD0uQCv7akCU7OK1u5h9tJjys2NL44o2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_062727_071511_DCCB770B 
X-CRM114-Status: GOOD (  10.62  )
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

On 07/03/2026 14:32, Parvathi Pudi wrote:
> This patch enables BRIDGE and DP83848_PHY as kernel modules for AM57xx,
> AM437x and AM335x SoCs. BRIDGE is to support STP/RSTP Switch mode using

Bridge does not look suitable for defconfig or I still miss something
here. Is it a dependency for some driver?

In case you wonder: this is not a distro config. It is not meant to be
working for your customers...


Best regards,
Krzysztof

