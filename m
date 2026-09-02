Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD83FC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6HQDZCYEIMsyPfEAWg93U0OzA1bvoHTLf63dEO3qvM=; b=QIIXwTrK0y137FsKOjm9Rp+jeL
	+dPOoMO3s3M1XYDbQ2YDdSslybGUUYBS7GbzHfVBpdZJX0uFoXgZFzwdqi2J9WvQQ5U7Ls+iclSm9
	wXWW6AWuVfafTjGg6Ky1syFaAt9mLBIU7Gv4Shj1T0ke+bcZ5MfqhIIkV7kNsoecbcKLSuuNEJLc0
	ouqP95dN0HEXaknQCvRvlpcWBilXIDx3bdwB8AMEv0ZmsXdaicmK0xdDz3MC8fhNwtWaPxHFuEATo
	Q41W+Azs0ZlGbIR33tQY/R1i5Jh9wy8MUS+oiMGsrzj+7ZW6++ZBT71zt5XTkRw5RbW2XqSZfSr0m
	+dQtGaKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rPc-0000000FrGw-01EO;
	Wed, 02 Sep 2026 20:18:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rPW-0000000FrCF-3sAr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:18:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHR7w3044797
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c6HQDZCYEIM
	syPfEAWg93U0OzA1bvoHTLf63dEO3qvM=; b=D4/xxysHu6h5JqhAcumyeOuS3B8
	W8HHU0fAh48XcC6p1FWpCc2Nbh86TBNshywT7oaRRWlnNNGj16e5t8MJkIl0qkg3
	QlE0KLApseLXQGMF/TkpZph7x6/qwS3VGBhQ1yQaaay0gsb5lbWSfZKY5MwXlzPO
	SWK+FZWTmf61Vr2egMo37bFGQmD2M08uWW4WJWts/XSXmNiEpoWQj29wYB3AnRMG
	oerW2EcPR842lQMgQNkheGBnvx4wVE9HKfFPSaEy2lHtx4dN+TadUgisT0+mDKZf
	MpZfNS0m23xfe+zQsYROXrYO9VBk7cxQv3AEwOItzm7SU2pEAXWFA+pi+RA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy2tbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:18:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso2198565a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380297; x=1788985097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6HQDZCYEIMsyPfEAWg93U0OzA1bvoHTLf63dEO3qvM=;
        b=V92rBQZEVOI4CNSbPYX52ng6civYNcHUYZFP3yFA1JLpxLbGeT0Pkx9T1W80kGM1Jb
         9sGdU3Saf/KRdKUpOO2j+PkdEdHPHMelz9HdDOeaohj+xhjwMKsJGQxRJDgn0nxn1f+4
         CkOJ1Y17KgMlcCMme/A6Das+DzCfeGnUelL7dOS9hZC6I7fQdvAr6kMeZ4mIFLWhyOg9
         GkFUQvj1shGnyUXrsyBYpkEx3RwWKT9fj8qVjG5sK6JTjyjfVvcKmOHOK2O9zDzh+SZK
         P5N4pd+xg26/aUxifsF7HYHHE8S5cRXdW1EmWgWgR1tj3C95HY7tuU0QNugNLGbzHiZa
         c1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380297; x=1788985097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c6HQDZCYEIMsyPfEAWg93U0OzA1bvoHTLf63dEO3qvM=;
        b=a6rjZiu7JKQwzLkwAJjD8fUj/ZyZ0V/6H+Uw6RqtKNHOimZ3jvFQuZpBM3A33r/YvO
         XP+QIlfZhsWoXocfpuB7GdKeRjY4pfX+l7e59pGFf/Zpd9kfsyXoljK0m6kMNZeXj+CP
         7k+I3ITizgFlDECGpyiXscOVYB7useR4N5ht3+4+GQ+Z1eFVYIdfEf5+DV67/k/3FAmC
         6xNamHaoE6CribqCdth4OhjR9L4v6yI+GAp2aiGVZgCumDnNq0NcArQeMmhchUM9ZdLA
         m1gMZBbp1oCjYBXOK5Ui11vU1TVTzHIgHmq4ETyWyOc71/ftUQi4ueeX+iYd8zppZtQa
         dJIw==
X-Forwarded-Encrypted: i=1; AKwUvBy2TdapPKl4Aw5DMchIyZQ7QfY1WhZ3MGOwRq7Z4KdgHFVmGrqy0X3WqUQ38/PJZhArZlvv5Oclg3jD4aNJGXoq@lists.infradead.org
X-Gm-Message-State: AFuF++nuOhf+ujNED4IxlGLyRWxBQ6KDDNgdemqhn3/jeYjuMazckSAv
	AMmx1UXXoOx10Ok3tKzsIHgdxlxCJid1mpGOdufQiHXJzQHz3e6/K8d2NNuGPUxAGzR8Arej91/
	DVswXNidLeH3dTWsFY4SzqvIi3s9FFmYP8Higk03qNBNye8z77ztrp6f6KX4vgBarQL3qIfTcia
	q+4Q==
X-Gm-Gg: AYBFou0SKHwd3Qh5oVoVxCoFSdOYv7+hxtuQNX0mcOQwL5EERXJnNo7Dr1OvpGwzmoV
	FurfCB36XjRmH4+IXbsyM1qUfzt/jiaL1v9JFXozb060erJ3kEtgpFPxM88ODTGhWJ5Cnw0MO83
	9fwAn54m9/b+49Gbf9Ljr2ssygyqDAt1ZCyw2RSUGGV08gxcPPxUE8evwdqGuQ2VSErwvOr2Lno
	uai4DMFEz7+1rkZcVHyA98fPbwOZ/uq+zuCobXEXUQdIXdpAiDPGaevw1hBHDOgHB253MWWpQaN
	JU3Vl6VbUE5a9VhUoRgWc4zpqy+Kw9d06NDJBUBiQbsoyCyPL4jRBtFmSTUCz4HGhOZi9H0HUwt
	sPIjQ0GNg8BNC0JJYJ0UNqxvLuUw=
X-Received: by 2002:a17:90b:33c4:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39aee178de8mr9152942a91.21.1788380296972;
        Wed, 02 Sep 2026 13:18:16 -0700 (PDT)
X-Received: by 2002:a17:90b:33c4:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39aee178de8mr9152869a91.21.1788380296440;
        Wed, 02 Sep 2026 13:18:16 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:18:16 -0700 (PDT)
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
Subject: [PATCH v2 10/11] drm: aspeed: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:39 +0530
Message-ID: <20260902201640.2024648-11-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a988489 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: oNOn0YW3qgjyZ2ld5zajNsrbs-q92Vcb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX4g9TUqSsv9Qc
 7CJbhWKwzR7UCLIRxth3BRWwk+cdf3IK2nt+1TGQiopVXwdQEqhiWksUPcWlRX+I12EizFmv0if
 7D06zH3NSgZwkuwkIC1mR8JUv4OmGcA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX190g8JTn7L0+
 wFiqHOeF8pIHT1SurAyiLPOsLZkml20AVkN66cxSgDVhBVuzMYfHipuXQFCDYqKnDxlmwviumEv
 qXVomwUdPdoluq6sckv+g0uHmBNxFj8YEu+4rnviapv1Yv123ul/U7+YxzUVNZgTaEImm4VHB0f
 RMJEtSHOVfS+DLKH+sYldGZqN6E/U9ysISMxn4V2Tl4/9r6Xw/ZBHaHnuVdhJctZJq0VxCQQaQV
 T+4v11Fhh8wPsEFqEIlUPhPu1JF8rRcNAZek++xhUDP4ZqKN72TARTD3hQlC4mZYE4bEkk4yoCU
 fbtU3Y7VCPX3SdHX9fCy10UZ+YRoDp/NB2WDpAPwFwRUQFzYGS067LO+UFsbXLhTu8RD7EdxpX8
 E7weiK67MlP5LPtuXlvopFYwYXP2HLJ45LPo4wl12DTN92lQEPjMVxD2vSev1Nsu3czubUjHATS
 kZUXawgWLAJySb3fyGw==
X-Proofpoint-ORIG-GUID: oNOn0YW3qgjyZ2ld5zajNsrbs-q92Vcb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_131819_075293_CC15817C 
X-CRM114-Status: GOOD (  16.77  )
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

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index d4577663a1f0..2c7e54fc35d9 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -168,7 +168,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
 		}
 	}
 
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret) {
 		dev_err(&pdev->dev,
 			"failed to initialize reserved mem: %d\n", ret);
-- 
2.55.0


