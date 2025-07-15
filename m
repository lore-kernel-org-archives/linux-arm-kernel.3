Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5760C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 12:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whgpErroktFXqC6PFq2WcPTxY5NFQM6yRWXrcNe/B5E=; b=3peqLpQlBKQILkfBqlj8mk63Yt
	OQ2ywf+Ei7DesxSBbAqGrjqsbYMoUoBxc+AHYF/PYrtZLLKKvbXkbE+FFwc+iuoRB0ZEFV7hgnXlV
	+/NfhfNG5OwPEfYrjgHV0VW6A0YqZipT6Lug57/XqHtsilA8CAb7Qa8flBfzQ2JymR3BWd1speGmh
	7EDKIJjC7WvpxuZZr0B1IneJaQ1ue7fxXZ3BqinaaN5xOGH0yT165+oF0Hgj7/SlplEm2zBg5moxS
	M9velNgy66MHrJUv7SH++QTILUU/4PA61LInwkh8s7QppJUg0F8K/dfK32/iLzLj40PMqT6pMiJGg
	yInkd37w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubf97-000000057rO-2WiI;
	Tue, 15 Jul 2025 12:52:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubeQ4-000000051lI-33Hg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 12:06:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F5xHCv028752
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 12:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=whgpErroktFXqC6PFq2WcPTx
	Y5NFQM6yRWXrcNe/B5E=; b=oQoi5OSEalOMhOlaVsCQwivDCxIQJkwdw2Gjk36d
	KOoK/PSWH19kWIRgR6wfPCM2d0JymbeYro1VX9x92LvyDpRE3DF1SmtAmAceD+Oi
	zu2OG52GP8B7uh7a7ZCc/ZSEfQPSO18KyCErrQsMv1y/LlXTzYrBp3oFbKt9bclj
	3sdLK0ezqdYtrn1iKYc5rjpr4JzHTvfWeO/5QLqKEJdOKScjpyheIyNgkzOf6sON
	Uuoc4w8OYOGRkDBTcmmTFjb9LXp2TPxZY0wPwtkN4U5VuS2dKdgBjYbhTOuBUaHc
	mn+ycF5PDfrV9hDh5sdBx6QVpeOzJdMVKLJvsMIMSlJVyw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drjy3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 12:06:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e2c8137662so359582185a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 05:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752581159; x=1753185959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whgpErroktFXqC6PFq2WcPTxY5NFQM6yRWXrcNe/B5E=;
        b=bT9SpQkiAi89+ELRA+JPOxLhfCvhmYHnaRY8nbBh/cRD5tq0afK+WYFMjamJjqP44n
         GAXXNBs5UAMBh0tlqV9VBVZIFX3b8DxBLNouOBVKW6g6w5Xro6U81NMTguDHNMthTC46
         XxKt8EpkSldQHp1322QiJIhqFlbzulqwJ0+LuYP3qe57IfL73aGrI+QeXlIeh2/YFPl+
         Xp5AiqxLZRPObso1FM4pObN8QiGQ1fTkSDgT3kbu5+ibYd3HK6M1jlvlIQZoOB9+EU9G
         aoLqqx+zOfkaaWF0temPTfTnlklRqI05VpX7Igc/8Y1JxVSeKr3Wz/tQLV+He74HleC4
         k09A==
X-Forwarded-Encrypted: i=1; AJvYcCUshdl+anNLiexKXZJNtF00fJG9CnfAs6nTcZzrfDLuy+uH6nhVMcUfdfG2a9XXifiy4PEEu91/wCd9UYQlkCd7@lists.infradead.org
X-Gm-Message-State: AOJu0YxvcwBEX8Cbl1dGXZNcxDP/8GjazvKpDH8RGVWIPKNbkEwG6Zoi
	uMkTcdUvCRgtrqwpqFw8+GrE3eYE6Y3dZanHBtOJaXZq0X3GPeOlNmsMFTKa2WH+QcY4uew2erq
	tLs04JFuL6CW3PUZlQIsCzbg9Qmk7K3HGoG0ueNKnSQMRevJJMCuXek16eeyXORU3lCrqsciUEJ
	xwqQ==
X-Gm-Gg: ASbGnctj00KPQ6qgJp4jfHgIvFek90TBdAI8qkYqF0gjuV5/gY998oezhyHPkGMPZe3
	b7w5cAbkBa1B0FdYMiYllmzAEXmOMSvhhzDawV+8XIxdjfhqt5MS7Md4b5E7yRNAa36Jg7WcJYM
	8t4rYJ06y4jw3WPWNukGuJjVnqHC9Hd77o3SZ/VsGWnfLHmMKANlDwDpsb9LrrBlkoJwdMTj4mE
	GaI3alesTrVALNqGABzvv/EF6OchnyiMQr+R3M7wY0/k4UYXf9TgyUu4akRTK0SgVI+yxRTeXMG
	0tWuhBNVK42ELxaUUmMA16LEOWd8leRR3MFk4sKFBiIP3LTimM1DUZYzn3D7QNkam+Gl1BFHJIG
	74E+HXyVguDIkzgNKjOTp1fGpeWaK6iOpOqDGCNS3/6SEnw793yUX
X-Received: by 2002:a05:620a:2617:b0:7db:52b9:2060 with SMTP id af79cd13be357-7de06bbb9acmr3084722885a.36.1752581158909;
        Tue, 15 Jul 2025 05:05:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIm9VPHvsWFqJ0lg2fwfKKO9Xor4P4bNsy7V94yiewt2Z36zolTE2cwObNp3IrftJTJDg+rw==
X-Received: by 2002:a05:620a:2617:b0:7db:52b9:2060 with SMTP id af79cd13be357-7de06bbb9acmr3084715885a.36.1752581158361;
        Tue, 15 Jul 2025 05:05:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab8e4b7asm18929411fa.75.2025.07.15.05.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 05:05:57 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:05:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Yubing Zhang <yubing.zhang@rock-chips.com>,
        Frank Wang <frank.wang@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Amit Sunil Dhamne <amitsd@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/5] phy: rockchip: phy-rockchip-typec: Add support for
 Type-C TCPM
Message-ID: <eqb5m22om6bx2ypjtnlwdjmgfyycpmgrlvro34xwlwjj4j2jeq@mrarg36wetp6>
References: <20250715112456.101-1-kernel@airkyi.com>
 <20250715112456.101-4-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715112456.101-4-kernel@airkyi.com>
X-Proofpoint-ORIG-GUID: nNKj2DP3RhJMwfegkcINZ0lDpj_UTLzb
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=68764428 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=8-VJQ8zMMZwrctniyC0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: nNKj2DP3RhJMwfegkcINZ0lDpj_UTLzb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDExMCBTYWx0ZWRfX8kpmGvU59cKt
 kj8jDPC8TWNRF6lwCGnCRmA/ytsgnsvQpq7szmNhpBRKPih/pDwoa5gSoeNef31l8N4q2WNYxtc
 TTVAdmikNL5q1mDRoYG1jydcHH3njrPNW+a1rPweliZ6bZfOulKNw1K6oMJYgDV0FKA2CRNg4Jq
 wX1hqkefjxGaIQCYD9yu2zR9M0yOfl2Jfns7aBclfEb5kfDzeft9rAC/ZZGBULsZDzOX2zZsHIR
 S7dn0xLPq5UYAb9Zr6zk9rUtHlQW97INAWqQe7Mh1MbllEkyFl9kOBgXjikMR3uLpSuPMGkzfw5
 GBhWx5wyaXuYQrBPNLKJK0QEc6Kj25eOXywYP3RBUE45DkcMydegBsuH3BGfv4D2FdVQRw8+CtV
 fJaiGVl7Dp+naIJUWRgmJfOXBhUOcsF5tK/JHUn3bvP+i+eK6X+7DE8GSt4hpwfz7Ga2S/7O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=801 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_050600_770421_18F880C2 
X-CRM114-Status: GOOD (  17.88  )
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

On Tue, Jul 15, 2025 at 07:24:54PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> This patch add support for Type-C Port Controller Manager.
> The extcon device should still be supported.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-typec.c | 335 ++++++++++++++++++++--
>  1 file changed, 319 insertions(+), 16 deletions(-)

Please keep TCPM implementation under drivers/usb/typec/tcpm/ . Create
an aux device and write an aux driver for the TCPM part.

-- 
With best wishes
Dmitry

