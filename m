Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4C6F8FA90
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 15:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rlmangFWK+0INg27+5z36YDN+j/0s+7d9Y2woRTfSA=; b=YkNj6xj8TrD+3FgaiLVCXU96eb
	wv7w34h6uhLkG8sNHwfVBAxpHo0J69jyUc7mwkYS37Df8/raNuv7rmXRVBh/IbGk8pQ3F4y/OqWfA
	d1oWICUK/FqY/r7OVz3XPlA+QuEsT6nIjrgW6Ve78ofMxux7rKrJ8TjkkiBxmnqsOXZe8oiFTyLCq
	T0nzWOY6XDzNXIUufkLvkud8EeyVZe89Ys1aKxAnDKuCQuWE5zsGk5BrK8vw2Oasauy+jSXiYdx/3
	kq8jHCdokDXoa1OJ4/jMQHLpM6fCBBBnrLeT4n6slVA4mKPxt0o6CihN6t/WEoUTFSyGcHOFvZDh9
	LLYsAA/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDUv-00000008sK3-2nV7;
	Tue, 21 Apr 2026 15:58:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDUt-00000008sJT-1xY6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 15:58:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LALX1W1511252
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 15:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2rlmangFWK+0INg27+5z36YD
	N+j/0s+7d9Y2woRTfSA=; b=T0SFiySzaezo2/7b9AmZz/YWbxYaR8QXZFSTRY9E
	GIJG6FUoGiv7oMrG/MuhO1luUIBzqDS9Di3R8cHZkheeVvtY9tnXtBv5c8xdqnzO
	mQY5VYjrqIGt5qiBU1i/VnnwLNYmhzPWxcl0Ag0LfyOa2DlgIHfJ3ruMbJh2/K79
	iYHNsmis4GWjcHz50PQ1pjBQvjUWhUAvlQ+UD1NQBZVJ/Dm2vTiR4tx45k54ZUDk
	yHUW3E2/4Y8RmVns3vj9kkK9gIjhyoMvvdEsmWPAQ3vUB0GDzHqMOFcmp9mtBVmz
	LvGD7gdvz4gUMMwCImnYk3adl2OhMTbdM3y/L4+aHoDtMQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp2ak2e6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 15:58:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so45403031cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 08:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776787126; x=1777391926; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2rlmangFWK+0INg27+5z36YDN+j/0s+7d9Y2woRTfSA=;
        b=igAgSjIxWyVzqFauZlS9zJ3O29Sm394tIpeU7GusawrTNeFF3qQ1q54GyNf40ZVrPc
         2o1L5XYrD0xqcodpdELkU+M3PnM4prwTy3J85KRwh2TtpOd6s8ZdspIAGKoJfEzPkI4a
         AA4sSlMXz9Wkn693AkuI2u1EKlJHlxvHwSaNEJEcsrCj6dHfgDKmku88DvlidZghWIho
         Vc9rQ5D6juHqjFJ+jxzBPgGaA1eC/GhdT7xTfaAYEmaMrDwDFlCafMYXF3BLbrBgeGkg
         m/xxhTXOyMTzcQtFM6r8zpjbUsMR+0mk56uUWDtbnEj5kU3dcQB6I8bOasW821o5hMK9
         E+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787126; x=1777391926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rlmangFWK+0INg27+5z36YDN+j/0s+7d9Y2woRTfSA=;
        b=NGPWmLJ2Q+EnfZSdVZOuJF7YJDJYwGNdLCsTPgMeLOsrF/Vyh3wtcSb9e65iEnFTTL
         AUwvqq9SBjO7stK3OAcMk1RtEpaVSpyN+EmLIQq5EjTjL9N6+xkCoeTrlnm5J7pUL/dT
         HcMRJ0W6fYAAdudsro5+Ib6dvXF5y47hWT+n9Gj/ZL46DCIt07bWY7nm61J4iFvkfSbr
         m8PcocWtJw8VgoS01UQlQrb70imzlmt7q2ZfIuYybf32X2R20roUc301iPJk0+9Rtw4/
         csszQSYlwyE5KLl+q8BPT3f1k2zZH40mR4kMAlgXqZEeVc8vCCemwkQZmasEfE8hDErK
         8hGA==
X-Forwarded-Encrypted: i=1; AFNElJ91BeapoCCH5DCaySUgSUWeov+bfzlQIQNB7wuZN+RbxC7lwHzmCD5FRd10BxcdkdVHtbRWDZQ3MOZXb616sHsT@lists.infradead.org
X-Gm-Message-State: AOJu0YyQXAxbCxn/1nqCNG50CZAeOmmvS42uduRCs5mdSg0cGPX16JW6
	7EGwW6XYKwy/z4I6vyEX9TSKPPAAV82WT90EP9FfQdA+fYYP/5FmKO9WHTxyLcEl9BI0Hp7R5do
	HpoLti/gyh41S/uuaXzrCIV2TUuzZJg7AnOu10tzgjWsVmezRm1S1z2ZTERSV3g/v7bXJ/fi0x2
	iZxA==
X-Gm-Gg: AeBDieu0We51YUPam9y7Ud0OGL7hMhOceu0qLuZnfHh7erbmmi7mnvxJ8F6rGmYN9lD
	viw14/2Idnm0YTMJDsJQu6w54/0X0iws8aB9LwE8uP733+l42f6an4eACGZ2nw8A08kZ+VMyXrV
	a2zs13VAcGaLj/yYeRHCGAz8WUSIbjRfSTaZYG45Q3SemKn8FhtQpPTqYwSC+B/dmuqh7KEbdbt
	hMESbIqiRD9bQr6xZrWYqJxowcmhg1zs67PPSCQXtlZOhwS2DSOticO1cNXHCQQYtz9GoQ25WBR
	/mQ/do+a1ZF/VA6/bnDJiY/IlwQ+SiWxy+BcOVabwl6dmYS/yeZHDLbT8xU0JO9Np2gUA0eToh0
	ioNQp0fmbGIb8585F5bE800E6QXfKIB/bZlq6IRGae43SQBD1lAJz3oipuMvM3CVs7I3B6Bt9dX
	iXZmMXuzt9XnwAEdfz6Bmt5Fdm8nXkUxf1HkmSNfPTaoRuvg==
X-Received: by 2002:ac8:5a0f:0:b0:50f:ba8d:8b62 with SMTP id d75a77b69052e-50fba8d8caamr24329441cf.0.1776787125501;
        Tue, 21 Apr 2026 08:58:45 -0700 (PDT)
X-Received: by 2002:ac8:5a0f:0:b0:50f:ba8d:8b62 with SMTP id d75a77b69052e-50fba8d8caamr24328851cf.0.1776787124912;
        Tue, 21 Apr 2026 08:58:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e12c8sm3767238e87.49.2026.04.21.08.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:58:43 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:58:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Simon Ser <contact@emersion.fr>,
        Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>,
        Sebastian Wick <sebastian.wick@redhat.com>,
        Alex Hung <alex.hung@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 20/20] drm/bridge_connector: Convert to
 atomic_create_state
Message-ID: <b7heherpjabs3xbgzxvaznyvfk5ok45uqrjotgr5esy2ctuvff@t5o25d65j37h>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-20-c63f1134e76c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-20-c63f1134e76c@kernel.org>
X-Authority-Analysis: v=2.4 cv=KItqylFo c=1 sm=1 tr=0 ts=69e79eb6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=P1BnusSwAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CGuZyk7pIeUWItkfYpsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: Sp7IEvV0aR-dRa0rXxE7RRiYJ99jvlat
X-Proofpoint-ORIG-GUID: Sp7IEvV0aR-dRa0rXxE7RRiYJ99jvlat
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NyBTYWx0ZWRfX/Ic3ohB1nv53
 1JcvpF46G2epd1Jt14iLEEZflbRugNBltzU5qnEgKTIzhActxrqi8pPLYAof6W3GYsJxEcJ8JhP
 nEssUY2OlpOD9dr8BBpsop9oHssDqN5I8jqdC5vSiVZ6MPhi87i/tUl6AppzsLeFutyls4SAbGo
 hXbqdX8jSTX9biMGTLSUiS88uFdzZeZrauDX9sC+yxG7nsRw2JpOWBYh5HZMBjqs38vMWjIH15T
 HtdcpvcT9NE3AEa/q+piVrWsCPQslYJ3L/S9G2dMJOPxMXow37964ValnI1YXl6ZHI3l7zXGo/Z
 0vkqLZCalO9fldaF4RQ4nBE0cD0UaXzSfxQA2uTz+0EeFEMuVY+GLxJAOoQ6nUY3+KWBpNrALch
 18GRF7668wVbW0ryOY4uyX24F6KVpnUmfN8bk+oOpPp7KHnI7TrKzLbHTCffMBcG8hLMD8X7NPQ
 R6/OoCGU5IaKBx6RicQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_085847_628400_0DCCE808 
X-CRM114-Status: GOOD (  16.25  )
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

On Fri, Mar 20, 2026 at 05:27:27PM +0100, Maxime Ripard wrote:
> The connector created by drm_bridge_connector only initializes a
> pristine state in reset, which is equivalent to that atomic_create_state
> would expect. Let's convert to it.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

