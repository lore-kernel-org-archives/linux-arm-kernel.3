Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD197CFC28D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 16:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ufeoh7bUM/nJ4GaNvnQRw4cWbujDEIpSOeuZ5ieZIV8=; b=gyssvErox6Q9xQLTl8rN1a8VXM
	cjIUXyuQVTLWdtFAyautocC8ICPpyHo717dxf1jU3xOpL9ycQDnQ3/p4LVgv8lSW+S4maWicR3ipT
	qFMDHd7N5DqwkV9uTofu/JKs/q+RI4Lcf33W3oMQwZVoedOvw+3fTbQG86EnATQ+4JnG+o4vPYx3Q
	X4BhdZm2yxUFuFlL2aaZGxKPe/R958GzvogFnDzZzWyS/83VCns+Uqwsz8oUu/mIkxQBoSDl2Wu4o
	zVxzrwh1wnN1Wrhfki8g1jv3GZInd7AyU0WKzHIjRcaFsG3Bauvo59od5HmO9wg7tP/TUTnkOJlNX
	+mYVaLDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTgB-00000008gJx-2HKo;
	Fri, 21 Nov 2025 16:08:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTg9-00000008gJH-29zr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 16:08:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALALUB72746321
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 16:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ufeoh7bUM/nJ4GaNvnQRw4cW
	bujDEIpSOeuZ5ieZIV8=; b=hIXXKixNU13SiX+lrJVmgBdkops/RLgPt5jtIm4X
	3ThhrPw9dH+49IIbUKhVU4Js8MKRhBc2fBU3eAoW80ztIiCFqJOo83GqCO47/vQb
	RrSSCCNObh7mXJCtGW+ytCRWJk5bfoMUcP9iyVFBTpw3uKJPmoER9ELDoA+X66zM
	NGJfo5NCYxOAUGtAaANZT7yEDz9ARwRWiwFKaHLToKMZjPk3pqQ2AvXBosWYSeQB
	bIhATxwCxXvQUsgvLYSIWE7v1Y+AKFeOcZdwPAxmunfjq2cFVQsdVXUOPWoV1WLf
	lKoOrYhjobYngek4mmU0vi4PpcLVf0MM2JCRThLtgWJETA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajgeh2apj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 16:08:07 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-55b2b3ef606so3788492e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 08:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763741287; x=1764346087; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ufeoh7bUM/nJ4GaNvnQRw4cWbujDEIpSOeuZ5ieZIV8=;
        b=YSkTa6RV7M5UHt5INCG5KGGY9HaC2CukoKluN8BFpXnC1cl6vtpee7aL6IA3TOxsZr
         BwVF+7nE8pDsjb0rtXxdp5fsLhCi/FF2pt+/vbgfxROaNL6XEuEL9cvIxdZVTE7FTjCm
         kXA3yKrJdTPZ0NoV0Xa0kJfpakyxVZrOw0jyNiq+g54LhwAx1/sQismgVZ3D0VHH3kYN
         oJjH2H4uRreD+vc3vwh6kmDUuShEPtHzZeLV2/lK0yZd7l87Q73Plng8T+tpl1FMsyGq
         3mG2wlzlFsUz3jrVHaUryoksQAY1daoBmCqePw380KNaNrHE6or3q6i5RLfSJWrpKklZ
         a3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741287; x=1764346087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ufeoh7bUM/nJ4GaNvnQRw4cWbujDEIpSOeuZ5ieZIV8=;
        b=APBvsFegS2n1jP2O5NFhwHL5uwn43WuFMnr3e5Yu8T1OnQpZ7whI4bcLMM0bgHQ66K
         FzoVuRJAy+TbBZxIA89yCgZt/AoUYAwr1ene+k/R6HPkZP7Jc4fCf2lrOSOepbqtZU2K
         h4NChVRSV2ttmtBxqlmW4vKpTVQAWdXKWa9AjyndAzOUkH+KcFLYdqhpIt4Z9diFDD+0
         zUDEzyLukeCZIh+ODqZrNJ+cWD3aeKs8DFmLQiqOLdPWNCXd6ML5+1tv/9Am/H7IXMx9
         M3Zw+/f7cH8i8DcFNqGu4A+LeIBl4sJ+UAx3W7wUZvCYUIAcDo/GDQ/LGERIuXQ6D6T1
         Ut2w==
X-Forwarded-Encrypted: i=1; AJvYcCVXfNf8KQ9uvgpBc3+QvVBskOHGk5dzVdc+s5W1R9MeSZ0FOGtFYF6M7M1FjMEObHS7OHkGEIespdG99xG2qNBh@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu+mPVwmru2OgyVR+to3rJz5ECYsuQhe9+ENJoRacvpiF8ht/t
	A2g0XQRA1L6BzP16w6ZygTJzcFTA0hHRMeIkCnkfURBjw+AGa5PQEvQPLVUFaW20qyTD3cbqMi+
	iQp6E2wYkeJ6aXWfzBVePuSNtJ7B8TBUpDTf3JchCS2bMWbkrCU1NkBhR87BaSYSgCpyFPEQFY4
	NqRw==
X-Gm-Gg: ASbGncse1Z9sGgf0DIPkkgzzUMnUIyTsD6Qqgw1WxbzDAQLTbzR3a0hJkkpGSQI1xKB
	1OKv0qMyp+qHl5ZSz1LaG3RFSHz4j3bVsIHfYxdqFsLmXpO8H3f7rj15lkcYVcAwNveNSqnobHj
	jtSCEUQPAWBvk1fnfAiVcZj7P0teJ6C8G/3kB1Nv1huFIyq7HIhQee2QXgAieISgBVAOv1N8IJA
	Y2fukFHxk4+CJW4WJBfuaES1+HjGO+R/O2DA4zLHTNRXyalWNoo9ytJWwYj5enCNbI167pnxo4v
	rb6CdrGts/4iO/ACYqzdxA96JNtGL+fydk0HvJCh8ZPzYmYOoWDnhWC5ZkmtGjOCXhs4oOXDCOr
	ldr9g3IKkoAumtvoJv6zgmF0EVNKscogBl7QpAFZTNoqmm0kyCkQx+PFbRvP2bf2VfayrYuJztx
	uFEHOPbPxeEo6bptYeU6FCl08=
X-Received: by 2002:a05:6122:2c07:b0:559:83e9:290 with SMTP id 71dfb90a1353d-55b81923b82mr2151496e0c.1.1763741287287;
        Fri, 21 Nov 2025 08:08:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVq7cAAt3X3C7SUO92wc6199AKDzCdd4I14oiTzCPYWOFGE06Zbz1JGXbXRXaOPE1XR2OH2Q==
X-Received: by 2002:a05:6122:2c07:b0:559:83e9:290 with SMTP id 71dfb90a1353d-55b81923b82mr2151424e0c.1.1763741286683;
        Fri, 21 Nov 2025 08:08:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbeea7sm1718367e87.65.2025.11.21.08.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:08:05 -0800 (PST)
Date: Fri, 21 Nov 2025 18:08:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
Message-ID: <5qncx5sww7feugjmtkskvoussd376rgxtcx3fqqgmgatjrdamx@iio4gxk2ildp>
References: <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-furry-singing-axolotl-9aceac@houat>
 <z333ysst5ifakomo35jtbpydj44epqwwn4da76rcnsq4are62m@32gsmgx2pcdi>
 <20250925-didactic-spiked-lobster-fefabe@penduick>
 <jfxtcvh4l5kzyv74llmzz3bbt6m4mhzhhwl6lh5kfeqgqhkrhi@jzfvtxpedmyf>
 <20251003-primitive-sepia-griffin-cfca55@houat>
 <54a06852-4897-4dae-ab9c-330d99f3bf42@oss.qualcomm.com>
 <5cc5l2dihgdbgnwyugelwrklpaiiy5yaczqllu4bi6asvlt354@kib3flskh34g>
 <ez6y7q4lgbwt7kpnlpausjpznckr3yyejrwtxm7o6qw6wlhqoj@6iypzdhfthzy>
 <eiaxss57hauegv64ek4ddi3ib5x4t4g4xwiqvuaj43b52wpctb@p63ewh6tqblk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eiaxss57hauegv64ek4ddi3ib5x4t4g4xwiqvuaj43b52wpctb@p63ewh6tqblk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDExOSBTYWx0ZWRfX1Gh07DGG4MTE
 x1rrNqk3Twoo/WoMV711uWOao/6Ex08NHmQHw5Rns6NrEz0o8PFMVy9RUgOjNFhTfgThtxahXeP
 fnvWTU1NP0Ct553moYyD7uWeTxot53lz/U/KZSHWtVmURvdr1fbKrJxBF6u17a7i8Em9fIU4KaY
 7v+o/k52Dd7f2otcTIngRgA7s8sqDrb27bQTHoI8m8hl0xnkIiCh9w8BRSlReQmXuspgxkjgSGA
 2qmKNWiXeARYr0bBlsA77PABv4eBQ9OTk7uAMnioKy7zzWNkHlZ6bvQjKWCJyvvB1xnhtxQZ1AT
 Uc9SuyEJ6bXX7q7ATQiwis5VXet8vEdLKwxCxyGVAiS/Y2FwQdBbt1M3F8H3dvzvemaAq38nFq3
 3zi6Rvt+iNMLjIVEA5aqOhc60sb9iA==
X-Proofpoint-GUID: CldnEMzVQOnlbQe2dK3oQJyvH9bFTk6H
X-Authority-Analysis: v=2.4 cv=AubjHe9P c=1 sm=1 tr=0 ts=69208e68 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=siajl1OzrqvGOPi-8wUA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: CldnEMzVQOnlbQe2dK3oQJyvH9bFTk6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_080809_715311_0F459488 
X-CRM114-Status: GOOD (  63.55  )
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

On Fri, Nov 21, 2025 at 04:48:02PM +0100, Maxime Ripard wrote:
> On Tue, Oct 14, 2025 at 07:02:03PM +0300, Dmitry Baryshkov wrote:
> > On Tue, Oct 14, 2025 at 02:43:58PM +0200, Maxime Ripard wrote:
> > > On Fri, Oct 03, 2025 at 06:41:58PM +0300, Dmitry Baryshkov wrote:
> > > > On 03/10/2025 17:23, Maxime Ripard wrote:
> > > > > On Thu, Sep 25, 2025 at 05:55:06PM +0300, Dmitry Baryshkov wrote:
> > > > > > > > As we will be getting more and more features, some of the InfoFrames
> > > > > > > > or data packets will be 'good to have, but not required'.
> > > > > > > 
> > > > > > > And drivers would be free to ignore those.
> > > > > > > 
> > > > > > > > > So, no, sorry. That's still a no for me. Please stop sending that patch
> > > > > > > > 
> > > > > > > > Oops :-)
> > > > > > > > 
> > > > > > > > > unless we have a discussion about it and you convince me that it's
> > > > > > > > > actually something that we'd need.
> > > > > > > > 
> > > > > > > > My main concern is that the drivers should not opt-out of the features.
> > > > > > > > E.g. if we start supporting ISRC packets or MPEG or NTSC VBI InfoFrames
> > > > > > > > (yes, stupid examples), it should not be required to go through all the
> > > > > > > > drivers, making sure that they disable those. Instead the DRM framework
> > > > > > > > should be able to make decisions like:
> > > > > > > > 
> > > > > > > > - The driver supports SPD and the VSDB defines SPD, enable this
> > > > > > > >    InfoFrame (BTW, this needs to be done anyway, we should not be sending
> > > > > > > >    SPD if it's not defined in VSDB, if I read it correctly).
> > > > > > > > 
> > > > > > > > - The driver hints that the pixel data has only 10 meaninful bits of
> > > > > > > >    data per component (e.g. out of 12 for DeepColor 36), the Sink has
> > > > > > > >    HF-VSDB, send HF-VSIF.
> > > > > > > > 
> > > > > > > > - The driver has enabled 3D stereo mode, but it doesn't declare support
> > > > > > > >    for HF-VSIF. Send only H14b-VSIF.
> > > > > > > > 
> > > > > > > > Similarly (no, I don't have these on my TODO list, these are just
> > > > > > > > examples):
> > > > > > > > - The driver defines support for NTSC VBI, register a VBI device.
> > > > > > > > 
> > > > > > > > - The driver defines support for ISRC packets, register ISRC-related
> > > > > > > >    properties.
> > > > > > > > 
> > > > > > > > - The driver defines support for MPEG Source InfoFrame, provide a way
> > > > > > > >    for media players to report frame type and bit rate.
> > > > > > > > 
> > > > > > > > - The driver provides limited support for Extended HDR DM InfoFrames,
> > > > > > > >    select the correct frame type according to driver capabilities.
> > > > > > > > 
> > > > > > > > Without the 'supported' information we should change atomic_check()
> > > > > > > > functions to set infoframe->set to false for all unsupported InfoFrames
> > > > > > > > _and_ go through all the drivers again each time we add support for a
> > > > > > > > feature (e.g. after adding HF-VSIF support).
> > > > > > > 
> > > > > > >  From what you described here, I think we share a similar goal and have
> > > > > > > somewhat similar concerns (thanks, btw, it wasn't obvious to me before),
> > > > > > > we just disagree on the trade-offs and ideal solution :)
> > > > > > > 
> > > > > > > I agree that we need to sanity check the drivers, and I don't want to go
> > > > > > > back to the situation we had before where drivers could just ignore
> > > > > > > infoframes and take the easy way out.
> > > > > > > 
> > > > > > > It should be hard, and easy to catch during review.
> > > > > > > 
> > > > > > > I don't think bitflag are a solution because, to me, it kind of fails
> > > > > > > both.
> > > > > > > 
> > > > > > > What if, just like the debugfs discussion, we split write_infoframe into
> > > > > > > write_avi_infoframe (mandatory), write_spd_infoframe (optional),
> > > > > > > write_audio_infoframe (checked by drm_connector_hdmi_audio_init?) and
> > > > > > > write_hdr_infoframe (checked in drmm_connector_hdmi_init if max_bpc > 8)
> > > > > > > 
> > > > > > > How does that sound?
> > > > > > 
> > > > > > I'd say, I really like the single function to be called for writing the
> > > > > > infoframes. It makes it much harder for drivers to misbehave or to skip
> > > > > > something.
> > > > > 
> > > > >  From a driver PoV, I believe we should still have that single function
> > > > > indeed. It would be drm_atomic_helper_connector_hdmi_update_infoframes's
> > > > > job to fan out and call the multiple callbacks, not the drivers.
> > > > 
> > > > I like this idea, however it stops at the drm_bridge_connector abstraction.
> > > > The only way to handle this I can foresee is to make individual bridges
> > > > provide struct drm_connector_hdmi_funcs implementation (which I'm fine with)
> > > > and store void *data or struct drm_bridge *hdmi_bridge somewhere inside
> > > > struct drm_connector_hdmi in order to let bridge drivers find their data.
> > > 
> > > Does it change anything? The last HDMI bridge should implement all the
> > > infoframes it supports. I don't think we should take care of one bridge
> > > with one infoframe type and some other with another?
> > 
> > Note: I wrote about the _data_. So far the connector's write_infoframe /
> > clear_infoframe callbacks get drm_connector as an arg. The fact that
> > there is a drm_bridge which implements a callback is hidden well inside
> > drm_bridge_connector (and only it knows the bridge_hdmi pointer).
> > Otherwise, the bridge, trying to implement drm_connector_hdmi_funcs has
> > no way to go from drm_connector to drm_bridge.
> > 
> > The only possible solution would be to introduce something like
> > drm_connector_hdmi::data (either void* or drm_bridge*) and use it
> > internally. But for me this looks like a bit loose abstraction. Though,
> > if it looks good from your POV, I agree, it would solve enough of
> > issues.
> 
> I'm not sure I understand, sorry.
> 
> What prevents us from adding ~4 functions to bridge->funcs that take the
> bridge, and drm_bridge_connector would get the connector, retrieve the
> bridge instance from it, and pass it to the bridge actually implementing
> it? Like we do currently for write_infoframe and clear_infoframe
> already?

Well, we discussed that having the write_foo_infoframe in the
drm_connector_hdmi_funcs means that the connector supports that
infoframe (and it can be used to e.g. report errors). However with
drm_bridge_container, we need to set all callbacks in
drm_connector_hdmi_funcs, even if the underlying bridge reports them as
unsupported.

Am I missing something?

-- 
With best wishes
Dmitry

