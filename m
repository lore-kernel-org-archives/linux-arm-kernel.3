Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0573E8B38A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 02:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bc3EyfkdPUkMHzZwZH/NnAI4VdVDvHXvneEpxKHuMBM=; b=IQGNV6lAWzdNlm
	sL2XRrVwg2sNqnSFyDXk9tw13ksW6FDw88ckidHgw7/qUWNgoAyCJP7q1Sqir5jda3NiV/PU1W/X0
	ID1CGkuhpAXSl2M616nWBS/3Y49KY4xz7g5iJroDnmF/FQyhuEgXdlvV4H//4xIvmXf/6aMd5gRSD
	DQIu81jrhd0nkRZ23PvMTaLDG8Hj97Y7pazbQMbOEn8D+TleFs4anhZsrpQhdSFs++fC1+ag+t73F
	lAgpb+S5V9pT+0b0zZ1qpBTcPiT50MA9vmPStWCEc27ZJkcdeaNC3kTg1OPHDVUDSHfL4URSj2qOh
	nBkaejMYQhW08oPQHCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSXO-00000007lPG-2iBR;
	Wed, 04 Feb 2026 02:22:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSXM-00000007lOo-2ogW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 02:22:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IlqnW4122875
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Feb 2026 02:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bc3EyfkdPUkMHzZwZH/NnA
	I4VdVDvHXvneEpxKHuMBM=; b=mezqnqfrBhYR5EVVFTYWMVepZsGF+Wf+yJ7ET/
	jAHcaUs88M1jUWdG3o4NMjb+DVfElSZoILcYW8YECqj1dezDDBfC3eL/XLzgc92x
	mcKrCPz/6IK24WJWQcq/f05RGvpDkYROlLjk3vJByosK7Ii0O4xD93OSnLOzMWKU
	b6spbO09XXRHNZGuU9MZM0m3+dm6mGjcQ4Srp/XpCz8naQmYl9TWVYjteeUON9NB
	mCeMgt2yLIR3keldJ7peeFtK4F6MAE8pDHI7vhJRydr2dvFFU4v+cELcx7CRPZUs
	0uwAlHJazPXBCos8NH58A0qsBSS9tuzIMBnJSvc61eIUQkww==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3kbkj5q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 02:22:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c5291b89733so3907640a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 18:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770171755; x=1770776555; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bc3EyfkdPUkMHzZwZH/NnAI4VdVDvHXvneEpxKHuMBM=;
        b=b4/dyD/fP7q1ZChg6Ylet0YjeCH9XAdivU7H1UOt2H99LyFTn7PMe/SGWQNHagHoxs
         Pbx4+gdg64Z7waiLRx3HVvxFN65GymC3c11p6XD4YrbtMkRbxm3vmexpQrGioLYuTQP3
         d9tzo7OjSiFSyp85b+z8Z1pfGXb791aklutLy+qOdIN+pHql4cLx8Sc6a83GWVXZlUVF
         U/tYNXZPHoHuDWNjH+TZSeXVRhbQASMkhg2bNELH4ISsnybsadT3nEZFPUhFxWdbTK03
         wALSJ5myoXWWX81LVXGtz/AkWGzyzrNxY2NQ2VnIlOwU+Y1fN9KSzGa57Z8KExSXTG3W
         6UAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770171755; x=1770776555;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bc3EyfkdPUkMHzZwZH/NnAI4VdVDvHXvneEpxKHuMBM=;
        b=FMrrmbtYYecz7Uik4Uix95PYFvZpiSkrDUaxiI9HiPyq0OPSnLnAeejxzWsoAQ17Nn
         ELLjx/31yuczdA6CswrCmJnJhKiTkC9JoiN8k229R2xsxSahafePndMEkmIvKJXbGsuc
         I32bvCpVtLtaNgFkDMCWoyygmV+oFiCCcq622xMN9QywIEJ0ns6P6C+bbiAopbC6fp6/
         fE9uswdwTqb32x5riWC39EAIO6YN7WIeg+QNqI6Sq31MchBRi+EG6ZWt/RTw8GOLB1mK
         qGSdCQoAtW+TlgTgxINia/tsjjqCy0iPyceCIu1kxee+oXL5HBvUXeLCKDPg4Iw8mZrD
         HImw==
X-Forwarded-Encrypted: i=1; AJvYcCWX4b5Q62dcl6yOWQst8cRhRC5a6oxtq93rHcHN5PeEjIV+KQr4egdh31KkbILvyzNU5LO6iFIwdYlpQVt/5G0U@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2KQ9MmPY9G39PvQdFLhIm6dQWmzYhRbTyKy0ahMVLGFNezrLa
	7VXCrNSy/3p2YbfxiacDBdo4jhzHY+b1yOoAjkIgsOL7g0oPWdIu0EwSvBFBErCkQeC24DWVjuV
	BIKQYIgMCH91WEn0e14eM5eTdvSsRukjkPLrQGbcAk/oKp66KBE93ty5CToMQjgMocC8mh4dBSs
	QVHw==
X-Gm-Gg: AZuq6aKPgTrkbWd39T+wEgdRrHKhilv6za7aVXygsrKYo5TEeM4uqJzoO71/Dy/qkfG
	FlCdwMaNc4sgta6ktTZAelTv/0TwIOfp3Ca4GLMralZljDhF9MukQwVwgRRTR/HupB7/bxeD0my
	uu+KVmxyEsy9WgaICvI2rfC2DjsV/gu9oBX3jcTyiZn8j2NlKh72UXlpYaoxg5QRaT49bpp4+gF
	CWoH7yd4So82KvLtoU40tuMDooxpppTLHI/CnN7dZim70snWjA6aBQng84+vZBWBPGWSafAvbV/
	htJINfAWhqZBSPry4ff5bd+7riWJehk+T8tLJEKDxx0m5fRuEBVOetJaxq2Zgb5P9HXYfL1u5FH
	a2HklQsixOQynNVXj6a87AZooaE2IHEtnZTLNzd7mOjuY6HIQd+aBOXQmA7T7gduwJwaX2VIb
X-Received: by 2002:a05:6a00:2d97:b0:823:1d05:1660 with SMTP id d2e1a72fcca58-8241c7194b1mr1296582b3a.52.1770171755201;
        Tue, 03 Feb 2026 18:22:35 -0800 (PST)
X-Received: by 2002:a05:6a00:2d97:b0:823:1d05:1660 with SMTP id d2e1a72fcca58-8241c7194b1mr1296560b3a.52.1770171754677;
        Tue, 03 Feb 2026 18:22:34 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d4a5c28sm695598b3a.62.2026.02.03.18.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:22:34 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
Date: Wed, 04 Feb 2026 10:22:00 +0800
Message-Id: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEmtgmkC/43NzQ6CMAzA8VchO1uyjyjgyfcwHrauyBIYusGiI
 by7g7MxXpr8m/TXhUUKjiI7FwsLlFx0o8+hDgXDTvs7gbO5meTyxCVXQF6bngAnnEF7CzQFUKJ
 tqLGC17Vl+fIRqHWvXb3ecncuTmN470+S2La/vSSAgz6qSmhJKE19GWMsn7PucRyGMg+2sUn+Q
 cmN0oiVsRUhmi/Uuq4f0R56+QgBAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770171750; l=1813;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=YLb/XR3/x26pgocTpj6GhcAmxicZXGqUhPkjHb+2r5c=;
 b=/7aDF/h+UeR6MhTfa1L+9LwDPJotXrDQdU/XYhsJ0EkTVKm6D//Xivz9/GBoddFBMD93ctsGB
 2eJS2PasDq8BS9W7bNA1JD/bIT4K9Q/S92ZKWY4AmiUkx/LJh1m004q
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: HWB8zCyNZhiv4vLxyZLePaYEP293sK6v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxNCBTYWx0ZWRfX8CrPoygxrMeJ
 QFMrmZ/Fltqj+M04VCWucFnWgBQsf/EJDM8Cid+TYJvUoVZ3gsqWLAdPzjR0tLqyZQMNMflpAxC
 2l4fj1y1ryOhBeLcbV5b18bXON0QWyfDtTpkOd/p2iG/3MHyfDdODNftMssGZFzjeF6QsPKlh7Y
 KyNL61wSzKTpxUjLN+Wbh7LfAertmA3fNYVn2dyRw1TrLEqYoG9q8+UFxgpYe6UztkBdzXJHWeX
 p+BZEIc3yqIaizluCcXX2nhz+mASm7rRJjTOhpRve3ay+2LUt6cwc3J9Gt7Ubq00OsxstwcUwQS
 P1VRi8u5ZcbFh2d6oe6inn3rhj8hKdi81Kz+gz5Z9ps+M+EwdsKdmvqGJaZD/TnI/5bM1OdgWYd
 DA3WP4neHOPN2YWlcdCcGfXXuZy/X75K0fbErzHkjv4dZ3JoiPw9XqlXtrTzSh+CbB4ry9jub6M
 7lsZvdVcvTDQ/q7gO8g==
X-Authority-Analysis: v=2.4 cv=BKy+bVQG c=1 sm=1 tr=0 ts=6982ad6b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pO0fZtIvyn0UN2_VQdIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: HWB8zCyNZhiv4vLxyZLePaYEP293sK6v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_182236_718275_B8E98B34 
X-CRM114-Status: GOOD (  14.65  )
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

The DT‑binding patch adds platform‑specific compatibles for the
CTCU device, and the following Qualcomm platforms are included:
Kaanapali
Pakala(sm8750)
Hamoa(x1e80100)
Glymur

Since the base Coresight DT patches for the Kaanapali and Glymur
platforms have not yet been applied, I created DT patches only
for the Pakala and Hamoa platforms. I will submit the Kaanapali
and Glymur patches once their corresponding base Coresight DT patches
are merged.

The Hamoa‑related patches were posted in a separate email, and I
have included them in the current patch series.

Link to the previous Hamoa patch series:
https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v3:
- change back to the numeric compatible from hamoa to x1e80100.
- Link to v2: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com

Changes in v2:
- change back to the numeric compatible from pakala to sm8750.
- Link to v1: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com

---
Jie Gan (3):
      dt-binding: document QCOM platforms for CTCU device
      arm64: dts: qcom: hamoa: enable ETR and CTCU devices
      arm64: dts: qcom: sm8750: enable ETR and CTCU devices

 .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 +++++++++++++++++++++
 3 files changed, 340 insertions(+), 1 deletion(-)
---
base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


