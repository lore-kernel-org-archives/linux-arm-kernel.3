Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD24FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 08:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fSfYS9NBScKl9paIPDmCUansHZ2TO06mQJaHt6Oyln4=; b=N5Y2KhRPJUVCyf
	HWzIZ+FN11y45vewh4RETkssO1N531J7i3EpC1f7VXR7POPDrny8nCiCsDP0EGFD3MJWTH0r4EldA
	L7Xk3HzQGtSke1qT76QAdHzdsuGixDZXyr0sSFSL2gAWKB8Vyr7zmda+V3EGYH8veydaM0joPbEXB
	PA8c7vf4y100fcUxGn09BMihtCf+UPl3bBWV9cpndS05qqkIYGD3bM0uQw//6QYyO/EQrBkUXyzK+
	eE3qReMxn1/lhFhDPOqUXf5pOQuDZ50/IZZ0VAIto3RQ08tszVc7Zi68vLlGS9C7hYQY//J/cb6Ns
	2GuhBCgGzq87MRt6loag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0ix-00000003GZw-14Es;
	Wed, 29 Apr 2026 08:56:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0iu-00000003GZJ-02mu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 08:56:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qWAK2889818
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 08:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fSfYS9NBScKl9paIPDmCUa
	nsHZ2TO06mQJaHt6Oyln4=; b=o8QiDHD24PDmRMy0glEsG1Bn+YzgkRLf30dkiL
	wRJ3Adhr62CSWZWxLCV8oxBv9u+r/86VOtU09VdKLFMyqDRDM5yMdhp9YCwQm1iB
	UTSgrnA4KPuc7Ma0/HQ+vNkHRyHHpemNUtwbdUG6gzdegm1CMKumZ1PMxCtvQ0mh
	4alkGCcvPLXuQp60AhUVTN1x8EzXkdUAn359JOvZPig2m6+FxwWujTK/ZS0L9w2u
	0yAKGBa6Fyq+9TztnFWbiqcxqP4awlKMGdDk6uEwMJjzoXHkos8R7HqSEV29yxKV
	J2ptQzYGXIsdGwT/xfKt99Y7ItXvb981uRgWDOX5L30LHdvQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqb30p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 08:56:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50df4c130dbso18483451cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 01:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777453006; x=1778057806; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fSfYS9NBScKl9paIPDmCUansHZ2TO06mQJaHt6Oyln4=;
        b=eKWtSr2rK51yPZ69ZnVeiMZsh2S9d79cI+V2t1zng1+bWMmdvnd/jb0OmY8u1rIT+b
         XWLJVZHJNox3qTFkXWacA2QC/Av7BdZwKNtqyu7ueLOIr3vX1VEYspO8lcZ7IJVLZiRo
         qTnqU7rvviTSjnTflu/B6889KtusWIu458pdG4JFh1AcqNMiiRzAi6T+NiYXAo527d9q
         OKY+IMnkdNjR9+Ev8zkCwsVFkee0R7+4QQgZZxQrGuCOC2Ff6FFqX1zAb46W5igITqE1
         lvrAmpxGFBatttD4yRC9r9VTTQX00hM5ffg0cWNHLmgG+DhHEFCwgnBNtRB+P2jsFy8k
         DMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453006; x=1778057806;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSfYS9NBScKl9paIPDmCUansHZ2TO06mQJaHt6Oyln4=;
        b=TCC83/wHHk0cnfsWYHLf4wAKIQn0HkE88BArc4I8BHlfa476swhy7m0lGHXs210m+y
         kVE8c10IMgjeudazB3lQHCTIbNbtE/dMpF4eqDdFGD57zzXhN+/x8ivIry/yjSF8gsVJ
         emMmx2Bol0Y5/ocbe4D7lwXsXEyTNhYbpIdSErx1Joi+VPMGrKJ1LDshNaeCFTjSKg0C
         sFHkHAxpwdYdbt+KtTQXduW0bvM8+FdUcU7gD4/MDe2iB/M2X0uAQ7IEKmjFBBuGTAua
         vMRy3IpZ4hYpoZVfq+WG09WC1s52BhYK2EggF51obspN3lVViSOj/HvP8EwPmtetguVr
         AHEg==
X-Forwarded-Encrypted: i=1; AFNElJ+VfpP0tCa2hvO2z2v6+jqHV1RzqGXgRm/VxFR5BQlt4QX+svuzc2LyE7YgcqSoQ4uLCwGYpj5rhFGGmPQG0hLw@lists.infradead.org
X-Gm-Message-State: AOJu0YwUk8V36DSgo79WKvWiiTiK7yxz0BH5Y83TnybRxb80ZUTfPUUv
	hAexmKqjsmKIGe31Ye5u0wXoshYuk0X0OgKNpBXEhj2aUWsm6QqDlfu34iapwl/iyeHQMXFoRIn
	vj6B8eY9677JPQ046iks/AGG3xrgIWEDhxs3WZzQtlYqXYmBNy1SJC+NmSGnfbxokNelTOqsJOU
	4TGw==
X-Gm-Gg: AeBDieu40eRu0hdrnxXvf4dKXjRkVai3Bg5UsMp3Zws91sn6boDpVIKw6UKbp8CQfMy
	NBwNZJkrO152Rpp1cvQBlsUjTnBhENKfsom6L1LIQionr94Y/vO/o7IgjnuI1FwNvsXscgklmph
	CVNJ5AKWZxwZQ8oYmLeufsMB1xpTEYpH8lZYBhSVxW7u9ulbeJPOzNlfbvkW9B6bBLSQDDLJr7I
	YpB2xE/IcacOCRUiFdK4j+1jYZxPf+Qe7GnttDGq1a5iHWqdZA+tys+1rs2mw6SlNmuPEkAQUnD
	52V+XaSuTDf58EnI5yiz7unw0Whs/nXG4lI8ldM+DKTSukrdHKG+f41i2d06Om7XwBfoBG8UfqF
	UvqOXHttDZVyzEu6sOs0swYsltxDlZL1Wcli9a2b7q6OHRimmYXv4DSA=
X-Received: by 2002:ac8:5845:0:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-51019af0e91mr28267481cf.24.1777453006529;
        Wed, 29 Apr 2026 01:56:46 -0700 (PDT)
X-Received: by 2002:ac8:5845:0:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-51019af0e91mr28267381cf.24.1777453006106;
        Wed, 29 Apr 2026 01:56:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216ed6sm4950689f8f.16.2026.04.29.01.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 01:56:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] soc: qcom: Kconfig improvements
Date: Wed, 29 Apr 2026 10:56:31 +0200
Message-Id: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL/H8WkC/yXMQQ6CMBBA0auQWTNJW4mmXMWwoMOAo6HVjhoSw
 t2puHyL/1dQzsIKbbVC5q+opFhg6wro1seJUYZicMadTeM8vijNqInwQSmOMqENPpzs4C/G9VC
 yZ+ZRlmN57f7WT7gzvX8f2LYdXvqFcHQAAAA=
X-Change-ID: 20260429-qcom-soc-kconfig-1b9b31d9702a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=08rsQFVR+3hYiuMMX57tOBkvtDLUJJygy6Gkb2VwMps=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8cfFZ+IKJj7HWvgriNpAi2FIz48fa05gsGcO/
 J7YoJ591yOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafHHxQAKCRDBN2bmhouD
 1xcaD/4t2pN9Vt5h01CPyjXk12c1q1gRIXmuKyOu8g3dHb2AdtJMYw3sxMeL0Pl82TigYmHlTnZ
 m7Wf4LWunCjmWiKpUk0edrswAXV3XfJ1UGmN1oJKDGC1wr23VLNDrbUqwIZuRkx1TukZoNguJUv
 Y+iW5f8R80L6UBHuRJKiX5FRIFJu4Qtln8QaPav9ZR2BKFh4JSh6MqGwXad3W9W8X4fz8WEG5PI
 N664ucy3dW7hcKvlZgi95KmqJKLF70OaqNTUf1WSXbjdNNCo5eoX4ZNuaWh59yp3NpijnlROkdj
 7Qo4VlO0cD8nwNQQ1WWkyKxjHRyYM9FxyGdoVxEtl0m6C4wubwmmQWpy7qXG2OvGPfko2wPDQq1
 QFF8EaEUHj9G7ZF0Ex1xNXkKjuiOU3sN2F8fk+6mAsfs/G/JZaLpk9PfwhNHw3bHhojR/crwBIT
 4OYmzffvAryUMLDp5HK1P03Fh2tl0ocokDe6oXZgHLLUetI8mnnB+tpeNQsGcbQWTI/PoOytqYr
 1eMtUSCiwbymouUuEi8QVckKoyRIcsrrF678mDx6uahfIq52AsMz01b5hcILy9HiGRE6I3ySckH
 OUVGvG3tbRPTR49T/dQQan7MXDP60z0zrbcyoj6RhfpoVnmJQizRhzSh+wmfAmRTvliyG98pxbm
 TIfoF+/jfI7tyVA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: OdI8McEXvcTT0n9xpWnf_BctUT-LxETe
X-Proofpoint-ORIG-GUID: OdI8McEXvcTT0n9xpWnf_BctUT-LxETe
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f1c7cf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9UIuVs7TZjGmRM6JrXUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4OSBTYWx0ZWRfXxgq7dFL+wlBB
 ozQ3oSWARdPVUuiCtKFZuv67f8KhZC3jJs2HTZg4Aqbr7ailK1MwDZ9vAwbq5kXYVi2mlu+YyIK
 hG5Rmk2Gs5flWxqHGEOsSkK1mGHTpmI5UdZtCXkBF1pDjBcetyoWTmH7zUB3kohT06sKthYJhJz
 SE6Qy+Szct3NwhN0/frS4zZKgFQ2uOwZHa8YGFQ9cjgTAbuP+rV5QtpPkqPbJpUIU/dmHTyLMsp
 zkOhJToMyVmxr5b3Ymy5PBMrJK1FbiNgq81r3za3oMv54oBwNGu0krcC9k2yuL31GjQPXvwxhGx
 GDzd+tqHsDza9ilfJkfdSHPy9OdImWgnrhC2lafyBNjV6pOPHGONgBZCXEc/VE4uzHnsGPYsPvH
 OxsU0jaT+Uyp+inLjs2ur9/nx2rE8t4BLxYMLbxXy0ysUJj28JK7SCzDYOSxSWkP3l/Asf6kCvZ
 kTxl5LJUHICIM+FlU9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_015648_060491_99B0E49E 
X-CRM114-Status: UNSURE (   9.18  )
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

Make important drivers default, so people will not have to choose
obvious things and few other re-organizations.

This matches my other work for Qualcomm drivers (clock, interconnect,
pinctrl).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      soc: qcom: Hide all drivers behind selectable menu
      soc: qcom: Restrict drivers per ARM/ARM64
      soc: qcom: Make important drivers default
      ARM: defconfig: qcom: Drop Qualcomm SoC drivers with defaults

 arch/arm/configs/multi_v7_defconfig |  11 ----
 arch/arm/configs/qcom_defconfig     |   7 ---
 arch/arm64/configs/defconfig        |  18 -------
 drivers/soc/qcom/Kconfig            | 103 ++++++++++++++++++++++--------------
 4 files changed, 64 insertions(+), 75 deletions(-)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260429-qcom-soc-kconfig-1b9b31d9702a

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


