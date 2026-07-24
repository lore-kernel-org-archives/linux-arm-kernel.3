Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC9CC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 10:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HoPwQn4agX1K+V2yZEc9mdY1aQzQYOy4tsJySau3Wys=; b=d3brwbIoUp9+P7
	lDWkpUBTEQ3DUrFKnytSnmtDmehDoQmTDjalPKnIRJQiTYrlplN0o5EP9cCD4ZfcfnRQvk0JoXc8o
	vozVGFAKqiR9olNlRxEYiPbfLCyYjNxG40gWGnc5O0EjpTdySG4anEecubgo1Wgv4vzVI6dlunVSb
	cA62lsPcT9jzjkcoGj2+zO+844/eUsIAY4TPn8s6znqdSlkGWHFqcmbwwDqApZ/zY7vSJ5fY489rx
	LKOBtrbu2G8fuylMHjsmt9nToZ6b6S7nHB830qKi/T+dzhJ20TpZ3iwzvHFOphwdolPgkGx2J/6K+
	SE9XYTzVLgrbZiwuY0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCxP-0000000G3GD-08vh;
	Fri, 24 Jul 2026 10:16:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCxM-0000000G3Fm-1Pdp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 10:16:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADw7j2916991
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 10:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HoPwQn4agX1K+V2yZEc9md
	Y1aQzQYOy4tsJySau3Wys=; b=JJ5EG17ZKr++nunXL0xch6IdUNkz+XD6cMqayZ
	u12CZKZ3iUnUuP24ojLQDYuz2RvROSFBgnn9yrlIEXx5fmi4q+7YHDqzx3VuO2fH
	jjTJhC7zaU2ev6w/2gJM01Eky1AQJcLVO3cYCGsz2fukEtxLXq46xnP7P3weqZ/p
	rDzf+ntET2cD5HzorgL3zQsRKzoRknySUWdEpqnIOGsobBD1CSi2lIvher1onuEJ
	7DZmH4+xHILQeHHuutIg8u/3OJ2Z1aAt9eofPQXbjMdPwnE83TzMMvsN+nVp2fl5
	yIJplteXi7NghPCvNIdrqmKi0Ab4QB4NJXuChl8rG9iT1LDw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vkph0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 10:16:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so489085a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 03:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784888198; x=1785492998; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HoPwQn4agX1K+V2yZEc9mdY1aQzQYOy4tsJySau3Wys=;
        b=S9i9xquLzMOc0FCrD1dWjahD1FtmI53fT2PikzaCUWZ/eeRY1yKpFjp4Cgxe03dOFE
         CtJBpOo5emEhl9gJPHeZh7NTzCuHPQ/QNE7ySBK3WQ1mcHnbZrbzy3+g9nlBIHtte1ji
         xX3CkmmvrUJ5qwCvFDBB/cXmVbTprxc5vHc9zHREwrQuGrC7v6+k9TpIIGow0SwhlbCb
         FBL4ldocpXcnPbVXRtaFFoAaISxO3la9oo2hrRmIfgU7tzEGeoefxJRN2pLj/sfxMbDJ
         q5UHBa5AaaY4mske7PWhN1Ekz9eepdFK0ak/GymCHjtkMKzlppO2Rkobw27OKQo7dE/H
         iEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888198; x=1785492998;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HoPwQn4agX1K+V2yZEc9mdY1aQzQYOy4tsJySau3Wys=;
        b=cVVGBzaxvNznltQhCqAICZSzPtDguyqWYc0YFARtT0e37jCVqPsYZu2DatUBBpdQm4
         LGs973yEsM74gpoKdY3whjeUyBdMhb49L6jSlb7u33n4FoKB1m99rMNeN3HArG0qaFCA
         1Mcim/JQ0RUzd1a9/oBbI2WMZahEYEP1c1hsGmEw8/bILp3LouZLZsOffGeandBu773J
         0EhdIEyJ+YrAtDfUZSaAXmq0t6U6zDwLAiMpBVJwLI0levWbLkXqrTbd0DcbJSa5ihEq
         Amr8d5Ws9eBstDVPcxrvKEbjoVWmCDouVJIdG4EZiK34eEn4aPdSYDoT1B7+nTCFCaur
         /7RA==
X-Forwarded-Encrypted: i=1; AHgh+RogU9EgscCx3GvYzcQmTRmd2cDkqYm3z8252rlkk+2ScrzAadkgr49GbjpW4TaiUi4WWiJzSjFdqPHkGz4TGdzn@lists.infradead.org
X-Gm-Message-State: AOJu0YzBdUH/ltNevPeaC76GSZfGOQKax0HyC8khTtTj19DFIh7/f2OH
	iOWX+yVbouEpMUw3ZeQuX9w/YRajVbQVSebUuZDV1Qi0r4L+UQvZdOTB22KB4jzAFhHVDTAEJIg
	1OfyuhHzqT/UMjlVKTom+WODartDkIcb3s0wOtnn/2wtFg3yL05pdT/WyIepHZTNPPQLzLQn/1u
	3XK4bpPo026TFo
X-Gm-Gg: AR+sD12hMCl3Dk8w3huNaPfMS2Yiy9dCB1M+hC7KSSjA82/eNzG36+2PXwU8wa6GLcO
	bMV/gVy7uR80PyxovKZvzBy4qlytmOq5yrkG3lhIMm3SyEzs3XrlXvGGwbGCHpvei2jsBk2JnMl
	geUEP2dDx5bH6lSd3klunkVNNENlqrOA8UzYnFj64PWFsorqJeuXFiCz7ykVBhZ9jD95jAQyG3f
	qilYXa1YcSyt3Vee46LrmCdYwb0hObzLsT8K84W7Nj2cvZKovnSGvY3rYwcXSvIdtNlNPAfJoSr
	SRyJ6OIzvZZtgIB3IP8kdOIRKwDmap9oH4upR1dXtpi5+zMcBxtSy7HDWXDsZZ8ptVHU4S8ZCB+
	AJvSRq3TwAJD+B+24/kuvmAOecsgxObjGEYnlb1AgvzwEWK7t8hBKW2RrVg0m/xw=
X-Received: by 2002:a17:90b:1643:b0:37e:9e9:6ffc with SMTP id 98e67ed59e1d1-38ec65f99a9mr7285557a91.25.1784888198292;
        Fri, 24 Jul 2026 03:16:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1643:b0:37e:9e9:6ffc with SMTP id 98e67ed59e1d1-38ec65f99a9mr7285535a91.25.1784888197843;
        Fri, 24 Jul 2026 03:16:37 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041b8be9sm1222644a91.14.2026.07.24.03.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:16:37 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v6 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Fri, 24 Jul 2026 18:16:10 +0800
Message-Id: <20260724-add-coresight-nodes-for-shikra-v6-0-8b0d7300be41@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGs7Y2oC/5XNQQ6CMBCF4auQrh1CS1vElfcwLgptoVGodrDRE
 O5uIXFnYtxM8s/iezNBE5xBcshmEkx06PyYQu4y0vZq7Aw4nZqwgsmiYgyU1tD6YNB1/QSj1wb
 B+gDYu0tQIGyzV7wRRakpScgtGOue28DpnLp3OPnw2vYiXb8fuvxFRwoF1DWTVNjaKCqOHjG/P
 9S19cOQp0PWhSj+U0VSrRa85ryiTSm/qMuyvAGetjKNKQEAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784888190; l=2199;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Gg8pfgywlxcYei9Mii0RUAam6HrLjjKXJC5mA4x+mz8=;
 b=KRgxAwGuIly4wPMcYYlQNGuDPI6GXfW4aHESaqI5LGQFuUfi4fUs/EdEEPR2q7SIoUI/ZBBa8
 EmfioEZXA4JCKEnLOYZR9wMTzf/3MqP2NZP3WK2thmZ1DEoUKWcS7P7
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfXwYwxSrHqWTjl
 BkzCJZOgCiZ+K+o5Tj1cWXMyB2iO1c4a7hvpiYr161VgTQ5bRU8kCyp+8MLQOwpFT5h1UD0H5Uk
 q+xo+VCV4wNqQOejsuxnMjzN6JJ0P9k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX+msKryhM6nTQ
 is5ts3r8Fs3k3mPthVoSXzHplv9/Q48PHE3Tedq2PHsk+e61gn6pDtdMfikHuZ6tfq0/y5CAhTt
 PNayNhl+pneLfpMmEtqgKnSJtVgVIRaEJzoCdQg7sEFl5Dx0wXCiFx7MxZ0srAtKSV2W7S4I1e/
 i9TYVuCAE4rX92Sscx5FNZCV8NL2OvBM3OTmB6NdEXMAbzw4Z29Mq5KilHoVokZP1S/waQTJbJS
 8NFL1Aohh1QhUJo0dx4jEEnXhoy9fF1Y6kJsK9R1c9NsbfQBpM8QXw4WkavkSrvFyBqcNYi0mPF
 6ugYhACgU9RWnv48L/3gxdDTyK0UzlK5euSoBGgUrY2QkuQVqbZoluzrvoG6WHGc3HO3vqpQodt
 NQ39tK5ksSMgPIloGP6+HqdV5TBRaNsjE0aR9vDDKgjaixplzzX37TMlOnfLlgBl+ErFjA3aMOA
 FRS6FoLCFuVEUEU6wxw==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a633b87 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EMqZLdzleE2vVFLpZJUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: mRRIYP5wVP0Y274XomkCRBjKcuncWBP6
X-Proofpoint-ORIG-GUID: mRRIYP5wVP0Y274XomkCRBjKcuncWBP6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_031640_500791_C030AF01 
X-CRM114-Status: GOOD (  14.53  )
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

This series adds the CoreSight debug and trace subsystem for the
Qualcomm Shikra SoC.

The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
Trace Control Unit). The CTCU on Shikra shares the same configuration as
the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
"qcom,sa8775p-ctcu" compatible.

The second patch adds the DT nodes describing the CoreSight topology on
Shikra, including the funnels, replicators, TMC sinks (ETR/ETF), STM,
per-core ETMs, CTIs, and the TPDM/TPDA trace collection blocks, along
with the CTCU and the dummy source/sink endpoints that model external
trace sources and the EUD sink.

---
Changes in v6:
- rename the modem-etm0 node to etm0-modem, group with other ETM
  devices.
- collect SOB from Krzysztof and Konrad.
- Link to v5: https://lore.kernel.org/r/20260723-add-coresight-nodes-for-shikra-v5-0-fd5494471b36@oss.qualcomm.com

Changes in v5:
- fix the incorrect version number: v1->v5
- Link to v4: https://lore.kernel.org/all/20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com/

Changes in v4:
- fix the wrong subject for the dt-binding patch
- Link to v3: https://lore.kernel.org/all/20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com/

Changes in v3:
- add correct subsystem prefix in dt-binding subject.
- Link to v2: https://lore.kernel.org/r/20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com

Changes in v2:
- remove MMIO for the ETM devices.
- Link to v1: https://lore.kernel.org/r/20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (2):
      dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
      arm64: dts: qcom: shikra: Add coresight nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1295 ++++++++++++++++++++
 2 files changed, 1296 insertions(+)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260722-add-coresight-nodes-for-shikra-5fb8a4b503d1

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


