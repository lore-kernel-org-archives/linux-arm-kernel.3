Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6788FC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TYnvs+N+CqcW/5DzK7i0UN1RVPBedvN0sJ+WQweM6EI=; b=cQMPskl/S1y4lWRZxPp9tKX1lL
	k3naQ81o2NHjDUREbzcNS2HGPw1E6pCVK42SvKHA9TI30swPBjD4ZiL15xp/ZIHJ4mMFf0EFavzGp
	lmuAr8/BfoLsR2c5dLhOwcHo2qzP8/YAD/P4dH3jr4wrh10oH70D4DGE8s9kBIsEO0HzeY9MOrPnq
	qliPHPJwFbo9ihMBWZHwQB1bHlzFhoLNzKmn0ItwAtojVzjAIDrPdsfUDMnX4+Ty2+55JnY+inM05
	yamsgVU7lKPiMj1LGFx7llqisE9UnQQvmnFCYoDSJnJU6Y8OJl70QbL1pRkY12RtaEcHAmmUh4Q9p
	0E9vurQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiO-0000000FiMN-19n1;
	Wed, 02 Sep 2026 19:33:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiF-0000000FiJW-1FuX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:33:39 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr5MM1714501
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 19:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TYnvs+N+CqcW/5DzK7i0UN1RVPBedvN0sJ+
	WQweM6EI=; b=Ie4TBhiqivgoZgq4A2+TqkqiddEKzO0EVxYDvc3EcNl6frVMCeV
	SO69XNhP2XGQG9UjNuhFob4KAWMwll+a+avJECXb2hB1v9x7fAKcxE1XRasr73+x
	5JD+w/LBufHmlaHdwcV9Ngw2sP7aZBgtg/ZaxmqjhDESAUwlCZRuf7GKY+RGn3im
	DaXy1nrhYVNWfPPmqfJ3XfCZv4J1GggKXDelDr0tmTJr+hwzgRu+KLZD8EdBzkXt
	2quNT0JNV3ptRDF6GMGJxDFk81QEsaHZjEhIGFhpn75iI8DVIzdQa0raiWvY8grx
	aS3Ce7K8inSGDyWC6D+HKuZMCaEg20zo5gg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemce9sdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:33:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso2130399a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377613; x=1788982413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TYnvs+N+CqcW/5DzK7i0UN1RVPBedvN0sJ+WQweM6EI=;
        b=VFtjJ22IfJiS8WCtVIg/nXF/hV1uX3QIFeVnLBMXAqlV+vuL9CoNeGzaS5abdtrR4n
         69so1inC1BCMduAoIFcwRzX2OhWxs6DDWh67s6Nh5COOqSV9NS3sVZWETeeuUICUlblP
         jqOr8+zkjk7n9SfaSnoUpw+JoOoGdPCPiUNAiNU5cuW8s9UehTmPNz1x0oEAqcxKfRsu
         Hptp5iCMyu88EqpGO6JQjwn6S/Yu/OCYwVpiosJKDxWbw0p1YGiZFFNt2vg7cp5pqB9i
         N2O/8leRJ6gcbp7OaAs3MBxiBRuHyrPXulHGCqeHYreNBL3VijZaSdT8h9pOUc4SBcKW
         8AcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377613; x=1788982413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYnvs+N+CqcW/5DzK7i0UN1RVPBedvN0sJ+WQweM6EI=;
        b=tGkeaNvewkG1nhJ3KzM+ay4uHuMjLU16hNhZ+rF4QyJZlMHyx47iTuNfdgGal3RlFk
         73D4Mt3JBwdR6TLbgiM4TpggmrL4T7hFSZcJYEj6CVqcDjkzj4Y/hNSwZ3Kar7v9ZT7H
         Ds1zwYffnvupMlkz31tFzFExO7oIpYf2aZQauBjrI34bWZxeBzLuksTVAVpN0EdHtFWJ
         qJ6A+D/BCRUdBGHjO9dGxktrolv026F09IU9rKBjb0W4OMsYFVwieEOl8KKlUxac5ZJD
         8alu9+c6TEHiZsF5akPRAlws3SBnCaJ6Cti29NJIJ/4bGDD1P5OHS+l0NTXNpM6Ebd9I
         Rxkw==
X-Forwarded-Encrypted: i=1; AKwUvBwRJlgCCmv4rIX5C20seJRFgyXahbXbBFCbYEa38ZEN2oj4aJEr4lIH5IuDEAzgAjFz/msrVsYlGGLnYKPeNqT/@lists.infradead.org
X-Gm-Message-State: AFuF++nadav7YHEnQE0N3qw5SgTz8V5cTH4u9UynKoXWbzcMytKgeMWA
	ZBOTCRmqTa4hRY+jX+Ol/GtU7QS69/tNc6o8AIJT73t8sG+bKVYPagF5kcsszxhW4GtQ3kphuYh
	UXUIsQCqg6dJSg+VK4byDXRtAPKt9tvUVCQy9rNFiZwGLOp+MW1McCrh+TqHKX/w7JX4ghdvmjL
	Y+bQ==
X-Gm-Gg: AYBFou2+bqEsHkDA4vHPPwXxpKEWTIqST0fTOfe5oXda1R8MK3mksAwcNd/KwyPPX1q
	ttrRxGTBU8FB4GvNSpR4jM7DIvT0RXFCeaE00bRsU9x5aC/RdSF+4o+Jc9dKTFnOlxr8X/XXRG+
	d7Wz9u1yyNuJ9ETUwfYoZKyO7uruTBoohwtjBLzHtafmzT+7Nyi8xCMpF4kh8C74zFYq6sXkm7l
	nqtBkkQlI+SZ3J9Um4k1+yZYryai+Jv6GfziXi7V20GkDiDdpYuWPocLGWKynX5I3dEf1vGST0K
	G4WzAORHR7ZzNAt/fwcaBAq9Yz30SEZDiD1/Y2J+h0ZIFY4417E5rVHeXI86kxqfzUqu7sua528
	RMNkHjCpKhwywwY5R4FF37I6R9zw=
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr11480492a91.23.1788377612207;
        Wed, 02 Sep 2026 12:33:32 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr11480435a91.23.1788377611618;
        Wed, 02 Sep 2026 12:33:31 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:31 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/5] remoteproc: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:13 +0530
Message-ID: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX+RIMm95OeWqr
 gkqAwUwBe355tCi7I1+E30+Lu8Z1Ft7NkhALiwHj6IBs/mISpjc8VVCDPz+O2MTVAz8xJ7YGKTm
 993T+wnxXT2aq9gTAIamped3gLLbBr6fpBduv4mGQ9SfDyMbpYyAmI9kScmsKiTwZNgJl7cyUgo
 qv3re8LxPhsOriQAjjitFm+q0EqQm5xnUhSyNUW/ZDLegHVmHVHCW9H9R94Ax8LW155a1trdfFO
 6w48sQnw/2WUGVnSM/bpIp92RCXQFreamvhSs9cYn5TXYqvHdolbcIRBZ1WWWLzNR9mCSrCExA4
 ox4ofmo2h5IGuDGqk10K/5oBa36RK1My4dwuob2fFe44mVTE+mtr5zvCL7bnOGbC/owJKwMWFeN
 219UHUiCWTndFeCcf/nhvQBNAuvPxiHmfZ9FkfxheUPELHkHDRByU8hCCoVQD0iBvSkhAN06wXa
 YitLn8rpBxRlh7Hij3Q==
X-Proofpoint-ORIG-GUID: B0S94_KbJhsrbPCgswpqlC7wt13aFzMb
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a987a0d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=prJGSMnC0dN4-z46mKEA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: B0S94_KbJhsrbPCgswpqlC7wt13aFzMb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX8Trai3ACR2RM
 rq3oGfL9q3sbf497UcZedn1qORlz2ZXXeQM7mqdvur8t1gj81m2Yzq8BAte01JysowrJd3/mgRS
 0Cu+7bA4SQKOLUXDjkkft9lnEZMa6dA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123335_397203_6DB5C57C 
X-CRM114-Status: GOOD (  13.05  )
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

Several remoteproc drivers manually allocate a reserved memory region via
of_reserved_mem_device_init() and then pair it with an explicit release in
the remove path. This is error-prone: if any error path between init and
release is taken, the region is leaked for the lifetime of the driver, and
the pattern must be duplicated for every driver that needs this.

devm_of_reserved_mem_device_init() was recently introduced to handle the
cleanup automatically via the devres framework. Convert the affected
remoteproc drivers to use it, removing the manual release calls and any
wrapper devres actions that were added to work around the missing helper.

Mukesh Ojha (5):
  remoteproc: da8xx: Use devm_of_reserved_mem_device_init()
  remoteproc: keystone: Use devm_of_reserved_mem_device_init()
  remoteproc: omap: Use devm_of_reserved_mem_device_init()
  remoteproc: mtk_scp: Use devm_of_reserved_mem_device_init()
  remoteproc: ti_k3: Use devm_of_reserved_mem_device_init()

 drivers/remoteproc/da8xx_remoteproc.c   | 10 +---------
 drivers/remoteproc/keystone_remoteproc.c | 16 ++--------------
 drivers/remoteproc/omap_remoteproc.c    | 13 +------------
 drivers/remoteproc/mtk_scp.c            |  3 +--
 drivers/remoteproc/ti_k3_common.c       | 13 +------------
 drivers/remoteproc/ti_k3_common.h       |  1 -
 6 files changed, 6 insertions(+), 50 deletions(-)

--
2.34.1

