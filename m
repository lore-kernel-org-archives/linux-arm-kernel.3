Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85995CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 09:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IW9nZTpAUTWb9o/++g/7GLgtnAqVsaz6ptGNBZO+z5Y=; b=psg/8321EfyTLvb4Oo0dSfLao1
	YvfPfbYeMFYnQ1ROnWmv9aURBPBXZhe2wzVrnI5TDps0GHeFOxmQBPA07rnx5JQ65scoF8N0BH/ag
	0KsSePylQJbX6tBduN8ra2mY+UY2brc/z27veCDe9bkBjCbNNpxcZJHxGhTKUqWWdEcp0ds75J6qy
	3Oo0RQrg+NueCb5/6w5pf9xctUJo78lmgOw+f3ie5fWLg46yWbIq4hyOehNBUnWC7nb/VgFAFzMCX
	/m2s6a1Z6bA2o3nzXxUvWanP201iDA31BNUJN2ul5oa17OUatECDv8O2m702UQ2fE5cmJugGm3SWc
	WNcoO7Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dJn-00000009xji-3q95;
	Mon, 22 Sep 2025 09:58:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dJm-00000009xia-0BLa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 09:58:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8iRPY007448
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 09:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IW9nZTpAUTWb9o/++g/7GLgt
	nAqVsaz6ptGNBZO+z5Y=; b=Qq4XOYHGcj5UjpfNhhWI+pS57JToMKI3A3wZj8UI
	e8VxbtMbKQqcnO3vgHJjiI1PtRXRLcdpXP8THPDyHLUVRfVFCnbLkmNwHpu89D86
	Tmx+/g5eHlLvK5Y+fdgcwQV9Hd0yvJ9Dm2vPkwNP6Eb3iblyKwO533H97yiCsNT5
	DjFscqzWPziW45E7jsvjglu4Eh0VVhx833W3X1UJFtZy7TbNCNrv0zXds+vCOiF0
	6OVB6ZsjxP+3gY5A2r3OnsuUzzWhe2z6In7YHB8EI9fzhifCEfeBHGnDJHLgswT3
	4DVBAqOwZYt0Rmw69CVPr681jEzwGz1pS0tM9EmEUndu8g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyemk4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 09:58:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ca8c6ec82eso17539861cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 02:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535124; x=1759139924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IW9nZTpAUTWb9o/++g/7GLgtnAqVsaz6ptGNBZO+z5Y=;
        b=wWglIZOSCFuVvfmaqtliIQG8qod8unMTBV5TAH2tFjpcmWaPwpuDnheeV+aEzgG8Pg
         l/iHC2Z0l3EWrGQSf7PG2He6+cngrW5g0Pu0ljm/Fnjp9+YjmoAImcR4IcurWcdLdg8f
         T1aXunhHNb2KMIf66FnCZOKe2wAhswit37mLbRG2TEKmDxV9B3yMab9zh+8M1Bi2OVD5
         qhYMn6h4G340HKJGVYKsrWjfpoYkhxWeWONAocfZoQp1b8vmfMpy2O5EMw9YQu0i9Qm9
         7Hz7b9RzdBFfRS475bX8zhb39Qf0uhx+v8SGoUbxqD0/29T0fwBi2uAerBlsMuBpuBlT
         ojBw==
X-Forwarded-Encrypted: i=1; AJvYcCWDGS3OI5e7tXYUH7wUcftx4BcDPe5maXNhubyeEicfo4TAByvxMADEuS/vrWd0OuHWgE3dwUJEheInfS1jZqF1@lists.infradead.org
X-Gm-Message-State: AOJu0YyZGmmGH2B9lPAANdCkSsTDoHWZPyFN0v5hj5ARaJRKJj5+LoMf
	z1WPISOzdx1Tjv/RPimMwmAsdy+ElW7j8kDC1NqhSJbO0e94aqQT5vTW2XkpwObKQXdXlvBYRib
	baPWquNSyfP2xhw9sfZpTbaX4oIOgdTmpxiRWa5jqMszZTiltAPEA8biMs6NAvgYLKA7SlL0GaJ
	M3pA==
X-Gm-Gg: ASbGncsvcL+lxcp+eotQRdrugTpCu8YN5aN6LsisdFwlnXzAR/dHBGngFe0lM1lYszx
	HSF+j6ExZizKOtzAR64DjwTEV/pIclx/vIWdRHW3lrunCaVSnO7m8bJzb0Nxin+sqQ9d7jHTQb0
	mFnArjopzoRMJ/4XE//wESQ2YxmRifcz1QCY4ADnz4U6h+8TJy1T7gArtVUzZHiXtDWsdWTVmTg
	2c9OSBZhev92jJmtXUBAuBcDbdNP1cXPiu2pAtMAjRgwgmCFuqB43ZooqmtK7oVhsL1zHj2uq4O
	56JyQxeKncnQBrw7uQcvdEMjrIil6bA/kU8wCdKGn0M5VfQ+bY0rDeX75SJ96/1UCzgXj5EbwNj
	KS2wZlkUkMHbrZ+vIPWxd1IlwwfYluFXX/ts0otQdR9/ArdfQ9h87
X-Received: by 2002:a05:622a:5c17:b0:4b0:edba:5a47 with SMTP id d75a77b69052e-4c073e88e08mr153125041cf.53.1758535124058;
        Mon, 22 Sep 2025 02:58:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZrkbJMOE8oi3lEYxkgH7mxWyV4vRf+Ti294a6hd808l4xFyp1mQDl/IreW2vbGpM6xLJBJA==
X-Received: by 2002:a05:622a:5c17:b0:4b0:edba:5a47 with SMTP id d75a77b69052e-4c073e88e08mr153124541cf.53.1758535123374;
        Mon, 22 Sep 2025 02:58:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f44b29sm3181298e87.24.2025.09.22.02.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:58:42 -0700 (PDT)
Date: Mon, 22 Sep 2025 12:58:40 +0300
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
Subject: Re: [PATCH v4 3/7] phy: rockchip: phy-rockchip-typec: Add
 typec_mux/typec_switch support
Message-ID: <75xs2vy4pt7c6qtc4tmk6j7jdh6hdmbz73pkbv5e2ndid2gj63@nla3q6qdb43h>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-4-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922012039.323-4-kernel@airkyi.com>
X-Proofpoint-GUID: ouHrvC7WrptCeaRrpm-46pYyFdVDDoUS
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d11dd5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=E19HVUzDLkS-Nl9glC0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX3KLe3m9Fbgut
 g0c7j2sydc85vZ+EA9Wb7p69K1aZpRxMxLAZAnrb1S+n1ZCBvLdMcMISzh3jrGfpOWtbXJnszpw
 oUeWDzyDvQFSGM/ilFDNrEN16lkNosGjI6BHsIwF1C2fCsYohRwe/ua05Av9+S6M4hihApe+BmU
 n75t+XMDrShu73a1XCc0ieyuTfNSfCe7m9jzu+YWaWEsfMO4YK46XnHxhxw0Cr/haYcT3iKqiVX
 mYKMDv7bPTQLJxNYZelPtaUPHa5cFqPH9cJyneiEbyFwcZzw04aMWrhjzLcEzYthRsRRLvHxViE
 7vQeBTPrVyTwpjbbnRhdwrIgXHui0yBy0v3H6HJEwxpYRlqMCLJGdIXfRAqUwhrF0+gz5Wa+1h8
 o16hc50C
X-Proofpoint-ORIG-GUID: ouHrvC7WrptCeaRrpm-46pYyFdVDDoUS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_025846_086675_379BA304 
X-CRM114-Status: GOOD (  26.72  )
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

On Mon, Sep 22, 2025 at 09:20:35AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> This patch add support for Type-C Port Controller Manager. Each PHY
> will register typec_mux and typec_switch when external Type-C
> controller is present. Type-C events are handled by TCPM without
> extcon.
> 
> The extcon device should still be supported.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v4:
> - Remove notify DP HPD state by USB/DP PHY.
> 
> (no changes since v3)
> 
> Changes in v2:
> - Fix compile error when CONFIG_TYPEC is not enabled.
> - Notify DP HPD state by USB/DP PHY.
> 
>  drivers/phy/rockchip/phy-rockchip-typec.c | 365 +++++++++++++++++++++-
>  1 file changed, 349 insertions(+), 16 deletions(-)
> 
> @@ -850,6 +998,72 @@ static int tcphy_get_mode(struct rockchip_typec_phy *tcphy)
>  	return mode;
>  }
>  
> +#if IS_ENABLED(CONFIG_TYPEC)
> +static int tcphy_orien_sw_set(struct typec_switch_dev *sw,
> +			      enum typec_orientation orien)
> +{
> +	struct rockchip_typec_phy *tcphy = typec_switch_get_drvdata(sw);
> +
> +	mutex_lock(&tcphy->lock);
> +
> +	if (orien == TYPEC_ORIENTATION_NONE) {
> +		tcphy->new_mode = MODE_DISCONNECT;
> +		goto unlock_ret;
> +	}
> +
> +	tcphy->flip = (orien == TYPEC_ORIENTATION_REVERSE) ? true : false;
> +	tcphy->new_mode = MODE_DFP_USB;

I don't think it is correct. Orientation defines only the cable (plug)
orientation. You should be getting the mux events for the mode
selection.

> +
> +unlock_ret:
> +	mutex_unlock(&tcphy->lock);
> +	return 0;
> +}
> +
> +static void udphy_orien_switch_unregister(void *data)
> +{
> +	struct rockchip_typec_phy *tcphy = data;
> +
> +	typec_switch_unregister(tcphy->sw);
> +}
> +

-- 
With best wishes
Dmitry

