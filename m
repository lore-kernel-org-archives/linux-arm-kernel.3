Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77353C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 00:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnAbRsgM5Xpw854WTnr2PpxCp0fWTNuQo/r6LvQOASo=; b=eiBlwdQZI37KMGzYl3BgAOFQ1T
	0R3aQtNcmVjtLvfkU/9W7/h3tgTxeWoytcED2OKLWkdCFW1AZSq/sCs3dv3E7KyggWu0G3JfOWru6
	PkvFJdlOWUx1EP0sFrbYwhTbac00WchLKcSqSs/ir2pkd0/tIsUs4CqzwTzGbjPhp6TM7MlNcYWEh
	GYAbU9WPrmtIPQncvRMp3Urvfmb7hgOqvUejuvwAFrIqA4NH/UclwFI0wayHhjWSuhD/7G7WR7fnk
	bklvRMzILw0T+O8nl7ZqkawwWhYNUEkoPewYouPX1nMSi341Q1Gx+1HOEDnkhkFw/MgGlDn0uKpME
	SSWK1FxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubTMO-00000003cOU-3w0I;
	Tue, 15 Jul 2025 00:17:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubSKD-00000003VXt-0FxS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 23:11:10 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGJnWn017991
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 23:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lnAbRsgM5Xpw854WTnr2PpxC
	p0fWTNuQo/r6LvQOASo=; b=Byi6Oq1mlQ2Du1UBtBznaIYzQY4p8hL5pynHWdSv
	aTDe7W6x/B7tNhEqPkO5Y+VCzcSxQOtr0SuJfn7PglX+uFZMeALZiw5WrQcMh9rf
	sJ/Mc7HQOsEFmM9uIhSp5TBa7YwgWQ1Y4TrG1gWWLFFEW0WjJs/h8KGUsIHfDcD2
	49jcgELppT87gxfGxfXrNE98HiZW3Wn2N2WeWsSdypESIKNDnuxrp27nFMZzD+bx
	yU9qvwOPSfNE3+VFAsukhHo6roMkV6ATzLPh7u6HFnfVKFPkYJtaWBlZlEnxipRV
	XPQa3LJW0KKZLLpv05ITsY9TLU5AbgQXd0WQ0ZKra56mOQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut622g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 23:11:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e338e627f1so57173185a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 16:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752534667; x=1753139467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnAbRsgM5Xpw854WTnr2PpxCp0fWTNuQo/r6LvQOASo=;
        b=M5GAXjkVIhw4P5P+b3jQveX5C5EG4FOFBxDjAykCLfMRRK9LzZ0oYIY7BGc4o8yz5U
         z11BoFdZNApvR5X/xOo9LQZslGPd4qk96c2Jbv1KfMdYaspvAUpzyL1/O1FezQlbnHVh
         BVTkOjTD9APLGI1Skm/6BgwJNOa1dhiRE+hstM6moV8BSyQSiLHyEpkRgXdCuDZ8Umlp
         v2BhuxEOIyiTlHA0Yo7/OX3ZhktdYjeblxfAbwPjS2cS9uwLb9TeMIlOqrmwaWaF4UfS
         ig7B1IueX1F2Jun68PfA+xZ+HQ5/aXWo4tKXt7DNgHKAkOxvZaSt3eSwATv3LuBEipak
         oKog==
X-Forwarded-Encrypted: i=1; AJvYcCXy3oxc0pJJV0miS8hN6HuppRIw+3WqbtrkdKpxHO3UsfxuwXQ7VMvsv56o2li1Juwd42ITKPuxuiU4udHoseFv@lists.infradead.org
X-Gm-Message-State: AOJu0YxdG+E4ak0NAORc4V4cjXYB26BkokdCk5bEB9XiDreOAr+PixAC
	+/w+kewRA/hWQVs9iFEbkLooXZvd6HBQ9h/dn4qficnagbbH6mPy8eJRFiZC1s0GFzcy1RRbkps
	UfsDMY2kDG6NLYP9fc5NUQTBjro7UK74RuZc0gRmpYzvINTVtGvDN65WmDSeOgBvVmjmMAhIFas
	Ghwg==
X-Gm-Gg: ASbGncsDlLnjk3HCEv4Q8wjWxlTF5TUQZobDHoj+334yTEG1XrQK+w6iNwiY34Acnuy
	X21wCDxkylUKhNWpKvvfjndpvC6lO9YQwHUFfCY8wJwxeM6/jGBCS4kCyQuXgVxHuJpngvzShC3
	JHm1lt+qt0yh69VO6vVIaKKJTrO3KYfC8XxWaiRT2PXd7Fms0828v9RjL6/nAvgLj/O91vcgytg
	ZhEvrvNiGMasAkb04ovfMv6J1jHkz7gb2BiR/9105dBy0uqyrAhTJnMVivNo5YIEXoFb/fDOWr3
	m0G449cvYlWIfFG9vsp+T2er92v8WYvP2cQQMFHMBAxvsbEiTj77kihRxrbx1mxbs71LRJbq5Lh
	djACl2Lz37fzdG/ssKHl3jIO0vvE6k+tbNwEpqnYZNWFaLqDAUs5U
X-Received: by 2002:a05:620a:394d:b0:7e1:f16c:16d6 with SMTP id af79cd13be357-7e1f16c171bmr1319845285a.8.1752534666786;
        Mon, 14 Jul 2025 16:11:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgcpRDGfh0tTeMaTiRAOLif3PtbYVlsrcAaMwHK8S/xvzLSUZaIFYJ4fcz95Qmvjsb6mBB+Q==
X-Received: by 2002:a05:620a:394d:b0:7e1:f16c:16d6 with SMTP id af79cd13be357-7e1f16c171bmr1319837885a.8.1752534666331;
        Mon, 14 Jul 2025 16:11:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b73366sm2094948e87.211.2025.07.14.16.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 16:11:04 -0700 (PDT)
Date: Tue, 15 Jul 2025 02:11:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v10 01/10] power: reset: reboot-mode: Add device tree
 node-based registration
Message-ID: <5zlix4hfxkz447g6e6imjlatmnf26pvunnsmfkol7mhvropq6o@k7wr6h4hyqtg>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-1-b2d3b882be85@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-1-b2d3b882be85@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=68758e8b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=SZ81-B_MNtUeYvdDzSwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 7-o8cPAo7W2m-ZnpzIkae7yNz4x2Hk9S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE2MyBTYWx0ZWRfX6jd2tCmYGcL3
 Yfr97hRjI9iq/gbaCKVXBDPuuza3lDx1AsORqb9MOHSqv9u+cnbus3HkhViTMLCc7aueneA9jc3
 27H7j2ForFb2nqY/B0+tUhKBqNaY782UNFh7EcaoQ6pbYWhRG0ur1f6cET533WglNOV/ZHQMSMI
 k1MDMp/Td6PUVXu8PEg5F7a1jALpJHOihhtC21U9pVsnHh4AOVGUShEKfCbe9HIonACdKWgZ4ui
 +Iuh6ttuplHF8pLCqZ9sblhn9adv2gXjednbuG27vXcudFRkUUegu/wfjIga9TZ94WLh9G+Lnz7
 GZrlhB935unGW5U8o3eX0CJn+C6ZIAQWzGjFvA9qFFgVxuF8AhIUeSMxHxWJazA0sIHuqfKc5xC
 nRrjGQ+8EQzh/hO3QEnqUcCUBw814U/TtXkI4pDjVxY1jvsMMuL0SrjfTd0dO8jicTRugWiL
X-Proofpoint-ORIG-GUID: 7-o8cPAo7W2m-ZnpzIkae7yNz4x2Hk9S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_161109_212787_2206C057 
X-CRM114-Status: GOOD (  23.20  )
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

On Thu, Jul 10, 2025 at 02:45:43PM +0530, Shivendra Pratap wrote:
> The reboot-mode driver does not have a strict requirement for
> device-based registration. It primarily uses the device's of_node
> to read mode-<cmd> properties and the device pointer for logging.
> 
> Remove the dependency on struct device and introduce support for
> Device Tree (DT) node-based registration. This enables drivers
> that are not associated with a struct device to leverage the
> reboot-mode framework.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/reboot-mode.c | 23 +++++++++++++----------
>  include/linux/reboot-mode.h       |  2 +-
>  2 files changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index fba53f638da04655e756b5f8b7d2d666d1379535..61f647b23959789a313f3af0bd967abcad45fa43 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -12,6 +12,7 @@
>  #include <linux/reboot-mode.h>
>  
>  #define PREFIX "mode-"
> +#define pr_fmt(fmt)	"reboot-mode: " fmt

This wasn't really tested. If I remember correctly, it should be defined
before the first include.

>  
>  struct mode_info {
>  	const char *mode;

-- 
With best wishes
Dmitry

