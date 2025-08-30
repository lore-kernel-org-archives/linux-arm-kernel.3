Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E157CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 22:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNi6qlMhUO/dlDLKPCpe1EohMUP/BhLmz8wF/QSm9/A=; b=aMBSam8BUcMvNBcay/afsYGBgN
	luBO249rmUJEzRlV/VHxlBtoqKnLLk5UO9MCDVSck3zYtf4BDT6vVD53sPQZZmlDCD/gkDOJws6em
	BxjStTOjyLsf1gfUjLGOjgWG1kQSxXsCe4/Ez5qqru4KvcbBT6p+ZFUfz4VXPKP3H7OcSa3n61Yjo
	RxPIDfzfnC0hA4rVmVKCP8eiA7ewYF+8arIE1bMRf1Yp7GN8BidSEi8MyU2Lfy4BxcCQ/AAJ68l1z
	4eatwPhrVpZh610NPcXPshEcz1BINmVxZTqvgnXu8w/OZAYA/Plt54LvRLz04kDxPI1zZnDRa8aTM
	OrFtkWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usU7G-00000008UwI-1Qr3;
	Sat, 30 Aug 2025 22:32:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usU4V-00000008Uhx-3xME
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 22:29:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ULBgIG015918
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 22:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GNi6qlMhUO/dlDLKPCpe1Eoh
	MUP/BhLmz8wF/QSm9/A=; b=i3GnX8W6MzF7/jJqLQfusJdMEK+lmRXnmxPfHHY1
	JPvU271NEVX0/v6y7ODjamnq+H35oviI2R0naUJNBJpMjQ372GejEdRgYAaVwriD
	UuP6g6EZHnfjp6jRkib7fwem4DSzBXnuwGFWs8Bx/dKken7qgT+Q47BDBEnHD/fW
	AOjVS77HhoxWByxt9zCkSoPxghyGfIfk80XXJk/y483CHjFMaGP4kjQ/AcYT6ciI
	i0qD3LFPO0B/sa8mnRCx5iomQnAJyXkhrVP00urFpwzbtyFGPxJgQ03tWBSnsQAX
	T1fqATL+5HD27JlCxMLfLyKmM7EZNQWozZhMbvA9sqGkOQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvys8qa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 22:29:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70dff062d38so40149806d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 15:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756592958; x=1757197758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNi6qlMhUO/dlDLKPCpe1EohMUP/BhLmz8wF/QSm9/A=;
        b=bgS5ok4fx08Tu4SY6iWuryOxyHsPnfD6LNoqsme1t3DlBF6tD3/u+UluICUXPJ6UJl
         DwOOr0gOW8bCiSmMXmycaVd2sanQ9BuuJ4sBBJhL4V8QjRULyGV+BDBxau3XMDj7fqZt
         mtKUz877ixTOFruFl/ErcOi4Qst6qwMt+Pz/OTrFJku9eKypXIT64dPYrGjRBrHaXw7M
         fK1/2b3OB3SNif6DJVq1iYG6FKpc48SxhOGfTdtKhF21hlTSZXj8O52VFtnwKt1HXhsL
         YV8Jz6JXi4enP22xPFIQYuVwQn/wyR1qGUoRCEIAwbHgsOI76ZT2zFHR8hHi6HlGtv74
         j46A==
X-Forwarded-Encrypted: i=1; AJvYcCUzqGyCdXWqFJ9Klz7QqCO7rXUc+1n1Z2ighYPm7Lamdnb1RR0E+JP4AHfC+ujWMDZEz5wimtvSFKKCxpc8SkTM@lists.infradead.org
X-Gm-Message-State: AOJu0YwuPvKKT+iqpWImuYtL4i25BskQexc3wTlO4tJeMpOH170Zqlu4
	yJeOmwMVRArrSPTM8eLL68uKW/4xVNrt5lPuU7PXhNYpJdaVq/ZildUNu/j8eFZ49UNnzQwv29H
	rsX80KB5fDABjiNdQdcTep+u3gIsFN4PakPHgWqttDPV14+nB6yy/mPuBA2QIo9/fHs/vvq8xBB
	6t9w==
X-Gm-Gg: ASbGncvlJtwAImJg8S2uNlHEMkoZzSb6F8U6NsEnOtFZdTeWIado7se4pdolzeRkzrz
	O6dcXR1drAvLgiL0bNaF+n8LF1XyiWSecfpg1MgD92dVVQPRVEVZGVlXBG5I/dnH/jeVTfPCTtY
	fihkKUYaJHD4j6SOTlBiLfA/ekBSHgGgLAE9TwNCIsWaPRxrBCMhHs1FZeh/xWWefzeu6p5Nv5C
	DisrwV/lAP2w6rnrNX52rPwmymkUd7zKXFX2J78tlfoo+pqsqiAqoJn7gDvzD+nOuR4F5MO0p6R
	cgxp0G/KAxmAmKgI3yUCD4XXrt7AizXRECNYaTZg/tPzgdvBWh/bRUtoaMQIkN3kdqmv9BxISbB
	9xZYSs2JJ8iy9R3AU/D2TPxQw2j+fkmBVCj1zXqfCNQX5qcGtRueZ
X-Received: by 2002:a05:6214:21cb:b0:70d:c6b9:c256 with SMTP id 6a1803df08f44-70fac94115cmr30677686d6.58.1756592957755;
        Sat, 30 Aug 2025 15:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaqdCzqqQwp+xBjOwKvWSPX4p3qiZ0ZzV9L7+TYukjcGa33kntlWRwDlkYGow/owafc/jjnw==
X-Received: by 2002:a05:6214:21cb:b0:70d:c6b9:c256 with SMTP id 6a1803df08f44-70fac94115cmr30677306d6.58.1756592956994;
        Sat, 30 Aug 2025 15:29:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336d0e3f3absm4929391fa.37.2025.08.30.15.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 15:29:15 -0700 (PDT)
Date: Sun, 31 Aug 2025 01:29:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
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
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
Message-ID: <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
X-Proofpoint-GUID: jUFZLpb5IwGEaGEhgxLs4zH9c7OpNvSo
X-Proofpoint-ORIG-GUID: jUFZLpb5IwGEaGEhgxLs4zH9c7OpNvSo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfXySXFthhfuR1C
 y8k4SC2MFmMpMEIMS800Zuz6ND+Tt5bgA0MM6lbeqcSd1aEz1JyNFRCtk6ITQ4YLhJa/GsDe6rr
 8hXucG9U9ZGwlI2XWglBaP3MslsdESv62ONw0luSAKAJKET9NATi0fyQHfQ5mWimqvcDXus50AB
 GVXh/HQPXdc717x+/bYINF9TdTksd9kr5n/OvkbvcmnQNf3hPM09xCl6v41ZlPnTT9LKRYjD1/5
 GJy9GsudvhkH/FJhrFLNVmXGjfVMvIII/Gl+WXBS7p6Msb56pH5jpTWZWY4+otDRXuyjQGMLlIN
 Jrj4cqiNkv+l3MoroA3bhRijytY545CpDVT/782P8qlxDLDSobNv6e9aL2uoEHfMQRyD0yr5/oQ
 hIC1OIVV
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b37b3e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=eLVs-IFDZWC_gK9YM6cA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-30_09,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_152920_101855_F7EC915B 
X-CRM114-Status: GOOD (  31.15  )
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

On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> Hi Dmitry,
> 
> On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > It's not uncommon for the particular device to support only a subset of
> > HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> > a model of ignoring the unsupported Infoframes, but it's a bigger
> > problem for the userspace: we end up having files in debugfs which do
> > mot match what is being sent on the wire.
> >
> > Sort that out, making sure that all interfaces are consistent.
> 
> Thanks for the series, it's a really good cleanup.
> 
> I know that dw-hdmi-qp can support _any_ infoframe, by manually
> packing it into the two GHDMI banks. So the supported set there is
> 'all of the currently well-known ones, plus any two others, but only
> two and not more'. I wonder if that has any effect on the interface
> you were thinking about for userspace?

I was mostly concerned with the existing debugfs interface (as it is
also used e.g. for edid-decode, etc).

It seems "everything + 2 spare" is more or less common (ADV7511, MSM
HDMI also have those. I don't have at hand the proper datasheet for
LT9611 (non-UXC one), but I think its InfoFrames are also more or less
generic).  Maybe we should change debugfs integration to register the
file when the frame is being enabled and removing it when it gets unset.

Then in the long run we can add 'slots' and allocate some of the frames
to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably be
salvaged as another generic one)). MSM HDMI would get 'software AVI',
'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
want to use). Then the framework might be able to prioritize whether to
use generic slots for important data (as DRM HDR, HDMI) or less important
(SPD).

-- 
With best wishes
Dmitry

