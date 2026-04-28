Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEE6FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 11:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=377DZ0H74TNC/FjMducyHBrMyeDlo9XVy4S3FtiAAA8=; b=D+69tSA3vtZn1VZoYwqXEVHGot
	lP1I5XrQF4R9yca/4ZIj/5jeqNiFI5utMNT4gqSAT2JYSx2P1XByXaUB1g34nwGjlpAsx5waFoeOC
	8Lk5hPkliug0sNlCYhwhMN9ui02fi4Bbccg4xf+SyNWeLlGPQrIN7gsv/dCw31GoP8DXudrOZDnxb
	9/oaX2Lh2rsU6VsGwFTepQZG4wQk2QgIJaGUPW2SiDBRUt3GzbyNVH7en2VWBPPdZFmoLeQDkWf25
	d4B7momQNA1amu+JB5PqEKJ1MUMbkSgY7M2t+VXuZQzGxJvxTE1pIgl1/QVm+QtYpqpEy4XaCpnj3
	3t7XRbKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgjY-00000001MjP-1NQU;
	Tue, 28 Apr 2026 11:36:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgjW-00000001Mim-1NsX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 11:36:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9GI61662986
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=377DZ0H74TNC/FjMducyHBrM
	yeDlo9XVy4S3FtiAAA8=; b=B+Lgz3oMYTYR4aesU47o2XByUa2L2NvhtqZpnQ1S
	+6tFes5t/42QcZqpixbU0hAi13wN3SnBRuEIzsNj4+GTibV1XvIYfKANzp5Gmqm+
	GCyePvUap/48NGrRcecJ3NjOADXiT48gIn6V3rZWArVXOPcxLgAjE7ekQv3AYrA3
	RZPPBGn/1/Z+cFFjcDTlt1Ov81DwrRwI23EKhcA1hlKpgVL9KWrCpHuvN6TR+UEk
	NEAxy7lwi5QJ5nuFhStcvwx4R/MHRlqliD3VQRu5Sc/Z9nvoR9ixirZDCTuUnFrZ
	3GltPHWibQBUx6gCP2na6I/3Nd5xxg5RZn+XATfBqssw8w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n3q0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:36:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d812c898cso298895651cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 04:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777376165; x=1777980965; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=377DZ0H74TNC/FjMducyHBrMyeDlo9XVy4S3FtiAAA8=;
        b=Jlw6C032hWF8xUuP5alvEdfpMfAvF/YndmuVmSAqs5QyYnc5JFOF/DYltNL8pi7bjX
         9gIqB0iZGabFiPzNbBT2mAiYLrgTOMFs4OUobWEtM5mi9XMaBGZ4EuNZTzWq4ax8msLN
         4RD/K6sZkHkha/HA4dZzYFWDqGkd0frqnU2vbxCzG3Xy5/2a+Or8wbfMiOL1HLgnwfEv
         IXpqdUPH3znIci2lY8kXZ7TbE/ICTtI4EjlTlYngP4bKP9kXg1Yu+CZwUdzQ30yTDlf8
         Qr7hAnGaP5CZ/+oUM/pPHVABLrz1kdIC7D08bTmGYqsb7zL6zi2LwqLy3VccOR1VuBn5
         gK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376165; x=1777980965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=377DZ0H74TNC/FjMducyHBrMyeDlo9XVy4S3FtiAAA8=;
        b=lTzo+oWuMf8WWjauu/sTv8hJYLWWTktZkN2hLuM7uDjE9EbMTHPjCaochBdO0uaiU1
         ONKeSNbK2cqfuFTFZosCzbbIhpsCMNmZlCI0PZWegZR+y5WGEmDy9dpOTI7kFb7L3qzl
         cxZjLs4DB6SJn2xnOd0J0ix9SYN7nYpE3irlhxZQapUhSG/MEl/8Ne2ND7VXO58chrZ2
         VwRRCqji3UyToD9lm13EdteWH/YtmoeJY3mpHtKFyrSgIpcuw/F//ZCucUYIHTjJocaI
         fu7zeiWCySfNc1UKF6aAtGKxklY7ZB/l1F6NpBALBD9rwiYzEXv6gHOxawNjY2oZjIcy
         Gyzg==
X-Forwarded-Encrypted: i=1; AFNElJ+h/peDG13EQi7pWL95T886dUEHx9s33XkfOlh6ljQaEqlR1EolOqZigVlvmRIPIEemrVuMnFWPSKw50IzDWsDs@lists.infradead.org
X-Gm-Message-State: AOJu0YxOQvAsmrbohBhSycOejHGX8gPhHehXqXwCUGcO/K/mVnEhlwf1
	SERNUWWXGdCLw3H0TdnavHby3AAFH9ccGKKKU6Jod+hSXHpuhmMUMiewYiTVy4UqjxdWT/6HuND
	G3GYcXS5Jo05LPStpHzoUvuTWU18qVlqFFYav7shKSfXUMXPcP4ItOPTTX90wFHYXvOqUG3Jser
	mHqg==
X-Gm-Gg: AeBDieuHbIL0PvAqDoKTuEiTN5NMIoCuu1EWq2a2ngLI07P9FohCaKr5tkW8X3zfgjK
	1UdLSZqFhlGCIZUVomZ1v5C3S/gloFMuhpsbdU1OtvBeKlwrGwllBB3KnAnD46jTZWpsvJwwJyr
	1AXLg+5OJ8gbS/m1O0FQ+NefXgT+r4chB3tTkvIdui7Xm1QHIsKOErfq528/UvtJcyLkGjKhM5d
	a5fFRfrJ1VKleI5vaZHm4N/KtS9uGGdylELM2ENgCZa8mStErKnQvwZVQijHpiL90DJB/6CLxEx
	gC5UdpYWGEvjxhe93xysJfr1Q7/7A5UvyC7LFczr2Wy6TcML4gva6K9BdH3PDCehNTSbkLyATee
	slyJOetddieCp6SWLkPXvxKnYbir9yd4iRhVH2tDXI51NQgAC2kq0AVheY70rUcwL9BQIRv1Rhu
	/RxFcwOjNaJO+jhKSAftyf5ZDKrXIK2StnxVXJb01up/e42w==
X-Received: by 2002:a05:622a:2c7:b0:50f:be4f:465b with SMTP id d75a77b69052e-5100e1a3f31mr34440761cf.33.1777376164760;
        Tue, 28 Apr 2026 04:36:04 -0700 (PDT)
X-Received: by 2002:a05:622a:2c7:b0:50f:be4f:465b with SMTP id d75a77b69052e-5100e1a3f31mr34439951cf.33.1777376164190;
        Tue, 28 Apr 2026 04:36:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f9f3esm547988e87.56.2026.04.28.04.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:36:03 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:36:01 +0300
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
Subject: Re: [PATCH v2 05/11] drm/bridge: chrontel-ch7033: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <3sxkk7hrom35lea4hgfmh6fsm5ikyq7zm4dv7dfg7qrotgvxuz@i6hgeeliqh64>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-5-4300744a1c47@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-5-4300744a1c47@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNiBTYWx0ZWRfX4xYwi7/+Q3JU
 3M/XF8vXAqeLokKXwXwdaFkZhqi/hvnd6rI44/DbQo8+Q4aNxCc0QdRiEeWCBpBOUuzqYQ0O3Up
 fhZVTWa4NsQssKGk4+26O6YLgy+LClchkL77R4eZyVhSXlg0I/rVVTfZCzk4vyt4KgYjBd0gorE
 Da42GFmklCUAZGe44b0tBUbCrOjd90g3Hjr6+agN35mgMrhKIgRFTL8hdf2CjVx8Iv/WPJxbFUv
 t5Dx7oqAJ7jh9GlA/BQEK1vbdC767PYDLdbFIveF9euB84JtWhburT79HEkNkq1zxn8muGXFEhM
 Ozs8P1zBvt0M/Z43hDHw4YLTz4itKn9KE0Y8xefEDeQTM7Af8/DnQ3Igmj/xDmhD1S5w7j92EoQ
 L9Tzu2V1bzTNnm4g4BHSeqxhW7/7CStqhKNKMXpet9jHxH7oOiUVczyWw9FoeIcJSla0/6+9z/D
 61z1X4K+ChUke3P6YQw==
X-Proofpoint-GUID: ooDHIIKrBV8tAWKyxkSgLtyOeOXh74YR
X-Proofpoint-ORIG-GUID: ooDHIIKrBV8tAWKyxkSgLtyOeOXh74YR
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69f09ba5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=3wW0AoOGKtJXkwOK0G4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_043606_482763_84C8BFEC 
X-CRM114-Status: GOOD (  17.31  )
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

On Tue, Apr 28, 2026 at 11:15:51AM +0200, Luca Ceresoli wrote:
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
>  drivers/gpu/drm/bridge/chrontel-ch7033.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

