Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CDAC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tfd9haVIEplY3fZh8UFTDF44fFE4kBR445IEmKqTe9U=; b=SYkzdqiqa6JaTJl9WUVW3zHHPQ
	iSAhFOa56ahnHtWBhUqFsTN62ikpC7gVmAqnZretRfJNk1/AgbSXjm6EJnFpyEsRjZ9QOydS0qyIk
	vF1nm/j77hdFXih1Rqu465UUec1IONV4rh2Z6ZrF9/CSiIuXFMbjMYAG21CZUh8yveBSxNWAF9+NA
	PwHFCw0Z+laF+pIRtD7+vovenRgCZhn5tbZS+xW7L0VoETxLJugY/UZHF48icHjrv1UZ/Pu22aNRK
	NAK2oJoveVveFqs0n5ErkOPoWH+U8/MvUpi+uxBvc7swTixbz1xXs3miLQr/5Kw8sBQVurkRXh4Ss
	5YwWZw1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgNp-00000002Sco-3Fg9;
	Thu, 28 Aug 2025 17:25:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urc6d-00000001cgx-1rX3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 12:51:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5XCPI029277
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tfd9haVIEplY3fZh8UFTDF44fFE4kBR445IEmKqTe9U=; b=ZrFl0OVkLaHoo7aQ
	7+aD+VZtRnu8N817LDxDuYkmmvpgecjqD3xjzeXK8zxdrHtVhKhBBV3HtAq2C7m6
	BvaDagOQfMowtCAlbn9Vq5j8o24PzP+nAKknsqYmOcAi1jfAqaDqNJTiWctNk4yE
	0DTDyTdCZzYLKHWR3MfS9+k+73aj+WcGWE7t62qPPi5mNr01q6XEBGXiPK5tncW0
	k5mRIP0JtYijbDoUVh5Svjk/Oqw3pyysNmtFnnqwLXRuV6VlrRe3BLKiZ/j1THsc
	CZk58IodJhZ0KzW0rdnc6GQ0VhDI6UJCR0fxoa9kJ8MqRMCaM7Ly23MhAnzDPT+M
	RH0/hA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umgcxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:51:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70dfd87a763so1905606d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 05:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756385514; x=1756990314;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tfd9haVIEplY3fZh8UFTDF44fFE4kBR445IEmKqTe9U=;
        b=CbhAojW+PFsKURHak+MbDWLcFvajyUkRFBByilDM+zrVYePv0hD8UQ4m2d1jnOalRe
         2u0rrQr7uwDLTZdoRtc1omaywaxkIGBEGGz9ipzfBOiDJzqiACjivfTbEkhT3DeOnql/
         PEeSNFvR21afohefsXYcRBXctiVl7Oqm8zAGLboaWEgb7GG562k+N+XJxYQXXfLBjwUw
         ZSOmsY83QaQVi7DQKdVI3AQADwpZkBvBs3qz5JY3O5zNq4a84bAoElSnVS6OYNLRfQxw
         UisRZ70B7Js80s2s0NubnXZwXoUKxJxR3hGxJn4c8zWXwJN8JYj/DbccuwH4fe7OYhf7
         L8/w==
X-Forwarded-Encrypted: i=1; AJvYcCX69Adq0qusfmocgJb30TFCI7jwoSW2RFR9d5yKWH0/A9ZIAQbhvzW9JtQDOpf3e1zk+n0p3maN7PA0G9YCz/2T@lists.infradead.org
X-Gm-Message-State: AOJu0YzzF7hqN9VmrJSxPQmpxwAUMTpa9XCEBdbT5tEQ9FNPTZurskN7
	Hmdha6GO2+WI4kmpy6ryo6jQgujosLEF/vXqJnkgxAqKB4Fzl2hdAbdiwSHAkm4reJhDoZ32F98
	XDlP2l/cA7s3JRCxHpQBN4jvTX/4sA94awfUC/5WOinffFQxrV8oLiwoNFOvYZNI+0s/tnyrPhK
	cC6A==
X-Gm-Gg: ASbGncsDDwmaGvK1mfCIFuP8j55O9nX6ErHWCA7iGMfKk9YVp9+Lv8IpIN+V0lxkq/z
	r5bC/3vZDnRi0lIRzwfg0FvjTLBPm69rYSCL38XdlDV13p3XtPuBccsRcUwkl+vd0WN42dGhVvu
	8pshDjWqRinBveUsU2+IzWSB5P7go9EiTXGhTqCKm+kDSUtnv93gJnrPteqPBXjIt1KiP1ZPdP5
	71xK5cfAgo1EzBykHLl9MuLIgH00uePStlN5cLsLmP9EF6xyuTePmhb5Pukqqj4TlNGap/EgoyB
	Oq9QTD2iqHqhOXcE5KrANMIu2eu/CQuwt0kAJrNMs6iV/Zn6VSLdZgDCuioyw1AbT/3Qm0x2SXz
	L31xyoyw2LO7fzlDMLQbjABs0YbmBzs+L1+QIQBKL2hmgI8T1zbJG
X-Received: by 2002:a05:6214:4e84:b0:70d:cb0a:51a4 with SMTP id 6a1803df08f44-70dcb0a5584mr139047626d6.67.1756385513579;
        Thu, 28 Aug 2025 05:51:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmlfk41J1Q4Xm0qZ0A0YrWOLqz/9Wocie0W7tu8ccOHfhHHejewxQGjgn8RGDCYKRuo/fz6Q==
X-Received: by 2002:a05:6214:4e84:b0:70d:cb0a:51a4 with SMTP id 6a1803df08f44-70dcb0a5584mr139047336d6.67.1756385512930;
        Thu, 28 Aug 2025 05:51:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35bffafcsm3316070e87.17.2025.08.28.05.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:51:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: heiko@sntech.de, Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com, stephen@radxa.com,
        cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
        Laurent.pinchart@ideasonboard.com, yubing.zhang@rock-chips.com,
        krzk+dt@kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        robh@kernel.org, sebastian.reichel@collabora.com,
        Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20250822063959.692098-1-andyshrk@163.com>
References: <20250822063959.692098-1-andyshrk@163.com>
Subject: Re: (subset) [PATCH v7 00/10] Add support for RK3588 DisplayPort
 Controller
Message-Id: <175638551173.1202.7687103827759188815.b4-ty@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 15:51:51 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68b050eb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=s8YR1HE3AAAA:8 a=td1j7nzBk3E7ehaXNNAA:9 a=QEXdDO2ut3YA:10
 a=0lgtpPvCYYIA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX30V1c0m15Gba
 EWITkHq5417heovvmbCfC9AFjReSIVN3FIM72yggaX6rENRxTlWwVlGTb6Ki0ArN8SWyOn3AB6i
 S/VON/z1G1p5L7kkDNKw79erjoX7LV0GcjhrG8VqwCivDbiO46TfjdlSuZRFFTxjE+oFCVfgmU9
 H2rUgQIbmTpuH4ChIlQXsD/lE6LiqwZEsi7U54GQUZKccS6kgdIEQXZNmKqag/r/EEGT/yXCQI5
 iGrcueN1RZVMc4SFVPJMS+/F3tKYx036ZtVU1EbzNZg/fy6hzNp8OYse5WzNiLniyL/ctzYAOtR
 Pdej/RqIM1zmC2GJT6eYtxvaMAWAY/gU2b+Q3PERt6AIZFtoeE0lPeTq8wikWbA3aF88BMlGu8k
 7UYPAX1N
X-Proofpoint-GUID: zTyEcbRA4Y85JPdn2S3Xhu13VaXCkcHj
X-Proofpoint-ORIG-GUID: zTyEcbRA4Y85JPdn2S3Xhu13VaXCkcHj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_055155_494905_AE2A2EF0 
X-CRM114-Status: GOOD (  12.39  )
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

On Fri, 22 Aug 2025 14:39:44 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> 
> There are two DW DPTX based DisplayPort Controller on rk3588 which
> are compliant with the DisplayPort Specification Version 1.4 with
> the following features:
> 
> [...]

Applied to drm-misc-next, thanks!

[01/10] dt-bindings: display: rockchip: Add schema for RK3588 DPTX Controller
        commit: 2b036b13c8c2cadf7a27036f911ec99742504fce
[02/10] drm/bridge: synopsys: Add DW DPTX Controller support library
        commit: 86eecc3a9c2e06462f6a273fcd24150b6da787de
[03/10] drm/rockchip: Add RK3588 DPTX output support
        commit: d68ba7bac9555d05e2f5b310c898b2a5c7eff174
[04/10] MAINTAINERS: Add entry for DW DPTX Controller bridge
        commit: 0b6da6d3a8d5391ff9da2358ac5afd8b7badd943

Best regards,
-- 
With best wishes
Dmitry



