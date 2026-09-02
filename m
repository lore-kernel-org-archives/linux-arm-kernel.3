Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC8FC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+W6tpccLyWv9ClYrckcY6BlDCEvf2HSTQJWRxk+QBXg=; b=nfQVYs1k1y66gx6VS/ZE0yvS+X
	dY4s/7O/vommxAOWwJltrBh/217WYGQ9mRSLH4u+glhKepboWWxennqxgzCmwmAJbUALhe/Vj4h7f
	+6RNM0Pc3U/xDYD5Vr9mEo7YBpHZ2//2ij5gbFNZqOLZ1BILqVMAdOOFiLR6ED9GO1B446eE7IrKF
	C0YPFoNEomrfa2xmptjwgjURV4IzDQdew6serYJnbWz7j9kLlCY6ksC8Lf52JEXHGkUheb9MPrXTc
	MtL+9Osf7EiPvNOO4Wdhu3Ppm7etl47MHSACCEwfIM6evpEOjQeC2Xz3MPrMQBKedoOjUHanA3GSM
	H070/mGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rOm-0000000FqYc-1lLD;
	Wed, 02 Sep 2026 20:17:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rOi-0000000FqVT-1txA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:17:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KH9CU2523712
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+W6tpccLyWv
	9ClYrckcY6BlDCEvf2HSTQJWRxk+QBXg=; b=cHASjO9nJpDVndRqPqR+0ZBZe5y
	S5gqMEV2gnPj4s3n6BEV7NXgRHhdxo2t0J8shBsPe84l25uRRQorpCDeYPC6YnSC
	OKft0Zbq2yoHiHs58iPdkdcmhbsRlnMhwhCK6oxRoW38JR/QJC+pBGyumeR96CuL
	eKNmh88z2yaKScZqwLyJ4LQFBMLCggSJLOZjPef0vdX5LM0qiJrez8p52ZABeQ4m
	fH9g0Es37j/K5/wBfk5+csMuAx+ftxFpWvhK3647Iizdm4lZLTNWKEtdJr3OxbGA
	ohXjXcbEau00q26eI9i2SFV5O3n3QlU5c+RrvTAgZrmy0HdwOiQpjGX4dmg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s4k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:17:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39906175917so2009410a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380246; x=1788985046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+W6tpccLyWv9ClYrckcY6BlDCEvf2HSTQJWRxk+QBXg=;
        b=GXd0wXxc63R9KO4zDn8pnhlXbLerYqcHO8Ye4/6cAMOwGE89vPGLzql8noWxPq3p0O
         LjnMUCb7vK3AGpnzI03ozvllUyPeNznuPNYur39nOVegyDxWqaWw5FkGAGG87dIxhlJv
         1gfs6G3xico992VCwBJCfnGHgSp1hSIJvYiLok46OOBlbFmy5Ib6gcy+ijH3WbilezZm
         5jrJD0EzVQ16u8cB+4xpDO0Q57XeDgjy2y/IFMIPGbOzHezST9YvocJSkTxcS/A7YTSF
         JoR9t458Mi3lg8btf7WVxSQNMTy5QHoU3CzaRkKx5TofSgljLKvaIRJqDLH3OQ25PFeq
         zLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380246; x=1788985046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+W6tpccLyWv9ClYrckcY6BlDCEvf2HSTQJWRxk+QBXg=;
        b=rr0OrP4NwBZdfMlTnlBVFDo7LgR5VArXufYOrLUZTh91RojuqqwYpbG3IGeXoCz2c5
         cnpk36U6g/6tSEQxNylbCd7TWnYg5Qs6iVw8mIB/BPjjECz38MjTAEX6VpWTQAt7i5oS
         M9NPq83piitC13cZVXiVH5q7WY/QLqpf7dH0QZHKxI3UBDWQ12RwOdrAYPzcKTNj4BbS
         z+LVPid+ic25NUVwJLBMO9f1ZgYt7Jg5ZIk0u2fbr3GPnqP566P6yUleuEH2Ujl/Ur//
         TVbV4JhXwwe9NAMwzboXV62o+C9a8sBTZt504Gq9qwO/ZJ8Mxnara3sbAi4pkMZrigZW
         TRrg==
X-Forwarded-Encrypted: i=1; AKwUvBxavup2RDj2PHulrZYQU0IBkNIgZz9TEm/aIMqCNW6+24HOkFhSqRR5OX5Xk5Ws6IwEdWjdDUrStXnaA0KCxe5Z@lists.infradead.org
X-Gm-Message-State: AFuF++noTC3FW90R+rFHZ6y5pRGTGSw1pI2FzRoE1qKGJMQzzrNpGQt/
	WgRQS4rbV1Cg5K0zQ8oQl/aFRQhAhD3EDwKnH87wvfV1m2UP/wPNk8BD0f78emFZchHqn+ftJIb
	/jaPY015EhcENws3+8bhFzOsXawIfjAaTSnGixpa/l5eyC7/59c4udr5S/nCqo8XYmylYphqVc4
	wMnA==
X-Gm-Gg: AYBFou2qG6Syh9lLK7LXlV2vADk6k7KuDIDf5MmK61IjmEzzpDsarfsvRubzNMM1VRZ
	UqJXVwB4NA30MCwEBQbUMaL/5L57WT0SsKE23/I/YL85hwFKNMWvcYwt5dH8H62lGQAX/hIrKjI
	FbQil5y+W0lYtioKMRxx16w8mGqaJm4mEGn+i65HlpdZUQb6h2Nu82yWh0DKNngW8II3M8SzxIc
	wzF3AySpiKfoLB3RRt8bLVxWLasoALY401OG2EGN3fHDiETWvvMbfwo7D3BEok/LWKYtXjTxmlc
	anOi7rKQlsUq+XP9PTpsu5z59POSBMf+TYJdB+OoNj1D1nU1pTAFnGzNAw98xPS/ecsufRTOSvs
	J4XM9JLYIFFTn5EeBcdHXfQb2QqA=
X-Received: by 2002:a17:90b:4e8b:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39aedec54d0mr11465804a91.5.1788380246184;
        Wed, 02 Sep 2026 13:17:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8b:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39aedec54d0mr11465704a91.5.1788380245604;
        Wed, 02 Sep 2026 13:17:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:25 -0700 (PDT)
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
Subject: [PATCH v2 4/11] drm: komeda: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:33 +0530
Message-ID: <20260902201640.2024648-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a988457 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=8sfNmL5Et35J21XlSqYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: QEBLREtWQekF-tALUNSfuv0IYpxeMudw
X-Proofpoint-ORIG-GUID: QEBLREtWQekF-tALUNSfuv0IYpxeMudw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX389fOPzPuWjD
 9zwiQOYgfP+0YvfgxMvqqKSanP+bdnVzReOAUjySUn+jQPEvaR1R70G5k0Q98EzxiWpH+xGRaL1
 kPvHQLbmVnepNhSl92+OHujLPdM5krh9YizxcTJmdyKWTpkAmBCVl4yWJVc5LAH6QQDDpoFt7Tb
 qG4XVI/TAwZ8KjBXatC484nOuTqldXBAQOD+RyWa8Tov/oy8bjnSvwQCCRdLZI8DEG7YZx/FIGw
 4FqpxoFB9W4nbblZKee9QYtHPFegHJfKnWO2hJDDfseS1Q7gVGEuERhNzYcY9Med4UlFiPYyChz
 TacA8ZQV6XMVMUhT1/9wmCz2r5ZF8kd5ALxj+OYZ//FCroB7jXE4PGBfir77IGbzaau0mPy58q0
 RxFLO6HdLRWhJ9Q9JCSF3erTMzgGcaEujaozVkZBOiDv0ZTQnTqnNeQg7UGInDXHlRdMN3KM2Zp
 CL0/aB5ba4rtATV2OkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX7eNK8Bx6i8yN
 Iqu0BRcKD1NV+DSGWlphH7vKOWNtuzHRhf62oJa4ctelZm4mExrMcH9BBlUt+WY6KC0/ePHzDUI
 wJewBHTL06W6En0PsAnDjc4eZRoAyAw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_131730_105428_523FE5BA 
X-CRM114-Status: GOOD (  15.76  )
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

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 9aad1d1d28ec..8016f5a68cba 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -145,7 +145,7 @@ static int komeda_parse_dt(struct device *dev, struct komeda_dev *mdev)
 	}
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -292,8 +292,6 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
 
 	mdev->n_pipelines = 0;
 
-	of_reserved_mem_device_release(dev);
-
 	if (funcs && funcs->cleanup)
 		funcs->cleanup(mdev);
 
-- 
2.55.0


