Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B19CA9EDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 14:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dro0ntwjq6UiQiLjHqLYsBYU8INoQdG/NC3mtnkTWFM=; b=TnvSxU1ZxcVDNjF5Tkx/AeQX0F
	PRrRBEcXh3BYhYnTG8OHp47uxsrA3MYGbghZnmrj6IttKxpO2uUUDxf1CHWcO0/fAHGNUceXQjNW7
	/dBXOmGb0Vlr7isJJS7e3KnYwyTAcTcaWYP6ttGUAuWzEvWW1rnlI+JXM5dIrt47W3O77wVxaku1c
	3so/K5qgN7hJP3+lvkwjes+X3yCghjuzT/ltkArEXYHVJiPzGL8Ub4JjskH4chykscnPBwpRLmjY8
	YaYm/p2GfLJrK7f0I8p7DnBm0iZKU2PnUKlWJNDcYE+EkwOQeuU2oga6RLst0qOLUfCkW+f95nOrr
	fRtMzD+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGGah-0000000Ad4y-2qIt;
	Mon, 12 Oct 2026 14:01:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGGaf-0000000Ad4T-1FUC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 14:01:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0RFC2088629
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 14:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dro0ntwjq6UiQiLjHqLYsBYU8INoQdG/NC3mtnkTWFM=; b=FJc9wUbblKL6lkTo
	2aUKPxWhlauZR6Iz0thHESuvtQAiqgyV2cIqZDWwoXxzlfbVt7vH/3I90QXq2kAz
	fjkE/7gjaGiMOldclHWCw5/e/iH3yDpK8oRglBAKsWEa0VQgAFwNWeVHEuuY8Ehl
	8udZF3fpsSO6NgJqoQ9ZuvMFMGzjYPUojAfo345g23FLwQafAY7BYdDmARFpd+BC
	np5mInQLQz5yU99OhV6Jj7t4/pLf3OtHno6Xty511sA7BPKN5uZt0WAN2auyhlOe
	BmcyhU9bQ9LGpm5SlzhEFMR5z43f9L6Uapan9pt6xHKdxx8pFoSlXtaOIsK0jCFQ
	nz4hpA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu27m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 14:01:19 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e944179148so1501769e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 07:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791813678; x=1792418478; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dro0ntwjq6UiQiLjHqLYsBYU8INoQdG/NC3mtnkTWFM=;
        b=gM2LgluaBeoPQbKCW8TGwG4P4sDuY/vco2oQn8g1LolwFSPXxxFfvYp1osKUL5M2EQ
         8/HdMiwhSuiZjnTn7y+bGU+CtuMUARtrJG05VbEASAxPyXEo+msxxOhdTV7pSGfLYb+2
         vTVGogRGftlqccSv5Knl2CvFrwrfOUq3ZIgaST4hZlLoS1/BxIaaUO0SAbvnusLTE/LF
         Vtx47VoooqSieXjJHxS/KhYQWrfrN4VyaVq6Cp9JG7gw08QNkEY8CW+MR0eskYDa8g41
         emKJRWQOd9w2qX0njpOK9RNesXZhqT29Za4veF1ZtUmkiEqGsm8xA2z3lwHVa0/bVYvl
         MQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813678; x=1792418478;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dro0ntwjq6UiQiLjHqLYsBYU8INoQdG/NC3mtnkTWFM=;
        b=cNYlFXrej1BSyYhe3nEmfkGSY+hlijmrWt8xjZH7neneAuCblkOwDDTG0+PwOo1DMK
         6vC5OEpMGhm/6E2TxuyWZUUJuesqpw5IESoR5krFmDZuWoOUdzoqL4pyDF82EU+PJjSU
         0hfuIUgK3BMSMwXkGICMn9VdqYWdvbOOuATAy5O9FYVm3QaYvUvjrb5KiA3gqC96AjDl
         0/ILaQVRTJpHxPAf0ImAi8sY8P5kvBdESk0As/NoQzyz8u4Cz++ZHv168hghDQEZN9BE
         oBuD2xVrEWo12evbH33iH1DqNZso9L1y9NzEUJHsbSZfx2/21kTsqlyvsXUFqD2KfG5I
         cicw==
X-Forwarded-Encrypted: i=1; AKwUvBwU8LhCgrR48EGC81dL+Q0nhTXXpLidwLeCBe+OxKVsQbNQUJZzrb+jOJqzU/jVx49z8vpqBmDQp5pokIeJ0Rs9@lists.infradead.org
X-Gm-Message-State: AFq9FYKYqmJBWNCKa/QoIAzWlmOUKMAJstfYX+hkdYxaqHxcyFJ1GvKi
	axzMlHDWpfmk3II+LKH44JkDKpy0DdnL0IwzI1yoCcgXcEMMd5+6jZeCmQCXhYtW68QCDwpyVke
	JgsMrMJgU8kIvdetlBWB/c3yNkv4pe2m9bGIoYZgmzs1SYfHzdRA/+q0gJxuAEtm/GWVEhHJ0wc
	HlIw==
X-Gm-Gg: AYBFou2zOkuon8XcMaHlDgiV8fIWm0iI+48siv5pyZTA7yXF2cbJ8YeZ/itYMCUS9gU
	nu+o3vIJY9B8RjCEaXdnlsqrvlNNQVbt/J+SKF039btwiMrLwzyb3k55zrBAWCVKn68FaSmyyuk
	qS9LPIAeEDhQh4O6Et2vnzdbgseSKROS9WJHF+lMB1XN0nhdZAihSrnw8lDpKJgO4/6BTUFI8iW
	PeLWzjN6XNgcvRUuUkQHO1pOypbxcxNQcXHyMmi+1UNk9Qv1t4wEFW2YcDGsD5Uh57Nrq26NxjY
	TqcvF1Bfc5vChdacJKBTOTbdI3EzX77HdSPqsPR6qGxrtCz7a2ZgXstM490eH5kuyXRHpbF0pg3
	y/mTDqjasXqPghvK2/HSCUfcvwoc=
X-Received: by 2002:a05:6122:e14b:b0:5cd:575f:9396 with SMTP id 71dfb90a1353d-5e91f483a33mr3001245e0c.12.1791813678500;
        Mon, 12 Oct 2026 07:01:18 -0700 (PDT)
X-Received: by 2002:a05:6122:e14b:b0:5cd:575f:9396 with SMTP id 71dfb90a1353d-5e91f483a33mr3001028e0c.12.1791813675799;
        Mon, 12 Oct 2026 07:01:15 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd3aasm19101061f8f.32.2026.10.12.07.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:01:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Igor Velkov <iav@iav.lv>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rosen Penev <rosenp@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] Add the PCA9655E GPIO expander to Kobol Helios64
Date: Mon, 12 Oct 2026 16:01:12 +0200
Message-ID: <179181364592.7692.13657409498098359032.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
References: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acce82f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zK-fWJzOMMApgNEAF1kA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX2vshKwhXtbCE
 DIPVhijRlx1xrCJ/7BZLJOx8ksB2s/GMZGmPhXganBZseZT//6541QodqEuZwuRa5rR6naMOM3u
 b/7XWF0rZRny8kvWv75pacHcHCVo4DlkyGoP2/e6/v/hf9Df7vnHUCQu6HuOFs3AbEjYQMOSHcu
 rajKuHkt44mCPEp4e9dL9GF91qlGxx2lr5Y9bLwxS5vr3b/wHWSeKLSDCjl+H3BjVowQA3aDlvT
 y7euMHMGeeWqnT8iRjH/9Ylif91NhXgkqEVha+MxDXcfEcsPbQ1s3SygfF9402Q+xbWFbIb83Xr
 7IVTIVmV1DVCVyM2FMTpB51BNJoQzUULXXOB/wEPGXe9riIp+SO3LYpR5G2NxRNUYTA222w7nZS
 zuxAzg7Qo668599rOlGf53vVOXpnIlaJY/axGvHvwDURTIHpZW5a9KmeLdo+wcuIeWboAfXrpUz
 iy0pI9xUUlPxICCrfmw==
X-Proofpoint-ORIG-GUID: PKM6vEedaOQNX9E5pKXH9zMLyp8iyg8j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX4fhvQHKcG8IA
 ILCVxUyOJEcpBoPXC1fRQJGAq0FuZwkC5d2Iz8N7FbX1hUpKUpkCl3oW4aMGMO/0UHpBjCqbA7S
 6g3LH6xMMvztWDgagSUgwG8OobzqwyM=
X-Proofpoint-GUID: PKM6vEedaOQNX9E5pKXH9zMLyp8iyg8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_070121_456120_AAE1E1E9 
X-CRM114-Status: GOOD (  14.99  )
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


On Fri, 09 Oct 2026 20:45:35 +0000, Igor Velkov wrote:
> On Rosen's binding v2 Krzysztof quoted the "onnn,pca9655",
> "nxp,pca9555" form [1]. This series documents that form and adds its
> first user, the expander on Kobol Helios64. Patch 1 is for the GPIO
> tree, patch 2 for the Rockchip tree; they only meet in dtbs_check.
> 
> 6dfda7947653 ("ARM: dts: marvell: armada-388: use onnn,pca9655
> compatible") in linux-next lists "onnn,pca9655" alone on Clearfog and
> Helios4; with this binding they would need the fallback as well.
> 
> [...]

I dropped the last sentence from the commit message and the Assisted-by tag
that's going away.

[1/2] dt-bindings: gpio: pca95xx: add onnn,pca9655 with nxp,pca9555 fallback
      https://git.kernel.org/brgl/c/356cab616b6f07a06c2d279fda8a9ec928fd5fff

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

