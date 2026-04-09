Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E535F364C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 22:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YfJuQz9x8+CxrVM73ltVMfSVgvGLqNbpnCkk5PUIX9Y=; b=NPsiBQTmLZQrf/td3+MyX5hMqE
	3njpzhC/mxD9HHtnjMuQY474RDQtls9SUoGE0+nFvCZye+tUfnK8bi56qI/tgRWRWzWMElqrs4hic
	VnDOCaQhu7pKEmOKum0EcZfK9bSrLr8TCwCJYvEMl/Vvsvzdg+oCbC8xZJqL3mkDdtUPJ2omMz/WK
	KK2QyXaOwDHvAdlgJaD9PsMfnI0vCVOsQ/HtKUExahgYoVxz4LvtLpaDF4qhfgmw1fShZXeHAeRn9
	w+BCHkrpMLNHx7Rfd+ku0DzpAAc9l3IB9c12/PVXikvoANH5SQJshaQFOmrQ8kAy3hvFRndGGly2M
	qezfb40g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAxZR-0000000BGrV-3Rxt;
	Thu, 09 Apr 2026 22:09:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAxZN-0000000BGq0-0JCK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 22:09:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KWhJJ1972619
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Apr 2026 22:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YfJuQz9x8+CxrVM73ltVMfSV
	gvGLqNbpnCkk5PUIX9Y=; b=PuUUUvjCOM0tKgt7LJ1qBH0p9464Id/g2CTihUW6
	mnvl4XVrXpir4kmhZe6PEPhrY2LifZYgKW5Vs6EsQpcBSOYHXg1Qj1pNpTXcde6f
	kqC/0hxc1bmbaxZJk12lYAGyEepI0VUL17eWKI2HMN1YEO69Rxk/+NhpmD2mbKdC
	RAn+udXOl93lD6VCGjwj5gToRo3qW4hyn8RAS5ABwmpJZRNcsk+6BcKVIIqneCNv
	Fds3WuLPfhtdaaE+dZgGvxowXegESy2mTHichE0SN4+JbaDt2MaedRKV6E7N1F95
	e6bJUc+D8gDeAN0BRI9zadJ/LlMYm84sRag3GrQIXXQIcw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms1uap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 22:09:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89fe39655f7so39614746d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 15:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775772588; x=1776377388; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YfJuQz9x8+CxrVM73ltVMfSVgvGLqNbpnCkk5PUIX9Y=;
        b=YYkAGYKbeJI/Y1hV/8o4jvG11stlbzXW2wfmUIvCzpQgKesuJZFz/oW+kxuPLj5k1f
         P/I64IsWjp4oB+D4PB5wgwlO+6F9iWtWAqBs3SMkdQML9WNoWMy07AjecH7u9b/SMalN
         Z/0xwj4Q+yaNbVOngXqBjc0515bmbUeHAYOxltNhYN3DOihHNhLW8U+HFSjuLFYLW+iD
         D0sQ4z3zspenmOYI7TzBdUaGaZQA1hTCphNuue4RvKigLHG9tqKosBjELIR3T0b7OrlR
         n8QIY2QkkT1TwWGcNuZM1xshTPU3GUj+FC016S5PXRTJQJsaeLjeqQjGv1vYdKR4J+jP
         Pm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775772588; x=1776377388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfJuQz9x8+CxrVM73ltVMfSVgvGLqNbpnCkk5PUIX9Y=;
        b=DxdfD3qIXg/z6peTjIkOlKcnEZ4JqMSSzp6i50LlPOlfPZ+6oRyBA69IpYi4IjK74u
         KYuVzlDLb/ImNa/F+oZht9PWuUznx553aCFn/oXZHUQyE2fxlxjV2psUpHvh2t5qP2aA
         iNyxTA7VfCMc3jp6KS7dODCiHnA8cNSv4mKzBgrtNG7LarZxy0mihz5ynODZAsBBx5hu
         T2te23ejL2rHg9mp+dxw7vyjVJHU/KlgDSlTfuRY8vzyO1RiXcun35z6v4CnRYrvmFX/
         ShXSpcWq5gJ2onql6XB9vSUIT7P7w5hOyXl9JlXv6Ff1P0qcf6DSami3rEvnBO8YacfY
         yu+A==
X-Forwarded-Encrypted: i=1; AJvYcCUzz7cgG3d0eTuzthTGBsCwt2GX6aNf1gPlHDWH0FMRLRBmH0Lph7/4xz+MtXvZinSAY2z/Sex3ZwkrCtbo11kz@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0fqn4k9aXjLntaeG9q/1IYzNlNVLVuUx03aroDsGxUrCuPT7e
	fwhKuPj9KXIiwlpHOCgOljfREuscGvz3VFZQu5yApKFOzaCrbd7nTA9y/Ef75CmF9LjYKbGcUUw
	GHoUOlNmWqR1ba4eyLHLt7PzKHdwujcql4+RUs062UgMPtFI9uWsO8V8Tm8MSy7yMzmdZEsuX7q
	4Q/A==
X-Gm-Gg: AeBDieu96q4Qp7NT2SIId9DC5Lp7Ej/iDSN/iqGWTauy8vBzsNK0g+6IobC9B8mCwVC
	GDY9k25fAf9WOLRczF0lpn0wr0fg/RFbIJG2am+M+AAs1AFflTFTgOkRP7M0qRSmT3W3x2C5Y6K
	ZyLUF5ru28dBQvia8XfM9Yzr7+JsJtAqKSkAK37gV4P4iQJqoS7HIue9cultvq+Hrnb+fGU7tc9
	+JLe/WSi112Ut5k1VGn/57BmGiYOWy/gIEScyqCbrM/eX4EJr+ht/RYmCrQJg+QiqjMzTgOp/LU
	+BIkuETGhFC33FyGfpZwGyBzz0SZsxumaDYpxWYHblvxLc/CmX7kIaxg1gDeXbkkZsJBxnM5E6u
	ebNxRbfpCAbPxf4cbX9gM1OxeDNpJLuf3lJMVUjl0q301JF4Tjuy0mM8jOeCoWI5r6gK8FsWt7H
	7iN/dBrTmO+NP6iuI+dzpmJSeOa354YjkudgI=
X-Received: by 2002:a05:622a:1181:b0:509:1657:a19d with SMTP id d75a77b69052e-50dc1a1ae94mr71687371cf.15.1775772587625;
        Thu, 09 Apr 2026 15:09:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1181:b0:509:1657:a19d with SMTP id d75a77b69052e-50dc1a1ae94mr71686661cf.15.1775772587156;
        Thu, 09 Apr 2026 15:09:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeefbb10sm195693e87.67.2026.04.09.15.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 15:09:44 -0700 (PDT)
Date: Fri, 10 Apr 2026 01:09:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v12 19/25] drm/connector: Register color format property
 on HDMI connectors
Message-ID: <kbbkbobybjismej7wiogvmpjdju5zyfkbbwyuafxeajmasuzzv@3ksrtmmvsa4d>
References: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
 <20260409-color-format-v12-19-ce84e1817a27@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-color-format-v12-19-ce84e1817a27@collabora.com>
X-Proofpoint-ORIG-GUID: CLCgbNU2dZvx-686LkZIobRioYKdujIf
X-Proofpoint-GUID: CLCgbNU2dZvx-686LkZIobRioYKdujIf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDIwNCBTYWx0ZWRfX4+UB8B+JxrZ0
 b0f0tB8mSjSvgx+USK4EyYZEJPWLHheFfNbFWEPsNW0AzHwDbEXr4OmLWv8O21iARwH1wQreS3j
 YAxCDIGs//8C3d6vP3Z4xg+FHKyQ2OZQi4e+yLF3rOJnzn8AisF9Ks24IQbGyTHwAFUinmOW+lg
 byw4f61CwQC0AXiUqOgy0PmJBcUYBp4v0NKtNSWNJIdyL3wL7dFfDrORoqZyLpiIdNkIfEiy0PQ
 6HaPhL6EXqnh2V7wovzPWLIcAOvnxfB78VwYnmhttjdc3VYQFguqslzny/vRm9k8+Qq1AJ3duGo
 k4+0XYTkAIBH6+4q9V2ngv26uJ0B5kJTqXR4M+XW27Ycg2by+mGHfUjjS7wn1Ju7sAVM1XDjnAw
 ylQLPYYbAmFoeuOx2aMGq9e4SEQivrraaBP/JB2a72y65I7iQgKV5GkTwQmyTutuf/Hm8UQsbwj
 LpLks/rkqeBQqQUBsrw==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d823ac cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=ZrIce4Gfb_NoB2EXF1MA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_150949_122756_DAD9E35D 
X-CRM114-Status: GOOD (  16.09  )
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

On Thu, Apr 09, 2026 at 05:45:09PM +0200, Nicolas Frattaroli wrote:
> The drmm_connector_hdmi_init function can figure out what DRM color
> formats are supported by a particular connector based on the supported
> HDMI format bitmask that's passed in.
> 
> Use it to register the drm color format property.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

