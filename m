Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC3EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 18:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uNyxdOLXPvrnl8aepSQH6tOHrLPu9lyqtOJV4hZUZBM=; b=LiqDPvsT7dgNZt
	FPSoHeCPJiD+n2Vp/MOeOjKA7DZDL1pq9YYgtNJj2Q/geqN0HIcLxctzjpZGMY1s8y09715ax1xta
	qWDxqAID38+ReSaU8aAPSkPlG9lrMZsjp1zflXPztutqqQdkRihXxQNQrCKlqy1y/Vj6EHM/3COpD
	Rz00zW4SjRIdnrINxfIIVXS3rRo1S9NnXDILk1xg7T3cCjqUt80ngyVSDPPuJ2RPUJvyTBLyyL9XP
	ovOAZNvThygNzO1xZhL0MPiA/UeTOBvunbJi6hC7ofhq76K2x9Pw+o3wnmIZ2hHIIDmgj/sy8NYFU
	xf82SrZJsXgfKCsez8+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduBB-0000000DGkE-1qjg;
	Sun, 28 Jun 2026 18:24:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduB8-0000000DGjr-3eJH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 18:24:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHii5t460856
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 18:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uNyxdOLXPvrnl8aepSQH6t
	OHrLPu9lyqtOJV4hZUZBM=; b=iHB71d6a12wWorhyr4tE4zsiS50LJiPXqDQgrz
	L7hOht1Dhr3qJWpbQ3/GAvP7yX3fIp6i8ZSi3RavSnXRfI2kOQsN5H7pv8n0hZOb
	T8RFEht9dYmUwbghDklagUAcYufaB7lSJLnyuspWTu6CJFICoidN9x1tcwBmv/DZ
	5Z0/Z6Ui3/QJkhUCJftuMdl6bvWm36Hq7iJtMiyE2MTtkH+BdUSO1AZe7XfBxBxW
	DazyYyEcI7AmLRaVuAiz9peRm3diJ68qn3R9aZJfS2dTUL4P5VFI2/iMDFLt6Pid
	Uj02lbujDbPi++rh6pMAKarqtaEH73lglxm5Nbz+RJGWV1iQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tuuehu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 18:24:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c5b9f6a51so1828139eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 11:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671063; x=1783275863; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uNyxdOLXPvrnl8aepSQH6tOHrLPu9lyqtOJV4hZUZBM=;
        b=Mh1kndsP7CkW66jxtBd1ojDU4FI3eRmI+gT2dWvXNjxxhV0sagTKQXuCT/IoVpL8uM
         WUpe6ot2pCdlI/4DHzHCtfYITHvAe6wWJB/KFftlx/7lXgAWzXTMe8X+BqEI5Z/A2qTo
         ypWYL7XGVcsWXR82ySSxHmxuEYp9Wt+DGjYBcOsziKVYnx1nRzSi3AkK7ytCcz3IXx1i
         BRPnsIwxELBdi6xd48oHS8+8ZMgvai9UMrpu4X+YjHt3l8S22oYjYrOstbsrPrQWHV2e
         aRRGh6NSSKqWEyzHuu+ytjXMVTZW6zGQZybbW/qzVHjJ9pycqjaFJszal1X05s0Fxp/5
         aF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671063; x=1783275863;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNyxdOLXPvrnl8aepSQH6tOHrLPu9lyqtOJV4hZUZBM=;
        b=JXam+YQbns/V43FFJasdeBrh6wpeH/0He+wJ8I9G47lichHNwcQ38jzZ1E9pQX5sj2
         +bpflnDlIPftuWqSweJ0uaqetfh9phgchU4SDQY9akvgz+mJNq1UHY3u1h9t7D+A8EJP
         M37ewVRsER0ql0SU3doR6jYM9JjpBtIzC98NuSEpEHgkoKHWaoI4ZOpsyUL9ATF9VQsG
         p/8qOaWky+2t9hIOvp4jnZv/rlhpg4kqbssj3UASSK9OLBLkRtjp+IBoqo3UrCqv//7+
         VzqVKUQiOvga6HEw296XFJtmaczopjpBXd3t+TT0i2XjpTQQME+bqFYxNdApP+b+1p5E
         JQCw==
X-Forwarded-Encrypted: i=1; AHgh+RpwR9oFZ0w0nKrPymHX0hxZHMWPIak83yfidreX3U46Gn4sPqjnz56f2OQsDW2tb19ANWusRLLEwefNLMTwXg4O@lists.infradead.org
X-Gm-Message-State: AOJu0YywyvKcOvuIafzbZGtFK3Ve+i1BmbmQ1nbkBpIszC69t9szEGzr
	MuPvcVRD2x07BSe9LrC2h632xk8i15jI5a3yN0TGu4RYtokRVNGDx8cbCoM0oLyVGi4qMkoAoqj
	V5dt3ozMVn9Wy/SVv3g1Krlg+cyrJ3U9ycWLtL4H6F7ZL8UlBB6DYdFQbrpq+6envbyYoYuND15
	xoSw==
X-Gm-Gg: AfdE7cl/ruatBKdFnQwBujHxWobfCJwDP49FsPESJLLC+EA0rZQ3VsIN0WlhhLDI9+M
	einl7NO1G2ux/loSwMDnveaXKsqcmYFZy75nzot3B6fPb+HSSQlHtQHiP7X3RJopsuMhMOfvQW/
	pJyF4oAznLKV8xS2TfQa8/nFNgM5eKOfEDM3ObgZp7ZTnDTUdva5POBgW/9WSJ3XcI5ufMP57GP
	TRICrzNzvDO1jhXIbSkLHz9E9esygx+UTqz3gTjGuPvqqxDI7pynSiUtel/yef2liIqpmDt5H/X
	dicWix6LR1A/y5cW1LLoaxXO5qbLivYTjeiTyM7LmdNzdnh2wsD4DfEgB3Eeq8mfy6we56a9+/E
	WoSwgHW+9d1BKuDeXMbSMNnBw+ODSJ7a4mT8=
X-Received: by 2002:a05:7300:ec18:b0:30c:ab96:7306 with SMTP id 5a478bee46e88-30cab96771emr7743509eec.22.1782671062555;
        Sun, 28 Jun 2026 11:24:22 -0700 (PDT)
X-Received: by 2002:a05:7300:ec18:b0:30c:ab96:7306 with SMTP id 5a478bee46e88-30cab96771emr7743467eec.22.1782671061966;
        Sun, 28 Jun 2026 11:24:21 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:24:21 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v3 0/8] drm/msm: Add support for Shikra GPU (A704)
Date: Sun, 28 Jun 2026 23:53:53 +0530
Message-Id: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALlmQWoC/43Q3WrDIBQH8FcJXs+ixnwyxt5j9ELNsZE2H9VEO
 krefSfpVjbWwW4OHNGf/3OuJIB3EEidXImH6IIbemzSp4SYVvUHoK7BnggmcpaziobWHb2ih3G
 mmUyFbkBZZguCD0YP1l027G2PfevCNPj3zY58PX3IRE4ZrRoGrDJKc569DiHszrM6maHrdljIq
 kXxTeDZD0GgIKxoeCoLk1r9QFhuAT2cZxxyuqUkWgWg6yU31UkPl4nefJGvA3UQgtpWUCfPn9H
 L+8fGUD92WM3pGGjM1imkAYtzCID0V4aXP0guvshmojFHJte50VnZaFkU/2aYvDMujBgLN4M1S
 gRLwaTlTFQp5w/A/bJ8AHPEn0AJAgAA
X-Change-ID: 20260609-shikra-gpu-5432bdeaf0f7
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=3664;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=75L9Gwo4Nbyb7dmgSjP5dJBoAyyIjloISpF52plkp3I=;
 b=PgRzW4o2SddLK47Q3Hm5eNNFLiSkki9yVLGnmz57FrcBQ8JSkSDQa680Sqq/oBzheZtbPJobX
 hxTLBJgd66XDIsUa5+sMHBz5AH7d4P8S6U7bNs3OOxACVuEo85A2Aam
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfXzVQdS53hsjMC
 vUB+Atpxo4/PRPxCoBHB/t8z7AVeBm3R5MmInYNcgUW+n5m+YCvoQoHiA1cXdgbxp21aHnDcEeM
 VNbpMXhGd0hHlYe2Gvh4czgN+mFJc8A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX5hweqLllLL8C
 /z8UH9Ha4mWTJYIrd4qJ9YW8R6Y8hcfCi239Sxptu8a/AGVcILcE/KyayT627iGyFbsBF4NCY1c
 MXvt6AbsHOgXy55cVSLO81EmQbZxlqv0bCkzobhSTGIB9CFv1SKtPaN1Q/9GfYW89BgGeeerczc
 QqIO6iQF17qrB/yGOFQXq0MiEOMO9Mh83g2RkrZK1aIGmUVzuwLBqlgtSFN2qDZ0TyyEsHixxiB
 dzEBJG+GEDnmj++YzPoIeuXUAE3pp8hh7yF3dTFST9UU0eZrx/01czufcIIh9MD+wAe+XA3lsAH
 qcvdFnoKiXVsOnC4MsiURuV1/YeDiSqNerGpNKs/QX4kZ0/6sNaB6MeBOt1gdAnuJJthd5yhrpm
 12C/gXzQ1ZGNzITAzA55mh7u9KGTS0docu/Y8gnUBoX9ZvO+hJbhxLo4orGgSSSpsbue8S9rQ3c
 TMzFEA4oGbGe7wyd5fg==
X-Proofpoint-GUID: qzoBLDCS0j8CT-pvkccwHiOWERupvWw0
X-Proofpoint-ORIG-GUID: qzoBLDCS0j8CT-pvkccwHiOWERupvWw0
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a4166d7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyemgOkiUGGnp4gUInsA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_112427_060731_28BB291C 
X-CRM114-Status: GOOD (  15.87  )
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

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very 
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Mesa side support is already merged:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41762

Included the DT bits in the v3 revision.

-Akhil.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v3:
- Rebase on top of next-20260626
- Included GPU related DT patches
- Link to v2: https://lore.kernel.org/r/20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com

Changes in v2:
- Add a new patch to document the GPU SMMU bindings
- Capture trailers
- Link to v1: https://lore.kernel.org/r/20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com

---
Aditya Sherawat (6):
      dt-bindings: display/msm/gpu: Add support for A704 GPU
      drm/msm/adreno: Add support for A704 GPU
      arm64: dts: qcom: shikra: Add A704 GPU support
      arm64: dts: qcom: shikra-cqm-evk: Enable A704 GPU
      arm64: dts: qcom: shikra-cqs-evk: Enable A704 GPU
      arm64: dts: qcom: shikra-iqs-evk: Enable A704 GPU

Bibek Kumar Patro (2):
      dt-bindings: arm-smmu: Document GPU SMMU for Shikra SoC
      arm64: dts: qcom: shikra: Add Adreno SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   2 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   8 ++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   8 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   8 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 127 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   2 +-
 7 files changed, 155 insertions(+), 1 deletion(-)
---
base-commit: 10a31245d8ba950c7fe87face7d0c190009cb572
change-id: 20260609-shikra-gpu-5432bdeaf0f7
prerequisite-message-id: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-message-id: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: ac83151a889855498d36288ddd36216d451340c8
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
prerequisite-message-id: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
prerequisite-patch-id: 67fa5f31ee5109470da23db3b513721580f4c86f
prerequisite-patch-id: 0e79e46bc5a88849a2f0a410b39c08f3244dfed3
prerequisite-patch-id: 0396ac157aba73a5afd7ba4a8a744847f5a7b433
prerequisite-patch-id: 2b1aecd97b9c073a1b323138cd7a98cb34e3715f
prerequisite-patch-id: 823bc7bc713f6fce1b9de47a266307f1829636b9
prerequisite-patch-id: 8a8a9df61f7c7c51d7ea9cdacc52b7bdd917f12c
prerequisite-patch-id: 5b89b41d7c729c23b3b1fff9b5f572f4baa915ca
prerequisite-patch-id: acd08e91e5e2c6f4799879e48481b07167c0a400
prerequisite-patch-id: c9f2942207341ad4f450b20f049199f35188c02a
prerequisite-patch-id: dd62ebff6be6a2e2d32743812d35ec54daf91d00
prerequisite-patch-id: 3a6e9752793f2d7b084008b47daed10ea572064a
prerequisite-patch-id: 3338cdc5915c1e6b991067d3a7afb734c182663e
prerequisite-patch-id: a3026c858ffdfd3bfafc837e72c67fffe46021eb

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


