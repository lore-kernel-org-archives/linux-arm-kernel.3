Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B0DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GM4iFtyzqSsCummFikJQupbCmlSMeouuwE+lB7Uj1zQ=; b=H7uVSvaIXlIwe2bFaj7ce8PRSb
	cs/krrvZweNstCdWB3DL9LvkzMUvISV7ZhkJnkR0sqyl2GKhLVgOipIS2W/PqUaAIjOrwrwpbnVJS
	YtbEcDFekQkcV+s/tcaJF5yMpk1rjjvMYoPqEi0z83Mb9S2MCma+bdTciawlBGzKfL8T71QdxbbOr
	tgQY0tvm83CpLjpc0qmfwQAstIYoWglZpLTmT62l7agzgTEXVrG4549Qd+O6aY3+BvsbaEaSmea6E
	w9gsxP5OhbtSKw+MvZWCWP+sELwpDthtEmEUGEBQFDtHbERzK+GcuH7LWq3HfB2vGEWOB4x17uMxo
	MfGT6pSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7G85-00000007pdG-2Wn0;
	Tue, 22 Apr 2025 16:05:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Dp1-00000007KjJ-0i56
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 13:38:00 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MDLTix007977
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 13:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GM4iFtyzqSsCummFikJQupbCmlSMeouuwE+lB7Uj1zQ=; b=aeADmndm6tJVAhfa
	m9hM9FuJQrSmny9BgTCNxJOzoQ4Aw0p46VZStJpnpYi2iHC6Uf7qzzbtPoeXWns/
	t9+vw/E2i5quOOBUxOH5tDxkVDOnyHBQzrXTL6s32o+o5aW7o+nAMqgDCjtDk0FK
	/6/x4n2i08PSmMc+U80uLETxgAvNB5Ls9QSsMz8AGZOs5FXgJcxp+WL8i1XJL/bu
	c/VfwFe7EMjLn08xeMb0fkm5d5aYi8kiBe1wh7IttwgLvmTQTFGE+GuGoQlQR8RQ
	LDbFA3VGPpC0MfsvUgoiWPCjhVFLNvm1kP6Y270XVq+2eWTuJNfGFsj/boJjDQ9V
	I5VJmQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643e1fn7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 13:37:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f9450b19so111155406d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 06:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329076; x=1745933876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GM4iFtyzqSsCummFikJQupbCmlSMeouuwE+lB7Uj1zQ=;
        b=Vc97J0Pv//efvBvDKQwN+N9lUtiC13/NoQ0a859WyyxFnJpG0VtnSToHHvyZBJnuxG
         OFCu/jcdcZwvy5UXf7ME/b9N5XhsJPVSKfx8udUu+Y1aH4svxEQ20lfrhN9L3ZAwtlca
         2THM/GZfQdzOIOEXnOgCerCwjZ9plw15H4msCvlP7r4cGDrKHpEXtL0vKuetVJ+o1sRt
         g2d6HxXiWeR1blai3cGy/kha5Xo5FOWHC4n4oCjaTjPmwiJDGQXgEavpatyhH9MkM+dy
         oLz0BDw3iD+eKEQrOUeK3EiScGRKTc43XWMvuGZCD5f5aCw6UcI9xjp34wWaTc036Fbr
         vW2w==
X-Forwarded-Encrypted: i=1; AJvYcCXUPn9nAnpLYyv0MGQ5mRjfrWgdPC7Cz/lSGBDaoisH4t1y3/1rQhIfwNmQnltRoeh+ajOaG/FGaV5x0POsZvyx@lists.infradead.org
X-Gm-Message-State: AOJu0YxtvsJKpmj0oTAjF1Ggi2R+tXdrI8xNUUO51XnQuzTAvLg2BBD4
	WHZJtB8wtA3zxEpTYfEWeIMIYsPHYdQ/NF2o54qhGcGqNXY5ydIPTrG3wEPqA/XwmHTBdhSoMfU
	ruNmtio/ImoXLOGv8QWpynTaJTB/xDeZmg3YYMaraMaCZH/9idO0qCou3r4xkoRmxw7GBBN+XeA
	==
X-Gm-Gg: ASbGnct/s/gDmZ+fs+TnY0gw79Mgo9PykPOEbip8mD+7eYIC5kctHdKLhd3YzlrpHMS
	ZU6/7/OGvgQnNtQzCQm5/YDMM2BQoUKXJSnk+wxi99AW5q9QW/rZcF7I0l6dCq0Veebr1Riq+Qc
	ZgfjNd4dBFpF/6orHLdu6xHpFQdVHebOet5hF0mSJ0IkPMFXNaVKZ2vgZT1B1D01iXqCgRIYegG
	ZuiQXNAgFAPS57akVcfbGIrR2DQJ6T3dZxUWrF5Wujey60OJgOuuk0mR17XA32StzuTcAsp559a
	kJwMsgSiXL8CSYXrXLw6u08WkJibosyzBlIGMkN9BadsG86+0QYXf0Z3k0UgaqFuHWLh7fgkQRF
	/PTmvseFgbrMWvIJCQZHmHBPirUW95m3QH/rPpV8i7x0lnToMnfB93P5sKMWBgrp+
X-Received: by 2002:a05:6214:124e:b0:6e4:4adb:8c29 with SMTP id 6a1803df08f44-6f2c270088fmr272713886d6.12.1745329075741;
        Tue, 22 Apr 2025 06:37:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs5xmFsFakaRJU+iwqHLQfYpkknb90+sqtIxpjfjRPKBSqlIlI7xF2xKWLEcXvzJJAnoNEDA==
X-Received: by 2002:a05:6214:124e:b0:6e4:4adb:8c29 with SMTP id 6a1803df08f44-6f2c270088fmr272713396d6.12.1745329075396;
        Tue, 22 Apr 2025 06:37:55 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a2:9556:18c8:3d0b:b936:c848? (2001-14bb-a2-9556-18c8-3d0b-b936-c848.rev.dnainternet.fi. [2001:14bb:a2:9556:18c8:3d0b:b936:c848])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109084d9d0sm14805871fa.97.2025.04.22.06.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 06:37:54 -0700 (PDT)
Message-ID: <03cb5084-38ef-4827-9951-f54880ca8a07@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 16:37:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] platform/chrome: cros_ec_typec: Allow DP configure to
 work
To: Stephen Boyd <swboyd@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
        chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>,
        Jameson Thies <jthies@google.com>,
        Andrei Kuchynski <akuchynski@chromium.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
 <20250416000208.3568635-3-swboyd@chromium.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250416000208.3568635-3-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZOrXmW7b c=1 sm=1 tr=0 ts=68079bb4 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=3E2bT0mqOhGjLt7avEEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: rSAUC4-LGmSagHrm6Ia4JqzkSq_STo8c
X-Proofpoint-ORIG-GUID: rSAUC4-LGmSagHrm6Ia4JqzkSq_STo8c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_063759_358130_4FF3B114 
X-CRM114-Status: GOOD (  20.15  )
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

On 16/04/2025 03:02, Stephen Boyd wrote:
> The DP altmode driver fails the configure stage because the status VDO
> that is spoofed in cros_typec_enable_dp() is missing a couple flags. Add
> them so that the configure succeeds. This has the nice side effect of
> properly reflecting the pin assignment and configuration of the DP
> altmode in sysfs.


Fixes?

> 
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Cc: Łukasz Bartosik <ukaszb@chromium.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Andrei Kuchynski <akuchynski@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/platform/chrome/cros_ec_typec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 6ee182101bc9..2cbe29f08064 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -531,7 +531,7 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
>   	}
>   
>   	/* Status VDO. */
> -	dp_data.status = DP_STATUS_ENABLED;
> +	dp_data.status = DP_STATUS_ENABLED | DP_STATUS_CON_UFP_D | DP_STATUS_PREFER_MULTI_FUNC;
>   	if (port->mux_flags & USB_PD_MUX_HPD_IRQ)
>   		dp_data.status |= DP_STATUS_IRQ_HPD;
>   	if (port->mux_flags & USB_PD_MUX_HPD_LVL)


-- 
With best wishes
Dmitry

