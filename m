Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53E1CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kT7i0Ihoctdom4fEH3aWC9an5ybuCaHFYLCL0sop1M=; b=WZYRY2fSYeF5xm3Vxv24OwA8MU
	beKwZPtb3nSf3xeRNmV+Lb65NCKF4MeKISzmJqagvvjDB9jbE1CLnVkqphSZ53Vojd+vM3pI6/kK2
	sybk6B840s8jbMgUWq6h6ITEpEc/ggeAPw8xdTegXWRjMbilW7rcai3ZQiCWlbItwle62SfwF0alZ
	rIeyhnbt1elK4FeaKdCn1SRdvCJQ+NtQWSsrjGzYmQ89i3fFNbozEH43es/ubKIB2wQXkySb8fWQR
	xf1msgqkuHC4N4CVtfOCYxeAHnjuK8COsXdZR28IZsY0rtTxJxZ4Zo8v687zX2TXnciDbcmyQ5Tq0
	u53HDCJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRhy-00000005TDK-1iR6;
	Mon, 10 Nov 2025 13:13:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRhv-00000005TCi-2Tzz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:13:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AABZXbl3271045
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 13:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/kT7i0Ihoctdom4fEH3aWC9a
	n5ybuCaHFYLCL0sop1M=; b=FlhyogpE7wPpN592tW05g7jKvwX48dU36BnsArbo
	vwuM+DvTCbsyQyXMOnhk8hIl+7VM2/x8dRj+k9aXQYjqK2P+9WPGmFwW/eJ02UDx
	Slz4j7iUzzLoAXJewzSwdIl/1Bqdh6cqla34eEAj3BaeEx5UsPbvQPF13LoSv4UT
	mfYIjgb1fnxC2PXn0XzXwLJ+4IFTqTYUsPa93V0H/Ea2gdse2u3cFYMY8evaI6WH
	vozDMotMQhU+ND8/FZy4KZbbRI2jIL45MzInikjFuAPGiQFBKbbKZK25GnzgyG+q
	QTA3cF+4IAWasD9McpPnHZy1hxmMd0OstzQTnhhm8kguFw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abfafr8c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 13:13:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297f587dc2eso21016495ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 05:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762780398; x=1763385198; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/kT7i0Ihoctdom4fEH3aWC9an5ybuCaHFYLCL0sop1M=;
        b=BMO1T4SgYwh+MjppTL6rkpSvEuQB/Vxl7Jx+1jEMvgumV7W9RSazUMw+QtayD1QAHs
         S6bti/Xv6z1CiRMHDc72Eoeo5bnNhs5AA0UkPIHht/szQG7WWX4E4JmjmgX6ei09fk6K
         43hOA+15EIJWIWtR+z71fhuQiIFj89gnuEZvllsLzTq+uYUPnzuV05pyF6X+CLzJQ4Ad
         thvVg4jmra9+q3ZVQ1HN5olINiukaZsjU8QRQF2fBPo+zoJECeH0bMYDPo3xPe/Rtubb
         OdsnB67nkX7x+KQFTEK0c2Cm5sV2n4OuAGHaiatjDASpLE56XVIcBDFpVNG3BVVCL07T
         NGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780398; x=1763385198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/kT7i0Ihoctdom4fEH3aWC9an5ybuCaHFYLCL0sop1M=;
        b=N5MG70Ih3pLO1vc5xbuEjR2IV86cAkNqm1aNKGlIaYcal7uelZxTxgPSmKzwIgmJK9
         PYrJiIb53ISbepANtuupMa45KKHNqDuxCKnDpeQbVuIf3WThLhEExSS1R2ND3893Munp
         oXjYYOptVqe+p8arqgBR+lpIuZG7aaRzbqBNgWZUdnHzlzjbU3BrtHAd+BiIHNsKe8XZ
         aatykLimHDUIVy6xNtuwszDCyI3V1jXq28Ogv7kAWljHyC8cq3w9UZDGCl2Jq2MZo/hi
         K0hpt9Ot4SWROeHpHE+nmAuyl46H41+179rruRttt75rDwue+e9CGNOR6K9Gux46ur6E
         yY6A==
X-Forwarded-Encrypted: i=1; AJvYcCW+6vSPEcioFr9Ad4uqnVM/ugK4k6E5D5vRXiYfdueqKuu+C9ncjWbXP9mW6lGgt41p5u2l92shgwuVsHUJK6Qh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1kICMDCjihnsipKe1UJ2tnDiKPBWszZg5UY/x2gKQsv9uWrD1
	OsjZz9Vl4WEKey2M1czMIg85vNMgTFIk5x/E8HScUhVu0+8jU6x5bAQtIxyeweGRdqibaIfLX8w
	U9V5ijgdEdBdgykI/DlTdFHk9FlKVfDOtmryTP3lcxSoLuvqRtGKJYhwsqnn0kdHZxfTeLjfdhZ
	9hrQ==
X-Gm-Gg: ASbGncuCL7UKHiNWp7Nxn++H6hBj8tsD17hOPr9+01N4+whUQe2gMnlg7PD31UdDTbL
	w7S+NGEDUH+isNF1LjC0Jjf5mYqJvMRMx9r4awtJnibJxNr7M0Cuvtm4NbCxkG4CYFIfc+WJfBN
	9acJnGD6FMnsFeqn4/BNrabXRB5iXkYEeXpieZehKC3a6H9q7Tlp7fwPeXpSB1D67k7QD6X/KBo
	fPGMdCe8jrt4OCqutRgUNetUyZx6vaaBv/8XcNS7BUIzOPm+WJtGhTCdSGr2UgDkqDAudT9pyXi
	0poKTIybvUZp3mJESdFixYk8ib1h/4cXbjGsNEDTGv1/mdFrAYaxd+rvT/+GDtiSeo/sdC5w3Kc
	lAdvK20uhe4CPwf7akW5rHdibkA==
X-Received: by 2002:a17:903:2f86:b0:297:c71d:851c with SMTP id d9443c01a7336-297e56be50emr104174295ad.36.1762780398151;
        Mon, 10 Nov 2025 05:13:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHdjyokKySSYFRDdg05Amagw35XW8iq6WQtEkFKbKQOAtN9Zb/7lC1J+9iBU/Vh4YTanV4hg==
X-Received: by 2002:a17:903:2f86:b0:297:c71d:851c with SMTP id d9443c01a7336-297e56be50emr104173615ad.36.1762780397386;
        Mon, 10 Nov 2025 05:13:17 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297dfcbe798sm82980845ad.19.2025.11.10.05.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 05:13:17 -0800 (PST)
Date: Mon, 10 Nov 2025 18:43:06 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
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
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v17 02/12] power: reset: reboot-mode: Add firmware node
 based registration
Message-ID: <20251110131306.tkrsfqeh6oa7ql2c@hu-mojha-hyd.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-2-46e085bca4cc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-2-46e085bca4cc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6EyVLrHUA4YJdUeJS8YAnNtZsL4dqBiu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDExNSBTYWx0ZWRfXxhuiAzgdzOFz
 8g4zVg8sf4c4vscfmGBOBIWKP2R73+P+LOlIBQRgz+p0vUZ+Fr9ElpJICOkN9JB1/4IEmfq2kQy
 zRm9JNyt++xwsJio8qjx1Bs4ApG40no92tB0cvp6lek2il1r8q7BulnigG+30FxrHemaYy5JIlJ
 d7YmaYXPZ5ZwC5nD+R9VTEKo76O6zyGZ3HPecMCQl4Tnjlk827OoSvRIBkcz/SAk4oKcoeQkeLe
 Z/FZQddFml3LyDD52RI5eYSEp1zG8jn7G5/DNOBl9WN8VOWrFlLUek2OlU8fRy6fZ0nFTEsvPcp
 5/MAPZ4a83ctF/FkeuVX5kCeEDrY0e18/AYA55/RUC2/BpEQFPyfibm60K5WRobqW6Sgd/vCp0z
 dTX6hnpmDZiIvxZ1Z4NssHIhDgSwpQ==
X-Authority-Analysis: v=2.4 cv=UZJciaSN c=1 sm=1 tr=0 ts=6911e4ef cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JCwNVC6uTNxX--Ynj-UA:9
 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 6EyVLrHUA4YJdUeJS8YAnNtZsL4dqBiu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_051319_659433_92E77B30 
X-CRM114-Status: GOOD (  29.12  )
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

On Sun, Nov 09, 2025 at 08:07:15PM +0530, Shivendra Pratap wrote:
> The reboot-mode driver does not have a strict requirement for
> device-based registration. It primarily uses the device's of_node
> to read mode-<cmd> properties.
> 
> Remove the dependency on struct device and introduce support for
> firmware node (fwnode) based registration. This enables drivers
> that are not associated with a struct device to leverage the
> reboot-mode framework.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/reboot-mode.c | 19 ++++++++++++++++---
>  include/linux/reboot-mode.h       |  4 +++-
>  2 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index ac4223794083f36960b2bd37a601b7e1f1872de5..eff60d6e04df2cb84ba59d38512654336f272f8a 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -8,10 +8,12 @@
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> +#include <linux/list.h>

nit: Looks like stray change and belongs to other patch

>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/reboot.h>
>  #include <linux/reboot-mode.h>
> +#include <linux/slab.h>
>  
>  #define PREFIX "mode-"
>  
> @@ -67,18 +69,26 @@ static int reboot_mode_notify(struct notifier_block *this,
>  /**
>   * reboot_mode_register - register a reboot mode driver
>   * @reboot: reboot mode driver
> + * @fwnode: Firmware node with reboot-mode configuration
>   *
>   * Returns: 0 on success or a negative error code on failure.
>   */
> -int reboot_mode_register(struct reboot_mode_driver *reboot)
> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle *fwnode)
>  {
>  	struct mode_info *info;
>  	struct mode_info *next;
> +	struct device_node *np;
>  	struct property *prop;
> -	struct device_node *np = reboot->dev->of_node;
>  	size_t len = strlen(PREFIX);
>  	int ret;
>  
> +	if (!fwnode)
> +		return -EINVAL;
> +
> +	np = to_of_node(fwnode);
> +	if (!np)
> +		return -EINVAL;
> +
>  	INIT_LIST_HEAD(&reboot->head);
>  
>  	for_each_property_of_node(np, prop) {
> @@ -168,11 +178,14 @@ int devm_reboot_mode_register(struct device *dev,
>  	struct reboot_mode_driver **dr;
>  	int rc;
>  
> +	if (!reboot->dev || !reboot->dev->of_node)
> +		return -EINVAL;
> +
>  	dr = devres_alloc(devm_reboot_mode_release, sizeof(*dr), GFP_KERNEL);
>  	if (!dr)
>  		return -ENOMEM;
>  
> -	rc = reboot_mode_register(reboot);
> +	rc = reboot_mode_register(reboot, of_fwnode_handle(reboot->dev->of_node));
>  	if (rc) {
>  		devres_free(dr);
>  		return rc;
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..22f707ade4ba93592823ea8718d467dbfc5ffd7c 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -2,6 +2,8 @@
>  #ifndef __REBOOT_MODE_H__
>  #define __REBOOT_MODE_H__
>  
> +#include <linux/fwnode.h>
> +
>  struct reboot_mode_driver {
>  	struct device *dev;
>  	struct list_head head;
> @@ -9,7 +11,7 @@ struct reboot_mode_driver {
>  	struct notifier_block reboot_notifier;
>  };
>  
> -int reboot_mode_register(struct reboot_mode_driver *reboot);
> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle *fwnode);
>  int reboot_mode_unregister(struct reboot_mode_driver *reboot);
>  int devm_reboot_mode_register(struct device *dev,
>  			      struct reboot_mode_driver *reboot);
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha

