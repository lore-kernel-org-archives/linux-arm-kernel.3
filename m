Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAE7C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 03:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Mj3SzAcaCvmOfibRhtunrb3JChcTu1mYYWf77aYRPc=; b=oIxz285rihn9O8zF7iVnRU9rad
	AkDNYiWpiaxqPMtYknTM6pRtOoeLPudrhORIh3G7+cHzqvXSQ8vpxtoKodIhqpVt/piunqmI3Fn5t
	LEoEQ4x0HkxOWxzzvi+/BZu4Y4jzbi0BeXxXIk0yxEDaaTflIQHubnM/boMUiHvChZMOWKcxJP12s
	pxtdGaihWz4Eb1T+s+Tq2RkF5OOdMaqaYKpnQSxNUxPuphz7ndE+Z10/C33GJlFthxG8XDBBMLXlb
	4+wk7M5PJxPldCq8E4D+k+vkhdDEMJXDu7OWFiOvbme2MkfV8xD1JdlS4LGr4r4L5FEUmVjA1uECi
	MK10r3xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAQe-00000007BKe-306r;
	Tue, 18 Aug 2026 03:23:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAQc-00000007BJr-0X8o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 03:23:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkbtp3882159
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Mj3SzAcaCvmOfibRhtunrb3
	JChcTu1mYYWf77aYRPc=; b=gi7yg6CS3RxGzgedATshcmJaiGXWKnB2gLVvLaXH
	hblFxCEsGbQ8T+Wfp5yRC73yoh0cDC2MmPHF5vmXT994rkU0z2erOup7s7coJW+T
	LarnShSR/xs71I+vPuRdYJN2Ti7V7Xz+Ahqz+qDd2yv5DW939Sc78whe+eDLzI0v
	Cpob1u2wVHwQ0GjwH5CYJwCzy073L0Ktd6hP8Yy1s8uttIomxS/7hXfFyVfZUAT7
	8OaAPCeptjLxrQDG+lWbWF48QMqc+5J/Egy2f0wF/j2a/JNkqv+sN1BjauysRPFQ
	J7G7MXFCpMDwiRqATI9FYOqwoR1Ze5mqJFVQcN5ogSsI9Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y77c7nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:23:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930a098ea19so560109285a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 20:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787023433; x=1787628233; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Mj3SzAcaCvmOfibRhtunrb3JChcTu1mYYWf77aYRPc=;
        b=BZgjbchqp+Uc64Ew55l8qm4Gng2mU7Ny1cucQ40gBWHx7i6aHWjncI4JuOjXeS8uhA
         1QY4jed1IHVxcmqISrxOV6a7VCC5q53Mu2Uzvb4c6SK1csOKe6CjiwPBC5OrlnTavFqF
         6Y+LqnXD0iDYrhgWrBGhkxH+UjdnRoW2l56JtTFLfFCpGXCBlLINVFK6AP/t5sQz8g1X
         tEonSpaGFKIcDsVpmNWX/o4QvlE45WlppwH5GzwMBxezLpGHuNfGO5/Y07P7CgRlT2rZ
         KnrmXwa+W95crC3KztQ3w1ZwPjCx8zGecYBCB5haPHiBNq4WFJBlYEwsPRzRUkPEXgXf
         cprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023433; x=1787628233;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Mj3SzAcaCvmOfibRhtunrb3JChcTu1mYYWf77aYRPc=;
        b=HTD3AQpLPlbGlO8Z7LweaZgRrnbNmcxYfq/UTRY5XFrh15UrJghYdLdq3lGCqeW8U2
         4iK56NsXIiTrGeixOGZxCywHdBL3SJLVSSDp1OS8j8Hi+coW9+5881GX6gw15D46gYuo
         MX3mm4ctmm64qrKDouC0ZN5a8I+SInSGatJ3sX7B3ck/WePqVvUrfi1YZSxAhox9wi3y
         LvffVJOpbwpWD64cZqeZrh0ub8TA4al+EhbrMQCkoCuqo0TsH3S6GSHRpTW7OlaUHIJd
         tjaeB5084ze5Ggo4EJU2MoXTY/ejE42RRmtM1lQUCVeDEz63W/vjcZAJMfL4rAe6ML8e
         ct7Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro0cG5T3oF1CWVTJIB8Ox7z7jOKFbyVpZbrdjFBbhSGK50OBZvC2jaS9V5DqazAsdrzPIUYniFuVMjN6t0P1x/X@lists.infradead.org
X-Gm-Message-State: AOJu0YwRE/HlTbtVuzIfS4x8xy4/zdaVYEtBVdC6Z80ZtU9LxjY5kXIL
	utbElv7HyLny0vg751Xq3APOIuzC8njdgCZveWaNg1XSnqvWVK4Wbiz3ZpngHf2ZnOCOs3g6xhd
	simq0EhlH5jFVhome11Qi//oiYEtQKbGxztGL0ooSoIoz72PH1cbZFlk4UKIYTYelL7QdOzFZWs
	ar8Q==
X-Gm-Gg: AR+sD11w67i1VZWBwyRULyzH0Wld6EzPiZW3X7IRXbdB9E9d2E4JWXdBawbWrK7cO1t
	YXeYclCrSGQxlQekQ+bFU/VLHbQL5gCZa/dRJn61GzSNriyD8YM8ZQZxkG3owgqbAWzduGO9OAi
	EGVcbHEijIPud70RMIzg4iI3+S4JeecLsApmO2L9q/Cfwjbx3oRAjPIbTctifEaSA1aQKJu3GDc
	4pxM1ytwkx33oMBkc1xTqklJx4XyvQqSeENPbFO9WTlEBdv0rnmGYlzD0FcRWouFDzXItTvuEEx
	To1Wi30dwe5qCoJuBOzHhLgxDte26v0eS8JXrbRgRWGoqHlYD5btqeHezV0iIUWXqUrnSfLiSNV
	2iumZymxbRnP7PshQI60mw8A1I2BO3Ti5ZXAZgInk8ZDoW7P5ejG7Mk4HkkefxGsJ+gcpxfCAqk
	6uaNVNMl/rR2Zo
X-Received: by 2002:a05:620a:1786:b0:936:cd74:4f45 with SMTP id af79cd13be357-936d232e6cfmr2796689285a.37.1787023432422;
        Mon, 17 Aug 2026 20:23:52 -0700 (PDT)
X-Received: by 2002:a05:620a:1786:b0:936:cd74:4f45 with SMTP id af79cd13be357-936d232e6cfmr2796685385a.37.1787023431954;
        Mon, 17 Aug 2026 20:23:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa096asm835514e87.19.2026.08.17.20.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:23:49 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:23:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 5/5] drm/msm/dp: mark the SST connector disconnected when
 MST is enabled
Message-ID: <ue75tcf5hwigfvo2pdcmkako2ovvgoxte5oeqs5an7fsupfqk2@oe2adzbdhv5q>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-5-646a10256233@oss.qualcomm.com>
 <sijdmdhcbxyg23gh6c62hspruvbnyqbdrtv2er3bh6n6ftolsp@b6o4khv6dofc>
 <96344518-c0d3-4424-804a-c315eab3e39e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96344518-c0d3-4424-804a-c315eab3e39e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyMyBTYWx0ZWRfXy9/mMIwHreWw
 XCv4uSnyxudjTgWxfv7MmBYKDtDodRrVxeTsCiCvsTQjgG6Zs0gs7Bj7cyf74sVoAyJgRytn6Bg
 1Pi1KioB/b0Y0LrLvaHbR7UfcKxrl6FYwVUf1luUnWzdXTq6F09d7yiFqOTFPrLdVx5JjeNLJop
 Am4qwOE9u/wlvcJA/wcN+1gNv6SXGrq31h3NYuussRSFInXrk/a5fzA0hwxoWDRoxYxTHFpm7Wd
 NxUj9T+F2FpON/ZLnzSaeXuSXyHGsofYWdIIxIapTuLB1VCuABgHNmUmvxmFFmG1uOjgT6Dzg4m
 ofmWJFAbWSnAkWtXCN33ELGF6Kw5FaXITVS71+A7BjkcQO/GGcqyXIWMTjXYvOHLhdd8pnI2TxR
 BYbzjxAZD+PG15YD0GOUvS+rz+3PhdVNVas+4rMmLzHOl19kQTQ1kME7eSRO1ld5KoOM/3Mmdb9
 TbCFcFo6wAMCrJvCZ0Q==
X-Proofpoint-ORIG-GUID: zYIewCySM_iTCac0tHGF9MQxp2368D0i
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyMyBTYWx0ZWRfX8x4rC+OoQyP9
 QKW9FCNjbaQlrXhWZkU6JtU04bQtDy02IiyKGmfyaHSUpxzdS1nmFwwI3Qhlrc1PHBS81CngRws
 WPACy0eaIG3ImIZ8Z5ylzTxRAeREye8=
X-Proofpoint-GUID: zYIewCySM_iTCac0tHGF9MQxp2368D0i
X-Authority-Analysis: v=2.4 cv=WNhPmHsR c=1 sm=1 tr=0 ts=6a83d049 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Q8SuEDP3D7tb5lYi7iAA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_202354_283246_0B75A06A 
X-CRM114-Status: GOOD (  28.76  )
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

On Mon, Aug 17, 2026 at 04:01:34PM +0800, Yongxing Mou wrote:
> 
> 
> On 7/12/2026 6:56 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 29, 2026 at 10:48:07PM +0800, Yongxing Mou wrote:
> > > When MST becomes active, the initial HPD plug notification updates the
> > > SST connector state to connected.
> > > 
> > > However, the subsequent SST connector detect path reports disconnected
> > > while MST is enabled. This connected -> disconnected transition is then
> > > observed by the polling logic and may result in an unnecessary hotplug
> > > event.
> > > 
> > > Set the SST connector state to disconnected immediately after MST is
> > > initialized so that the detect path does not introduce a transient
> > > state change.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 4ee391cc7165..f8ca60d6d714 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -352,8 +352,10 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> > >   	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
> > >   		msm_dp_display_mst_init(dp);
> > > -	if (dp->msm_dp_display.mst_active)
> > > +	if (dp->msm_dp_display.mst_active) {
> > > +		connector->status = connector_status_disconnected;
> > >   		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);
> > 
> > This should be a part of the MST series.
> > 
> Got it .

Also, you need to take the lock to modify the status field.

> > > +	}
> > >   	msm_dp_link_reset_phy_params_vx_px(dp->link);
> > > 
> > > -- 
> > > 2.43.0
> > > 
> > 
> 

-- 
With best wishes
Dmitry

