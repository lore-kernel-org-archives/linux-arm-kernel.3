Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01E3D0D15E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 18:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=; b=1pqCF62DdoOOCLNfSFgvsFIHHF
	yF77mKc8pZpka7jaWBN4oMl4TgTX1bGd9cfC6o47gvGTcyghjlXZacFdkKI+no++RjyKsVMO7HsR1
	Xj6AiFNBpbnVLdz0k8TodtDePpgJT3GZF3cJjbMACRlkrqjcmhUhUKnLAhUPIbcqF53cVqj8KSRD8
	ymFZtwksodfz3EkwhbJeWclH7Lx/rzUfcgA8bDZW5dyRcaIiJ052sjX8jQdcSFkTkWaWUufEeyg5R
	M/5i0xl53ILFDCC5rvdagKgB2QKarQztBzG0xPmfaz04kOSU6u2uHC8RlzxzC8yzddThnabuEugGT
	iZEnbYDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY4b-0000000FRm0-1bv6;
	Wed, 07 Jan 2026 18:15:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY43-0000000FRQg-38Sk
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 07 Jan 2026 18:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=; b=pRzMnATyGE5jQivLXjhuG+SXC2
	5yNYy7zscBA+o8ZRtIm8AUpUogL2CWGzCA9FP7Iyx0Pts9v0WezWn9A7DuJcq+AsfAfrZb1GjUjcz
	RvGgNfZ81NsBqffw2OVnMO38bTiiH+DvkYkSfuaQmPDsrJajVoUUaS4LKf70SfGQXmVGRmmXEnV/z
	U90/otSlgMit36hjurVVFvJfJqThd7897e7YBCBYZFLCzVD0KkbyELRnHetefnIA5mz80aQiFOc+O
	hn1DOWGz0p1FFmH5qtdpTHpOPEmiop6q5DqvM/zZmN5BibXnXV4tCgOHXe68yHGzUZPXxKaRjp76S
	JDu9F/0w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY3z-0000000BtFx-15no
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 18:15:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607HTTu53751414
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 18:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=; b=YT98JyW5oGIce4yx
	t62vyUO8gfpzGSWjao8mBdPTYJjg9dpxi69OPT+flXHjY6zvvx9HgiN5VBgBBE3z
	aP7KS2Ai0vJ/lJpU1dpDd0Wxd3AfpuO+r5VqXRzqZpaUaKyoi0LPozqGRblpfFtK
	8FFeJxxsq+wpaKuwqGiSnUZWk/S1M+hmWmUCx+hBTMfSwr6J6aj2V5QFdUUVf0kj
	CHLH4uqz3dyg/R1Bh8EhaSUJI/DxjitNH/wMuHLMhRLagS+uW1jOa4CUCDBGeaVy
	RdCTC2bWeHtpXMzHIcJEE6pFwJOYIGnHu5DTmubFL5Kv1LjS0Qoq4BlhHH+zqmpU
	l0KWkw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxcr5dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 18:15:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b9fa6f808cso698742985a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 10:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809716; x=1768414516; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=;
        b=Bm+AGhp0FyVTY9SLIGbY2HFgB7mvxiYbOByqAW+6vFjFERRNlmKk1hXqr3Sm3jP7cj
         sRvaMnEjbBLeuMOBHvbyzYL6n+eeyS/VODEDS7E0d8NFihdIPr+Rd+tUYQXYwDwdHVwe
         0W9Ze8CMrQXf81bGlI6KL3ZWoe/HUt6vvg5TRbDJ2QxKSzl5509mHMfMAHH4/ZI9M99G
         0QuKTOnPADHUfpDtHTZg2HMAIK1rFdBnhUnuJB/IKTRZmDgAUX9+Eq6+D8hvdyNAzPM9
         oLvayMlxPzcFKlytGkVguvB+vlVgGFw2Z5OuI/WgT4MnuKxYL9finwWa6AANkCcYqoh+
         1vag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809716; x=1768414516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=;
        b=wKyvFyezYik0BT8ye67hAB8+LbRC9peecpOKeDmkyunCdkfvYXFEuls+VVab29sO25
         dZx+yCT9Z8e73Z6iX3MuvIZZTXkUuWwLARdpd6EUJTxyZ3XCDne1m/Lp6OwmsArHhhMW
         VOajxu6XZh6KjJqGTXPpISRBNQ2FBNBpF0IGSkrI/yJq2Fh8FeEg7GKdPXJoiu9yvQt/
         2ha7Ji8PFAG0rhZlBYdjasLa+Xl46tCr6lUOJnZ9bC8xG3yf5GOX2UsJZOqMYJkO8rRz
         xeMeyfU5b/P9jJPiN+cz+U2zHsux7NZmDfUYAD4kO98ApdEbtRYtoUQ5beSUHpOBbXV9
         mIpw==
X-Forwarded-Encrypted: i=1; AJvYcCVrYKnNBP7OaFx3wP5qGKdwNaythgW9x6ck5uCYKsNG3tOEpKMBLkZPY80HK5eEJDtQwNn0v8tsekELIydy4Izw@lists.infradead.org
X-Gm-Message-State: AOJu0YzkfpeG6J8rnie9vqwwCg5jU0fot3DPTXHZAoer5Sg+LZRl3WAF
	wc/VNTaqgGoMmfTNsqaq8wgO8Q3Afi8mP0M48/I/B2UycFuEUOfzef92CwPoxQ3yUII6f+fNvzT
	x8uho1+sSrvzC6x5uXXTIYtVFmwgyao+9YW+WiGthNU6uNhuAJo1GteLy/7mFzf5YNYjQjk5ZcZ
	cVhg==
X-Gm-Gg: AY/fxX6Xdlk9I7de44XG1e4hDi0kUKdSskxMdNI6hHMcv7JX8tS1n0Q3yr51FiVgKzZ
	OJs3EOGQ8taddVfseZyW7WnwCNJdI4BDu70aTkhN6O0sbnoUn5x83fxkXHeGIJ5LH4Y8qXh2L+f
	Dh4jBy6CZEN4gm59lwfMjvTfh1G4cgO/QS8LV4XfZhwfYrPyoWcOI9isBPuh0S+/8Z/hqgaytaM
	uMI4Q1dDWZ83nw3q8LgfA1nh5BnKTqiRkg/jw/oQWqCLG8crGyyG+5SVzpsiHSJ503UGPF/noEK
	ZhePSdZgpfslEn6HUp3qbgYQdK9NJoQ23KHbUbelDeu+4fWVRtxKyzsZHw9Q25CNgjgOGYR5dxV
	ACSk+QgL4atcWpayjU0eBnWPsBMvyU98yMJV463CC1YRhziJGNJ8xQkObehZMI9BAnionqgnJ7e
	YOaDExdpAPinQjFRukVCAbNP8=
X-Received: by 2002:a05:620a:2952:b0:89f:5a59:bf30 with SMTP id af79cd13be357-8c38940cc79mr440814885a.78.1767809716498;
        Wed, 07 Jan 2026 10:15:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzR6/I/M+rb+0CfWg9B2pwtmy0BCZ0528ZAW/PtSMTyk3JvUKmiud8K1hEOQV156GKBDOZmQ==
X-Received: by 2002:a05:620a:2952:b0:89f:5a59:bf30 with SMTP id af79cd13be357-8c38940cc79mr440807085a.78.1767809715974;
        Wed, 07 Jan 2026 10:15:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:05 +0200
Subject: [PATCH v4 08/10] drm/display: hdmi_state_helper: don't generate
 unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-8-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/ZrVCxC2ORTh/25tcpqTF3QUmYMkLYWP2fYAuUO25LA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKlLQRVN1fiNfBhJSnlQQ8yf8TEYh+A8edCs
 YWTlH3Bcj+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipQAKCRCLPIo+Aiko
 1QOVB/oDjydk2pqigYtLHtwvNWcAKXJbbdPGQ26WTURthKMHJhz9rPZZV04J2QY5hTtypEXd//d
 nw5Vbwc0So6ysL8Tv/jIxpWqiL+ciHmVHitK6qOCEBS+i8W0MtTLVx1YAdnQ2gp8v5gmqGooPIj
 URRZkW/XopRmGOqd8hftr59SVEpUvh5HH5NGGNoX/Wx2rngOV+KmUfwE0HXApJlGUvk5kZ/fwRb
 bGSKspZn9xiu+96xWnVTNQqum/Ct/2q61VCFkl/XqCm0lDpae50DBapNsWOPBMIWt03yTjsHslN
 UvAY1W9Roxw/F/vls4Ff8wqqmvewupBjJYfykiyeu5Y2vHLK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX4yCM6H9WE9D4
 OddmqYEp7TJZopI9qp/tHmtfO0GWwXOoQQ9nGaQsZCEsubahBnA9jKeb4CmHiuI2Xv8Q24h7S2s
 kf1FQiWokJ7yaCKpoBcZTDEQI/XKV7IDJgKxGW2YSIqpI7uMuJqcwnqLdQr9AgZfzb+zrzNy3RY
 F0rWp8472FWx3hCbh3fsM/+n8qvbn5eiOp880CspyKeczzagXBjmKecARDhAMmzNhj4KCpHW4kW
 1Lh/QanLOtRAPdUaNl/l/1KH8fumhqNSHNxLlm0bH81ppsVtI6Hl0raNCm9IYiZlvLjizpAYR4p
 mHsS4HU74B/u0oOt5zPruX7xmXlkTVVXbGj2i+IeyNSfhHfBq/FbcH4WQcPLU7NqhJQW759HlWt
 2/uWGUK7g0Slws9FIq7/MfVlyngGdoYWz/7wy5kMVYoXjN2xpWZrVB7ZWotFhETF2XHh7rgS7ay
 kHXNZCk09ygla+2ssFA==
X-Proofpoint-ORIG-GUID: e-rAGF5Sa4Qtouvv1nVWaO-NQLtP1Qpl
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695ea2b5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=58UsvUJqJn8fpqk6aeUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: e-rAGF5Sa4Qtouvv1nVWaO-NQLtP1Qpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_181519_688140_FEC7BFFA 
X-CRM114-Status: GOOD (  19.11  )
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

There is little point in generating InfoFrames which are not supported
by the driver. Skip generating the unsupported InfoFrames, making sure
that the kernel never tries to write the unsupported frame. As there are
no remaining usecases, change write_infoframe / clear_infoframe helpers
return an error if the corresponding callback is NULL.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index e8556bf9e1da..a1d16762ac7a 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -718,6 +718,9 @@ static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
 
 	infoframe->set = false;
 
+	if (!connector->hdmi.funcs->spd.write_infoframe)
+		return 0;
+
 	ret = hdmi_spd_infoframe_init(frame,
 				      connector->hdmi.vendor,
 				      connector->hdmi.product);
@@ -742,6 +745,9 @@ static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
 
 	infoframe->set = false;
 
+	if (!connector->hdmi.funcs->hdr_drm.write_infoframe)
+		return 0;
+
 	if (connector->max_bpc < 10)
 		return 0;
 
@@ -902,7 +908,7 @@ static int clear_infoframe(struct drm_connector *connector,
 
 	if (!funcs->clear_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
-		return 0;
+		return -EOPNOTSUPP;
 	}
 
 	ret = funcs->clear_infoframe(connector);
@@ -928,7 +934,7 @@ static int write_infoframe(struct drm_connector *connector,
 
 	if (!funcs->write_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
-		return 0; /* XXX: temporal until we stop generating unsupported frames */
+		return -EOPNOTSUPP;
 	}
 
 	len = hdmi_infoframe_pack(&new_frame->data, buffer, sizeof(buffer));

-- 
2.47.3


