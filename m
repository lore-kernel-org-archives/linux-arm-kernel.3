Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCE5C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCkUtZMQ71ULc4B874+EyT+6Pil1L5OznKSmBdpWeOQ=; b=YhHLspkldbhtSeotmIEkgVkEtB
	YbUgkyxeJG5o/FtcecgS9vkgkGz9nKYgfTmZ6SY4UC9WlPiOVL/Yb3g36XOoPSRxym/EfVRa9+1ZV
	vHrCkZrJX+uRI7/H98nwjqMdQBTUWvNZbnQoSwl+eWPKm/xNW4UDIDWCfhMtIlyNZASELeGWABRUC
	Hr5Kuvql6V3EnVw3s+h76kSAX1gkvS0XQi2OKHsEhYwL9GOG6PrG8aHGzavQnHG+m4+0h2Nnj8J+A
	mUn+Gb+P61zPns4RH4NVi7NmkMxwlIO/gpkSsYMo5X/8rMb9Ps6VRY12p+adYEVkm9JA94BDbxnqX
	w+b4ZpEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dKx-000000026Y4-2zvN;
	Mon, 21 Sep 2026 12:41:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dKt-000000026VT-1Ays
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 12:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MCkUtZMQ71ULc4B874+EyT+6Pil1L5OznKSmBdpWeOQ=; b=Fean5zUI1ntBuDcYFbgI/Cus/E
	V8YmY1BvKhu/6bYUEsdMwusxoIDpk+uJ7cimbAZO/p1wft+YVLm9msle8BCJ0kAomeW4MZzzvKOih
	IlxBpDk+8uh9CIa5zNF71TqCGmJgN9Tg91FhjrribvWzx6mQt7REYmQOAuql2/Ham/xYDD6fT6McG
	NYfO41ZNDe90TaHq9O5bMJFTnAbfzPM9I7C7aZVEonW1OFflXwqwGaN+WpIEQwM/V1xrdMKRjS3WX
	nfUFrSJDUDd7hizFm/WZpdyQq+Y9ED+1D3Amm3DzJVphiUa9cdpsANzwUFa/GbcsE2VVGfzThsRq0
	4D5zm/zQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8dKp-0000000CHx3-4528
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:41:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdmDV227824
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MCkUtZMQ71ULc4B874+EyT+6Pil1L5OznKSmBdpWeOQ=; b=ElvYsXrWBfG26UY6
	V2FjiXMbFsn2iyvAOqIpcKtWlHbfEpYrsN6TuG8RGba9ur7ykT+VMqKDB6YY5Rdu
	1RgTFl1vWgXfnbVkwWcxf8tyuw1JV8PUXYsoMkDE/AyYgLpnPTelKF9tb1jP4BXd
	mL0V9Es9ZkHSHoco2uWla/d3HWZV2M56jQLiizIyJhzsYWg772rzH4yYChe/lw0k
	iCNPyj3ISyHBL5ZKAB1+VNxtGfqh3bZeevfKNbdl9eYwXswY08YbDJK4NQlUzx7e
	JRgjm81AofSvqE3tFcngODmLTOTYmlzusB8VknB9JCHVqBUGByOZc18OzTDYHpF8
	08b3gQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17grx74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:41:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb48f41343aso3509885a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:41:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789994483; cv=none;
        d=google.com; s=arc-20260327;
        b=qHV2N9NFiOMvVZaEzX6kXKfiM49mlLuvQ0CZ9IZc+IXSlQ2yGAFBBAQY/CjkCuIvQo
         x88KqO3L5nS4cJXLJdoNa2POsDtHxn882t2qWa6cVW3tI82fMV8PqmIewYbGPlJQCg8y
         Yk5EHbLQTEyYm7dD9TzDByfdKak75snldlZid9AuXhLnaqRlb5sqn+qF9CPPPF3Z7xxQ
         JPcluJUrcd0c2eufYnFRt+/TrRRZVr3uZd/2GYHtgO6IBOqkByj+3hTsEFXfsVwFxJam
         DpCs0/NhT3SwVLNrzzyVaKZDplg9lggD+14steR+w0mPfniORWHjdzStXSm57KBZg3Qy
         Un7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MCkUtZMQ71ULc4B874+EyT+6Pil1L5OznKSmBdpWeOQ=;
        fh=XimMtJbBZ2y9uo+W03nDfeFkokBf4NnEhn8D22gLFHo=;
        b=S6HlsAUr9faLlMNfNqesc6FQSe3NOCjJsR4D5cCn7CWdgQQMtE2k9SVraUWb/zrGXL
         ZkozHL97Gj4bIUj4u0njUos6C1SaBFZXYLRy0E+0lRMuTul9DNBmAb8Ld1VFZr8+wVx7
         mZEYUid2EHHHP766BxvujMRQVZtuieSmjxcU3VyAB1EKAXAd9SiNzUnEAYWySfZsel22
         WNVnU4GZLsTbFgpWW/XO9ZayKT9OglR/A92qLcFVBpyiLp3t/4zNn+P37u04XElTCmfa
         gHsHTMeKxylqLmTsmbOKRT+NFu3/xuM2q6Rkpu1+zdXLUZyiW0vYbuJe7BgOPDbrhDPQ
         QkTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789994483; x=1790599283; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MCkUtZMQ71ULc4B874+EyT+6Pil1L5OznKSmBdpWeOQ=;
        b=UOm6m2q+QRCCB8Z+3Y9C5S5qvRuF5THwRgMPXq0B89uZ6vyCPnHLDTPSrnlE2m8ezL
         q4RI14HPjcmdYjB4SybcVD8d92/kX3E4FrnMfMfHxazuVOW29Oq5CLtQ5VwaOjRhzS/l
         gQs5Mca2MjicfbxLMc/UjlZ/Dse0DjBr4dWi+cKhiP6E91nb166XmIOH78pRVHAW4Ggk
         mvPdm58M+KlAgs3h+dY6Sm4xX2FXWfW5yvOasx6dzSSkbra/MMk89+6cxaeP1YDq87ZF
         WMqOfe3Gvwq5Zya1XCuiNiFziwpU7CQSf2JnmxZwOJLTMKiRn3u7/4IrpdCNg8lOPUaO
         9+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994483; x=1790599283;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCkUtZMQ71ULc4B874+EyT+6Pil1L5OznKSmBdpWeOQ=;
        b=CimC4+plsbBqUs3aMeuNZVm6a1BYvxzHajAieXbwDh6+Ozjdgxkck3FzqYC8RVBnQk
         5UyAjtzjkgxNo1DtD48CJQRc2yeSpJBBfC6RLdfbYt65/c+D9ctZDcSl6kJK+pXC+6Mt
         ax+S01i5I9/2lIku04nOWaH7kWQ0VBKMJJR4u9GZlo1vVJ9R8MoRtIqaR9C0rv78tCnO
         JtN3dLgC0szC+lSSBiE9sEjw+RI2YpXfY29IYZlSIqOKh5oQNgC3trJNxlDRDVFNnItn
         t1n4RBXFNVEWVJDnPC9hk6rsDmfxwFRrQnJSpkRpxLU6xvGAnlZ8NC7sRhit2PYl7qJ5
         HVgA==
X-Forwarded-Encrypted: i=1; AKwUvBya0JER9OFeSIPpc/r3iXufXlDow1KglTpUMe6W5+YGMLZ9oVgtBvd+MZSAxYz9UKGozquijwlC2pvUWOd4ETCP@lists.infradead.org
X-Gm-Message-State: AFuF++lq2r/ppbzP9M5HkDDsloKXeYD06L81mM8w5bnA/Wf8/bk5z5Rm
	CZ7aw8yqxVsPRhVuh5fk6S5gPWKzyQA8QTWyJAfLYB0V1NDzmSMQY7xqetYnVJ4rZj9J6rPgKV+
	Eg2yITbiaGYf7lWg/44Qz5LjJgaDeGAhh68YvE/RH1T+Ob5h1BmJSzueq5pjj9eZ06oDBNIlQhM
	XtPJZz3Tc7gigM1w7kypYS+ETfFqj/s1WHQHxMe11U75yPVGhv890c
X-Gm-Gg: AYBFou0aSlvC0QDtXJtiB2vfaMab0C9XygM/sl3XRj4ZNrTE0WL2sBlUHoP0PKXAKlr
	9gqvX7RfFJrVFx5UDYlRkLcUjSJFwFLV77kWq0gt9Qqqpvqrvlruhm9TtWAA85fmu4Lkj36jiyC
	tnUcFuehL0vP51xiQNYypV4XKtFXjdFgMSub9H0myZ7oTdA1uG9UzojexvuQ==
X-Received: by 2002:a05:6a20:728e:b0:3db:b3b:5343 with SMTP id adf61e73a8af0-3dd72553e40mr19632623637.12.1789994482615;
        Mon, 21 Sep 2026 05:41:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:728e:b0:3db:b3b:5343 with SMTP id
 adf61e73a8af0-3dd72553e40mr19632577637.12.1789994482080; Mon, 21 Sep 2026
 05:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260915104328.45901-1-gahing@gahingwoo.com> <20260915104328.45901-10-gahing@gahingwoo.com>
In-Reply-To: <20260915104328.45901-10-gahing@gahingwoo.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:41:09 +0200
X-Gm-Features: AcwNN1U_m4mjOUzjWYeAqWZntQVfxzbTcYRMim6iZjC6YeWC6g3-sc-ZIdGx-1E
Message-ID: <CAPx+jO--v8dHGCTMQrooxm7dLPDYbUHt4euWTud-GKK7efOuZA@mail.gmail.com>
Subject: Re: [PATCH v13 09/14] pmdomain: rockchip: add optional per-domain
 power-on settle delay
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, ulfh@kernel.org,
        p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com,
        royalnet026@gmail.com, abel.vesa@oss.qualcomm.com,
        sebastian.reichel@collabora.com, sidong.yang@furiosa.ai,
        u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com,
        diederik@cknow-tech.com, alchark@flipper.net,
        dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: pWkgtVbEVe9s2mmJVp6rZOtPZdJvIM2k
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab125f3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=9GNsruGHAAAA:8 a=EUspDBNiAAAA:8
 a=TQVB6zonJKZT9JHDKKgA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=gf-oSkQAjqHFJRp-GQfY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4MiBTYWx0ZWRfX66NI3qTolqag
 Kg8AYXbXYbPrEVrZmOa0MXElev0JnQ3TBiNokTM2p/2W9jpUYGDbuQhdUnZItb9GEOpApHwu4SK
 4y/WuaoV3SZjPtFtDKaIPHvaUyukwZUVVySJW7eEXWxz6h0MEvAEd795dxmt5ghJwwQcu8fnn5k
 XkPL8/0yQIoLgnpE8tqc5FmPPvDjn/rkbScYe5V1YM82WoACpzF9Qh4aC2GZ8b53cPBWujtgeY7
 l2RDlFuNVHG+GlwomElcEAXm6afCuinKOFiYuKQYLDSJaJBLTc/egW1gtd+jiid39AB0imqFzoA
 6dP4S9ZpCZY7ew4NYgdHkGAU0E3gKs/+O2WFSIolD/yyZMcSiss6UuQCOWecr+z0w2oiushAbZY
 wz334wC4roFYPNt5mP8bUrZ7oN9en8UeC7GxGnMk486TwWJmLEnBIfgHTd5ipSNqOuL+ALVxknQ
 5etnnGGBaCN/ZfBn3tQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4MiBTYWx0ZWRfX/URxcO41v566
 VGbyQGMPPp6No3X7M6bAL/5moH++7cK9DCehLEOxbt82/tN5esKvHGbZl4n7c4K8+RVbPyXNLcK
 rUdb43/7o40EecvRBz92YDvqVrcNnc4=
X-Proofpoint-ORIG-GUID: pWkgtVbEVe9s2mmJVp6rZOtPZdJvIM2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_134128_431735_01BD8EB5 
X-CRM114-Status: GOOD (  41.55  )
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

On Tue, Sep 15, 2026 at 12:45=E2=80=AFPM Jiaxing Hu <gahing@gahingwoo.com> =
wrote:
>
> The RK3576 NPU domains need a short settle time after the idle request is
> released before the registers behind the domain answer. Without it the Qo=
S
> writes that rockchip_pmu_restore_qos() issues land while the domain is
> still coming up, and the NPU throws an async SError on the first cold
> power-on.
>
> Give rockchip_domain_info an optional delay_us and wait for it between
> releasing idle and restoring QoS. Rename DOMAIN_M_O_R_G to
> DOMAIN_M_O_R_G_W for the settle delay it now carries; RK3576 is its only
> user, so the old spelling is not kept around.

To me, everything below in the commit message can just be dropped. The
above is clear enough.

>
> The suffix scheme does not survive this cleanly and it is worth saying so
> rather than leaving it for review. The letters name fields, but R already
> means two things in this family: DOMAIN_M_O_R takes r_status and r_offset
> AND a regulator under one R, while DOMAIN_M_R has no repair fields and it=
s
> R is the regulator. DOMAIN_M_O_R_G's R was the repair pair -- it did not
> set need_regulator at all -- so the paragraph below, which gives it one,
> adds a field the name does not mention. Naming it _W_R or _RG would be
> inventing a convention rather than following one. Say which you would
> rather have.
>
> While the macro is being rewritten, give it the regulator argument that
> DOMAIN_M_O_R and DOMAIN_M_R already take. Without .need_regulator set,
> rockchip_pd_regulator_enable() returns early for every RK3576 domain, so =
a
> domain-supply in the device tree is never looked up and never enabled. Ad=
d
> a DOMAIN_RK3576_R spelling that passes true and use it for RK3576_PD_NPU,
> which is the one RK3576 domain with a rail of its own; every other domain
> passes false and is unchanged.
>
> Two things beyond the delay, both worth saying out loud because neither i=
s
> what the subject describes.
>
> RK3576_PD_NPU also gets need_regulator here, which makes
> rockchip_pm_add_one_domain() call rockchip_pd_power(pd, false) at probe o=
n
> all thirteen in-tree rk3576 boards. Only rock-4d enables an NPU core, and
> it is the one that declares the supply, so on the other twelve ->power_on
> never runs and the regulator is never looked up at all. It is deliberate,
> and it is what the delay is for:
> without the domain being forced off at probe, a bootloader that leaves th=
e
> NPU powered means ->power_on is never called and neither the delay nor
> 10/14's reset pulse ever runs.
>
> This is not new behaviour in this driver. RK3588_PD_NPU has carried
> need_regulator since it was added and its req_mask is 0 exactly as this
> one's is, so rockchip_pd_power(pd, false) has been running at probe on ev=
ery
> rk3588 board, with rockchip_pmu_set_idle_request() returning immediately
> because there is no request to make. Of the forty-nine in-tree rk3588 boa=
rd
> files, twenty-one enable an NPU core and declare the supply, twenty-six d=
o
> not enable one at all so ->power_on never runs for them, and two enable i=
t
> with no supply: quartzpro64 and youyeetoo-yy3588 take the dummy regulator
> and the one line dev_warn from the regulator core today. The idle
> handshake lives in the child domains and on both SoCs they keep it:
> NPUTOP, NPU0 and NPU1 carry req and idle masks of their own.
>
> If that is too much for one patch, say so and it splits.
>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Other than the nitpick above, this looks good to me!

Kind regards
Uffe

> ---
>  drivers/pmdomain/rockchip/pm-domains.c | 56 ++++++++++++++++----------
>  1 file changed, 34 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index ba66ae719..39988efd8 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -18,6 +18,7 @@
>  #include <linux/of_address.h>
>  #include <linux/of_clk.h>
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/mfd/syscon.h>
> @@ -59,6 +60,7 @@ struct rockchip_domain_info {
>         u32 pwr_offset;
>         u32 mem_offset;
>         u32 req_offset;
> +       u32 delay_us;
>  };
>
>  struct rockchip_pmu_info {
> @@ -185,7 +187,7 @@ struct rockchip_pmu {
>         .need_regulator =3D regulator,                    \
>  }
>
> -#define DOMAIN_M_O_R_G(_name, p_offset, pwr, status, m_offset, m_status,=
 r_status, r_offset, req, idle, ack, g_mask, wakeup)   \
> +#define DOMAIN_M_O_R_G_W(_name, p_offset, pwr, status, m_offset, m_statu=
s, r_status, r_offset, req, idle, ack, g_mask, delay, wakeup, regulator)   =
    \
>  {                                                      \
>         .name =3D _name,                                  \
>         .pwr_offset =3D p_offset,                         \
> @@ -200,8 +202,10 @@ struct rockchip_pmu {
>         .req_mask =3D (req),                              \
>         .idle_mask =3D (idle),                            \
>         .clk_ungate_mask =3D (g_mask),                    \
> +       .delay_us =3D (delay),                            \
>         .ack_mask =3D (ack),                              \
>         .active_wakeup =3D wakeup,                        \
> +       .need_regulator =3D regulator,                    \
>  }
>
>  #define DOMAIN_M_R(_name, pwr, status, req, idle, ack, wakeup, regulator=
)      \
> @@ -258,8 +262,11 @@ struct rockchip_pmu {
>  #define DOMAIN_RK3568(name, pwr, req, wakeup, regulator)               \
>         DOMAIN_M_R(name, pwr, pwr, req, req, req, wakeup, regulator)
>
> -#define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset, r=
eq, idle, g_mask, wakeup)      \
> -       DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status=
, r_offset, req, idle, idle, g_mask, wakeup)
> +#define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset, r=
eq, idle, g_mask, delay, wakeup)       \
> +       DOMAIN_M_O_R_G_W(name, p_offset, pwr, status, 0, r_status, r_stat=
us, r_offset, req, idle, idle, g_mask, delay, wakeup, false)
> +
> +#define DOMAIN_RK3576_R(name, p_offset, pwr, status, r_status, r_offset,=
 req, idle, g_mask, delay, wakeup)     \
> +       DOMAIN_M_O_R_G_W(name, p_offset, pwr, status, 0, r_status, r_stat=
us, r_offset, req, idle, idle, g_mask, delay, wakeup, true)
>
>  /*
>   * Dynamic Memory Controller may need to coordinate with us -- see
> @@ -681,6 +688,10 @@ static int rockchip_pd_power(struct rockchip_pm_doma=
in *pd, bool power_on)
>                 if (ret < 0)
>                         goto out;
>
> +               /* Some domains need to settle before the QoS registers a=
nswer. */
> +               if (pd->info->delay_us)
> +                       udelay(pd->info->delay_us);
> +
>                 rockchip_pmu_restore_qos(pd);
>         }
>
> @@ -1300,25 +1311,26 @@ static const struct rockchip_domain_info rk3568_p=
m_domains[] =3D {
>  };
>
>  static const struct rockchip_domain_info rk3576_pm_domains[] =3D {
> -       [RK3576_PD_NPU]         =3D DOMAIN_RK3576("npu",    0x0, BIT(0), =
 BIT(0), 0,       0x0, 0,       0,       0,       false),
> -       [RK3576_PD_NVM]         =3D DOMAIN_RK3576("nvm",    0x0, BIT(6), =
 0,      BIT(6),  0x4, BIT(2),  BIT(18), BIT(2),  false),
> -       [RK3576_PD_SDGMAC]      =3D DOMAIN_RK3576("sdgmac", 0x0, BIT(7), =
 0,      BIT(7),  0x4, BIT(1),  BIT(17), 0x6,     false),
> -       [RK3576_PD_AUDIO]       =3D DOMAIN_RK3576("audio",  0x0, BIT(8), =
 0,      BIT(8),  0x4, BIT(0),  BIT(16), BIT(0),  false),
> -       [RK3576_PD_PHP]         =3D DOMAIN_RK3576("php",    0x0, BIT(9), =
 0,      BIT(9),  0x0, BIT(15), BIT(15), BIT(15), false),
> -       [RK3576_PD_SUBPHP]      =3D DOMAIN_RK3576("subphp", 0x0, BIT(10),=
 0,      BIT(10), 0x0, 0,       0,       0,       false),
> -       [RK3576_PD_VOP]         =3D DOMAIN_RK3576("vop",    0x0, BIT(11),=
 0,      BIT(11), 0x0, 0x6000,  0x6000,  0x6000,  false),
> -       [RK3576_PD_VO1]         =3D DOMAIN_RK3576("vo1",    0x0, BIT(14),=
 0,      BIT(14), 0x0, BIT(12), BIT(12), 0x7000,  false),
> -       [RK3576_PD_VO0]         =3D DOMAIN_RK3576("vo0",    0x0, BIT(15),=
 0,      BIT(15), 0x0, BIT(11), BIT(11), 0x6800,  false),
> -       [RK3576_PD_USB]         =3D DOMAIN_RK3576("usb",    0x4, BIT(0), =
 0,      BIT(16), 0x0, BIT(10), BIT(10), 0x6400,  true),
> -       [RK3576_PD_VI]          =3D DOMAIN_RK3576("vi",     0x4, BIT(1), =
 0,      BIT(17), 0x0, BIT(9),  BIT(9),  BIT(9),  false),
> -       [RK3576_PD_VEPU0]       =3D DOMAIN_RK3576("vepu0",  0x4, BIT(2), =
 0,      BIT(18), 0x0, BIT(7),  BIT(7),  0x280,   false),
> -       [RK3576_PD_VEPU1]       =3D DOMAIN_RK3576("vepu1",  0x4, BIT(3), =
 0,      BIT(19), 0x0, BIT(8),  BIT(8),  BIT(8),  false),
> -       [RK3576_PD_VDEC]        =3D DOMAIN_RK3576("vdec",   0x4, BIT(4), =
 0,      BIT(20), 0x0, BIT(6),  BIT(6),  BIT(6),  false),
> -       [RK3576_PD_VPU]         =3D DOMAIN_RK3576("vpu",    0x4, BIT(5), =
 0,      BIT(21), 0x0, BIT(5),  BIT(5),  BIT(5),  false),
> -       [RK3576_PD_NPUTOP]      =3D DOMAIN_RK3576("nputop", 0x4, BIT(6), =
 0,      BIT(22), 0x0, 0x18,    0x18,    0x18,    false),
> -       [RK3576_PD_NPU0]        =3D DOMAIN_RK3576("npu0",   0x4, BIT(7), =
 0,      BIT(23), 0x0, BIT(1),  BIT(1),  0x1a,    false),
> -       [RK3576_PD_NPU1]        =3D DOMAIN_RK3576("npu1",   0x4, BIT(8), =
 0,      BIT(24), 0x0, BIT(2),  BIT(2),  0x1c,    false),
> -       [RK3576_PD_GPU]         =3D DOMAIN_RK3576("gpu",    0x4, BIT(9), =
 0,      BIT(25), 0x0, BIT(0),  BIT(0),  BIT(0),  false),
> +       /*                                            name    p_offset pw=
r      status  r_status r_offset req      idle     g_mask   delay wakeup */
> +       [RK3576_PD_NPU]         =3D DOMAIN_RK3576_R("npu",  0x0, BIT(0), =
 BIT(0), 0,       0x0, 0,       0,       0,       0,    false),
> +       [RK3576_PD_NVM]         =3D DOMAIN_RK3576("nvm",    0x0, BIT(6), =
 0,      BIT(6),  0x4, BIT(2),  BIT(18), BIT(2),  0,    false),
> +       [RK3576_PD_SDGMAC]      =3D DOMAIN_RK3576("sdgmac", 0x0, BIT(7), =
 0,      BIT(7),  0x4, BIT(1),  BIT(17), 0x6,     0,    false),
> +       [RK3576_PD_AUDIO]       =3D DOMAIN_RK3576("audio",  0x0, BIT(8), =
 0,      BIT(8),  0x4, BIT(0),  BIT(16), BIT(0),  0,    false),
> +       [RK3576_PD_PHP]         =3D DOMAIN_RK3576("php",    0x0, BIT(9), =
 0,      BIT(9),  0x0, BIT(15), BIT(15), BIT(15), 0,    false),
> +       [RK3576_PD_SUBPHP]      =3D DOMAIN_RK3576("subphp", 0x0, BIT(10),=
 0,      BIT(10), 0x0, 0,       0,       0,       0,    false),
> +       [RK3576_PD_VOP]         =3D DOMAIN_RK3576("vop",    0x0, BIT(11),=
 0,      BIT(11), 0x0, 0x6000,  0x6000,  0x6000,  0,    false),
> +       [RK3576_PD_VO1]         =3D DOMAIN_RK3576("vo1",    0x0, BIT(14),=
 0,      BIT(14), 0x0, BIT(12), BIT(12), 0x7000,  0,    false),
> +       [RK3576_PD_VO0]         =3D DOMAIN_RK3576("vo0",    0x0, BIT(15),=
 0,      BIT(15), 0x0, BIT(11), BIT(11), 0x6800,  0,    false),
> +       [RK3576_PD_USB]         =3D DOMAIN_RK3576("usb",    0x4, BIT(0), =
 0,      BIT(16), 0x0, BIT(10), BIT(10), 0x6400,  0,    true),
> +       [RK3576_PD_VI]          =3D DOMAIN_RK3576("vi",     0x4, BIT(1), =
 0,      BIT(17), 0x0, BIT(9),  BIT(9),  BIT(9),  0,    false),
> +       [RK3576_PD_VEPU0]       =3D DOMAIN_RK3576("vepu0",  0x4, BIT(2), =
 0,      BIT(18), 0x0, BIT(7),  BIT(7),  0x280,   0,    false),
> +       [RK3576_PD_VEPU1]       =3D DOMAIN_RK3576("vepu1",  0x4, BIT(3), =
 0,      BIT(19), 0x0, BIT(8),  BIT(8),  BIT(8),  0,    false),
> +       [RK3576_PD_VDEC]        =3D DOMAIN_RK3576("vdec",   0x4, BIT(4), =
 0,      BIT(20), 0x0, BIT(6),  BIT(6),  BIT(6),  0,    false),
> +       [RK3576_PD_VPU]         =3D DOMAIN_RK3576("vpu",    0x4, BIT(5), =
 0,      BIT(21), 0x0, BIT(5),  BIT(5),  BIT(5),  0,    false),
> +       [RK3576_PD_NPUTOP]      =3D DOMAIN_RK3576("nputop", 0x4, BIT(6), =
 0,      BIT(22), 0x0, 0x18,    0x18,    0x18,    15,   false),
> +       [RK3576_PD_NPU0]        =3D DOMAIN_RK3576("npu0",   0x4, BIT(7), =
 0,      BIT(23), 0x0, BIT(1),  BIT(1),  0x1a,    15,   false),
> +       [RK3576_PD_NPU1]        =3D DOMAIN_RK3576("npu1",   0x4, BIT(8), =
 0,      BIT(24), 0x0, BIT(2),  BIT(2),  0x1c,    15,   false),
> +       [RK3576_PD_GPU]         =3D DOMAIN_RK3576("gpu",    0x4, BIT(9), =
 0,      BIT(25), 0x0, BIT(0),  BIT(0),  BIT(0),  0,    false),
>  };
>
>  static const struct rockchip_domain_info rk3588_pm_domains[] =3D {
> --
> 2.43.0
>

