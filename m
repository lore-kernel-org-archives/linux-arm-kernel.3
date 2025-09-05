Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF89CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnmVTYg5qyuC90TtxfAp5dg0tH1WOGwDVnnWVDmLEjk=; b=aGfcO/jtk7HeuTMc32yLSCvgip
	D5iwT67U0oab9JB/x7E/e9zIE0dEwkBiupdwA34FlHLEtlm6QhlKW3wj9cTNhmMJZM1+Eq7vvURI3
	SAesfbPpvmJz4sji98ltZbgtPVKkpcUsEeSmYUF6Hou6Rfw0sB3iTxlfBpbFbg58lEaObD85UbyEE
	8bTucYDkHJ/8DZPek6EbBwAIU0sswgtd4DEeHiD6Mf88/f9u4SBTNbVVgtz9E935cXvsig2GgL0EN
	/Szi8Uss27LLPHvf0bDgLyfG9L6gvA10KUh531B+LrI59yl6Gl8nGlYjT3upz2cXmAQhlgeEV3SVc
	QuEQTEIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6h-0000000G5xd-45nt;
	Fri, 05 Sep 2025 02:23:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuJx6-0000000FKj8-1TJ1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 00:05:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IdQ1h003771
	for <linux-arm-kernel@lists.infradead.org>; Fri, 5 Sep 2025 00:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FnmVTYg5qyuC90TtxfAp5dg0
	tH1WOGwDVnnWVDmLEjk=; b=ANr/enwScsWo25ym6A1EbFIwB93CVeITfG6TuTZx
	pQTNyfMDG8Xa7Ezx1E9lXfol9wnfY20WWcZ1cZbJBBou19QgAkT0glyuuZeIOeX4
	a0AUMxBP/GE1bFIpcGJYPUCVVxQk/ijPxwWqETOQFecWo+4FmKDfIATFMBdGst8V
	W28PAhm3PTEduaRGkkrY+HBb19Vq1TAfQ6NLhOd7LSXCmRq9NgZ4SJJcV8x3tDFd
	KYh+Zx/N7Hx78Jd+fhI5Q8Weu1SFTncOM1BU5XYGP44AQRj45IRkTo/HdeWdjqCc
	sAFxdBG1xZQexXDbkXRlAiULQIOCiOTywAEo4UTXGN251g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s9a0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 00:05:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70fa9206690so39921466d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 17:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757030711; x=1757635511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnmVTYg5qyuC90TtxfAp5dg0tH1WOGwDVnnWVDmLEjk=;
        b=GjWhucnAh9l1f3uAuXcnfGm4A9jyvWmOSZUH0B4zthbx+oGXMUaKEyeif6duwIXGLt
         gzZIHicZIkqJOQS9zsykMlrLVumqmkFJGEKgm3zU75TDVK05YEQ/1NBJW/9qaMznBDNr
         GLEqfyINY49F4W65vfMo9MRGmA/a98IBcuvYnRAdOjcZr9Ikg3GUShqMk2aP4YvTmqzx
         CXpGbIJ3MauHjWNwUUt3UjeUuPmjONhtDEUkoAkto0LWX0K4HexJ84zVbPrNKXuBXx1r
         nstr/9u8xKlJkIMn0MoU97KwPOWkUCC38C75kys7WYb1FwPMxevYfGKidWAp1708/bb9
         ZL6A==
X-Forwarded-Encrypted: i=1; AJvYcCUUONY6if2jeO//XY/3mSRwHJA9WczPtOqIkSRuSkxfef5fr2y41/huR8sbtFYKXFKxOlSU0Mg4SGVGVhz5HdXP@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc2hycF48WXET0Xr02nZA9iykoqo8x6GxuCkGD62sQIuQZHob6
	jnJcUJJ94sIQe7eG3At2fttIp+1699MG2yQbllc4lxDhBQfz8Mq6Fpg2fNI6Z2mlW0YI5LPJGS7
	iykUqmL9upqfAoZWHn5C8Ek5WF/NCJ70SA56F74CvI4RG+PQWsGAaqzuFFdMaLfDca1525mSbHl
	AXPA==
X-Gm-Gg: ASbGnctljcUc6kFk9jpEHeFfLnM+LDlqvb7ji7TM/JSS5onhlWcSihObxLQameR30/M
	AXnCF/yL9V85UoX+Srduv29w9VHLK4Wxv2EodRfq1x41KRBYFdqnD/EtcN9VqSp4UhNEVuEpvsj
	ZtQMOTTKQcMlZ/NPE8JK305he7mFeNpDSfbxyDRpDZUofU1WYzB0ssog6Pdh+LA7fc5VdpG5thZ
	ZvPYyPMlZsEJNN+/Y/bn9kJUAIryhW4QrjsGW4M3iiA+F8oXPFqCiCMSip3jnHSqMbcpBzO2qzk
	md/E39bJDpi5gV/FxyEU9r0qCC/IkUxN015q5LpY8ZgSXqDIcsrl0C9a0EHpuS4IT7jLnykvTVS
	dQQ3veynzuzd5u27R7fRIW+m2PYgm9PyftbJKHLvp7elqUl1SpNpc
X-Received: by 2002:a05:6214:2025:b0:70f:a558:2955 with SMTP id 6a1803df08f44-72bc355d107mr23890856d6.22.1757030710910;
        Thu, 04 Sep 2025 17:05:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuz7rSIAfCmUlEAAoYDamxMn3kE6MVpgENng2PopXAtvFP/43O0lsMhMkHtfYx9Az0yrIbYA==
X-Received: by 2002:a05:6214:2025:b0:70f:a558:2955 with SMTP id 6a1803df08f44-72bc355d107mr23890406d6.22.1757030710379;
        Thu, 04 Sep 2025 17:05:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad4d3efsm1478298e87.146.2025.09.04.17.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 17:05:09 -0700 (PDT)
Date: Fri, 5 Sep 2025 03:05:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, mripard@kernel.org, neil.armstrong@linaro.org,
        andrzej.hajda@intel.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
        Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
        rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
        knaerzche@gmail.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 1/2] drm/rockchip: inno-hdmi: Convert to drm bridge
Message-ID: <u72vkfojufgvuqwuqpvgvnip3wogpgdcuc7bn46zo3bp7ogbu5@fmqotgyahrsn>
References: <20250903110825.776807-1-andyshrk@163.com>
 <20250903110825.776807-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903110825.776807-2-andyshrk@163.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX0uOx5/yifOzY
 0WqAyuhp+PVBNAV6+HNcqZWvJXoaRtb7sJprJ71jwZWsd7ibV+QjsRY2qbCQOz1ZGQa3u33p1r0
 WDoOrqECOQ2w08xfOfObHQsNHfALNqLOGymZE/DfQHxIojo3COS/jz/UGw3FL3FzC2UZ5NbbI7P
 Cb8guKxdXtk/Gb+mZbgRYxphy4MWurU+IqXwsnc2qEjX6d21XwR2nKFAPpX/H9+NZ6OadC95km4
 ClSsaz2YIYzlv15cAZy4RnrhBGoQPwdu6SEgDGiTz3hU/YqLQBysN9tYXKGQIT36Rth3lcBR0oY
 w0pnXa1llvziNwhczEpkrrwWvVG0uwZyTALrUTEaf+CV6btPKbvRI8r5GnrhrvdOspmx4HUXHj9
 FA/ay/T8
X-Proofpoint-GUID: ZSODV64frfcHsMsO91S2KgnTiZQgXEdE
X-Proofpoint-ORIG-GUID: ZSODV64frfcHsMsO91S2KgnTiZQgXEdE
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68ba293b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=s8YR1HE3AAAA:8
 a=kdxkXz20giiO-m4nxtAA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_170516_387181_E80D16D5 
X-CRM114-Status: GOOD (  27.66  )
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

On Wed, Sep 03, 2025 at 07:07:38PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v7:
> - Rebase on latest drm-misc-next
> 
> Changes in v6:
> - Rebase on latest drm-misc-next
> - Link to V5: https://lore.kernel.org/linux-rockchip/20250512124615.2848731-1-andyshrk@163.com/
> 
> Changes in v5:
> - Split cleanup code to seperate patch
> - Switch to devm_drm_bridge_alloc() API
> - Link to V4: https://lore.kernel.org/linux-rockchip/20250422070455.432666-1-andyshrk@163.com/
> 
> Changes in v4:
> - Do not store colorimetry within inno_hdmi struct
> - Link to V3: https://lore.kernel.org/linux-rockchip/20250402123150.238234-1-andyshrk@163.com/
> 
> Changes in v3:
> - First included in v3
> - Link to V2: https://lore.kernel.org/dri-devel/20250325132944.171111-1-andyshrk@163.com/
> 
>  drivers/gpu/drm/bridge/Kconfig                |   7 +
>  drivers/gpu/drm/bridge/Makefile               |   1 +
>  .../inno_hdmi.c => bridge/inno-hdmi.c}        | 502 +++++-------------
>  drivers/gpu/drm/rockchip/Kconfig              |   1 +
>  drivers/gpu/drm/rockchip/Makefile             |   2 +-
>  drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c | 188 +++++++
>  include/drm/bridge/inno_hdmi.h                |  33 ++
>  7 files changed, 366 insertions(+), 368 deletions(-)
>  rename drivers/gpu/drm/{rockchip/inno_hdmi.c => bridge/inno-hdmi.c} (69%)
>  create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
>  create mode 100644 include/drm/bridge/inno_hdmi.h
> 
> @@ -637,14 +584,13 @@ static void inno_hdmi_init_hw(struct inno_hdmi *hdmi)
>  	hdmi_modb(hdmi, HDMI_STATUS, m_MASK_INT_HOTPLUG, v_MASK_INT_HOTPLUG(1));
>  }
>  
> -static int inno_hdmi_disable_frame(struct drm_connector *connector,
> -				   enum hdmi_infoframe_type type)
> +static int inno_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
> +					    enum hdmi_infoframe_type type)
>  {
> -	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
> +	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
>  
>  	if (type != HDMI_INFOFRAME_TYPE_AVI) {
> -		drm_err(connector->dev,
> -			"Unsupported infoframe type: %u\n", type);
> +		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
>  		return 0;
>  	}
>  
> @@ -653,20 +599,19 @@ static int inno_hdmi_disable_frame(struct drm_connector *connector,
>  	return 0;
>  }
>  
> -static int inno_hdmi_upload_frame(struct drm_connector *connector,
> -				  enum hdmi_infoframe_type type,
> -				  const u8 *buffer, size_t len)
> +static int inno_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
> +					    enum hdmi_infoframe_type type,
> +					    const u8 *buffer, size_t len)
>  {
> -	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
> +	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
>  	ssize_t i;
>  
>  	if (type != HDMI_INFOFRAME_TYPE_AVI) {
> -		drm_err(connector->dev,
> -			"Unsupported infoframe type: %u\n", type);
> +		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
>  		return 0;
>  	}
>  
> -	inno_hdmi_disable_frame(connector, type);
> +	inno_hdmi_bridge_clear_infoframe(bridge, type);
>  
>  	for (i = 0; i < len; i++)
>  		hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i, buffer[i]);

It's not an issue for this patch (and I think it can be fixed after this
series is merged). I took a quick glance at frame programming. It feels
like the clear_infoframe should be poking at registers 0x9c / 0x9d. And
write_infoframe then can support HDMI, SPD and Audio infoframes in
addition to the AVI. I don't have hardware to experiment (nor time :-)),
but would there be a chance to improve this?

-- 
With best wishes
Dmitry

