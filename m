Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE73C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQGNtigd/fhQj8k99E1cXDjPd48Xc/BcsE7CCfKWZIU=; b=RDKkqDhRhZyInf9QGp2mGXAd+O
	iozZcHhkoZ9pRJZVm5FYJ9zD2ysyKYv9DJS39XCw2z0FM0yyfM+O+7znwptJVuBvScRvGqMtZgaB8
	OnWr8DqZxA6HSdYBcYb76/uVT+IUXTbqhuD/F30JnORBmcNfRiEWL8R68chLVSWQdtB954ivVi3it
	W/U9SThL2np6SuMEa7ohCr/hPxwjsxhdaYP361loEjjiX3PHYG72tkPyziDA1lbUYaoP8bhAGFwiy
	4mZQ3rJC8Aj13sL0dQkphLR+9/lc4xzhNTpQamN44ABzXhhUd4rRpFabFWyiTBNm9E9ajBSU1QuTi
	MiP/+AOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rPl-0000000FrOl-0PnU;
	Wed, 02 Sep 2026 20:18:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rPf-0000000FrJp-2NfQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:18:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHEnm1962830
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nQGNtigd/fh
	Qj8k99E1cXDjPd48Xc/BcsE7CCfKWZIU=; b=n5T54EhsFCac0SeU5D97p7M0YyQ
	OQP1d0SiagH2QmIaJgTg0EzJqAasz7GbSsSPgUw2R5IJKN5KyjDdv+DO0Rik54jE
	Bw2ZYVdQ/cPd0iB5Rya3x6gJSo0zOOi5xs+R2+lI1ZraYlDfpII2Kju77CMQhqq1
	kK2P51HgZ7pos/Fkkp4EMGCSK6kQA/B3WSACwICogt3xvn0rRFQCCjtomCESoywQ
	hdJHu110huHjIB6qTqqapo0sKyxDfgmizZ5IWbyX/yMQ0sY/FvNGJGoNx8oXqqAr
	mXJHiTmzb2USb616HCS79zAQNlYwqyhwmVHKR2UWQd2CiF/orhDCnJuwgcA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4srv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:18:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d7443e0f0bso23055475ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380305; x=1788985105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQGNtigd/fhQj8k99E1cXDjPd48Xc/BcsE7CCfKWZIU=;
        b=AXqziASORTfgl5/M4hJA9at6DXt8mnxHYIoC9OcmlHIcyc4DtDqNb5CQ7ZkOdnGuQX
         XEaRJL5kkuTw4zhigzsQIqHXGi7QPGOoS8mEHcFUKK8u6rAn5FjZC7CnQEXw2gpE8YNZ
         Q2RTZNtoUM+ff19CtblvCZNNmqocurF3hcXI0Bl/bZHh8Ow55tWVYPXPm7eizlWJi1Nu
         YFenoklit4hDFE9rX60pHeONVawR3q7AooJulEzhEWfX0WVpafZnKVpJE6gFxclrOc5e
         XRsd9YvBEA2vAZjk+TVr1Q6LkVJtPOW5ktm6MSQ6sEAYxvZA3WOLUMcbfVwsMr8JIhQF
         z6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380305; x=1788985105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nQGNtigd/fhQj8k99E1cXDjPd48Xc/BcsE7CCfKWZIU=;
        b=aUWcOeZVnIW1pNSKHcrFwcaZ1gEv8H8QXThIWFuGsZAT+dTK8V4iECfwn9cJQE8Uw5
         /klzz8YAawxSLP9rXDy4qt6t11a0daNKuXAyrzCrCCUffmJfok67tDdSjJoGzpRlS7nx
         Fn6Mr0gPryMR1x79sEQEy6Ue0jREPCGyDx9BHzcPSN09ccRuiedvRmIvkVLFtWrbBtOt
         UxrrOQRjYRYqXpwncGhC7jOUWBx81fTMdp547oR6Fb95O7loMttshHpNH6gAUsyHDz1g
         F20/El/+XKtRQwGmui3qUrXZ6Ub9ebL7UKUpjg0hPpjyS98oytjCQxn91Sl3SMcZ0y/W
         6pdg==
X-Forwarded-Encrypted: i=1; AKwUvBwAUaJwQIuVXfNj0jEVVftQX63gLiUaZfwJ1YbBsMyZlUc5WQ7BQ6yo+nLqkkXLIy7cuUM581iBl6smXpcYFwJL@lists.infradead.org
X-Gm-Message-State: AFuF++lFmg10dUNiOk+HCNH2jhs0++1WEyqe8/bkL1gDKbIEKcJFDrIw
	LVLhxacfr+QxzpSQVnOxpWICpIdZ69VF80dnDe25Ix480V/Cen0ef8JCxQvZP/MNVS+j47/pkHn
	rBYejFpOEzLmYIY+XNe9xge6zP/PmpLy0AeWlGAPGDMq0TYaeN7HdjExx2SZiOt3vFs/+OfwHrq
	WlRQ==
X-Gm-Gg: AYBFou0N4d/0hD0q/cFms9JZKelK7wCdt0B5bBSEJhgK1CdTANczX3c3HKWH/bz8jap
	5T5j4WFjdIS6+IKu0KmGcU+gYetYBl1iYnAFK88Ia2JHVJs19mXYmw1VwsOVACWfYYSwfYlpQnE
	z1m19VyzWUMQyLpKMBu0VLb1jnonOHFElFqjlVCIeTC3dVAqwTJmLgia7e6Lhcei7yB4BaRrmgR
	EHPg/jRy54XDvZY4ut71WwRsc0c5JGv7QVZs/dkYq50LwMYed2+RFnlc3KRnM0SeuN/b9pVWOkl
	dPs01CEFL0SmEqeOMlMB2k0P8ukj9PLIPOBp8y9P7AK7N+F7SDrpw5MNcBNagtliHPDJWEAdBfN
	Uye9OxXnHEE+ts6Obg+Z57J2L0QI=
X-Received: by 2002:a17:903:32c2:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2daec646e99mr78475645ad.7.1788380305424;
        Wed, 02 Sep 2026 13:18:25 -0700 (PDT)
X-Received: by 2002:a17:903:32c2:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2daec646e99mr78474985ad.7.1788380304847;
        Wed, 02 Sep 2026 13:18:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:18:24 -0700 (PDT)
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
Subject: [PATCH v2 11/11] drm: arcpgu: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:40 +0530
Message-ID: <20260902201640.2024648-12-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfXzuiaPMqqgy8P
 bDJQt9gGunnOujZgZX+tW656IBEAx+kPxdhvOLsQaWPQ8LTEjvyJppmSfGU2V6ii0lKbdgWpyIB
 5dWxHcm4GHN97qRRYzul31T+ZPnNePdrsTOhOPNymUcVUgpRPiCzybu72cn/jgXDxtOuPK5rnVq
 DrXsV/+uZOhdgD00VDWte/vmZacTte6Uc6Fu9b08i82Udl4IDzgA5XeW0Y3sHtqoMUAkuM9+Xlw
 oX1tAmlLhQpJLW1Q5fxxQSrABKlQIgy9DYRoM8/Z1j6YOmgI3WJLaUzMBJdcjANREqKUFUdAEy6
 fG7Ilfrno/7VuI7mzTRkl/3I42im8L4unjkgw8BJ4tqDdWIXQypSJJF0P75vAwgtvOuunn8d7QN
 f34hYmk8QgvfZDwgcozW/voo32t/yheTbV/nB8dh03sfL+mY41c0l1j9pUeon5fIiHDD2w+PpGv
 KH/dyRtKrrdaZe6NuVg==
X-Proofpoint-ORIG-GUID: 7G2JLQSM6wXky0Wt3oRQZvCFGHrTzyOx
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a988492 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=lEtn7xO9CsvGDZioIccA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 7G2JLQSM6wXky0Wt3oRQZvCFGHrTzyOx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX4NJX7zFYhTak
 8gWNAmfSbVW1Dz8PoJZg7Z+vBQe8thZGNHWK6ENtZiqVT7ZwSmIdyBvgT9OX8WZMQehSuW7sH/A
 uJkrGchPU9Cm+lHbtCSQllrZCk31xGg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_131827_723186_7068F638 
X-CRM114-Status: GOOD (  17.18  )
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
the optional reserved memory region is released on device removal,
fixing a missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..fa01407570a8 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -278,7 +278,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 		 arc_pgu_read(arcpgu, ARCPGU_REG_ID));
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
-- 
2.55.0


