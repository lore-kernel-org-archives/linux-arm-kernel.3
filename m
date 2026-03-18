Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074FA103E160
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6P/1d0NQU/iMLV/r5y251qGYem5RUiR9rUnsuv9NHS8=; b=X/iSTx4Lx2MtKg
	TMVPvrzUYEwgGAgDu2Vx0dBpHUm4OWKfijgRIAzxR9vXV3DQXZ0HIx0dz11+YgYFAJBtvBzKgDF+H
	LxO/xnNIm8WbSbYHGrPDnMsaLO38hWlhytX7uPKb1PBJ3l4s2N/XnH/Z1rK8ljcPx+MomPiBvYAvh
	B3OJmYn4ACb9fuYQ1RoitEVvJ/wKBGhaqEFhmEzRONWyW3gPIjcaqOPK17YhW9RaqIhyXOZ+m2sOT
	SlrwEjbrdWUkl1Kp3tWFe3rWsdlr3467aOXjlZAD+r7CSIiJYC1mXT25Q35IvVygAJDzQKXbJDoRl
	vvNUOKjQx4UcAJ9GJ+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2olh-00000008HTv-2Jvq;
	Wed, 18 Mar 2026 11:08:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2olf-00000008HTJ-0d6H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 11:08:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I98aPi403286
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6P/1d0NQU/iMLV/r5y251q
	GYem5RUiR9rUnsuv9NHS8=; b=jYwM3HrX30PQvx3eQZxJEY+9njS+FT/cwicGC0
	BOf4qe76PrjSFKqsRqDG4wmY8IBu/xSHgfDIiZVsmiL/o4bcYSPgTIJBV45hqSZn
	0g2MDf35l61QUSEBmwIlvWjRwvl1K7+83Bz9O3Udgf3SyFA5Q693HbeeCpy0ncwZ
	TaeQnhh75h8/NORxRhaXwSKtjx8MkdfADLYggBcqx4nSsvRPpGrIa+uDOLn7HNBg
	OUFpEtMuNdQ6Q4l6UaiucnrSypL1GWEsQCIpjENk0H0OS8EwcNw6tdb7AIm+xZGw
	ibkZwbBR2l7opseSy0Za0923MyXZ5QmT8nzSP3nRQgtES6xg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4duet3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:08:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509177a915aso65567281cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 04:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832129; x=1774436929; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6P/1d0NQU/iMLV/r5y251qGYem5RUiR9rUnsuv9NHS8=;
        b=O791fQaD0eOrAlckB7A0rD23L3ZhF/UtN1UlMbRz+FVKMXO0OOAQz9Fp+/NXYP4js9
         H1r4hsHhYRVZbBmXObbv+5i2e6+ymwRxyY8G3d5kYtwaQaeh2iM8bhvy1fMyJNFnP2DZ
         ve+ObwV1ueIS9nr0hVI8Rfyq/DUP2f7uC1Z+N6Hn4xecec9syJdSeGv2SvBj+mmjlfTF
         P8WBqTiO8qtDOVwJGhe6CdOR4FvGfCRbemB+OQrcbnWdrodvqw23ndbfqoEvo3Vyj9FM
         YCm//dmFYjXPgXpcExblB7lKWUNpq/kL1Vhx1ibaIFWa50NCYWgVZ2uMFAc9XHmGYqod
         x2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832129; x=1774436929;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6P/1d0NQU/iMLV/r5y251qGYem5RUiR9rUnsuv9NHS8=;
        b=pbu8ThFHkL7Og3uo3O4OCkbAvJvAJKQI2iwY2Y0rH+lHPb50xWvW+z1GJYaQOQQTJl
         Rhie6l3oNEMhGzNpgTZsGXnvMxOUXNKBs4UuOxsI3Bw1PF2wqo8tvb8SA9kGKDLOlepB
         +wjT25IA4Om/tDd/LzbneeeJ0Hvo8OcSs3TqI9fm5AxwC02KRPv85fPsNMsELEbIi+4g
         QO1T1/wjIsj7+S3yssKQMcru2Qo1Lsoz3rZIx7m7sYI8ukTUB+9ddm7ZzcDyBQTQiRfz
         6hrsVbD/dGJXrIeSDa4c0XJveZktDR3nF2rXs8rmWUzXFLm7tYAk/sfFQRjppBCkoHMC
         JdtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT22ZuX+3QfdTG6fAE7qH2v5nPpAVsEjMOV1LD7qQ9fyHZZfKKCt6F+9ogmOn2R3eHqfJzT68CpGpvg4RlYEX2@lists.infradead.org
X-Gm-Message-State: AOJu0YwUN+Lj7oggg47e4jqpJ0wP6uypoC7+EFSubZo7O2NBILaTJY5z
	A/5UfUdOT8nbaRoIhEvjw015M58KBb86tSaVrf/bxQ7rRMV15SpEUte8ttyHHO0n0SXqRhOa7Ik
	D/6y1n4KlAagY+5dwRQn9Ch1li9ZCwoLZU0v74YJiSod02BllwTu6v0YW3BtyNF0mnZpV3WTDwI
	iEDg==
X-Gm-Gg: ATEYQzxPsZxOSX1gJUM6KtNfDKspPmRfDmcG1b2YZ8MzTlsV4RfYqts90I3sofD54/u
	Tg+zp8MU8hRRVz628ZRNMw0pvJ7X2xG79+GWvlCgizjx+5MKfAVTQ89p14mYa24W5yEdfdeQURU
	YF7igwnMbvTjNrhI8ZRb2M6PonjM4L79zEIaWWxCrNi22dKioGniTEZa0Uovb6CTCiFuO5SP+Wp
	T6RakY5tJf5blnVd1ZZ7tb+NmyhaJI4xxArz9q5VKBP0iFUXqrKafwczC7PdfyGzJBa/yFZam/7
	uAV41Mc5fWuXwJZHS2hGHwMF7MnLEBSo/qn7YIBap24B5FoobDsTPBu9zAd5Eyi7PL/HBUChmgl
	wT3/WDWHqZrfVhM3WXdnt7je2AQuR3W4gcTaLn3ka5knp
X-Received: by 2002:ac8:5f53:0:b0:509:f1e:41fb with SMTP id d75a77b69052e-50997ff8b59mr81729681cf.6.1773832129279;
        Wed, 18 Mar 2026 04:08:49 -0700 (PDT)
X-Received: by 2002:ac8:5f53:0:b0:509:f1e:41fb with SMTP id d75a77b69052e-50997ff8b59mr81729281cf.6.1773832128819;
        Wed, 18 Mar 2026 04:08:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:08:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] clk: qcom: Cleanup redundant header includes
Date: Wed, 18 Mar 2026 12:08:39 +0100
Message-Id: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALeHumkC/x3MQQ5AMBBA0avIrE3SIqKuIhY1hk5QtIlIxN01l
 m/x/wORg3CENnsg8CVRdp+g8wzIWT8zypgMhSpqVeoGaV3wpH1Dx3bkENEMhoapUVZVBCk7Ak9
 y/8uuf98Pq2OlvmIAAAA=
X-Change-ID: 20260318-clk-qcom-headers-9b9cbf80a04c
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HkHhXrqMmiFyx1YPTM2JfklSww0Bi7KnBOXHoYhSgn0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe5DRsIdJAD/a7UGCOmOb3WtrtU4Up/ECtQ9
 HHRFzsf78CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHuQAKCRDBN2bmhouD
 10CVD/0ePbX1fQO5ftCAlqT4j2WM2c/QyOSzZQ6rOdkDqIr3YnOMWppyeNO8KoC1+hj1H2oz4bK
 +n5L7KB7Me34rSyS6+wVVfIB3UxzvrEMZlv15U19gwfPPv1sKxdAFwyw0jmkUYF6jY4n5iE0VOy
 a4qui+C6SXZP2UWNzGLQ2/Pw++juCkmoUGxZrvgUFiFMubYwZF6SOkxA8D4h+ZhfUsNJvlkP5oK
 r61pXpWlHueSQZMdwmO3x5XHMcjjAg00rA5e3EWqrn9kyBltdz/iPamX1bTu8bbiUP4CgvN8Gf+
 LVzc3nRyEwcD1DnuGZLXYmu6vMAGA4Ac6RzNUcpOBFCbSLTGu3VQlnXbWQaKQ5votfdHGzuFIeJ
 VhN50mE+OgTehfni+ieDaG9pIM5rOFNb4ZeMfbzk2fmt1LPQ9XTSIfNd6Z/bcD2pkY0P6wDYfC9
 8K/ypcopbFBqW9f5RljwFj2RsG3FGUhf6A1nYB7170ty5hvuso77Obdkn4u5ozgjwMxAjj5SU/M
 mXs2USw/TWbSkbadLNezp2gpDjubtcNaJoplBkwPbIwcfbY/IPkXqfcH1nQ4NxAWlnw+TG/HqQd
 v8tnZSrt0hdhVQQMzrFS68JMb1nV2g/0MlpQ07ipa9OemuFEZ89fMiQ59M6XM5qL7oqOgPC8pHC
 dGpWiyM8OssiQ1g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfX/0hQ9LfWMEWN
 VETeBXdRPsHvSpmuFMMVFvUID/XiEcdQIt5Z/cc7BO7LAjrb2C93i39r9njSP7G2M8L4FI1DbyE
 tScLpxR8QLLnf8mz7HpWqq0DRLz97BG8eh6MAxC9ZABfKZEuV62IFkyiTcDD3t9LG0cJqAxHIhc
 JT2SQ4Rr4EuS/khRIJ3WanVDzYXIUiNRi7SJxL7fYlU+6cYZwMVAkGLvDbsM2xVMb99pjaYe/Qb
 yduQtNmLk0Oj02iig4UroPd5r1tjC7UABF/T61I+fKxbOExJ1xN0dgx4wnZvoAbR9ZoQ9/ia7FK
 lZny68vdB+Cs1t0LTsPACoigiALe56POeHNDT+ziahgRTHRwT//rE4n/0hDQGuWTiKTRr2VzjOU
 5WM54KF7zRYPx7mt/DgjCdlnoCm06Wy6/kHCsHiPijsmxHWT4dkSGTDhAHfN4K4CTGOk00fm4lj
 BZChtDiA7bCMVoBx8+Q==
X-Proofpoint-GUID: cdX0MXM4A5GHJpcjY8E7zvW59bzvmwuJ
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba87c1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=T-bvjWfsjI7GNFiSrugA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: cdX0MXM4A5GHJpcjY8E7zvW59bzvmwuJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_040851_403858_B79549E7 
X-CRM114-Status: GOOD (  10.41  )
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

Newly introduced drivers keep repeating same patterns from clock
generation scripts...

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      clk: qcom: kaanapali: Cleanup redundant header includes
      clk: qcom: glymur: Cleanup redundant header includes
      clk: qcom: sm8750: Cleanup redundant header includes
      clk: qcom: milos: Cleanup redundant header includes
      clk: qcom: eliza: Cleanup redundant header includes

 drivers/clk/qcom/cambistmclkcc-kaanapali.c | 2 --
 drivers/clk/qcom/camcc-kaanapali.c         | 2 --
 drivers/clk/qcom/dispcc-glymur.c           | 2 --
 drivers/clk/qcom/dispcc-kaanapali.c        | 2 --
 drivers/clk/qcom/dispcc-milos.c            | 4 +---
 drivers/clk/qcom/gcc-eliza.c               | 1 -
 drivers/clk/qcom/gcc-glymur.c              | 1 -
 drivers/clk/qcom/gcc-kaanapali.c           | 1 -
 drivers/clk/qcom/gpucc-glymur.c            | 1 -
 drivers/clk/qcom/gpucc-kaanapali.c         | 1 -
 drivers/clk/qcom/gxclkctl-kaanapali.c      | 1 -
 drivers/clk/qcom/tcsrcc-eliza.c            | 1 -
 drivers/clk/qcom/tcsrcc-glymur.c           | 1 -
 drivers/clk/qcom/tcsrcc-kaanapali.c        | 1 -
 drivers/clk/qcom/tcsrcc-sm8750.c           | 2 +-
 drivers/clk/qcom/videocc-glymur.c          | 1 -
 drivers/clk/qcom/videocc-sm8750.c          | 1 -
 17 files changed, 2 insertions(+), 23 deletions(-)
---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260318-clk-qcom-headers-9b9cbf80a04c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


