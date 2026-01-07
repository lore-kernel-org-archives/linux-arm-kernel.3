Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD18D0D15F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 18:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=46Gg+PyoOePNZTavJ/f0dINF0Iy1zt9yuv/JMI3KZdo=; b=vZeTH4HACX890/
	skxqaztBJRo4UH051wDLW4zJdz91UjVWPuQ6y8xy7k6tOqwKOBNYbfolyUPt5fE2oJ2pYotQCrzvb
	07Vq4JtccNIZ3FT7XH9CGLAZ3LsyOsBOmOGCmAnEII51kua2Thj+VTSmVqiy5P3QfvYhrMpoAGRs9
	C6MMGW5iZeRPDvWC/gvhLjnEJPsd1PXlpUjlZ4vSQIfzSkVfBrfOKVDFNpHd9hVYncumpHnynNZHq
	KuZNT7bge1ajFC/M/Q5Z8y3y7y2WDKzz+yOaLrUZhNeNr7UP4wjseYhJrp3vHCFoYUZ4g8sHDPvM2
	t7BjPu7jnRqd2SbHFq/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY3o-0000000FRKZ-40ZW;
	Wed, 07 Jan 2026 18:15:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY3l-0000000FRI4-3gNB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 18:15:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607BMT363152745
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 18:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=46Gg+PyoOePNZTavJ/f0dI
	NF0Iy1zt9yuv/JMI3KZdo=; b=b5wQoHxQp3wYlAg6T+W2ikXEJPzoXy45ScOMWL
	Q0FCIVPJi5unHLjJ+z2qvG8nBQruKD4DJNosWNMZ/5uESj9hgoxtjNSkYEelFqtK
	jKSFs1ELv/tt5/gSAJEFs3y2c7NtES/da07XjZg2B8SiW0/PNFp+JbEefb4W/ffp
	LHxHntJXzkTwqwLWI5L/jigaHDy+wkmTdC4IeBf80PEsrvb6e+gikjoEsdUc+Q0Q
	vzeoY4mw2nfmC9HLfCLr5JKIj6YRRHIRrJOu0dmZmszoKjExas1vrDa7SZX71Ody
	FArH61t983BFcy70sZShIPcP1Ppvfvm6GrWKMLnvCE8QoNzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhpjasa7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 18:15:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b24383b680so927328485a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 10:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809704; x=1768414504; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=46Gg+PyoOePNZTavJ/f0dINF0Iy1zt9yuv/JMI3KZdo=;
        b=ZOUAhs/dE+rQfSoohbsh8ufW8JsglsHjm81kYIMrY4Gdtj+ICnhu2uWQp/ot/kLt/5
         PWK/FT0njp+X9T3X0sMJIWZajkxaVN8HEchzRgx5oGZ4iWOR1ZLM0mhzUm2GNEgnto8U
         LhQCf0RLXGuavhzJeGHE1+vubMHBcMVwAtmM8qsvPFfZ+BdV+bFIv6RPgkZzyx/a4l28
         /uRhr5Vrbu9DzVRIXzA03V9Z+n1vU4PMxutrxAgtLTYt5f9q/b4gjtCn7aXjJ5Np0Vn+
         tfOhjkDicvcg/1sQNqsKtLuCwyfoofz3+J+fc/xfZMZB0O3suLwreKvSb4fMpfp7ZYjo
         W28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809704; x=1768414504;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46Gg+PyoOePNZTavJ/f0dINF0Iy1zt9yuv/JMI3KZdo=;
        b=bCezBYqiF/3aO72r0ZFKLjxhw1kcVrxVFdCvkCtsaYHPIWp+PZ8bN1F7LKX9QdJZhS
         K/PZzSugKq8nu9kELxJnYG7xwUgLmj/CMmzula/lFbl8+MFB8TXgVrWaBFCOxWOIYRtS
         Vl08AOkKjuA3F/vy6HJG2VIgin+Ys3iBrdz3c0zsRbZG6jyN/ntE+c82rlnMBZGhBHnS
         BcnUQklphGlPrL6Jd5LlFncmBhC3XLsMHoYxOD3W/pnUCCsn3mzVMuWkZbE4P47ORuqG
         3YerNahHExCWjImy9i8eacN7jE31NHx5jDnsMsR+Ii2IYCBngJb53mo/5CYnHs8+37Wr
         ff2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjZaduD+51c+h4CG7+4iIyuOH6mt4a7l4wws1doNJkeeMmxI/ZSenAPO0t4ZWXi617Jlv4AUyZqBAedoy+qYUA@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk6jdiU6Avg39C51qRzS+bw8vEEaqhkvEpgPc+tChJ69JOVXei
	4cc/JvslzQaldt9ZbZAnM7H0UnBgQoQdCw6gp9fgjYoKuzVjIWNrQmvvkPJ+oprTkT1S40xfN3X
	HW7oQvR6aelZaL0gJ6ZlI3seJaU6XhQpeBLjHMq/JMsH+9i+QkC1XPCYw3iezUv36gBSs9PX8fc
	jofw==
X-Gm-Gg: AY/fxX7G/wT0ga3r9Wi2ycuGmkkB6l1P5p0llViPuU6UUD0jFLM+EET+NdZcU9vfc7C
	pNWKnSQo6LnrPWwzDNVvCAhXoQB/kxYmEUY91mJlDtJa4Vdvc90RUelN4zcmRXZFMGWVQ0SRIXd
	wk63pEzodvWKw1cQFGVK6ojDwBywzfAUmtg/nn8kvCT8Znu8FC14rPnjizSyZdqOqej9HO5Iht4
	ZfAEalNANH0VtxK6DvaDMW7fLF6mwKG1Q6OJB1bFbmP64CEWvy5bY/kXbo/BXRiCyKHjICOywGe
	6jJEeQ6ACkgSkSi/KZY6cJnf1pJ41wQI3ILajTXYv9Yjc5BbG6o7g+O0pRk7RyaY+emAtCb9yDz
	gEIf95DDuKsgUOlcDBlEsvsICKIKp+rO9Sum6aV2q06VGDhXdEuXBcc7o1Qwqjts+5jk6EBVYeY
	F49QY9OXakm+ZEqbpKhkY7HlE=
X-Received: by 2002:a05:620a:4145:b0:8b1:1585:2252 with SMTP id af79cd13be357-8c389379d10mr442481685a.1.1767809703694;
        Wed, 07 Jan 2026 10:15:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElQihcW3Tjcl/g47DFZ0X3Xy9yKLqj4E4uU5Naixz+3u8V8AGWXuPSPneKVozlSO90301DfQ==
X-Received: by 2002:a05:620a:4145:b0:8b1:1585:2252 with SMTP id af79cd13be357-8c389379d10mr442474185a.1.1767809703041;
        Wed, 07 Jan 2026 10:15:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 00/10] drm/connector: hdmi: limit infoframes per driver
 capabilities, second approach
Date: Wed, 07 Jan 2026 20:14:57 +0200
Message-Id: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKGiXmkC/33NwQrCMAyA4VeRnq202eqsJ99DPHRrogG3ajuHI
 nt3Ow/iYXoJ/IF8eYqEkTGJ7eIpIg6cOHQ5yuVCNCfXHVGyzy1AgVEWKnnmlnvJHQWKrsUkQa5
 rW6CxFivrRD68RCS+v9H9IfeJUx/i4/1j0NP2LzdoqeTaVkbr2iuj6l1IaXW9uXMT2naVh5jUA
 b6lzawEk0QbMuRVCbr8IRUfSQOUs1KRpYp80biGkNDPSOM4vgBcyHlyTwEAAA==
X-Change-ID: 20250927-limit-infoframes-2-6b93e599e79a
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3984;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gX9SpOCO0/7Ulc3hkcD6g/xnQUwnJ/+8R4Xg744u4yE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKjKvSyr21kbkh8HJSdMuDgMW95IRHJ5Zf+6
 v4b7inYl7+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6iowAKCRCLPIo+Aiko
 1TCRB/4x8rn0hPnD2RKVnGj/gtjxhkM5jJjPtq3SxdltJdWN+UeeTrLxrwZv+0hkL7Yeal2G/ZK
 z5CwZoquEq5/Fk0QXvHuBnPtLwzK/L5OicGMVegNDtEBZfdsZiCrfVK556IFooZTd+V5ZDchY9I
 ttBQdoxQZIg8n2A3f1w9JY6oWBoLD1qfRn6NyXZPJVG88WyDtwY9Tva/yAXD/2W4/w2h4/GvgFA
 wdo+/sQdcS2PDnz532CVB1rJR0HPEfXSOC0wZdYeT66tGJrVfvKsAFEwzcLyq20cMSVRdpi19F7
 VJWc8PN+Q4a+46JJIaSDDIOV/nuaqm8XoFehBn8/d7QYqiVI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=efMwvrEH c=1 sm=1 tr=0 ts=695ea2a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cAKecciHRQCNmb6kppMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: A9aFrRKxrl6YvhGUf36XViXQas49Hd-_
X-Proofpoint-GUID: A9aFrRKxrl6YvhGUf36XViXQas49Hd-_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfXxIXR8wPpoUYr
 Xe/T0k2H8FvWjuXxHmXX/pC1S6F1BnqqqvSkVoo4fzkOueW1GOY+SNGqYLeuAN1tMyeUJSSCgrk
 VoAz/BA3JPuC7QzrC/RRFvMBKCRGHJz0Kup5AzoKTm5ieHSqvFDVpUl9+CLy2MfkIV8+Ix9wSyx
 +kUHZzZZmh6q+LoZXBhCV6tApH2efsPqRuTk8lK5XsaMoGgybTXr+536xu6P8pygCH6hfsPkcNT
 3BEc5O0q4KNGTBhll43pYq3pyhTOIfA81JkHL6BKnm71DA/f3hG+AZGdEBMGfY70o4OO0aC64aY
 MR8QaN7APANgLEer1LRpU1BfuERChb6Zel/4wll+y4dpnP8hevj71+yzqW7BOARvrnb+i9n+XBE
 MV0911tc8P1qZGBjFZS0m/5j1t5gkaj7Vxfqs1FLi2Z1fvsX1D1gLcrYTnrMfSHtt6NdB8QkBME
 9QMauci6ZJ+HuLYracQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_101506_157940_1D881D44 
X-CRM114-Status: GOOD (  17.63  )
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

It's not uncommon for the particular device to support only a subset of
HDMI InfoFrames. Currently it's mostly ignored by the framework: it
calls write_infoframe() / clear_infoframe() callbacks for all frames and
expects them to return success even if the InfoFrame is not supported.

Sort that out, making sure that all interfaces are consistent:
- split function interfaces, having a pair of callbacks per each
  InfoFrame type.
- write_infoframe() / clear_infoframe() functions return -EOPNOTSUPP
  for unsupported InfoFrames.
- don't create and enable unsupported InfoFrames.
- limit debugfs to provide supported InfoFrames only.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Rebased on top of drm-misc-next, moving inno-hdmi to the bridge patch
- Expanded "normal" test description (Maxime)
- Added EDEADLK handling to the tests (Maxime)
- Moved hdmi_update_failures to drm_atomic_helper_connector_hdmi_priv
  (Maxime)
- Link to v3: https://lore.kernel.org/r/20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com

Changes in v3:
- Added DRM KUnit tests verifying InfoFrames behaviour (Maxime)
- Reworked the patchset, having per-infoframe callbacks rather than
  extra flags (Maxime)
- Link to v2: https://lore.kernel.org/r/20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com

Changes in v2:
- Fixed build issue in common code
- Fixed comments regarding HDR / audio frames (Diedrik)
- In adv7511 actually check for the HDR frame (the comment was correct)
  rather than the audio infoframe (c&p error).
- Link to v1: https://lore.kernel.org/r/20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com

---
Dmitry Baryshkov (10):
      drm/tests: hdmi: check the infoframes behaviour
      drm/vc4: hdmi: implement clear_infoframe
      drm/sun4i: hdmi_enc: implement clear_infoframe stub
      drm/connector: make clear_infoframe callback mandatory for HDMI connectors
      drm/bridge: refactor HDMI InfoFrame callbacks
      drm/display: hdmi_state_helper: split InfoFrame functions per type
      drm/display: hdmi_state_helper: reject Audio IF updates if it's not supported
      drm/display: hdmi_state_helper: don't generate unsupported InfoFrames
      drm/display: bridge_connector: dynamically generate HDMI callbacks
      drm/debug: don't register files for unsupported HDMI InfoFrames

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       | 180 +++---
 drivers/gpu/drm/bridge/inno-hdmi.c                 |  41 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |  95 +--
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 143 +++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       | 110 ++--
 drivers/gpu/drm/display/drm_bridge_connector.c     | 190 +++++-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  94 +--
 drivers/gpu/drm/drm_connector.c                    |   6 +
 drivers/gpu/drm/drm_debugfs.c                      |   7 +
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c         |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             | 110 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             | 195 +++---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  47 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  42 +-
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |   3 +
 drivers/gpu/drm/tests/drm_connector_test.c         |  19 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 667 +++++++++++++++++++++
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 119 ++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 105 +++-
 include/drm/drm_bridge.h                           | 127 +++-
 include/drm/drm_connector.h                        | 105 +++-
 21 files changed, 1900 insertions(+), 513 deletions(-)
---
base-commit: 349d4efadc1f831ebc0b872ba1e3a2b7dd58b72b
change-id: 20250927-limit-infoframes-2-6b93e599e79a

Best regards,
-- 
With best wishes
Dmitry


