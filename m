Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E03C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGEBVkSl804Lbjet5Iqv9xkjaomkmKa7knvOOohRepM=; b=lzi3jJMU0cqwS5xibrS3o89dwB
	ZGqq3Y3HRt5pqJ++6CSE4op6S4awFIlMMAtMzBSgKAyci+OuRY6O9Yq+VxE1LvM8A9cwafT5oAWGB
	hauksq4RrE+2RBerv8WMK+1vL+IqXSOtoPy4Dmnd+oO0WAOW3neDSz13tuHneO1ijIu5vf0Lpo57b
	xRWxaFKwHUR+wJE7+W2+5texvYMlAHFgS/E/jFigmtXSs9+6Y2XcYPUpeXRat2NwyKHXSk+RdsOfq
	Jql7AssUHMNU5zDlgdkSRnd3RaACcVgCJ7o3h2yrJIO6yiNoGb+V+xeqo41dX2/9QCLX6C9bJenkF
	pVzNIR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dPc-000000028B1-2J0G;
	Mon, 21 Sep 2026 12:46:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dPa-0000000289o-12Bw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:46:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4sp11130249
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGEBVkSl804Lbjet5Iqv9xkjaomkmKa7knvOOohRepM=; b=FDV/uRKtPIY5Te0O
	/bQLtP7WCvqplyZdNh/yoW+2tP/GxJRj2pu/B6Bsl0tycX9TtwpAkZ2N0+iOYQKl
	JoIpLSfJsY+e7FBiFpYhQMo6g3XgQhIwE1nJh3JJb9MfQWsyWEC67O1f35xHuyZX
	z9qj1VvujtNw6wroAqLSizpGFKgzMfc5UYFj9zFzgjqJMMEnIgx1EYa5V6PwjB2a
	eidrXvUd6D9+bsRQYXBngget4ljibpHdqFk+dqh8Azy7g4c/vHo0NXQIrO3go1Ax
	kN0Go5GB7uylS/SACc7SzmeISBCOdGJhbq82oCS0UvZ4gOSftSsIEswUdfChrIa7
	CyqGeQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csgbu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:46:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so10376a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:46:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789994781; cv=none;
        d=google.com; s=arc-20260327;
        b=SB5UBkCHQynuqIrFdBoLkqUOBOcAZN4qaV6duJHWoZkjc/B5teDv2u3gKC1RfKQA3p
         pbt4ZLGAgu1d78gHCR7Vf9jCIg7OuftEoBRsCKSQ7hRsaSy1sppBihHXF2tZMOZFpSX0
         ASTRKFwAzIsmIeNXrPjjUM0BHeRhapDW3B9MrkjqRRzGrBgLNRyTazCd/E2giSpGcch8
         G5iL/4gRmUisQZEHVOpNXeSR7Ng1r7v3JZACaBgzntSx9KJfmA56uqnSBQw33ai2OY0U
         rCVwI92ggbrb6R7PU0AkQuPL3OtSOy/mZXEN9ifTl0+v4wUg4vBnoRnFnHlprczt6YuO
         6wlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IGEBVkSl804Lbjet5Iqv9xkjaomkmKa7knvOOohRepM=;
        fh=OnVZcsS0L2H+IUGsjDtTahoU523/Oek0QFUGN5B+oKQ=;
        b=l/9FI4p4lA7YLvB0myHUXe/aCEQpJ1jIrhzD0lIdhz1Vddrc4QsKj0xniX93P8tDKV
         hnwWQ2xXSrlJF21JdhFw1DCFvGGYpG7HPhG6FB5nGSgT4KmP91XOxdY2HfBwbM0pZGuq
         /qXjz25fEjnVT1xbXXjp8OAt0iiPlEegJFWNF8fIhHxSRenPoIXCA8VTUnY+HGBwR+/H
         hl2x7PvGy7WXSOkGKvYWXJ42ZbgtRtQ5vQW1c31t1awkiOmh8zB77M4G8tLzlZcCZvse
         O0MiUrqkwm4vEL+ovhhxbhXvztmiCJ/2tZMcvCV1Lk3VNPFVMp6db5lvb2+22i6ijjND
         QvMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789994781; x=1790599581; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IGEBVkSl804Lbjet5Iqv9xkjaomkmKa7knvOOohRepM=;
        b=TUcxpohZ+SUUygd9mvEZDiRK3GC0fHMqXydlOUhlOSK8Owtahbr/dZXWbOVuUZsYuh
         rQc/P0wO6Jhm0jFPWewwxmU38ictuEZi91dRBPTAcQIGaVSBaNSYBlaQqq9i7lKBu40s
         8aNtvWv+dmzbOn3GV156d6ddmGuPbXObTePNEw5QXDphe+hl43m0hVJJmh1/NkA8CcYG
         xjI+oOCWy/H3XAiwdH7KxuJ2t8+8YicOwOjMdZYiD+Xg4DUEdxdBNHNEOGiiICKk3+mb
         8ZS1/svNZ/7GTdHreFmU9WoDd/odQ+aSWz+RSfEHZ9JeBxPk6IoW13sbwQJDnasrfpFk
         dfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994781; x=1790599581;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGEBVkSl804Lbjet5Iqv9xkjaomkmKa7knvOOohRepM=;
        b=xe5l6bdjxnXzFz6SZBsc643cNOR4twYMEigHclUScW4Cj2DXMLknwP7sookbTtSBIt
         TQnN00n1Ig8ISrwmthO1v1ZkUoCKQOnbbkOweBV9bUcTAh5kuQvK5q6hFB/Wvn4727Ad
         UmrUKvHEgslN4amfENqeuSRDq86ZrZ8kHU2UTHlpTGnF9VfE9zCgfzcsMWtXD+2+zLoM
         rz1MIb899XKUrLUmFGjO9X8QfWm/xO5t/Hjrn7vi2maC2oNUfOqIAWvfIGat09/sx9rk
         9YbxcSw4YfRuMp+4V4dFVQSEIJYAJtiw5kQGE3fQ6FbnDwtgtypI7TOyF17BynSzpYaV
         UYkw==
X-Forwarded-Encrypted: i=1; AKwUvBxvbad1ph5VETWj+68hntWHW0rxtUhbF9YF9fzvi48e4EtoTbj25++jrWkl1+L7Oy3skD/DEmcQF7tiKD4NFi3a@lists.infradead.org
X-Gm-Message-State: AFuF++lfA0HSzB3Js17vpqaaeqS3lpjTxN1GUFifq4u+sMyC0sD8/9Vt
	ly02Ti51TFwR4O+C/EvQe521gaoyJ/2Ssza88oNQjaoHZMMHozoUg+mJr/R870yhsopawo7Sot4
	seamki3K3c8YvcCws2LZKfxTi9Ytk1a12JW1NTAyFp5OliSOFOaUYQQyhirjUMVJdHs4kiygpT5
	AHsVg0JBpQelPRfmrgEIQb41iLr5L0xdE1iclePD95T3S8GSCcXpuz
X-Gm-Gg: AYBFou3DgFqOetmWRBsWObayUmt99WqZEV0Skmj1AaHgaycGPtz1vZU20Yiuxu+Boic
	EpOzcUCMT08lF8jTaVnPk6uSGw+LDiKBAKcW8BFRArS1TWhk0nq63Xp4dfd2Adfz8QXe6YGBXqf
	V8UhiI/5Ovnam8QoRvU6AvLvbTC3/3oBtMsgK7/RYcAjSYN4uD7lXNDD+tQQ==
X-Received: by 2002:a05:6a21:6f87:b0:3dd:a197:edea with SMTP id adf61e73a8af0-3dda197f85emr11235066637.57.1789994780992;
        Mon, 21 Sep 2026 05:46:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f87:b0:3dd:a197:edea with SMTP id
 adf61e73a8af0-3dda197f85emr11235017637.57.1789994780421; Mon, 21 Sep 2026
 05:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260915104328.45901-1-gahing@gahingwoo.com>
In-Reply-To: <20260915104328.45901-1-gahing@gahingwoo.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:46:07 +0200
X-Gm-Features: AcwNN1X9mUUfG00OJyVIt6nOyuDWy2ZSHbWKT6BOlwyDwHXMMZbGC4tmToAM-O4
Message-ID: <CAPx+jO8EixqfXmrD8zkMkJe_B+2AATo=YNFJraAdE_O9X4KM-w@mail.gmail.com>
Subject: Re: [PATCH v13 00/14] accel/rocket: RK3576 NPU (RKNN) enablement
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, ulfh@kernel.org,
        p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com,
        royalnet026@gmail.com, abel.vesa@oss.qualcomm.com,
        sebastian.reichel@collabora.com, sidong.yang@furiosa.ai,
        u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com,
        diederik@cknow-tech.com, alchark@flipper.net,
        dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NSBTYWx0ZWRfXxN6S27ijkgN/
 pAVjrNbcJSi+tbhRqYgrZBs9CSu3JGXUi6ZJyvRr9dheij8nqbfEejKJ3uZp/2kZgG0PR8yc1sa
 RuxQ0l6MiO1Z4IijpCMde4KmDoOhQmU=
X-Proofpoint-GUID: sVSgmhiPijXbROouBxjI5NqR45cXyb6O
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab1271d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=9GNsruGHAAAA:8 a=uuLM8HNXhctW1a4qv2gA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=gf-oSkQAjqHFJRp-GQfY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NSBTYWx0ZWRfX0XBMsb6MRwzA
 e5gGm1Bnm2tsJCD1HPbn1Tc0VXD7BNzgVgZLqomXWlWLMfEiztZ9hdoXOjbjXiYmi8fsVypGsep
 PRunXurWfklO6sIQsOLHtKIpUKA7w+UyMdYs9JgLb6vfeTmBt6ew1LAkugPx6Gc4bf1iCBnXAdU
 0/HHfVClUtOV0RmN3PfyYU041BxXKjkXZGXVH47cPzTgcgHxBRcO6kat7FAAmng8aWIiq2eD77j
 wL9J+NncrQby/6oTElCzChLyQjW4grLZcrVrsnbVP4KksAgW4a/SrVmIIfYdwvDhQZxfEBR7Ulz
 rj3+EMUGLESwZ5n1gOQKnkM/aSiaF3ty8BpHxNN2H2PxML00860GHEDvWLlU3lYhq6O9tvCLEmZ
 AZ4xxUcE9v7UOcexqYfafNyGUzIwe2uOH07icF8E/3HvkITfble3t7xfQBguuP8sPzbgKDFVUz1
 CSUHVK0rkF2s0ON7CYA==
X-Proofpoint-ORIG-GUID: sVSgmhiPijXbROouBxjI5NqR45cXyb6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_054622_294168_2A28D8C4 
X-CRM114-Status: GOOD (  19.70  )
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

On Tue, Sep 15, 2026 at 12:43=E2=80=AFPM Jiaxing Hu <gahing@gahingwoo.com> =
wrote:
>
> This adds the RK3576 NPU to accel/rocket, which today supports RK3588
> only. The RK3576 carries two cores of the same RKNN block, wired up
> differently. Two extra convolution buffer clocks, two power domains per
> core, one reset where the RK3588 has two, no NPU SRAM rail, and a
> PC_TASK_CON that packs the task number into sixteen bits, not twelve.
>

[...]

> Igor Paunovic (1):
>   accel/rocket: request the core clocks by name
>
> Jiaxing Hu (13):
>   accel/rocket: take the completion register writes under job_lock
>   accel/rocket: wait for a running IRQ handler before resetting a core
>   accel/rocket: let the core suspend after a reset
>   accel/rocket: factor the completion tail out of the IRQ handler
>   dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core
>   dt-bindings: power: rockchip: allow resets in a power domain node
>   dt-bindings: iommu: rockchip: describe the RK3576 NPU MMU
>   pmdomain: rockchip: add optional per-domain power-on settle delay
>   pmdomain: rockchip: cycle optional power-domain resets on power-on
>   accel/rocket: select the per-core clock and reset counts from match
>     data
>   accel/rocket: add RK3576 NPU (RKNN) support
>   arm64: dts: rockchip: add NPU (RKNN) nodes to rk3576
>   arm64: dts: rockchip: enable the NPU on rk3576-rock-4d
>
>  .../bindings/iommu/rockchip,iommu.yaml        |  28 ++++
>  .../npu/rockchip,rk3588-rknn-core.yaml        |  47 +++++-
>  .../power/rockchip,power-controller.yaml      |   8 +
>  .../boot/dts/rockchip/rk3576-rock-4d.dts      |  22 +++
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi      |  86 +++++++++-
>  drivers/accel/rocket/rocket_core.c            |  32 +++-
>  drivers/accel/rocket/rocket_core.h            |  11 +-
>  drivers/accel/rocket/rocket_device.c          |   7 +-
>  drivers/accel/rocket/rocket_drv.c             |  42 ++++-
>  drivers/accel/rocket/rocket_drv.h             |   2 +
>  drivers/accel/rocket/rocket_job.c             | 151 +++++++++++++++---
>  drivers/pmdomain/rockchip/pm-domains.c        |  83 +++++++---
>  12 files changed, 456 insertions(+), 63 deletions(-)
>
>
> base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
> --
> 2.43.0
>

I assume it's fine for me to pick up patch7, 9 and 10 from this series
and funnel them via my pmdomain tree. If not, please let me know!

Kind regards
Uffe

