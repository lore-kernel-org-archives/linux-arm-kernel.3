Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4FBC5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 15:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vv//GFttk3qYBPU7mvMr/By4VJqy5iyji7k+koecDb0=; b=R0FNPqspsLWko1laKwy5gkY3cG
	T0zFrLUtSAGpNAWc7azLGC1VRVwa1FMd41cO0q1evODRYP+FQspo2QK2/x1vJMx9mNuNed9qAzkST
	OmE5j46tA9CIH1mg7DQ2zceFr35gN82haNLwvf4PGfl1HxiCdHTsrfQQxNZiwaqzAugcNYoDzvPpK
	RP+EM4qondsuUZU7WyEq3V0hi6F7pIdOMVI4UPNNMKrK0MljhRSwLSvv5uw9zG30A9g1YjqYjo3DI
	3ugtStsmHMQa4BpKwH3BcWUFW0tJ7vMMhlAq9T8qooGRY22tVpuMfiR3qKEpyxmDtPSeW/mygmffT
	abfBtGvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwi0t-0000000A3hJ-0WnF;
	Wed, 19 Aug 2026 15:15:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwi0l-0000000A3br-3QJr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 15:15:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1bVF963677
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 15:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Vv//GFttk3q
	YBPU7mvMr/By4VJqy5iyji7k+koecDb0=; b=FbRVP3+W6IIApSK1NLeoMk8lg3n
	C08s7YVSJikjatnQYKiIG+YWoD2jRZSm1L+yM3NUwiSVpjs3zU4ryY2XDxmtiCFF
	e+Nlqeqt3qXoJUURz/IRsv2YhK/VLWbZ19liu9u+S/JS+2TRk51kzAdS60++VLmj
	hmihvb4sKU4WNWM6+NwPCXZedIicyQ7gumcf10hngMaIodpnlH53/yhfb0xq4Yvd
	PP8MyrUTLJMEe8WnYo7P8+A1tr7tgVeVTnoBMRYLUhQOnJHQoRgRbGpPU8ApI20U
	3g2uiU/zhWbU75HuOvXQVYYJkJ+tNxZXCULwDvDPtiEeMUvS/OvbOpJHSLg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es3g24h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 15:15:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so209517985a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 08:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152526; x=1787757326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vv//GFttk3qYBPU7mvMr/By4VJqy5iyji7k+koecDb0=;
        b=cIKLqLKoGnG2cRshtdt46Od9dF1C1tmmVB3kMlX9JQ0KhD1JISEOch3DRANhWBvFRU
         nolbFEKJqZMpwPQ+9yw8E9rfpmfcqcpfDu4R0xuGLKimiMr/Re2a9Me5QATkGKhApwFN
         b36Ecy2ChOrp2An3KN24AmwyMYqvA0yMWfmgb7NKCO4oVHVWtvvLC5z5rXN1Yy3oLRDD
         dW2FWACZ0kXoK1JQIKaMwdiVqG8M7UM/ziCWxqsVWK7a85/tMAAzFpHrZf+4WPQE+CEB
         +s7NP9PVVqFdCPZp0yc5gGJa1v3hsYzjkZ2CQbqIik7Ym5tM/YP7z1H/s0g7cDaAdz1I
         0+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152526; x=1787757326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vv//GFttk3qYBPU7mvMr/By4VJqy5iyji7k+koecDb0=;
        b=tKkvHHOWSllBQa43Goa9WfWWW9hmmTbm9qX1XE1vwJwYIxLDmKrNHrEF2d49ig+NHN
         UPLjaEY1+b1Uf42wiK6UgSjcMBnzCCD3oOtx6fZZHPqR1LTCcmF9f1abglnx7m+zIVOb
         xsqTHiegGDY4uxap6r5FfB8JN4hhvUbMTR3mcd0l9ZhCjRoDfNbSwBUyAilGGxS2MC5S
         nFIIspphDM9keQJYpQBpw565KGXAARTbwldBfSePj0BoxDoAWZrTmkZZocJeMNIKImn8
         xMhwwFakN7aWoxrC9b2xwffyonEsICZT1skbkxJGTFEMye7BTeDcZcFJ/z4H47BfpfMp
         ksBg==
X-Forwarded-Encrypted: i=1; AHgh+RrxASejUCF0ferHSTFty+bfPio/uckGqFatK/sFtrNPn6YOnbGuv2/5bs+0gNP20F4E7i72fC09ySzBLOTozjzy@lists.infradead.org
X-Gm-Message-State: AOJu0YyL1RWdSBTO8Mk/9dpJxH9GYZMy3VpEp3pg8HjUlgpOKme+HRka
	6+il9H/2ZH7zBLB/TlehGJMYvCTq5jQbHENiIRoY6DF8OvlnZUxzZcTrSxTicOxFQXlcrLxYqsE
	4+H1w9HaJNae+QOkvubovDBdNPewv8qbJ/UvcBayyxnYNtOzcRwRbePcbXWwNMwf0du3NBCxtmX
	/LzQ==
X-Gm-Gg: AR+sD12Wdk1oeyDW6eipmAUBvNu1DCVW/BHilgikCFKBbCEBpQLAE9nC+C1GONuYOFn
	Ll9Mm17mQyqC5iYCH5qeCcxcDkQbX35vLUH2NAhIi2Kv6mI3ig6zJxrRX0V2/RjXzw+TSfUKK3n
	oqIxn0mjl/sEInZUfqC8iRg4zthkxS7PbrrBgkgS09aHbvaW077jVTI3gL9BKCM4aUirM7Jn4Dj
	+oVNKIU1BWdJH1jBqiC5FBnjXG3jtGJ1nrGPyo9akAiWdiMF26IORifRTcvkhGrD9yNXHmlvHF6
	AhPW0c8HmBc4QlxMxiRVh+Q3NGGOM42noaLGaiibGQsNBHz9JZ/xnl07WtsIbf+lcpVcHK+eD5Y
	ZC6Dzk9SfthI5BheCJa5AwJn3NYX9jBqAGy3HjHqdKX9wAQObDQ6e3XfYaw==
X-Received: by 2002:a05:620a:1d0d:b0:937:1710:f839 with SMTP id af79cd13be357-9371e79aceemr569269985a.47.1787152526113;
        Wed, 19 Aug 2026 08:15:26 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0d:b0:937:1710:f839 with SMTP id af79cd13be357-9371e79aceemr569252785a.47.1787152525350;
        Wed, 19 Aug 2026 08:15:25 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c4ac06asm94124666b.33.2026.08.19.08.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:15:23 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ulf Hansson <ulfh@kernel.org>
Subject: [RFC PATCH 3/3] cpuidle: psci: Initialize the PM domains in powered off state for OSI
Date: Wed, 19 Aug 2026 17:14:53 +0200
Message-ID: <20260819151457.256959-4-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819151457.256959-1-ulf.hansson@oss.qualcomm.com>
References: <20260819151457.256959-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UIrt2ify c=1 sm=1 tr=0 ts=6a85c88e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GddhhVl5-a8N4MGu71oA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX8p1fTRXNlxiZ
 MDbjJw/yQwFUQ8Bu1D1TkMCzfZiTS11EKHctzVvTpXDZyeLQ0EckxWIKoGdErkA4Z2LqCH7oYNx
 Zhz0keGyC4Jq03gHGxfNzdJ4sCjKrSR/y89sTLdgbCOJzSV2Y3ngD8tLujT6RP5ONq20/BmbUzV
 U6Gvu368kHZvKdWYaThWUiBY8USkKl0xtJZfO9qfnOsr5ERl/tJ2MyUmn3F5PiOYFDrhC33kKBS
 wNTvv7HG5DR1aSLJBl/6fXkzN0RQS9BYVjUWAabThE2xt8mvU/eu9GmNr7WfohxLiiWHZctkhr0
 C7hqCuEbfNlCGpouRBZjBJpFF9NzcZ57iX3mTf8Un5V9br/vwg2fZIzHxQZ36+pUG2DHkz+uGPe
 HgWRjc8WTMmqssie050tbUSrA5/kueBCsBLylMuj3BrKG5A88IUg5QScpMrRcBPf2Uf/AETOG9m
 AGwl2Sb4tPTXIBw+PCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX7P+psZzZco7C
 51C514aIhICkWtM6xlGfNEce222iFBttPxxwrDzhvjlngP0uaXQIN3l1Stq1STfP7A8xpMBcRZk
 g17KMWMasbRYbDx4r2UwUN/p4nY/XVY=
X-Proofpoint-ORIG-GUID: nwMIKH_RmlTQsfJu9MLeixlKf-at6qbp
X-Proofpoint-GUID: nwMIKH_RmlTQsfJu9MLeixlKf-at6qbp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_081528_015026_CAA62258 
X-CRM114-Status: GOOD (  21.07  )
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

From: Ulf Hansson <ulfh@kernel.org>

At the point when the PM domain and the topology are registered through the
genpd subsystem, it's not really known whether corresponding CPUs are
online and thus if the PM domain should be initialized as powered on or
not. Instead this information becomes available when the CPU devices gets
attached to their respective PM domain through dt_idle_attach_cpu().

This is a problem when using PSCI OS-initiated mode, as we may end up with
a PM domain that has the genpd's status indicating it to be powered on,
while it in fact may not be the case. In the less severe scenario, this
leads to selecting a shallower domain idle state for the PM domain than
necessary. A more critical problem is when a non-CPU device shares the PM
domain, leading to their corresponding drivers not being able to trust the
status of it.

Let's fix these problems by initializing the state for the genpd's to be
powered off and in the deepest possible domain idle state, when using
OS-initiated mode. The support for ->sync_state() is maintained by setting
the GENPD_FLAG_OFF_STAY_ON for the genpds in question.

Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com/
Signed-off-by: Ulf Hansson <ulfh@kernel.org>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index b9e4ad7d43a3..29caf3114185 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -68,7 +68,8 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	 */
 	if (use_osi) {
 		pd->power_off = psci_pd_power_off;
-		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
+		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP | GENPD_FLAG_OFF_STAY_ON;
+		pd->state_idx = pd->state_count ? pd->state_count - 1 : 0;
 		if (IS_ENABLED(CONFIG_PREEMPT_RT))
 			pd->flags |= GENPD_FLAG_RPM_ALWAYS_ON;
 	} else {
@@ -78,7 +79,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	/* Use governor for CPU PM domains if it has some states to manage. */
 	pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
 
-	ret = pm_genpd_init(pd, pd_gov, false);
+	ret = pm_genpd_init(pd, pd_gov, !use_osi);
 	if (ret)
 		goto free_pd_prov;
 
-- 
2.43.0


