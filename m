Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7B3C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 22:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBEyo8bg4ozRRld/qGFPTsbvmKm10Quqq/Wi0K/VYaY=; b=dkaWMiZ10pFheOXLWh2O4x2c+P
	colIZwqFUVK5ftzTjpSlej7Hcutzr5Pe5FfysQ0UuUm3zVaaiDYcrBtZ0Lg6RygorI0phB//QPjZu
	ed5sLoDnP/qmD9il5HnWFo9tk3wpqVaaVOd45MqbtbMpxvlcfjdebA6Yt00kOJPMh/PCMLtaGFD8F
	cB4fVmnPLYWVjeBlhONuFm+2oN/p/9X2e+1HvpiGZfizHLu29sTwWq7nYIrvHKxKVfQpazZlxFSnu
	zT6LU8EGt0AlfoEpqK+z9A6W512lNLYLlzYbjBlJGQbG+UdV1DJQwqr3ytHUJZ/sx+7xuNlj3LUVb
	xj1PuTRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4Nc-00000008aTf-2tlr;
	Thu, 24 Jul 2025 22:25:36 +0000
Received: from mail-co1nam11on2072b.outbound.protection.outlook.com ([2a01:111:f403:2416::72b] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4BO-00000008Z6o-2rOS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 22:12:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eiUGM/dM4ygxgy9hxveRZa1DPIEuxsj8E2K4jIMiqmdOz4DpKyxbrCsWZzja+bb2y82Z8HV41PYyFzbI8U9p+m6/OwUXVfAChWD/Y8QBMHbADyxGu3N8msSetofFv83NFnAmdENBRsa1+lIrf8IgC/MW3FNH97KixawQPqI41smXuv0Y7hmSUjLx5nuHzETNRjhlFPpyOAbKhwNpCk1AkWVDyTb/+iWzVXy4JwWifO6cu6/LqfJ5YZqD0jl6KdOR1VzAroVNlwgBp98u3Xgoegt8ZbQBom09Vx+CNRcg19f2cROZvr8ioKtjpR8fe45a9qR3pkJ16D5qxlVPoYsg/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBEyo8bg4ozRRld/qGFPTsbvmKm10Quqq/Wi0K/VYaY=;
 b=df5cRSuonU7nyToH1/tLoustgNnA39r3N3+GlO5ptcX22zHhmm38liwlZq3uWv1RZGTFqU8XaK3cC3EAtRcde83q6xMiFnzfnzfWZ6ZK6/lliYESzihJcvFSdG16B2hR0f2MmKoKNUoJpnADlbqzJx1I9KWPt4jTDLP5vhRwzsvWKzMMxrePyafpOA2qUUGOkR9H35VR7XdX98qYe50f7tfGJgxyVh/TEEME1VnFm8rx2cB1h7PyFKHwO7S/7fucXlR3FIAwmu4Vij07mon9U/Gu+hE2ZnQojV7YOU5UoJd4f25Yx9Q97YnLAUp84HX0cIjYKbJXRj4/QVNKGoU01g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBEyo8bg4ozRRld/qGFPTsbvmKm10Quqq/Wi0K/VYaY=;
 b=YFEekSaFW4iW+yAvZQvOwpwdX7+izlBx320dFNYQx75P4fzna/AcBBnv3NS26jVi3zUGASjMdCi6AmJokJFYFoGXfXtLqGJkPNgcDA/QIIoEgWPLScvPkfuQ61c4+2iFqccqMjF/h2LPmNF3KKK5uUms4YU634UZvNYwVRUzdeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SN7PR01MB8089.prod.exchangelabs.com (2603:10b6:806:32f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.21; Thu, 24 Jul 2025 22:12:51 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%2]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 22:12:51 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: ryan.roberts@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	akpm@linux-foundation.org,
	Miko.Lenczewski@arm.com,
	dev.jain@arm.com,
	scott@os.amperecomputing.com,
	cl@gentwo.org
Cc: yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: cpufeature: add AmpereOne to BBML2 allow list
Date: Thu, 24 Jul 2025 15:11:04 -0700
Message-ID: <20250724221216.1998696-3-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250724221216.1998696-1-yang@os.amperecomputing.com>
References: <20250724221216.1998696-1-yang@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR15CA0236.namprd15.prod.outlook.com
 (2603:10b6:930:66::8) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SN7PR01MB8089:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e598df-dae9-411b-69ef-08ddcaff3b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FGOcDkrRHKn7ny9zRn+37g/RjXojS67zdsmYVM0Hfc1A0GfXZD+ljs37kSu5?=
 =?us-ascii?Q?cP9JT0EmE+zz12veS9Zz+A9WrG/aOYnrY/5cOsP8PM4x5814eiSJBVcBUXp9?=
 =?us-ascii?Q?VN/pmhAcOjBAV/UWX/1AASXv+cc5jguaveySUZ0fJIqhOqmY1c3H2LXZRoQS?=
 =?us-ascii?Q?iH6J0Y91iIb1JfrfhycgvNhkkIojRyQw4/hqPzggal0z2oZMNlrXueLt0fCT?=
 =?us-ascii?Q?zkjUfr46fjAaF0mrOM2SAdlywjbH/bZ3mbDGu54c8JSRTkpFUrDARrgy1oaf?=
 =?us-ascii?Q?P7tidKdnp3xM1zjFKolYDMshkPMXsV35DQDHJUtJPCvSd03MxdWOM6CjziRo?=
 =?us-ascii?Q?iXizgIBj8TGJObC65IjwNcdKjrRx+3U5QQd9QilRgzRE/okbc6Pn/8vGMzRz?=
 =?us-ascii?Q?Pz+GayO5VIYaxvrm+NYsjLGwp/E6mQ69uphFXVyFvcMG37JHJeP9dzQnRcIu?=
 =?us-ascii?Q?/nrWOU/UyCaJbZFd30Bv72iPdKvtIMJPYnzStC7yOjBV9X0kjqsodEVanW8d?=
 =?us-ascii?Q?X8Otcvqvi1qTqJ4OmOZW4pIbDvE/GhGuojaj58GQzwN3lvcYOz25HtYPFc2c?=
 =?us-ascii?Q?7gYmVmXp5Vz/jYhRzBzG9yI6z5lJp3MRbiKRkQqNpocQKnyU/TrtsVlYMz1v?=
 =?us-ascii?Q?2ZfDKFBJIC9rEYvzdUMYzXqk6vw/bPDGl7zXWylnLXYp5eqHJD/M/A+e3cjF?=
 =?us-ascii?Q?5JrfrvDSZrc3T6cU5aHN25zQPns4nygo/wh87V0J7miUgH8XxvFST2ZZcJIg?=
 =?us-ascii?Q?HfRMxKnZVc6OFUQKe1XWQmGU5uK6KPKFFrFN72MDVy4uCZM34SFPi3qB0iqL?=
 =?us-ascii?Q?Uw78uKTkVXIRoNApw2Xn5qacbdoXp5VSzy5wfaNb1d1ZysQ8E56U4JBVTnsv?=
 =?us-ascii?Q?EmAxL1recGRB4JLcDFGzG+yOj8kmXnr+I/O6k7CETayfbCNZ1aEXCKWk+zBJ?=
 =?us-ascii?Q?Dh8ugPZITC/SHSKcD9BbEYGSkNu5za8u5ApSMI7b9GPNaLql6Fy2aKcGwWfN?=
 =?us-ascii?Q?CNtR5AihZEOLtUDoKFDxzEvPPJzt1ETRhYfkIw+6LUSTeF6D4nxpmuTqMz2u?=
 =?us-ascii?Q?SUaIeq4mnlvgJAhsEAU1rTfFeeMV+hr7XI5aCpaFnYIn3gWFky4pZ9d1q72f?=
 =?us-ascii?Q?CCe5pw5kEsbBmQhcS0Omf/GNIL8QC4pdOCaAXArgSoerNvUW3JKR9MkzQUlD?=
 =?us-ascii?Q?TOHnSUTSd/HGL+0jBE/kJv6U1RnRIBOW4UUlFH5H3ZYvezKQM8kA9Fh1uMBx?=
 =?us-ascii?Q?PVaBQwZmjButppMhi+0TJGz+PR5Q/GgxcFEeBXe4An2XgSAs+WAHirA5PMZ3?=
 =?us-ascii?Q?LgJ35CZBNVzUAVdVLEk2YGn42Hvhm5jIl5nmMTOYk6CQbDomTa9YIwiwNclc?=
 =?us-ascii?Q?UxRIXIoavjjPPXg5PFJrROCZhczep4QY0WTmcLfGrapZf1vVSRvXSlm99mmc?=
 =?us-ascii?Q?XdDaNwESnUsXvua31Mg+NFm0elMLOrerYIm8f8vpAChkoSZI/EjtjA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?47eO5PcadLQvRC/RIabKSkl7I0lAcCGOAJaUI56eFU+GCIoeHn5hOTU8IPu+?=
 =?us-ascii?Q?S7pVS2RS8dU3qYgiVmRZLnzcwd86KKtIzJb98FgKLMgzpzorc0bl/IAzyrzS?=
 =?us-ascii?Q?Dfcv/+/fw74W1Bgk4UUBbWBcQyLyqonqFrFALGPfJDqvHivqUlYhXzDZQluS?=
 =?us-ascii?Q?30UIJfjml3UcGf6Njv6fLFk6bI3WkQ1qpEiM18zkGojByOgpq0wTYO4tglae?=
 =?us-ascii?Q?vJ8xHqtdGVeAp2rP3SEdz3VoOqZ9WadkT5d0rURbdS7y5dwjREKa9cyST+ga?=
 =?us-ascii?Q?MdfGjwEOVcOuU4dFrgD9atRkX7Wu4n9fTbAX33cXjgErU1RvUbGdUQKxMAg3?=
 =?us-ascii?Q?4vl7VeDcgE23N0mNut/VX9U5B3nJzqFoeRJpfRUFjQuoQ5aVntln0Tt4C1Em?=
 =?us-ascii?Q?GGukuhaChrA1JNggv5/gbMhwbxsOG6NfE8nJUroQ7HZxXNfTKvws2aa4Bp18?=
 =?us-ascii?Q?VPuX3eHOPXBbpmX2xTbxM/ntIRYpetp/EHlwvplBzusO9fm8xRkkxb2tYQB2?=
 =?us-ascii?Q?ajNWmeiw/cTDbpgHIPj6jYnf3MENpIRMAHVtlamPSM3Gxux2HSXe8uiQauqr?=
 =?us-ascii?Q?pEZfub/0TRGRxysenL+8ThvhXA5FlK8arPghuts0yItZ+MrbNDFyIqGBIW6Y?=
 =?us-ascii?Q?6tch7Gk79PMQn2Nx7drWOeA4CIa0QTOIG1Y7E1XZhDibRCKRspgbFFNiLeKs?=
 =?us-ascii?Q?SGTXgGoX8EMT/c2GoOWWFfB7VMX/kDunsvJN9rUd9+3TBddN1XqftwUamX6K?=
 =?us-ascii?Q?8dEwbigxAvnkkqWIdEhwnZUhPRWxOKrspRlM5kf/qh+nmt4gBKKjWjDTXAlJ?=
 =?us-ascii?Q?LiEYf2GV+dwTEgk7WE1fyJLXOUdixnHU6x0jRRN1l78RPwnXS0Y3Em/Z/F+f?=
 =?us-ascii?Q?pKc+qCitRy4EljPjqAeeV9a/gZmwMjxQg9WR1IhsPmV6ySVaprlasxkfzoDD?=
 =?us-ascii?Q?zfEJulA+uz5PwiLwuvZ7DQiE6BEivYWbHwiXX64Jh0AEBupE2wW+nDtTPweO?=
 =?us-ascii?Q?E9RlHIDVQpaysuwk73FmAdBeon/25lkriDswUj9HDACeonlbGjg45CHZc7pf?=
 =?us-ascii?Q?dDvR+1rGcGTU1YlKWsV25cz9vgMp6IHm5DcJMBmtHSlp2ke+npj/65jwSGES?=
 =?us-ascii?Q?A79vRUGQkgog2UIcj+DM0rjVtBCxbivYiK4qfZ3dtilUQZ8WZbsxllrFzGmC?=
 =?us-ascii?Q?2WzlryIsAsAhaCTA0393bdlRa1rCL7yodjwULf01nTnNe7zKyhHgt2ROYjQ2?=
 =?us-ascii?Q?o2rnH6DRzEYj9KDp6Fbc0VinPj/zP0z41Q33t2bhcg88HGicrSaRHYqenucr?=
 =?us-ascii?Q?/sQFmFeS3b8kdXxpnFa02osGuuZrfiD/eKw1N3QMacK78O6qsrI3NtOSEGRv?=
 =?us-ascii?Q?O86ly/eXS3jjZ2PxdIfFby/oC5voIGIxAknk9uoxnY8m0Jvrn09bTns2xLi8?=
 =?us-ascii?Q?QUEpkU0Hd89VPgKZgxyvUwde3Q6rOC3LIiQoflomN/MvLDOd7TUDhnMpAu6+?=
 =?us-ascii?Q?MdUooJKqUzyZ4pJ0X7hU/dbkNLM40JxvCbHoqQ2EQMgYbZvtb7UVQbaBDler?=
 =?us-ascii?Q?UnWQ7ZE1vfWlDxM76xiQg8xuwhc7yPhAHpMKkvW9z6OoZK/egBkND0pgquM9?=
 =?us-ascii?Q?wMFo5Ulmic1v2sR04q9mPg8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e598df-dae9-411b-69ef-08ddcaff3b3e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 22:12:51.7679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSE+HW2L6pZCQqrlj9b6mRRyR/NtFljmOjinofLhtYKafcrhNHrzZXct5GbonjEuc4BL3Vh1Qh00qCQaU4tJGIa0RiO7+cXO93l8TUle+c4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR01MB8089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_151258_720646_477088D2 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

AmpereOne supports BBML2 without conflict abort, add to the allow list.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/kernel/cpufeature.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 7a3c404288d5..d2a8a509a58e 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2230,6 +2230,8 @@ static bool has_bbml2_noabort(const struct arm64_cpu_capabilities *caps, int sco
 	static const struct midr_range supports_bbml2_noabort_list[] = {
 		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
 		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
+		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
+		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
 		{}
 	};
 
-- 
2.50.0


