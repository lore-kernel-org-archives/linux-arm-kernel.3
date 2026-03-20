Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73B8109317F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 07:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v6gu5+kOuXW9joExsxKdcKTf83TVbLBFcpmTniFILZs=; b=H6sbeCnImK7iGOmrjqgheX57Ft
	HtBui6R4wB0PwUVqC8O/AKVRv3PEpiystPYxZ68sYicrb8N2HKaUAKFbH3kgEl3cRugaYexmgwOw/
	FmFjxlUgifYMv/k0HcDOr4XYgGv/t134tVd4s0CXDFNlhSrqYGxnc//RdC+klAehOm3BUhGLZSHX/
	j5aXhUmopp9M1eg0UWZiLSagFXsyGH96uujMPAPnhaaF8jkG7IH9Pn5jb/Yvd6cyBa4QeCTQLk49l
	OsnGvCb3rKa+phTlYAE+QN+vM7ibO7e/GcgVMT7F74COHpGLIx5FHl1Us9A5yObs7MY6EIVpOd8Rc
	j4KpRMhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UKq-0000000CGoi-3IGv;
	Fri, 20 Mar 2026 07:31:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UKo-0000000CGoI-3pfU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 07:31:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2XgQw989373
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 07:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v6gu5+kOuXW9joExsxKdcK
	Tf83TVbLBFcpmTniFILZs=; b=AvfItiLnuyhf4Zfq9daoNF3G8qZJh1bM8JSKGC
	eyiu6YV9yBGIruhJTLtv3XKSja/2m99Q+G9ZELm35Hhyh53byANGs5c0owOMCsrL
	1WDDj+wJfgBBGJm349LmGrTxkn+wiGidf9Z/RVKbqSxKCzdJOtpcXptnleDDkvo0
	AeeJZYfZJsvnh1OP21AieaUuVHanOcH2tybjl4kzFH94sQ1tff9AdEaf8Txo4SjC
	Ud6+36pXT5Ns5neUSsqzQ/OkVz0lCsZkkE5LniXGTnK2HNSp/cebTKAFv+az6AJq
	X2kJGw0zM/QzBX8WxM/StuUHGRaWT22TmbPgpdZI7EaFizzg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0k0vam4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 07:31:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b05d170cadso5234685ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 00:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773991913; x=1774596713; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v6gu5+kOuXW9joExsxKdcKTf83TVbLBFcpmTniFILZs=;
        b=TgoEdJdCexg2NGRrKBZSM8gsL6fCyjP0WVF5MI05goxYREeBoesmXy0ZbXgrD9rgrn
         qJgsiMDQ3tpYWDzZjQihvT8byYw2CKKDPQ/NhxJL8YrBKJdv5Nmr1n3vTn3pmGtQr+ef
         rO9/xJazuWeCNW4dpaypRWAHEZIBuDQxogdz7X0Y/4piNnaLxSKSNdL6Yy8A6FyOnQcQ
         gjWzj6/11p1urNzyjftXlbEBbCM2aVOoCyUJdIyedIqH7cwoaZS1usN2WUV04CcJE9pz
         UkJrS1M986BjSCf57Rrg3qUgSsFLbZ5PdsXZMT2TzXstfjMRilMubTlThDonnD1CrICV
         8qlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991913; x=1774596713;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6gu5+kOuXW9joExsxKdcKTf83TVbLBFcpmTniFILZs=;
        b=YgoVNdaet4LQF2tTWOylrYHZGbvZC1/OygLXkQPzMd8OPn57bHk2F85ZSegYDQroK9
         NTgJXJzchfRQ7TroFcoMg0VFb82SSWZZXWpZqqfQ9wFBGiJCyEqCaoMUhyq1rYK8VSA0
         zYyIX6tqDCMvR07bpnWECrQfJ04C49pB5SADRSu90AYx9tKM1xWT7O4zIPISyNEwHUvM
         svbeDHbYyBuGQ/1dHo1xSjcfukvKSSLMCJ4aIiU9hVnsDmWcuVadjKRw/o9bh4Uj7D0C
         q3/vPrOZqhbqO1DmlF13TkOx5OX9FVJ47/jHrP6pE+Qy4BLk45kI87OOGKnc0Ys2u31q
         Ir+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2FsXn++AKQGOU0acOyc7oFt7wAJDOREXZdyTCYFMOzo9FnD9rDMiugfcLY4tEgByymFzsYgchfNsjGspp+PdC@lists.infradead.org
X-Gm-Message-State: AOJu0YwgWDBUU85w+KHNJBql3gFRCYYvlNjkkoZm3K4Flb7Nb4vD8B3S
	IlF8RYPjlTOANH4kf83lX0HgsZeXisMwexBArzVuUgDsa8Ma4LKphAGxzNmIDRwCdwrgRkhtUZ1
	Kncf/gJ1J6JGFLHuKtFitnbGwHHX3HezSvCEiaWwZQx6DzsllukRryT6rRn8JFDnNiEqjVH+gte
	7ISQ==
X-Gm-Gg: ATEYQzyDKtxsczg1mrLPzCraHCGS5nedGSZikWnTwxlpGqGWt71WPPyhEJbUARIUWZ3
	ufutH9E64RH59ekgNru4JRkQvnodNGsOU+rK2i0ZlspQ0nyn2WgixKdxvnCkwRDVV/c8b53BwRb
	V/bK3ZNZBqxQykDQyFeo+kkyv9/MZpqzf4V8I98LozGyQ1TbwdGhVIrGbAoAkkhcoAgEnXnQSqb
	ggIK/dTU4a8CYBfO+jOt+bE6f3XCyFFJYSrnn0MraggDW0TdCG5avK+aJMuWdNlHgPE/kDB/kUW
	smfrlYfIBmWoMGV/Ay5grPSv1RpjrToNszCeEzyon4pxbkC0wd8oPuv3mxaSwzgd+iMg1mAbkYp
	b2EtD9YkeVLLQYjKIcm8fey+GQKGpIxNISboPTgQRhqsLMiCQ4SXoiVwo3mhwC99W7HQeeoE2pM
	5NuHu7zRvY
X-Received: by 2002:a17:902:e5c9:b0:2ae:59a9:639d with SMTP id d9443c01a7336-2b0826d8279mr18246165ad.4.1773991912598;
        Fri, 20 Mar 2026 00:31:52 -0700 (PDT)
X-Received: by 2002:a17:902:e5c9:b0:2ae:59a9:639d with SMTP id d9443c01a7336-2b0826d8279mr18245855ad.4.1773991912111;
        Fri, 20 Mar 2026 00:31:52 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516512sm12905565ad.17.2026.03.20.00.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:31:51 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 15:31:12 +0800
Subject: [PATCH] coresight: platform: check the availability of the
 endpoint before parse
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-add-availability-check-v1-1-b2e39cdeb6e0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMD3vGkC/x3MQQqDMBBG4avIrB1Ip9aFVykuJsnfOlRUEhFFv
 HuDy2/x3kkZyZCpq05K2CzbPBU86orCoNMXbLGYxEnrnuJYY2Td1Eb1Ntp6cBgQftwEL0CLlzh
 PJV4SPrbf43d/XX8TBBy9aAAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773991908; l=1386;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=p2q4jUNQ+TttJj1t63EVHZ0q6HKsWcrQptMuk5DS9rk=;
 b=qrlqSfGzM0KjgNyOP+zQcV7Ttaz5a92nh3AGcW6oqFr6bTe09Yx1+jAk+gX6RBMvUwnnAxdxW
 Lmevi51EtalD7xzbEkzCZD4aMYUJob6KOgERTArFiGJ/qsjfkR5TewP
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: ImMyAhqfKkItkAALu-yNFVnuwMCjJz-r
X-Authority-Analysis: v=2.4 cv=EcjFgfmC c=1 sm=1 tr=0 ts=69bcf7e9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7UMLgSxeVYG7w6eq4UYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ImMyAhqfKkItkAALu-yNFVnuwMCjJz-r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA1NSBTYWx0ZWRfXyQ0V7kJiMVFP
 akcTsAu6NzAcvioZuSOUByu7VLtx7tTiEQbYdUZPMGoKXBANYGmJx4PnZ5JLSlyuUKmZHf7SD2r
 QO/OUd+gUFR1YZ8dnLq1WSTfRbdkrLAbjAItVojHL2jeTSXtFPY1mXffSeul+Bx+H87Q1s/jNoN
 aeMim4lN8rGHblIl4Xs2Xbc2TS1HdUcgT6U+7YH89j73JdgHeLZRO6Q4WMOAx5BSWHQGYpU6apb
 8sJTjEIT97XZSwg79e60S/kWWsWlEmMma0x+btYtFLi1ulFhYKjxEfdOaWLrw0wWgpfswpqxgvW
 Dk93ztj2g53Ofan2WarBr1JNj+/1GrsPniuA+aDyiXGEdXLs5PAh17My+oMI/HHRFdGnFnIgW5t
 Mg/BBi7fzlhdqUSmd6dmjAiNx9cjHzdWDYkPk5Un1d6Cgm5vWwwoabnjfxO21rBhzq/7g8N1SB+
 iAu0q8WjeM+0PbuvQew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_003155_072664_862097EE 
X-CRM114-Status: GOOD (  13.62  )
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

Check endpoint availability before parsing it. If parsing a connected
endpoint fails, the probe is deferred until the endpoint becomes
available, or eventually fails. In some legacy cases, a replicator
has two output ports where one is disabled and the other is available.
The replicator probe always fails because the disabled endpoint never
becomes available for parsing. In addition, there is no need to defer
probing a device that is connected to a disabled device, which improves
probe performance.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 0ca3bd762454..e337b6e2bf32 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -220,6 +220,8 @@ static int of_coresight_parse_endpoint(struct device *dev,
 		rparent = of_coresight_get_port_parent(rep);
 		if (!rparent)
 			break;
+		if (!of_device_is_available(rparent))
+			break;
 		if (of_graph_parse_endpoint(rep, &rendpoint))
 			break;
 

---
base-commit: b5d083a3ed1e2798396d5e491432e887da8d4a06
change-id: 20260320-add-availability-check-4cb2ee6e520b

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


