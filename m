Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E5EF433D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 23:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vr30iwIqmebM7hvnEfidMs2EUAZWyrOGgpsLJ6GZ70Q=; b=YDVKlm4lZpIj6r5tKw6msdKqcS
	uBfNzo9hpHHLeILBtnrGYSoHMgfX9mbgcOeCwlqnRX6nx2rfda3/GoUp1RrEZDAOqAi6CHEt/46qP
	ue6QMc2Q58TdR8aYFKqmr9KqWU7B3deRDm5oROjMLqj8xrN2ccwKv6iaUQ0IG0IbbA5JKaNImkCOC
	aMSF0Q7iJkM8dldu0eQQranyUYOL6UGgvbXD6g/+9hjlzXSAfsClMhnrFysRa36toFiBTqQ0t7xCi
	7GR7kochPHX6b45+BiRH1HtzEd1Rq6HUFUqk0eg/jlv2fG+rjGF4R3UtRkw35scHdkM54OU38LoRI
	++ZE7lCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ZZ-00000001jvg-3Dpt;
	Wed, 15 Apr 2026 23:23:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ZO-00000001jne-29aI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 23:22:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FGEvN8506974
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 23:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vr30iwIqmebM7hvnEfidMs2EUAZWyrOGgpsLJ6GZ70Q=; b=dy+HDyD8rosMW30L
	FUNS2GM/lG+f/jTnHznm8IJHSBbRKc8RhizcSnMXCOajnDCwPJ/IKZK3lnQYIZiR
	5VKDEhgK4DHJVakIozsfYZg7KlcCwAMoGQOmkhSGBjTFSmCtWANSVh5S2uR937Qs
	H0E459ajMWPkg3SVX2V0hyqHbN+cuo+/M2f7gOfIlX9gb4gOjGTiTivjV/7Yp08h
	F8AQkM8ppWipV88ZV6NJ/dxUwcEez1dQlF9I1+cOieWmHaPGJZj2fhGu6Ty/ESU1
	0i2Ir6mBYMoWn4ekLksWwE/zbLXb7CbdULcLrzuFhEX1qItdysCZyXaSC8yRLZ6b
	MXl3cQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dje1e170r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 23:22:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4661881eso28567051cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 16:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295373; x=1776900173; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vr30iwIqmebM7hvnEfidMs2EUAZWyrOGgpsLJ6GZ70Q=;
        b=RfgV6A2eaaM1kw4C9XjCv3uMOzeFd4cPrrm50AbeL/6XqQfEFIzqMkN1PmNI7mE4gw
         tTOlkh3WUK6LfFLuV4dgwcyobxZTCS86bq6bQtX5qf0rb/x3WExCH5/HeETeEDZwVBtu
         0iBSQQnmUNhXLtVw+4+ZOFoe0mPOFPmXkhNMqTiwaMWuaL490Y6fEPpUltXE/N9rEb3c
         s3or8I1yNFAZyjv+Z9zBoXiapnDB8hghyf7AWfy87qSuwA+XDcJNVUYF/g3pP0Ox0ZeV
         oeONz7epKxPhLAEKKQ2SfCYyxBNPXHc1KluRKJQZMRSUUDkSxES+Vi5sojOKh3OU+Wet
         7CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295373; x=1776900173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vr30iwIqmebM7hvnEfidMs2EUAZWyrOGgpsLJ6GZ70Q=;
        b=sloSxNVl0sN4sLKhGO2VyP6SOZzzoP/GwOSbb2tgURsiEIY8gODs3lhR2Lt+yjdzTT
         ga3f0KPAhU+2RYLTZsZnzkti8VlVCJrB+mHYQyqwloEhfkLS0HdLYhlOI6qD89NsjeN/
         CSXYXXq6DaPT8SBe16hiAekSjAmWRxp3ebMgH1VS1UrxUZKzbOO7e1rslIfBITATgyr5
         N6DYLSXw1a6kC6oGtUNpSJMuAXttQzn2XkBgWI+fss+vpYA73zcU4ejMI/ndOns/y8E3
         EMbaJa2khMHTTEKnjBm+K2qdarJgG8MuAEc1scRvR8Xs5o82pI+03MVSfFCRiSXxM+zF
         4r0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+tCZXojKpAFRhdKKL2q8plbzqPKn181U5fmARSFdQAHWUv/s/FhBpbQaiWeecdCVu1C7jAN0Jjq+uIJL47k86P@lists.infradead.org
X-Gm-Message-State: AOJu0YzKA7We9O1/Q3+1LyrPyh28FhfrvWL1gHF6zS6Hx4OlqL9EAIqX
	1UppcwSKThRoE7PwjyhKxFLEqg2XtI2z6IOvFjSRXsnZa66Fv7kxljK0tXzvjiL8NpbVVfgiAMW
	R+tnYs0DmiaEYg1Fav+ZZm42owINTWvhKqfEOjvR8YhKyIpYf4OXGL0EbIiPClDxmtsCvobAE9A
	vkrg==
X-Gm-Gg: AeBDievDqARhiMAZDxBTN58cNuEaKJA7Q1HancqueYYHz8QcNAM0g8Xi5ARgJ91ZgUQ
	69Ym20I3DRmNzeQCTYgZ+Uu1uTJv4mTtlth+qiqUkhGuBmeFO/J7pvsk8C+YlvrTmip5cHtch9V
	mStZ8WJrp+8D1PchLyfmWC7BkOQN+AqkAYm/aRNU+6j51jsZX1s7T9V2Nretv9zHgv9twhd+ZOo
	jMkurhEMruVzu0BehQOMFPadBpinmjlbVGi8qXnFv9foJ8m3cicpiO6ZWOSpJnfGb75ln5O6CCw
	4znMYOd/LTalOOu1/lOjzdFxsAfH3ghygtRxY06JXEiRTbCqRIYmpkSjWvf1pIvXuy1Q9khOz0V
	5LOdAJJK2xZ53vKL8mohQizq0a4AZI6J4MWzORh6sbXE5K9LrNJtFn6UK0JBe1F8pecc1zSG2sv
	KuT/Vayi5xL8wAA/XYIcbVXJlh1JBy+9i1j6m0ZZMustLBXA==
X-Received: by 2002:ac8:588c:0:b0:50d:9e36:f961 with SMTP id d75a77b69052e-50dd5ad88b2mr362529571cf.20.1776295372965;
        Wed, 15 Apr 2026 16:22:52 -0700 (PDT)
X-Received: by 2002:ac8:588c:0:b0:50d:9e36:f961 with SMTP id d75a77b69052e-50dd5ad88b2mr362528991cf.20.1776295372491;
        Wed, 15 Apr 2026 16:22:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:22:36 +0300
Subject: [PATCH 5/6] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-hpd-irq-events-v1-5-1ab1f1cfb2b2@oss.qualcomm.com>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DMjriJDCdMjopTDai5VHPDfHuDEfFaw+9gvGTyDPhTQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B25RIprvup1/Ku4C5KowC01NBQ8O5kpPwx4h
 eobWONDt92JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAduQAKCRCLPIo+Aiko
 1QO1B/0SHnYn7panRBTo1IS+8Cr8do8q3/z8CG8T6fTAgUXlq7xy/zOnHoCF42M0ieXTyV7YQ/z
 cQnWdqx+Erjt/bwe0xRuejxplCDVdRnwoqJWlkTQa3RRpVC3Pv1J3HETUgH9dQxAe2InJ5RdKbp
 I2lxInSBYOdMD30sbJs2NfKL+tcRKO3hy5lap1+JKBCjWzIKj4juaEgZcxleBs1mdIhAWgzZGUD
 nLFhYljjrwhvhv6dvi+IXD9E5I1faQmchJFUq7tjgSod3CPzjUL4byQJIpqrpRZRYM4mlUzY81g
 41iEJM/GZIAKEMqXIyPiU2UPMeuXPR6g4go3iwvPkEoI4Fmr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=HZwkiCE8 c=1 sm=1 tr=0 ts=69e01dcd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=5qjnEABnMYrc5H2CFY0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfXxGlc81O9qzAM
 Qfg7D83cELZEDxI1oHx+OTlc/OCeGKVz8WSq9eDANIapjIryubla3BVfhDqa69hH8ttrHigXSGi
 Qjggh7WukL7Yyp3gxs11yiAUgwmqaGcftl7LxRa5DSZziY31RQy4cyu3p0pkRhHkynUENYi8vOF
 CQsIi0H7d91f6DLAYh/Fti7tVuZ9LT2C4EuiD8HJAAoK/gCGNSyLVaboZFoMg5lLxnPFxI3lCPb
 BQwQfuWw7RM+3TIkWgAtOF1vbmKHfzVkrKrbfdW1WIxARdV7fnGOfX+/ZaDZXcs1ks1yrlfnAjY
 NrcU7zprhjsvpitR7Tw/nulydG+REg4Ja/QOMG1vfXaPff2SdTKI3z2MBNQ6DkEFX6gg/yMye9J
 jpgYXmGox6JtE+hc5EWKHnh7NlWq2+i7t+Z+W5O4FsSSKraGHW/2MxvJFsVY/+IfNuSkbbdRTd3
 b6aruhehGsNxiz46D7A==
X-Proofpoint-ORIG-GUID: C3Y01XCgEbMA5l2WTshfqnaxDX4PRYTD
X-Proofpoint-GUID: C3Y01XCgEbMA5l2WTshfqnaxDX4PRYTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_162255_211896_9799EC9F 
X-CRM114-Status: GOOD (  13.88  )
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

Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
the DisplayPort driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 619bad2c27ee..618dce748316 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -373,7 +373,9 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_with_irq(&alt_port->bridge->dev,
+						   conn_status,
+						   alt_port->hpd_irq);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3


