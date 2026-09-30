Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22AACA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 16:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3ippA8C7Iwe5nc7FGsk21TPZKf9tVMwe28Hxh6J4gs=; b=rHvwEdnqAoUA1NCwH3fvvHB06c
	HOMbydtiqe0BjzMKYoLMm963DbEiQvlLHAGrPlvUP/657+7kTAJI17KAbHxfA4ajDawC4Q9a4AD6N
	zXoJWho6fmS/AOfz0veYYVDk92/mUJseRskmbMy3y+cBJzhOm3g19Vgom9KbsieI5tUZ4qUFYsCGN
	deFVLQWrDbEaRAmll/Gpjk7THAWMhN/KzJcEYGEc/dnXd/dUpwCbRMi7kj3mXb1RXHqDCYoJB2Jz3
	YJurp7fa8+42/Fj2qam25XAq1i6kuakk70EBHFjLusNXg2LeyaVx5/EyllEXlE4fCqasoBir2LHSF
	+5kQNVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwnN-00000006cmW-3fxX;
	Wed, 30 Sep 2026 16:04:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwnK-00000006cll-2Xi4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 16:04:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE03t72405910
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 16:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q3ippA8C7Iwe5nc7FGsk21TPZKf9tVMwe28Hxh6J4gs=; b=L2APh1dRJOerB4OL
	P1t9c2Y59+gGCoUq2l/4h21nVCaB6uiOsOnQs84z5r2jb5dQA07xYsNnISKluWxn
	7CFAtbAIXKXYSUxMLmfNC7azfgIe7g+Loec7Qk+0fFKu8dqZjJPFQWS4R9Prs2Ar
	W7y8ul3qjh3icyQuf2mIhTzslSdyt9C2IrOvNeK3ShQP7oAccAQojUDmrSmFYkUh
	iIcKFZJjrBKHkqaSn1j2Co2qBk6xUUK6nn6tKiwhEqSZuNSBPS+dQu9DelDXLWj+
	cURjdM0r1AURAAS34VgIi5K6Tr5RQCw6vetpbGX+pRIbWhWMUUsmgJukfZCOm+sI
	Ze7mBw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c28q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 16:04:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so6670899a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 09:04:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790784273; cv=none;
        d=google.com; s=arc-20260327;
        b=J/REer2EkU+IwgkXOpQX4EYHaTTMKFx1txj0hMxsg36ARSZEM4aa7PkjthTCT42Lx1
         269/YTg8v4JHQ37W3FrrAJwfGogsecueP3cfhf1f3wOA6UeL/Gi8o1sJxhxVuzYZP38e
         SIY5xNIdHQwljn/6Ai/4aluJAbWXxcqfqDv61I/X3mWvm+ibYcAw/pWBo15ptxrbAKv7
         Ee5NWA1Ee4MhVNmcZ1j3nPjxS9koHcnrsG8fIwPocOxIL+BPamli1PLJ9JxcLyvpnLdi
         ZooTdc0B1wPP4pFk+KygIDykBanhCarWdCKvKTopmQhLmqqSj/Vo/8ONVsOyiFK9nyef
         gB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q3ippA8C7Iwe5nc7FGsk21TPZKf9tVMwe28Hxh6J4gs=;
        fh=laILVSk3welxPXk9q2+FeVcyrCmpyZCYaoZZ4SVjOF8=;
        b=UW9ldtGAS7pjpYNyGB7M/KhvyFJci7Cd8CN+Wq+xYYdaY/tO3eds6q033NT/ZSgIR7
         XV35kcBStvaIK3sOfxZgiY/6vg00yS+W4sfhPSP+XaX15fo6HrVuCJyCKAgf+d28zTnm
         df7SVQc6mCG0Y583ylsHREdKrz362NDIGrPbearg7/8fYPAe/cmMJqKPy7lUVx0UBnn3
         GkhWVlVoizhsSkoJiyZ6VixxSqAEQfe40iRfb2VOBPhoqeC/Q7wK5DQ5O4s0axhrt7x4
         1Po37gnlpUUUgN4KHo/Fw2oZxakHNs09M1FJHrXjDFNKavJ9daDJBS5g7ReBNZ2lt5H+
         JCJg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790784273; x=1791389073; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q3ippA8C7Iwe5nc7FGsk21TPZKf9tVMwe28Hxh6J4gs=;
        b=j5+HObV4SuBcnf1xRphceGY49AsrRlJtQtN3QDruDP/q5cPzZTV4mv6vYJ0WbHdJ9Y
         pLaE37U0i+15+302ufne+xP0o2RRzwU+xbqjNcbZJvj+6kbfE/yYZ0oUEDq8R4ToRyx9
         Lvt8cqj9cSJWV4HckN9TI6DdaKWr1LNyfcqdmD3jfJTKFmmR63+kWUwzAQYc9CgL6skK
         5lCZf8ddj+exjw6Pt6DGCfl6G5TMu0nQu3H5AXOgy4AwHyWj+DX4g6ZVtKaN2XuBDqyT
         ngyTKzLPBBQ2AFTOCK9IwO1OuRoJaIuhJO9L3PTtO7qAQ7Du+lmHwdPusnNxc8qexs0x
         D9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784273; x=1791389073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3ippA8C7Iwe5nc7FGsk21TPZKf9tVMwe28Hxh6J4gs=;
        b=qyRIh8HI3YNHR6aP/fIbEo2475N33vLHrdCe/yPX3ElxG0b9XO86+4BavldQSqGE1V
         XwJ+XoLG6Dtyih24bAbdzbx+00NsoGBeCvsac/RCVk9HAMkI6VPKY9qpZ1xsEgAW8zhT
         lYetCB8zlOehf/7r2gty30OazfrSedBzYIGg6pp07YbvsHi2sWijguV0saBSNU0om6BE
         avS4gy0ghu4vafwxXjFsbcj3PUlD3tbxHtw/x68IlN9VdCAaXOa1zv737PgUMJVZPBVT
         P8/wjXpSDxm7yL/TpgWdVRu0j/leQeS4W6lR9bM6/8RqXbUQR7vq0yHZhBahqr7HGfec
         hIPg==
X-Forwarded-Encrypted: i=1; AKwUvBzebr6BLxJsPz1GPgxuZRHL7VXrfMPvWYx5pl60vOkYymToHAOiMvoYRlmnoyUjCA2EXEPjuu+jlRaLHiHEOu/i@lists.infradead.org
X-Gm-Message-State: AFuF++mJRv1avI4sWlm4j1L9rLRbOUGJnhWYg16Y8vwz3lw56NfGg/Mj
	JK8oRIDNb/pSbsQPD9S65eDX8EKiByBrzK47LztLnfEK0bRFZMTgAXTzvxGggh0sFeNw0JALOZV
	saacz5VBPa8Rg9tAsZjHTqLt8rt79TDYdw+vdNJahvX4L1xIabORisHZlTflXVKzWtDgNIv/qsn
	Poq+JzpKsUGz4g3yHJ6i5GY8rWX1tcOuzp9sNVNOJ/bXnGjEwchAW0
X-Gm-Gg: AYBFou03hPxzWbokPsSFZFJCPSxXzP8fptKqSX7jWZY3YUjukIM38lO0sSYH4LUMhnG
	tmV9PJlslKUTC9cBiC6zEYQ68otK8YeJqnxaIggtE9Ohg5Yb3f+heF7vasgvitIe/0FaIzwIUyF
	Y8AoaaCcJxewpoAYdoTxP2OZhwfte2JkAMG749ql4E7vkXLZC2F6PhNjDZPw==
X-Received: by 2002:a05:6a21:4cca:b0:3dd:a197:edea with SMTP id adf61e73a8af0-3de9e8b7c77mr1829503637.57.1790784272613;
        Wed, 30 Sep 2026 09:04:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cca:b0:3dd:a197:edea with SMTP id
 adf61e73a8af0-3de9e8b7c77mr1829465637.57.1790784272140; Wed, 30 Sep 2026
 09:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260927151016.186493-1-pmazzini@gmail.com> <20260927151016.186493-9-pmazzini@gmail.com>
In-Reply-To: <20260927151016.186493-9-pmazzini@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 18:04:19 +0200
X-Gm-Features: AclHuK9W8iKpxeLaY0dvpEbGt-kGPjsZMSlSCjzDyfjFsqRteSj3h5zChvT9XB4
Message-ID: <CAPx+jO9aML0ABRF=j36s1HfPu405L18X6VyzppyQv_N10JPf1A@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] dt-bindings: mmc: sun4i-a10-mmc: add Allwinner B288
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulfh@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX3tF8OMUMUaQk
 UlSmYusY47IiOqTAuVLjqHJYjWtKttpXqaOljbGI6WrKZf8XhlCcpDQL6881tYL62/dO5IW+jJw
 FoIrqyCMgUzLUSp12Cj4mutU8Xko64w=
X-Proofpoint-ORIG-GUID: UhvSIT9Usv-AcbFLgy--RJ24PLMtEkNF
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd3311 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=kqsBenvbzo-VylAG1WUA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: UhvSIT9Usv-AcbFLgy--RJ24PLMtEkNF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX9nUuA5M3Rg6H
 s+jCdIxE+0V3fF4aqzcnxcXTrMZR1TVD9YKdtLjZitJ2TeYDQIc5hSMI7Mqjm/EJBCFTMU82wMV
 HijBz+sbOjzYxF1vx2/tZ/BSV6SWjcXRn/0T1Jpejk4HaJOgyIt6bdAaXB+zkirdilL/JRU2wpp
 oN4ohDeZhEzNkSNRaNaBIw8hXgcjTjF+x4foupZC4hkzn4pgWGFQjYjtK90QhWaaWtUNEmxn4il
 +HZ4PxjkqtZ4AytwHnmwk5ts+VarMJ1HpYko2GPhzPyRiIcDHDxGv0lOKsZ1/Kb/4FSwkPL70jp
 t62QVsV4XblFqImPuHAcgVfUO/bbtbm+ZlihJBiQE+sQr2iapmv+OnrFFD31ehHUUq0AWuiuuOs
 9o19COpcAENY/s/QRdqZV/OiMxrUHZo8fddYFQd47YyM06rGDmC1FCPtP98+E4RA84XGmZ1K3Ua
 6j9XHReznEomKBguTEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_090434_649044_19000D20 
X-CRM114-Status: GOOD (  17.44  )
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

On Sun, Sep 27, 2026 at 5:12=E2=80=AFPM Pablo Mazzini <pmazzini@gmail.com> =
wrote:
>
> Add the MMC and eMMC compatibles.
>
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mm=
c.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> index 9e9610bb1eda..c2ec7151dccf 100644
> --- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> @@ -32,10 +32,12 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun8i-a83t-mmc
> +              - allwinner,sun8i-b288-mmc
>                - allwinner,suniv-f1c100s-mmc
>            - const: allwinner,sun7i-a20-mmc
>        - items:
>            - enum:
> +              - allwinner,sun8i-b288-emmc
>                - allwinner,sun8i-r40-emmc
>                - allwinner,sun50i-h5-emmc
>                - allwinner,sun50i-h6-emmc
> --
> 2.53.0
>

