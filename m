Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ECEC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 18:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CH95xQAqSCeyDTf7jFn+5AMbqHYnxLYxquumYsB1TvQ=; b=QupwlgNjcv6rfq
	TV/h4EpDUp1RxIq+haurnSp4QZTtCOyfSKuhQIQ7Kli3DEXoBEyDo/Yh5upHkEUnkZARtBM6AjPw+
	Ww4wEpawsoGbEkz+Rzxi51CWIZdrT90t+G1FsZkeOghezhHm9LgyEip16ikJ1Q71e2F1x4PB+XLQB
	27YidiM0JQRmS38c1Fl7FMACS2k09Zc0LaKDDxQ/o+xPfcIlsxpkPpCqfEPiz5FzKcx8mcZDQ4soI
	9TyFuAC8C9d5VIV+ntXkFJ1+bKsUpODDk32ue+VGBgETE2Pa6ci/ba4q3nExC7OsO5NtRAWkyqvj0
	0FCwzWIPMNUdyB48dVkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8NR2-00000000Ue5-1im3;
	Fri, 25 Apr 2025 18:06:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8N8q-00000000RZ9-0lmO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 17:47:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJw8W011507
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CH95xQAqSCeyDTf7jFn+5A
	MbqHYnxLYxquumYsB1TvQ=; b=jGgkr6G9WmX/yF0wtGLJ3mEgidTrPdQ5DpaxaQ
	dZ5Qcr5t82EJgzKt9s60gJ9aUi8t2Klvopg8HNuCZteUKGWUb4ONh5ky1AlaGi0t
	SLwE1TgcghzPO0XZY5aW6+UbwhS+6/CbvhmD0bRH9onROAAxtpxywgrzrhzjiWcI
	yVoI9kmWYXBtwoD3aCjQE9NWoEHNiQgPj1ZbZxwymOo8TfFvK7KUDXCVpXxaiNeh
	ctRkHIzavqAmae6vTZUwszcxqL+dEOJN1lU3e3B+aW4ThREKy0PvInbZRKgi/Rdt
	H1aY1PdWKLrYfH9hFNf2Z/Xc4Zjp2It6zo6egvPPUyDcbmww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3stek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54e9f6e00so577152185a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603229; x=1746208029;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CH95xQAqSCeyDTf7jFn+5AMbqHYnxLYxquumYsB1TvQ=;
        b=sZIioqRDdHTzNV4qb3M9JPZ+4OLUyhojPRxU2ei3J97ljzYb/PoRDpC4u45NqrENBn
         s9pQJVn4oEyFWEks17dCvcriMF0NjfZ9LIA3QDMzxSRFEBF5VB7orTWhsdNxPYWsQmNu
         G7wbfyvve6dSK8NEG6+gHvPiTK2M6jrOBdMCNJV5gUGsXp4fPuqEp33RwAVbRd/R4LFk
         MdtFS12HS+LMLUA+CPIo/rBGQD4kh6rtDAuQW6SkpkMhS/97ZFFycosheHPxgmN7b3fo
         dRQKbXRTDYu9F16lW7eGX2f9oaL2ldEN40mfVB5J/iv/ICyV0H9LA2xXtsfGf4wJ4la6
         0acg==
X-Forwarded-Encrypted: i=1; AJvYcCVqlctMOYd1kfAkIQCZIGqSG6VIEnvOf7eu+U1KiPM9OkIvOYPGQnoIB7jfR9nE/1wIc9VMgUTAHu/Go0nq36hh@lists.infradead.org
X-Gm-Message-State: AOJu0YxkGYX8yTT3qpkIQBUDV5gWwK5bL78YqM023TV8GnvvycKKOBXd
	6ErvIIVsqX7u17WS4YmCJ2A3WrbOR1slF2X7xWV0OiWz0GLtFs2IN+KQ44Qtl7cgNM/9Ihm08ui
	PUZzGoj7J73+6eWhRIXA5VnK+Oye9LOkp4m16NQDlzCK0JZGzEQbK58c7O6wpfV+pCcnb6viwbg
	==
X-Gm-Gg: ASbGnctiijv8NDYZBCwklIrV0R5bzaOtMBr7t3FjNA2GEd8do2BvlUsrIPvGE4Or5WH
	vIvv2H+UafIH52Wa+v3y+WaUHsFPbDIow2b4LUqTRENeqwFktHY29IY7uJFW7vCSBSkL31nCfm3
	i6hoQO5wljMA0siZ5bRRC0ct4hiG4Jy44LHnPJ8AlHQT+2Ni84PgUKIt4ZkRFDPa5dCU5gfrzeN
	ox8G5N3dtrxc01j1XTWcz6QqgTHj1VVRXRMi311+wMlznbF6dfrTV5T+kMHI9RNR2/AJtWdlQfr
	ACreOJszi/PiF2HnxnCuusJTe6OsCw1Nuq/Yko+3KsfFHxaBoAm29BX2VVV7sHafpHiQJI1OQHm
	wniazrbPbUb50ZxKKQ23F8G8s
X-Received: by 2002:a05:620a:1793:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7c95863f91bmr1072971385a.23.1745603229110;
        Fri, 25 Apr 2025 10:47:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVoKASQtAFdaM3BZ5YWILcNcxkR0JbHKgAzwDJdCK8quRqLkR7yRgn8/w/k+RPF1+LxPzr7g==
X-Received: by 2002:a05:620a:1793:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7c95863f91bmr1072968185a.23.1745603228787;
        Fri, 25 Apr 2025 10:47:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/11] ARM: qcom: fix APQ8064 schema warnings
Date: Fri, 25 Apr 2025 20:47:00 +0300
Message-Id: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJTKC2gC/23MwQ6DIAyA4VcxnFcDKKI77T2WHRDqJJmywSQux
 ncfetoSL03+Nv0WEtBbDOScLcRjtMG6MUVxyoju1XhHsCY14ZQLWjAJnZ1hxHkKUIIxtMOi1aq
 pJUkfT4/pvGvXW+rehrfznx2PbNseO5EBhUoILThyZRp5cSHkr0k9tBuGPA2ycZH/EvU/wRPRa
 jSGlbSSDT0g1nX9Ag1LQnbwAAAA
X-Change-ID: 20250317-fix-nexus-4-dd0fe3bca987
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2452;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T3PpYspLOO+gT+LsL4Ms6+Mv85P8reL4+qw0w1irQnk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qZb/QjJ4A38LuGB9rUu7bpDvQn1Ad99K3Wx
 ElrSdzYSK+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmQAKCRCLPIo+Aiko
 1aR0CACKoI3FN28qpYlVRdoR4wC+aqqa7liobPj4ayZWItPIjXlpB3kbPyA5rJaenggn0EgxqQd
 NDu+6h8UL8Lv5fvW3OGDDOzDSJuW1eQ57fRu0PPiXnufRvLQ3gkUbj/cED4q9YCHZGoaMHiWasa
 7fYWspPdqZGeAA9ZfbtUguz6Nj60BMc8Rx6L3sHPOzYfA2T9DbMvdOPm+fgzZ1mvbqqMmXD2iAz
 kKMv7l9Pvrdpo0mtqBjEpZH1rqO8wCK/I28oPmUiJL7AeiS/KnyDUMuu6DjYUIQBvH1XTYUqWRi
 HQcQVG77P6tkpznGkl5PPSxsncUSeRgXoXIi3dfsdDLyQaA8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: uI4IFE6oii3QpG2J3MRLB0pOanrJKJWN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfX0zhJ0s0QoiOa GkUT93o5QVQ0MxX2AhattM7AR6OziT/f/zj1ORMUUgVITIyLVaaKbzdja+JJwXOaI5vVUgTUQLP pyHF/sdHcFG6FP5/PyX44tU3ViMWHrm6OSGoPSuDfbI6u2t5id1WmOWwv6cbqJuwHJq0swHJihX
 8ZDoEQX/kdvcycAOp+mgP4dZ0Ei98y+QGC/w4+8lYW9lKZV+O0H7OeMXjBW+wgyxr3KsejcVhwd uobpCMrMzbCVHQ9rqXYJd9Mg2eXeuK2x7W6PAAqwnCqLYBhz7uh8fivgh4+gD2bWFxQs9VQzka4 AHYRIC4dwSgaujP7CHGzlH0d6O8q7xdJ0DDGS3DOz4M08LlpGZaLFcweF2F3LqZjRSfwFIM2WlY
 O6vR26CqPKE5zyABqNcXscadTT/mfjwwrTRNPpasSpZi0se98qjVD3u+kiVkvZVot2p35e6R
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680bca9d cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rWM0Ewedwwy8-PIQtLIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: uI4IFE6oii3QpG2J3MRLB0pOanrJKJWN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_104712_367083_BF98966B 
X-CRM114-Status: GOOD (  13.80  )
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

Rob's bot has reported [1] several warnings for Nexus 4 submisson,
however none of those warnings are specific to that device. Fix all
those warnings for all APQ8064 platforms by extending existing schemas,
adding missing schemas and making APQ8064 DT follow all the schema
files.

[1]: https://lore.kernel.org/linux-arm-msm/174221818190.3957236.3364090534153729086.robh@kernel.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Rebase on top of linux-next, fixing mis-squashed MFD commits.
- Link to v2: https://lore.kernel.org/r/20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com

Changes in v2:
- Corrected Fixes tag for the clock-controller patch to point to the
  commit which introduced qcom,rpmcc schema for APQ8064 (Krzysztof)
- Switched to syscon.yaml (Krzysztof)
- Reordered ports in the static replicator node (Konrad)
- Fixed hwmutex node address (Konrad)
- Fixed clocks in arm,coresight-static-replicator.yaml (Rob)
- Documented clocks /clock-names in qcom,rpm node (Rob)
- Link to v1: https://lore.kernel.org/r/20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com

---
Dmitry Baryshkov (11):
      Revert "dt-bindings: mfd: syscon: Add qcom,apq8064-mmss-sfpb"
      dt-bindings: mfd: syscon: add qcom,apq8064-mmss-sfpb
      dt-bindings: mfd: syscon: add qcom,apq8064-sps-sic
      dt-bindings: soc: qcom,rpm: add missing clock-controller node
      dt-bindings: soc: qcom: qcom,rpm: add missing clock/-names properties
      dt-bindings: arm: arm,coresight-static-replicator: add optional clocks
      ARM: dts: qcom: apq8064: add missing clocks to the timer node
      ARM: dts: qcom: apq8064 merge hw splinlock into corresponding syscon device
      ARM: dts: qcom: apq8064: use new compatible for SFPB device
      ARM: dts: qcom: apq8064: use new compatible for SPS SIC device
      ARM: dts: qcom: apq8064: move replicator out of soc node

 .../arm/arm,coresight-static-replicator.yaml       | 13 ++++
 Documentation/devicetree/bindings/mfd/syscon.yaml  |  2 +
 .../devicetree/bindings/soc/qcom/qcom,rpm.yaml     | 15 ++++
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           | 88 +++++++++++-----------
 4 files changed, 73 insertions(+), 45 deletions(-)
---
base-commit: 6ac908f24cd7ddae52c496bbc888e97ee7b033ac
change-id: 20250317-fix-nexus-4-dd0fe3bca987

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


