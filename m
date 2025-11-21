Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B3ACFC27E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 13:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0PJANFh22hzlPBVzCkXtRS++lr7yTp27hrWIqEw9VE=; b=4Bku6v2U6uOKWAgo9IF55yOtP8
	XzMn41+/JnwsoCAG5LpFMmROr6iwKTafehAomT5xnmOCjcUnRnkqX3lD7GA5BUbuYx5F6vu5X2L2j
	JuNuMJMSAF/rf1DjkteKpgyboAa9sayqp7TV+l7aycErhFyCcVZV6wQGygRb0rSZjo6WLBXeKk35B
	X+7fBJ7zq/btneHWTUt6hF/8OeTCPpxhjL12H/lnwns5CtsYnWmO5dBj0pmj37DlQc7DZkHEjJEui
	jhqSZDjdyFm6y5ky3B/gVNz2Ywf6LXurqJS19KrfQueB1RPgitGLRPupIxRqbmwV+fPtnScpjTVtl
	KLWhp7+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRRW-00000008RKx-1VAi;
	Fri, 21 Nov 2025 13:44:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRRT-00000008RJY-3q5J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 13:44:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL88gG11390845
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 13:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E0PJANFh22hzlPBVzCkXtRS+
	+lr7yTp27hrWIqEw9VE=; b=LH62XUe63WzP3NtgSEBKYQtA0C13hPRikHHU769S
	UL4E8mTnEi0Ain0oBSQqFPau+uUw1AttyciLUx+5bqBLJNjvSQ1szK9zhQBqzGmg
	Wvjbu/RPUhM9mFrKjKm8VEtdGGfN6wtjaWx2Bwb7l40ByXlXo6gQ2YpT6TXklMhk
	LRK5vOw9PFk87r8F4DYVDFSuAk4CXeru67TvVhavwZQt+OxhzNBg1f5gPnZDThjM
	jnQxQq2K063PfQeLk2t4gS+K9VjNo1eJ0vnaPwyCux3DPF1g+ASdNU1vWpbvbM+P
	iFKIkbUMNs6jDtT06dMiUbwbOMYdc0iHeI5K1+bGwnq7bg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajb532n9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 13:44:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8a5b03118f4so896772185a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 05:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763732690; x=1764337490; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E0PJANFh22hzlPBVzCkXtRS++lr7yTp27hrWIqEw9VE=;
        b=G1tYXehzpDOwFMmub4c+HKLA4XFN4YGXPGsoTVeTrFqHIkdIzJph9i5brq8G7AnagG
         A7bMtfRwoqnCycc+Ut6VRzIA/+7WhnK3ReX54U0NrwZcJHi1obaelANgXrvSVWohmbNR
         kdGPmw1oPAUiV7XaCBDeJhXXVe8ErBR02C/IP0LtGUGiMiOlY6KiudEKtGkLPzaaPuAw
         saJA67XnFSVDxhYfCVv2IcmDU/S/niJninqeMcHS7HOHuWbuPo6J4208B8yGdNg8EVoS
         llNUeFCIEqjtRvqzOl5iTZVrSVfl3XCqTTVYxWvP7z1n0TsMNukG+ZMGnzKgggRfvPZe
         wiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732690; x=1764337490;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E0PJANFh22hzlPBVzCkXtRS++lr7yTp27hrWIqEw9VE=;
        b=CoRSnH+BltORjXYG5HKP+44yjVyp7+HcYTIZoGt+Oar9EdrSUWQL5Fbgl4GwP8bZIz
         B4vyFy/Gwxf6Hwu3YTDU9/bSY0sXCJkfpuOp1bm46O+7UxEtHaSJNLtU4a9QlrtMvVqP
         83rDZ/dqJUiXx5tKcEvb+mkvT8sLMut/CYj8jq5cTZ9ndJR6eTawthV/oPA/FbERvqZI
         yV+gGqxfx+1C0q1xAwbDTuK+6NeOsTEW1K5lBMrbnwQ+1DYBTZvQYeDCqH+Qldl9C2vx
         zHVzw3EHWnVAatEEYTowdNGD8Avku4dRUY/RYfdtd5Hfw8XM7wCdu/Q4QwziFXZ+XzCM
         capA==
X-Forwarded-Encrypted: i=1; AJvYcCXlo59QsWNdQ7r222sj6E68ESA1ycTiaQPBJmlvA6Jt1cNfOTJw12KLD+BoAnjQJSdYV7GtM7VqECaezaFl7NHn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/MSDPN1oo7esjqA3wQmHR6kDAEgZchYth9MWy+z1OrKIDg/yZ
	IX5UJNzq4DwlnKUmLaGT2+JO9ats0WfnUJF7JTHfvGF9WTjewkjSLy+rBOXLnro5M9fKmWmzp4a
	5BOvYnlA+1OuGsgDZ84AOpjSwepKPkp76Us4QJ2fCWL9QAyFzG12aVpuxiJJD8y4C2BmcXoDgYr
	RWpw==
X-Gm-Gg: ASbGncukJt56SGZeN9tQHmxWd++cFYIcOrCK1mTx2z8sARQaL9FmLYvkykzkSPaPigt
	w60j2TgHG3Kl3DDM2X8ZkWuZVEL6r/reZQOaj4t+1Lxkbtowf+/O+PxdoqqSoBNOrki+/oq5ZqV
	L+HLzxUWFD3baWzXKSqooeNU+oV2CAjK25t5enQLaqjHfVRhI/3ZEfEbsnCH5mjoqwP2ZvzVTNQ
	gD0iSqmXZ3l+vgI3e2K4JMllVRR/zWxiVu30Z5X5eb8Ns2Ua6TLqkBvdvQfHxfxidWz4J/Wampm
	Bt7W/koGcABRxrY6/snd9NW5Hea2ELmlm+b4r5txixApLc+MbvUg9GJH50hiUiPi53Hze+/3/+Z
	SMtB9hanAolcYI1MMR2SXp75C
X-Received: by 2002:a05:620a:4149:b0:8b2:e9e1:4023 with SMTP id af79cd13be357-8b32ae1c485mr811099285a.27.1763732689534;
        Fri, 21 Nov 2025 05:44:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVJJt9LwWMFl+QHUjmwDukftW916ahnCuR1qHw/ai8/yFgovQIiqrAJDl9QbCTzeoGwhFhqQ==
X-Received: by 2002:a05:620a:4149:b0:8b2:e9e1:4023 with SMTP id af79cd13be357-8b32ae1c485mr811096485a.27.1763732689062;
        Fri, 21 Nov 2025 05:44:49 -0800 (PST)
Received: from localhost ([2a01:4b00:b703:c200:1ac0:4dff:fe39:5426])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477a96aed1esm88851375e9.0.2025.11.21.05.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:44:48 -0800 (PST)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: Hanjun Guo <guohanjun@huawei.com>
Cc: Will Deacon <will@kernel.org>,
        Punit Agrawal
 <punit.agrawal@oss.qualcomm.com>,
        <catalin.marinas@arm.com>, <chenl311@chinatelecom.cn>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: acpi: Fix incorrect check for default console
 message
In-Reply-To: <3d79dd24-b11b-7a21-d24b-3c6f85d54c0a@huawei.com> (Hanjun Guo's
	message of "Fri, 21 Nov 2025 10:40:30 +0800")
References: <20251027141941.3089914-1-punit.agrawal@oss.qualcomm.com>
	<aQN0YWUYaPYWpgJM@willie-the-truck>
	<3d79dd24-b11b-7a21-d24b-3c6f85d54c0a@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Fri, 21 Nov 2025 13:44:47 +0000
Message-ID: <87fra7a4a8.fsf@stealth>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: FoTyy7EAUVp1XEf8fuxEim5P-3a8ZdBT
X-Proofpoint-ORIG-GUID: FoTyy7EAUVp1XEf8fuxEim5P-3a8ZdBT
X-Authority-Analysis: v=2.4 cv=Wugm8Nfv c=1 sm=1 tr=0 ts=69206cd2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i0EeH86SAAAA:8 a=_yJzmg8VWEz0JnKV7dEA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5OSBTYWx0ZWRfX//HTyJ/9pF3B
 7VGlxqOmsFdfBdMwvIZAuPyJCq05VXD47kurodsBAyE9sBjIMUWwtfrnYhSp/vmCgirYd2HSxy5
 mDrEGjmAuoevt4hIGABU+8YtEUJIGsi78c1RpqT6FuTSFeASdbKFm5bkiVl5vag91PzMOTvYCb5
 vhvCRRsKx5ErAh8DBhHHW6TfaPnZqJFKncLMbnZUjj21ufdO8cLPxlfnuzO6auYqLWj6VMpSsWN
 eR/+l5d/DSavMnAT6SS1H+X4EhQ0uW8XY9VB7QGxtGGoaMslbfLaLjUzx5mNJl78anYoSJtyB0N
 lLC1RupLw/yNHR37JFALFcD5S4K5wHdS51kIOLmTTNXmkdsTxA/Fn3jEb+gsDqxs2263wQLX3sT
 2CBxYOoXrKDSUk1sqauKsQFA995xPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_054451_956697_3FE90976 
X-CRM114-Status: GOOD (  17.91  )
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

Hi Hanjun,

Hanjun Guo <guohanjun@huawei.com> writes:

> On 2025/10/30 22:21, Will Deacon wrote:
>> On Mon, Oct 27, 2025 at 02:19:41PM +0000, Punit Agrawal wrote:
>>> bad3fa2fb920 ("ACPI: Suppress misleading SPCR console message when
>>> SPCR table is absent") mistakenly assumes acpi_parse_spcr() returning
>>> 0 to indicate a failure to parse SPCR and prints a message to the
>>> kernel logs accordingly. In reality acpi_parse_spcr() returns 0 on
>>> success and -ERRNO on failure.
>>>
>>> Fix the faulty check to output the correct logging message.
>>>
>>> Fixes: bad3fa2fb920 ("ACPI: Suppress misleading SPCR console message when SPCR table is absent")
>>> Signed-off-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
>>> ---
>>> Hi,
>>>
>>> After sending a patch to fix incorrect parsing of SPCR[0], I was still
>>> seeing inconsistent logging on arm64. The result is this nugget.
>>>
>>> Considering the pointless churn - I wondered if it isn't better to
>>> drop the message? If others agree, I can send a patch (and revert
>>> bad3fa2fb920 while at it).
>> I'd be happy dropping the message as it looks pretty useless to me,
>> especially given that the current logic is broken.
>
> Fine with me as well, in the acpi_parse_spcr() there is a default
> pr_info() for the console information, we can drop it here.

Thanks! I sent a follow up[0] that's been picked up as a fix for v6.18
(already merged).

[0] https://lore.kernel.org/all/20251031111138.1262202-1-punit.agrawal@oss.qualcomm.com/

