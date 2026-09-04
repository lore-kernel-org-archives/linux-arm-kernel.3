Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62539C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Wco/kXMn0u9im/xM9AEVesGiGf2KmU+6WXQANShwKs=; b=AUumGs8I0uxy9raUsrtIlz/Byf
	v63hOIeAQy9vjB+zKklqV2b0bSntr0hWHrlrfDpJUTdgw9zYdaDL/PASQCwtmPLjaSFAOU3Dr0JO6
	cP16Fu7JoM+AeHtwT5Lywjtb59EYC2leRHvm2DqZ1SlIJ+YzBJaxuM8D3aNZzgkeuOgyKaLNZ9Xkl
	ZJrAEDf/CE+oSMx0vG7Xw+f236D7o2j4jfboTmZigHQMWI9YyFGLRV8WvIzze19dyaWRBFtHuCO+9
	tv+LB3RR5xRfuWT0I/bfW/HxZJaeolfurRu1OWZP8gZJv7V2zRcy1yq6lFx5rRl1heXb4PRasgYLG
	nUYd/knw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2REa-00000001fxX-1KD2;
	Fri, 04 Sep 2026 10:33:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2REX-00000001fwt-2x3e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:33:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIYn93276532
	for <linux-arm-kernel@lists.infradead.org>; Fri, 4 Sep 2026 10:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+Wco/kXMn0u9im/xM9AEVe
	sGiGf2KmU+6WXQANShwKs=; b=LNrNi32yS4j73C57+h6LNMvcxwU30EDl8g7Zr5
	eS+IvLjmirfKDHYJQdKmWX+s09duLT+vvLqhLFP97Vgs/9rUZZ71zZKL3LMUjvKj
	5DIlz59d4mzdYUhHr6w0t01fl6/78H/2DBG9kXvZggXrJN5yt+4xsQJCdwGh+Ch3
	vEzUewmIxRvp3u3XdU+3YJS7/6g0UPbDSk9D04EkZDP299ehdHjSG/eAndnK7hic
	3lg80R4sxoPdqGF0+HWzyEwwrro5EW5aL0muqintLv/SloYh/ekFBOlJaR9EYXkT
	9Al+wa9eXs+IG/M8i4irB9h6KLsi+5wTuAXeq4oM4/3grb+A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqd10ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 10:33:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93918756165so196066385a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 03:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788518000; x=1789122800; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+Wco/kXMn0u9im/xM9AEVesGiGf2KmU+6WXQANShwKs=;
        b=S0TU0izV5JNUXNuIY11bpDDwgArdKeFu6F8vkNXEbZx/sh+9z1DSQiY+pqtUnf8G7w
         dTzz8C9cuynoE+W39kpmhX43x+BUbpIJY3aX8Q4weLPwb0TJAEmqoaGnkeTxtg337qYK
         4ng2hz6ZqB3mshTMZ/Mfbsd4WHMreRUiI12IRc6ChjhEkk7j3OSuwr63Y2YQGGXclyQa
         MdgcZhDpLaNxFi9LY1VwS3HPvci2MIYdDOkanW7+crnybHCLXUe7OzITI2GUi0LH2iNM
         EafoU6QCCJFiiB58VTNP3qwc9KOh/06hfwj28BdDSrzDLXbEPOgbezQ/RiPeffQc9N5p
         Hpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518000; x=1789122800;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+Wco/kXMn0u9im/xM9AEVesGiGf2KmU+6WXQANShwKs=;
        b=fEbBAMm9UB+d4GqlB/oYDASOsxtyHO4Zq+H8kb+atGwI0EvgIxzY/lqNLmZv3K8mN4
         qENbLId76xeaeziJtf8Uw6SpGM/XaMOwCUqN6llZXD6Z5r9rc2TAm2LGWgAuIaArYYnq
         JYydfL9AfKadnDB3VKwXPfKmoPPebJm6Iz/+bbWrTWKjFktdLXR5kVuA4fZjCvvjTrSc
         UhIAKxWnUVvsBxZX2SUaWr4YXfFlWtY9D0uK2Kv4KLhydUEU3SofgA/wiFey3CtovgZC
         pwER4roqrq6uRQGizfBUdOXZUwdlxdbXP5essea3FUGnmk5itJUCyh8Hsgntj19XstCq
         iCfw==
X-Forwarded-Encrypted: i=1; AKwUvBxuq7bPPciX3EFrBqYZBVHR2rAbzrexLXe3r7P36B8tbCPULNsUVWtBGwEa1JSw/8wcGV4dSUpYR4J7Z/9txoWa@lists.infradead.org
X-Gm-Message-State: AFuF++kZYHLOUKm3wTgTMO7cqMPQmCExbS8g+xlFCFgEHbbUd7KueN4h
	ZROurnzVQMSxriSmL6ywrn8GvEN1cw13Z5f5PXV1UI0+m7sFCmfQSI1JIqGSVLBkWarYlWH71Yg
	8lzYjPAepPMyHQa3ODa/2WDDEH4wvmbpYUBuG5fJth9YTkRvwVUVo042e/HlUxO82IdefCK5b5e
	r4Yg==
X-Gm-Gg: AYBFou0am8C7qAKUp50AMfvaf0SXi7E9rwIqMVlBC9iYaTJiGkVRycBR0dKcjMuX9du
	aDkBXmeNd8/F/P15MPoSbANGStNC0R3HBYxSsFDaK3OFQjPJFjfkfXNKkJUJf6j2USH3k2XdgzR
	Xvuzs3UpLqTiB+EqrDBh2vpWZejpzPJviRbPLdJSLNc9oDlR9oqAEZfpasQ3xEoU6i7kjqO2w57
	FL0+nY0SoL83B2O40FJHuWyQTYSgPjAz8AbTLLo3xRmxXJPrgj2pxAmoT2b9GFH6s70h4zIGqeY
	7MBfhlrPK/ieK1O09NaZNL53NPln+DGAtZ04YrX//CUaq91HAPYcCriSg1lAr3mcMbHiqUrisf0
	NNGULSZaNc3oDZg==
X-Received: by 2002:a05:620a:4105:b0:92e:4927:2002 with SMTP id af79cd13be357-9398045f7a9mr460780585a.39.1788517999935;
        Fri, 04 Sep 2026 03:33:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4105:b0:92e:4927:2002 with SMTP id af79cd13be357-9398045f7a9mr460774485a.39.1788517999460;
        Fri, 04 Sep 2026 03:33:19 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm159708415e9.13.2026.09.04.03.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:33:18 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 12:32:55 +0200
Subject: [PATCH net] net: stmmac: initialize ptp_lock at probe time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-stmmac-fix-ptp-clock-init-v1-1-df70eb1eb04d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bsFUovpKdDDbaqlMVCKI/p50H
 JiZByIFpghd8UCgiyOfLkNVFmBX4xZCnjKDFLIWrdAY03EYizPf6JNHu592Q3accGxoNFrJRmo
 FufeBsvW/e3CUYHjfD7r6RGhwAAAA
X-Change-ID: 20260904-stmmac-fix-ptp-clock-init-b8eba4328243
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: -AnOBGWUl88puM_jj2Bzm-LThBQBjELb
X-Proofpoint-ORIG-GUID: -AnOBGWUl88puM_jj2Bzm-LThBQBjELb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA5NSBTYWx0ZWRfX1VZF86SqVtMg
 wYrkUSAgDBcWDy5G864LOwEpIdRvl13Sn9D4UtagUIKVSM9avy988atV9qQQvrnoH2HUC9q7Azq
 qoPOHZ11Ua4cv6Y41STzeRXNAZu1twI=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=6a9a9e70 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-llX2YphXL_7R2jwOlwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA5NSBTYWx0ZWRfXyvz3xCuJj9l1
 hKTlwoQsEg7Gmgl4/jwNG4ZaRR03Gz4D3/1vV1f+TFEi7iP3EPXHrwSObs/6NL40Qz/7kPROjXz
 EJC+zODVPXHWVa6snqngjP8WHFrLbvp9kOBksaQAXFb0sQGUvAhJzm9bcu+Je7jj4e3JuXTVQ+d
 uL+9v3dB0caiORfeNQXGqvJ28mbdBkrmjLKXDFfbpVZgCG5E9uv+qz9olEbZiUR5Ux5ZVXNJw2l
 DvDdVAQTbZVWTcQLxxDsvPjXWrl/efRveyJoh8IvRy5jDqJmfF6ugHnzZ1vIi6sKFAVueaBCr9h
 BpPNSsu9CfV1QgswfscVKaN4WIYhMMM0h9Kepum0kiGIhDGrS1Qun1Q2+4u4xQt0WtohbaS2UFk
 p3/43GBtR0zWCMRq0qk/o2gJND+8GSo/apgee7M2b4m4mJIlTdoaTKx3Lt8WgW2hk0YAy8BXV+l
 KYdTUhn5hyl4oLIn0Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_033321_886651_B05FFE2D 
X-CRM114-Status: GOOD (  16.43  )
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

priv->ptp_lock is only initialized in stmmac_ptp_register(), which runs
during __stmmac_open(). However, the lock is also used while the
interface is down and has never been opened: tc_taprio_configure()
invokes the PTP gettime64() callback to compute the EST base time when
offloading a TAPRIO schedule, and stmmac_get_time() takes
priv->ptp_lock. Using an uninitialized rwlock is undefined behaviour.
Move the rwlock_init() to __stmmac_dvr_probe(), together with the other
private locks, so that ptp_lock is always valid regardless of the
interface state.

Fixes: b60189e0392f ("net: stmmac: Integrate EST with TAPRIO scheduler API")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 24656b35350b..5fe7e95fdd34 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8025,6 +8025,7 @@ static int __stmmac_dvr_probe(struct device *device,
 	stmmac_napi_add(ndev);
 
 	mutex_init(&priv->lock);
+	rwlock_init(&priv->ptp_lock);
 
 	stmmac_fpe_init(priv);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 960249960004..3bfcc9760dce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -365,7 +365,6 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
 	if (priv->plat->crosststamp)
 		priv->ptp_clock_ops.getcrosststamp = stmmac_getcrosststamp;
 
-	rwlock_init(&priv->ptp_lock);
 	mutex_init(&priv->aux_ts_lock);
 
 	priv->ptp_clock = ptp_clock_register(&priv->ptp_clock_ops,

---
base-commit: 641d03105cc0d2437e32fdeec164f91a4ccef6c4
change-id: 20260904-stmmac-fix-ptp-clock-init-b8eba4328243

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


