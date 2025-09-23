Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95004CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 01:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aC6xtZ2Xq3V/aoM/1E2yl/RvYTGjb8DsxBZkEhoHUs0=; b=OdDrZwBmhC+I1SkwxwQnekGUVy
	shQ1lQ4G2KeDB0K9wEfQtII7f2+by5G6AW6MXBXzNQTI2u5QdXwC6evXGJxyLN/IoAPgvixzOq0WY
	Vft5mELImwBrvw/9aWRD4/7VJT34ljJU0hNcZwHAsn7Wx5SMrX7zMWlKcBrAC9yc+OhUR75lNfxBm
	sugDA9PRegC43Ru8+rX04EpkpsS/J+lj7Ck6JzijpLH5/RqKs7QRkV99PEdTroWdG5DbRS03rI9p9
	JjAl1DVhzdpIRoQRMKd7sUFPXHhEnxodJ/2uqLzYBrZpjO7wvqWp3iyXFhbDg9pKsg3esmGJ6/ZGz
	cufjAOxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rY2-0000000By2E-0eCA;
	Tue, 23 Sep 2025 01:10:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rXy-0000000By0r-2NeS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 01:10:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MGAG2r007664
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 01:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aC6xtZ2Xq3V/aoM/1E2yl/Rv
	YTGjb8DsxBZkEhoHUs0=; b=kQP4aTFzNQ2UuzbT4ikHpSFm3WaFRyXiNs2GrX1D
	NOWQh3swouH9vJ1fAxVXC6PCPqnticuckinCgv8kquP2cFLdmTNHqGDbpgIh3ic5
	HhdSV0BKnlWkJLFZeGrTyNU2cQym6INqa8JoGWm3XQiSkQd1Fv+CWSb1KePAMs2k
	wGIvF9VgWOBP9v+kIAh4IRCzFD1nQtI8BHSCyjVKIOz8cr1W+zSd/EEDTKsqq248
	YjLoM6Pq0PFnCL7+VWkYLy7Cy/zDlG7J3Z2vOWAuA+pfn3YrzhzFUnQ9mU9MG101
	Hb90tz017gvT47+qynKe99HkOwpeaZHUOOOyb39SLXiPMw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyepxbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 01:10:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7946137e7c2so125559166d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 18:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758589820; x=1759194620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aC6xtZ2Xq3V/aoM/1E2yl/RvYTGjb8DsxBZkEhoHUs0=;
        b=o9S+SnTwgDhO1963PtlQG6Kbs2vkphXQ0KR6Nr2PVCqlP0pHhJckt+LAW8NLDlFOMG
         W368ClCxtTlM6LmjNflK5nR7KFPbGarexOO33LzsF6st6aVomeLlhArelKEJN3erX0bX
         jbFw3/Rff8FFQC6Eh2Z/oGdeoaJ6ca1LnBQG+dFEJQ7iUdjgWsySnIPSasjCqsf6Ckup
         3tIosxOdLlDugmwxEAxlxUisDncTRjjpF0WI3G6C/OT60rpXzvjCMfLeTvSgmwS2nqYr
         bTByvsvxcc7gRSdMRHzikEA7kY1+kcucQ8WSLz2M0iKYRkU0ElttYExft/GAbeqZ+yMp
         3v/w==
X-Forwarded-Encrypted: i=1; AJvYcCWvJwW7C5MOJq+c8FQdBpffPxmFjqMKKELXu3Ttv0BegqwH3aaZJJdBseBQ6uygKYyugomRSU5rn5nLUOq4fa5g@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8HbbHFGdrk7Nmwo4wofJFphm23HObPkVJSiOxDXY9YQads+ti
	3UN7m6qLDxQpXBTm64uvXyap8jowMmAhCOe28Cqe2YeIkNsOr+RgWV3olGJcYYxLQA6f+ZvcFgf
	t6Xil8Kff/sFOT29sQwODX4rvvXnwSHty0G9KapFO3gGleI3OxZPom6bUEZ8EgpHkOEWk0kCjb5
	WSeg==
X-Gm-Gg: ASbGnctIjhUVfW4TAHM+wLH2e3eUUd8EFPDMTnxZ01m5nKbWZfRuXvEMUMfllRIWs6+
	uAru414kFaKZIvicsLkad+/9FLvH9jGaovsN+FofWEbnjEORHUTraTUTT9qWlpv8a/gwXf1uvwA
	nhYpJUMJE5+Hke7gQrSxWliuWwWZ5aXf0i22ww/t+CSt5j9U870TTKsy6tMPWQ79GbxNKbFqLWb
	c6peJbF7Ngtc8azzOshhHwnF9tHVMBHS7VpV/S42gc3+oDVFB+cBnxRqvbLHUZ/5ItXlzZPIvLx
	DcH0VwHRjaIMBG3gwGXxoEpRPp35Ols/liIDCj8POEBB1LpIL0UcSIeEtERJFjuIKf0HEou5UfF
	KgUvK7sDAkKIKLrf0lns1pcE23ZlAESeiwpK4YO/qGbFBFd1Q82Zs
X-Received: by 2002:a05:6214:21cd:b0:75f:6116:83e with SMTP id 6a1803df08f44-7e712ef9c76mr10311866d6.37.1758589820516;
        Mon, 22 Sep 2025 18:10:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/AqhiaebrPXH+fi3RCpVWDIqMTUfClYaLPwNMtBGbndVg1ntx4aReI8HayNz/8sSGkQvDNw==
X-Received: by 2002:a05:6214:21cd:b0:75f:6116:83e with SMTP id 6a1803df08f44-7e712ef9c76mr10311466d6.37.1758589819848;
        Mon, 22 Sep 2025 18:10:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-579e716407dsm3036752e87.97.2025.09.22.18.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 18:10:18 -0700 (PDT)
Date: Tue, 23 Sep 2025 04:10:17 +0300
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
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/7] usb: typec: Add default HPD device when register
 DisplayPort altmode
Message-ID: <mygbqhiom6pkwsadzz2bqf5bth3ogsbd6iku5a7r5swxrakein@fjhz7udnkcks>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922012039.323-2-kernel@airkyi.com>
X-Proofpoint-GUID: HWPIGv7K0_EKcmvzGrSrelF41cbUtkd5
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d1f37e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=BpK9xR3a_xoX_XwHwW8A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXwTuBB3ZwmSCF
 WRDRlkWfisiHhb3SWVNvAhmBqPI7ZBNXRq0BnYvUAotGJV5XleGSotN1VuEzE0N3wZMhTdGctGJ
 pKtLXfu55yl9XOgaTNkdVzWnDpSepLbxwRRBACO0pjSGosIi6zXW/tox6nYhby5ZopkANscB1D+
 dY/RQqRkT+jgsw/aiZJeFxouS0mUcV/9uxlgLk83N5fwNPOoGfTBTyjbUum6yYJm1pWBFUOqERE
 QoSLptNld37f2GsCuyUYKlCHht5APslKmHmUhrZv+ef0sgNK5vM8gUYeEKh/gZeJS/UWoatZhUz
 sFwweSn+EHRi1oyORtP40sYLqfZw8AbV4e9qYxSCC4poZHy1FingBZ8bwBHsBAPbMkU/NdYdU53
 3tfpKBrp
X-Proofpoint-ORIG-GUID: HWPIGv7K0_EKcmvzGrSrelF41cbUtkd5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_181022_614598_1C1204EA 
X-CRM114-Status: GOOD (  30.79  )
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

On Mon, Sep 22, 2025 at 09:20:33AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Add default DRM AUX HPD bridge device when register DisplayPort
> altmode. That makes it redundant for each Type-C driver to implement
> a similar registration process in embedded scenarios.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  drivers/usb/typec/altmodes/displayport.c | 27 ++++++++++++++++++++++++
>  drivers/usb/typec/altmodes/displayport.h |  2 ++
>  drivers/usb/typec/class.c                |  8 +++++++
>  include/linux/usb/typec_altmode.h        |  2 ++
>  4 files changed, 39 insertions(+)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index 1dcb77faf85d..e026dc6e5430 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -14,6 +14,7 @@
>  #include <linux/property.h>
>  #include <linux/usb/pd_vdo.h>
>  #include <linux/usb/typec_dp.h>
> +#include <drm/bridge/aux-bridge.h>
>  #include <drm/drm_connector.h>
>  #include "displayport.h"
>  
> @@ -182,6 +183,10 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  				dp->pending_irq_hpd = true;
>  		}
>  	} else {
> +		if (dp->port->hpd_dev)
> +			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> +						  hpd ? connector_status_connected :
> +							connector_status_disconnected);

There should be no need for these calls. Once the HPD bridge is added to
a correct fwnode, the drm_connector_oob_hotplug_event() calls should
deliver the signal as expected.

>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
>  						hpd ? connector_status_connected :
>  						      connector_status_disconnected);
> @@ -206,6 +211,9 @@ static int dp_altmode_configured(struct dp_altmode *dp)
>  	 * configuration is complete to signal HPD.
>  	 */
>  	if (dp->pending_hpd) {
> +		if (dp->port->hpd_dev)
> +			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> +						  connector_status_connected);
>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
>  						connector_status_connected);
>  		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
> @@ -391,6 +399,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
>  			dp->data.status = 0;
>  			dp->data.conf = 0;
>  			if (dp->hpd) {
> +				if (dp->port->hpd_dev)
> +					drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> +								  connector_status_disconnected);
>  				drm_connector_oob_hotplug_event(dp->connector_fwnode,
>  								connector_status_disconnected);
>  				dp->hpd = false;
> @@ -751,6 +762,18 @@ static const struct attribute_group *displayport_groups[] = {
>  	NULL,
>  };
>  
> +void dp_altmode_hpd_device_register(struct typec_altmode *alt)
> +{
> +	if (alt->svid != USB_TYPEC_DP_SID)
> +		return;
> +
> +	alt->hpd_dev = drm_dp_hpd_bridge_register(alt->dev.parent->parent,
> +						  dev_of_node(alt->dev.parent->parent));

This needs at least a comment, what is dev.parent->parent. Also, the
of_node is not correct here. It should be a node of the connector,
rather than the device itself. Consider USB-C controllers which handle
several USB-C connectors (e.g. UCSI). The DRM core won't be able to
identify the correct bridge.

> +	if (IS_ERR(alt->hpd_dev))
> +		alt->hpd_dev = NULL;
> +}
> +EXPORT_SYMBOL_GPL(dp_altmode_hpd_device_register);

Having the function here will bring a typec -> displayport dependency
between drivers (which you didn't document). It means it won't be
possible to build typec core into the kernel, having the DP AltMode
driver in the module (which also doesn't sound like a good idea).

> +
>  int dp_altmode_probe(struct typec_altmode *alt)
>  {
>  	const struct typec_altmode *port = typec_altmode_get_partner(alt);

-- 
With best wishes
Dmitry

