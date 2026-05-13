Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECD2CD4F40
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 18:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=; b=fdVa1eoZNG6REW2FFxEguaGIGw
	30er066TQY9WMzwPf3jwGIn9gFyes6naxzPbeLd5Z9KAl4urMCdrohgTRNH1/RL383FM/juQh97XG
	hwiIOchVrcqabVOmM3ZrDFwQnoHpbxLafIjNs05qBlC9S4ogGX+Hr8JZtTUS+Q2sZgNbw4XATmYgF
	3QFme2IxE0JzOkQeI6+wcCQ59Ns4dAxDnuzrYIOklkquDrN4BOqfXfkzMfnZg9ldxwHsF3diUaJoV
	LWQYSiLSO0fuY3tVt3mdp/l84PzJT0LQcariVqWLzxK5ufJubIsEDlji5zpgLt0n5DXBVkzKxWGoh
	gJHxjB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFh-00000003SWw-14hj;
	Wed, 13 May 2026 18:24:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFW-00000003SM8-3BzA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 18:24:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF5KW83474744
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 18:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=; b=L926dWnbrlNFEaqp
	srzRYuP0cO0M8CQROQviJ240OwfSEfGfQkjbDWjadxTXeUGNt9JYCz2eOPBXiVMi
	reTJ/PRQJ9I7gmqRo3iKPD6xxNuzJSjsU5HEUsQFY6Vl9KFE4wO14tlNEUuyvvp9
	BV1Q8J/d+hIcdRBvj5Vwf6AwCWTcEQBgR3qPxVBpRg7PbOWMYZaSgsZJh7w+1yJP
	juhymAF7rJU1/fKM7YlysCzzyUCQMC1mZua8c9pmeUD6fi4mdDcceyHTwYp2x1yc
	x+g+3i7jbjZ3Lsljj7CqG7gPLkFr0h8+ay6DFmGE3wnZyULseJ2QoxdDEd920u5L
	ODmvYg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p41a8ys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 18:24:01 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-958a0e94ff9so3070813241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 11:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696641; x=1779301441; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=;
        b=VyWbaFceISp1U47H6d0uAM+HLKTUtD5dXRBuK+UvTCDKQxPd1yAgOLFozuVHfatFRm
         vR1XwW0ZuXYRnFuRDSnh59FVhUCv4ItbbMPcLkbfiR11n1jB5R+2qlyNvBFLDv0MF2G6
         lTUQBrngCZaYYuI7xCoSU19k6f7tmvW5a9aBygvrXA583RMbI1b+91eHKLWsOjZA03nT
         R2l8x+yGRIYMY++JEKEvTgWm5NlT6FHn9jMSNpBLqJflfowCNYMZbQIC8wi4YOvpD1i1
         +eRqTbH+XInld09JtMNaSVVVWqJeyHPbrA3s2IS0K4iNqHoEK5IQAN4PkOs5fD291CF2
         DivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696641; x=1779301441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=;
        b=Oj1KKPKYEwnSFuK5WL5A60TUN0rO4hjZNsQu+QBLmsoIsddQwBsH0vO0Tfrjy7+hcn
         ShTH/PYbq65FcYUvAUSqW5k0mzj94kyqKgmlyilx1ibLlqndI/1oOo+RjjhFXBfoQHvk
         BHb6JDPusgXR49FiSAJWryOfHRB2lPDDvkXuz97U/V1uPHqG8s3wKLsMbUqzsQ51fq8O
         fNfRu8q3R02Z5U0JbVSJg+hd/+GfDXpfy6C2zQavjDrALXiKNijjWKSjmW7zbn8F9WTs
         NevYOSSZai1hQIEkzkJ0DzObJfzxlKK1Exybj1OmiH8zwKEb0n1nv304fwUVKYo4iOXA
         Kq3A==
X-Forwarded-Encrypted: i=1; AFNElJ9ZcjXsrE7gS9lbN+MNIBC6Rnsaxa1dKh5C9EI8I+b/bC+2miU9Bq0zdiQl9nu+f1sV1r0CDZGD7xf/oLXxHTtU@lists.infradead.org
X-Gm-Message-State: AOJu0YzNFi5YBIuQUwxxjPUceRGJ+9+FKwr6CbFpBBUBeYEPthuSugFq
	7pVPVqkZoiv5K5sphvhVmFTJOnxqhu3I5hxQd9C30zMv4zzF/smqpBbqsx2Mf9419eH6s8wHw9Q
	RfTc+Zx3ow/BrLHyCflupBUaPPDOJHZwCke/eAvZjSX1CoEKSFuwNvx7CvHu3YUvLOmN9iU2a2q
	TYCw==
X-Gm-Gg: Acq92OHGFumFwGV7f5Xn+VRKXUAK4HO44llJfX8YB2/mMXUqHki5aBOTMNPtY6cXM78
	dcMGVSmaFhzHgf5e9mK2hIYo/J9IxAW0iWBxJxx3fzBrL1XrH+UEJRB0Gl+LgfuNMgQXKXiCCkS
	xbw3X0tASBKGVljhWXRe+IERzcsixzlt3RWdG7QQ/qu+v0t+bYxfLZpzoRJebW6t1p8YkJzhUhs
	tn/N3pwu02lA3PUcbnwk2TCnFPbi40oceseE/C6oxDlwI7oFzPMsRKZqiA5re/jCwkvRy2MpR0A
	AO5QbXKBa7U2IN6UQQYMKAJCmJ2LCHsx+SRKQkhySMkcDUMgvYsDdJoW5+EuWDol5VuR0VpM9uY
	COF7Y0pqQmsAYvcIUG93XxtteuUMFlsw4OmTr5Iy0SNR9zdFKVCaVcIzF8EcUXVtdcHSKrdeAHB
	CJwWc3BjArarA5oMaiyq1bnVCEZ+6eL4gRhTk=
X-Received: by 2002:a05:6102:3754:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-63771e93dd2mr2536244137.12.1778696640937;
        Wed, 13 May 2026 11:24:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3754:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-63771e93dd2mr2536205137.12.1778696640430;
        Wed, 13 May 2026 11:24:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4212851e87.23.2026.05.13.11.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:23:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:23:24 +0300
Subject: [PATCH RESEND v3 4/6] drm/msm: dp: handle the IRQ_HPD events
 reported by USB-C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-hpd-irq-events-v3-4-086857017f16@oss.qualcomm.com>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
In-Reply-To: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=891;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+/ILvBuGhqekKhSlkO02babbVbDbrJeHq8l4XOhAwlU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBMG0abAwQqrwNKrmGMKndnLCYyJA6PXn23RVR
 jIy1b2VxsmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagTBtAAKCRCLPIo+Aiko
 1dGPCACNGtpqzbvMTWs5X5vG8ECac3Hmh2yf8eM0hhFimdemipY/3p1uE7tZ1kfXqE9pDI1tP49
 wqoR6jikFqcgnRZ8SpkPDt3z2v8IjbTYJObqopxYBFmBaUt9lrvfMYHjf1IRxPBi0juVhtyKqEE
 I3psZD5FRUZi9u7VKDzuMV4vqUQitc9UgMQYvFPmPG/qomdvVXZJgCwlMUaSCY9/5RHsT3TNKC9
 JQNkKOHh+ORyA8ZutxDUNr1WX70N0HMl6YY7t91D4ZYk7vBzHYUOcRa5mm3GvAXPnywKP3vMquG
 6lyEjDNfEPjnhsGq8tO/gH5cybCBy0/PqZe1OxCjHZf+ALPU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a04c1c1 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=3ML_fINe3tzxlWvVV4AA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfX17ILGRszZ+va
 JX2s36IXpWAvckLw/bWcYh0VU1EKq8Io0btO1cOMYzoQ1GwLUHp/lDh5ptx+cUCVdFxbbWkrrh0
 0JVvZUe6nsgc8r0QuzR33IeUgo6fUssL5EIPdBgdVZYkqbzP9uaTGxRzHytTLeREgjadcaf+RAl
 khILuIrNm4NxHbZ8CcPUpn7Q9f894/fZVL2St4Fa7GTn6DOJ21NVxPfX31mlf65zMyj/e7QRnfW
 IChkE2cGn+AR9T95RG1PSZ1IhB45bAnoNrETH+8i2M/sstXa67wNNAdlJM/avsPdmubZDTmaHjV
 hYly88WMfc2ruGkei2YKWOv3M8PW2sgDreDy2ijpa23BsqXpnlW5m4+9Xpd09B/f0V5nnCH//C4
 wpKN5rVf+DbOxkE1W74q5bqen67bXbkwrTu0CaFgad2AVWLhqWURREfhrkgT2PWHn9rStmkG4j+
 57xOmtAeewTBrSZaeYg==
X-Proofpoint-GUID: KAdT70UhSmhPIHLZN7hzsM-nN6MhC5tH
X-Proofpoint-ORIG-GUID: KAdT70UhSmhPIHLZN7hzsM-nN6MhC5tH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_112402_946874_6410BBA6 
X-CRM114-Status: GOOD (  13.65  )
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

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7a0623fdbd8e..8df579bb320a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1800,4 +1800,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
 		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+
+	if (extra_status == DRM_CONNECTOR_DP_IRQ_HPD)
+		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 }

-- 
2.47.3


