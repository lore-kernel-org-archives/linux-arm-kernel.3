Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EF2C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 08:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAvLO0GLp2loAsKy0xyKwG5aLfgTFlT7QknME37DmoA=; b=tKBLCg1Bl6vdbrAkOsFwPFFSE4
	6aaElaWCsCU46drxZxm/Bp3+7PvaFoNBLGHSCw+TCYMGqTxpRRF+5lAbMWekj8RWend1dNM8H+BxJ
	VTJ51MTYar+t9taxWUhMT4ck+0HM+gHDFVDlsNB1FMphmSFN2pZOO4lIfggryzcr5qzUOdOkTPoiE
	KC1ZrAExKzdIqOQVnLGjZqZLe7c0iaFLaLaOvBkW40ZJ9F/PryCfkNZG2wzky8UqtMRVXrcuhhFew
	fKLbqYCFWVpm+PbH+qAQdGlGcLXvBG6+I8K+UTcu2nsfPk6GiCILVemUy6t/skeWMDZKzW0WvQ84g
	wyIFXNcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4Ox-0000000FeYr-4A23;
	Wed, 12 Aug 2026 08:33:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4Oj-0000000FeUg-3Wpa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 08:33:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62LTr3288516
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAvLO0GLp2loAsKy0xyKwG5aLfgTFlT7QknME37DmoA=; b=CMi+xbV8rlZ997l6
	8ymfyCRnjTVDNYMTFbQHDvUOjeReWM0cMy1Nw29jxh6/EDU8FzIYaqrlwgV6Dugn
	Th7xAreT9RbRpZiaZNk+Ysied6XpVbJFURZv2SgQTM/+JG5tUZWc3Lr/c4Vf7A5d
	l6jMNpk5fMu0/wKwGbZkUeDeUixWNfMRkRazXLD0J8FxCUGrAjjVIhnO7GBU5dQD
	bvumQhfhc1mO+doLBf+WbbcnepCS6H5Ic6uwaJaHFNlixse9tH3RAXjawBbJR5fQ
	hO6a5Chx7vTh8a3CJdlOdTlrQnchK70Mpj7t7/gHEA8jL3rmO0tDthA+ANAZEa6T
	OdEjbw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049ev8ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:33:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c01ff996dso10750381cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 01:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786523596; x=1787128396; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAvLO0GLp2loAsKy0xyKwG5aLfgTFlT7QknME37DmoA=;
        b=QSoNVmsjmOdPuxgUaiqewWoLogdY/TgyG7V0bZEI3312Y9PM1t9IOV/BThDE5WPX4u
         B+A2FBumvkB2ehzd2Sr8Gje2IshSc4EbIxF2lBIZiJH1Hj4zMVjpkpaDcX87fwgunq6B
         fFMwGUBCgw8LxzMZ2Js9B1nn21idf9YQcIJPRzDLgOEJ0Z/CjUSeV3IYMmFiUpLVSiD9
         Fs9pBRauxdYs4Drc+01MYz97ry/G5Sawn2eYJ6ODj3B2kr4JBcUlqrFXy/BzEBAuxk++
         ItLDxplcbGp00TZho6YjykcVhX7dBlHeL5WZuntONycu+6NdTYDiPTWhPGvdPgtwah3F
         ibjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523596; x=1787128396;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAvLO0GLp2loAsKy0xyKwG5aLfgTFlT7QknME37DmoA=;
        b=LOtQ4aeegeRqLV86QpbpQyp2BQPU4t7QN69WlL7K5qhLhN2rvaDfhNJAs3QtwxTwAd
         du8PS9fxVMASlYj0bHYuSteD/zFtpynP2E5v63YwEjaQ0/Tb0F6mpZlxdeIb9pvOF8+M
         GRb5VjRbFuo/gATZ9CNyTlSUSN7pGpTPlp7KTB0UpYex/qKWR8DRlFCQNLxLGTuZpkVW
         H5KoA51OzSB8iKT4ttaxIVPWOk2zz0YwHQKEnv00Eb2LDNV0pMFPUgUdZGdJ6qFwBYkz
         XPtbpVWpb0UIRbm4PIm4sCrgwwFDOWa7C5zjXNQasC8hfapvlaZ9rf65bhoP0r6au4dc
         mMIQ==
X-Forwarded-Encrypted: i=1; AHgh+RqOfxQjKvoGPec4fCOOhcDHHd/WJRVasSjGWiIUz4gL01vlT5ITcueiZdir0WmEFB6E08RulRxu2qrLs89rifu1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzccm3sJzLfV7QHEhvIJI2oxCgvhhOd0Yx1qV/1dFrlFe8EfjAJ
	hwsesKiJ5pkZvQQcWLs06GgNtE/VA+Q+RncZmlbjOJkrB+dzYKV556SY/Dx3duPotRhhECevpGS
	C60B7Qzo937BLjenKgK3DH9L8y89zxMbmI+F6KRN7YqKjmZBdS74RCYaXzlsy22c0IsHOGFM36a
	X+fg==
X-Gm-Gg: AR+sD10+GTf16GyznaO4qb1uyqvzObOglPyTZNjaZGNO38BMM6zI3AjbfWlMtFQDqPC
	OZbxDbaP/aEsXtCAFQ3if0/EeOze2XvYnH+v40BR/lgjomMNS8LOfCTnqQslk2gj5l+MNOuxyRM
	4qo9fz7GM0bf5vg7p6RCTzNKfMInpzLVF2ir6msgcoN2Mcr19z0l1W5zHGrzHApQQ2xfE7b6Oh0
	n7pA5DqHo61ZCWZNZHmqqjpxgkARv5fJcz5PZo6HoWp/NURxh7mArFLB7rIO0F0bq+L/VgdHMl9
	VIN1EfHDlDmBQ+UDHcedhuIvWKFuFCaee2T+M5nZhisCIWpVFyh0f9ZlaG76eYtyk34TuKqySLI
	lonQGrDoHCWZ4fXMkJ6uLnjbzrNSurz04zwfX8HkDaehyRBNn11EgTdkmAdHMdJo=
X-Received: by 2002:ac8:5d16:0:b0:517:76b7:7b3e with SMTP id d75a77b69052e-52d64823701mr25115291cf.38.1786523596197;
        Wed, 12 Aug 2026 01:33:16 -0700 (PDT)
X-Received: by 2002:ac8:5d16:0:b0:517:76b7:7b3e with SMTP id d75a77b69052e-52d64823701mr25115061cf.38.1786523595799;
        Wed, 12 Aug 2026 01:33:15 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b467:f322:cd3a:615c? ([2a05:6e02:1041:c10:b467:f322:cd3a:615c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c998f27sm28031395e9.15.2026.08.12.01.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:33:15 -0700 (PDT)
Message-ID: <16d3f0b9-2a12-42d0-93b6-b9da3f540256@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:33:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] clocksource/drivers/timer-riscv: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        loongarch@lists.linux.dev
References: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
 <20260724-vdso-arch-clockmodes-v4-6-ddbe447be860@linutronix.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-6-ddbe447be860@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX6MWDH9HAnFRE
 NriZJuSwG3A5aGjU3yLOBYhcumetLFrMKv8Yc14VZTPCRTTLrTbMZrauZAtmGRJBDkz/7TVlQXy
 Y+ldu45/h43EB07fQ0VX8ssSvtXPXFY=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a7c2fcc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=eCx_7nzpRrifSLxMv2oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=VT0m5QDJU3gA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: k_BWk9OwbPJ6eWQgcKltINKC2I796qk-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX+1h/CRUqAbJP
 dg+dShWAgxoqq7AmAaOGxZUp1kNQoGu+FdoAyYisddOUHdXi/hjvvAAqsmYsSaab0KTZOcLDl5j
 ZOk2JNuhK0D9eYEp3UrtQVRCYvDckNPmfeXvoBdNT89m/rNIgoLeja1mjUieQ/iam1FX9qZf2up
 nxSUybKnskUrxwl8tCANBZCk/KLOg68wosfE+rxmTvaKsvp+nmhB7dTNwX+MMKUovC/Xu5+lEU5
 iYYHuMSnEuCtXtLD3RMV2JBFQeFKTl9aiWLj/p7fuHpQN0JLKD3GSZN4EHTo1Y+hE6+zwzmWDIC
 Jgk4p0/PQxrTD03IK7fSfPMS7/586Rj+JA+Efth9NdePKhUnZzxyKB17rzONQuFSTdnT7gAw8OF
 cLRjCKmJEEpVl1O5Ro47FZsx+LbkLnsPDggrFzN1K3GWowyyTtl1cRtVjbit/kG9OebrNMnGL8w
 q/PdDl/OBEXUqni5E9A==
X-Proofpoint-GUID: k_BWk9OwbPJ6eWQgcKltINKC2I796qk-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_013318_295158_6ADA19D0 
X-CRM114-Status: GOOD (  11.13  )
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

On 7/24/26 15:36, Thomas Weißschuh wrote:
> Now that there is a definition of VDSO_CLOCKMODE_ARCHTIMER
> even if no vDSO is built, the ugly ifdeffery can be removed.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>


