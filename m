Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7A8E7BD8A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnM6XrAsEbnpMV3CBb9OYkpwrCnXQYBrThDvOpySTPg=; b=uhrHmLlm4Dxce1JhV1ZRWhadKO
	/sZmZ+sZl7tUZ0sQU8Ti7dt7ErMEykJZH4FIp3u4YrtJ8Hqwg6bawcsFjaKiNJCfPvAq71nhf20Lc
	HupCuweTR5OtlL9tQOoeNjCxFwGKqMpWYoOXmcLuENY07iKxzA2jLWxE+pm00mc22xPMFcoCTF7w7
	kKsbIMutXiBk/YNPGbcD2FrDzn4jMVras4xZ0cgaf8jPjXRIk/V0p345F4cLnPQTRrHb52x/eu3MP
	EhLcjYFtqs3e8qJ2tKXd1CTGSZSIEF16mtFpHpDzkjGeQJMbrgn0eNVHAXPyN+mxaHv1pEHaXwqEE
	4jFtwOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwUq-00000006QPF-1qVS;
	Mon, 16 Feb 2026 11:10:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwUn-00000006QNg-3GB7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 11:10:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G71ldk987905
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 11:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DnM6XrAsEbnpMV3CBb9OYkpwrCnXQYBrThDvOpySTPg=; b=Hw4zS3Dx+FYDKKtV
	NKVVtXiLKIsinVKLGYjWOJ+HDxHubw/hZonHmGOEg2kK7q+O97mbXtNaZXLiWhZi
	+JiFI+ICgf8Ylq5uDtreELSukeTyPYqChtpEdwV6XpfNt2GP1S4u4zcPoCNouhp3
	L+WhwVW+dS5FTqeFmLamL1rF+///uTCN6PUmFg/d6hTkryJtGKceC70nHejjraGR
	nWNHTODd2yZuCagXgrNQJ3BaON7S/uO22kWU4lAFZmOqCb+Ky+TfQXADDaHQ5aO/
	DWEu/tpvsB1gR39uyIzXs6hKQOWkxkD6cqOChBpBskTaC0P8XMZjKi/3zxueYCTT
	u/9EXg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagcf4ca4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 11:10:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3ad1b81aso3074216985a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 03:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771240227; x=1771845027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnM6XrAsEbnpMV3CBb9OYkpwrCnXQYBrThDvOpySTPg=;
        b=NIkbO3ysR+9jR+qxbZVU7Hi/qbBMi+uHVZG4DUxNjhidEERAgXLbfBxLpFtLKOCopw
         u+9UguUQWWetmUizawvCvitsKB5XZzp+O6Xl616HGPCABwZ0KGTRLqxOFpV2Onif8kh+
         gOVt0nEb5cVS1KIpp8ucVYPqlWOm3oF6E6plfZY2EUb7O3qU2TAG3VbKC1gUaf+Akjv9
         UaFuzA2+UDCo36FY707QwoWsDNP2orNwwS2BzeqAwmKnxxZPL+w4hEcsOdrqxe8tSlio
         oHwVVANH3cHFlG2XH+kZa+VVDnj4hv7yYny9XAi3NQlunmvqr6214SZSOgaBrdWQkKYD
         oXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240227; x=1771845027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DnM6XrAsEbnpMV3CBb9OYkpwrCnXQYBrThDvOpySTPg=;
        b=JYwafhfYaCuNzuvwmiJ8KJZej9L68WcRqhsMH5ywPoAbqKFhpDHzkkitRT2qKA5bz9
         uHccCuhUcq0+6VpkBAed/W3/22Dz360SvpbeWDzo6Dm16ev2CtaJYXXt5XDlMizSXJ4F
         fzQBzzVG+kJggae13bq5U343H/nHzC3cH/57e/V7Z07COFNfMxOH86wuw+4MinPGhjpK
         qVD05jYMrelRyEVF7BdOhywJ2PoXi3WGowKemgf+CgQCg/4x3jQo31vGjkQMnzbTcnwt
         yDaRO6M2pjm2dc09613lwop7vogJ1yh8JFJFMCj+mCBMwgxW0NR938Ic32ArtunE6Iuz
         j7vA==
X-Forwarded-Encrypted: i=1; AJvYcCWrFcFlmsaJxKckcffaGBaRkeIfU4fmPl9YNxDbZRz7mN7zOrJh3ve6PEj0fF37sLtPB+q6swyE7KrnAuYEktFc@lists.infradead.org
X-Gm-Message-State: AOJu0YzoGaigdPSyFB4uaL+Wl02ywFt09Xga+vdhPDRzHsJvm391oubl
	Q+wajHWlTOmFeE0sPi/9EIy6IyoCVG4hX5QFMSo7k/Gm7tnveBzxBQpswsJix1P1zmzwGnEw+8y
	tsj3CcprlF8argCObNWeKmB71zd/boOv9DKoV+ICTiwOc+V8ufr/yqn98j9L1EuMjNiFh5kC53l
	Pw0g==
X-Gm-Gg: AZuq6aLXM6vMGrgP/MOgOY+0frz0BoK1+3VH32sRig0J03s0YBFGWqwMhklxKZmmHBS
	32HXATna8xODyzRzYi4hjfqfg6Aim+kALUFKopNDuT2sNcVhEk8BV2iDbKLMb8jjg+ct4PxSklU
	61q+mM1BJv2J6QF8+V/AFjDI1ar/ZW6bOsTijHQYsghOILyxD4FVN+rwRH2MZnEI0pSfu4bH1Yg
	12GopKvKTamsjSsKIdsx1oBahlgM3qJ8KqGHwIKDbHLzhYi/uGZPKHOAplVnXZmvSDa7mzJoNOe
	JYGcTLEhxLSKCwyitTmbmRf4XKUyvsH/QNvKyRQWwxSUHmaC+OfYEMYYCEGJRREf66IcEhDPeur
	ilQwMVOKZSXfiZrUTSX/k/l5Un7jc4GIVlsdXmLp/hV06l9egsCk=
X-Received: by 2002:a05:620a:6c86:b0:8c7:33:cc97 with SMTP id af79cd13be357-8cb4bf9740emr943812485a.13.1771240227206;
        Mon, 16 Feb 2026 03:10:27 -0800 (PST)
X-Received: by 2002:a05:620a:6c86:b0:8c7:33:cc97 with SMTP id af79cd13be357-8cb4bf9740emr943809085a.13.1771240226739;
        Mon, 16 Feb 2026 03:10:26 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dc34:5caa:d44e:375d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1bfsm27851016f8f.13.2026.02.16.03.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:10:26 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: nomadik: Add missing IS_ERR() check
Date: Mon, 16 Feb 2026 12:10:24 +0100
Message-ID: <177124022115.18156.4939160850575737621.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260214044531.43539-1-ethantidmore06@gmail.com>
References: <20260214044531.43539-1-ethantidmore06@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ga7DiFkEBFvm1C_xqKioPDX06S74Ko4Y
X-Proofpoint-ORIG-GUID: ga7DiFkEBFvm1C_xqKioPDX06S74Ko4Y
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=6992fb23 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iOnWDBcTrPUp0QyIlJAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NCBTYWx0ZWRfXyyMZeWXuJvxS
 Cwk0drAdBhLAVxJkadgF1yxMW5diBswUJURAuLYCnQGtd+AJpV8qErv3kSiZZvtr2HEzp8zNG6R
 noBUMbPM+rIrvq51VD64eEzuWWSoEVX4Qv7AgmtTQW4KEYzIgJGGOZ+OWMNiYLUt8lYwC/0FOvY
 4cVceL8u+6KDAkLOeiXn/WhkzY3gVb95OG0Q2YrCpWfOXxtnaQhpmPHBIcLBnzwKb9RQW0PG5jG
 G+S9ZunVq1iqWIBpLtqMoK2Pozabk7L1m9IhLfURnTDab5XZSpDr2e1+ZyEIozNVBwl7XT1fPWP
 O9/21P4KOJU263Tql44IfvatsRUjK43+GlTs15EiDTydEMurfMJWR8UDG9c9KXSf+wKuKmxLZix
 P75eiBoXK5P1PISy+PGwMLrQB++wvYMGcHI3rjxqxOoX14rr9AzEfCVYFLX3xjS2278UrqH1/4K
 QenyTEO+SKQudwPsVMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_031029_961070_9A942D18 
X-CRM114-Status: GOOD (  10.68  )
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


On Fri, 13 Feb 2026 22:45:31 -0600, Ethan Tidmore wrote:
> The function gpio_device_get_desc() can return an error pointer and is
> not checked for one. Add check for error pointer.
> 
> 

Applied, thanks!

[1/1] gpio: nomadik: Add missing IS_ERR() check
      https://git.kernel.org/brgl/c/58433885ee99e8c96757e82ccf6d50646c4dfe09

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

