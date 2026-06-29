Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D1DC43638
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 14:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Riz54V+xwrmHrcv0C5NpeAm+dHdus1rR77mLS6rpysQ=; b=ywLWykD25Qaom3Wf25kLPNsGYc
	sKOKVFMN/IwdlvmQtsxPp7cqiOYsXpa5pt6zGgGvBYs0wfjCxhcgK716+qEBaXIaauO/Qu5gyCjWG
	Q9wgvVmlRi7/eBUut7kq8LffO3y1rlqDFcL8RNzIt+1xxqlZcefOtQEWVZWIj5XSXvm+ytyL8HvQ3
	PkzxQwRQV+FEGWeTb2sVytUXDIKWcm2i4YYhELBjwIli5lGStyo1thcjJZ0SA/VnRcYe3Wrc2gnL+
	wvkDtcx0USrTnJj4yNpxWYTE3UDFm6wYTFQlwgVQBkl/GWjRHNSKR8fuKa1s2d4sNWgM+xXhLoiYL
	wHrxytBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDIT-0000000Ewld-0i7F;
	Mon, 29 Jun 2026 14:49:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDIN-0000000EwfP-1wPK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 29 Jun 2026 14:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Riz54V+xwrmHrcv0C5NpeAm+dHdus1rR77mLS6rpysQ=; b=kfiw41CIHG66uyO5klHx26GxkJ
	/5TFIaE4tTkYOOarcCEYJnC7HMVUeRckpKErxoajju7J4r4xtsylWb62IXc3XpwhXU4SYdVfCTnWf
	e4ce4YkvJ5tOmbX6Di3j/9tZw50i3qz+DEHd1m/GMAtxZPbAZeMwOGzMqKCy8xhOQqs1pCoXxPB+8
	yKdf8+qynXFL89zqT8KpFUZkJ8YJ0bcDMbn4MXhQnP6d2hPdgs8T3wRETJBfxCCoGdKmXjTFvloLV
	B2o8uFmCkmddK++YbzpvEvujddENGmYjGAYxnhpafc2f+2vMl8R/17ka+r4Uv9l4s7kz8ceHf2mWO
	1zDM4DGA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weDIJ-000000018Y6-3Jhx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 14:49:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASuBD2601194
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 14:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Riz54V+xwrmHrcv0C5NpeAm+dHdus1rR77mLS6rpysQ=; b=jXoJ0vdn3ImZ/UDX
	dWASKy1lxZU14FYk954F6jZtliytAvjPzt7xcSkI8uO9c/AtgD4aPEXhqhZJdlKZ
	LCbMMBqf3XMIjwgV2072Q+UveQzlawXiazHtcF33MfoHk9f4REBpFNH8VtM8bTGj
	0b+FbF0ex6FSB5I1PPvkdHDnHEarRDWX4gULsRPlOvZg4NEIsbSrTuh103ZgTxSw
	EyhhI1qF8Yt3vb1VoLOKsqdiCRpD3oaSCZTWhT9LgTmkyarlETsDrpytDw3gT/Kt
	TFKiLKo5cmpfiCUbaEiKtMSSUAnfdLvQmBQGS21/qhmcEoU6HPsS2nGJk6NFbTfJ
	yjZUeQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw9d7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 14:49:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5fc4c7e9so55878285a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 07:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744545; x=1783349345; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Riz54V+xwrmHrcv0C5NpeAm+dHdus1rR77mLS6rpysQ=;
        b=QJyhz2KmjzBY8eM6yXN7g9glFQW5f2OC7llKHJzkZi1d0mG1nA2bmbMDam0NEPq07c
         nFsxvTkc8ufRCfE5sAMbxxd9mLk9EyvaW0yVUgSHoEMvxLQFh87Tvm99LSKryOKYPvW0
         O5/71uqauwuIW77Ec7gODKV2f2sIMDUmP2uLOzDrWzlfsU//DgW84cPEadKfv/JL1eHR
         tNQJE5QqvV1egwzfzAEufoObL2Kktylif1bWAdosqSqZPyj/uk7+jlPlvlMvnXddKolE
         /627OWPO+nIlgGZb7/ybhYrwNqHmREOVF+zFG6fsFeUqdHP9pAOeTLs52j9iLiZMJQHe
         oFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744545; x=1783349345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Riz54V+xwrmHrcv0C5NpeAm+dHdus1rR77mLS6rpysQ=;
        b=GxLpi5z0ozE/u303cCDJQ7NJ4lTWJKDdn/nd5MqclD1+aF24wpBP3ET0x5jZHc8E2R
         7LutDJzDM2o2fs6FHj5NPHiPB0bxL1kIwI7lwuhbUB4CdQ1YrZs5ykvpNg4K7hwnB7oi
         rqev8L0S7YoDKnd6ipG+uU1PCDcTGySwhfkb94AIDLpnR0ZzVW3Ci2hf43NeGghRyjJA
         nuKNxjZ0waDFf2zb406ZObp0CkoTtuNd9XnYGmu/oLsckuWrNbuVd/MX9ZToCMc81w8y
         1EpVVjZ8til1lXeiBdo13T/lZ6XgttFmv3cd3kLh3brqB5W+iyt5N/NFzjzMc/QfGEa7
         xyaw==
X-Forwarded-Encrypted: i=1; AFNElJ/BiGIBJ5aWLCK8eWzgTbArQjPcBc8p5n2eacw8MJC8JG6RM84UfsLfpvaYvT3ZwWv5mbIoQtVS8GpqPN+NKi3O@lists.infradead.org
X-Gm-Message-State: AOJu0YxIZO1WFdUD4ggUhEEGh+x6wZEEIL5EhjElaCzzwMe8GW69n6uk
	gmyh1V08Xg4kj80kkGH3tFc8p9dnYxdco1e90JbS42CWWoTKT5nDN1JK5V5jpt1tTlO5qEsDrrc
	g3ZthsptA9IMVD4daogq4hHEqkoJ3Bvl0c7EY/B+6h/WCXblcIgz5yf+XMK51ywQ1rVY6cwKOyA
	0Xfw==
X-Gm-Gg: AfdE7clHle31jPCjsZ2k1sOVbTsCr9cIbeLiXpI9gRuYHoELiEXOvYGn/EZI4J7cxfc
	0s6swX5EXGzsEJBiz9sKkSxT0F8q4ZMew7NYkSUh6vPPG7y77ThiApbNAS3ipwSLIJWN7L15gE3
	oqynCSsbB0vaxocQUU1QR5UrtY8A4RT0RTTOOnwYqhtb1g+ler+sq0kUSjVbVeCcPzmb5p+CQGU
	VJsjhAz0FMc2ZVYq6WQmadTqAP8iJB+t+dxmhrbZRuTb2Jdeugs+JkfOXrfvNstJfHCNJ7qmGDT
	quFwl7uuLIRvGfgmY9DqY0r5R/HpDFBt1f3MK+pmw+atAZ2in51RJGettyWzAeQHHbQsUnrXHHq
	llBCXaQ7nHRrM+64CIVaBdXrN7YOiRZkcOyJ+xK8ptP3cb4VnGJYouahVqLFJH5t22+Ganmadpw
	==
X-Received: by 2002:a05:620a:f10:b0:912:bd42:b46d with SMTP id af79cd13be357-9293c11cab3mr2618703485a.25.1782744544749;
        Mon, 29 Jun 2026 07:49:04 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:912:bd42:b46d with SMTP id af79cd13be357-9293c11cab3mr2618693885a.25.1782744544168;
        Mon, 29 Jun 2026 07:49:04 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926004ab49csm2087974385a.34.2026.06.29.07.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:49:03 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 22:48:07 +0800
Subject: [PATCH 5/5] drm/msm/dp: mark the SST connector disconnected when
 MST is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-msttypec-v1-5-646a10256233@oss.qualcomm.com>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
In-Reply-To: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782744487; l=1355;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=P6ysjma33fFr4Jhf+LAK0Y2tGO90pVRAbJrTPxrwqaw=;
 b=taMUim1RCi3Tovwyu/g7YUOegrysAK68tpUeSQ5Cm5voOFpIRC7PaoYhfsOcPSnmVuUPZOtog
 FPGK/+EymzKAfEqmi8WrHew0KXfVt4LhxvzjsyxTNcY6DSQa90FNREx
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX0vqdHRPcDwl8
 PmxtbAcoanpX8TVbcQKUasbBIXp8Ju9BJC1yJs68SABYx32mRZZbAmgx2Zr2leZgXVutn/E8s7+
 7+c+i4tyLqK2RFdy2TSTYzizNJdsRkQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfXwCW92b0U4WHi
 GY1g8UL54WY/PR7EvASrc6ClzZDqfESckt7Ie6zMLRYsz3V7UTRhyzR/0vFyVKH8+uyiuDDtf+r
 Noj8wocsVYMqst/zn4OcbXVIpP/Ik2tg3zvbwBWQ/zuSZGvSSJFHRiKVrcjXPZDDUHFaMXqPXzH
 r6KT090OgCMagemhe7dffk/dRBdwOEQinK8sn58FXP27bFzC7rEdz0wnS+r0UQFJP2PeWCJ2OOr
 26YUYgiAwuTEkGHvr+0H9mUuykT6dGqM7cB44yIVH0LwqFEWCogk8zfGMONmyVAvdWo4KYNxFWD
 yK3tLW8TT32Ki6KvyOYrfONazOh1zEsLR1+XEBl4rYSSd5s55RMklYh7m8SlY0q8HeEIUuKALZS
 e89UFzXhULq/zppwBBKlidX30yZF5WYdlJn9A6FIEYxpEtvoVIv9eGNo2EdDPvwGbieTfHP29e4
 xpkYGSuAfZg6X01VGyw==
X-Proofpoint-GUID: 94dY5WxRvKU1FCOR7LdIpBLg8BNOV88t
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a4285e1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hI2I0KHUTEcuU6pApIIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 94dY5WxRvKU1FCOR7LdIpBLg8BNOV88t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_154908_349434_E67E215A 
X-CRM114-Status: GOOD (  15.23  )
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

When MST becomes active, the initial HPD plug notification updates the
SST connector state to connected.

However, the subsequent SST connector detect path reports disconnected
while MST is enabled. This connected -> disconnected transition is then
observed by the polling logic and may result in an unnecessary hotplug
event.

Set the SST connector state to disconnected immediately after MST is
initialized so that the detect path does not introduce a transient
state change.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4ee391cc7165..f8ca60d6d714 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -352,8 +352,10 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
 		msm_dp_display_mst_init(dp);
 
-	if (dp->msm_dp_display.mst_active)
+	if (dp->msm_dp_display.mst_active) {
+		connector->status = connector_status_disconnected;
 		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);
+	}
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 

-- 
2.43.0


