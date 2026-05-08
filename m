Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E52CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 12:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=In49/1HCdY0mp+ShQ8tlA4tTXudR8PGllAHcd0hZ7Sc=; b=WzcXk2aeObq90EelnGJzawP01Z
	XbOKsumpETRoh+q5tboWXZhpAknJxMroUuh82AIMu3j/5h6jRiTsCbl7sTdiigaE3P16Z+tR53YWV
	d8zTKUCfI4/og4EWmhEQ8sntC3XTRyds49GvehKMFaKFzU0TrpdWVCP7RM0rrXdUrFLkRkyH4v1Pb
	6Coo5V42U13txa90ahNZLDJ4pKYBqnN+6Fz0ZtUTAQXvXLiNzkGFmHm6Nm9gD3FYbtYGnyyaUDRho
	09MC+/CKQZK3ObIvuPNRZQtof3PYc4M2IOr/Ogx++tKN0a8fIGKh8W5f/2xL7ZHAclHnQKBHI9I1F
	SfIwhdLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLK6M-00000006RUY-3FNX;
	Fri, 08 May 2026 12:14:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLK6K-00000006RTU-0LX3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 12:14:41 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64872mt91062270
	for <linux-arm-kernel@lists.infradead.org>; Fri, 8 May 2026 12:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=In49/1HCdY0mp+ShQ8tlA4tT
	XudR8PGllAHcd0hZ7Sc=; b=oZrz2XsQ3iZv6f+hTcT7U1Ab+sy8McNKW7I4YJwn
	0dXWt1F9plOou+Zdx1J1ZtDG9/tjqfSqR5D8G7GzTCyXgKFllC3KKBCWq7SLv7Kg
	w4b3BEo3G/CxY5z9B4c3NFZFVJ5GiUkKs2RA1l5c7P1QfJtAZ1AO7ZEd6ggzK93J
	ooXS2FD4/P7M8aAvSghEnyo/Dluo7JC0sy1UvjLlJrDm4BRydEd8VQqsYiUgRZCQ
	5CV3ZTeSz/GZ2Lves8D6V7ekk1CSiwtOmIGdR6TK/Tb+8GZNeAX9Nh8G7CNzjSz5
	Ie838JuRUlZLStKHN21xlZJhKqj0iGbF3D1SU1AmtRek+A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1b3fh56q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 12:14:39 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6314d30fcd2so3841137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 05:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778242478; x=1778847278; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=In49/1HCdY0mp+ShQ8tlA4tTXudR8PGllAHcd0hZ7Sc=;
        b=Llbcw7QGJVTdRIaCcYf32jf4y6zVhKg6w1X2wVVFcp9Tm00QeiQureaLJrNJmjc4S/
         mSgaryrNN5GFoCpu31912wE84578+hb4NPQfeP5IMj0xFNPNboRUWuqzFftFpFc1LFg1
         CVVKMaSLAjUHztbjz9CZ/XxVpec2AmjewvJVjNG/VuI+Vqf/8uXgHNgev0WnVgjzIXs8
         /LbRxmcL1V7WqHSgcG81HoisYZdUERw4lNU+bCBCz+V4qr5urHc7mFm7XVHrhgJJ7UKO
         7punet0J4QuztmQiL6XUqSaWlKyRQRT1AiLjAp9aahCFrbFBBSihKQnLLxMSupI0QgSZ
         jUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778242478; x=1778847278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=In49/1HCdY0mp+ShQ8tlA4tTXudR8PGllAHcd0hZ7Sc=;
        b=S/7nGE5AIYQMgH+66B4aEM8dlormywsYgiqyxFT5g4grP9ehTgXWvlTYLJv74/wSZb
         bQ6uGKNFmcWIjQ8vpXK822ocqql9tpbS1z5sNcSMiCAZ+LxWD3f8p6E5ep/Ivr68h++g
         7X2+WBMPeAG6bZNqcHl6cezoW+Tv3cVWLAQRedvEvY1rG17K7AFJKA7JZ+a5iAipZm2f
         mx4o03oc3iUqslQkUKi8eN7rI33FEgyo6GVJYDghkIwkw2ZUQojoBCH1AudsM7W5LfDy
         z8QcWUgj3toy6k2PjV/4CfWOXBDZDZ+Elc0QmTqgTn/8+2r6eeFr24LrkURnO8Os+KnN
         /YUg==
X-Forwarded-Encrypted: i=1; AFNElJ823jLv67iO/O5UBrycvyLO+PlZtBrCpKqk1zjxM+0xtCp9qv6O4MiLFg/TvqrtPJb0CE0SKU0Dt7Gi0e/eytNE@lists.infradead.org
X-Gm-Message-State: AOJu0YxlR2eYn5yZgOIYbNe1ZhdAtKdExeLvyGYvmayRFOcSrwMjEa5V
	5O1Ac9BIwdnWaDlPuFZ+I5+ZtOSIg8JAvKXXhtm+euDjjahQ0lj5zFWvn3yqXgrS1m+t/q/DoTg
	0CvUSK/B7HLlNA4L2gEHpQXve38BGNvfjg+XKzBYTiBuccpvf3d4gDpcCPUTUcYbjuhZ+Hinq6Z
	21xg==
X-Gm-Gg: Acq92OF/OiiJWqEjR9nMdXfAW7MNWXmmc/cd2oslqWNWIo0s8EVKIGRjLf8/DejplC6
	exH1Hks2Rd0e58NbG1CLIqE4GjajioQyHhlimhsPF2Iz/Hog4UhMfRiCTC4EBhkDuvmyXX4k1fz
	d5SvcemNBtfwwSCUOUhVF+rHfI6mqkSq+vEvIAUtgh1LyxociZ9mqQm8Tj9hBuB0RLYOcejz4eK
	7rZ9oM/lUksLO6pyhrb+oLyrS29ttb8jDzigOnFPThtz9/ymOeguXdE7fEFP76cRStLdy3uxW/6
	Qy0gyolyhs6xI9eIUnP1Ox/BbHnaBK662O1RQzNVJw0lzZDCePcK8InJOk5tbwSgMjEd9fy6QXr
	t14fz7rP/2tmIutHmW5VGqg60/+oPZyGNhd1ZUXP9osC2DpIblbmVvcL+iAYuaRhuB/8mcgIDeZ
	dLOv57zcznlxKnZwHSlGbMp/pNlh39cKtk3wg=
X-Received: by 2002:a05:6102:dd0:b0:607:4fde:1921 with SMTP id ada2fe7eead31-6313eb08909mr674061137.24.1778242478143;
        Fri, 08 May 2026 05:14:38 -0700 (PDT)
X-Received: by 2002:a05:6102:dd0:b0:607:4fde:1921 with SMTP id ada2fe7eead31-6313eb08909mr674046137.24.1778242477632;
        Fri, 08 May 2026 05:14:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d2f2sm478339e87.28.2026.05.08.05.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:14:36 -0700 (PDT)
Date: Fri, 8 May 2026 15:14:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Junzhi Zhao <junzhi.zhao@mediatek.com>, Jie Qiu <jie.qiu@mediatek.com>,
        dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] drm/mediatek: hdmi: report jack plugged state from
 bridge enable/disable
Message-ID: <mv5qeardy5xy5657hb32ewkwg3gmgll3kow4xuhiklswnmj2sc@mhncl5reoqlc>
References: <a3e22cbae528c9a38d854a586d1736b860998d41.1776265222.git.daniel@makrotopia.org>
 <c4d62fc2244fb72207855c5a366ff10fad419f2d.1776265222.git.daniel@makrotopia.org>
 <lhxivpwo6aq3ehgzsnkgxnqis5tptmey4dtbhaokyckkl7ghbn@dzaj225pnpk3>
 <afyUfcr8HuFs6EKF@makrotopia.org>
 <v343uqdgy65yg3lm7rcv57mlpkudqxrnori6lnunaiiewakhyd@wnxkqhhwwvgg>
 <af3Ml252DaeyXzwe@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af3Ml252DaeyXzwe@makrotopia.org>
X-Proofpoint-GUID: KRT_S0eDBIlQeus9dT3RNlm3V234YDYv
X-Authority-Analysis: v=2.4 cv=YMOvDxGx c=1 sm=1 tr=0 ts=69fdd3af cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=nwvF3KZO1n6Oi4RS03UA:9
 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: KRT_S0eDBIlQeus9dT3RNlm3V234YDYv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyNyBTYWx0ZWRfX4MbUh1UcOjXS
 z7K9uOKw/TMdq95Auj1J37ejRRenWpDTuqQFXYW808HgLV6n432ubbL5yo25QElzIw59I79bPXS
 066W3HkIleR4rg3UVCgkexfWlYJ/dw+XwMhDtR3e+NFVeXDPxMF7t+8UtVBGFev35mxNiN/R114
 H8OWprnzTIYYv0TfnJoD+7FVwvGPT6MtFnlvhZn7N9Ml6/BAN8dQ6mj5d7CGw2XWHO8eR67XK2B
 C3rjbGDzqy/vT3Z0v7U0xNcORCUyx15BztJjKsZdnQJrOlTo/1jI1RvUO0uktDu3YJ2uB+cvJq7
 UsCrt3n7GcSzxdhMfwBRBQOwiSFLeobQBERdpoRUwnppfWxFjXhgQtWDfGoNxyKuvImN4VWPSQ5
 oOqCeX0thIkZxb2dbcH0MsuFVndsxuP0YUfmhQSHQKZofMXEcfJiYZ6pviWt1EqDX9i/ewdVEVN
 nAI/J8aRRg1yv1Um4TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_051440_128003_B21D6057 
X-CRM114-Status: GOOD (  32.18  )
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

On Fri, May 08, 2026 at 12:44:23PM +0100, Daniel Golle wrote:
> On Fri, May 08, 2026 at 02:29:29PM +0300, Dmitry Baryshkov wrote:
> > On Thu, May 07, 2026 at 02:32:45PM +0100, Daniel Golle wrote:
> > > On Thu, May 07, 2026 at 12:51:56PM +0300, Dmitry Baryshkov wrote:
> > > > On Wed, Apr 15, 2026 at 04:04:16PM +0100, Daniel Golle wrote:
> > > > > Notify hdmi-codec of the current sink plugged state from
> > > > > mtk_hdmi_bridge_atomic_enable() and mtk_hdmi_bridge_atomic_disable()
> > > > > via mtk_hdmi_update_plugged_status(). This matches the pattern used
> > > > > by dw-hdmi, which invokes handle_plugged_change() from the bridge
> > > > > enable and disable paths so that ASoC jack state stays in sync with
> > > > > the actual sink presence across atomic commit cycles, and not only
> > > > > on CEC HPD transitions.
> > > > > 
> > > > > Userspace audio daemons (e.g. pipewire) rely on the jack state to
> > > > > route streams, restore per-sink volume levels, and recover the last
> > > > > used device after a reconnect. Without this, those transitions are
> > > > > missed whenever the sink change is driven by a mode set rather than
> > > > > by a bare HPD event.
> > > > 
> > > > I can only hope to see mtk_hdmi to migrate to DRM_BRIDGE_OP_HDMI and
> > > > DRM_BRIDGE_OP_HDMI_AUDIO...
> > > > 
> > > > I think the correct timing was discussed several times and the overall
> > > > conclusion was that the correct time is when the actual HDMI cable is
> > > > being plugged / unplugged. See the discussion around [1] and the
> > > > captured response of Mark Brown.
> > > 
> > > Thank you for bringing this to my attention. I'll follow up on it.
> > > Meanwhile, can (independent) patch 1/2 already be merged, or at least
> > > get reviewed?
> > 
> > 
> > The discussion that I pointed to suggests that the patch is incorrect.
> 
> I understand that patch 2/2 is incorrect, but (the independent fix in)
> patch 1/2 as well?

1/2 moves plugged updates to the atomic_enable() / atomic_disable(),
which is not correct according to the discussion I pointed to.

-- 
With best wishes
Dmitry

