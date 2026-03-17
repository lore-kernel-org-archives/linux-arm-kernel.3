Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54665FD8761
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 12:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ndBnQOcCZwfhVbMkaVHGUIs+rPdGd5HI+jDlLkFWiIM=; b=lRzTvm7v/6oRNb
	IIR2yNhHhKJJAWNxfYnsbd0KR97j9aIOIKu1GuXPHHo+ujxClsIvdDTN/6Hy0raBCMCSaLorcffFo
	F67twDXBFGlZfdYg+4PLDj4K62uJUJTad5iTOX53qaJzOhEx4e/u5XeT77O1Ev/DZvTt1z3KUJtnv
	s27iMLrtUfAugnt+UYlKhqCfr0dxm+B6pkn+PzT4+GgX5qePyJe+bjVbvdZJTmIjgY1+iXPDzC8Vm
	Ptc6Irm/8FE3DkdSdrrj16lh1SO+p8hKGvkpUssUUm9E5iJAJoHILxa9/WczxM08E/KrpStsPZV4z
	dqkNhngqBng7cFMhTV7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TfW-00000006J88-10wp;
	Tue, 17 Mar 2026 12:37:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TfU-00000006J7I-0pR1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 12:37:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8IPsI2314805
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 12:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ndBnQOcCZwfhVbMkaVHGUI
	s+rPdGd5HI+jDlLkFWiIM=; b=SosiWWsvX0TCJ0UiWp7jkQKEKjEOfmf33l/VIb
	lyV4XXoIqslNWR6UtAlRGIMEAPH4XUHdT+vGbYWeGU/WOBQWrYBsgWVR0iE9qIau
	gxAFG7xAhVtfyoXw1Bm9wRgezf9bAJyrlGg4OyODM3LXmAGAKknS0SfG23BCiO0F
	3mvlWZhMR131ipAod2yeT3ff7iNZrfv+qD/PNErBY3bGB8e/ZS2VTEyTfb2HCeAC
	5hs1W9WM/NfSr1r8MxJgxZQ0XdrS2lkR7R7exOM+FUgX35058kigu7E8M7gM12Xq
	DnrsVvBEmv7SFIhwbM1J8Yg7j9ujhnbc+f/86LiBHGW9gYHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf2bumr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 12:37:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7774be64so3382720785a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 05:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751022; x=1774355822; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndBnQOcCZwfhVbMkaVHGUIs+rPdGd5HI+jDlLkFWiIM=;
        b=aISwyC6VFcg4uVzCsakcZtvBir9AK4jXIWkKRJibzL7AF9BQN/v6MrRx79K+T61ajU
         Z2lEBcRhEjfvjz58VvsnLC8uEB4rfKoyUk9ThHTsGq5BQMNiqJEFbSahZIl45x/V2nGD
         EQAzgVvTBOd9Dxfu0vIUximV+Dn3tEC86H/mbbxhnvla//3GkuaZqnGUKOXyuHdS/nw+
         Y0bgKrWUls64KtszIiD3dTsy7sp8jRtzQG48basjU9CSx89Oa5CvS1h/0hifZNA3U3Yt
         7co9wQ1Ix/H04b6FhotMKvCb/PWkU0o4d0Fx3Hbc2koYNtMJMCt21XYnyhHDZAjvdVrE
         vz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751022; x=1774355822;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndBnQOcCZwfhVbMkaVHGUIs+rPdGd5HI+jDlLkFWiIM=;
        b=F9X8ItG+aUsh5QBaMZTflEdmuEEvB0ru1C+ewWQOb6Fu3IZPyI5XDLKjkBZsn8+PTI
         q7cSx+XoVeU1/jlWCvDDfxPM1liMPpNrLztTFwGVVkIa49TdTqPLrCOHiOwBzVz99r+w
         y9PPux8cYftKQRR7z8c/pt53UucUek/stk9tXItmtK/bURFrnOcProU4XhYLF2CO96/v
         snfvKA6sBDttB6nAdM+kQg0FvqYKRhJ0AgWwUV20+1IcI4eMB5BOeOaiWMMIqaikia1v
         wlyBC5jwdAaHraaXULtOGAxk7In6wC/bZohVsFz2Sz+1MVuE0BrwROHRRHo78SaeHofv
         LayQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi3EDwFChovSsIOFkRqmhdD7LhJQcMr+ABGEI9q0dYr5KNTTaqSCVhIdT2T6+RBtTmCqk1S3sBW9kOQ/zwPcVw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy95PQEy9+PNa8sHy/KrhK183YCe15LRFvKk3d1XS4Eb2rIMwZy
	Dk3JRozoHu8kQJyDiAJeGyDiyQ68HMQbUWiZ1Ipxlrh+WBpilYLBMRJj7IrMV2u5VF20q8tSghY
	o4XStQqhOpHyo0Ezmhj2qV1gGUQBmjferQ/nYvwTbpTVKGFqGBBnOaHHJ6xnF5Ht/ouLMGDKouG
	nw9Q==
X-Gm-Gg: ATEYQzz0HAmZG6FwfrhgHj+qe4zJ2l8habWE+FNoMMiRTCeApeQhPRwecv5cTf7pWqT
	iSap18azi++U87Y6py7fKYDRpSnbdRfc3OVu43pcxkYO23+7KaF4sQF1sb4WgpKsHlhdrjJbhZr
	BOe/TbIRJjdLJZV8jAXsOVpYK96EErSdwCEOU51gosKIKNPwIpXsJv7Qr7uiSmD5pwCTR7CeVzQ
	T7lA7g1wl2pkHDWWd74S0omsh4aZH/92CtEKgsUVvOklJBpfzQO1r2l7CvFG0QFtcPBTSO/rV5i
	ad9Sh4a8VIiNDqbZ7TpaZosjw4hmVwXBuawBU62k110av6Pk6IhQe2hd3gOL7dVgmUuC0jwfGOQ
	EjIFakfgqZCwzO+wUlsDl2+VBtewxBt203DPEWL5pRlwd
X-Received: by 2002:a05:620a:269a:b0:8cd:9bf2:60f4 with SMTP id af79cd13be357-8cdb5b25e56mr2243336285a.47.1773751022230;
        Tue, 17 Mar 2026 05:37:02 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:8cd:9bf2:60f4 with SMTP id af79cd13be357-8cdb5b25e56mr2243330085a.47.1773751021716;
        Tue, 17 Mar 2026 05:37:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/5] ASoC / rpmsg / remoteproc / soc: qcom: Constify
 buffer passed to send functions
Date: Tue, 17 Mar 2026 13:36:49 +0100
Message-Id: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOFKuWkC/33NyQqDMBCA4VeRnBvJxKXLqe9ResgyaqAam7GhR
 Xz3RqE36WXgH5hvZkYYHBK7ZDMLGB05P6QoDhkznRpa5M6mZlLICqAQPIw9tZxwsNz4gSauUEK
 toNH21LB0NgZs3Hsjb/fUnaPJh8/2IcK6/YNF4IIbDWCOKJSQ5dUT5c+Xehjf93kabDWj/Dm1K
 GDPkckReC5NZfVZN3vOsixf3rvQWf8AAAA=
X-Change-ID: 20251130-rpmsg-send-const-ae216a1fbd8f
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2902;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uPJoi/qVSLB/OsiNzwPHjB8OklNRj/yykobtrrudFXw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUrjtOnsYsLvrm8S/FkyVJoR3M4nXv6gZd9L2
 IL+Yr/4XnuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK4wAKCRDBN2bmhouD
 16XDD/9ZiyAJQsI5shJ7BOsxUZSD8H/YUWO9siR+JgwtzJSEnr8oBBz2oXX9p5OWMLfjQemP/eE
 YD/dHx0WIDF/7PLaFPD6iK6JY/qBHZCxGwNTeyz7Oho00lFJJPCKNN4xqY0arQ2emoa9VqOJy3y
 lteojHk1k1HWHHdkyZlxh5J2uoI6ic0qULpbL5Azq20EVgyUXPVshiXNVsetacaqA0lWDI0vdQE
 bydAxp342c0y8yo4KliOksgOD7MXUxdLmTj35ZeW4AcE8zQCr9Q3uFJ9vn9uPrA4DD7L5Gkjy5a
 +TbZ++kW0K80Ll89JH5FyHq/heo1nnjKhzrcTuzZ/S4IuGibJob83j/54ANQuHDsJlaz7deg4/V
 +WOEVBwP3OxXBPuq2bLmlqDMTX1b824bQ+z4jT7jv+MFuxrwSvXbxVUxb/aZ5lqzLHE3wWAnht3
 fjtHUGnE9ttMAmXoPaQ7ZGMlina9DMNOqh1MerQleT51M4ImK7dx3r0FC1bXL7GSDjjG3GP1c/2
 yFGQ0bvtibPI/pcdCKMt5+P3rFAviIc8BEftsx5gf6WcexZbdptUfyerJ56/yzvGgqQbOlNCgMS
 8FBNqg3y4aWc1EFNBtpCEMP3JMJQFowMKfbr1/Yp+WZaTZ2Hp7QCZp0F4gMrYWy0DxBO8cAEfoK
 dZfsaMyLNAxs9UA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 0GqezReFsmav1hXcl_X_XsiHqTyrQ-Cs
X-Proofpoint-GUID: 0GqezReFsmav1hXcl_X_XsiHqTyrQ-Cs
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b94aee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=BeD9WHbRS4kTi0j7Zn8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfX03s8IIY0ZpIH
 jj0JWV+W31pWmkTWC56ZGYxZI5CA6l70gnB6ro8sG0fPAx5IFl/GXwg3ttCcQtoflw1FxZpLH6s
 I3lAzbHV3B2J89mBTJ7SDoRQ/0f5rFPVyjlIRMcQ+TbI/kL9S7Mv9D+MPJINGYWHRChw52cJfHM
 P4g7j59qJPEhYIv4VP0jkRjLzIgT6RumD/3wnLYG56+2kljnBXs3Mw/DbLEWoiLWO3SG9o/5Mga
 vXiqmcnnUPJt/yjojt1g+wHUiSmolMMwFmH3WhveujPzPFsLiD1A9BfK5i8uOtI74xNn8xM4cgS
 5NEB6PHySgC2dv2sx59CWGAiGPmt8K76Fe+Qsi2+jyGEmi+ch+oslThzTkYZI/ABr3e+ciBUS1J
 DBXDZRUs2xjt7jQYiS+JH/XeqkrY3ohhHSnZnvWE9reyNuraghtwxFIlHHIT2t2wcJow1Vnhnxl
 KjL5Ka0BZd0ey0KjrPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_053704_388025_1585AB1E 
X-CRM114-Status: GOOD (  15.83  )
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

This got acks from Mathieu (remoteproc) and Mark (audio), so can we
funnel everything via Qualcomm remoteproc tree?

Dependencies / merging
======================
Entire patchset is one logical chain, all further patches depend on
previous ones, thus everything should be taken via same tree or shared
between trees with tags.  Probably everything should go via ASoC with
necessary acks.

Changes in v3:
- Subject fixes (Angelo)
- Tags
- Link to v2: https://patch.msgid.link/20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com

Changes in v2:
- New patch #5: media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
- Rebase, add acks.
- Link to v1: https://patch.msgid.link/20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com

Description
===========
The remoteproc and rpmsg send-like functions should not modify data
being sent, so buffer should be marked as pointer to const.  This is not
only self-documenting code but actually increases the actual safety and
clearly documents who is the owner of passed buffer.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      remoteproc: mtk_scp_ipi: Constify buffer passed to scp_ipi_send()
      remoteproc: mtk_scp: Constify buffer passed to scp_send_ipi()
      rpmsg: Constify buffer passed to send API
      ASoC: qcom:: Constify GPR packet being send over GPR interface
      media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()

 .../media/platform/mediatek/mdp3/mtk-mdp3-vpu.c    |  2 +-
 drivers/remoteproc/mtk_scp.c                       |  2 +-
 drivers/remoteproc/mtk_scp_ipi.c                   |  2 +-
 drivers/rpmsg/mtk_rpmsg.c                          |  4 ++--
 drivers/rpmsg/qcom_glink_native.c                  | 13 +++++++-----
 drivers/rpmsg/qcom_smd.c                           | 10 +++++----
 drivers/rpmsg/rpmsg_core.c                         |  8 ++++----
 drivers/rpmsg/rpmsg_internal.h                     |  8 ++++----
 drivers/rpmsg/virtio_rpmsg_bus.c                   | 24 ++++++++++++----------
 drivers/soc/qcom/apr.c                             |  8 ++++----
 include/linux/remoteproc/mtk_scp.h                 |  2 +-
 include/linux/rpmsg.h                              | 17 +++++++--------
 include/linux/rpmsg/mtk_rpmsg.h                    |  2 +-
 include/linux/soc/qcom/apr.h                       |  4 ++--
 sound/soc/qcom/qdsp6/audioreach.c                  |  6 +++---
 sound/soc/qcom/qdsp6/audioreach.h                  |  4 ++--
 sound/soc/qcom/qdsp6/q6apm.c                       |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.h                       |  2 +-
 18 files changed, 65 insertions(+), 56 deletions(-)
---
base-commit: 2360a9a195d2eae6f7d0cac2cbe920ae8a06c54f
change-id: 20251130-rpmsg-send-const-ae216a1fbd8f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


