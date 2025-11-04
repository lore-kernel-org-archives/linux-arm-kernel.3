Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FC2CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YlVpMTLZCIJT4QZ2eLCmWGpdnEz2lSRzRDI0TPUkxuI=; b=P+6rJSVk4pjQww
	2uorS+ZQjdcoUn+mR1JPiqQvIh7NzMnYHipWi5MZr+/87QUGnJXMqj4sqB84GxisgCQbYczF9jNxO
	9uP/gTKys+HY8cAfvB8Cd/uwlNbUAN3icLYwN88pWB/kW011BSs5KsZtRpDHSyQLjA6VcDYei9zaH
	kHZGuW9m7HCm9dwpQ91V8krFQhtXZrkSjYbVMaeYu1PZHB9K8OScrV7fgC9siQM1sLwcVsBTqcetC
	AA3EH2cV8PSiDcNrcNCBE3MTj/WV1D1OhxJfvJ7bii7EsdMDnIPoW1fAo5cBnTSazJLfTmFuDm9gX
	FH2evNI+4bPeaHG8oIZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGC8C-0000000BOFf-2fkE;
	Tue, 04 Nov 2025 08:11:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGC87-0000000BOF8-1LoK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 08:11:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43P5lW905179
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Nov 2025 08:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YlVpMTLZCIJT4QZ2eLCmWG
	pdnEz2lSRzRDI0TPUkxuI=; b=Ho83yw9oCl1hD8u3xtMx5DwtazU0uqEu+SLSlw
	lTE/aJ10NB/2k1mzV1jf1PjaSBZzLj4XVlRcB9geqDxWQIeikG+ke4hKamNwk+NO
	80ju+JhQ5hqQ7s6++wNlCkq6IQuUv1lGH2AS8vcwQfp9n+wEXHbx1mKomQnRAud+
	J/u3HC5VxhSYJRXDoQyUySp1gQfpVogJzMCqG7aHTqhKCGvHLbcJ9hH883Hs8w6Z
	pQCTf1qMluKDNnLcJid4C5xMOduKIeBhuC0ofcjLKC8zQ33DRX1ZOylHXezCaDhf
	mNFPGOG1Vm9LXrkGnipkOv45LhnrloreQ10zoARfzs71AdTg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a79jjrq25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 08:11:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2955555f73dso24132235ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 00:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762243861; x=1762848661; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YlVpMTLZCIJT4QZ2eLCmWGpdnEz2lSRzRDI0TPUkxuI=;
        b=UmVzAL4ogwAirXeITcieB7mL8WQ+piZXy29ae4LikL8vO9H4TwG2QoBK/n7GZd1Bs3
         wVYAleSCR9KHujLcwepQ97LK6P6W0Ab4tWruIV0Kyq/THzT/rkdee3keYyIb0T8CV1tG
         tvJeA+nhKOZjL9k2R8L4BEfrVaT+GFwWOkeaP2Ff+p28oJ/57ggo42YdQ4HKM0eZt02U
         6AraLmex4kIpR3Tr96PEddsPqebxs4k6OdSeFtE4kyeC+rr/s/tdmeiRVec+k80gjuKS
         M6CjKCTWFdtZxO7Fzlmy0Z/aPacV3SGxqRYF06oyQmxzs634AEyG0zqeGyT1rUppE5Xu
         Tx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762243861; x=1762848661;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YlVpMTLZCIJT4QZ2eLCmWGpdnEz2lSRzRDI0TPUkxuI=;
        b=KRXAUsr8b4GfEFOrK6iQ+MKXtjj/bxJYxTWLYgN5Swke2LKjQzYkJV0pqIe/wOgglS
         IjfvWY1MigNwA53AUHnSsRz79ru9GxwvNRnFpnJpu//1GzZfo0VNzblNkoZC62HTfqet
         a9o4irZfkLNtkyRgPD8Q8C9RnIQA+PUIqrz3Ildr581G+8iKHsfqZYUa4NE1f679ZrGp
         CYlMLffHJ1AdxMgRRs8kinjGRINU04RwYA5RibuFbrBFiYGm8qpNo+P3zmGZDghnwyWI
         9Fcx9vU0mFToR2H104VJdGUYgIEz1xIlNZ9o96qjHG6WkenJzHyH7penVGowMKE/+ii/
         S4ng==
X-Forwarded-Encrypted: i=1; AJvYcCXIACEQOPb4ZA50uVz0Hzb63uS4nfNFVEklL+V8wpp7L+EeXYkkq/3awalRT2ey0lSbv6x4HijDhsZUbLDk0tWn@lists.infradead.org
X-Gm-Message-State: AOJu0YyRJ1M3rRDj0W+bz8h/eMZn50OcSnrtyYPR+vEj+sqU1BxeTLzc
	PX3G7h/CbA/ndcBrG9s6rMqGBIMzoO/BhemE/q9ty/Wx7ZWzftks1mCTggWABX9QCOC5q3IBNRg
	J+3KyFCPvzt6rDFnF3JyXf5bIyZ7NuhQQk+ZbpAw04ci0N2kRl2jVJWzKiUb8SOAdqd+61FDG8q
	c0hQ==
X-Gm-Gg: ASbGncvMx5YWojyRx74MpQRUaAGtqDVgdNU369FGRD115xK88O+MYR0glpe4MVrtGi0
	MniNem62HcrTsi0HLnZIUna1CKRofkiMF27guAOKhCiCyQGoFG6osTjX7ZCYzDt223hVzk5SaKl
	VDIL65Tq46Lf66u5+BsSYX/8ul6yKsXupyrb6WRQrBnnAUjJbeAXeAxtFiWWYUiumNCebva2lS+
	zUc4Iq9PHqwzgG2chGK/oRSA47hBeLcmUP66fa+Hhj4DA2Rh0j3nP2x89dfei9xCdTjtqVTq6q7
	kIuTkKTuWUWfJ7PHxQ7tO/aHi71Pvd9KZeUEsU0E2m9o/Zq54/YGa27XgV/MZEuV13SwrO6un0P
	xc14lIkQHmz5/2nqSEfp7n/uJqo6jT6aXlJMK8CAOMFkPvPhT3uFpn2ZW1t/O/g==
X-Received: by 2002:a17:902:c409:b0:24b:1625:5fa5 with SMTP id d9443c01a7336-2951a3a63a8mr243445775ad.11.1762243860842;
        Tue, 04 Nov 2025 00:11:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVDe/NA67RNDYoNV6Fh/VpwhJBC1Qs5jI1D9PjxLgSztMXaR8aWzZLebyst8NkIBj3iMctIA==
X-Received: by 2002:a17:902:c409:b0:24b:1625:5fa5 with SMTP id d9443c01a7336-2951a3a63a8mr243445365ad.11.1762243860275;
        Tue, 04 Nov 2025 00:11:00 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a7afe3sm16755885ad.110.2025.11.04.00.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 00:10:59 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable ETR and CTCU device for hamoa
Date: Tue, 04 Nov 2025 16:10:16 +0800
Message-Id: <20251104-enable-etr-and-ctcu-for-hamoa-v1-0-af552cfb902c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOm0CWkC/x3MQQrCMBAF0KuUWTvQtAlYryIuxuTXDmgikypC6
 d0bXL7N26jCFJUu3UaGr1YtucGdOoqL5AdYUzMN/RCc6z0jy/0JxmosOXFc44fnYrzIqwiHFP0
 UJvjxDGrH2zDr7/9fb/t+ANTUJKxvAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762243854; l=845;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=hY8QGaaBRDrmil3lFdEE6/N7Jlz3Z1TcLtB6hu4+oNA=;
 b=F66Kby4OhsustC4D0QuoPkkC+iYUFKXQWqpvtHRuOU4XCeJS6LUgIAdOxn0HgFDxNvJPvK8nV
 qGc21kxe/kSCXT9vioMLZDhrIhez2X1ByoVb7qMZFZ9uy6GWNqxD597
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: qdxkUwHrp0zxnghff89hI5XYYLc3ZtWx
X-Proofpoint-ORIG-GUID: qdxkUwHrp0zxnghff89hI5XYYLc3ZtWx
X-Authority-Analysis: v=2.4 cv=TuPrRTXh c=1 sm=1 tr=0 ts=6909b515 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=EinoZS_c4zY4h5tRugQA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2NiBTYWx0ZWRfX03Um8UnZNFxx
 8bbeBDIrUfMDodWcUfSQpHZFkuWn3SbqHGFxnPNL84yppQWvFVA1gmrkKAV2b/iwG7Mgi7NCFgl
 4hIVQ9UABshamO/xLcpYghG9yHlMnYyG+qupg9Rs9hcLonJVmpuN9cLnz/WW3xIhB7akzJhw7I7
 sUWjmUiyeGqNynepzS7oabLH326FHl8zyH6EGg5XK0ujBX6+1q6nbACY0zm7b/9W7L/Ger1ZVqF
 oOahwqwWlFCmvmcGZw1SdMdj3kpj48FMcyOU9O3DcWiH9AE6ycPLn+1TWUE0GNbV5scgfUwLzb9
 WIx0zASZC5uJ6CV8LCtvtGQ9BXBpwBLh6OwWvDpz/vZ8/3eEc7MQVrXEmabWhGaZHiM8adCKx4f
 raKJ6sPo9om5VuMslusc3adBO4+K4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_001103_534101_DB0DC129 
X-CRM114-Status: GOOD (  12.21  )
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

Enable support for ETR and CTCU devices on the Hamoa platform. The
newly added CTCU compatible will fallback to qcom,sa8775p-ctcu for device
probing.

Dependency of the binding path:
https://lore.kernel.org/all/20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (2):
      dt-binding: arm: add CTCU device for hamoa
      arm64: dts: qcom: hamoa: enable ETR and CTCU devices

 .../bindings/arm/qcom,coresight-ctcu.yaml          |   1 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 ++++++++++++++++++++-
 2 files changed, 160 insertions(+), 1 deletion(-)
---
base-commit: 23ece2b586cd740840b5b9359a767477435e94d0
change-id: 20251104-enable-etr-and-ctcu-for-hamoa-5dc4959e438e

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


