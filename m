Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C274BCDE00E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 12:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTDIPGRvRpFqA1xlxZmp5V6MW6Dxq2QB3L1ZJBk3cjE=; b=gXc7osyR3uEb1efQlDUSnKupkw
	69kf/+DZb97vqzhNl49VbqnNXrMSHdQv5gCHhoFm+jcvHgpdujRqxnDf55JujJYfysRrM0SCSUwAI
	P1u5/VnIapkwqogtK1FdM2wZntMzq9VmDuG4O42uM9sjTDZPo7FBNeJsDYRhvlBrT/xmSyxK2J9Eg
	lfuRN5eQ1dFJRo3rlVsQu/INctYED4VcpQLl+CRaJ7S6dBnBnhxkHfhTyL5JCn4/g4OD5ruRFgVSP
	4qoSTiT3B1ZsNudxnOPAQ2GkMVHEOxuEAEnY45pbq0KM++YlUOIHnX1yc95oxYPSSCYtfQJgmj9ew
	7XQV6JLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5hs-0000000BJG2-1L4i;
	Fri, 26 Jun 2026 12:30:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5hp-0000000BJEp-0KFH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 12:30:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAd3BN607835
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 12:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TTDIPGRvRpFqA1xlxZmp5V6MW6Dxq2QB3L1ZJBk3cjE=; b=NYO5Z8JHU0kLnVak
	jecJFGLGhVpR0hbUX6zKhS2mOwvu3eBGD2sS45i+Hav3qp+2t6pE+pFZ2XtSONov
	X4c4W7LDRDpqtWVzmdsTGslFZpTS3BKqmO4LGnnqliXgF1JEa/WwjDEU7/Ezrmid
	/9p6KuxaPEvOhSqpUkA5GVy8m8qG2l9rSHKtxrQJuoHEKNtgMtDVMTwqW8k0h4C4
	z8xYfav8q16kpDuWAc/V7zyurzFDGBPLE82T94+UU8v0ss6Q1pUZpwbdgr6iiq1G
	xZWHKsoWiebuVTcUtPxGLoPpb+LE34GExlbxY4iBcjVil9s5noXrKfGOTvviRZNV
	fOp4EA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f16ukcn4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 12:30:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-72845b7072aso31119137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 05:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782477047; x=1783081847; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTDIPGRvRpFqA1xlxZmp5V6MW6Dxq2QB3L1ZJBk3cjE=;
        b=MB/HEQdkIYHu6vWZkTNE7MquujuXZYb7TJDmL/3XHZEYvpTud3V7XTpzZA+gN0+kA0
         3BTQsE2pRkjM7n9YLxaVc1hOfen3HKMvfF1iRWOBNQAl861dtWCO0hWdPjbkvPRSoLX7
         0VGD5MQKZLCjQ4lNNUn3ua6akGG9MUPJeI5TCWWNip3kKwk8m8s6Zq5v1MkAa4+bgimo
         HKTXaSKsnhCm74w2DLqYVvpRxxFN3+XgOAdzzWMJgHisAnTIT5I3UaVJtAr+/sPqUYn2
         y8o9R9lqbVuI5ysTrQPplmbWRtBMI792HuEuw3ZHfBoi5tLU+RMVEQ8mQkU8HgDM0OPO
         ESrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477047; x=1783081847;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTDIPGRvRpFqA1xlxZmp5V6MW6Dxq2QB3L1ZJBk3cjE=;
        b=cQc3wt+hxPAtWCWweOHwIMHgDlzUBTSUYV4S9xoN/RmHQ4VxkH4wStuMXIPMJD5WOl
         FpQ4SGdr3Fq3LjsZqZSGwCyUufggjgbfhf3LsFN+5IdX2Kl61A+Ws8cv9+JGYDrNkIKn
         PnDWUoMeOicw5+9fM9X8O/h44yeTKubJjAl3FBLH2pwjrEGnV5TQ/Lz5tPrAWHPJSdy7
         u4STbTKElfQIE/huxGYD4Lhg29ICk7gdjRaNSwFvKXGyTbR2ywtn2C9k7fyx04u0wYMe
         COW+RpxpR2rLPEbzKOTOB9TVWIP/VhO9n92tIoiP9GLB80CtFeKpRqj8xwsQnti2t/AV
         n90A==
X-Forwarded-Encrypted: i=1; AHgh+RrdmmKUL/0bQ/rjXZaRfZt+zCpMWWgaDSaqoYJN8FqKUca0+zXKhqZ2s30xx/SvM7vS6SU3WPwHWV0hJ34VdQGq@lists.infradead.org
X-Gm-Message-State: AOJu0YygIyMhy+Y+41GbIr3lpL0voe7LZ0K2diavkdxj5M63s/s9L8AO
	ZfELx9KHrenPkgEcD4OfF/E2tqVNVvGaQhe5HCW0pygZhSZEKb62kxf1xUrYjTre87kDzKGl1ma
	se2BWM8KybjIbUgMCyLZHLq+mMcpqea68/ELPkvfRPKhrhh9tofIYaz0ykE9AuFTEhjdhFsj/Fe
	vEEA==
X-Gm-Gg: AfdE7cnIRuPzi1ECvLk7ISwcxXOXqFnvxHqYmLMEmMJ3Uc4YUGn6cUxHjMPdk6hJcs7
	ZFuGtrTr8MAzE/cRF5FEY18vv8cxy/Whex6bpE3+Z9iwAN+Qd/TxABAwvcD0CSukg9A365YkdqT
	BFgetQJttgYIGfJBeBwrb6T/+AUyTzFEiTBHwli8k1fAbpz9GeosTbpRqrR3Or04exOixCOJrmU
	DNVH2kDkYF2xIaK9y3KEcP3ocRCKyedRgr3rJ1Zt264jdcQRuDcZowIGPiLXSg8KiLhjIlTcYZ4
	hZIRhSWCoGH9nrYe3e69qS/6kO8iBOiUkV9R7N5EDRr41FFvdCy6yVvmAYUhrpURfM9pa9EAXI6
	FVk3tchHdYkwnyz7f5JjIP0aoPAlHmg2xChM=
X-Received: by 2002:a05:6102:50aa:b0:634:11ac:12ca with SMTP id ada2fe7eead31-734362a85b9mr1107914137.5.1782477047260;
        Fri, 26 Jun 2026 05:30:47 -0700 (PDT)
X-Received: by 2002:a05:6102:50aa:b0:634:11ac:12ca with SMTP id ada2fe7eead31-734362a85b9mr1107909137.5.1782477046707;
        Fri, 26 Jun 2026 05:30:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbe5f73sm325659766b.17.2026.06.26.05.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:30:45 -0700 (PDT)
Message-ID: <b74b3123-367e-4f22-a910-a2ceccebdf9a@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 14:30:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: Convert to new media orientation
 definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Michael Riesch <michael.riesch@collabora.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Quentin Schulz <quentin.schulz@theobroma-systems.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux@ew.tq-group.com, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-6-47178be927b4@ideasonboard.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626-kbingham-orientation-v2-6-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VuMTxe2n c=1 sm=1 tr=0 ts=6a3e70f8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=O-OUeni-LN-QTous_GcA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: h0PPk4DYAsxQiQFEs92OQN0ngNU_22Ud
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwMiBTYWx0ZWRfXyvBbbsht7YQa
 ne5aV0Ci5RoVzc+CsO0r0TWKda04l4u9GvZN9AI3oiL4QvuQn4DRhol2Eq4Dm3xsbL0B5C7RzEh
 tBUmDHqkQm80kDXQwxkDA7EcbaOJqNPzHRq9rKFDXrqYLiy5PG894Xzv12BXRcvuPexoR6s361R
 WaispRDgm8Hq4ELxLc3xPskstiIJsvZwhVbqrFobcxtJU7dFKTxLKurL9CSDXqFMr7R3IMW/0t7
 iYmxzlNxA3NkT5L0QRMi2aDuFahgm2bYpYgjEKxjZdmzOl48jeeh/C3qlvN2x2U5Tf7+/hwgyC7
 t6DzFJq7GFdtKs8/NesB2NTN9QtZuscgoAvPrgPupOXMXKFSNgw5cJS5eTo+8xsnIMrlLjJl6js
 aIVcSCJZarr36c3XKaw5xvHEXjZuK0SD374aeYuWeI4y9qyI1pLw5BuJayqPZTHUR9qbp5+qhoq
 CN9xzFJm8Nq+LLUR0BA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwMiBTYWx0ZWRfX1uUyh3hWx6UV
 9ErfC7euGtWKCYYHqI8pp+IBh46QYBxH9WsUHFfuQr9+5JyxO4JORUQnZpeyhCyySGQKWlRqan5
 Y7EdUFeb9ivxC6Xx1JDM+7rLzFQRY5A=
X-Proofpoint-ORIG-GUID: h0PPk4DYAsxQiQFEs92OQN0ngNU_22Ud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_053049_131690_E158D652 
X-CRM114-Status: GOOD (  11.70  )
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

On 6/26/26 2:07 PM, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the users throughout the qualcomm device trees to use the new
> definitions.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---

Finally someone shaved this yak, thank you

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

