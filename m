Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF99C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k1zeeW+sm2UHrPLKxlf+YojvkVINAlgoHmqpHzklEqQ=; b=XUjPHTpRDIsICC
	P/ofix60B+EhxTUhcS14vo0xE1Ppx6zrt8iWLWkRvew7CXHaGKpqO7GyiCjShqR2QXVSW8m13eAVQ
	Vg1uirZZq0p5nMsjkD0ESG/Z+3Y/xS9k+mHadPlUPbNmeJdWZ26xmFRzs/gy3/vtZxUUjYex0cWKr
	tK/jil9ltqsXKBMoIbimWXC6fswheypMk3uxT+x6adxNt2xi9C3OG+URtksJpWfrEjwVaAuJ0UewH
	w1GmNk8ICgkR1Ev/ADnHsLGc7AoKPLTWnEAnogrEPu0Owkt9/kzEg9bNDHXjFPG3f/JIMCPSsltUP
	oqCZ55eHZ8XjwCf4DyrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvQg-00000005YQK-1Vj9;
	Thu, 06 Aug 2026 10:34:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvQd-00000005YPy-1efV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:34:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nnef2724834
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 10:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k1zeeW+sm2UHrPLKxlf+Yo
	jvkVINAlgoHmqpHzklEqQ=; b=iXny516/ZqOZ9RUZ0oFCftl7d5/mssGxJLLN5M
	muNX3O4ZdmH/Pv47u+Pz6GvmrvOg4fBpAMlZLzpICOZ0Qj+XvdZs5TI/6/rriIBd
	kVAa9dFUvOPjxHcun8UatALcVL0Dr93yhAzmD2OwiZyNIS3hF6Gt7k/Pe6lQ+XOg
	h9YBiRRpTdqKrkizRGhzpnRCMxgGh+INyeOD4NGK3L13SYRMbJCKAWbk4FB88Suj
	NRDFpFcQ+3tgf4BID9QlIXSq+0jtLzCJnNwrUMrh287dNp9OC+WTuHyG1jkyylQc
	3KY3kdo7/BTJHbaXxK7ZKwlfqrOk6czFWJYh8TMiW9K5E1Pw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmkqsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 10:34:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso1101717b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 03:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012462; x=1786617262; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k1zeeW+sm2UHrPLKxlf+YojvkVINAlgoHmqpHzklEqQ=;
        b=QpkcQRXzuimRKgftxLPsWRfJCZLS20vv78p+8Kz/prgtkM3T+ocqZNViE95eQCR5ko
         Zmy/0VQr6LRf+ETM/7M8LnLFfI7hMq9eAn21sMGN8FjAHqUL8h3SEzMrm9QwswvM+1Cw
         fTw3j26KrA8eCC+ZefmYiS2gAxPOLAUPWC9ailPFRiIYMuvNOe+eDufmibySNsmpJBVc
         UZo9YgwuAbpS79pEpR6FzXb/53oU7ARzE4AEKtg50wyK3j+GurDhd3l3M9UFGk6r165R
         LWPzO2T4z4vjpBdzI6T8i7cNjSWF/ZDKVn/te9fNsNgRoUycLwtGmo8iNHTzVIRm1hUu
         k0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012462; x=1786617262;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k1zeeW+sm2UHrPLKxlf+YojvkVINAlgoHmqpHzklEqQ=;
        b=jxbmuwTdQSPRWQctZRTOEa+w97c+6VO8YT0Meqd0XhimNSFTbbulQQEGBI7KDvMmLK
         u0YPhZUJyH9hKIm4AEFjQHNA9RYU5cQa1ZprhPA8CPlfNBaZv2muFDhyyBlp+zDQcsWh
         uPULJWLo3gOmsRmOT5KgRmE0S+wpTfnK5ekaHqpjhrmfkwJMifQhn18lLiL00NJ6pbQo
         QVktlLIaqNJpIDTI14BifhsrRjamXpgGQYTrit9LEYpxwJc7qURihQpfN34qOkhkzdsH
         YQsoCrpimJjwCPngBdvti7VAKidrINHrtAX7IPCUK5tR2DQsuOYQob44QmfZZ7gxPyK1
         w6Ww==
X-Forwarded-Encrypted: i=1; AHgh+RrPg+wx+7nd2ARrJCPvNcfkWUYi/wvMVK8ALeIb2KG7D599ZLgVQ++OOZgfLHrPSwZQOm2rSYJUf2MQt94j3xJz@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg+Q1ng8G2WUq6uPH9K57j8/HjsIEoULLmg24vcx0muf5QznH0
	TVM6c40w2V06lDinvGKHZt2XqhXhH02eq8WD4hAjkxGZHRGHhGZwC17o7MZNMnzNevLmo+/ae9Y
	ZQbjVYvQmmMCkd2o4lLYCsgIAnbTiQ+ycEsl+AhbYa+r4TA5Bu3qgRlX/cIvRG7UFr41jNoKiOe
	3zqA==
X-Gm-Gg: AR+sD10Ew4Uc4Jr35znSDFXhuYTy4rFprYSsCsANOFnwfSHzI18iIU8vdQRr+E2e06m
	6sutt4ybeTtOf8fCLlBdLBCFlRhTIAAUQls5u51K8weg9F/TieNR7lXOj5kvqD/2PYk/cbGJ+KF
	VJ7N7NKvFjH91OVl6MXqoSF7f0WcLUUnFfvFggq8JWALD+aYntPUawFcQGnVAE8d0HyXhulCGzI
	at6TnsdI2/bD8CtczuiP+WOvmb9Bu5H9h0/HolqKeI/g2FLQDhGNK3tjwzpdk8biJLKeXaClIss
	mhPp5ZeBis3MDQA/WrdLf0Q+tafjM37roozKdEuOPjyP93H/ERZeyRf5R4H6pRanXdTLsnS+9Bj
	8izWSrAEBn3JvPtwpTLvBDOy8
X-Received: by 2002:a05:6a00:c312:20b0:84e:46d:23a6 with SMTP id d2e1a72fcca58-84f47ff541cmr2789210b3a.18.1786012461442;
        Thu, 06 Aug 2026 03:34:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:c312:20b0:84e:46d:23a6 with SMTP id d2e1a72fcca58-84f47ff541cmr2789111b3a.18.1786012460894;
        Thu, 06 Aug 2026 03:34:20 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:34:20 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v10 00/10] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Thu, 06 Aug 2026 16:04:05 +0530
Message-Id: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB5jdGoC/3WNwQrCMBBEf6Xs2S1rWlLjyf+QHuI2tQtNo4kWt
 fTfjb0Lw8A8mJkFkoviEhyLBaKbJUmYctjTrgAe7HR1KF0GoEhpOlCNbpSPRe+RGWeDWve27oy
 5KLaQS7foenlti+c250HSI8T3djCbH/07lUVYGdJNo6njik8hpfL+tCMH78ts0K7r+gVjD3C6t
 AAAAA==
X-Change-ID: 20260804-eliza-mm-cc-v9-66fa4d99b2ca
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a74632e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AlRCs60Iy3bsPpSysgEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: NMD7V6p8aVDL-mWIrYl4JAyapXccu6Uw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfXw9eeu6+5gjww
 6834qjUou0SPzNCxCGFs/OnlkNLZqvNgJN2ikLjcAtGTWp/RCZ/9BxSxL8SY3fBGtvLqMmavCDx
 A6v8hz8w53wGL+WLNYHwNqCGZG4utiY=
X-Proofpoint-ORIG-GUID: NMD7V6p8aVDL-mWIrYl4JAyapXccu6Uw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX5IpDbUxfSyNb
 MFpYWGKmEb+EEKD8Q4+VLubt2MK5qlbHG6m2Gvw2SJkXXgXZ42a9yjVqbR12P5JqrZMyQKxMr6a
 kqoGAa85NuKPlAkL+pvT6oYGV9FsmNf9d8py0RLCRM6F9E3piMKKd7oaATzbqPAJjTl6GPfQXOB
 ewmhrVlq6omK7ngI7qfHopjAj5tD5wt3d7ww8O69/QaCN2m2iNT+AddHeMxlPevMl8HiO/+5SZ5
 SsFTGd1y+27uegQf51SKIrDdRsxCkG6ad62yZDDA6Qw/TdGjAOsZxYtyCcbagzg0Shcq9xVFJCW
 NtVlDYS+GUwRFgr3L7pf2WTBoyLPBvXwHumNPGHHgT0unC0ByD1A/6QxsyTwrsWCe/3qNucZUuk
 svAruYBhUsmwHD9eXIQPFWlkbCTcvdx3yeKEY/l2tzQdKyU9EswNyga++HwvFDWeM6yEpkv7iyN
 /9pydEUVA7y3GkcvL/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_033423_446180_7D12A3E4 
X-CRM114-Status: GOOD (  24.03  )
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

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Add explicit power-domain voting for Milos
which are required. Hence extended the Milos camcc & videocc
documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Note on ABI breakage: the Milos camcc and videocc binding patches make
'power-domains' and 'required-opps' required properties for the already
documented qcom,milos-camcc and qcom,milos-videocc compatibles. This is
an ABI break for any Milos devicetree that does not yet specify them.
The corresponding "arm64: dts: qcom: milos: Add power-domains for camcc
and videocc" patch supplies those properties, so the two Milos binding
patches and the Milos dts patch must be picked up together (in the same
tree/merge) to avoid a transient dtbs_check breakage.

Changes in v10:
    - Make '#power-domain-cells' optional for the qcom,eliza-cambistmclkcc
      compatible: the cambist MCLK clock controller is not a power-domain
      provider, so require '#power-domain-cells' for every compatible except
      cambistmclkcc, and drop it from the cambist node in eliza.dtsi.
    - Fix '#power-domain-cells' wording in the Eliza camcc binding commit
      message.
    - Add the RB-by tags from Abel Vesa on the Milos dts and Eliza gpucc
      patches.
    - Link to v9: https://lore.kernel.org/r/20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com

Changes in v9:
    - Rebase the patches on tip of linux-next.
    - Added the RB-by from patchset v8.
    - Link to v8: https://lore.kernel.org/r/20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com

Changes in v8:
    - Remove unnecessary '#include <linux/mod_devicetable.h>' from the
      videocc, gpucc, camcc and cambistmclkcc Eliza drivers.
    - Added the RB-by from patchset v7.
    - Link to v7: https://lore.kernel.org/r/20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com

Changes in v7:
   - Add missing 'power-domains' and 'required-opps' properties to the
     Milos camcc and videocc dt-bindings, and the corresponding device
     tree nodes, since the Eliza bindings extend the Milos ones. [Konrad]
   - Update the camcc, videocc driver to 'use_rpm' flag for Eliza.
   - Add the RB-by tags from patchset v6.
   - Link to v6: https://lore.kernel.org/r/20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com

Changes in v6:
  - Update device tree to latest linux-next.
  - Update commit text for no ABI breakage for VideoCC and CAMCC
    binding [Krzysztof]
  - Added the RB-by from patchset v5.
  - Link to v5: https://lore.kernel.org/r/20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com

Changes in v5:
- Taken care of comments from v3, v4.
- Update milos-videocc and milos-camcc bindings to add '#power-domain-cells'
  as required property in bindings.
- Remove duplicate clock 'gpu_cc_gpu_smmu_vote_clk' from driver and
  bindings.
- Add '#power-domain-cells' for 'camcc' and 'cambistmclkcc' device node.
- Link to v4: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com

Changes in v4:
- Update the clock ordering for camcc and cambistmclkcc in milos.dtsi.
- Link to v3: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com

Changes in v3:
- Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
- Dropped the defconfig patch and included the drivers as m from Kconfig itself.
- Update the header inclusion in the milos.dtsi.
- Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (10):
      dt-bindings: clock: qcom,milos-camcc: Add missing power-domains support
      dt-bindings: clock: qcom,milos-videocc: Add missing power-domains support
      arm64: dts: qcom: milos: Add power-domains for camcc and videocc
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   39 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |   29 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   75 +
 arch/arm64/boot/dts/qcom/milos.dtsi                |   10 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  464 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  606 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 15 files changed, 4734 insertions(+), 4 deletions(-)
---
base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
change-id: 20260804-eliza-mm-cc-v9-66fa4d99b2ca

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


