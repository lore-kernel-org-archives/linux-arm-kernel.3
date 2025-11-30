Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412AAD116F6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 12:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=khDYn2iDAtsrUOzEA+11SjiFVdLA2q+h0420fjCDJjM=; b=E6FAefTBkzBd/b
	eMQK82Bjd2jnoHBJd/HYg8xayAbGS/CBbxlTMzBz757Of60q5TwX3+C6WlODHrLQ4p+3CziWVgzVO
	8BVv6D6fYmLBFdzk4Px4r38dhRGzht2+klhpIEfgEX/CB197yHIT1QRNWuOr9h0IawSGYCmJ8RQx+
	MF7ltinw/BkEPXWHyTv0/gRgsndG1VWYK5FUW69oSh3eU0+3cf9PZji8vJVfm9SjoRPAON0ewje8z
	2M1rLk/u0QWiyelLNZedKhvXe+W84f5/yzysfmsF/LJsqjoELE+/NK3uJXG408VRvVoRbPY4I/0e0
	p9L4h6quxKPR2mjBcgfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgfA-00000002HxS-0ZyX;
	Sun, 30 Nov 2025 12:36:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgf6-00000002Hv6-3pEv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Nov 2025 12:36:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AU8bYwo1037086
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Nov 2025 12:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=khDYn2iDAtsrUOzEA+11Sj
	iFVdLA2q+h0420fjCDJjM=; b=RMw0BOPGhi5SF8Hgv5nYITpLNbk8W9uMtjCXhU
	eOaPuU7Uvp8FvkUrEDiAdVuD8KS/xh+XUMjJZ534i/4I/BTMoQD08QxmbDZn+6KH
	1hDdfm6vWMooTzha4Zn80izXs6+5+57I4WfLkHR5MgBqZu0CqihECgS4CX4bQ+Cw
	aa1IJXl8+H8h3TRtqycKTk14TG1ZRYiviYdyvlH+83ZwyVcAYh4hFNZhiQal+kpc
	hbOV+aKN5uCRnea7BZT3B5930I7gu8A04QyURPiqmrfnyVNZtqCILL+ivjgh1qlY
	IBzBWiS3a1p/f1lSUbQdGbYtF+OosVq4+hEZB0GP6n7TnISw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqqsqj9aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Nov 2025 12:36:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e235d4d2so61960385a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Nov 2025 04:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764506177; x=1765110977; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=khDYn2iDAtsrUOzEA+11SjiFVdLA2q+h0420fjCDJjM=;
        b=V7PdOz7inINsI4bUmx1hDB1Y1YBOmSPEFt/RLdzh6rdTGyB7juVGf2qDMHSTxBCCB2
         Mxk6MLIbY4ht8CseHpbk4kXcX2hBwj1vtULSMmpiYoQhe+LtqRZspTUK8soacU++JPEK
         bwQOeOZ0l2bOoQXMS0Xb6iu6CnJmOz0bXayqzUU/Xho0WO/vMkHVZxUj3osSI4nCX1w6
         f+rI0U/W51c/iCIrK+yqeqHm5iduId0H/PQpDwdIsd+XhiLMQiSSzv9LQ2GwFaExswgY
         cZZSTt48rqunZgoU4NF8spqr+lsZjlU335C0o3G2G0pQgdSuSMCLGYzJFN2LSsVeRt9i
         s2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764506177; x=1765110977;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khDYn2iDAtsrUOzEA+11SjiFVdLA2q+h0420fjCDJjM=;
        b=mWspXSjFbgfyqKd7hQYhIPEXrIWqOABdG8IriPAb9oUrNuB/6tMtPaQ8PDuLO0gJGg
         3S2BWG4ZsNeWvpjxGY6N1FkCstr77GMl5EHVEur0WsxtfzA0gtwdZK5dqzx5HMnOe8Dv
         Uu81G4/F4dcYKI6xqfUKAu1QUy2+D1FX3b/hcqqfQyMPlLQKAs9Lui4gd+nSItIhrEkw
         jbhl9ukgLT7XpNbJgoM9n84V9mir0msIKgrdrxMoutBvdJLq83xe9EBpHoAMI9/stBu5
         jwHWhrtLpZD6cOExAKUhA+maclDBOmnrh3v+m8yARu6uMu4gnVxmu6GlUYkf3RdA7WSf
         L5QQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/pQLaKuNhbOh/aY1IAo9c/OeFGBkjL794j3bHjWbV2g1+Fry+9vDHKcgIL9jHzetJ5VQUvQmTX0j5jHWOd7N9@lists.infradead.org
X-Gm-Message-State: AOJu0YyH9k9EwS9V2P32UOraHXnVBE5qR5/UCE/Ol32ZAJog+d3bp0GP
	DVkM23vPfPFFu+oZHpa3jtIdEcJ0xu9j/5CCwiFmhRnFFokaSwHNeJMyqnDa90x0GaDsJ9uvp0a
	OAaV1ZLf3Cf5f/izKakd7foV6rozo0F1CjwBcVX/g43vEqqpyzSVa5rl7Kh/Lc1MpRAUNVy4V5R
	3Ylg==
X-Gm-Gg: ASbGnctBl0CUd1xlcCSHYDY3f4KcKijlrGwO0PWcCfdH6FjyQao/f+qkN53JzziWnec
	2xYaRbyBCU2vwAu8t9clAWx+arm2UzQVJc7hep+lyhgfG1Ld5id+cnOxBI+8RqAPWj7U+e8nsMU
	MlnNi9SRg40JR0juGxSi1CpQ+X+UZtvQVBYOYNZqPFQwU2kOn9MEVQeCd5WDDgSCcc/MVEJoL2v
	U/ny2dh+af4tUSfOrPai/PZbUndIYQ0XhmWddnheJAf4Sjx8EO05oUWzvpbrcO1hR5kmIa6CTMF
	pZYrq9KI+OQg17C6UZG+8AEjHNHdYd9aYhGtUqe6joNR9Okdy/x6Bkdut53qqLAvZGU21h2jjUq
	4I8oGOwWiUM4HGB5hzhK+jsjK9z2VjcxRKA==
X-Received: by 2002:a05:620a:4411:b0:8b2:6251:64f9 with SMTP id af79cd13be357-8b33d4a74f3mr4231818785a.58.1764506176688;
        Sun, 30 Nov 2025 04:36:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeWK0WiHjAtwF/qYOyew/roqAG0tsI6NrdqTKzALGVqVXop4gZMar8qFcPH6xWCPkSaoNwMg==
X-Received: by 2002:a05:620a:4411:b0:8b2:6251:64f9 with SMTP id af79cd13be357-8b33d4a74f3mr4231814785a.58.1764506176170;
        Sun, 30 Nov 2025 04:36:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm920506666b.29.2025.11.30.04.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 04:36:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] ASoC / rpmsg / remoteproc / soc: qcom: Constify buffer
 passed to send functions
Date: Sun, 30 Nov 2025 13:36:07 +0100
Message-Id: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADc6LGkC/x3MMQqAMAxA0atIZgNNRRGvIg7VpprBKo2IIL27x
 fEN/7+gnIQVhuqFxLeoHLGA6gqWzcWVUXwxWGNbosZgOnddUTl6XI6oFzq21DkKs+8DlOxMHOT
 5l+OU8wcxCDy5YgAAAA==
X-Change-ID: 20251130-rpmsg-send-const-ae216a1fbd8f
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=O8qqd34rZzKAlT8emxlMGg0aXIBHepVV/wOrOHz5bV8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLDo6DD/JawmdtkgkOBaTkDXZexZA72yvwkmRX
 2xb902gWAqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSw6OgAKCRDBN2bmhouD
 16BfD/oDmj4P63MBv+3h6ohF7ryGULYXhCUqF9p+69+7wePAdkGFR0SJ+SLk6Vy15z2rlQeSYXS
 Fq0PWTPhtAA3F1Ltma1AbOQtUE9D9Ovkh1yhinbcXfEmEo5kRDloS0j9684M6ig49Sd8AcrU/8B
 082KRFV04slBSkbB0LADnS0NIVUtOTXI1enIqRB/fb1b/XClxr9xdMFY89a9vLJbp01nB9eZuaO
 eIRfeXxCK6HAHForIN0cpb8NvBA+D7ygWojSeB3S0I+FLMujOQ71pZjD9p9cIxZVsTBsGq4SB5o
 28sOHp4Z9VhM9ocdhOfEfje2u4h8Y3xRN7AQEBMTzdbXwCtthtVc0YE35DHNNPP1gWWl6Rkp8MJ
 8SlHUxvsxP5Img8IkUhJMbbkjtJye/7IHhPhsMRaZ5ANNJvp6jtcCelghY/Lyaip5VzXutDKsoD
 srWqfPLvBae3f1g0ArGiIsAx87MkgflTDPvSQ0HxR5Pt+HNtrV0dBpEX+5Yn/tafiqWMANaoeB0
 I5pPYvOdRsjAm/a0B2w0erknqUgmJHl6V3PETd8TiLyHb8LORu5YNLjcfF0q7cm1RcnzmOIVllq
 cEMypHzNVe5FEFQqxGUVv/RJ4FuNFpaYmBCwwH+1SehdWQZZwn4woBF+Yz7b2SjkCHpUmJ7BGaS
 pz9b+fLWw9Cti1Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=UqVu9uwB c=1 sm=1 tr=0 ts=692c3a42 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=a5V6tGfecjnVh1JciPEA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: yUriA16umo0hr1KFrng8etsQtkksmTAn
X-Proofpoint-GUID: yUriA16umo0hr1KFrng8etsQtkksmTAn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwOCBTYWx0ZWRfXy7Tn6wMan7rF
 t81vlFl2+P1yL0orv6lpb7kNBkxaJ4wFDPmOXSeLFjYS7CvcQ9QI/El3vn6zZOkjFEHiQ/Ktdg3
 iVvcR4BP1qq6yyP8hLhgLMONZDUmC/+kmuRyx6swPbLqva4j+xvEfZapI/b0YxJ3k07pt50phiu
 1Pj07EIfaKAsNsaPeAVvHbFG9EXFLU5Aq22YwsP1QfBM4gVhVxAUplno3unAfZJmWepqzwUYzq7
 N/khD94UEvyuaIaHYHzIlE2RkC2F1Y+/UgN6BMdcYXySq4T/SC2niIiBl6ShI56FKM+G/EvdJGO
 FYcEMgLe4HT18DEFcSTN8KY0lG9aj2YY8IEqCd57m4lCiGhBHM0ot1rj9VA5yhPo9m3zeKTHib7
 OXOGzCefXVX6DsGBHaVCR/dsRj2zeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511300108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_043620_969999_47E45A23 
X-CRM114-Status: GOOD (  15.58  )
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

Dependencies / merging
======================
Entire patchset is one logical chain, all further patches depend on
previous ones, thus everything should be taken via same tree or shared
between trees with tags.  Probably everything should go via ASoC with
necessary acks.

Also, first patch or two patches could be taken now for this merge
window...

Description
===========
The remoteproc and rpmsg send-like functions should not modify data
being sent, so buffer should be marked as pointer to const.  This is not
only self-documenting code but actually increases the actual safety and
clearly documents who is the owner of passed buffer.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      remoteproc: mtp_scp_ipi: Constify buffer passed to scp_ipi_send()
      remoteproc: mtp_scp: Constify buffer passed to scp_send_ipi()
      rpmsg: Constify buffer passed to send API
      ASoC: qcom:: Constify GPR packet being send over GPR interface

 drivers/remoteproc/mtk_scp.c       |  2 +-
 drivers/remoteproc/mtk_scp_ipi.c   |  2 +-
 drivers/rpmsg/mtk_rpmsg.c          |  4 ++--
 drivers/rpmsg/qcom_glink_native.c  | 13 ++++++++-----
 drivers/rpmsg/qcom_smd.c           | 10 ++++++----
 drivers/rpmsg/rpmsg_core.c         |  8 ++++----
 drivers/rpmsg/rpmsg_internal.h     |  8 ++++----
 drivers/rpmsg/virtio_rpmsg_bus.c   | 24 +++++++++++++-----------
 drivers/soc/qcom/apr.c             |  8 ++++----
 include/linux/remoteproc/mtk_scp.h |  2 +-
 include/linux/rpmsg.h              | 17 +++++++++--------
 include/linux/rpmsg/mtk_rpmsg.h    |  2 +-
 include/linux/soc/qcom/apr.h       |  4 ++--
 sound/soc/qcom/qdsp6/audioreach.c  |  6 +++---
 sound/soc/qcom/qdsp6/audioreach.h  |  4 ++--
 sound/soc/qcom/qdsp6/q6apm.c       |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.h       |  2 +-
 17 files changed, 64 insertions(+), 55 deletions(-)
---
base-commit: 7a9e871ce4c7c8a7d75eaef8407083a0525de2dd
change-id: 20251130-rpmsg-send-const-ae216a1fbd8f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


