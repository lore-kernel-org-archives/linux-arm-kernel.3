Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB708CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 16:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDql/hmPHmbhLyPjNWGht0IrlePqDSoVlgpyDaLxB/g=; b=Ty6wNu7C9S3XxtPp5BZtP+ipUy
	68X5iNoh5GVClqus2RumH0moLUAnH6zB+MvcyTHb6C4flQE9TpYl2I3Ss49+u6O4P2IKxjLS3ej67
	Fbg05X59tlI1QwPu5G8RvOgcWMvgk6GG51Ro5NUPkLLkPfo/H5VILyfTTRti+5wsrkah/5AmZXeUc
	2gErU+NhJI08up5VYrxxqihKwZ9vcJX+4JLfA4uEAs2CiEIB0HGOYvDCOSjcHrMC+7zXzcNbNnfdV
	WJKal55nhrBYujH5LVFTxSvnWoIr3j9L9QaIFirfWY6K/V9P4LcCAGpvWLCFYLCVQiaykuw6YIzGc
	cqMy4XbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7cox-0000000ALms-453c;
	Sat, 11 Oct 2025 16:51:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7cov-0000000ALlg-1YAX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 16:51:50 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59B3SDs5003602
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 16:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xDql/hmPHmbhLyPjNWGht0Ir
	lePqDSoVlgpyDaLxB/g=; b=EvAdmvm6JMiBwFtspv0DVRebMaZ0aXzHvBjDTmh6
	Pl60vwPGKB0cy3LVeUlVVjqCfimlC7XL7NnbIhmMZ5worXFZG91+Siul6cbVZs0L
	/tYDYwhfev7fPrgJq8VIpAhQ7xY1tndC7UIOZzQNtAtgIOpFU9lLhrlSlZ/tMh00
	G4rXeTkQIwVKyC9ovm5cMzFOzx94tfTYYTPcIji09/iwL63WTS2Gd45X9PBAW6MA
	YYde0awJMTCsglI/bbJwhzW00Y2bz+0MQmivyjvX1rPJD0xqfMcU8RutgBgNGbY1
	HiCWWxsnlZUDXyE/g5bcjD72dU2gQvJZLDvITIxdLDojUg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbs0x9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 16:51:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-856c1aa079bso1725567785a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 09:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760201506; x=1760806306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDql/hmPHmbhLyPjNWGht0IrlePqDSoVlgpyDaLxB/g=;
        b=AaA866IXYDDYcZbRQSTpCPDORR9Imx+NrpGJDArHvdDEhtxQr4G96fXNUmS8muv2sZ
         p90vg+d8K7kqUhv2wzxogVne/wcV5r4auP2h8rhiDaOyrnhekqQbf3n57djsc5TqPz05
         UzfwZTsGYQ19j4mqOcRj06LvvMQzZpYxB6EJbf8JrEoh0wKfQSEPH7eX8jzIbmv9YvLR
         KbSeK6EltLnFG5IyT9j7lbq559EFCLLI3aC1QpjyDI3nIPYo1gPeHGUewTLzblJTjPgq
         majuKnUJnl1UsUpFqia5LxaBZYm+l7vhhtoTvKnyzUYBVwBJRgBuSrgy6OdMlvwZKYXU
         YB4g==
X-Forwarded-Encrypted: i=1; AJvYcCV6FVaCsjVFSp/qGs2ATy/ST5tZxCKC3d76mTajgEo89znXRtM71pH7idBbDxfTSq3fubgRbxtUC4H4nru0A37F@lists.infradead.org
X-Gm-Message-State: AOJu0Yx65CSMhWazyADEoQ5TyIxmFD01djh5c3o8aYE0wgs068VJNLR+
	FW638PTilLtWHWK3I4x+zHYV2rLhfknTXclyBcFI5m2RSsb3PjRT6kKrcXZMrvTQRamFi+juTrB
	9Dc/O39dTVPkwhauJ0fUrnzJu7Fuz2wkSsw9RioPBpRcqm/tA29UBMEwgcy5ALlDmFfaotvtqzk
	7n6w==
X-Gm-Gg: ASbGncuWughcjDizjatjQGCUjaJg/One0g85TEM2ZWzvyROAqFslwXYRLwnypnpL6Jj
	Va2oh99GbG/bUbmZxJu1mwbrI26GvKYu1g6P1CsRf3AbPHCGd8Tep5AxPVo2KCmw6H9EHhfNV+N
	02vPGv0DlF3bG1F02+CVAqbiHJpE1xuKGz28VyF2RxB8GBesSSYWfJ/RJ05L4F+47hyUV/ow+LO
	0hlQkpvnoawXGXSz22BYbKRZsofxOsuX4K0XdaN+g6Gdlr9ugenQelteIkqo3rIu87zzCx9UutO
	ZW3RgapxZKdL1UOX6eG0xE1d54ZlJbIFDdv91IMTOvXz5QWTmPJQAFRa+8BGj2HDkedzyVldqys
	DTvA4gIwrzdZz9zfePj6DrepvTV69J3tUtbEmyqlZw7AY89QSK5bP
X-Received: by 2002:a05:620a:690f:b0:878:7b3e:7bc4 with SMTP id af79cd13be357-8820b47d5cemr2727435785a.11.1760201506224;
        Sat, 11 Oct 2025 09:51:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1knLg1ejAD4VBlbVpVAYhUPHuhDgVtfBnPSvgk3VxA9bjqCPn8ECh/NUyGL80y7radiIDxw==
X-Received: by 2002:a05:620a:690f:b0:878:7b3e:7bc4 with SMTP id af79cd13be357-8820b47d5cemr2727433485a.11.1760201505751;
        Sat, 11 Oct 2025 09:51:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5908856394bsm2060654e87.66.2025.10.11.09.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 09:51:44 -0700 (PDT)
Date: Sat, 11 Oct 2025 19:51:43 +0300
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
Subject: Re: [PATCH v5 1/8] usb: typec: Add default HPD device when register
 DisplayPort altmode
Message-ID: <4eizpzejw43gqt5jauvkeij65rracols2voa2osflwyjrwbvun@sovgqfuhg6mc>
References: <20251011033233.97-1-kernel@airkyi.com>
 <20251011033233.97-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011033233.97-2-kernel@airkyi.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX3VSMpWamS2Y8
 LFT/5Ehfrcm2nmeoIWWHIe213uIEuK6lAomeiasTo4a7slM24kvIE0A6k7EbpPocEZpD9kY4P+U
 uK9swyvwtUubei3FeMrWmDi0DmJWItqUT+ap1drOuUGmN5ALSVuhR0A/hyzoQtgcQ4FaaPVtDBt
 4ZCBb3zvQbcAaha/HtcXixN5+PY86vhAs2r/+iILpwpaFMBQsBYL+2akW5KUtRiIYxaJs8S5Zro
 ogzNiyxjDgBlX0l4obg96GdOrsulALJEbSIDpqCH6LE6f0tpiMDY7wrKysxqmKGZsK8O/yj/lQD
 zmrcOPjlF9rUzgFO4CCRDd8cPFi+QxCQ0ayN8vqbxrKtwgo8kCxVFXpUBKgkcwHK0kYase1L+Un
 5Xj81LxuEczO4en5g1PHvS4JAsFE6w==
X-Proofpoint-ORIG-GUID: ZHGCe6tMsAHXXB1Rd4PYYgrtW9Hwetd9
X-Proofpoint-GUID: ZHGCe6tMsAHXXB1Rd4PYYgrtW9Hwetd9
X-Authority-Analysis: v=2.4 cv=U7SfzOru c=1 sm=1 tr=0 ts=68ea8b23 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s8YR1HE3AAAA:8 a=RXhTPAuaP42idGtAG2cA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_095149_403319_F3C81862 
X-CRM114-Status: GOOD (  20.27  )
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

On Sat, Oct 11, 2025 at 11:32:26AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Add default DRM AUX HPD bridge device when register DisplayPort
> altmode. That makes it redundant for each Type-C driver to implement
> a similar registration process in embedded scenarios.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v5:
> - Remove the calls related to `drm_aux_hpd_bridge_notify()`.
> - Place the helper functions in the same compilation unit.
> - Add more comments about parent device.
> 
>  drivers/usb/typec/class.c         | 26 ++++++++++++++++++++++++++
>  include/linux/usb/typec_altmode.h |  2 ++
>  2 files changed, 28 insertions(+)
> 
>  
> +static void dp_altmode_hpd_device_register(struct typec_altmode *alt)
> +{
> +	if (alt->svid != USB_TYPEC_DP_SID)
> +		return;
> +
> +	/*
> +	 * alt->dev.parent->parent : USB-C controller device
> +	 * alt->dev.parent         : USB-C connector device
> +	 */
> +	alt->hpd_dev = drm_dp_hpd_bridge_register(alt->dev.parent->parent,
> +						  to_of_node(alt->dev.parent->fwnode));

You can not do this, unless you make TYPEC core:

depends on DRM || DRM=n
select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF

> +	if (IS_ERR(alt->hpd_dev))
> +		alt->hpd_dev = NULL;
> +}
> +
>  static struct typec_altmode *
>  typec_register_altmode(struct device *parent,
>  		       const struct typec_altmode_desc *desc)

-- 
With best wishes
Dmitry

