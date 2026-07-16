Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06215C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AW9TjGSatVvWSZ0TGUUwybfwE1IN6Gx5okMhDPZ0LH8=; b=Oj0Dc1cxrn1u1AhRKSW4mftRVj
	/JjU97lQ0u5x8gd88KY+gDOAYHOYL2TkDxsyiqAvsQjcabkfu8/2Oq82rMzCyPZvttz9ItA5jbuER
	PjB7lFPu9pYMCT/r+VcZBCdSyVWZAG9bQsaKW/ph0xh9hDPRPuV2NH43O9msxmMhjIzw2hAxgHq8f
	ek2u/W9Mv3zIvGTo0Dgu6di5Q1MoO8UGVyXzaw30tMmuCPXwXYVOkHM5SvdbPI7aGTcggjwi2KSLs
	FWka/XXSFtJtXtw2F+zTwIj95v1/Nuagt9JqRodgCGQQkT3gAmbi8cwU9h57FnQPJfck9mfE53GV2
	mG796N7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFG-00000000Y3Y-0xUN;
	Thu, 16 Jul 2026 21:03:50 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFA-00000000Xx9-3WnT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:03:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCoB642FuSE91q7af0l8FwTtQOoyYBwoOAGRAA+PVT4H4pJd7b2WoK7uDegzAuDvY5kErdfXDQtgfHCMjuuKOYIsW2rHiip6gOvVmQquZzsOl6P4KDjeGzxQcPpgxt9pOoi9E22ef0hRYhLhUPSp4YZjcDNnZ6rj0RmymdwS6kVKCNPMYwCUrxfriXi51GkeLep3zSPNdSpivzvMVpTLB0Rr2pkrWoOTH1OV9xdVWm4PyKRlQk9WlPP16uQVrw4RbJ7udUwGAVhoH2vrjAEDDDW2Jl42+03Y0KQOvQGvlaQ49S/VJ8tSYFtaHTOoLf+vB1WRbL3niHKT103331aLRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AW9TjGSatVvWSZ0TGUUwybfwE1IN6Gx5okMhDPZ0LH8=;
 b=sqkMXOHuAkLkueM62PkHcBsC4nzIoai58zlx+EVu5EY77hcmpjYFXHvifh1M6yywbTRabUzdvX0JL3NEGyou7JtTLNq5hMj05FHzbxS4aUd1oEMcYHe8RX16icmuEsweBtg1xBl2K5BUCp3UoJXcuYai/ltorpa/yUSsQiQ+LNoK8iXw6xteesxo2tW9MmscCQFbb2ydVprmSn3zr9PL5KETg9QawkCD1MLGhtrSaiIeHdJ+engjjzAzca4404JsfYjK03hGcIHQU2vXpnZqHLvm+9DpgArBpOGafOu4UwmAO7d6HBY3vLpwrir/0cDGlFdl+kG9bGlzWIlnW/eQAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AW9TjGSatVvWSZ0TGUUwybfwE1IN6Gx5okMhDPZ0LH8=;
 b=Knwelo65ZSxyedw5IMa5+NlxhYHDm/8EA5zx1ij7Uz/jce+tyIXhScI0yYxpzVOl1wZASlEmJQ/fMm2SamAaGa2/taDgGyyViY0tgdarSWVJrlfLYKKOvQsFuPW3m/aHGnRpsaTunXKdOKh5cRZHNLE0PpQx95KmYGLyr6la7TH5dZpa3q2dO8GNc+fMXsD+r97iLkkalclUJJc0zvGDTWRr2wVaNIbGDEa80TFN+TZMfksSlkFBOuVuHmfZ1Q3OZ7TVMoHTBHu9dKU5YcgFQJcd9rvAtIwMa8jfVKRheZBXXiJD4QZxHABQTxWAJ7dlI65OZJJqUJ8OmoX9l0mOUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH0PR12MB7485.namprd12.prod.outlook.com (2603:10b6:510:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:32 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:32 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Newton Liu <newtonl@nvidia.com>,
	Gavin Shan <gshan@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH 02/23] arm_mpam: Fix NULL address access issue
Date: Thu, 16 Jul 2026 14:02:52 -0700
Message-ID: <20260716210329.2914625-2-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:a03:331::34) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH0PR12MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: da4fd157-02ee-4e02-c3ff-08dee37db192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|921020|22082099003|18002099003|56012099006|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: CL9ERHL0TpcHdqgc4Frt54aDuMd/XMopPMkP+7U2zfX603XsRVk8IUfOb/NyPttRAsFopW5jH4asrPpIXMet08xqOEPimtW4v9fFCpKtj50qjTThd0Q2CGutaMiFp8esefdrT/Q7/OsFgGa8jtZ4JJZb3QKSOpiVQvov9MejwpmEe9UwC+MCmul+GxlKiQE2Q3+myJJCkTqN0RgPta2H6EqcsYrraZVRvggZGS7aza1wbZ5xiyWCnnkFwvqsnU8G8cmppRwwCUqRGJrfe777IqdE6oD9u8phD/QkoOYIrycDmoyhbBAdWO7rDbqxLNr6NId8azAyxzmDY0NAkKj/r1CyPDoBtm7VRbK4THOrLiyyAVMOKOIBdYTto6ss8KaS8TAMU1gVjOfw+cw7CR0jmS+yt+UPR+isHbgIapXbBLpGtaLinUhMkXKru23MmYy7Gs9Iti6dafI5ajgBOpnb8KXWHw97CZdMC8H0ngQKkqnnSVCf3seIPIorh8At/azQVpRBgKNcJgZQ23nevxCm6GWOkvOLSwZpZVXqEVP1OhA+Ako15O89WUylc5WvEbmDV/izASMK5dkezRg8+IbPCKNt940sPCCXx6DkZaCR7pkiqEoeQPTCb2PZPZjCrdnZALZQlcMvca5YdQ+uP7hUYB4BBM/A7Q3zS2XsVyRIa2EWAx+D/DFqdxK4FafKdWkIGxk28foL9oJyptCAT34emQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(921020)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EF5+SPvUf23Vrd+RU/uExN0WdhS52MkTO6CoPs2qFnp+gTnVln0SicFABRJz?=
 =?us-ascii?Q?NDdmrjAq6QCmkyGYU7Qtbf0ud1Muh2S/4LOETNXXSbak6cZn4/DtyslN6551?=
 =?us-ascii?Q?eXhZRlqRZJy5uQSvWMledS+oAD7PRqSYJkiH+Qnk68C0fj1Jq0f51JR0QVYK?=
 =?us-ascii?Q?XipA13o/5F9JS2cxtDfcdrB9hvfPMQcADGPZ95FtVn/jKb5OKxzMC3z+X56P?=
 =?us-ascii?Q?QLItO3AxSf2b4mm14s0And9vNI/IZ7Yj79nEg01EbINunoOpon0nQ/jhP22w?=
 =?us-ascii?Q?McprR1uoApv4ptAd1kXDw5y5d9UuM9RmNEBIOsfcBISq0/YZZwpcmfmiDl7N?=
 =?us-ascii?Q?KiumTQ2LzhxJ6tiG5fGHGtbnDKbGE4rwIU4DOx3V+Hpkh8THHqbCb7T3d4cZ?=
 =?us-ascii?Q?OSWWHWaynN3jmv4HMGNhoxXFKKryc9VVLltXfZjNlYCIepWdRjUuMaNJJ32a?=
 =?us-ascii?Q?0vR0Uiffyr1nEiDMyK0pUHXP+OSL1fAQYVDm5P30B22YCJscuMOH3rJ+AmwT?=
 =?us-ascii?Q?Cr6e9mmBmT2l9bB1EW3XwdUVt4xMouBtrQwWUOwG8KHuN5z+V7mZNeb/YF88?=
 =?us-ascii?Q?LqnPGq6y8ygXUaqr4TI7GgRzkohxCPx7oV/6stNAh8763kx02dtB6YXhxn3R?=
 =?us-ascii?Q?XHaqo4gIkH4IZWqrmsVCGjGIzFinsCy+1Bxq+sheB5GN1IVyh3mn5zhfQQkw?=
 =?us-ascii?Q?YDmYpQmvivEu+lap5Aep5bSCujrx/pqyUvNQ18WTxzw3CJjqWLNQ6GPk7IPk?=
 =?us-ascii?Q?QsZ97FazMEvRJz1VYrWGb6ykdkBOdkWyn3ntmR1OF7o7J6O1RFzYVYp3w0h/?=
 =?us-ascii?Q?/Lp4XiGc0FRutPe03rpq5bfNLkvjVyxI+Hdp0koVnJAmQBKSIO+pGY+nJNhd?=
 =?us-ascii?Q?XIp+pP/oVs8incSejyZabxEk7AXyQBz5fDB7r2SuUDT/su+CpGZfLAxKCqBf?=
 =?us-ascii?Q?j3+VGgwTDaRbcwzs7Zmw4YGbNbqzmoQu4w5hZI+e4HE/9Z06sqmXg6nH6rav?=
 =?us-ascii?Q?fMOBAL4zEVvNgH4klnYeURDJrVo5lXz3ntWhQbBtiLUmRtGfPhlaSwuuLir1?=
 =?us-ascii?Q?8J09yEYXFONKJJi8vdcupW1YnVZzY5VDenEIl1yHO3jlizJ95uG6PdVF2QvE?=
 =?us-ascii?Q?5Ft8WrsTwKC9c+f0BuDvLpgR1/KI7esDm/Otj3kaFWGuOqjAW+HYzprc2D1l?=
 =?us-ascii?Q?/hBoYWoQ+SlTual+RKfbbkspt5vHEG8TZJP9lPLTW9pMquHoTWXTLCpEwxoM?=
 =?us-ascii?Q?IkvkIUsXERAub+jHiHhuEQ2zyodJBgizH+yicQNXz3fogKc09YhS2rDED6Vw?=
 =?us-ascii?Q?OAe51L6d0sFLVP7/fS+LOYPp3H+vAimBfhQe1JjjQ7AmBdWjefSeTFGNvJV6?=
 =?us-ascii?Q?SnPmAD4+TxS/NC9o3gD/POzK98VArScqc2MFGGK13Mzna0A4WW1yUJecKrck?=
 =?us-ascii?Q?mifVAsZt8+AqPuq92UUJehxbn/EzCu31pzDO4k4ScX1uI0F2RDlB+4iAT5Xf?=
 =?us-ascii?Q?KxOWX1YtBlBa4xaqRqEBsDwzns6mc4GsOsrDUkQE47bGSOgPZ5iDhTZkIRV4?=
 =?us-ascii?Q?twnM7DVjh2UXnA56wWqCSu5t2QeSPxTJL+gVr3SDADW8fVY9IbFli/J9IV96?=
 =?us-ascii?Q?AIYzACeEEghwn8qiXOm++ORjq5QIrp/U36SrD4NtgzHaPdHD3CsdX01xj3To?=
 =?us-ascii?Q?ST9+OjT/k3HCgLUHfJ6SHwy5z5WMhjtSTaCYR2CFluyM8wyS3zvU4deOQyxM?=
 =?us-ascii?Q?N0OKrNHDFA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da4fd157-02ee-4e02-c3ff-08dee37db192
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:32.4568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5kUhf8gMqwB7fO6tRvyE4Hpbc7zc5F4bynnCSFEtIoCAXR7mFV6AX/Z8U85RTOGFdvck1eSVCAcQ3OFKoJJYJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7485
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140344_883227_E24A6A49 
X-CRM114-Status: UNSURE (   9.52  )
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

mpam_resctrl_setup() initializes each resource's mon_domains list but
not controls. mpam_resctrl_controls[] is statically allocated, so the
controls list heads are zero-initialized rather than empty lists.
Generic resctrl walks controls with for_each_resource_ctrl(), which
dereferences through the list head's next pointer and can hit NULL on
resources that have no controls yet (for example dummy resources whose
class is unset).

Match the existing mon_domains initialization and initialize controls
with INIT_LIST_HEAD() before any resctrl setup path can walk the list.
x86 resctrl uses LIST_HEAD_INIT() at compile time for the same reason.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_resctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 68b94008d38e..e2cb3384820a 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1942,6 +1942,7 @@ int mpam_resctrl_setup(void)
 
 	cpus_read_lock();
 	for_each_mpam_resctrl_control(res, rid) {
+		INIT_LIST_HEAD(&res->resctrl_res.controls);
 		INIT_LIST_HEAD_RCU(&res->resctrl_res.mon_domains);
 		res->resctrl_res.rid = rid;
 	}
-- 
2.43.0


