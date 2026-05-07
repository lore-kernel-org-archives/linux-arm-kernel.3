Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810BECD342C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 03:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FHYeVsZlYDuwrT66+RPKXe9mu5xt5fLGZJCRXG9QAmk=; b=FO6yFTyFAbilqSdm1udqAuBaoC
	SgzoUfHHZqxTRtubcuEucdjzKqwI0D4NUlnxt+/NxObUpcbMl1D3vJpDfRuuuhYhM6b+w8er9iUB0
	5XwYAUewHq3mc5HPkIo9edon1VjS9UvuKie/m0S6WXfNVuOVyJ9E04z7ZZhdC5vfDQGtAaJbfJBOT
	xWMmh47q0KWimhJVvzvDQWdTuMmweBb+kZNtrGo47s75HuIdfOmKx0wpNNXkVGvVjqfZptZs7P5Qw
	Q392e5LVTTU5nyeKOJXrOsGsg3rRwvvrtJGbQ7559xsn5pytkpPqyR0gJMrOdoOqsK7hKj6PCaGJ+
	EBwItSMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKpEs-00000002cA2-0pdI;
	Thu, 07 May 2026 03:17:26 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKpEr-00000002c9Y-1M8h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 03:17:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjZOMvXbupZasEAId5jaryW8hBvYL4a8wBBFAF/2FOZVdvecrJUUtFvccSafMSNJgBqypYA4tTabnuqOpXmuCx7tnpQNLjYSkVXDJhUrhQxvraT1GlcXs0vbgyBL/wuA3lO5qyMycEksFYm5Yz7+F3u3nlQ2qTSN//pjvTQgKTZ4wuH0JE4blEjXsB6ZwIak87YUNNzI6ORRh57XwHk5JfduL/55xZ4EYWrk+fmRi9sz8C0Zt51YyPsbKppA8nnPibPd+BPE2G6ef3L949OeTPXsW98jAAImgcCPEC0QHpbKq7ng9L2S3AqBpMV3zYYKEpGjNK0H3Aw9fO13rJJ6hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHYeVsZlYDuwrT66+RPKXe9mu5xt5fLGZJCRXG9QAmk=;
 b=PczrFe3WOzFQ4E+f+4S846b4D1AnLu8hqp/PYQ0QSFMHZyfF/GmjyB2om2nytjbN3nx5MlzJRrFJNLzWJAr9RqQXKWs3YIM+CMS9YJm0FoPu1pKTnw2U51Rf15cMhPAKaa8n1yG9uQGuNBz5zLGEwClrlomsuMyuGCsnpFH7UErHJ9IgnR4LIiN9TYbMZspY1bBPY13PW9RCxbqWeMRtNdtuTdv5nquyUvu1twNBT9BNiJ82yNydpp7pannuEeCcX1UerA0xfzmvRd5s/4Ks0SF/8ojr7jcIdHWACdP6IzMmPeYv1K7oFDPHj2tR9vTtGD0kfVvmKxWPgHYYvh6gXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHYeVsZlYDuwrT66+RPKXe9mu5xt5fLGZJCRXG9QAmk=;
 b=vJQC8e9XvLYRO51vw40rhhX8+aCW/DtRdRbCOOOj1ZUe3Qjvj32DgJYQLsCAcUIXYD7hBkL/rBFH4JBN9qktge71MtNRyd1BsYtPE3Xl+mAzi68G5v4ps8BqkF4Tf0GHJoYpFk+kNqk4T+H8KSniVjp0UaoGxReFF2WkosKRzUc=
Received: from BL1PR13CA0211.namprd13.prod.outlook.com (2603:10b6:208:2bf::6)
 by LV3PR10MB7940.namprd10.prod.outlook.com (2603:10b6:408:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 03:17:19 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:2bf:cafe::7) by BL1PR13CA0211.outlook.office365.com
 (2603:10b6:208:2bf::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.9 via Frontend Transport; Thu, 7
 May 2026 03:17:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 03:17:17 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 22:17:10 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 6 May
 2026 22:17:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 6 May 2026 22:17:09 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6473H9nd2726995;
	Wed, 6 May 2026 22:17:09 -0500
From: Kendall Willis <k-willis@ti.com>
Date: Wed, 6 May 2026 22:16:45 -0500
Subject: [PATCH] pmdomain: ti_sci: add wakeup constraint to parent devices
 of wakeup source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260506-wkup-constraint-v1-1-0a4bce791b29@ti.com>
X-B4-Tracking: v=1; b=H4sIABwE/GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwMz3fLs0gLd5Py84pKixMy8El3LJKCMYZKBSUqaoRJQV0FRalpmBdj
 E6NjaWgABkJSpYQAAAA==
X-Change-ID: 20260506-wkup-constraint-9b0261b04df1
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Kevin Hilman
	<khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
	<tomi.valkeinen@ideasonboard.com>, <sebin.francis@ti.com>, <devarsht@ti.com>,
	<vigneshr@ti.com>, <vishalm@ti.com>, <vitor.soares@toradex.com>,
	<ivitro@gmail.com>, <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778123829; l=1442;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=v5b0bO4IYPY94fPXW6+PlvHeAXTy1iy7DmFyjIg56iI=;
 b=5ZwKsL40rqmXK7xp/RQM7zaU24Kk2vk9zUb3P94XDwGJI3/M+NZXSIn7Lt/vNuR/XhI/P13iv
 P3BbqeQtFixDFi2l1S9CnWLz1RFMYaueR007MTV9o0au6QLqG+fml8S
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|LV3PR10MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: 366860de-7b81-4d0b-3025-08deabe72514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 5uojdVGdDObhNgWTcVmK++ThAK8hZexKA1rX5KlPXdR5Hqv1nAPvct26WSVnNUYihzBQ0qkEB38VcmO9jSQrKE/+cerUn8ma9sb/CmsOhxFwvBQagRdScYuGkROwAIdChG21YClx1EHDCTNcVUnPbzKOWhaqP9YTVS+g1eOPs0D6WctjfALkFAUF5JeyPgGHhFDqTgcSg3r297MHAd85txkgOPkfahd+Om/OKFI2YmqLppnUYSo/W+zFZZb0Uj1UWZwZ5H0riCJSYYlNvbevXOsE+/cGAEo8cpF5fRZ4lxGKDGpcsxtoJcHL+8QxmbV5D81GmDNA1SqQlslblkx6o5S4OGSKfTMFAVlGLihQADV+ylznmYr6Rc394YbArPWEmAAmB3GTAVMiQ/2HNRyD8Y9sk76YUydht5EMLYtdUb1n+K0F5OOTUB5ldo7RmP9vNEzp9G7srdR8zhHOKEB0Z+W3xOJ13EvbpFUNRKv4av2SakwiGUz+pPqkJNqEyKtIX3wvAsjZwyjwJzp3ulKhWbd4kXnc/M7Daqele7rm+RdKn43adB1ULh7Mq9wtz17DJ9USH7oJMhNh0jfvp8pnPR1qgZ4S6twKMCRt9Ff5M1ytjIfUvZKo51Zsu5+Mrs9qpGuKnS7IsY/xBjbRYnoIN6+tU5m/VqWzpyNTr/7lZW0qwmPCG2dOklHOROZxJ+nsc0DPt4q4lkFC4oyZwv18gup51f7wW9x9gH53I4tfONM=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bkw3WWz/UmDDREdeAgSFOmsKZBoh6X+GtDMsLSoTjGJkZnSIsb/3O6TOFL5yy+1Sl8w+qEG6CaQgk/HFwq0va8O5BqHxgAXfNmpsUWkO6x59Zt/Pxq9uxSbXac/TRQIk3VKEpWkyvZzHSx851MJJg93BmNI1/mRbJBZYu62bhNLQdkdCjVme3e1hOzyiIp3A1O5bS5DFcKYWcl322NV/QdlYl8Jfuqq3T4cmaH2hLby304ptV8QTbPLaMxsRlgPdEXRkGVPl6lymsTDa3XNSXzDVln2zPUlreTy3yPL/yJ6zbkE2asMJf26ToEOCFxPuUmfr0iNvEZ7jlDNWK4t6hQ6FUy8TDvOIS4WgFGNt4ZDRh2zqg0MJbgwkO3f2lh6RY6tkhccXEg11cMFNuNry2G8sJZ6nZsAUhE6cM3V66pmfgA59/hSbLEonWscUiuWC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 03:17:17.9840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 366860de-7b81-4d0b-3025-08deabe72514
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7940
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_201725_469658_632CF0A9 
X-CRM114-Status: GOOD (  12.47  )
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

Set wakeup constraint for any device in a wakeup path. All parent devices
of a wakeup device should not be turned off during suspend. This ensures
the wakeup device is kept on while the system is suspended.

Cc: stable@vger.kernel.org
Fixes: 9d8aa0dd3be4 ("pmdomain: ti_sci: add wakeup constraint management")
Reported-by: Vitor Soares <vitor.soares@toradex.com>
Closes: https://lore.kernel.org/linux-pm/c0fe43a2339c802e9ce5900092cd530a2ba17a6b.camel@gmail.com/
Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 drivers/pmdomain/ti/ti_sci_pm_domains.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
index 18d33bc35dee1b3bf6107af1e414db377d515199..949e4115f930b93b18216fde46131b5c8931c9aa 100644
--- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
+++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
@@ -86,7 +86,7 @@ static inline void ti_sci_pd_set_wkup_constraint(struct device *dev)
 	const struct ti_sci_handle *ti_sci = pd->parent->ti_sci;
 	int ret;
 
-	if (device_may_wakeup(dev)) {
+	if (device_may_wakeup(dev) || device_wakeup_path(dev)) {
 		/*
 		 * If device can wakeup using IO daisy chain wakeups,
 		 * we do not want to set a constraint.

---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260506-wkup-constraint-9b0261b04df1

Best regards,
-- 
Kendall Willis <k-willis@ti.com>


