Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6145C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 19:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGIelMzb7anlOtz8UeqEqZt+4i8vYbVYnWcSqbgsCCE=; b=AArd4jKDjzuGISfwQ31BkiYr7n
	bUzsTO/9OTfgec9d8lHAUGxe2UMtiO6pHq+Ny/owtuOckETyjhdQi9zfxcreZkCoQLbKFR91MWqnq
	3bHAAtg9Fvu9GS5UkyHdvajtTkwFdtqKVH3S1NScgf6hra4HFnlF0M1H/H9k5VYehDWWzCf55ZhtB
	A9j9yeEV5jxKfZAxe78pIOCeaHs++3X3Rg/UXTgI76rjS2wyKO6AYMvaSQvam6aTSo9HDeNvx0kKr
	ismATF6tDHyq+KuGkxAifoWrcb5S/SqSJYqzb0UyaPVYgfqu6aOpx/fz/bUHElieZh3SaIRrqyung
	5ynX1eWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMQH-0000000DzSe-3Enq;
	Wed, 28 May 2025 19:26:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMNH-0000000Dz9j-2T1u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 19:23:40 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SHmghn001002
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 19:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tGIelMzb7anlOtz8UeqEqZt+
	4i8vYbVYnWcSqbgsCCE=; b=lhTYe1pvmICNCmLlgitNFi8n7jkEBn42BKSOuozy
	gH5q8YtAam5lLMoB0oEU/11m93Iptsqgb59u7tPaTCkLI7YllyONTGKVsOkzZhkQ
	dM6Ort9SaBW6z6lxQFCTxpFlKOsRe+swVpMccrmKVQN/YGJuZF0Yi5YLFbmPVud8
	/MEJ4S+ATaR8SZb11UXlyAfHGjjO5gX6ym06MU2YCs8j3DSXVVkgwFMGhsLpZCvc
	pWEHhYU691ynpJkDlOwmP9lF4XrDDwvMQwLVk8cj07ycyp/CRvsjzQpZ9XqumCL9
	TrhK3XMbNaJzzXu8jw1ljUbSNO73KRJdwCUEesepO1jnww==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek379j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 19:23:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fab1b8d379so2750006d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 12:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748460217; x=1749065017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGIelMzb7anlOtz8UeqEqZt+4i8vYbVYnWcSqbgsCCE=;
        b=GAwH+Fm3PJEhzF8888UM6W2BJOZzTavWALSFHa5uvoFAddujZtFbI9JqRcOTCSIQhp
         Z56P2VgFKJl5EGfF6AiLaM8A452brLuTlW5XIZnYLlt/6ARUfl9iqLcBfm1pq+u3Bdy8
         2e/9bV7thgaTYhNvbehgZI89YfgZs1xu9GN89PGsblAiW9kDc1Jss34Q8cFFvgpvEHFr
         Hz1EcJ3IVYP3Zk9M7VDkOBVS7mjt7R4BvnLD7vnVcM0Y6AeBJA2XXTclc4cgQTgQPbq6
         DRfkzYjv0JpsxZdm6mzmxMiO9BTjxNdNgBMxdP2zRhxCJdqmmBYV3NQ8St3sHyAUHy3b
         CfdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlmlt3+FamW4vcm1TQRoM3tCL48xK5TGv9tEmwS+dlJu5icsG6h9+SLY0Plpux799Th7WkxrWZSZ0h4bIWN8zf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz01fc93e3caJ2tVhF5/imfXgXPFu2NAkwYhI2f7nDUFHOy9o62
	ltnMkuRiqQGYEJJFSDfYJtCQi75slrAwnkhO7cX6O8oj/Q+ZPlzenbD9JLJ8+fhy1ZmMJK93k/z
	+SJjw88poXvESP/NI0cOy0J0CrAxeKkdiTN5Tq1mzJLwOtfWmYgUT7Fd93UNSOQZCjiuZ1OfJVe
	picw==
X-Gm-Gg: ASbGncs//RnMGvUM0lmrO/C08uIBGytw79ZOmGQ8ofj5y+AyyivDcdhS6MexO2Q3U0h
	mv8GzLiC/3arQbyE02BNxOC/zHar+xl1CMmJnXYEM+SaKtWQnjhZnKvhzzRf4tYsgW9G/FZjP0f
	1HHqmNbmA2m1SFhvFYf8DZWXusvKcmFSrxKe+rLc7UIaOluNvE6yJqnZV1+WTJu8/aT5F82VeTe
	ijl8LRD8y/hinZkKfqOrlfsFni7PKrkTQdYdr319ILiAXNtyhTMGIk7NMRYQp3JP7uMXHNuGKxW
	LXfdhhQbGDd6rFCelNkQCvmFje+oM0NNVysZF6JE8kQBaFlCaN6wctxtRPp5PBFYFDSAxX/R6rs
	=
X-Received: by 2002:a05:6214:234e:b0:6f8:b4aa:2a4f with SMTP id 6a1803df08f44-6fa9d00777amr236028176d6.11.1748460217333;
        Wed, 28 May 2025 12:23:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMPfAIcdcaS91SNuuMoIA5lDePhcYw7vO3zvie75YA1Cd8oqTW+ZaMVMUi8YvVPpHABq/2ng==
X-Received: by 2002:a05:6214:234e:b0:6f8:b4aa:2a4f with SMTP id 6a1803df08f44-6fa9d00777amr236027826d6.11.1748460216971;
        Wed, 28 May 2025 12:23:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79eb95e5sm3635891fa.30.2025.05.28.12.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:23:35 -0700 (PDT)
Date: Wed, 28 May 2025 22:23:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: Johannes Berg <johannes@sipsolutions.net>, perex <perex@perex.cz>,
        tiwai <tiwai@suse.com>,
        "kuninori.morimoto.gx" <kuninori.morimoto.gx@renesas.com>,
        lgirdwood <lgirdwood@gmail.com>, broonie <broonie@kernel.org>,
        jbrunet <jbrunet@baylibre.com>,
        "neil.armstrong" <neil.armstrong@linaro.org>,
        khilman <khilman@baylibre.com>,
        "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
        "shengjiu.wang" <shengjiu.wang@gmail.com>,
        "Xiubo.Lee" <Xiubo.Lee@gmail.com>, festevam <festevam@gmail.com>,
        nicoleotsuka <nicoleotsuka@gmail.com>, shawnguo <shawnguo@kernel.org>,
        "s.hauer" <s.hauer@pengutronix.de>,
        "srinivas.kandagatla" <srinivas.kandagatla@linaro.org>,
        linux-sound <linux-sound@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        imx <imx@lists.linux.dev>, kernel <kernel@pengutronix.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <mpj5pvugs6gz3rhjtntshvbwbtmi463zg6jc4tatmvh5uuljhe@44kbv4di2b3s>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
 <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
 <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
 <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
 <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=683762ba cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=3idkMoHJoOCuPmDIWoEA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: YuHFVyMQpW_vsAlNCbZZUTR1NxoT4KVC
X-Proofpoint-GUID: YuHFVyMQpW_vsAlNCbZZUTR1NxoT4KVC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE2OSBTYWx0ZWRfX+XLvboH/uNu8
 Ktva+55zjoGuYq28lE4DABq8/Yko7rZiEgJFLY7o6y54Ov+RpDnRvw1DUPr0iGpNkNIGj+b16HV
 CsmaEs08zVhuP9Xre3wHjJf4TKuOoeh+CZUJ8IbHmm+DHNg9WmhwxZIEErtQBWVGG6cdj95aaJM
 zMj3LKnR9ZMp98b1OZsvpnRkvdScy4bwgvE3r0+EToWmNzrjLSdG//EEvtAqG9n8xJVUYfAXHR5
 zK5X4vyyFGwIY2GJhqIVhMWz9pHVv4IZy0Zk7h5AaC510oqRJMybpcbeayK87RCsQ0QUnyJwE4+
 VL/YwT7SYOa2syfhLuYmzWyGt9saVrwVT08fd5j9djaBDUcLVIPi5HaHBiPiu+M0PDrz5vAScZp
 keBI9dM41vpTv6JYSoOSroEhu9/AilwLsgvC/Zipbl+KIrKyMrPG5y1sPMkGQaNTWEzEDcvx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=486 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_122339_749393_B5ADB02E 
X-CRM114-Status: GOOD (  22.07  )
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

On Mon, May 26, 2025 at 04:20:37PM +0800, Ai Chao wrote:
> 
> Hi Johannes:
> > > Hi Johannes:
> > > 
> > > > > "simplifies the code" is no need to callof_node_put() .
> > > > Fair. Except that's not what you _actually_ changed here. Like I said,
> > > > either it's buggy before or after.
> > > > 
> > > In the function i2sbus_probe, it not return a struct device_node, so , I
> > > think function for_each_child_of_node_scoped is better than
> > > for_each_child_of_node.
> > You still haven't explained why it's even correct.
> > 
> > johannes
> 
> The for_each_child_of_node() function is used to iterate over all child
> nodes of a device tree node.
> During each iteration, it retrieves a pointer to the child node via
> of_get_next_child() and automatically increments the node's reference count
> (of_node_get()).

This is not complete story, you missed the second part of it.

> Each call to of_get_next_child() increases the reference count (refcount) of
> the returned child node, ensuring that the node is not freed while in use.
> for_each_child_of_node() increments the child node's reference count in each
> iteration but does not decrement it automatically.
> If of_node_put() is not called manually, the reference count will never
> reach zero, resulting in a memory leak of the node.
> 
> Best regards,
> Ai Chao

-- 
With best wishes
Dmitry

