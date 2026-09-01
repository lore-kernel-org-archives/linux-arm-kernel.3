Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03809C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 11:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJ5qkITOsRmPm47iY8hOfrhQuZlteW/MXIusB651n/Y=; b=BZTOJRlTN2ciK29CRKAlAIkEwV
	X3mNZTZDbEwBgUXlGPI7JHCGadzfxu0w0Wqn2W20+X39E9xtD+PIIrwH95Sfsfpfow2l91upcL3yk
	Z/P6BQPM2f1Gy2e9zHAkkWk0xTyp0h0EKPmub1vK4fp76V23qdHEmcbhDooY9D8rPGVLY3HmBe57+
	ufa3arhF26OLPrNevuUa82V1UtD0VWvRiHNa3aDSpZOGFFzizh5/lBfwCv9r+0Po/hsdQqdu2xY83
	ZKb0bPJT7jgMLBUcXGbOHKV3KZK7M1YKoq7Q9EC+b14QIUO0L2ahEJMcWgERfxnk0E2f4yOyAS3vr
	DmOQljoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MSG-0000000BfVW-3imw;
	Tue, 01 Sep 2026 11:15:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MSE-0000000BfTS-34tz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 11:15:03 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJL3n2241962
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 11:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gJ5qkITOsRm
	Pm47iY8hOfrhQuZlteW/MXIusB651n/Y=; b=m2kDuW+df9CWp69cK1vsSL83l4m
	J8yoIGWA2nMCTiJLrfLHaXt0/m94FOMcc7rlDKhsV9flj6eicozTzzjy1iBNoUpJ
	TgyMq5nc/vXjBGGjFWYd6aKSFr7eMvjfRmlwo79DBBRuFhuK9hRcyqZqfnmVEfAF
	OPNUH+oMJlwVjaYNtei4sIGXCDMnDsc1uVBrJWY3S1KBcpT3uqdMmd3PaF5XFJup
	RTxSyzARMzxOp7iNwhQN0LX/o5AKK/IFEMB0nWH+mjrCxkXOlydWtprbqWw4z2Gn
	W0urNonX0lRwa4F5sesfrwxGvqRFSyzNlnkQ3yQT7167rhPc4DA7bD8oDRg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm08qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 11:15:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4f946461so798366185a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 04:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788261301; x=1788866101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJ5qkITOsRmPm47iY8hOfrhQuZlteW/MXIusB651n/Y=;
        b=ar7WJTPlMmlnbzuUy7QOP+VnCM2BCvGRTiFljBkTEb6Y22krfhugpg2qbpviA+1+vW
         ankWgIxwkus6Oy6PYaqrS5yJWXS39v0NLB6OCHO0zLIdk93npOQc+kmUiQdKQDUmPeyr
         sI4k1RX4Hc8++rOkf7Mk9DLL8d19nbFEQsYCFcjjYJQaAvyABs1OUASU2F+Z4xptVNEy
         SmqWrYp3J8QZa+3HREqLxCirrLSAbQJU8CtOibySvOWdHElDwM5h9BrMZ8bHPE5Gv6Yw
         eRY8Mbo5vXY9aXjUxGQcs342Ddq7YejGINbP/oP8nJ/o7gP9oGSS4F4lcvwvhblEybL8
         UpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261301; x=1788866101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gJ5qkITOsRmPm47iY8hOfrhQuZlteW/MXIusB651n/Y=;
        b=gP9zdSyoEWho3vdpU1ZDvumIk3ayOj0W8epsMNLmj4X/bMMD/13w8JsbPbf4psbVqd
         9Z2JShFUjIw2XGEQzWagjPwa0ghjjAiZLQykgYM3qMEomqkaJfPorJjy7S7d5Onf5nrQ
         Oxu53v6sIbuBPr1x0dDMn1oKDCwQd1n4RoAbMmd2EF5i3jPrfhxcKbEKbQg4XTRxIQqe
         5UM81loYTstVrx6mLA1VbYQ9ysDws8WXuhUmFFTyKfFVr4InI25VBa5de9SWM2Ggkj9w
         eKNwDZpjXomi01Q6UcFwGZJgiXnfRr3WgtfrsFWIcQsdEL+qNlVpo+UCDZhgyGIppptp
         TPHg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5yvp2TBpEOs0XjGpwP3RlQsK1vzniBkH43V+6hZXsjOtQJppNeUHihvxMffeLX6K/bQ/AaG6HcvDLvDB6aALZ@lists.infradead.org
X-Gm-Message-State: AFuF++kmH6teIeP7UCRRL70m+OxHv7iOOdViOIm/mi7KSiHa0mJ4/rYG
	dse2CWlDzopnS+Ugmqz8KNAm+TjUIV8VlWRLOVgrHW1V4EBuCrkYFCU65AFygYbPQybaQNQPElc
	Txa6MKrf2jukd7R0b/zNMYxTUnwVUbuCVAyvk50oZ4v8LWt1N9zkHBCBVxo+RJ0IijZx2DM0tFq
	EECg==
X-Gm-Gg: AR+sD132UO+AZeI4JSX0lO9YSiLKLAG70sUo/Uwa4O6p4TXwDhGSHi/SWqi5t01/ViN
	Oo7A8IwmdSYZM+GZn50Oo7f/GU1L95lceu0TyBb0T1soR79U6TBvXK74Dmw9S0kECbeSHPBc1tD
	12mXU1Bi6n/PILEeh8gT0p9/DZBh6DQp/ah/LM1te97oKEdG6eHIDb/RMTPqEo2h18ej7FdEcRf
	KVfQpPHHRYLB3RuMpvnc7v4wriNUqBkts6E8HnGf8Zdss1zk8VKTwVMJIB6uBb6vOff2/xgSGE5
	iqEuT0AnKTimzzKobBcNulhbDjARta/5JTkGYS0EG8xIddJA6Zq4ML129waeO6FTBAvjuTTs0cT
	8YO8WGxbnwkYIZi6HXxohbfb3WcFwMpwpUk+RRzXYuDrnbk0oDGeCPtNZKg==
X-Received: by 2002:a05:620a:a404:20b0:939:3c52:b117 with SMTP id af79cd13be357-93947f8f742mr803386785a.8.1788261301080;
        Tue, 01 Sep 2026 04:15:01 -0700 (PDT)
X-Received: by 2002:a05:620a:a404:20b0:939:3c52:b117 with SMTP id af79cd13be357-93947f8f742mr803380485a.8.1788261300582;
        Tue, 01 Sep 2026 04:15:00 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25878ba94csm380686366b.47.2026.09.01.04.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:14:59 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] cpuidle: psci: Move initialization a bit earlier in the boot sequence
Date: Tue,  1 Sep 2026 13:14:08 +0200
Message-ID: <20260901111441.122436-6-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nIO0t7h_NkXesI52EpU-FWkKPKJdhSfQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfXxarhlJDHyjiB
 WA/VDTBxJsJVhHKH9wxCXScHUitB0E+yHnPjLty2mqra0Du4djZJ/CxWSaj/BDwNGTMptKyu+vH
 7/2V9kNWSg/nH3i+GNeTtLzSx31KUD8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX/A7WnVyON+62
 8o1NzbmGV4avIEjXZGdZHLFG+yomT+EXbrAz8cJcBU2pPJWR0XwbRrV2ALVAH+wjbnKRHw38OxG
 87FW1m8C/GbJtRhUib1NP7YhskexCuRrG1ExMc+D7TTmiY6v0FI3qTwjqG6fmbC7Y6VM7HS01+S
 VUiR+dn/HGkEDOWXHRMHNgjZexp6kck5LIEJJ2RnPvw3RjzkhxLDUXOFtyH0n2h1ixa8ZyKjonC
 BB3hJErE17zsHMZg2WIglbf2lnmzy8dCrUZcHkHHAX/H+9D9IF451sCFoyUp70+ayewbeFdfyeF
 Xmy8KNpTzE5bANAqNScN3WKY0EyEj4bv+rZF2sAPYRJ8ZdHo10q/4KLhI7VHl8N+QJ5vwQzrvX0
 1cI1yccS/il7j1C4/QyCqrKMu5dpqvA1JKw5AmmhFkqZP1Ry6THwNQVZeVqCjH2Y4C5hhtc/Wo7
 lZcfFS7HTrkYn07yjPw==
X-Proofpoint-GUID: nIO0t7h_NkXesI52EpU-FWkKPKJdhSfQ
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a96b3b5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mXaVKpwKMN2Bo3EP8aQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_041502_910532_218B774C 
X-CRM114-Status: GOOD (  17.73  )
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

When using PSCI OS-initiated mode along with the cpuidle-psci-domain driver
it's of great benefit to attach the CPU devices to their CPU PM domains as
soon as possible, as other non-CPU devices sharing the same PM domains
depends on it to allow their devices to be probed.

Let's therefore move to a subsys_initcall, which should be soon enough
after the cpuidle-psci-domain have initialized the PM domain topology.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v2:
	- New patch.

---
 drivers/cpuidle/cpuidle-psci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index b250d0dde760..0187d6a9096a 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -479,4 +479,4 @@ static int __init psci_idle_init(void)
 
 	return 0;
 }
-device_initcall(psci_idle_init);
+subsys_initcall(psci_idle_init);
-- 
2.43.0


