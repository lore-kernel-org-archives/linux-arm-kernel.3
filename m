Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9471FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 17:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qz/+EjbHjFMwiqGr5dMO8yhfFwdsGsf/guraABNaMfk=; b=dO/eguUtrVhT3w
	o+BSQ8ph9C3XCgrUoFCemR2i2CYqHryCq5a4R8AmlRM5FCuGEkV+oST11B5x2R/IdkxX0FBT1GD1d
	wXx+QQ4QyLSgJEO0y5e8wwn9Y61frimjBeOovlwiTfcnWHPnTnUlOSejXRUygQm0Rw7GlXrsxO92w
	ICBZQJii9x95QzRpNsptV60V4KNNtelKATPo/E0hsf5MWXqPM2MlsbJUISwy51iBYuwjXsUg9Q+sb
	trtSytd1C5TIyCnwg/T2eqChoK0FXmHAMNeuIen+lxWpWLAeErY9VgcFLPrZLNvfJmYYJ3IusWWgc
	B60ueQU4KCVg3Qr2HHhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmIi-000000021XP-3Fu1;
	Tue, 28 Apr 2026 17:32:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmIg-000000021Wu-0st0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 17:32:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsj5N3979395
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 17:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qz/+EjbHjFMwiqGr5dMO8y
	hfFwdsGsf/guraABNaMfk=; b=k9s6jmIGIGOQIROF+QREkaPV1JfzXO3tdTj9MX
	HWwNMMbHEAzr7E2GV/paL2BXoo79rZGHPt/HVyalE2TvhNz3GqrETzTK5GQaes7x
	1L17hWYukWV8azHkGSWrhdnOWPUblcZiRgqc43JVkMiPc6xXuTnd6FDcgaHWC5cK
	onKjUVCS7vYMu0GB260C34EC8f/2ACyPpV4N61OXG/dlmZQLZt3/ElWUDuiPK42a
	KjS6vnFEMtoIt+23Aad/esA/3ucaRI9odSKtX9GCJO5OuKjUG6E7Vrwjijiheu6Z
	Gy7X0XkWieig5oKX2S4l76dGO9lCAEgKISo5ik8qm8ldxveg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsc8vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 17:32:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d826ed6f9so1633921cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 10:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777397564; x=1778002364; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qz/+EjbHjFMwiqGr5dMO8yhfFwdsGsf/guraABNaMfk=;
        b=aOJ54DALybGj82EIdVrNxQ6fBYl2lPfmBGO+y9A0iZUbNPN4C3Pwxs1xt5izPM3Fyf
         lleBL595SV7iAbhINrP9UwG80EgIT1Ab9AAhjyRjFRxX95TLxplCQN5/cC1wi45ilx3c
         VvhEUp+K9wHKMYN6BzTzZdhLZbTyMocHBG/b10d+DveH1xPUfTzhCuXtjTgNUC5I/k7i
         I1Pc8IuEh4/MSzdRglzwX9A2vdhie8AGWdayJbL1mPn5ax//+uzB8zKLGf0sNiztDIXw
         gnr2yroE4bgjpf+nEsYjek9vNIDM+P9Kpd404yXPp73GvpgHHSBzBFoPzRGIu2lCM6Vf
         VW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777397564; x=1778002364;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qz/+EjbHjFMwiqGr5dMO8yhfFwdsGsf/guraABNaMfk=;
        b=gw7qMKm0u5+7pJgu6pcjMadLPzHYjSAhGXRPdInIjLGDLtuMQs/FNZg5quzpkdPJYi
         NDy4nl75smofz8gUJRe9zMgbnYukU9vZBdHyVybxREY5KFb+aQ60jMsMHhePBxZ/1EUc
         vo2Vwanam3IbqvmTywmOS29wecyBORsciYbXrw/wITLlA+U16NLCFYbNc6rLHN6SjsqH
         9zUdm8bFG2a+Zw/u/gqMBlYL9pZgzHIJxqMzfC2Q5Yz+oaZxK8VurTTfbDo8hvGezBVt
         S22fW29YoQfSK4xABrnpjCo4ZBKkUC7u+TmckWyOJxkEMy/hlWdzcIXLSCYgse+OGC4E
         8X/g==
X-Forwarded-Encrypted: i=1; AFNElJ8P1zcvLPEi0A4CTiPCliFgQsWBwGbPomYQGImqscYHwtakXsodt1DuR0sHShT5X5Tk46RVDdUm92mVlla/LH4i@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg3LdWwAV5MuE5WwnB5SjofDAE9qPOiVmlbn9b+L11Oie6sH/U
	ogwkssYKq0IvLMs93xAsIojtIQr1QmkU5Oco28Xq/Sf3yTOblSDaJLNYNrDf4aX5nVViuAJgW7f
	fN+7+XwsJX/QM51UZgUj669c1tvgwNpdUX2KuSvUOeE+aZ20b6BQTjucH5nipCbwgNbsYSpWKSa
	dryA==
X-Gm-Gg: AeBDieslu19+j4RB1hY/YaYYXqt6iAtiqfmd2fHrcRgzW17fvWS5sTpWoq+07na2/SL
	dUnEyVBLqogFDfmqbBgsNoQazoThxD3/53xSfLJROjd+oIALv1llVpL6DIHxNjr/6IWQP62YRAI
	aCHjwJpNbgXcs/2oCv8eqclkLEjieSGVOq9qOGIrK4xq+XYVCyOdJWsZ95E5SNOFgKbP+3iAIbD
	RZRwXE57rHIvTScXKs1CmHexXyc/TTzPp9ENraflruvEl54QNhdEFDvwwO4fumcXenmsnGF+paj
	lvwVdhwGgwExkaQxQRK4X+7Uum61iEu1XUpOZeHVAYblA95XFVm8Sx4tvRd6KRu+bn4TOXJnP/1
	Ke2L9mXLfzmefv2nJ2V/0jHicAK8LkjqjiFTHw8fiL3So8UhcrloKldI=
X-Received: by 2002:a05:622a:5d0:b0:50d:9c1b:941f with SMTP id d75a77b69052e-5100d9b1c64mr48785041cf.8.1777397564638;
        Tue, 28 Apr 2026 10:32:44 -0700 (PDT)
X-Received: by 2002:a05:622a:5d0:b0:50d:9c1b:941f with SMTP id d75a77b69052e-5100d9b1c64mr48784511cf.8.1777397564168;
        Tue, 28 Apr 2026 10:32:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b8ce444sm2089545e9.0.2026.04.28.10.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 10:32:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/3] interconnect: qcom: Some defconfig/defaults cleanups
 and improvements
Date: Tue, 28 Apr 2026 19:32:36 +0200
Message-Id: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADTv8GkC/yXMQQ6CQAxA0auQrm3CjECMVzEuSilaIx3tgDEh3
 N1Rl2/x/wpZXCXDsVrB5aVZkxWEXQV8JbsI6lAMsY5d3cQDqs3inMyEZ3xympDvQobkU9cgCQ9
 EQdp96KE8Hi6jvn//0/nvvPS30n6nsG0fyaJ9V4EAAAA=
X-Change-ID: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=749;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sWxRZSIVrfi9WvbsEWE1+L1L1nSmizDIwws8MkDeLgM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8O82gXCB/guorllzZBTQxlWYO2FxXI3zNxygL
 E+kOv+qPayJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafDvNgAKCRDBN2bmhouD
 107tD/9ByQwbryQhQjId9ZVIflCv9C6DcPxp35fudhSH3LeaHCjxILhn/03ELeGrdC0L9JvOFzm
 p5z6UErrmjVoO5lPX8GgxDbjIWoCnK5u8M2G0We3nU+p8qHaxpSg1ZtxUUaViYHUOIYzw1iAQCM
 vTtb8HAnmuFe82mhIPLdRqWecetIrvz3z09FOgnkCCailvrGuHP6R7qBhjfa+WXl6bvlK1Z7LDD
 VxeD4YznRixjR+NHlLNKML0myATbS9noohd8RFPR3CQP0fvi/fglFpKCnb/ZLOYwYoP6smD0iRD
 E0/hSQzVFvZjEQVqpwBHkjoCeFgT2l4UwcCgAEexhqZynKf2Wta/I3t9qlr5ij6FpqKv/HDHOh8
 KgCEVA0UFEvsaij/I56tttmurZDfUQR4Q5pTLdm6/p1DfUBUqqZVHUbb7FTifkOLBYO63V8K+7M
 i3kGmvYLbxDf4eOqSOzJfe08mxSgCFegHR7FNPSalfkvO20PWpox7WDN5A/GL7i4OopUvumHUaO
 nA6xLC1wq4+578hnrNj3UzAbRDa3oEGAwNlHL8PphlRyW3DKQeoNnR0+OK6KZO63zKpmlpyocsl
 htoKDVTcb4g+0CZhkUbsgiH4VL/7Y5yDlIU4dfNYdEO1avXOC/PAQAfxhEJxNH6idg8VesaeWqS
 J5PgD31kPmPf5nw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: nB-Gu7jtZuD8HRUbhxp5kWbK2VN9qg8q
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f0ef3d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8w2PXEvidvIgLFpFqg0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2OSBTYWx0ZWRfX7siY3WhnpqX7
 rh8yQfZ18XviROyGLjzv/YHUpOsdxGVwWM+KxkFxj9ILFEybYBw2wgtXjSRdZZCPax1z12rWR0H
 dpID3meUIuSmhiueedg2pvvaGLGvvbkriGs38uDxl5s7N4JWMOUpBdJ38PBYGKMtP/DZOKS3s9E
 AOUWK/REL2RYepErGQKUODTuYTc6wpFqEu+d8WdNmzr/T5SY3g4wdD3vVyll16EHZoKPPWRQOFK
 MQliNN1pwgpDg4sX3zQnNvTHd2aNCjPcr0COHX53egvHwb9uFDNYf7spWk9/3lEZe5Isg2wOydl
 lYKk86O7Qzm7Aex50S72t8lNcohxN7dMbEy6GaZ+FWE3oanVxV7/njsx9Ilh/IWn2iyBcoNnBSB
 bmy0wAQcNwPR1gXLiGc1S2Pw8btZmYnujsb0AqPHlWI2kXkUG08wK7a2aNXkHxD/aqTAIT5hlIb
 xeWpk/RbuApw8ClDatQ==
X-Proofpoint-ORIG-GUID: nB-Gu7jtZuD8HRUbhxp5kWbK2VN9qg8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_103246_284122_62F35300 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

Similarly to clocks and pinctrl, interconnects should not be a user
visible choice.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      interconnect: qcom: Fix indentation
      interconnect: qcom: Restrict drivers per ARM/ARM64
      interconnect: qcom: Make important drivers default

 arch/arm/configs/qcom_defconfig   |   3 --
 arch/arm64/configs/defconfig      |  31 ------------
 drivers/interconnect/qcom/Kconfig | 103 ++++++++++++++++++++++++++++++++------
 3 files changed, 89 insertions(+), 48 deletions(-)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


