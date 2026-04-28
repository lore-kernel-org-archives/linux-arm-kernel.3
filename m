Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE76FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 11:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oN/nRVkS1oynahEcEXi/uXH8DKUZjrkBQc+KfvDpf8=; b=D0uFIYDQ0RHZgQu8ZRtwzJK8W3
	y2uz7rOInz3xBiSLtqFm3ADTiUHltahNIiXwRGHUomADx0CmCQG128fI7hw6jykuVCO1l0nuf+S39
	BojBqHAThlKvgjT63hOKpiL4ehmq9tBTbxLg7r3wMvWZXZne8KM8YhZhP+olDmoq45e+r018xcBvH
	QXAcTD5LGfq8ud2tyJVs0ipBPSViiGmLroL/bzt8BXGY94UutyssNqvON3yozOzUX77jkQN48CKn2
	lcAEBQpPSt0wkmUcU2CC1+wA3GTCBU2uw7KwXmawwvq7VJQuW2UG/oVxcyFJbe0PEayBlO+C0a1nL
	MD9pkVRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgi5-00000001MLs-317y;
	Tue, 28 Apr 2026 11:34:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgi3-00000001MKi-3TJL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 11:34:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7XBS6440834
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2oN/nRVkS1oynahEcEXi/uXH
	8DKUZjrkBQc+KfvDpf8=; b=L8kw+96pOMOVax7PWlaDruPRyzLmzLYh3AeAI6QO
	fyVNNqXU3NM3UuPaZACAPDa3U7yYhuo6rFLULi6Rwjc5VN7u4L7mRaPDVA6OgZ1P
	ELLpDbuCnLDtmN3w/hqjpUUBKmDGy3th2/uoIbjAs1JbIG5T9r2eOSEK2RtzKj1K
	s2nPAsQ6d1+RCo9itSHV7K8IAERvKzj3wniAxh2fjXK2QmVjGxmlhSH6MF8yD1a3
	jPg3ZdN1th9x9GDF9jYVaZSiixaq/19K32+zABtKY5kRZuY8jvTJDMikVMBJpm+O
	khuS/apglHSXVxJqMQLEKxgpjnhxsO31KoWx8Jbp9sfDzg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac4465g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:34:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50faf575af4so67194361cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 04:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777376074; x=1777980874; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2oN/nRVkS1oynahEcEXi/uXH8DKUZjrkBQc+KfvDpf8=;
        b=WtLellCV6MPo5v/b/UtmjnnbixWZ5YkwhLzC89RSZRsmgY+blINLwU/IzROCdsDXWp
         1YNfpH+WPfjSGMrgODZwltC30fUkXmqZ3XEc/MR4rx6vskWHj9kICwnYYbBYDwsEWqeP
         aBfsaZQ7+Cxz3vwir/VRxuMlr17AnWMUT/plPHG8cubP0uvmgc0b/P7fF8FF3eEViBqS
         7kInwXKNbpt3oItTInvfObdeNr8XznH781Qp7vyMQke62WNnySDlQxub84g97KRkCD4y
         tfbCtq98GYQTId+RQQW4mEzGwLg0VOGj/ojjOyy6xPxwCISHQHp0IqB78H0wvtce00R6
         5rnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376074; x=1777980874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2oN/nRVkS1oynahEcEXi/uXH8DKUZjrkBQc+KfvDpf8=;
        b=L8poIT/WEOgM/tmo8JJ7Y8vD8Z90iUSUJX5O9SYUjZ+15pYkgQSgi+xiBS0tVW076W
         x4Mkhoxi6Ewnu1cpHzemvL++cg7yuQtfVNkL/jcAfHLXpkBIOp3yXihZvjZFeGmb/hlu
         u8L36UzozI1geur6VbcG4LcJ4cUELhdLbUfQriuXHPFcWZJg+Wgfi3PlqC7jvWQ8P+gG
         2FV1zNOanW7p2vVAUzeagVFZUOpXv0dkV0ZPLgP5OHS2RwzVQGZtS3CoJgznxn3djBzS
         qFuKL4V44b/RsY18SuUI+YXs9ePj0cJjmnaTDAqR/auYWa7ZPzn5gwAIAp1xn0N43s2w
         WAeA==
X-Forwarded-Encrypted: i=1; AFNElJ8xxFUOTr0AJot+t4XMuBqsD3zT15LRiCfnD7K7A9H1hSAqFHbKg/sMFbO4OBT4z3R7THTzWRCKdk6kQ0Qmht9A@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2oqNoCOH995sNtSkpM5MT2e7hVfjNi/GuhJOn1vb+Cqlp3Iw0
	4epAlCT2/sfZ01iNwW/7O7Cw+BE7cPsncLVB/VpjF0eiJ8/MrzzAQnVrNz4s8KnCQ3aNmIoc1Wc
	O+3cEwcIsc6S4JVmWqSg+EbYiqj5ryIde9NhHkQcOnzcX/JBxLDp+0jOtoZeCmllD5obbIIwbkQ
	bbuw==
X-Gm-Gg: AeBDiesb0DIKNudQ5/nY0uuPfkJI0ftTD9kPMVWbldLYT1/D59HygDjuJu4df544oTm
	eTUqvNPBfE5GqqXj5wh9jbeY3hdkRTghOWvg6dPiJEDUpE43R3f6V5Gzj1bgpB3vYIty4SzIPao
	QTzUCN7qDHwPMVhIxvYJEHiog2fbcFKxodKuNxADzHALuRcZW8GjgvBs6vKk4Bbl2VxmEg2Vpg+
	iJ8sV2I7LVOUFCJb+MsfTsFM5cvQVRe6nkkjuxfuDPMiN+GcegGM8EKg/FbTHgd/KiYYbBFq9VU
	jMN5C+fC0Ow5Au438c+Zq6F/VoR2gqymSc41EGXwdwzLYoDh+CmeLke1tMQnIZdyk1UYI8LYuXC
	ajrLUrK6Xos6rtgNjXoEj9iGlRt3ZpKVDpoVKF2Xg75jMo9sLAE6CfkcwL4Fd1Gjl8UqM4ovXmH
	tObHF2WcDBuuySeXVrZ2m94oEMVLtPt763R9k6RLkRjG4Wtw==
X-Received: by 2002:a05:622a:4a8e:b0:50f:783f:31a8 with SMTP id d75a77b69052e-5100e19a66emr34473441cf.28.1777376074165;
        Tue, 28 Apr 2026 04:34:34 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8e:b0:50f:783f:31a8 with SMTP id d75a77b69052e-5100e19a66emr34472571cf.28.1777376073577;
        Tue, 28 Apr 2026 04:34:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74640b51esm540937e87.77.2026.04.28.04.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:34:32 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:34:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <jstultz@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 08/11] drm/bridge: adv7511: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <6xeo4ctvhpvnas53uptyzyo3uu3ooydchqbv7u3eradrcb7r64@meatvyekusg5>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-8-4300744a1c47@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-8-4300744a1c47@bootlin.com>
X-Proofpoint-GUID: RK4hShGpq9knLPne0MzvGuSoUSCFEWGm
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f09b4b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=8rJAFfykPjGPsRQMFU4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: RK4hShGpq9knLPne0MzvGuSoUSCFEWGm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNSBTYWx0ZWRfX+L3BU86yXanL
 Sj8wfc/fKJ1RxhxsbuFi5ABrkx3mg9timZXpb9Ql96biKFiS0DqirON2I89Rh+Ohtdtu+lDDo9w
 0OT2V9Q7pMSmpcNQ/8yAPhTjyLsc5nU5acFALPhzSFUYmFIhz6LBV82/ytfFmEvO1l+ZJCzEvqc
 YR7laMDSFpYLdBU4+Qux7qNYfK6ndoyqR1qXSjlriEunrjSvCNgAgq76e6TI8NYljjt0UzqbgRg
 6ZWXLnnCWEDthL6sWseIMrySEG1Ui3ths3d9GqnFcoFdMOF8mAeNYSe3tPx0fFgNlHI57l1Fz/q
 IHby9trYxY+d/sRERz1Z3/+kUZLspTdfs3siyguw1zJaPkQviOEREsDu6pgO+Knei4FuB89XmnK
 VIbNQ926rVfhcG1/wIl0MmiHHKG6++5mW196aHbjY10DCNttpKbicTNPNV3tvVPb2b1c09MIoA8
 XXAqnqDPFnYiO+hy12g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_043435_872244_B30F25D8 
X-CRM114-Status: GOOD (  17.68  )
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

On Tue, Apr 28, 2026 at 11:15:54AM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal. To achieve this, instead of
> adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
> pointer which is automatically put when the bridge is eventually freed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 -
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 11 +++++------
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

