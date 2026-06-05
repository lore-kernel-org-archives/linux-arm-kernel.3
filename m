Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77BBCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 10:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=; b=0bnbQE6QartyJ/dwrDvVQ6gS4z
	flVAxkA7tXR4J068PNt/WUeLYympZj3AuAuNqETMnfKODEV9WMW4OKDJiUKKNiH+5sdDz2oqPAdP1
	OIg34b8M5uYk0EBzrYvJ5SED6eqtkOic3egylqYV/x4RW4ekmAzLHqQOv7e2oDblljovpIittrvZo
	71FpPFiuZFSvJeP9WGc8udeuISVAVxQuRXJ+z6Hu1qv8/N+saL6o/oQTsPvuAYlxAOmHUKig8dPGA
	w6qaRHpKaSBDjTu1LAhSUrE0PZ1axSxjKImYkSBs489B3evtIr93bF6wLjgJJl55aCxNu1G5ftm/3
	wakTQ9rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVReS-00000000TWk-2t7h;
	Fri, 05 Jun 2026 10:19:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVReP-00000000TV4-3wNg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 10:19:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6558nlQU1957385
	for <linux-arm-kernel@lists.infradead.org>; Fri, 5 Jun 2026 10:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=; b=oZEblcQNWqkqEQSh
	X9TIIJWFvrr3+sTd4bHurOifca7MU9O632Yhg6hpI9JFjGCAO0Gvdczd949cun+i
	aYnuOpuOIK3uokao1T5xNXKdQBcnRdLS04S5kRzkrxlI206IdjlfXxiOj1eX9xcB
	0QBU3D5B3mDyEfMxcdaePg3Aq4P3w0WPjeFt805S49fdFmdTzhCWSHULO8W3nhNc
	3GqqXIyK2bjO4DBzVw7gDH5b5Hr1+ooPRL+GH6E6aEgqSGR1bvt69lIaghpoqj6i
	NKFqDsjklb4T+GBRRGY0cl6/lXtqZ8cxUaPXQ++VN+fndJqaoWZSLHhwA86XeXVI
	K5Ud/A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekckpv516-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 10:19:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso19262505ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 03:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780654780; x=1781259580; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=;
        b=e/lEZYlbatLHjD4ugZE+dcRkUcM33jwibmJHy4AaywcS5SfrS88ZAwaFOQ/3oj4U9/
         fdZq0SmoiURFrOL1ZsV1YDmyLdcKKl6YBM0vzvL6fXXGc/5t8WdopDwsnFxM+cUpikD3
         XRgS7Dw6++kMpI8WjyE/Tr+8KBjYuViJ0EfOLYgQ3JwH96L+o+37r4H6whe/lDz0v3Yj
         tG4ZZODSX2k9p+mwDveV7EYkT40pGeodc2/id26PLcMA+VmpitQv0jRE+ZAA9/yQEWOW
         LUCJOG+JdpmLUgfnyaCO4KGinjALpUYU6TlOS1PdARumkzBPeffeelWuCltpanJokCmU
         /IsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780654780; x=1781259580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=;
        b=TGrVixiKI0ngIrZG0DoXYZXQghuWuo31QzDMHux1E7YnW6PtxfN68HLDFPWOdYDXKG
         5EsW1BqV7LBW2VVYDzj8gCnIMkzCslDJHcduIVeJ9puj4JQD3aAklpfDZ+pWqGqOpiFq
         LMZ6WrRBuKPmVTLnaOXRNMk1r0CDtKKlsA1rhIZoZUK8sjlHlsp9TjBCKqeMFHhf1gnu
         t6A7cDgzdT2OKuzeB2wxQxwL7y/OADsbqFUcd/JOK0ERfCSQWEOgDEpK9zs/04yXJESS
         NM/I29WSw050ej1TBu/R3mu1dQHQhiV15BXKMp/rAnBYpv47ZJj/eu2CO6lnpo0iiZfP
         g+1g==
X-Forwarded-Encrypted: i=1; AFNElJ8Lf9DeyF2HykzKCmEAyKE2bfD6hZX/U3L0zKzL6pXfSMORBoGnyw862wfTWaohynzo+mgEESC1KBojK+vwSsrL@lists.infradead.org
X-Gm-Message-State: AOJu0YzAOfUuGvAzBJAKFQmZ6BiCUzjjdMgCL8dKZKKXCSlZm9DaYpac
	JhqAE3qI9vierZEjs3egBilZUt4z6TrtxfKvxT2tR+QxQlvoRz5V7a0a3B/4DDzTMidsJ3C55UE
	JhKUkHhEnMh3w65rc0Q6vViHLfIoTVrusY9Dw54jyhOVAcB5KzDo6xePO+fV7cu3uUwooFYotiR
	Dt5Q==
X-Gm-Gg: Acq92OE2UEu3ZkUwi4RZcAYh3orf12gSxysC3yEaRbt+qJ79yv/ZJYiEsafKPXYc5Az
	n6i+Nc01CD4NWvXWypF5Vxtm15a3yt9wnqaZV+GWv+g5eBihuoquanVypFE/COgCo+V3oIOlDq1
	4B9ybhvpxT0ujL1nLUu+nn6tqxR2bVHk/cN4cYzpIUD5Lw1J0XQH8oouyYQaH/vOVxb3Bk5KkvB
	DdztQYYDdZk5SysCXInpvbqzhQ/InpMCIkAMhuTUIOyHeTDTTj9dlNfXNXhsBUE2AHMy+FSYI4r
	nJ2dD8Sb3DJaNBehYQ1MM04RscrwpE/KO7EkVhG7dwCm/aD3x86wtiW0GA2SqxkvxM4VMBipIE1
	2E2PEef8AM+6WQTZk3S3J32byjWRgh5Lc6PvF5iTWF2PAg72aCFMXMMZ70rk=
X-Received: by 2002:a17:903:2c08:b0:2c0:bb11:19c8 with SMTP id d9443c01a7336-2c1e820db02mr32151865ad.36.1780654780045;
        Fri, 05 Jun 2026 03:19:40 -0700 (PDT)
X-Received: by 2002:a17:903:2c08:b0:2c0:bb11:19c8 with SMTP id d9443c01a7336-2c1e820db02mr32151295ad.36.1780654779579;
        Fri, 05 Jun 2026 03:19:39 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa0236sm89741445ad.33.2026.06.05.03.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 03:19:39 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 15:48:53 +0530
Subject: [PATCH v3 3/3] soc: qcom: ubwc: Add Shikra UBWC config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-display-v3-3-9846ba5fe635@oss.qualcomm.com>
References: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780654747; l=1072;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=rVf9yUiI4s1YDWhWJ0K07qBAlGQcKyt9Ku/bgoySARA=;
 b=7rX2EC8uhcDt/DiMdC/pz/WYl5oqxXXseJ2Vos332fRcblOHX5myBQRMg8/MPOkIQQLugj07+
 GhyQMIiwGzaBxX3jfm0F9vACJHj7WKL6YaYot4dhEnVPhF2JXqDCa4V
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: Hgkn9MzJL-OY8reCBrBxYaGhPp3L588N
X-Proofpoint-ORIG-GUID: Hgkn9MzJL-OY8reCBrBxYaGhPp3L588N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA5OSBTYWx0ZWRfX0XDgBmvMlAP3
 jXHnpoPBw1a06AeztOwIav0enSRc93aeWiP1ieQX/elDbYygedCAt2k7mbMscHIxS6ajOk0usE0
 vhJP/Uv9aCiRA+tn1ptzYp3lEizjmRvZWFXTZoqcYyKMJaCFv8SPcLU85hxS5csv3fE4nATSnxI
 KlEJj8gLWGRtYYviy3HD0zFS2PXQj6OBNMrK3EqzWyXQ3G6IEIDR5Akd11q7r5azgi6xnvN3L9i
 DEol224yp649gMEuZKgM0LGXzP7RhcLE+QBtKhg/0dSce7sxb7OOKDFAszqjMfVekRs2WcLZGHG
 FUaHcydm+3DOgON5t0DQSDaBAtf+j0/hLivEWUXykZXynqbBzBdrayvA9EkO+Kzm26ij9dqmC22
 ha4EiKTwn5B4od0O110rrOc6GjLgnmAqrK8yfqVR3K6MzYBxU7tQYNacJ3xyBYX/FcgDy/mjioC
 N/bBoDhamHZ3kyRMvLg==
X-Authority-Analysis: v=2.4 cv=H9jrBeYi c=1 sm=1 tr=0 ts=6a22a2bc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XuKMx7f3ltwE3Y0lsuMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_031942_102118_60946F2A 
X-CRM114-Status: GOOD (  14.48  )
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

Add UBWC configuration for the Shikra platform. Shikra shares the
same hardware as QCM2290 (Agatti), so reuse qcm2290_data for the
UBWC settings

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 3fe47d8f0f63..1a2e54c6480d 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -278,6 +278,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
 	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
+	{ .compatible = "qcom,shikra", .data = &qcm2290_data, },
 	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },

-- 
2.34.1


