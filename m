Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099EDCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 21:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jcKarMudV2b8SNd6x7MSB0qXu7fuZnu4rJtxAKfBKPw=; b=pY427jAlu6tNsKnCcjUjjo8uYh
	8C+9FOXd3SNruOWDpNcCLOEaA8D3XmUk/ByKmzULHh89xMvoDhSuwakEb8QxkFThPQui7DnQU71gS
	7c+jwVKoIaYs1KcpifJi05YNqhkLUY/l0oNi1E6g8iROcPRS+Qe/2qMxPL77/PRhZr9+9QloRO47S
	KNgERO/6UjgtKNF9dGT5ao23vSn9xfYnyKjhWPHc7AhXxBkYhbjTivcsTT21b+uGipVZRmQRMljh4
	xSX2Fjm3I60Idgp8tV6lFu6SdUbBfc6SbjhWk6zqohrvAB6+czf3ksHnJVlPJI90fnGfYYax8FfQm
	47Vr9PJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZc2-00000003YJl-0Kdi;
	Fri, 22 Aug 2025 21:47:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upP2H-00000002Cgw-22rs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 10:30:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UH9P027201
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 10:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jcKarMudV2b8SNd6x7MSB0qXu7fuZnu4rJt
	xAKfBKPw=; b=VBVbF8fk6V/fMyntvbNNukuLIy+Bx/cQ7Mra2V6vyoOmt+vI9G5
	3lFSfcKZRVFbsEy9dZtXRMxXAWQ7VkHh+yHwBoAxf/gPRg3+5DPyam/3eA1L3EsU
	LltoADFv24tuj5aaKHGkarqvHoqeQqzTUpugsPVz+X/ctxJLb5MJWDwmLhThWl0c
	hmkwe9bgakFbTxdYe18l8SuhOp+eZDfHob2nfWisBbDVmyCbTwxch7JDIFuly3er
	WVArVyy9qa4SWXfpHeB687/FrusdRkkTx0m8caIhxOR/dTh9xNS9OyNvBvX3TVr1
	4M/5dlp1XUf2HBEtmaGDcDNDYvzOO1qF1dw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5298vux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 10:30:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2e8e28e1so4916253b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 03:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755858615; x=1756463415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcKarMudV2b8SNd6x7MSB0qXu7fuZnu4rJtxAKfBKPw=;
        b=CwDG8wINtBJasFCBebzloAKyVO7Xp14TZ9IXrZ2mpsSZ3EFtcq9Z33mMM3kJr/nvHB
         MFc3kbZrOJJhLbP8DwTs2rY1MvZhZXIhBzj6rxBe4Nzo+dybkYPqwu3Tn47y5yQfTj7H
         hzVniw+S65VnZFqdwvKG3ps4s1w65cFO/Lj7JyfDR17TaVCKIyLAY5cMYIIxAuI6AioN
         ryBAmJlVmPG0UFRfZ2HJzfq/Bdjgrozd+2paxiDqidiS7yR0QaTqBnQfJ6Q90wtim10n
         3gt+dzelWhO3QLLUBsgx5vxrUJJXOh8HsCGm1D0x+2JBdtAJRaGnFDMmZ13kZEUkLimw
         AghQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFsFarncXtRbLGYhBO/SPUhl/UUBNurA2nZVwLEjoVxx9QOa294YYW4On/rSeupid+DUi/9X6NfOTG1UuUqc+s@lists.infradead.org
X-Gm-Message-State: AOJu0YwihyXwxejxhFDFKGYLbJEOog+53lp52cZwwQgh0iP6PibkKnFh
	8HDTvbAlEc/4LHTfGuyrnHUj6VZlsVYUM9vpl+5n1byAg3dIdvRD5Lav7FWK0F2O/47UrY+kF1Q
	1ecrrpBZ4rcqUbn6tfCjqiUs52pEzbxnHFMHmtJOtc9Rm7qtBhCHSH4l/ajvEhunnM2Gw8sDfCT
	2KMdGOJwmdUxrd
X-Gm-Gg: ASbGncuzOmd/N9i4cXSveRQJLDWgVQrUyYlS89Yz4tDwJ0DcVWv4AQlbilKZMHeg6N5
	fv6c3RT/RIETRV+jJKI1nlb08ifDj80z5Y2et11Mus0Jo15MhNlCLBzAttkrfww0nCvlSebMMGF
	BrNFayhy6GFysbJzatqXbWOnjs0uzPrA2YmRRD1r+8dS32MJJ/7cRaBiyQ0Z8BwZbL5F+BsH90g
	zN3+U6Iapyy5n3VKFJVa+cPFfM+FRS2JB9dL1iV//LPKF6WQ+NhIFFOXJvKPbvFywEnirOXYNKW
	aTIelpzrUcTnR8zjAi9BaucOOL8sx1rBWZg0DZBwGYneXCnmsbMjNJ+sZKh9POCBsvHlL4rgrh7
	CWuyvHMEgBpSzMKzvnQMi
X-Received: by 2002:a05:6a20:1584:b0:240:cd6:a91e with SMTP id adf61e73a8af0-24340b0ed25mr3975348637.20.1755858615165;
        Fri, 22 Aug 2025 03:30:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM6/4eD2DcoKaSA3nCo67Yg9ZTNA0p3eVi79EitYPShFXo+QxmspWgagHgSI57FCVpNE+xeg==
X-Received: by 2002:a05:6a20:1584:b0:240:cd6:a91e with SMTP id adf61e73a8af0-24340b0ed25mr3975306637.20.1755858614674;
        Fri, 22 Aug 2025 03:30:14 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fec0e9sm6825196a12.24.2025.08.22.03.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:30:14 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlmao.mao@oss.qualcomm.com>,
        Tao Zhang <quic_taozha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] coresight: add static TPDM support
Date: Fri, 22 Aug 2025 18:30:05 +0800
Message-Id: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a846b8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=miiTG7pHY3C1tMSzQ7sA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: u-cJGgnydkh6Oo0HsjwSvkHgbpzGDkow
X-Proofpoint-GUID: u-cJGgnydkh6Oo0HsjwSvkHgbpzGDkow
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2a2h9cuoyJWB
 KXhSIO1ydBCgiPWSCe79vrhhiunOXjLS8F73eYSsD76MX9YfP+fkgvUYFUytS4AodLp+hZTaMN1
 WCPzRS8ymCTWe30LKMbf5raqPCMmDAMpqX/2kNpJAFmLsn4lnQru+cic8USyqoomMgGtllW3KyE
 arUYCE4BK4fObWshoSYxTeY/BhDe0BJFghymlDe6crUYF8nRKpoVI7qaggSInIFaA4nF4PrFiEi
 7PSJs7qghn4/TswEJ2vo/K+MF/NiUpBtfQaM/6xN5q0cVE9ChtDFA8lgq/Fw/A5fIJGW3erR8fJ
 0go/jViU8vES5mEaV6wdItan+OIhgU5ZJE1/2+knOYmCSVogKNjITiKjKLuGElvNLSWZ9zBzCkt
 avuU6kxpO5RLsZQYXmQXNl+pgBNEwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_033017_537027_6BA23A5B 
X-CRM114-Status: GOOD (  13.47  )
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

The static TPDM function as a dummy source, however, it is essential
to enable the port connected to the TPDA and configure the element size.
Without this, the TPDA cannot correctly receive trace data from the
static TPDM. Since the static TPDM does not require MMIO mapping to
access its registers, a clock controller is not mandatory for its
operation.

Meanwhile, a function has been introduced to determine whether the
current csdev is a static TPDM. This check enables the TPDA device
to correctly read the element size and activate its port accordingly.
Otherwise the TPDA cannot receive the trace data from the TPDM device.

Dependency:
https://lore.kernel.org/all/20250806080931.14322-1-jie.gan@oss.qualcomm.com/

Jie Gan (3):
  dt-bindings: arm: document the static TPDM compatible
  coresight: tpdm: add static tpdm support
  arm64: dts: qcom: lemans: enable static TPDM

 .../bindings/arm/qcom,coresight-tpdm.yaml     |  23 ++-
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 105 +++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.c  |   9 ++
 drivers/hwtracing/coresight/coresight-tpdm.c  | 148 ++++++++++++++----
 drivers/hwtracing/coresight/coresight-tpdm.h  |   8 +
 5 files changed, 256 insertions(+), 37 deletions(-)

-- 
2.34.1


