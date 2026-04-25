Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4634DFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 11:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skggYkTTFObHeIE3RudQp0G91CjiRon2TwvgONrTWQQ=; b=EvRFokLYgmqZnQYmhrie9mUtEo
	cO9n8gpeqRsxfASwDvqwvMRFAqQi3rLWlPh/rVCLxiViL/8iig4B2c04ngvDxUinJaOg14wHD5dlf
	9IzV+E8+TsjCpoqR+nXgXPLrfHvD2kilURTKv2Nt+tWiwjEOl3Pz7pLU1Nge+dFWESA45aoeZvdYJ
	wCWzvPzqPbg1nYa8duz0VP3BXWtsbIVZMbUUYeW38NSpHKTk5g1cJK8FzKHzBzJAR2xfUlkO5UfmJ
	ap03ePJ5WNchuVWNpEl2PSaX7iZORifpYxMsoEGhgGDiuTIMYg5xo7jI3maqWL2/MWTbc/z2xKO2Z
	eDGM1Nzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGatD-0000000ENac-1XB1;
	Sat, 25 Apr 2026 11:09:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGatB-0000000ENZr-1CR8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 11:09:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3M34O946014
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 11:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=skggYkTTFObHeIE3RudQp0G9
	1CjiRon2TwvgONrTWQQ=; b=RJk2YCDyCRrYvpfj7deR0E+7F40sA7ecy3s5LwuC
	JwrLO0+41LY8A8E8LR/ubgVCS5crHRH15ux1KKMvHODIbUrQADAzhDKgh7DgKvuF
	boQxjUCJyrrvL6yo7vKI5fZ2xQpzDowy54280huGdhYwzFB9c65HxxfKNPRI4dgf
	TzvtBwc/KZplZZc4LERPGuSZRVGn6F/7kMgsRm/Bdsa4aRalN+daxsXP7WUoJgWj
	bYrYOvtt7Z3WHlGDs8HW63uk9QF9uu+0o4W20QEDD2bTA4LKfF5OGr5Xv65hOcT6
	YIz1ZbrnMAen9tBpnWm8cneIfIV5cwOaJh3zaOUNqYsNPQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr0sam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 11:09:31 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56eeaefec9bso8821049e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 04:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777115371; x=1777720171; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=skggYkTTFObHeIE3RudQp0G91CjiRon2TwvgONrTWQQ=;
        b=LF6eZIvNvXxOxQGW33YDDWe2/sgWpkx7bCYarjwuc6oHvLwLTkG7Cy5v3eBigqGtjz
         f0NGwUvzQ3psZZmbaQziIVapo+mgBWM2myGijvdgO1ygLf5HgSNW2Xz0s8N6SqkbclvC
         bgIIB0YIBy8qcz9t3FOp2ud72yOvVyJheRZE4EC5KJCQ8vSlJlALMtVgjBsQ1kgMFDxd
         MfRGA29SWTfXvyiIy/7lkd8H/55OHiXathBy4FKvscf82QQPLObUuxnz8nPZ449wbwIO
         MM1xMOLZHroXIUJh8LZIsUL8DKW5nY+6/fgZjctYmZWo2W5UoblsjqzFbmZAVYlnavkh
         Kgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777115371; x=1777720171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skggYkTTFObHeIE3RudQp0G91CjiRon2TwvgONrTWQQ=;
        b=A1K2WrASJitJo4KzJrHOrYw3DGj8D4GuU0Dqg6GV6h/JnXI2s2Ac9DHy8HHeeghqe9
         tllrDYmTgkCYK69tBKLo3tEKWlaQ9UfA61HEW2hPZhZ6u8XVfcA5YzLsev3+62TOZLsN
         Z+8x6SOzBxJG33oU0nMvTpe1L+D5cKzAXjlB0xNORkhvMKst7lPZPigvX+b+ikB4Bzk6
         83TsSQV+yeqJStwkA1xVdzKbvDaOF3PAQCwktbUWMibHhaCvGn/nIUQeufj3qLoFrClO
         TdjRV3XJA6SaEYI+f6pbZq4nBUZi5Sbseorf2ox4Q6jm0PtNUiBGrWfN/9p5VUjfl73m
         wbbw==
X-Forwarded-Encrypted: i=1; AFNElJ8Ssb72a5ORZfP58JIuYUJsg9M4+pjF7LAZomM+BK2NSibu2Ku7edELnd0FjjuYlYf0Hz2+6nC2V0iEWGXvVaRN@lists.infradead.org
X-Gm-Message-State: AOJu0YwEhRVh1G3XuecnTJhB5N7Li1TW3WwuT42BT1bhXqcSTcp8B6RO
	IiY/CS9DQaO8f8h7c5i3FdZSCnn/mRCDQMCO94AJp3PSrQlsSb2iNyZHfIWnbVF9ntb4/n4NiBS
	A1CLYsPUztdA9liq/H0jAjveQmjHE084hwE5uCno0V0OKYTU++BujFS9Z9XUQV4I2nqUgYUb9k1
	gJ8g==
X-Gm-Gg: AeBDieuknVBspDxzkfa0eow/YRmGr1TwbZTU568KbmdbPrRsLqfOo05csFEYDK2vrZN
	k+Q5B+FR6EM0jX+sYADSqu8hm2Zg7b7Q5zpz/54iGM1oqBR8MuhNdqSR9YlAA36Vcpy7d14thPo
	K5Z6xs8pwSq8d2rj+mrKRRnBqiBPo1tP8MZXLxZwAv/HcJDZnLdWrTLju4i3/XzHqig21PIgjR9
	2VMgtLFafHh6vM9NCvPwTX2W7kZni3D7YowdnOV+3MqfUCzIoHTPp5zAegreJFohPuFDNB+Phuu
	82JhrPtu/Xi7gDu10phuChf4D1Q2WUUKMySkSzjegmeKMUWAk6whBNHHJWcDicwJNWXX/rx27wu
	vloAo3j8iM5Td8dPE1cHZWaIM29sNVFo3kg+xJKuFVZMc9g+O8fwtseEfXYc0tSb5xpGKdUB7nH
	ihEbQBYSYJHWboI6L+rvpZIc9pk/zPHuVjBDQlZZpKBP0K2g==
X-Received: by 2002:a05:6102:1611:b0:605:7a45:c7c0 with SMTP id ada2fe7eead31-616f70f0572mr17646771137.13.1777115371011;
        Sat, 25 Apr 2026 04:09:31 -0700 (PDT)
X-Received: by 2002:a05:6102:1611:b0:605:7a45:c7c0 with SMTP id ada2fe7eead31-616f70f0572mr17646746137.13.1777115370439;
        Sat, 25 Apr 2026 04:09:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f64ebsm50476681fa.10.2026.04.25.04.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 04:09:29 -0700 (PDT)
Date: Sat, 25 Apr 2026 14:09:27 +0300
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
        intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org,
        wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v14 04/28] drm/connector: Let connectors have a say in
 their color format
Message-ID: <5uit4utjrezpuqok36apjrkojaklze4ftgp2r4zrqolus7gkcn@nu2hsrhaj6zy>
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
 <20260423-color-format-v14-4-449a419ccbd4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-color-format-v14-4-449a419ccbd4@collabora.com>
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69eca0eb cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=vpl3xS56dgtxGFZ4nZMA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: orrm5k_SdfTXdyYnXGgBRl-H4A1aUiY3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDExMSBTYWx0ZWRfX2JOuArdMol5Y
 wn4OQb6MM00aVKQSCDKbWzO5tZnZgB79LaVD3GWL/dpc1GBYyZJBATQcqbgQDUtdnS7pk30EoQR
 PFz7wWBdETztDhv19iidbjcdUfkH1G31T0qlCilPUfSqeEHJxgb8wBCWn9q0Lni7KyCzmcdSTUF
 NgHckjAfpZ6mYog0zYefUDRZYU62i7Tjpqgsr6cL1dNCVGEKfB3BNJSIqiZkNQj46+YQR2sHphe
 rTlsvXkCVnCEqxq2jmWHitenPoJKIMtXmoG20TGM3/3mNoZtfC5ujVrPX87zVDVKULeuzfQnpQp
 BPh7cJNK1LIQIJd9iz1cpjIZA2WdR2SjsnyJQZFh82JDNtBL9nfH7xbkxuDhZDp9UKYev2t30dV
 j+Z+VHzE82MrOWl+5Lr9tydyrR/VrG2WkqqDG/eQI7q+gWDR3Wmut/VZOu42kPFg5gkUnsr5DZq
 Wx2MEEWw6AcNktxCjVg==
X-Proofpoint-ORIG-GUID: orrm5k_SdfTXdyYnXGgBRl-H4A1aUiY3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_040933_434450_2D5EE83F 
X-CRM114-Status: GOOD (  17.64  )
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

On Thu, Apr 23, 2026 at 09:03:27PM +0200, Nicolas Frattaroli wrote:
> Add a function to get the connector color format from a connector state,
> and a new function pointer in drm_connector_funcs to allow connectors to
> override what connector color format it returns.
> 
> This is useful for the bridge chain recursive bus format selection code,
> which does not wish to implement connector implementation specific
> checks like whether it involves HDMI.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 16 ++++++++++++++++
>  include/drm/drm_connector.h     | 12 ++++++++++++
>  2 files changed, 28 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

