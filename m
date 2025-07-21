Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BF7C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 17:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1To2TtXrWvL7KDLUWwYZS+zt9S2lZ7nkcx7wxlUsgc=; b=yZjcSE/JECRU11nTB5T1g/NTgY
	wbKS0qQcjZKaH+N1+l0sQuTr9OTFfpYllUkANh8ekNYj9S2w6DuXsJBd5MyV2BlTW25Xl29hWXgbl
	k8wvpsmwooVIv01siB739UXNhY/SObESbmg1ffMFW+QEeXnukMogPi1E5eZlxfyLEbMByaBu39Arh
	jCcmeGECHB3GXoFYTlWrsKJVrrxhOZEJNgDgqYU7M/SQe/kcMBWFTnuND/qHhx/bwj04s9GwjHPBX
	wkSABrrBumsBnTLrI9Kp20+tsKAAtBkG6aenohfR/alvbfD3U8DbxzCbCMLgG8GGe/vtNQUWBbVka
	kRa73iZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduOu-00000000KMo-1nL5;
	Mon, 21 Jul 2025 17:34:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsoW-000000007YO-12fn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 15:52:29 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LAWBG4000994
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 15:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k1To2TtXrWvL7KDLUWwYZS+zt9S2lZ7nkcx7wxlUsgc=; b=UMR0HOfNvnMdl+Uc
	aUIUBqSvnw1RGmMDEBnY1JMRFTTxP2Z9qQLJyzDWK4t5Kh5ui6nVH9DZ9+SpWFQy
	r/S6xJKg1zJX7bCyCDTK68JxtdLP5pDkuNlvassiqkz5i5Nt/8Yc0dv1uFajWqjQ
	A5BPK6oCteGYiU0ELJO+agf/aE7m+aOB8xUnfDwZtpujON3yWq1Q+NeLtIS6uqwj
	7h0o2bzvXjRqlxMI3pNeEq9zFbI88TD0eAAfuAaKlZ5czEO7YvlIC182a/mdDfo1
	8+FNROe3LNH4TYC6m4vakJgFruUpowdEe/tghuEB8pSuz8IvFtywIuaKQvjsBUFS
	RUxaPQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044ddy0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 15:52:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234a102faa3so38609125ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 08:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753113146; x=1753717946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k1To2TtXrWvL7KDLUWwYZS+zt9S2lZ7nkcx7wxlUsgc=;
        b=eMNajtCdV23E1PZNk8Yvkxhr/0p9zjxGaxJpXJmsqkGMnSYtbg5Hj5fI06cdEyivAT
         e8sCqZvUN+21cyMjjj/phU9nf9++Uej7V0mmQEFHFkffQL7jo3PSu0qrJEH/kaFQuiXT
         tX+fgM5754s3yNmCeJuoEy3uzR43HTIexc7P8u6Gp8DRdVaQeEPJtqv9Pwdjw1fkC7SJ
         wbHpNRN2ccTr62i/GaU9CI03OtmRikoW6XDjaOaVMtUmYiG5en+Apcem1KSPXvykZZIG
         2UW11Kr7jadMDcFp7/Y2OmEo4tY0+Ilxn0shWv+xkzlOgx7a+Y2RvB8LAgabRIdu3JZJ
         SMCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXsxUpRE6zJbpZ4ofLcG3ZBFsoqLD42DgFjZGz6E7An/JgL2OxsPqgkQkHqVzIc3BMSr8ltYltJtjaXgdHEFEL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4HFYvp5DATUONYzYp78KDK9lJFtUsffH7LEplC85Ua25oiLH7
	S9E7ERDLlGi68batJn4RXthY9GZWklk0bzv3AAle21PXz7Kgh7K7b9Gcm6U63spOd794AyDRa+m
	mBdpHKCGg+kqYDsYGcjW/3lzJ+pwl9PVN1tHGsn8NQn6u1ggRJuWFWts976VgaRm6uETLkl/T9B
	LPvw==
X-Gm-Gg: ASbGncsyXdJShYBxe5QAuzDbKJuFq/0tgaLE/cy51N0LNCAA7e3AlBnHsYPWE9FP62F
	KgURaUYaiNLtBb3P07jsIWkwypDnGn/sR1PNp3iVE+/1nQF5YaC5HREFrWXj33FTSHTMPde/QWC
	ZzoHqKY/O+iVmiw/dfK2YUIEo+Cz2+0enuRNggrRvxZ5jKcP62mhMYAgxrsgiqesAQOdm5dzmka
	ieYcRvyXX+b1ZAYPzJtczwezgAoFx1OccrfLzdD4RFZpCyZYH3VbWfxVZh/8ZM3dEYHK6OxIB3n
	pzMqc1JyMiKfF6S7BEyRX0YTLnwsVzJQtKqzqs9pysJYPs8I0L0YV6xLcSFnbCdEDpKC/zDkmlS
	JIQnFhb0qE1toPA==
X-Received: by 2002:a17:903:11c5:b0:23e:1b99:2a71 with SMTP id d9443c01a7336-23e24f59902mr290415685ad.39.1753113145692;
        Mon, 21 Jul 2025 08:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPCwCxq1QkhMyEoe34Z12143edz1TUZnWOSk/9IkmrEyBMoiqaPExRfBVgfEPrzhXVmpdjcQ==
X-Received: by 2002:a17:903:11c5:b0:23e:1b99:2a71 with SMTP id d9443c01a7336-23e24f59902mr290415145ad.39.1753113145178;
        Mon, 21 Jul 2025 08:52:25 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6d2a8dsm60084815ad.165.2025.07.21.08.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 08:52:24 -0700 (PDT)
Message-ID: <7649e4ff-c712-4db4-8777-f96bc4de97c4@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 09:52:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/10] New DRM accel driver for Rockchip's RKNN NPU
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Robert Foss <rfoss@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
 <b48c6694-2bd1-44d0-9dd1-1b7a67e22d87@oss.qualcomm.com>
 <4109088.mvXUDI8C0e@diego>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <4109088.mvXUDI8C0e@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687e623b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=DISFzqtZAAAA:8
 a=eRn_eXbfG_JMZ2bVrUwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=Vxmtnl_E_bksehYqCbjh:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-GUID: jcloHZG2OeG7BOt5sPRnVB3Qxm9vGFm2
X-Proofpoint-ORIG-GUID: jcloHZG2OeG7BOt5sPRnVB3Qxm9vGFm2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE0MSBTYWx0ZWRfX6j2yvCTK5aEP
 GBivZOdnBhxlFfrJ/pLCuhhImXEpTDPhZbo7oo0qUptUMWEImEiQ5MdAVyiZjXz0NXj5T1JS2//
 hW9VSN3cc/u1jybYLuwtFhRvaL2oOB9KDcLRHbefL1o8gAyB9jo4RBZ29JCmuIhGTF3+qXmGzmD
 yLlH5IFcYbYY30QmLfVh1PXuDNZXwwxPaKDhwrv/xkzcVlnbX/DHONG/Hz2JnAX1rQoJ0nde/Xl
 0znavZli+U8b+k3ZMDuPMNGSj8CBbXku7Iu27j0n0eeTtdPnb6CXt3TjY58sukn66CK7oTGQ1Ig
 XgXWmmY7ILP8O5UmfxBVjJGr7cPNzWwPnVKDlVyL/9fo7LBnIIqZEj52z1uQzZAirb501Q5bAYB
 Izer/S5jPaH4VYsEgS4g2GAotwNkDoqkaQN6+jEglnJPprsr09yj+ejHHIgbC+mnrYf5fb+C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_085228_403160_E5179150 
X-CRM114-Status: GOOD (  17.10  )
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

On 7/21/2025 9:24 AM, Heiko Stübner wrote:
> Hi Jeff,
> 
> Am Montag, 21. Juli 2025, 16:55:01 Mitteleuropäische Sommerzeit schrieb Jeff Hugo:
>> On 7/21/2025 3:17 AM, Tomeu Vizoso wrote:
>>> This series adds a new driver for the NPU that Rockchip includes in its
>>> newer SoCs, developed by them on the NVDLA base.
>>>
>>> In its current form, it supports the specific NPU in the RK3588 SoC.
>>>
>>> The userspace driver is part of Mesa and an initial draft can be found at:
>>>
>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
>>>
>>> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
>>
>> This (and the userspace component) appear ready for merge from what I
>> can tell. Tomeu is still working on his drm-misc access so I've offered
>> to merge on his behalf. Planning on waiting until Friday for any final
>> feedback to come in before doing so.
> 
> sounds great.
> 
> Just to make sure, you're planning to merge patches 1-6 (driver + binding)
> into drm-misc and I'll pick up the "arm64: dts: " patches 7-10 afterwards?

That works for me. I'll plan on merging 1-6 and leaving 7-10 for you.

-Jeff

