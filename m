Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB92FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 11:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/g1pLI4mNZbrwEdtyTJyNTghan7Qo9/UMcQy/830Ak=; b=4bNXLeMVU0JpNtV/aPbkOzePGX
	LpR4ap7dAFcMk92C8AelX0KZjnDOrG5JM3A+dfI5lXqQqEifUmD/Ev41nVAOk1+F+JReOJ6y+LPXP
	PaNiO5lIPrHxzqo/UiLD751TSU/RVL3eOjKvAXiUbMkpPSvF7mI2J5Ol1qTlQqwhNtZUiiZn3heqM
	LiC1Sc6MyLfsb91tfIgXVXnk6cXw4F8npmLvHwvjsPjrDPQG1u5NxrscQSgjMBga/LWa4/3OoFkFc
	HkP45KlAmmxCXyDfppFyTuXvAgF2D6EKsxCHGhiekuHY78yRbM8tPzPX5Z842At+UHxS/bJq8FLnK
	EMYJs5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgj7-00000001Mar-2DPb;
	Tue, 28 Apr 2026 11:35:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgj5-00000001MaN-0qcj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 11:35:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7kNAs440971
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A/g1pLI4mNZbrwEdtyTJyNTg
	han7Qo9/UMcQy/830Ak=; b=RXJFQtnv/KelaOTf9xlTgDrRl4vxTD1C+QjtKDFg
	t3bEVbncOvp+pztncf9CvywwaGXy4sp5Hulg3c3+k53tJtQsU7WYEszNKwYCnXKU
	fIJq/e8V0/QDWHWrTlXrxOkl1bNu2Q/LTkq3nGOQjNvBsgBxLvichCTM7x/MEi5E
	hDNS17pgcNpgIri0xLr42lAw/S0ElEkmr9Dug21BqA2Etdz58eiak8Bswjo3kZJR
	Zz3bX0O1Hv6T+jvMLtB8CttFWeQBxFQDsdX6v+XparIxt0wwUP3UBkS1dtBxXATP
	J0fkWPOcVBnHjOiPure7+lvXHRVIqBC8UP/x/ohT7cCwsA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac4469t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:35:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb007bc36so6725581cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 04:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777376137; x=1777980937; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A/g1pLI4mNZbrwEdtyTJyNTghan7Qo9/UMcQy/830Ak=;
        b=L0zX6+VFPVzQbYB9KACg/vX+lgRqoHEC1GALpX+CJ5YkwkRDo+TkOnrvRK4vN7f/Ll
         YCDdjlNtYeWTnuEL2Snj+utqYacGs5iC1H8vfSudu6kwClehFDvZUvxKCGVNrtKL5m6J
         D+oAk5eXK7+7c09+QWea6FHoy5Cpw+B1uxLl3nybJEy8pm/c8JJROk9WzcBs472rLNG4
         Jyz5M6BsVkWBIKkQTNlsI3eQ+ajXgaRegOHsd75l9VcCrz+rwQaCXbtXj76BOALT9Iex
         oXEhXahjh6JBn6E4GuXkfhuKjgEgAgve2LV8LMeRb6u3EBC9wEySy23cO/Y3v8i89P7s
         44yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376137; x=1777980937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/g1pLI4mNZbrwEdtyTJyNTghan7Qo9/UMcQy/830Ak=;
        b=oh16ymUhy8uzdobS/RdcUZIrFyMyKIp5ufzlvBH8t+e8vSOLE8L61/l9l0vu3IAC5c
         kAwj73pbBolTSoDJJMrExONmD3xN5JK925yLRebfM/s1E5wmj+pUbhn5O6W25kHlygVV
         fX0MQRdNOgFA07NuZMep5sTd3rMnHp5d3e+D51ZeKQ2ubE01rqY37BgS8JzMZV7LV37y
         ktb3dHwDiFOAjZX/lL8zsbQrHiJ2XbGGKZu13/sDJAPk954soQxkddvjIdFUz7s9fyyg
         1TaXFY1E8XzHLz2f5GFrnabVUBiWezzNyIuTfoJFKt1ofCPJ1aXdz4CC6ur6YiDniYms
         lhqA==
X-Forwarded-Encrypted: i=1; AFNElJ++/0tXGyoPYe3xaZnAXbXhsf98s70YEXA+pp9C6hn96G++jq3TnsX/djtZ/Y3UiMDJ7C/bHzKLcj2dVW8RZDT2@lists.infradead.org
X-Gm-Message-State: AOJu0YzufEUL3f83r8KXpTPMwfq4MRDzKO8doHMz3p3nvW49SRzBbxoV
	KRyoRTJJhlp/f6qZRwaGPZcTgaKC3eChNPeSSdeSEGtj/zboq5rpI1eS8sfQKBgrvqCtYjCjrS5
	jxgQvUCD2QwqFw5BJjYr+UlbtLkYs5J/mj/irEqHKa3dC08BkPRv5Ob9/Q4VB6CXTBD8yqKRGcw
	AwCA==
X-Gm-Gg: AeBDietrGbf/g53SEu08uP51hNzPo/w9KNxKDIRlfhBrgX7Y3oSzXDlZ6UEMMdU5Txq
	FKlw7GP30tsMqbMMHeu2mCr3dwGNvR2RjoTa1fVKXEju+9FfZ6AvDQaHLTGRHzveFyDyriODeTK
	Tsnli3+UmXuRaWMpnyo/UdzPo0yDYl1iW25oHxX/g5cs/JZchYLD2rvIA9g5qUcPCo06j4UKSos
	QdSLi9dV1+eV8cnAEUhC3S32LGpz1Lq7AXatWU6tRBEPE5KTrkdpI7vWiKU0ECHrs3RsQbse08/
	UkS7NnzJaxMuVECc6Jk4ABWn96Dbl5HPH4nXILMliVuZ98sZ+kMa4hODtSK5bdxxnv6hEU61NWk
	uWBbIqffpY41WHAavcV31a23n/M5GhUMVJJVUajQabUzaNpvmuSjqZMkelPPLp0w9Sg+pbLjnmt
	Ey1Zb5zxzWEnf1K8kpYEcVS2A45nWiTHOruDwBeJEwLoP4iA==
X-Received: by 2002:ac8:7dc5:0:b0:50e:631c:c390 with SMTP id d75a77b69052e-5100e1d08d6mr33550571cf.44.1777376137479;
        Tue, 28 Apr 2026 04:35:37 -0700 (PDT)
X-Received: by 2002:ac8:7dc5:0:b0:50e:631c:c390 with SMTP id d75a77b69052e-5100e1d08d6mr33549631cf.44.1777376136857;
        Tue, 28 Apr 2026 04:35:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7462d8681sm552176e87.36.2026.04.28.04.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:35:35 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:35:34 +0300
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
Subject: Re: [PATCH v2 11/11] drm: of: forbid bridge-only calls to
 drm_of_find_panel_or_bridge()
Message-ID: <fjveutk74w2iwbzibrpeu3bwlikunkpfea3cv6majekjta7o5o@4tucid3myk4h>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-11-4300744a1c47@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-11-4300744a1c47@bootlin.com>
X-Proofpoint-GUID: kBnLoFJz-CJvKfhMjScRHReUN8GNEHLk
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f09b8a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=ihHiGccrl-12bfV6lMsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: kBnLoFJz-CJvKfhMjScRHReUN8GNEHLk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNSBTYWx0ZWRfX1XuWBK7emaHu
 pdpBpgBy7T5f/UnJFInUi2PS0vDsazcqz3fYxH95u1lpPuPbIWLYtpUkNBbbbgSJFeuBze/FPFA
 u6XVgfqYLbOY27glEodUTcmAvXhk4hF9ASTeNoCDrPBv8AqDihlPHmqiX4ofBEeR+HEYOjbJNj9
 8STQg+/RJ6PCVL6ahSDjy22WUzsdNgxnxoq3XfnD40qZUQ0iXPnqRwT8H3wOMM/ddsJkvGidyCO
 StVIJp0gSscdfQm4QJHW9gmd03Ts2xYwuKvlLBy32+QID7PhqoeHFoTjUMszit2b89FfUfMQcgL
 MjCOyqmO+XWwJnwNgRBfqWdPLd1h0E53lD7ckObg8HLpGgZ419rj4okshhayraNx6AKfbw+h1ft
 VDchvZTcgXYPmjX/9SjX/jNWwgEC48kBo8iSvgZpkjPR1D4SVS9cbHGqOfjszRl4xa257dPQPW3
 G4y3kr/lzn5n5fGnhCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_043539_246011_7331BB30 
X-CRM114-Status: GOOD (  16.88  )
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

On Tue, Apr 28, 2026 at 11:15:57AM +0200, Luca Ceresoli wrote:
> Up to now drm_of_find_panel_or_bridge() can be called with a bridge pointer
> only, a panel pointer only, or both a bridge and a panel pointers. The
> logic to handle all the three cases is somewhat complex to read however.
> 
> Now all bridge-only callers have been converted to
> of_drm_get_bridge_by_endpoint(), which is simpler and handles bridge
> refcounting. So forbid new bridge-only users by mandating a non-NULL panel
> pointer in the docs and in the sanity checks along with a warning.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/drm_of.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

