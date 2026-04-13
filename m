Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F1EF34C49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 14:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YP3tCk9uVMWJEI0cAi2Nc0h4779GkjDFyYbRspyGl48=; b=Tq44rGXZnsMacdm3LfamZIwsEh
	VwuW+Ws6MbzK5GBvyvI61L12zgIKbB+P7Okpe93n/c2vitgJtvvxqfy3GIBCeWO3e1IiPSj9+JXrc
	cApPuARysXEinQh7kU7u0IoYa/5QYraM9IJYohP+lBG2niRbomMLz9UbPgFbylP1YkrFqsfHDRUIj
	pVghdKJvIPYzK5cLYMOBbCHRfw9raChncRbtkxEzJY0N5CwneEzjpG/DISwIQPLIJVJhhG684fg+T
	tCCDdZlMXMWZByDB6cLZhOHvLH8wNpZOIi+KN0oCIj2SXxImKdfJsXh3X9cWEAMhKXdbBa+098sfI
	1gfzb4mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHpU-0000000FoTy-2Gn0;
	Mon, 13 Apr 2026 13:59:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHpT-0000000FoRw-0dVq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 13:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YP3tCk9uVMWJEI0cAi2Nc0h4779GkjDFyYbRspyGl48=; b=XC1Hvr0YPQcu20pTBAua6wqvaT
	xvMx3vfXkXYALpQU0sEsmFLsv93kM1Dp5aXw5pq89vvgpJpwMDqQql1YOVRQ1v8g9kYE7yiiDGSJj
	UHdfdgl1f3YPuNjODIfDKXqlysKkiGRDB2emaDptGELDqqmcCcgwNhdrCgZT5hRrmnXuMi7PjS4s2
	91LByC1Ceu85+jQpWgeRLpAYY3TakTCxTBgso/cBID7OimtamiLbs0oVWze1MDpm/WBXPdoei2lPE
	EJZyGjqLH4MbIZqSr3EfMxfKGuVDXPdbhWA2jb8J8y+blio93yPRZ7jjb1jiZtJ6yA+vQ3SzmMr4r
	Bv+G7XaA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHpP-0000000Gtf8-3RvV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 13:59:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DCZHBE3989749
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 13:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YP3tCk9uVMWJEI0cAi2Nc0h4779GkjDFyYbRspyGl48=; b=aPv4BJzO4sBCgjWE
	wJoI/xN0WZnbOmf2ndTeI87Y184qN16qzzpA4EhIuU5JFRVslR6LAJ/wAg3lgvfm
	6uZGnS7wZNnX55+RFw760eX1KYDYWsfZQ4uyEIwCh2CEW+bFfg9W0TYSqVo0bNPQ
	lqLuBg5IGbNjmnoDyhx43+u07bA65KIdNjWWB0Dd+3QdJaog93m48vXP9WHY9ndQ
	+8ZMTkAfEZ5MiDBMkLHGezEHRsHMOkZ9Nvnz2R3//N8z5RtDzn+eKs2eKGgxAXoE
	D0BoLIh3qts5Ni1uFVUWTXxElWTpsUZu/h+nu/Q1cveXkMKsYXVmpw6yO+J6OqCi
	4AW4tQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh0mfrbj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 13:59:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4031b86dso117488141cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 06:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776088787; x=1776693587; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YP3tCk9uVMWJEI0cAi2Nc0h4779GkjDFyYbRspyGl48=;
        b=fZGe91RyNfjMb8AKcoPFn2s4vvghhSw1zMh4AVSJbYrEuJv6CbYfRGf4E5+ANkylWv
         K5VbCMhENkqmAWaL66Flkq9lw6HA9bhZ2r1lq06+nPBWb8xUJPDHrG1iqI/qPp/nLDtj
         aCF7eZ7zhANSDjypzY7f8Ce7FwCSzMQ5lZESAJWqly0KAJg8VeTKqetGufsufcr/qwJ/
         gO0D59R203bjTOHvoTIynVeMEOyAkamxtwCXBX/Rceg0aRbRnzgRF98gonBoSf34qDZZ
         bpx+n9Bp4t5MT9GhToG9qqmhtDjfA3nblyENH9Sik/ZjsiQnF6FFhN0XJ5QF6R2fk3l2
         0NSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776088787; x=1776693587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YP3tCk9uVMWJEI0cAi2Nc0h4779GkjDFyYbRspyGl48=;
        b=a6o7rGUrrjOqPh4+ozP4d+kjEmqKpk1StfTKCtGj/mpuOaABmyI74fkcxTZRov/5Gi
         UFSi/wewKv83Asxl32Nc9sVHt23hO6WCPlxa4tfu/hKeh4dnqz7Yif/C2LFTvk7HIQSx
         GaSIM/jsuC3Dbi1X3VSFLDg8x7ozw+jn4lZu/kYxJeKFEs/8Vn1590LIcWY+AhlB9zXN
         53lX0cXq4UASt0sl5XMSfmp2mvwYa5DnDNTk7+NceRutF95T4/8+M1frDYC2ORVZLIdp
         LaUffBja2jxl5G4YlCJ8fV2rA9bTTFJv4dMWtU4+UCbeovMqzW3yDfsUXYEeUu7CzKHQ
         lVpA==
X-Forwarded-Encrypted: i=1; AFNElJ8IDuRmSo/K72qw8hCX2c/lEnuPDwhuTrJTUN+f8/r97zKm+bI3bHaVBpDv6EZkTgW1aH6i6QyB5r3QkQdaamB6@lists.infradead.org
X-Gm-Message-State: AOJu0YztblyQH7LQdlccA0RfQga4sItt9iEY/i7KY6HJEO5VMzalCYBZ
	jZr8xNYvouIM3zrp7KyX4DSBEvWOgBjohpuX7VW1PqmPCdQu1oMnLue1Vvu6V3tXXYT/I339YSI
	Ha7RA+JyUt2qAe3eVUJ7+pUa1AH97/8XVYsnVtbvM3+4OFhYD6QwgUGJTZEjBWOd0S85BlIx78n
	PSoQ==
X-Gm-Gg: AeBDieuCqTeLkhtt7KBVhtcJjfEJbTU8Hvlco6qDFjKNTSkAOcQYLO7trJI2NZZcBym
	AHC0I1qPqUewpa/aDwP7g//eDiDjBkqh6PjON9BitWY0xqBA+hHtrCXX2a3ydcGlKswb+IHFqnj
	7iatmNTc/LMztfdtMC/x9jB28rPGtE9jTyHn4YqoeG5/ekZkWtRXltZBZUHhWozRuIUVE1rHeSp
	LJNqu4yO6MdBOkn+T6SITUxYL2y63QRABo2kzLRr5nq8viTkh7ROYwZKLAlOe9LFBzWxlqlPClm
	4C7SMQi2dAWyP4QDAqycsBXghBdAu+R2uK3Un4Nbn3KcolcfLgK2bNfdig3BNUVb0d5M9GFZ+gM
	Dwi0ogd3rV19tzcXLsbVaw8TdSgJokn+oApHrKEEEgJirlr0Tje/0eVWla5b2aHNV/3c3YVpZS5
	iXMjTr6dx0AxtVNaqQBYBOUpQ1wVRgRTthWuw=
X-Received: by 2002:a05:622a:40c3:b0:50d:8050:a358 with SMTP id d75a77b69052e-50dd5bc32edmr180026341cf.47.1776088787146;
        Mon, 13 Apr 2026 06:59:47 -0700 (PDT)
X-Received: by 2002:a05:622a:40c3:b0:50d:8050:a358 with SMTP id d75a77b69052e-50dd5bc32edmr180025641cf.47.1776088786538;
        Mon, 13 Apr 2026 06:59:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e83bc1b49sm3349781fa.40.2026.04.13.06.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 06:59:45 -0700 (PDT)
Date: Mon, 13 Apr 2026 16:59:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        Jesse Barnes <jbarnes@virtuousgeek.org>, Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH RFC 09/12] drm: Introduce drmm_connector_dp_init() with
 link training state properties
Message-ID: <bwgzwwlmvlbtnl7qnmnjrkzjaifeyrhllnbjxh7txrd2o24aqi@2ykn2gwyatcx>
References: <20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com>
 <20260409-feat_link_cap-v1-9-7069e8199ce2@bootlin.com>
 <gmaxonri7y3k43pxsnxfnd23mydgrwsw2322v6m4yjoksqm7aj@4ehgvhzg2ubb>
 <20260413145930.140ba461@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413145930.140ba461@kmaincent-XPS-13-7390>
X-Proofpoint-GUID: DIPTt_p2_IWzrg24EHHs4Ew8-YPL4IET
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzNyBTYWx0ZWRfX2U5IYP7jO/Sq
 3Lzhza87iNBetClt27HjzjxNoPkyAyvsiJwD7cnkZyIbRs1KqNTVs9TysVcXvBpYsQfi2quNyKt
 anlYyoY5TcaqQ42zCxrOCCUFAvekGUatCJ2yccWKbMwKleA74K6xLCTBUwEhOkTuABJmSkhcqLj
 bjYU1aEYMgZzTsjhj+Zf82oitQ9gG8KTpT0ySLQiDiuI5FevV/Xt6rNvJg/DFtlSPIz+lwXg0vQ
 UzojzlSBf1gFhn32QihjTKbw27++vxNhjK84aiIDLctY1vCwg3qFYJzIfn9ZF+jodh98viJSjV4
 pUX7bNaBumUZWrlV5LnQapUsAZ/CpZkID7ESB47ZSzdkfaQzdmkWT/YWY0zUQydHV9eZrBfxliq
 ie8JbWp/4Zr/6b+2KuGT2H5xHtXO6Ztd8JuYvK6mSiI51OqFf7m8IxLdryxedvRkytkIONMvzK1
 0Tyd6qHK0LKerIs+20Q==
X-Authority-Analysis: v=2.4 cv=cMvQdFeN c=1 sm=1 tr=0 ts=69dcf6d4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=Z4SpDY1sp9IGsGPUEqoA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: DIPTt_p2_IWzrg24EHHs4Ew8-YPL4IET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_145952_124337_41A2F7D0 
X-CRM114-Status: GOOD (  29.95  )
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

On Mon, Apr 13, 2026 at 02:59:30PM +0200, Kory Maincent wrote:
> On Fri, 10 Apr 2026 00:53:08 +0300
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > On Thu, Apr 09, 2026 at 07:08:25PM +0200, Kory Maincent wrote:
> > > Add a managed DisplayPort connector initialization helper,
> > > drmm_connector_dp_init(), modeled after the existing HDMI counterpart
> > > drmm_connector_hdmi_init(). Cleanup is handled automatically via a
> > > DRM-managed action.
> > > 
> > > The helper creates the following immutable connector properties to expose
> > > DP link training capabilities and state to userspace:
> > > 
> > >   - num_lanes: bitmask of supported lane counts (1, 2, 4)
> > >   - link_rate: Array of supported link rates.
> > >   - dsc_en: Display Stream Compression supported
> > >   - voltage_swingN: per-lane voltage swing level bitmask
> > >   - pre-emphasisN: per-lane pre-emphasis level bitmask
> > > 
> > > Link rates are passed by the driver in deca-kbps, following the DRM
> > > convention, but exposed to userspace in kbps for clarity.
> > > 
> > > Two additional helpers are provided to update and reset those properties
> > > at runtime:
> > >   - drm_connector_dp_set_link_train_properties()
> > >   - drm_connector_dp_reset_link_train_properties()
> > > 
> 
> ...
> 
> > > +/**
> > > + * struct drm_connector_dp_link_train - DRM DisplayPort link training
> > > + * information report
> > > + */
> > > +struct drm_connector_dp_link_train {  
> > 
> > THese define the current DP state. As such, they definitely make sense
> > to be a part of the drm_connector.
> > > +	/**
> > > +	 * @nlanes: The number of lanes used
> > > +	 */
> > > +	u8 nlanes;
> > > +
> > > +	/**
> > > +	 * @rates: Link rate value selected in deca-kbps
> > > +	 */
> > > +	u32 rate;
> > > +
> > > +	/**
> > > +	 * @dsc: Display Stream Compression enabled
> > > +	 */
> > > +	bool dsc_en;
> > > +
> > > +	/**
> > > +	 * @v_swings: Array listing the bitmask voltage swing level per
> > > lanes
> > > +	 */
> > > +	u8 v_swing[4];
> > > +
> > > +	/**
> > > +	 * @pre_emph: Array listing the bitmask pre-emphasis level per
> > > lanes
> > > +	 */
> > > +	u8 pre_emph[4];  
> > 
> > Please consider following struct phy_configure_opts_dp (or using it as
> > is). Overall, please refer the talk and (more important) the lightning
> > resumee at this XDC. I have some bits and pieces ready in spite of that
> > proposal, but I didn't have time to finish it.
> 
> I didn't know this phy_configure_opts_dp struct. This indeed could make sense
> to reuse and modify that structure for our needs.

Why would you want to modify it? It is an interface for the PHY drivers.
Is there anything that you miss there?

> About your XDC talk. What were the developments you were talking about? Could I
> have a look at them?

I've posted an RFC just before the XDC. Currently I'm looking at the
link training generification. Overall, you don't have to wait for that
job to be completed, just take some of the notes in account (like reuse
of the PHY config structures).

> 
> Regards,
> -- 
> Köry Maincent, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry

