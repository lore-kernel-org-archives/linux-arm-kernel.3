Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00A6CD8C88
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 05:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EeZDeaUVX3w9Nxu7fiy/Om7OMZfziYeUq2vleKVEtww=; b=WsOlaMm5sJV8J0Fs5kuhSHq2JE
	Qljs1fsXbSMegPElyK/88Q6CFfbsYMECAQ7n3bACiNXaRHKes4fwgwpHzrqNw9Vm1AAI4EOYwwDWE
	mEMrQTNy6FkO9w/xz63CguYDvn89fgtNtTP28yOUadn6VtSOT64Xj4R76TyJqMsxsuD/Ozc4cWQS4
	PkR/TIiioq/HxyhWYoEYKdt29TTcjl80a0fODDE7qH9YCeKxmZDu68uaxsOILbLHC9nRnjvwRqpFE
	QWBHf6XNQ/ScL6S7KTOzvBT/JvuvPLWu684d97lol13h2/IXp+giYbkeYN0xU5sScE5+usfOVmBc2
	WBXpeqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW5lu-0000000220u-1oy9;
	Sun, 07 Jun 2026 05:10:06 +0000
Received: from mail-westcentralusazon11013065.outbound.protection.outlook.com ([40.93.201.65] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW5ls-0000000220Z-0GEG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 05:10:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPLXb07pED7XgtxlcZZyePXVx2SwwY9kl3SSAkUbgkDrAwqK8Nrz6lJ4R//MsTvH07tpP5T0Nn4jczY2MhuwPXvPNRoz7otyKV6ZPfHolNg1MYH8aw9HAveiuxOuo0eUQ5hUp01W/FTH89XoXzIc4xN0WQoKDNpWNyA9aMiuW+45TBeP/bvoH5knrxR7Ao598GjjPM9yB8QPnvR/vAoawXIpgWLzGgU8bUVQzeXpT5aN6fjEFgUCCUNBIy9j+jB6UsP7kNzl52gq7DQzG9c5ZjTvoiFNLphAibVZCJIwqQRtNs+pVlEftBDMTRYak4WnyaAzJRpkeK2EJh1DKwAnTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeZDeaUVX3w9Nxu7fiy/Om7OMZfziYeUq2vleKVEtww=;
 b=thRqMDtb06yl3y04gucB/GOXKduej3ApxiWWYwFj9yM2aitGSisXFedyEvJlGi1rvGZJfSwCcoLSULHdqYIBZzsLauXgUmiPakoN7WoyNx1k5VosL3QeDD2maF9RhgvYZ0sarNtHqMFMmbgXYdj9XbAwhRR6tksGTziQi07mRRg8O0bY0I2brUpTHx+vR7vuuS5UoGbIlnXl9crBOpUsGcdKJR7MVAt+TghU7Hr+EuD/ezxqe52ck3bzvFbAKMAM6zR78LqvOa6n80JB89mNeMoFoa0ZiwaF/adAy3kjMkRYYJzgcrRoXiTVIVN15jpPGrIuwfQpo7It5O3zkitg5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeZDeaUVX3w9Nxu7fiy/Om7OMZfziYeUq2vleKVEtww=;
 b=tj3lV9/QNWxCWO+07rdeHN3KQYcmnUEDcJe6I/ViW1+OZMYUZ9gzR7KjwwjSl0SCXS+K0tf6SDhyygoZrrtHb7tBts6FBVXNo8Gi5J4uHIh7WZc3AYpc+lXe3zeqeGJYFc0ZwDmOWT7DcJ/+dkXoQ7DDY3e/sBkvwRUYSoiPFPmwI30607qEaX/JF3Waga+KK9o2COfmcpEOQchlw5qSFyNP7/cFj4BeA/hOAmOsMUjdRxgR1BGOIdKzox5bkj+mz7ULe3lhDU8KvmxKuBCmxqkC6p/R9mVpF4jwjp0i/VRtvHVVWME1sZdS7FGrN2cp+yArh22xANBrPZSBGbPVRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by MW6PR12MB8999.namprd12.prod.outlook.com (2603:10b6:303:247::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Sun, 7 Jun 2026
 05:09:57 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0092.010; Sun, 7 Jun 2026
 05:09:56 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Jesse Chick <jessechick@os.amperecomputing.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>,
	Matt Ochs <mochs@nvidia.com>
Subject: [PATCH] arm_mpam: Fix MPAMCFG_MBW_PBM register setting
Date: Sat,  6 Jun 2026 22:09:25 -0700
Message-ID: <20260607050925.252475-1-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::17) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|MW6PR12MB8999:EE_
X-MS-Office365-Filtering-Correlation-Id: 86111ea9-e9e2-460a-5c2e-08dec4530418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ElXRiiXoujkki0KjVbmU/2bKJ8PgaqhId/uR6s2ODxvcB9HmZ18MpZ7cIJmkAkzpNgeR6qnpbVKAm4oFUurdqDXfc2N4ZO4XNUbMJ+GD41i+IdqQeWBjuOu34FlrXdS5vlYvOxltGFJLgrTkR5opwGhlc/dSO2zaTjwKjkkMlr2TJTZYq9X2vepsw7toY/LN+SEVDXBPdUT1vSyype4uhcRAur9vjiQYpCPjghjvrW9r0ykXYG/TBrMHCcKNUQoCKM4oQCiGdPa8raPo1FDn5Jq5BsGJuCcCtHADvL1yX6QLouFeWWPPz+Wbjt6PHmXjz5/uxKIq67ydm0niuIm+xOl9WR8YxdsUf8c2I83ruC30v3ePC/mOeJbGdJLc0FHzIhdFqzsjzjW+E2a+RZFzNfKsYN3Y9VMJbsFBe9FalsWUyKrK0GxshEvOvWNHOUnH+GIq7FHx2Hw01hkSlwTzp/MTmcO069LECReM/nexJmW0uarupMhJE7jsfPCPtTzi8EJOPGnhyeiGawqRWuWEFZpt5wcqUB33zLZ/LI07JRjysfK1sYm9Bhq6DT4awSA+DStuAeNy01f0okZPa/ZJqsyIOBlbaiFOcrhwzJddJyE0uGP/FZmkflDh1qpD0iv2fVBF/LJ15rL6Tsu6E1VYpY3TIWQ2wSNrzTFDe+oIPnRvToIZsHu4g7F4TpWvoOxU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GTtd83D3GAyYPcbBXg88qOPTEuE5j064YtHaLGYvB+DxvEhZ3Ol26pbcWOM0?=
 =?us-ascii?Q?A/IiREIgU00PIjtGI9i+GQNj9zAqV/7IubNLKfRq5f8oNYv5koERXtKEDW8I?=
 =?us-ascii?Q?8b/8/dqWE2hKyhZwxHy7jVudTFu/uDMlg34cd9A7YQ2Vukvorkxbsy4IW05G?=
 =?us-ascii?Q?yCvA5MU4rnTFtIG+LibQ8PUCIjJ3VLLFKaAAuouC6HPPxc7LtGdt08MZtRVv?=
 =?us-ascii?Q?NHD5s33lZDPwfOgwWSIOexrzKDKyh4LmwX5ZW3YiIk2V7R3Gr669GfaXR4sS?=
 =?us-ascii?Q?V9kCm3oKGziTV9SUXvyUJrrAttEB7gOzWF0ja3i6GCtL/MGrEVyk8Al0kMMt?=
 =?us-ascii?Q?ZErZHlp2eaYdwFHslL1ROZLVvIch6boTd/MI+T/6xE8o7x4rTqoM0p10Srh6?=
 =?us-ascii?Q?qiu/0ph6a92eCattrU/IAsdRrshiO38bCgpYXpVf00h+iXLfAT5z1b23t1SO?=
 =?us-ascii?Q?HLU8d6hjpFZjVBfuIj9GOGubSjsP+3mQdpjgpOu0nMirmqAiZKBIEGUjmiIJ?=
 =?us-ascii?Q?68nGQAau/m/lh5Ya+iHKRZFU6GgH/JClXWxx1kQFOXtwVg+I1+O2bjEjQJZf?=
 =?us-ascii?Q?3rWi7om7I5Ycq756IaTII1HKlBkG2bpFPamTC4zboT7sqkQ566im0e7sKu03?=
 =?us-ascii?Q?yDDInrkizZTdOrnhUHQ6ThB0PobdoRvsRf4DM7esXZxekeB5h7NvJdRPXBgD?=
 =?us-ascii?Q?b3t4S11lu2H8wsPjq0Pg1vxm5FQG5Lv757CbciCF3+EL14JYigZMlD26qdGi?=
 =?us-ascii?Q?I3U5E0aoIySprdbzLOZfp5ncczllsF6GKX6bEQgijMA7btx8zUgh2hxHXTcr?=
 =?us-ascii?Q?XPds7f3DUPkRZTdE/M5V1dRxpx+R6xpZt6kyAJVMq5HPZFP0aQIZlSrgdEbT?=
 =?us-ascii?Q?nyaiJ4a/uWzfN6niJBRfd91M/upg64taqn2QLkKctHMbr626Gly6ATgLf5lY?=
 =?us-ascii?Q?4f8IbWPCmbl0PgyKzIRgkAaaDeqYrGsDFba9c5YT481IuBBakITKZT4I154P?=
 =?us-ascii?Q?yZP6n1jmGz9DXfW7bVcEBnJKKFyTnWbP8Jow+XC5a5BD6rhQ7tp3iX8Ga8S4?=
 =?us-ascii?Q?r3qcjufh8wvBP5uICWHejFAW7EtURZBWQ+LkK6sKQmzjp865vaVCCUxHyldH?=
 =?us-ascii?Q?NRN2ZFRnzb6cliKujl22vohYB2VtpBlmFYmqaDIWsL6Y8gyZDmnAslUNJDsT?=
 =?us-ascii?Q?B5TJH8DMbUdTUJk/WbVv4r9yFivd07c+rESSr/1B6XT9ZQL/SjXplSsLoz70?=
 =?us-ascii?Q?2q3Vbg3w6s/SNAUPFFy+1MWuhx0GkmJLVUf3CBf88jvhchcr0QsasMDpRtql?=
 =?us-ascii?Q?0QuE9pBlk0XK4baOskXVPjuwcCX23zz4fkFdBGevpel30szA7NuL4TKYtAw8?=
 =?us-ascii?Q?mKHBD8e3LTl923Uf3W+XEOlz1ZPI1wYT2zBFB3RPe7G+8vZ0YE8vYtVn1kHm?=
 =?us-ascii?Q?4ug5o1KeLfpytU/yKj93ZT8WI6IbEjVr9wBDr4ZmfaCeyL4IWgmEy8RgoPQm?=
 =?us-ascii?Q?rZEo3yHK+HU9QlneWrbF1sizZC9Y8dTVBmPDx4wBZdMU9UdZtITV059AIEo0?=
 =?us-ascii?Q?yHZL1uWfmDOhc2jL+VebthrpPBED5ko5QbXZthVRFAzfuGPkyrMBQSQD0xPa?=
 =?us-ascii?Q?2C/ciV5C8SwF7RB47+zBU6lMmtEUOpHnNDQwNnFsiWi30RWL32uj3EbfZEyf?=
 =?us-ascii?Q?NTGFOBeTVy87kVMSa0wxQELh1U9fvlK9hG+M+2Mo/ZbNlWKnLqDgiiqutoGP?=
 =?us-ascii?Q?Jx8cZujjkQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86111ea9-e9e2-460a-5c2e-08dec4530418
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 05:09:56.5972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3vAeha2liBiC+5zfNwgZmzbBV9PhqHIcowekRxHb8rPXOIPJe2oEGoOyyY+CYXaKEGnUIZGC6K/LmqE4r+DCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8999
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_221004_120489_BBA59141 
X-CRM114-Status: GOOD (  11.58  )
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

MPAMCFG_MBW_PBM is written from cfg if cfg has the MBW partition feature.
It is reset when cfg does not have the MBW partition feature.

But the register handling is reversed. This may cause an incorrect
register setting. For example, during an MPAM reset, reset_cfg is
empty (no MBW partition feature set), and cfg->mbw_pbm is 0. Instead of
resetting MPAMCFG_MBW_PBM to all 1's, the current logic will set it to
cfg->mbw_pbm, which is 0.

Fix the issue by swapping the if/else branches.

Fixes: a1cb6577f575 ("arm_mpam: Reset when feature configuration bit unset")
Reported-by: Matt Ochs <mochs@nvidia.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_devices.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 4b93e89c2678..d8b0383cee92 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1570,9 +1570,9 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 
 	if (mpam_has_feature(mpam_feat_mbw_part, rprops)) {
 		if (mpam_has_feature(mpam_feat_mbw_part, cfg))
-			mpam_reset_msc_bitmap(msc, MPAMCFG_MBW_PBM, rprops->mbw_pbm_bits);
-		else
 			mpam_write_partsel_reg(msc, MBW_PBM, cfg->mbw_pbm);
+		else
+			mpam_reset_msc_bitmap(msc, MPAMCFG_MBW_PBM, rprops->mbw_pbm_bits);
 	}
 
 	if (mpam_has_feature(mpam_feat_mbw_min, rprops)) {
-- 
2.43.0


