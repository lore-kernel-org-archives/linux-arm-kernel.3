Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2ACC83F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 18:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DGjbmN9sPVvKAeVUnrmEAYMXlcKkrf96eMlLVCBSP8=; b=zZmymKQRxebPWBSFgMDXK+scCY
	LBN6xemo6f6KQpy5l3ijgRn0x6k75Cswbeu1/5sY/0qTLJIER111z2Tn7rdJImuFn+UV0j+T2kVwm
	6jT1Q68wVmOB+mdhbcG8UN/k3AUuLyoNSZWeSz7FmxXIa45JV0nY58KouSC5AxBBFFrCiiNwG9Gvk
	Xr9LjKhgJndtRTgpaouBjSkeI4Bmy3pIeI6NeFlPag3Ofea6+VMgs9mImlTHkKTUq00TbktZJade6
	oIJLVWJkn2IY6WusFxxWCbKH+AQnBFMLTNbNma5D6qao57atR6nhLDXc04kwR5h82vLq7Finxc0K0
	NwVsboOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udZ3N-0000000Fc4h-1Bf8;
	Sun, 20 Jul 2025 18:46:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udZ0x-0000000Fbop-2vOo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 18:44:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KGEPaX007775
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 18:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7DGjbmN9sPVvKAeVUnrmEAYM
	XlcKkrf96eMlLVCBSP8=; b=YKjn9yuCwhTXrwZmhQAlmdmkiMhJwCC3zO19Pqes
	fm5b1b8PrWR3WgOyoteZO8pn8s96wQMWh9YExZHY4P5knYn2N+wCNZZePBdGdW32
	lPmEteEpb2XCQkIBu7tXJSzWI/skpYItlzUje7st0v//pSi14AGgXSKYmeOCxMwv
	DBt5rjE72KAjyB4fQAHUsJWTcF+I348ot7YtMGGhuM94OyHsL3vaosCCT6XYjDrv
	UNoTtKw+r9adxaRvekTw2H1d3sk5hQlTQcjyNQYhxGw+NFYEqMT7ZzTWxy0uf08K
	juBZWBJEyKC5LebRNNHJMDVIVuqO8GQJjZWcd0VpnmSpjw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q2m6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 18:43:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e350826d99so555840985a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 11:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753037037; x=1753641837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DGjbmN9sPVvKAeVUnrmEAYMXlcKkrf96eMlLVCBSP8=;
        b=IkLFOr7VF61RWbcV0irf8M5o1X82qg2V+MemTtoeLJipl2JqJ0y+LxKVo1NzqppH2K
         1rc+7t2xxIKKdu4FluGWagyKTJsv7kgX90nQVi49QTbCGkTYhcAcIT0i0mqNObtYt3jq
         YpdzsldDJ9PWZlzcGqS3jxGv6uyRBEyAtb+o/UQhe9AbQY4GgyXIICHYPysRub8gX74t
         iYpcPx0IIKdWuErbZBmpdwPQ9GMKmvOVRtC+PRRqH9spT7uPDYNENkDUtx9cNo10zL5U
         b+jk/1W6wYCYpYhmbAMWtT73+DIWP9EVUu/O2Niv2GF8DrFqmyz8ATxdEeGqos1BI2UA
         PNAA==
X-Forwarded-Encrypted: i=1; AJvYcCWFevCftj999E4khh5g/hL4kgNx8pFILGFOHwt/QzwdBpjwEjgjiaNLLb27/Fwwsu+VW/SxcfW5sVzxZy3gtiX0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4/jiYR2GI4Ec6RUVomj+uJRK0nrGBSbOwqR/Zy97YfuuTNHUc
	1qzJLHPv1Y3KcM3A2JEIIG/tLKNA0cfvyDMwP+py43A5iJ5dCAGm43WQOFyEpFIGkTOJTJotb1U
	trJhjNCo6eX8ZusUcg/5tRzL6WPf0bzIrzogpKCzhDPbmjKbfKosNkvfj/vjwv45OI/WMHxGR+s
	wTkA==
X-Gm-Gg: ASbGncsm/wenbVCEwGgI5jHw5vCkcsZiDb1AbC7d4wMpLAVvYszfOMNvmdQIiq+uh2j
	dZqJUgdtysGL0+srgHd0cR/TL0Hi7bP3qJs7zVQTOci2ySxAWf2KKNm6WcdZzAPbl8ubLn56vt9
	SlX21E37BamPhlE8ARChIZOx54SqV/oPZTqw6fFAYOsOcvGWJOyzBd4ECejq16Gi2ZMDLOB6Efk
	xlMsQ06StS/U4BWPI8i1bWY71YnVbu8IlbkrtcMMQBmoLrk0XQqoYO3d5RdR1ItmzZnrb+EN/ej
	r1CYHpYBKI++tOfJzNVvI+fPDbQyzUJKK/J45t1yjwqzEpb/YiK0cx1N7rCn6q3yqFTAPv0iOjE
	vB6HYKg/nabw63u3135zJHUxdknA3asNE/bnFO0K9uuiSvf/r8K+a
X-Received: by 2002:a05:620a:28c6:b0:7e2:b955:c2f8 with SMTP id af79cd13be357-7e343615de3mr2383898585a.41.1753037036716;
        Sun, 20 Jul 2025 11:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKbzT9Pz+u7y26dS37ikzmepswmyTtfuYp7Ru3WXjYRaeG4jYtpnsywS5C/gVypdLhcPj5dA==
X-Received: by 2002:a05:620a:28c6:b0:7e2:b955:c2f8 with SMTP id af79cd13be357-7e343615de3mr2383892985a.41.1753037036107;
        Sun, 20 Jul 2025 11:43:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d911c9sm1220334e87.147.2025.07.20.11.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 11:43:53 -0700 (PDT)
Date: Sun, 20 Jul 2025 21:43:52 +0300
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
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v11 1/8] power: reset: reboot-mode: Add device tree
 node-based registration
Message-ID: <ciaouxjcluhxj4hi24ajc4yr3r4xwqd36donieazxood23hcne@sjmwbabkdeuq>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
 <20250717-arm-psci-system_reset2-vendor-reboots-v11-1-df3e2b2183c3@oss.qualcomm.com>
 <y7xhfbiwkduo3lytb5gbukdu3yptx6uajtbngbspqbqkyt5dzo@gy62zoxwr6ah>
 <54eaf8e8-2b4d-b0bd-b65f-1262e72a54dd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54eaf8e8-2b4d-b0bd-b65f-1262e72a54dd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDE4MCBTYWx0ZWRfX69IKaXyFLPn7
 VB96S8/X7iURdfn4qthSsnWTLExCGH8yv7Y/ePV3BCmt658fNoB9N96MnQUXpZ/ZQWdZGdan+Fn
 /9+E6lSG8n0y6H9ut4eeZV5RwhbP+/yVcqBpGFQIbqtgIYTpTxWSDKwkJXF761+fswtADotP0jr
 wXH88X0vgT0/nSxayKb//JPD9eHtj5dE0nO+TkD1nkU/gFLB1cVv1vZYV/tSgAdCV0K0wZWMMxy
 P0hxwbpXto8VUhl6C2GABSc2ZH/+2OhxwpGNZ8ics2izdbMV2nurc5wfge+WXkxBhALE86qkVpV
 g77+OeBdMty5JQUiGNCpUZnxY08a4hawwEQJv/bEvNIonAI3D5u+A+89k5WCTajv42LFGs/u0cv
 C2s1JnoN6B+xOdbEz0XZXF7cTWfo6Z0CLXBNqdjqi2WKO08ylVWY5LJkN8oEoL+U34xhxj+n
X-Proofpoint-ORIG-GUID: fx049MK5FDJ6hPgkqXiSyXwCs-5UDJMO
X-Proofpoint-GUID: fx049MK5FDJ6hPgkqXiSyXwCs-5UDJMO
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687d38ed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=s3nfzRnEEBKEZTuRKrAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-20_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_114359_871679_F3CD00BC 
X-CRM114-Status: GOOD (  34.44  )
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

On Sat, Jul 19, 2025 at 09:05:16PM +0530, Shivendra Pratap wrote:
> 
> 
> On 7/19/2025 12:07 AM, Dmitry Baryshkov wrote:
> > On Thu, Jul 17, 2025 at 06:16:47PM +0530, Shivendra Pratap wrote:
> >> The reboot-mode driver does not have a strict requirement for
> >> device-based registration. It primarily uses the device's of_node
> >> to read mode-<cmd> properties and the device pointer for logging.
> >>
> >> Remove the dependency on struct device and introduce support for
> >> Device Tree (DT) node-based registration. This enables drivers
> >> that are not associated with a struct device to leverage the
> >> reboot-mode framework.
> >>
> >> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> >> ---
> >>  drivers/power/reset/reboot-mode.c | 29 +++++++++++++++++++----------
> >>  include/linux/reboot-mode.h       |  2 +-
> >>  2 files changed, 20 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> >> index fba53f638da04655e756b5f8b7d2d666d1379535..0269ec55106472cf2f2b12bd65704dd0114bf4a3 100644
> >> --- a/drivers/power/reset/reboot-mode.c
> >> +++ b/drivers/power/reset/reboot-mode.c
> >> @@ -3,13 +3,17 @@
> >>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
> >>   */
> >>  
> >> +#define pr_fmt(fmt)	"reboot-mode: " fmt
> >> +
> >>  #include <linux/device.h>
> >>  #include <linux/init.h>
> >>  #include <linux/kernel.h>
> >> +#include <linux/list.h>
> >>  #include <linux/module.h>
> >>  #include <linux/of.h>
> >>  #include <linux/reboot.h>
> >>  #include <linux/reboot-mode.h>
> >> +#include <linux/slab.h>
> >>  
> >>  #define PREFIX "mode-"
> >>  
> >> @@ -65,33 +69,35 @@ static int reboot_mode_notify(struct notifier_block *this,
> >>  /**
> >>   * reboot_mode_register - register a reboot mode driver
> >>   * @reboot: reboot mode driver
> >> + * @np: Pointer to device tree node
> >>   *
> >>   * Returns: 0 on success or a negative error code on failure.
> >>   */
> >> -int reboot_mode_register(struct reboot_mode_driver *reboot)
> >> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np)
> >>  {
> >>  	struct mode_info *info;
> >>  	struct property *prop;
> >> -	struct device_node *np = reboot->dev->of_node;
> >>  	size_t len = strlen(PREFIX);
> >>  	int ret;
> >>  
> >> +	if (!np)
> >> +		return -EINVAL;
> >> +
> >>  	INIT_LIST_HEAD(&reboot->head);
> >>  
> >>  	for_each_property_of_node(np, prop) {
> >>  		if (strncmp(prop->name, PREFIX, len))
> >>  			continue;
> >>  
> >> -		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
> >> +		info = kzalloc(sizeof(*info), GFP_KERNEL);
> >>  		if (!info) {
> >>  			ret = -ENOMEM;
> >>  			goto error;
> >>  		}
> >>  
> >>  		if (of_property_read_u32(np, prop->name, &info->magic)) {
> >> -			dev_err(reboot->dev, "reboot mode %s without magic number\n",
> >> -				info->mode);
> >> -			devm_kfree(reboot->dev, info);
> >> +			pr_err("reboot mode %s without magic number\n", info->mode);
> >> +			kfree(info);
> >>  			continue;
> >>  		}
> >>  
> >> @@ -102,8 +108,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
> >>  		} else if (info->mode[0] == '\0') {
> >>  			kfree_const(info->mode);
> >>  			ret = -EINVAL;
> >> -			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
> >> -				prop->name);
> >> +			pr_err("invalid mode name(%s): too short!\n", prop->name);
> >>  			goto error;
> >>  		}
> >>  
> >> @@ -130,11 +135,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
> >>  int reboot_mode_unregister(struct reboot_mode_driver *reboot)
> >>  {
> >>  	struct mode_info *info;
> >> +	struct mode_info *next;
> >>  
> >>  	unregister_reboot_notifier(&reboot->reboot_notifier);
> >>  
> >> -	list_for_each_entry(info, &reboot->head, list)
> >> +	list_for_each_entry_safe(info, next, &reboot->head, list) {
> > 
> > This feels liks a missing lock.
> Should we add a lock here? The list will mostly be fully created only
> once at the time of registration.

Does it matter? The code should be correct. List traversal should be
protected by the lock in all the cases.

> - thanks.
> > 
> >>  		kfree_const(info->mode);
> >> +		list_del(&info->list);
> > 
> > list_del should come before kfree, otherwise it's possible to access
> > freed memory while traversing the list.
> sure. will make it list_del(&info->list) and then kfree_const(info->mode).
> - thanks.
> > 
> >> +		kfree(info);
> >> +	}
> >>  
> >>  	return 0;
> >>  }
> >> @@ -162,7 +171,7 @@ int devm_reboot_mode_register(struct device *dev,
> >>  	if (!dr)
> >>  		return -ENOMEM;
> >>  
> >> -	rc = reboot_mode_register(reboot);
> >> +	rc = reboot_mode_register(reboot, reboot->dev->of_node);
> >>  	if (rc) {
> >>  		devres_free(dr);
> >>  		return rc;
> >> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> >> index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..36f071f4b82e1fc255d8dd679a18e537655c3179 100644
> >> --- a/include/linux/reboot-mode.h
> >> +++ b/include/linux/reboot-mode.h
> >> @@ -9,7 +9,7 @@ struct reboot_mode_driver {
> >>  	struct notifier_block reboot_notifier;
> >>  };
> >>  
> >> -int reboot_mode_register(struct reboot_mode_driver *reboot);
> >> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np);
> >>  int reboot_mode_unregister(struct reboot_mode_driver *reboot);
> >>  int devm_reboot_mode_register(struct device *dev,
> >>  			      struct reboot_mode_driver *reboot);
> >>
> >> -- 
> >> 2.34.1
> >>
> > 

-- 
With best wishes
Dmitry

