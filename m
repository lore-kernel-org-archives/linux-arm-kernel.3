Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43DCCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 15:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puSANwQMuC3k5u9lWMb//CpMB7GZAwNZLvNRyhx2W3w=; b=psbPO5wxCIsBlY15CUN1ZE8xM5
	s80w1CmpkH03YMAAut63Md1RhFffMkQcEudb5ZrylTgdVlQNRciSf4CvK7fZZ4xgv3xxPvBMJdAka
	JQX8THrh+EiPWRHDRwxkjdQDe983OiztPiD09JgVX0CO0QNm2+/OnyvRby/531hoveB5Sr2o0Mzdp
	7RhVtEDd14o5Q6zSy7BguK8zL37YUw1UIf2Ca6A16bqOtJfaw7jAfnLFuxxBAkissaAmGKgoTUXwu
	6eGDm7kE8XdagCWWksjtfCc3QLT6QnX4epxWJw1mSMSXAUUbTrYag6z/LyKTz/VG2nL2demTGT10y
	K7u7PBlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwMiw-0000000F6Dx-14uz;
	Wed, 10 Sep 2025 15:27:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwMit-0000000F6CF-216a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 15:27:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgSk3011801
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 15:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=puSANwQMuC3k5u9lWMb//CpM
	B7GZAwNZLvNRyhx2W3w=; b=jnBs/seSfYzHK1BgVJGtb+niIIAFKhQTmCGWELls
	0vNK/c6eC9FjQD2y/BHG40XZutlLZni1IPrNgq2q++P8+77GYQvZ3ZzU//CRJVbw
	Vbf4JA6udDwpsjsRVWZYPeElIUdwJnJkxOIOBl+dgMEe02YseIY7dgqKYLTF4gvL
	+o9VtQoEDQmaavzLGESvWGoTi+YfG97Zj/qyd6ePc//7IAysNf9AKwgT1N+GllDk
	q87VUrxIEG61wur7PXKm6pnHFHSwFlcZwHpGQvfGDWOz9NLaY9Hk0kGkzw7cugH6
	Mjyb35NfPWbzU1AhBQ7eMG3YA9hRBM7AzZ/vOwVrzMBjYw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0v83w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 15:27:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-724ee8d2a33so145411136d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 08:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757518021; x=1758122821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puSANwQMuC3k5u9lWMb//CpMB7GZAwNZLvNRyhx2W3w=;
        b=di3EcLLuVIBmSpIxe+uiEYJmjB1JVKnqP+sEzNMB8ZLqYTvnONycXhfv/RLTCGV0FO
         WmD9BUb9jCv/soF3FGzjFUtoXuSi6q7uKSQqs3mC4TMZwk8iqJ2Hy8RlPbDiHgDIMBhc
         nryb4gZHviwtsJ8o6fBeprWeIfajazQgHHH6GcmH/8APkQAmEKtD7cMEm5JB9sLec54g
         aBZ7rCNoP+sB3K5lgYO/KpHNF9+hZeQJGzZBxIHNrraT4QCmVQ3cCNoDqim4valCsUrz
         HYXcm71pODPNZL/WQc4tBU0zpceyqoQpPl6tlUhhfnASUXAbDQbhhOdRBlhPDdVmZqDL
         +jsA==
X-Forwarded-Encrypted: i=1; AJvYcCUqNk+zYBZtDbSLeb7NCSlbdTKh/cS8m+kut8/fsEglEYAnrJZsCe4QoijjFJE6VpAKkG+W+aNYLA3mjjxK+KTh@lists.infradead.org
X-Gm-Message-State: AOJu0YwItSbueI0vb2Df1t16U6Q7fonVFjy48V6nBoiKQ5iDHiNEvFfC
	O2sn6yZl5ybhWMGW687L2SmzZmkmfy12iw6ul73wPC/V07DHIG39CTqpkL0lXBza5XN2R/DTtb3
	vT3nzcvzufyprLOD6Gw1qabdYGHXkzB/hEMvV/PEE0HWpkrtusR84NKP3wUUwLu/TANeYomc67B
	qM0g==
X-Gm-Gg: ASbGncvmphBD/wK16Bc/R+Ed7iR8Sqvs9MUXcyVHhCfXymcBGBrzOy69eW5gCjMy9D2
	J0qMj/VjKW2OP4Vd3wd2+b41BkQh+ZPq/ZTgkwdUUgCQj3DV5kkz4SBXKfKUW9pRwtQJzZTCA1J
	cjj6bWE7jRuLnOue7bBAuTSN5D3N7KpG473msg1f6dNrXcrjoqxtImVMBkON7E4irvmq4CzQ4yx
	uP/o1Ks5lKMGrJ164v8jTnAjB+U+ReN5LjRQk7opBtJn776RsiaNmgVUdqBtRtd/yeemRok0vJS
	LrmKpORa6kgKbL2k9Y362X8P81Sm3A9FXAlmqGh2V3vudlwB3z3lrPpEzsci5tdY14r1mF/gzad
	KyKTeV8qPMUpoYFio0sZnffWqvwZxHceCpJbhmAtf7DdW8AOjWr71
X-Received: by 2002:a05:6214:4011:b0:71b:9c1f:cf12 with SMTP id 6a1803df08f44-73945f32dc1mr174306166d6.58.1757518020646;
        Wed, 10 Sep 2025 08:27:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSqNO186cIoAHAKlnokZkMKBuXP5cQFNS2RrYtd4hs3FssG7kXyhj56TM6QwnKBI2jq/m+4A==
X-Received: by 2002:a05:6214:4011:b0:71b:9c1f:cf12 with SMTP id 6a1803df08f44-73945f32dc1mr174305236d6.58.1757518019762;
        Wed, 10 Sep 2025 08:26:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f50a263esm43434641fa.55.2025.09.10.08.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 08:26:58 -0700 (PDT)
Date: Wed, 10 Sep 2025 18:26:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Stone <daniel@fooishbar.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
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
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
Message-ID: <x562ueky2z5deqqmhl222moyrbylfwi35u4hb34dpl3z52ra4c@dyw4iayrewnz>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
 <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
 <20250901-voracious-classy-hedgehog-ee28ef@houat>
 <voknqdv3zte2jzue5yxmysdiixxkogvpblvrccp5gu55x5ycca@srrcscly4ch4>
 <st6wob5hden6ypxt2emzokfhl3ezpbuypv2kdtf5zdrdhlyjfw@l2neflb4uupo>
 <pe6g2fanw65p67kfy5blbtiytngxmr6nkbazymojs4a66yvpl3@7j4ccnsvc6az>
 <20250910-didactic-honored-chachalaca-f233b2@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-didactic-honored-chachalaca-f233b2@houat>
X-Proofpoint-ORIG-GUID: l5DFykSas4U1uC26F7oW_M-Uc52IVkwG
X-Proofpoint-GUID: l5DFykSas4U1uC26F7oW_M-Uc52IVkwG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX9CCaxaM7OfN0
 7CuxrYdZTmlYfyCLysI+bG9J4udwVb+zBIFC5Da1GmHXz/5DX+jE+lYVROJ2/p8V66mF19rJUhB
 imqTmLaZHycdVba0iPFtPUkhz6Pirugo2YjoDhA5bOpyti75PH2jtl9wRP3lEqps2f2ejlqfW7H
 z577c+qwV3hwXdoD2F0sjyT2+ZF/Ihpcpj+/TZutKwH7Z/YBkA1C9wfpQAtfps5uzZN1RPK3tNH
 HQxD9LDhhlfNryTwzNkL+asB+ogKUNFk6qCMnkqbGqszo7aQhch3LU8nJWEoO3LaAKlvgWqIoS+
 fnS09lKwaHvmQI/d7mj4EmcXsTDpndZw4L5R9VY41yQ1Hp2gSUozgcUySJIvjrtr1X0V43+SJVW
 CvAF6vVf
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c198c5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CmvywbfrPJ7p_AD0WAgA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_082703_641388_40016663 
X-CRM114-Status: GOOD (  73.73  )
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

On Wed, Sep 10, 2025 at 09:30:19AM +0200, Maxime Ripard wrote:
> On Wed, Sep 03, 2025 at 03:03:43AM +0300, Dmitry Baryshkov wrote:
> > On Tue, Sep 02, 2025 at 08:06:54PM +0200, Maxime Ripard wrote:
> > > On Tue, Sep 02, 2025 at 06:45:44AM +0300, Dmitry Baryshkov wrote:
> > > > On Mon, Sep 01, 2025 at 09:07:02AM +0200, Maxime Ripard wrote:
> > > > > On Sun, Aug 31, 2025 at 01:29:13AM +0300, Dmitry Baryshkov wrote:
> > > > > > On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> > > > > > > Hi Dmitry,
> > > > > > > 
> > > > > > > On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> > > > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > > > It's not uncommon for the particular device to support only a subset of
> > > > > > > > HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> > > > > > > > a model of ignoring the unsupported Infoframes, but it's a bigger
> > > > > > > > problem for the userspace: we end up having files in debugfs which do
> > > > > > > > mot match what is being sent on the wire.
> > > > > > > >
> > > > > > > > Sort that out, making sure that all interfaces are consistent.
> > > > > > > 
> > > > > > > Thanks for the series, it's a really good cleanup.
> > > > > > > 
> > > > > > > I know that dw-hdmi-qp can support _any_ infoframe, by manually
> > > > > > > packing it into the two GHDMI banks. So the supported set there is
> > > > > > > 'all of the currently well-known ones, plus any two others, but only
> > > > > > > two and not more'. I wonder if that has any effect on the interface
> > > > > > > you were thinking about for userspace?
> > > > > > 
> > > > > > I was mostly concerned with the existing debugfs interface (as it is
> > > > > > also used e.g. for edid-decode, etc).
> > > > > > 
> > > > > > It seems "everything + 2 spare" is more or less common (ADV7511, MSM
> > > > > > HDMI also have those. I don't have at hand the proper datasheet for
> > > > > > LT9611 (non-UXC one), but I think its InfoFrames are also more or less
> > > > > > generic).  Maybe we should change debugfs integration to register the
> > > > > > file when the frame is being enabled and removing it when it gets unset.
> > > > > 
> > > > > But, like, for what benefit?
> > > > > 
> > > > > It's a debugfs interface for userspace to consume. The current setup
> > > > > works fine with edid-decode already. Why should we complicate the design
> > > > > that much and create fun races like "I'm running edid-decode in parallel
> > > > > to a modeset that would remove the file I just opened, what is the file
> > > > > now?".
> > > > 
> > > > Aren't we trading that with the 'I'm running edid-decode in paralle with
> > > > to a modeset and the file suddenly becomes empty'?
> > > 
> > > In that case, you know what the file is going to be: empty. And you went
> > > from a racy, straightforward, design to a racy, complicated, design.
> > > 
> > > It was my question before, but I still don't really see what benefits it
> > > would have, and why we need to care about it in the core, when it could
> > > be dealt with in the drivers just fine on a case by case basis.
> > 
> > Actually it can not: debugfs files are registered from the core, not
> > from the drivers. That's why I needed all the supported_infoframes
> > (which later became software_infoframes).
> 
> That's one thing we can change then.
> 
> > Anyway, I'm fine with having empty files there.
> > 
> > > > > > Then in the long run we can add 'slots' and allocate some of the frames
> > > > > > to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
> > > > > > 'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably be
> > > > > > salvaged as another generic one)). MSM HDMI would get 'software AVI',
> > > > > > 'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
> > > > > > want to use). Then the framework might be able to prioritize whether to
> > > > > > use generic slots for important data (as DRM HDR, HDMI) or less important
> > > > > > (SPD).
> > > > > 
> > > > > Why is it something for the framework to deal with? If you want to have
> > > > > extra infoframes in there, just go ahead and create additional debugfs
> > > > > files in your driver.
> > > > > 
> > > > > If you want to have the slot mechanism, check in your atomic_check that
> > > > > only $NUM_SLOT at most infoframes are set.
> > > > 
> > > > The driver can only decide that 'we have VSI, SPD and DRM InfoFrames
> > > > which is -ETOOMUCH for 2 generic slots'. The framework should be able to
> > > > decide 'the device has 2 generic slots, we have HDR data, use VSI and
> > > > DRM InfoFrames and disable SPD for now'.
> > > 
> > > I mean... the spec does? The spec says when a particular feature
> > > requires to send a particular infoframe. If your device cannot support
> > > to have more than two "features" enabled at the same time, so be it. It
> > > something that should be checked in that driver atomic_check.
> > 
> > Sounds good to me. Let's have those checks in the drivers until we
> > actually have seveal drivers performing generic frame allocation.
> > 
> > > Or just don't register the SPD debugfs file, ignore it, put a comment
> > > there, and we're done too.
> > 
> > It's generic code.
> > 
> > > > But... We are not there yet and I don't have clear usecase (we support
> > > > HDR neither on ADV7511 nor on MSM HDMI, after carefully reading the
> > > > guide I realised that ADV7511 has normal audio infoframes). Maybe I
> > > > should drop all the 'auto' features, simplifying this series and land
> > > > [1] for LT9611UXC as I wanted origianlly.
> > > > 
> > > > [1] https://lore.kernel.org/dri-devel/20250803-lt9611uxc-hdmi-v1-2-cb9ce1793acf@oss.qualcomm.com/
> > > 
> > > Looking back at that series, I think it still has value to rely on the
> > > HDMI infrastructure at the very least for the atomic_check sanitization.
> > > 
> > > But since you wouldn't use the generated infoframes, just skip the
> > > debugfs files registration. You're not lying to userspace anymore, and
> > > you get the benefits of the HDMI framework.
> > 
> > We create all infoframe files for all HDMI connectors.
> 
> Then we can provide a debugfs_init helper to register all of them, or
> only some of them, and let the drivers figure it out.
> 
> Worst case scenario, debugfs files will not get created, which is a much
> better outcome than having to put boilerplate in every driver that will
> get inconsistent over time.

debugfs_init() for each infoframe or taking some kind of bitmask?

-- 
With best wishes
Dmitry

