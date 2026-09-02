Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA60C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=46siBCCvcvlpzJgw+UUQdDmQusxn/J6ohahT+j6al9s=; b=39tBIdqo5fzWBiNhLVPKhUXd7i
	hRMRrXI6OBF7TuEW0nmhGIsVXgsVJUEFRvu92UrC6z+GWPGVBRruhEAABCKCDMasP4qsvyD1BMg/a
	zTOXfeaBlwFa7jyBBeuKaZ5+uhDfcJWmCkfod8uh66DHKfONwbrdkkQ3PD0rCszLuWCjZC2ATfroY
	vOt7DFpsT8estSYxrjcyMsCwOsUFERSbysD5D5I7sb46SL1fXtDN3yB9Aq8iXm0vZvoCmp82p2xrR
	NoRIrG/idHhFcQINQv3TLZ1Y26y9l9qC3+hs2UOxSwr+3mSlIq32l/zToXMO0/42nsWtgZBdhS3rY
	Ru/2DDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rOD-0000000FqHE-2V3W;
	Wed, 02 Sep 2026 20:16:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rOA-0000000FqGY-3iTY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:16:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrEa52210063
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=46siBCCvcvlpzJgw+UUQdDmQusxn/J6ohah
	T+j6al9s=; b=WPo3DI7A9bAW4tlVrg0bqu4V+styJyUGUWS5W2JZCHN1MQPiTEi
	B/GveQ3mT/MrXBHqngiJvivPBht8vzfcWMVEe4SKqmIWxL6trNRvOAqeBCQxa9Cr
	CWxC7O6PRXcoIuZHFmx9f3HHaBfZ14Fm6UC9YMn3bMaA2GNvqkFiKTdYJzVrn8z0
	hJOGd1ybUsWB3nmQ5aLfFb0YTMEd1iqn7U0jVHt4/SGXznL8v5A7BR7nOU0B/Gyh
	gwvi2r+y7o9EnlAP8R003zg6xp9/l3tKssS7AOrIDul135GXM5UYereiVFD5t9Xu
	q6VoVNFAk528wRFtBLUFlQ4ltt5gNafAp0Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s4hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:16:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so2019434a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380213; x=1788985013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=46siBCCvcvlpzJgw+UUQdDmQusxn/J6ohahT+j6al9s=;
        b=UHctmAmL9HenkuWSLPBcJYs2B4u7pg2M+kozXjDqJxlrYifQOY1ow4yvnsRx0wD7vR
         gTjAQoTtcbkqATmOPKnthS59zhwxkLydWkibWetwiHHGi19yHVwbiL7TXcfN4kQHcvVE
         F2Jd06UvnjsODAyuPb9o0/0iewC/K4u5Htc5WsyMlLfBB2eAmSKpCihtRqrH/UL9dmEo
         /953vtjoJ5cY9o1jXySwCp9JQW3jPfVPDYMwLfsbqepD2LjgkhocmTlYsJ2v+LnzUPcm
         hoQ+tzCt4JCDxg1p6zQAWY/ziUM6x9/w3WP9dozha4YoZhw4s5qI1NuntkC86ElJNAEr
         L5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380213; x=1788985013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46siBCCvcvlpzJgw+UUQdDmQusxn/J6ohahT+j6al9s=;
        b=EusLwg1wghrLg35upLfVRtbpb2qiCYDVlclQxnaFLQu4lSxpJVmBMpRDXXQWKb4hUh
         rHUFcdUEf3fjHF/7I1zRMi4zLWeTqzVzyJuoK1TA3mwUJLB/W/13iK1z/zCKJP8QVdNP
         69xePAETLEvymg2u9JZqowLio++h19YsYOiaK4So0PKKNU1CPNCN16JhDId9LURruNNV
         wn22L/OYpcl+d/Aw5090LiYH5cy6v23axdLLECnBTBLOGxOXWNTHN0r0ApPiOf90+N1S
         ZQGnXu6eGKVuYWYhSSkIewamuZaEhcQjRtBS6UdRO1o9AzED52Azrr1iac9OtPkwd01O
         6OAg==
X-Forwarded-Encrypted: i=1; AKwUvBxVR4OUp3+MRGPIlC4VyePfJ1j66a9aHlp8oSn9xiaoo+Ddt+LMOxT7UH6I4+/9dREEqJh3kkrJ8eB46ccKb+qn@lists.infradead.org
X-Gm-Message-State: AFuF++nbTSRX1SGKtjASAUorinBOUGEck/aYUEWHSXQYA4jU3hf4cjkv
	DPlONpDw/2iBJ4kDeOz2AHdSEZ4XzWGHmmXYmiisEFqUVkduLqr+KfzXxFb6CVZbfW+L8J+fanh
	YXCV9jOnVzInSLzUf/saDkk1hmcyI79doz6S2CsIV+GBSyREBZmZbwqssT3EGgwFef54qiTuNj4
	sgvA==
X-Gm-Gg: AYBFou2XP0oQPwNG0xaRmxwV5z5YgOWjlaaYQLf4okmFwGkD3XzJVTrh3wUqCZnXoDc
	bQv8MfYkmy/owkya0QBWr1i8oDKY4p+2FskSPjpKuqhv/7BPcsmZBZMuViQTk9yPEHwNTtTInmL
	e1CcdmM+JYStXhspAsF25/CQHnd1r7e6n5UqF6qytl0Gg7BnDXyhkMPYX5ziDExne9sJLH3GcGV
	IFDg29CAtG7rKjoddk5zclscAXopLZiBHfsDR3kQ7+OTpssEKB8Qe8CCo9Nmd1BP8gHHchpQrVJ
	BlgHw3qEaNPbkk3rb9QAMG3Rchkhaxb9cctN4bBqr6JeYUxzxYxlqy3zw6nxSbtOPN+Jig6sIMR
	stqk/EjjLqBSB6Fx6uOurlmLp7GQ=
X-Received: by 2002:a17:90a:c107:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39aedf7c6bbmr11956088a91.1.1788380212445;
        Wed, 02 Sep 2026 13:16:52 -0700 (PDT)
X-Received: by 2002:a17:90a:c107:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39aedf7c6bbmr11955961a91.1.1788380211806;
        Wed, 02 Sep 2026 13:16:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:16:51 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/11] drm: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:29 +0530
Message-ID: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a988435 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nZq82LKI3H6k8voUjgcA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: nK9pQLr1WfUsUCTS9023p88JT7ViEWuM
X-Proofpoint-ORIG-GUID: nK9pQLr1WfUsUCTS9023p88JT7ViEWuM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX6R0oZUTB1bC2
 VZ7UB6ESzVe43lCBzLn/+zuIcHOY69DgD21YuzSdhyNJ+e6j7eOx5enf0bBD8TcgQvq1KnckwfV
 8XfGJLoWd+SCtoDaZPWu5pp6ljVS5ajIangaYXDjumeXlibjX36Ko0A5BZ7TuLn5MMoxeQsrolo
 rvMlxVznpoBUs4jBh1p31h/A4SOXPOPfxWBP/zJw8J5YkVXonGO6Qlz53XQ7ay3rdcunHFmFgmt
 C2YpFhDRjZebqYWcTC8JjBKc1cwNUFdynObU1y0e5rN1jC3i1kE2U0hiZlMvohLTuSzYz0AzcNv
 gbbS8R2ztfWRex1rX1T0wAUoQJxSIPCqZJ8C8MH2qiMeeWNFu1qlwScoZ5rjxLUGswD7ayTs5wa
 kvmVlPSAJk5ssOsXJy8boZUAiUh89vYqz0tToDi4tkMbpEQQwCH7jXrJ6ltBSjbtH6oHdAwJtA5
 Wwc7oXsuxcibUqfC0nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfXxP8mOSmp2eMz
 LbA3y0/BLnXf1cpcxebZ6GSg8VVEHx1se6wwn1AFz/HTLmIJejwuKLofq7nxxE/vGQ5ft+lsnUu
 wG05r4S9vVwbVkqEo64NCow0d3g3d5Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_131655_054374_4851611A 
X-CRM114-Status: GOOD (  14.20  )
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

Several DRM drivers manually manage reserved memory lifetime by pairing
of_reserved_mem_device_init() with an explicit of_reserved_mem_device_release()
in the remove or unbind path. Missing the release on any error path between
the two calls leaks the region for the lifetime of the driver.

devm_of_reserved_mem_device_init() was recently introduced to tie the
release to the device's devres lifetime automatically. Convert the affected
DRM drivers to use it.

Note for drivers using the component framework (hdlcd, malidp, sun4i): the
previous code called of_reserved_mem_device_release() explicitly in the
component unbind callback. After conversion, the release happens at device
removal (devm teardown) rather than at component unbind. For standard CMA
or system heap reserved memory, this is benign. Drivers relying on custom
rmem->ops with meaningful release-time side effects may need to retain an
explicit release in unbind; those cases are not known to exist for the
drivers converted here.

Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried R-b tag if any.
 - Rebased it.

Mukesh Ojha (11):
  drm: logicvc: Use devm_of_reserved_mem_device_init()
  drm: hdlcd: Use devm_of_reserved_mem_device_init()
  drm: pl111: Use devm_of_reserved_mem_device_init()
  drm: komeda: Use devm_of_reserved_mem_device_init()
  drm: malidp: Use devm_of_reserved_mem_device_init()
  drm: ingenic: Use devm_of_reserved_mem_device_init()
  drm: kmb: Use devm_of_reserved_mem_device_init()
  drm: sun4i: Use devm_of_reserved_mem_device_init()
  drm: xlnx: zynqmp_dpsub: Use devm_of_reserved_mem_device_init()
  drm: aspeed: Use devm_of_reserved_mem_device_init()
  drm: arcpgu: Use devm_of_reserved_mem_device_init()

 drivers/gpu/drm/logicvc/logicvc_drm.c             | 21 ++++++++-------------
 drivers/gpu/drm/arm/hdlcd_drv.c                   |  6 +-----
 drivers/gpu/drm/pl111/pl111_drv.c                 |  4 +---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c   |  4 +---
 drivers/gpu/drm/arm/malidp_drv.c                  |  4 +---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c         | 13 +------------
 drivers/gpu/drm/kmb/kmb_drv.c                     | 12 ++----------
 drivers/gpu/drm/sun4i/sun4i_drv.c                 |  4 +---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c               |  4 +---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c           |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                     |  2 +-
 11 files changed, 14 insertions(+), 76 deletions(-)

--
2.34.1

