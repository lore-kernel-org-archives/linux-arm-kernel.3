Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3163CD4F43
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 18:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/8lnfbEOX7ej5tjeRNuBsagcrk13r/0jAm1jfC+Xj3w=; b=Op8rWgYcvxzqNn
	6mdvrqbDUn0uHsQPxWBSRrDS6Emw6+NRseuak1Yafh9vKSsajAC0zJHBda7VRWVWUKfncJft61CLO
	Yy0EzL9JIvKQA+sXuhEWGZg4lxKzeWyNOwpXpeiyRYGpn3vrovExCAvKfALDmcIsB7DBhaovEUz14
	lp3nwNGkc88LgvP9fNrlEvnRvhL1reA57F+7xjX5BXycpcXMhRYxH61kuZpujmi1l90agZS7Uvhe/
	206dmvCdz16ZJfG+U3elN6T5mdxhhpS0bJ1VTWIcBmjkTwuz6nhRiFmPPeqKj+CwaDz4AhSonul6C
	JF0/u9ttSsWAjRmktphQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFQ-00000003SGc-2mdV;
	Wed, 13 May 2026 18:23:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEFN-00000003SE0-0yAf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 18:23:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DHKFTl1393146
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 18:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/8lnfbEOX7ej5tjeRNuBsa
	gcrk13r/0jAm1jfC+Xj3w=; b=mxb4eT351HYUVNlaFmZ0YbQdmIqO58P1ttDhsi
	LZ62cFmcw4jzMfy5sq7dc9VPZVpJ03HTiRQZxoOyvywpTsL8tUb0NvneP2g75+0c
	AJYFN0IkImN4tdEAR53mJY8D7NQMwAS24bgVMFzTC55s8cfgtOmKOmiIFMH9dbZ7
	G1BpMZ734vtj9Q4wXel4ZBn/sed0rmZQqLn/gZp7T87xxUpRadk/9H2XA51IXhD6
	+/p57z4p3ajZwI15QX4ktjBUUnvPvvp9FJ6hqHQTIvNopxrw2tpEH8DG1Tsmiesr
	ZDbcduU/D2tAtc4NCTUgz+eiI0U688wmj+nj3MV4sscwxGCQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k26328v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 18:23:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514ae0e3ad6so108334141cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 11:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696631; x=1779301431; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/8lnfbEOX7ej5tjeRNuBsagcrk13r/0jAm1jfC+Xj3w=;
        b=XxIfEG1tXgbFPH9x3sG1XrchamAHm70PNnkmC/WgJi2fJmucCFOuYuqJtIXM35k8wb
         kl244XWg6Z/8vWwqn5JewekW+k1KmMi2bX3z/QNWWiqTSgICU2Xz1R16DxquJjo//L1J
         FDc6lPz4hC+s9lqGTA+9jqIbowaSa+SNHawjK/aFa9YXmkLdqwZDbdwyoMdJ+GmaJBeX
         W+LTRUaLKtI7VCkjsXa63QsCxkbsQmdia4i9OVfCsZpX7gIwIpQ/5V93YI7/pNQelgpu
         0nvUoC3ako+YOM/AI5gH7KkFSytc+PABm6olfrm+DvMRCTS7l26nnrHxUA1Rx0rGY9oT
         TLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696631; x=1779301431;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8lnfbEOX7ej5tjeRNuBsagcrk13r/0jAm1jfC+Xj3w=;
        b=CagvzlzeJjCOGyWfgikiE/9+2AzghpxMYi8QnZXV6wnIqzPhf1rDC8m5YU8vG+YcOU
         XncBGkd3cEdu2FzcJ5ozpbA4DOorKCPrQHp7ixwenVHCyum8HmRcdFPqh4KTF2RG67mc
         +0CRUsKqkkiqRBflZmJinlPGjJqDmXLKmc1zbYXCxYYhYUE3a+QqHyl8rmLIljdySwJ/
         0NpDvCyQ2m0FJCq370Cd2AA1FxG7z3WUQ3oj/IrQqek5EqKSgmq6DVl2urv3+QjjXVNZ
         f3sV1N52GJScmQfzS+neMMWJ3NQvmgQobVPB5kHQ+uv4uLXpeiq14gVIxvzKDe61MIiV
         +NIg==
X-Forwarded-Encrypted: i=1; AFNElJ/wy/zfMxOZ/DlSx8xDEuSbXWrvLei7RzHa51cQzSAPM5iyPrtpb9rwqltSqMCgROXm1/3sx34gydcgkWEU+4PI@lists.infradead.org
X-Gm-Message-State: AOJu0YzghazjEBf2L6Lps6HjAPVq8mDljShWVe/kW7ogqKyo2+rT/RcW
	xtDgxw0/lB6lZq75zFySd3sDmF2X/NTWohBfjvMLnL5un8HLS4yEuKzB9hw1wxp1XpvMHPIPFMv
	jgBUzbtz+ci8pKwHDWQWlk0Z+MpiyQ7nEECkL5ELRlPTBfMLNGCHYxfUB6dKlCuWCU9hOdCgN+C
	zZnQ==
X-Gm-Gg: Acq92OEnc9D4/fa93vIlsMv8jhIawh7BrF5Ys2nsdumEDf+OqSQshS/Hyu5EMS8B7RL
	k13HMJ3P+1nuOzB7c2ufx/cgYOsdI1EAwQh9bmp2y8DKTOy1ZQ1wzGUCTphF5f4vKyMfsfMeJSX
	b8IIegGdvRto4zHZELsTGyIRFPdUVxJq37rF/V1ILuwtvsSZnDOstwBu/RqoFzTYCF9u13/R8gb
	28gXG3eT4kTtDi2xM0EdVw19Lyt07jVYHPwFRxSfbLfe58ydnNWLsQuLfK0Bw6I29bDCP6Y8rS7
	NXqEFg+MsULbX+pc/Y7Ej15owfnFKM1Bjg4flrkfBbfBwCUMkTmBu7110lQF3ZagX41UAPr7Z/q
	3JZp+VvPhYQKM91CpwfiCAYJxEVi3SreQv6ogXoQv4esKqanKXWkIOnwODr/aKAeTu4Z5buFCpc
	szzO8XVDuRhuQoCfGBpwn9HbXQLgRlAO32umU=
X-Received: by 2002:a05:622a:8d09:b0:514:cf96:7638 with SMTP id d75a77b69052e-516415a239cmr8446131cf.15.1778696631221;
        Wed, 13 May 2026 11:23:51 -0700 (PDT)
X-Received: by 2002:a05:622a:8d09:b0:514:cf96:7638 with SMTP id d75a77b69052e-516415a239cmr8445451cf.15.1778696630558;
        Wed, 13 May 2026 11:23:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4212851e87.23.2026.05.13.11.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:23:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RESEND v3 0/6] drm: handle IRQ_HPD events correctly
Date: Wed, 13 May 2026 21:23:20 +0300
Message-Id: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3154;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CP/Usd5SOY/V4EM+27lYpiqg54wFGw4ZjWsp+w6ne5I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBMGzqxLK1D79sW3iq4HpOWxquvyKBFjpVcB34
 h7vCOrJ4kmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagTBswAKCRCLPIo+Aiko
 1XrACACZbqw9UPGnc0Rq1LLAPf/snNnVdTZVsXFY41YM+aZS+S0oinCBEk2sFDi6DoOvzVrXO4f
 lZkJKpaBOfQOOmh/eVRIl26g1+GDmKlBT8Wt+DTKHGPFZBELRDHOxm2htwzcF6vWOt0NMqOgYnL
 KgXpWk1I6X5nYD6PVbvE7LO37A8PZZqnrIzMeZjE0SiiJvP6x4poYkeeQp+iJ6tSO4ifjQnsjq6
 6DfAK+vsWVwkacAZjGeYCM74uqTOs0Sj+5EgbpmRcyvFZ+k7YC4lcoQHZSF8SE6h/IpU7aL9nlN
 4WIucg9m4eEPgQevK++Tmqs5JqKyrxqXDLUu4aSLWOCxV60V
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a04c1b8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=52TPwIQhNpV4Ze06EwUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfX6j1g0wLRf8Lp
 CxLUu6MnSQATpx6eL3hBeViQ0webS1WSBjqoKR/IFob2BVVO2Tevw2saO8apAqJGVNm+tVPS10m
 qndekTbykZOjtBba/Aogys87xXWVUs2cI2Ocuq4AjFBMcMMXZlmQNqffxIDPewFiIxHzlEU978x
 CS+vs7zgAz5umMEV7kC6x40VOxc7FbdUVFW/5cM0mJwtrv8UFc4N30f8TLowrsffOPpHrMZybJp
 Ohl38JF80dUsfyRazqAqz6pIyW6KJxZpJ3Wkv0Fm2LyBbzsDDMrT+FAI+8ZiQ2Jllq/H/0+f0lW
 ZBvtY1Cn7TyVuiGtwhHnMfU50OmHuMP7r/ivDgfw8oQyT8XJfdDk5BDfvgESF3jlMPGKlRXE+1+
 n2sFP9VepTSPKSUZWLUZpd5Xh/r0fZLRiVoG7EgC56Fp/L0olkUS+yY+HZ3lp/dfFPSCmqz6h6E
 BfQpw2XbGZI+XzMjUEw==
X-Proofpoint-ORIG-GUID: tklErpgP8x5PXXSH6luAl2fKTo32rxtU
X-Proofpoint-GUID: tklErpgP8x5PXXSH6luAl2fKTo32rxtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_112353_289048_8792C9B8 
X-CRM114-Status: GOOD (  15.73  )
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

Both DisplayPort and HDMI standards define a way for the Sink / display
to notify the Source / host about some kinds of events. In case of HDMI
it's as simple as singnalling changes to the EDID. In case of
DisplayPort it's more complicated and requires actual checking of the
DPCD registers.

Currently USB-C drivers don't have a way to deliver the IRQ_HPD
notifications, leading to missing MST notifications. Provide necessary
plumbing to let IRQ_HPD events be passed to the DisplayPort drivers.

Note: the Yoga C630 UCSI driver and Acer Aspire1 EC driver are not yet
enabled to send the IRQ_HPD events. Both of them would need some more
reverse engineering to find out how the event is being reported by the
EC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Fixed build error if aux bridges are disabled (Intel GFX CI)
- Link to v2: https://patch.msgid.link/20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com

Changes in v2:
- Change irq_hpd arg to be an enum, possibly desribing other uses (Toni)
- Account for that, chaning the API accordingly (with_irq -> extra,
  etc.)
- Wire up AUX bridge notifications
- Link to v1: https://patch.msgid.link/20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com

---
Dmitry Baryshkov (6):
      drm/connector: report IRQ_HPD events to drm_connector_oob_hotplug_event()
      drm/bridge: pass down IRQ_HPD to the drivers
      drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
      drm/msm: dp: handle the IRQ_HPD events reported by USB-C
      soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
      usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events

 drivers/gpu/drm/bridge/aux-hpd-bridge.c        | 11 +++++----
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  4 ++--
 drivers/gpu/drm/display/drm_bridge_connector.c | 22 ++++++++++--------
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  7 ++++--
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            |  6 ++++-
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 drivers/soc/qcom/pmic_glink_altmode.c          |  6 ++++-
 drivers/usb/typec/altmodes/displayport.c       | 15 +++++++++----
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c    | 11 +++++----
 include/drm/bridge/aux-bridge.h                | 13 +++++++++--
 include/drm/drm_bridge.h                       | 31 +++++++++++++++++++++-----
 include/drm/drm_connector.h                    | 22 ++++++++++++++++--
 19 files changed, 138 insertions(+), 51 deletions(-)
---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260414-hpd-irq-events-e72bc076a5f1

Best regards,
--
With best wishes
Dmitry
-- 
With best wishes
Dmitry


