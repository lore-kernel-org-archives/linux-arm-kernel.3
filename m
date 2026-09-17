Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8744C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 11:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lK4Nws3QJXDFQ9Jm1Y7KZqvQh+UgSSV/pCMJhv6VQvs=; b=cIjWA7B6XSW/H/
	iqFnN9da5bcVcHEiv43lPRlqw/MVqk4o3xKU2yhRpWLBhrLnHMWp7+Te1fN+18AIFn9bf5WYYsZDw
	LV0Y3gSe8w7Q9PrnkMB5Myei9GToPyqMbCOUI+pQJn9tHq/Ccarwt8qPrC1/aE8d9GpjTf88LL6pY
	cxknhxw23opMb4EsgWm9Fd4GC3gqWAtM2h97qYb4MzYBrVATcl4HKhtMMSzwmbckmOVitBW3YoeT7
	ntVtQpRb6eflWS5+GCN2CieSIDqrmkHvGEhFjI9Br0heOXFmTdr2OVDffYng66JEltGC9gzRI4g4E
	AMcj7pnYcEG54/5IJQJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AUP-0000000BCh5-0OCL;
	Thu, 17 Sep 2026 11:41:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AUM-0000000BCge-0FfK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 11:41:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zv2P1390229
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lK4Nws3QJXDFQ9Jm1Y7KZq
	vQh+UgSSV/pCMJhv6VQvs=; b=LZaQrk0RLUZUN+k9BG18VH0XduHq/+1dibaHD/
	/d5tJ6Rla8MLIbfOblzcZ4Nt7E0ETCdX5/m1hzyZns9vIwgWp2PoeXeIPcnUPk1X
	FVNSqzuxI00BhQEAQTC0/kx934KUgxB8cjyUlR3mWwODSfq4zg8y7fC9CkeEBgD/
	WiY/WsyiTkHWHLCaadc3D3krVhUMMYyKhcVt0RI6rWIaGeIAENtoCfbCMVnSIkW8
	JnIx314I5TwILQ2QQwWyDNUbvB9VkTvbKi9SxSMFgJGWZGPQkXUXXdbvIqKm/Iv/
	io2fKZBi2m6iDTbLwNMhXnwT6Ric8aoXyI3Lt3qXXIRaLDuQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d46a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:41:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4b524ce78so543190a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 04:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645272; x=1790250072; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lK4Nws3QJXDFQ9Jm1Y7KZqvQh+UgSSV/pCMJhv6VQvs=;
        b=BemBlDWAUEal0O3F6GzMiZa1aQyMAxsxZGuUhpBo+Tcxr9wp3pF9UfqzHrKf7ND0yn
         zK/ucZRP9JxC0H/cUR9r7FOGPljTMeg16X8Oj0aGkJEvg8N+ogovhywsd5qgQsZ8uHFg
         fXRi9YFATxGXWIUqAPdvLiqWVOnqiyTlKmXLJdEnwbqUTwRF2X2BgX8zpVAu4/bCDff5
         JQRofwYyN1R8LJBmDsuC5Qbgx1L6QK3Thny15P3qXe4Y1QGx7eCE8ZOL/iAySQInL5uB
         MbRYG0f4KEN7bMXrrMtdkgHUhq1ny8skK54JG84+Sn+SaVWbfPpK3jbC6FaPwZyEfiaD
         eA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645272; x=1790250072;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lK4Nws3QJXDFQ9Jm1Y7KZqvQh+UgSSV/pCMJhv6VQvs=;
        b=rS59zz1ftzchyVF4/Sr/lD4TAU5/T1Lnxy9ElRXCdZNswSdV9ugQreinE59LSSv09I
         XlcSRs+IAMkSpqvzDv5zqpn3hoON9de1eSSDVbb9t3WXmLLMGUzr0UE0HbX+W2ARgZ3H
         eX1qR/KhLQr0QOJxIXswj1nTm/QQio8Q5du6bnUifqTvMl8dJHVgvXECVYr+V0uZXka9
         Y/fQZSRxZ8zI6dsJx3Wx756zNpJKSDqDth+kI814J4f7E7Y/NS7E24znT3NdHhpVazel
         VvcEYx+2xRebhmeqZ7L/kn5047uQwR8hY8P1jRx/2rKn2954ENgFyVkj0JpwWaMAjpk6
         vh9A==
X-Forwarded-Encrypted: i=1; AKwUvByCX3pz7AU1yJmkcshK0EMu5gPQm0I3qhavz9YE1kULuqc3r3Mwxl6XVEMX+4T5X0c0SD6C798bE6oXyEDKHqjw@lists.infradead.org
X-Gm-Message-State: AFuF++kw2wXy6ZqUU623BzG7ZUrhfRFacbnbCQrhJX5G4MXhDQN5oBjl
	/uV9Fg0Uu2nzaO0sNsiW1LnE9pkVLzPILCQ5aPavrvjVztR7HfDiUIpc5A3NPIWZWOe7KSNRj5q
	T9Phl1G7E/CwIAeyKel6YhiyWZsPHW/5ZyvIEmCkG8ay9tpMoM2HiZfuub9gOYVNMAzproS7Beg
	8Kcg==
X-Gm-Gg: AYBFou3aOwYyw3YBnLc2reeFyTtwycaQ33PXwpptDypBXR/YPS7kmsggRf/NW6FxIR0
	Y8X+VV/Sbf6UEGyCkwWN6aWbuoLtFbOBSbvSiLjne9+vIW+XW0kBIF8fHV9fxqzpXGeaPkzioKV
	sm+WofOaOETGsaWq4c19vIlZ5PQy2wCQSSget8GRO33S42M8xlcdqg/T2/zP5J8CtZPXpQiAmkC
	pgxR3En+76lA2eDikh3rIkpedCSz4aQ9f/ehVY401CVNk8L+KgDreb3QbKV97OiBwvWdJrWzBa4
	PbN2yeCgTNrrHXtjX2INf5VMxBHLkrJ8s8lOnJkYiH/uN7+w9cMt54aCAgaySHEeXjRCpnCFBpZ
	HGLNudczxKh/oFZZtew8OdYUz1ePRDg==
X-Received: by 2002:a05:6a21:6b10:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3dd5f71a912mr16946198637.20.1789645271862;
        Thu, 17 Sep 2026 04:41:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b10:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3dd5f71a912mr16946121637.20.1789645271310;
        Thu, 17 Sep 2026 04:41:11 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc1178sm3066557a12.30.2026.09.17.04.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:41:10 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v8 0/5] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Thu, 17 Sep 2026 17:10:59 +0530
Message-Id: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMvRq2oC/43STW7DIBAF4KtErOuIvxlwVrlH1QUM0KA2cWMct
 1WUuxcnlZKFXXWD9JDm40nMmZXY51jYZnVmfRxzyd2hBvu0YrRzh9fY5FAzk1wiB4lN2eW33jX
 k9qU000T8bChhQnQEiJ7VyY8+pvx1VZ9fbrmPx1PFh9sl867Ehrr9Pg+blTBcpOBkAhuVBuLAk
 1a8bY3wgbihgEKjd2yydrkMXf99LTyKK/Znt1E0vEENQZIlA85sj0NeH0/ufXp+XY8rO8o7hdz
 OU7JS5ESr0CchRbvtSpmh1AMlYJ5SlbLCKm1F0jbwBUr/g9KV8uRBcCuMAr9AwZ0yQs1TUKngQ
 fkoIJBOCxQ+UHKBwkoZ0pha770OM62efrfKclgmnA2eEBMP1iy0Mfc2li8sgZl+zijkKaADRzP
 U5XL5AQ1HJuMOAwAA
X-Change-ID: 20260526-shikra-camss-review-cf6f66ac566b
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789645263; l=5479;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=X94IXHplgaWDpwnKRfo/yBezpYjKyFyoBsVavimemek=;
 b=gETS5vn21OyH33oMEWqrEpoWxl2v1dGy47y4OeYMvQJDW2MQeD6KrgtcQc57XZZBa7gZAi4ML
 rWlUGdDgB5HCC6QwRJWlgTVwNvCOHyrtbzWM986vARfD2RrJOagYeMJ
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: sbig9EeIyKHD4OlfO-6bcsDQmvGbGDjr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX5PKPY0mHwj6D
 N689/ALo7IGgrBHEbSl7tcYZ2Qdml2Sl7wybjgPlYnwVGSyFwD1NFqA5LUjrqJzR+4UxplLgUSc
 TsbC/QoIUEp8ttuOqVTXM/1uVv8DuEE=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aabd1d8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E40xv7DK0V-5u9Ck0vwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: sbig9EeIyKHD4OlfO-6bcsDQmvGbGDjr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX3ecQuWVfhaIk
 9DAoHRFljfWE9dHCFTlUYJAzAt78VFtixLddYu2IIaAtS4YCgHJzdXA3EqfFed/pG1o6eQix9Im
 Pr+4WGTmKAcEjzAJOHTptUYH9j0+aP2LYUFsVweCsQpzY+51YRUhCHeiPde93FuNqerwrDF+XjF
 rtzxP6o+gARPKjbsxt+YvDUuiJDOcr2g+yA6mMtjMzDiWUicmnD52R5f/NBu1+9bFPmDk+p663y
 KNh9vDt04eorBipC0dA59fBHi39Ei4mki7UXnaNv5XT4zRkoKN6jUepkJKCFXzQoUl9RDGhhqd3
 HmfaaxAuIX695N2yQAnkXjBjEtncm2EopZ+UWNwMqaIIdEKxldujHRFLn/C0/s8j0SnGuqva336
 XzT0s0yhHQojqjk2Jr5e3tNUBAql0hOZOkAnHhh40/gC7k9EAsILtmEccGzxm3Mg5cLRnsc1oJG
 eJa+3PhPYKWXK1p1lnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_044114_109517_07B218B6 
X-CRM114-Status: GOOD (  16.80  )
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

Shikra EVK is based on the Qualcomm Shikra SoC.
It lacks a camera sensor in its default configuration.
This series adds CAMSS driver support, CCI definitions and enables
the 22-pin IMX577 sensor via CSIPHY1 through device tree overlays.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,qcm2290-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 qcom/qrb2210-rb1-vision-mezzanine.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-cqm-cqs-evk-imx577-camera.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-iqs-evk-imx577-camera.dtb
- make CHECK_DTBS=y W=1 dtbs

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v8:
- No code changes; Updated patch subjects to end with "for Shikra" (Bjorn)
- Rebase on top of linux-next (20260916)
- Link to v7: https://lore.kernel.org/r/20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com

Changes in v7:
- No changes in patches
- Rebase on top of linux-next (20260805), fixing the conflicts.
- Link to v6: https://lore.kernel.org/r/20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com

Changes since last v6 RESEND:
- No changes in patches
- Drop dt-bindings: media: qcom: Add Shikra CAMSS compatible; already
  picked by Bryan into media tree (now in linux-next as 32179a552b8e)
- Rebase on top of linux-next (20260804)
- Link to v6: https://lore.kernel.org/r/20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com

Changes in v6:
- Rebase on top of linux-next (20260721)
- Sort CAMSS by unit-address numerically - sashiko
- Collected Reviewed-by tag (Loic)
- Link to v5: https://lore.kernel.org/r/20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com

Changes in v5:
- Rebase on top of linux-next (20260710)
- Drop dependency on shikra-dt series; now in linux-next
- Drop dependency on shikra-gcc-rpmcc-clks series; now in linux-next
- TLMM pin entries roughly sorted by the pin index (Konrad)
- Link to v4: https://lore.kernel.org/r/20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com

Changes in v4:
- Fix data-lanes numbering to start from 1 in all endpoints (Vladimir)
  Missed in last rev.
- Link to v3: https://lore.kernel.org/r/20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com

Changes in v3:
- Drop dt-bindings: i2c: qcom-cci: Document Shikra compatible; already
  picked by Andi Shyti into her i2c tree (now in linux-next as e3a8f8329397)
- Preserve blank line after compatible const in qcom,qcm2290-camss.yaml (Krzysztof)
- Add blank line between iommus and power-domains in CAMSS node (Vladimir)
- Move cam1_reset_default pinctrl state from board .dts files into the
  mezzanine .dtso overlay files (Vladimir)
- Collect Reviewed-by tags
- Link to v2: https://lore.kernel.org/r/20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com

Changes in v2:
- Drop qcm2390_resources struct and CAMSS_2390 enum; use qcom,qcm2290-camss
  as fallback compatible string since Shikra CAMSS is register-compatible
  with QCM2290 (Loic, Bryan)
- Use oneOf in iommus to describe all valid SID combinations: VFE-only
  (Shikra) and VFE+CDM+OPE read+OPE write (QCM2290/Agatti); add
  per-entry descriptions naming each SID (Krzysztof, Bryan)
- Rename shikra-cqm-evk-imx577-camera overlay to
  shikra-cqm-cqs-evk-imx577-camera, shared by both CQM and CQS EVK
  boards which use the same PM4125 PMIC and camera supply rails (Bryan)
- Add reset-gpios pinctrl state for IMX577 sensor (gpio33, cam1-reset-default-state)
- Add comment in overlay DTS explaining absent regulators are powered
  by the daughter board (Bryan)
- Collect Reviewed-by tags
- Add reset-gpios pinctrl state for IMX577 sensor.
- Link to v1: https://lore.kernel.org/r/20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com

---
Nihal Kumar Gupta (5):
      arm64: dts: qcom: shikra: Add CAMSS node for Shikra
      arm64: dts: qcom: shikra: Add CCI definitions for Shikra
      arm64: dts: qcom: shikra: Add mclks pin configuration for Shikra
      arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay for Shikra

 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  79 +++++++++
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  79 +++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 197 +++++++++++++++++++++
 4 files changed, 363 insertions(+)
---
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260526-shikra-camss-review-cf6f66ac566b

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>


