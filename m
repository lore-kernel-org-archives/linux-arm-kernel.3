Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3A8109448A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 17:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/WEKlSuRIQ3y6kLJmolINvhUCSFxM2orcg3n1rvkHk=; b=VBy0D3QUK2aN5QRO8hmeu62Yt4
	oc4yWhBhHmbN9dMrDyHysw+W9V5vMZljTaTAlDWWfxTM7PbGtKZX+g/8FAaCkzMrePazt+XsK6eR+
	ZdGClG7cRnx3rGBVtWW/R+UeBpcn2nRQmU6jROSMS+o5atU8zB0EZUw7wCcY8zfYFnCEFCP0Dw6Sc
	tOfQAMlp9V4gFrj4TeHy/1tBLaUb6GPD8abXjuzRYOIt3OqHzwJbcNrglrB2K8lKebpewpRb3PW99
	WC6ImAeIsYKy5CHVunxKU3Wtf8Caa3oFYe5v+NK+Hf7StXKaiLJXp+p3SF4Pt1MR9glVUkbae8rpZ
	6qIPy1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3zwR-0000000EfXK-0FVP;
	Sat, 21 Mar 2026 17:16:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3zwN-0000000EfWc-2b9Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 17:16:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LFKKPb1541169
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Mar 2026 17:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5/WEKlSuRIQ3y6kLJmolINvh
	UCSFxM2orcg3n1rvkHk=; b=JvEB4tIyiA+gzVx5h+ULOk/e+RLbmaLaiqi/cU4z
	QFmV9OhEurr9W98gb8dSyeg6YZRZX6FIeTKc11d7Ty0qfTnO8L9DA5ac9Bry0Nry
	MQP+qc/58iV3XEj+W/omxMkehv2ybPkxNeHHEDiPIb20TiRxtv2Fy2AFP3lWl0s3
	s++FheJb1Dj5E/J8acvRYETrxcWpAhrvQs4+hrkYkKDkJi5/imE2I4ji0gbQKBOw
	oFumuQmE6OM44y/qc+NeNGxUPovtSuWoensY3S0WghtWtMpBQCeupaSb2Uwf7/zc
	O4q0AmZYh7OMlIxAvIT2QRi9WhV02yh56h060dKzSu2rOg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9r9485-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Mar 2026 17:16:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b34223670so207275001cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Mar 2026 10:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774113405; x=1774718205; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5/WEKlSuRIQ3y6kLJmolINvhUCSFxM2orcg3n1rvkHk=;
        b=VY0m6cYYnqvL6An5TtJaqP5Whpx6vJNrb/i7UvJ/EpVmCZviBEdls0VZMMwYBlZQSG
         yQgBLlE5yfX/mmXm7rqxDsLjuDH9MCxQiF9jguNgFYtE3oJmHnGNNW5oS004D/7qbg3A
         y8wfjxthwojFBtXN3QsFl/j/ir7TOqnYbzbyH7eFJhKnT5CqjxsicEGE4YHGc6OcVYqu
         ptqf2xo8F7VDMMmleeDgHTN39M+KsnN8AbRtKW5Tn9FKeq95Ce/U+nncMZyqAPgoLMtB
         aT6VUPEWXUrp8Ug8BQcSad8Nvl0rFbAM+6PLbTwdYL4p/7fgWl2YA4vKbLutOI/A84rx
         0XVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774113405; x=1774718205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5/WEKlSuRIQ3y6kLJmolINvhUCSFxM2orcg3n1rvkHk=;
        b=HufoaPS1LGi9XQfIjXMHoc3n+68BA7vO4Qdwp1P1RIDaAn60HxFarJOx7LzQXjDNQ/
         GdqKPIXQp/1Yl0GKMjLvocagWNmRjsvRktGjy3fLFeerfo9nbZuEajxB8TXxxtUnHTnP
         5UwzC3vd8wSIg6kLTk3NMImy0vxCAJJ8Qk6ZyIk98qa/ObqYeZ64hRJjZ1Z0G3sb+lKq
         500qFsiP03u3Vi7Y/IUVOOYbCDWOYIgAP3NAwC4Y82pdSPj8hxr01MoPOGd3Alhypi7G
         /nKLTZu+QfC8Liptk/8G/fZbkB3VE+NqOJpCTYTuyM3t5Z3FhK6u+6ClfJ3B6Qd8gQUD
         /WHg==
X-Forwarded-Encrypted: i=1; AJvYcCWkU2c/cilp6HGoUjMrFXrt3T9b58EWno0bB0U7jWYrtmfkxwiD3lH1Du1qEyV6HAXIRrRXu2PLLVTjnvh8FS8w@lists.infradead.org
X-Gm-Message-State: AOJu0YzIsp85wIjGSHshfTMNEpD2kjFMxjf7PMj39MYCgu4t4N2FJQhx
	rjI0uIs/T5GlvjRsECPrTc5Df1qDlhz1kqTne0Zk61PLIoRGLpB5fFBb+G8xK2k1HUX9JzJKExF
	6adL1gzWoqvSud1eU/OpdrWxybOaZeVjlLlfKvjoMBO1VdEa95EZ2Jjadft4QVjiTkmNPa3bcpP
	0U8w==
X-Gm-Gg: ATEYQzxB2dnZtgzVhC31kJwB/x9XWOqkqYdJv3SaRQpPYbXr1jR4d/vhR0mxx7rWsiU
	mgb8Nx2Vm3cATe0VJQnd9eO1PCH9ChzrWBWyjlxCi5eBCGGcdDncklJ3v9vGw8rQuKleHzrQVsH
	RKmzRrPxjhxVxkOpzrrVVYq0AwjYsmn+H0HorYpGXiWCEOF+mN/njXKDbiAWYbFx7LhPxMhUr4o
	J/iAT+XIEVFvwdTalUEIjmize84b3zNiejOIe6uTlxWBWzwkPFp5ufoeqyafxUe7Xp3qedFOPAi
	lQYkhG/nH6uThMulXBi96NRodJ848E9xvgQYL01RcprKyqV9654YoWoPwG5ER3JhHGdYZLadG6v
	538lX+1l9vPOXDhR7wuczWjQAH3FgEzUgZxkAfevtzYrjPfdAL0K5wIi//mw4XKj58x4VSQbOpE
	zT60Csuy593qsrfcpHNJJ5JXPUZwy0O1XFRtU=
X-Received: by 2002:a05:622a:588b:b0:4ee:1e82:e3f4 with SMTP id d75a77b69052e-50b375d0dc7mr119534371cf.64.1774113405547;
        Sat, 21 Mar 2026 10:16:45 -0700 (PDT)
X-Received: by 2002:a05:622a:588b:b0:4ee:1e82:e3f4 with SMTP id d75a77b69052e-50b375d0dc7mr119534101cf.64.1774113405142;
        Sat, 21 Mar 2026 10:16:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f73sm1223501e87.54.2026.03.21.10.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 10:16:42 -0700 (PDT)
Date: Sat, 21 Mar 2026 19:16:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/5] drm/meson: handle RGB101010 in format switches
Message-ID: <lu6cjjfcrmhebizkuf3hcghgktlyvw7f7docmoo5v47r2uidvu@c3rqozgop4i2>
References: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
 <20260321-dsi-rgb101010-support-v4-2-eb28ecebbfe8@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321-dsi-rgb101010-support-v4-2-eb28ecebbfe8@pm.me>
X-Proofpoint-ORIG-GUID: gmCb3SY8qo2uCqCDmPPEZTEu9H6PKBgV
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69bed27e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=4dpF3GFcmnioVf4f6KwA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDE0NiBTYWx0ZWRfX6H+NikbzTW8I
 eKgMH5WUCWE5BGo8FkRbmqH0ewFCZoMMUUlM56G6lpURVKxF17BfjtpZPWXNnu4GNa+guBK1jEX
 +7eMefYahZOw8JRUEjxBGcjt+uoimlA40wiQ8Pfo1Vid3sGRut00IrNpF2DIHzMFZJ1Mf3bH8rL
 uBmUFzr843yb0TcDVzxhkb+vxHKJI3sj60fYDksoQdYftQmI6GzTJMH8sA4ndsaHBbs9+Olr412
 S6it/nvQyNtZ2talDBhQquSq5KbUSekJZVN0gAzEp94+uDpGvbKo/O+lekEXcsoT1hyIUZVIY6V
 pUeR2xlbq4JGXqth4r2ml8yHujc631YtQOAWWm+zWqnJ0GZAho2aKIdSOXnhg3bFc8/LwGOBTnV
 WdiV9S0doGEMSP/REg+r23uVPDybBOnEyI8w+392Qb4drPt/Q9uoX4/QLM+VwB3tFRd8iK4939R
 QPVCY2F+BXgpJUrlMww==
X-Proofpoint-GUID: gmCb3SY8qo2uCqCDmPPEZTEu9H6PKBgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_101647_667668_3CEE3E29 
X-CRM114-Status: GOOD (  19.20  )
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

On Sat, Mar 21, 2026 at 07:52:30AM +0000, Alexander Koskovich wrote:
> Add RGB101010 to the unsupported format cases to fix -Wswitch warnings
> introduced by the addition of the new pixel format.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> index 66c73c512b0e..59fc0083d318 100644
> --- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> @@ -119,6 +119,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>  		dpi_data_format = DPI_COLOR_18BIT_CFG_2;
>  		venc_data_width = VENC_IN_COLOR_18B;
>  		break;
> +	case MIPI_DSI_FMT_RGB101010:
>  	case MIPI_DSI_FMT_RGB666_PACKED:
>  	case MIPI_DSI_FMT_RGB565:

This would need to be changed again and again as we add more pixel
formats supported by the MIPI DSI panels. I think it would make more
sense to use 'default:' here instead of listing all of them here.

>  		return -EINVAL;
> @@ -232,6 +233,7 @@ static int meson_dw_mipi_dsi_host_attach(void *priv_data,
>  		break;
>  	case MIPI_DSI_FMT_RGB666:
>  		break;
> +	case MIPI_DSI_FMT_RGB101010:
>  	case MIPI_DSI_FMT_RGB666_PACKED:
>  	case MIPI_DSI_FMT_RGB565:

And here

>  		dev_err(mipi_dsi->dev, "invalid pixel format %d\n", device->format);
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry

