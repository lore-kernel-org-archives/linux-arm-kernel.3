Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B76AC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 12:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fjf9Eo3K1S5f5JYH1uUJ/g1AeGfbugPlbVkWxhv/j4=; b=taf+JYazOYfp+3OiK7fFKNoD3o
	yMbT1IU34bclYPGT8PsMR37vwYEXkntdthjLvMpzJY53Bfo7K4HWjlFEeazkDYbdQLKR5AoFsKJhM
	103wOEnj1D95g4MkaDlmTMvnIrAJGcfiQvPv1DCW2UlmsjdjC02MDz/KHvOj1YcPN6P5BiU42naI/
	VS1npGKxQxr408ke+9QOqEB+l/uH8gGzBFD2hlfkNOXvRh4o5CONN7K+gLy8xKTw3ULXa99ji7GKt
	pKvNL+QC5GQLi5bJL6KUWAwyWkN6msHotYOXqQzwMHXfZhL6tzXdIsJWqS4X/32/btXgzVflWhxGT
	o9CTlafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TM7-000000024lH-3QLa;
	Fri, 04 Sep 2026 12:49:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TM5-000000024kx-3L3p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 12:49:18 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIDYD243557
	for <linux-arm-kernel@lists.infradead.org>; Fri, 4 Sep 2026 12:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+fjf9Eo3K1S5f5JYH1uUJ/g1
	AeGfbugPlbVkWxhv/j4=; b=NZGf1kz25U5vQm0g+IJstunRFvBBgR7BO+veqj7z
	OOKGIIkZT1WHFkumvsp+NqoUD5o292spTomk6KFO00l66BPoMKUAcXM2ux/NL2p0
	ClNRL/EF4ju3LH3PMYKTxdi6t8IQd5AObSIxK3bP8iN861cPQhuQaGuGLwt3hfhj
	0uP6S6v2CNdDm4pGtjggx4TB+yGjaLMAI70lcG0DHJvVC34d//QmmST2xZajFHeA
	0JCbelh4Ey82KnRhcVd0VRA+DBxUKdJBjbG1SnXzowbK7G4uGSlWzTcW27n++eFv
	Fb/N16jZG84r6wBLkrc2OVxU5W+WsZi2VvKb7cq9OPxmnQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfusx0gnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 12:49:16 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7847917c402so818148137.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 05:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788526155; x=1789130955; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fjf9Eo3K1S5f5JYH1uUJ/g1AeGfbugPlbVkWxhv/j4=;
        b=T9Wp1VevruRmGs9VXpHRxIR/aq6Hjv7ympDcpSNKvKdGouPR+7yRDOOZPXlLHKRJMe
         FZFQuwlbeZOHVlfP8NW+cHoFlEieQpozrS5Pl3aYAPAP6aHZpHXZuk3kQQAhSWO/CkMj
         O9pR50TzfCFVYS33iJuwhjbyWbDh/03xXC7uGl29d8e4ny/OSaU5gwA2ggWv9cPWlng5
         vxRXOH3Xv48U5b87dqFBLy2FIvbYS2Umf4W4pfDJ7O6Sg34Q6ciANXPdt99GgMqgpqXg
         +XZoz61iiPv/YiAQxj7tLs1Hd6Oj4+l09kOgHxKfnCDNpxJRaI5fjA/fFtGfphlvU+el
         iwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526155; x=1789130955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fjf9Eo3K1S5f5JYH1uUJ/g1AeGfbugPlbVkWxhv/j4=;
        b=AYA2dGCy6BbHIDQgc/IN/E8F5PTvAZUbwPJBP05YJTaynLZVryUsT5lvqqzqe65mYn
         7hwGTQG3Ss9jhW7sgo0IPhtIGIGLxqqL94A3DielOoc1wyaTtZ2HjGrylslQnLvZfdku
         JcJgmGoy7BiR1wLDoo/ZD6MWbaW8F0nPYYVtDiQF1qoPlJ/XN/UDbhsiD7bBGiTA2VG0
         IZSFzmoVhx7Sjnb9d61qmqY7hE5t3ZhBwe+Fmlh3las5ZPT6vWFH6Xr0qw6OU7qlS6Fm
         5erdwlD/BlI+gdwYdDDoA/3vMyK2OQXcwnhvGDOIxX3lnZ8OelV5F9BQKQ85UAFy+LNW
         o1Pg==
X-Forwarded-Encrypted: i=1; AKwUvBxDUeEZ4MI8h0VdZ6FddK41G/XPXNO1jo4pphR8pa+Aw0UNYPV6XiQyM+cIQMgFHhNHBP2MDeiiVN9hNWIw5RT7@lists.infradead.org
X-Gm-Message-State: AFuF++lF79lwn6TCTfvuxerdwQWDYCMhOGA45IhM9cFMzsZqLOfomxNs
	s26deXo+a37HEgkEQ/kgOiROJSHCvXMuCwHhUMUgRPnSWVESDL4AgGU4Qu5KVL1VZg28zfCcVal
	/ykjPFoE9WJmrVXky0Zo0xJv2c9n7BABJU9FXF5hBb/Gab05+FBz6GJrthpwYYItztmdljLvs6x
	EHFw==
X-Gm-Gg: AYBFou2x43CKrMWWLTFHuQ+HKmOkjU9iq3cP4c/dVkggvXNLzBy7kIPIuIqqDm75UQa
	tfga1EPHO4MAz3OlM4RU7omz8IHEyx3YzToHd8pI0scdKcix6BdJLUqgHGwkxDHM2p2IieyfFD0
	MQtKTksEz4I4YqAxgU7rVGLyfc0PGGUn1nFvjVOsdD3dPtFrwvvkjMCUsuItoJs/nOhkwBm8Rxl
	Dcs/aQzHchu0D1WBREoqLnDqblGsRWtYikWioz5FMr9j2Pyt4iyEzmfQwzU/fqJKRlRRdem1brX
	K9lt9v9mDPMyINzQsvSF2UXVZc2oLe3tZ6bN7VOPiq0bf3b4SNfK8bO3qgaQZFdFKhkVgvcNzYF
	PAcQZqLrtV1wG
X-Received: by 2002:a05:6102:2b9c:b0:785:1a50:3f56 with SMTP id ada2fe7eead31-78a4aa53ca4mr2019990137.12.1788526155166;
        Fri, 04 Sep 2026 05:49:15 -0700 (PDT)
X-Received: by 2002:a05:6102:2b9c:b0:785:1a50:3f56 with SMTP id ada2fe7eead31-78a4aa53ca4mr2019969137.12.1788526154671;
        Fri, 04 Sep 2026 05:49:14 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm135742595e9.0.2026.09.04.05.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:49:12 -0700 (PDT)
Date: Fri, 4 Sep 2026 15:49:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
        linux-amarula@amarulasolutions.com, Peng Fan <peng.fan@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v14 4/4] clk: imx: pll14xx: support spread spectrum clock
 generation
Message-ID: <f33mv4dqb3gcapmh4e4kg6zcgbtmb5zjyh27q6v7cnuq3ajvai@vn5pkiyhkicp>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
 <20260904101243.412006-5-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904101243.412006-5-dario.binacchi@amarulasolutions.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExNiBTYWx0ZWRfX9Z3RwW17PGGD
 qNujoGA7mmJj9tiB2Lw6QIvBm3t3mrP1+IxZ0w4FkG5BORSkGtl91yobZHAKesuMD+rTs3NEwbr
 2iODrUhTCeW61mnQnGa2oanU4bbOqR4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExNiBTYWx0ZWRfX7h47VMMbm62+
 9aIOPgiK7LsB7kfPFchyS+tKunbaTBV6La9nlVBSnu5bkx/hN80isR3qi7p5W1uTMA9PLEbiUQL
 HhBOyBcPeni45YwOqi8sRcWRPAo5RywPe240AGfQBUQfHZRXGHx3ENNddeL38VDia3JquMSE5WD
 4y4ZbGYzKajznKVCw/PZEy5UwMKaBTCYnXEtnQaYlxNX6HpV8lzktJN8+durQrkR7RHJYgrnJow
 cmsJY2pUV8nv1xRwlnO9grletBSuycpDA0wTE1okJ4Lx/H4Cd2lN2s0Z5f980U6V46xr4eVhY0l
 aEn9CioGHnDApuulHaqzj7hF7Vw3Fc0sKy74I+7XacVd8bAhCSQNudxNU/6eU8uTUZIkCeJuK+8
 /vdJni4uHpOkVHjdyy2HFbqITRHkIZesq0Zitu7raPmrz/yDVZe9J+INXaZQX1IATHw3y/YRvKU
 trzFkE85su4aQr5lDKw==
X-Authority-Analysis: v=2.4 cv=NenWEWD4 c=1 sm=1 tr=0 ts=6a9abe4c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=8AirrxEcAAAA:8 a=iP-xVBlJAAAA:8 a=EUspDBNiAAAA:8 a=HkkWczMphfeU9HmRj9wA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22 a=ST-jHhOKWsTCqRlWije3:22
 a=lHLH-nfn2y1bM_0xSXwp:22
X-Proofpoint-GUID: MF3teNxmCBA2tKroY67RaWGjjuospv58
X-Proofpoint-ORIG-GUID: MF3teNxmCBA2tKroY67RaWGjjuospv58
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_054917_847659_7489F937 
X-CRM114-Status: GOOD (  11.65  )
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

On 26-09-04 12:06:33, Dario Binacchi wrote:
> Add support for spread spectrum clock (SSC) generation to the pll14xx
> driver.
> 
> Tested on the video PLL of i.MX8MN and i.MX8MP based boards.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

