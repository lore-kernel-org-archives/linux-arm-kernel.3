Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E18FF8870
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNhntZyoOnGHOA0x4ScHYcHWxSRqZTMx43yC0kuuWsU=; b=yzSEyYCv7ApXbziVb4m0DUkGeB
	UIv7QHsPKetdNOTPWFR+xA881OiXqTF93ToAQvo9FTIV/XDRAf9gNfp9U/9JQBNY0oYN8+NccE22X
	TqWYPQGlUeCGFxezg+/Y8kQn0+wLsPbqST4DApmzoDyMdYiGHOSX/FkOQAW4386zXDcOVcuv8URZX
	gy3KhIX/TSpMxdde5rf37R/tqYRJLDsgxS7xnntLWg7iaICsu7m4mhsyDRHgmHgzIvNXuvm+ibrFQ
	4lKZNOt3VipguGsnYps0rvZ8DYx7wacmI4F9DJOdnzH1cue1DuDkg9rG3MLlp+1pUF4tXo3mDi6St
	p3Tnhktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTsg-00000000CkW-41wW;
	Mon, 27 Apr 2026 21:52:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTsf-00000000Cir-0EV4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 21:52:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RHc5Ks1238182
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 21:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CNhntZyoOnGHOA0x4ScHYcHW
	xSRqZTMx43yC0kuuWsU=; b=CZ6Ss6XTBvh0n7I8Jn5kTc+Ex/cTe/aMwy9GsBd0
	TvHeNCdSr6eogQr6g7f61TOvBQGG9oFOyZ1VH2Qkz5+vF+oJWjooKB0pBITckyLo
	/n2O4fJRkSdmkzTnJ3wBaBJJ/62iVJrB23HgXalmxefV0+Bs7mxpyOW1VEHGhme8
	AzH1OsfTMcabuFf0EiE2t5oDa0nwOSDO/0BmhDVxi2zZR0rQ3tNCXcYzFoJCSzKD
	lOXc5glwNc8dubirwbeeyDvewdqc2B0pQFaMvfqsWe1hQH2J6kn6ifpaIWcHhcW/
	q82QEhVjHBW++2FAsXl1FNFIOOlT5x4+TKnZQxYzTOrXcQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt6n4jbkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 21:52:39 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56ef11518d3so19085370e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 14:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777326759; x=1777931559; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CNhntZyoOnGHOA0x4ScHYcHWxSRqZTMx43yC0kuuWsU=;
        b=FTKThCjut7hwJjX6kmSapjBqbaVt/4bZGegQ0l3uFs7T+dSihT3FyA90jgR9jTD35e
         2ic/wPw0XVTP0R4PwT74x0gqfNrg4ce7AJv99TNcLTYp/KC0KsBwnEACXqh3zgLIKUD8
         h9+0fCcoMI1GaBOSoufw6FpZd+5sYS5UP8jNAvba1NkbvuIwdQ5mnwnPRcWLqX3Jfsqm
         60Vz+7fNy4S1nQ4KEkW+Xl1MspsY95RkHvtrJy6h0CD/USnLYe1talZnqvAUy5/qbVLH
         +k11pySQF86/Wx3uzVsDnkc83Kb9OIWeE4vwKSyi/9NIfgUo2JWukRuxQ0eThKQTv4ZD
         d8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326759; x=1777931559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNhntZyoOnGHOA0x4ScHYcHWxSRqZTMx43yC0kuuWsU=;
        b=WGfqQpOZMMvNH0vTVpWHReSKS11g5l9hoM2Mt2H82HYB8xkaNQRJOaw3C8RCqxZtFJ
         UCWdoXKMcwotc18JfVzd+T4Q0tAvzF+JJfmes1X620pik32gNcSgcoEyAjovAmwWs3oj
         +PM3GH1qs2z+19EWE0xGqQOuXbuxzK8CFvw2bKaLZxXekrIipQ5OWBBkaf44QuZgcWaz
         uSHYg1w3iU+G+uzTm+QCLwER54ulTdMEtt5Xut0sTYTVA1j2v/Skpg7o7pVCjoewQIWx
         kOKvobItXJLp2ZvNf8CdeKKdJV/1Cr40yWnwA5lAME6lH2qnGsIDDQ5Rcbn4BWcbm4q4
         vDmg==
X-Forwarded-Encrypted: i=1; AFNElJ+s/sF9QKuOXM23ksgS10hA+hcciswQkMMsrXA4Hl0N57mm9f16+q4kEL8MbUOg1nzqqFkv/lPHz7TLIdNoB+68@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdw3RRCCmq0qjWS42q30T8KudUD8K9N2YCoHlAiig6o7FtlVyH
	UNGhVXLpVlUKwf/71y82GFW4lbjm463euGm/TJlAyp0NUU+vMSKpjiCSd+FN4A96J0pqVUqAm8j
	a1zWKkJCDb7gZI9Q3f7MGS3793nE6RrAhK5fdwJ8d9s7pBfSSaqZoQQ5mPPUp7+9syfQLdQVd80
	SQdg==
X-Gm-Gg: AeBDies6f586cZWkQl4gXE9d0ZkgmeNGZGlVvU9pUog3tnGAL5G1NToyHd34Y1Wb8fX
	sJdfkDZ9VRv4jMloaDlKPVwe7JteYr4Is4ZQcba4iWLYWUcRVbx3XVQuR53rWW1Y/KxO/ZsU7f2
	PgPczBsuOP3DAJO3hhq25/tfDXxWHkivcMtIC04jICZhZcQpJaefl/9e2UWJbJUsWibDRr5Btkp
	NWZGTUqiGCsEEh8NPnptRQxtEKioO8+ymlZKNIXUQoRC2+cY/MnnbFGGfibhqz98ErsdkwpQ3ce
	s9ZZu85nPGrKpSH1bCbbqb2ll5+/SuPhXxp3rpjFbSp4ZLDROMBrOdr+dpgK/VBZOYi0gPCkI+a
	cpP/6PDd5+FdRDUExNMRTEwIhkJxHKfc4vQ2E6bzJTHHfgfPJ3nAn1VTH4ROnXNPM/6SQeMOt2I
	S3pOSJkmtULFLjp9oFHR+FSuKn1g+CWAglOt1dUZzh/Udo7A==
X-Received: by 2002:a05:6102:46e8:b0:613:6b44:3fad with SMTP id ada2fe7eead31-6280b3dcee1mr126948137.25.1777326759236;
        Mon, 27 Apr 2026 14:52:39 -0700 (PDT)
X-Received: by 2002:a05:6102:46e8:b0:613:6b44:3fad with SMTP id ada2fe7eead31-6280b3dcee1mr126934137.25.1777326758789;
        Mon, 27 Apr 2026 14:52:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f2e3237sm1638651fa.3.2026.04.27.14.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:52:36 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:52:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
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
        Andy Yan <andy.yan@rock-chips.com>, kernel@collabora.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 03/10] drm/bridge-connector: Use cached connector
 status in .get_modes()
Message-ID: <4zvprx4mytr22ylibmoj2rsrjzkrnnuumucohodrl75cwntxcj@5wixqw74n6cs>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
 <20260426-dw-hdmi-qp-scramb-v5-3-d778e70c317b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426-dw-hdmi-qp-scramb-v5-3-d778e70c317b@collabora.com>
X-Proofpoint-ORIG-GUID: kelEhbr0w_IBXwnf0xrbDBqEBvUMR_Me
X-Authority-Analysis: v=2.4 cv=Xba5Co55 c=1 sm=1 tr=0 ts=69efdaa7 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=ANRcj1VhA4TbxNHgoT0A:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: kelEhbr0w_IBXwnf0xrbDBqEBvUMR_Me
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIzMSBTYWx0ZWRfXwGjjK7OJa5ov
 9uJdlSrR/N75fDbfL+htKshkUaEkM8wyqVroajyyYa1ZhATYnxYwdzMu4zV/RCuN/7SQ2y/yD0i
 oCtHmSQDfHamj1nNR8+b3CVQNQNbDsnBBR1pym62lHvSw0KGnoQioYq2b8NAaqWKUOYbwZ1zmfV
 r/z/mkzfW+fy3V3v9AdiRbzdy6gYDCHR19N8Td1kiwJJtFnCksk7Rxx60ixXW6hXjk97qKIJ+zG
 IeHxh4XUqYjBJME5hoBVo8CEh4tIcMiPuE7NqK4JfVmpCdblRwEvsApZM+WddlHB/mWC8YPIbti
 otwPw4s5wR/e3RQocypHTItNNQvb5Wg7hvHR4s25VmY4FSpWQAG/Teb84ri7l49w6t2Ej7IZ7qm
 OVzmYMWahNBBosrEyPVFaDFHYT1Wr7Bb06B4+1Uk4UxVhLx0Khs/y/HYvY8R3rzh1w55tMlO9ZK
 wMV4CuUeJ592oLU5ryw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_145241_212327_80AEDAA5 
X-CRM114-Status: GOOD (  18.12  )
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

On Sun, Apr 26, 2026 at 03:20:15AM +0300, Cristian Ciocaltea wrote:
> Replace the active drm_bridge_connector_detect() call in get_modes()
> with a read of the already-cached connector->status.
> 
> The .get_modes() callback is only invoked from
> drm_helper_probe_single_connector_modes(), which has already retrieved
> the connector status.  Calling detect again is redundant and triggers a
> duplicate hotplug event.  This is also a prerequisite for switching to
> the .detect_ctx() hook, which requires a drm_modeset_acquire_ctx not
> available in the .get_modes() path.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

