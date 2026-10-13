Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AECACC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 07:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBu4ItKJRdLhP8EHHQKo4CfxK9EKZa1Hm3KHTYQMOGg=; b=gicgje7YZJ9VVK+2HwnWR40x6N
	SYTB1iXhcnw7ArP6/x8CwXhPRnvKy0prGEDGmhmd/+4uJWJ0lyLG0J2hkw4JEQFsms/mg+3ls5bf1
	4lJHbo5fYoZ53CL+N6pxPcdaVRF3+M26z3rrqDjwB/MQGmDtV4ZReO7BWYHP3zHdUzZsAC6l724ie
	wVEvws5+BqiiCks3vLPotBtTnNzXXG1mE/jmWBlIlsaOiyVlVIvEDXvo3z+6zP0xLMxKoyXgal7kf
	6rF9yzrMasw94lhGhymQTPVZG/Mkyz9frTFPm1wpWVj5fccXMRa4thY7RvQEIZ7BP9PmjULD2tLmI
	gEAP93fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGWWo-0000000CBHg-1KAS;
	Tue, 13 Oct 2026 07:02:26 +0000
Received: from mail-westusazon11010044.outbound.protection.outlook.com ([52.101.85.44] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGWWj-0000000CBFM-33Fj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 07:02:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEAXM28LHlu+l29lcbD2y19iS7Gfw1EdxxRTo/ywpCFqy6Cqxuecu1Sq+dfRPnRaljPuZ7azSZ13QqOfYBGKNNKDkeFtLWuPthCWW9KGEESMQGjz1/ExuXxUPIf1YTV+7SC+z2OqTBKpXCmiggAfTjqwp41vJSrVyZwqp9/SXcQ7VevyLx4YGKWBa52BwrT0sIOp1rVsW/gTz07DsFx1sxQR1q1AEBsRLZ/liAsPoKMqthXLnNcZ0lpRb9Zf6UX0fiWhiLDDSqQrzVa2KAO0kXksU2Y0S5IJ9JQcCbF1nyx+Uk+oW9b7G9xAQhxy6qKSWnSlmiuRsIimFHJ4uvI7/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBu4ItKJRdLhP8EHHQKo4CfxK9EKZa1Hm3KHTYQMOGg=;
 b=EEsRExR42WLnexyKeKzZurmifWWU7/OgtU2KhSPoZplJu6/tvlUWSV1FtImUuTy0xhNUf1E7ea/3wED2tc1LmXTCIaAcfCBpsgKBoQu6DZKZSTal+9cIzYALsWalb+S/r8I1mHq/0GgYaAip1YVg2xUuiz2Y3ZEmpVhKIRolCWONqdXQIn5UOmuCSdgFpH6wRcxxhHMrtS/OPCGAiWF0aQAVPju8PCK4qBEYG/2Kk33JhtKd5roPXq4LCjNZd4MOkzpzl0lnHTb3JP3dUtuo9KWSEj1lR9DDIqP/92GeeaEXFgmEhO2kz4kH0h06uDK2QqJFE7STqvlDIsNedNEwtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBu4ItKJRdLhP8EHHQKo4CfxK9EKZa1Hm3KHTYQMOGg=;
 b=g8eYOUITU7/GXLgTQI1+7Bgp8BpjJ0/pEUT0dqwLmfgcikZb85kyzyu3qeZbIuntXvoxbV/tVz1xdrwJGJAREtrlQ59A4R12A1Sn9te+b5zaul4+N7ByfBS+nypmCKoPr43ztXILRYP1n3n65pHRzkhjhl1CjFPifiD8sdtx5NzUJhYPoj1WBeYZPC2OTKyJPMIQMVU850NmOUZqgl6JnGqiMp7s5W+nkNHvoSWaygNsUWG8hPQdh/UbzYlKJ3coG5ZJYpLe+3opmFbYzjkSmomnwJDhdU9xI8Lujv9Oq6jJlZYFLTA8DWZgK/+7vcHXeyCzPJJEbTVp3+/U5qDsig==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LY0PR12MB727857.namprd12.prod.outlook.com
 (2603:10b6:408:3ba::5) by CY8PR12MB7416.namprd12.prod.outlook.com
 (2603:10b6:930:5c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 07:02:12 +0000
Received: from LY0PR12MB727857.namprd12.prod.outlook.com
 ([fe80::843e:82cd:41ca:f522]) by LY0PR12MB727857.namprd12.prod.outlook.com
 ([fe80::843e:82cd:41ca:f522%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 07:02:12 +0000
From: Srirangan Madhavan <smadhavan@nvidia.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	conor@kernel.org,
	jic23@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	andre.przywara@arm.com,
	aneesh.kumar@kernel.org,
	Souvik.Chakravarty@arm.com,
	treding@nvidia.com,
	jonathanh@nvidia.com,
	bence.csokas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Srirangan Madhavan <smadhavan@nvidia.com>
Subject: [PATCH v4 1/2] arm64: smccc: add cache clean/invalidate IDs and return codes
Date: Tue, 13 Oct 2026 07:02:04 +0000
Message-ID: <20261013070205.3566865-2-smadhavan@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013070205.3566865-1-smadhavan@nvidia.com>
References: <20261013070205.3566865-1-smadhavan@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0214.namprd03.prod.outlook.com
 (2603:10b6:303:b9::9) To LY0PR12MB727857.namprd12.prod.outlook.com
 (2603:10b6:408:3ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR12MB727857:EE_|CY8PR12MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: 975d38da-4823-4124-3d30-08df28f7e7e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|10067099003|261009223027099003|11063799006|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: lG5Oe7KCSrGWqnx2ILzbI17B0BSvCZ6QKZ26SJ4Oz0jcKDzZZQ3L9xQJ2n6DFdl5gDbUla7QUa7efkptqqlISqWix+JuCzoCR1ijmOx9ChCndFGw9DxVXwenNymSXNreIEPd8V+DwQRHtBl5JtI05PWh3bm0WglytsrmJx2gM1QPaER84a6KLTZ6Gq50FHEjns+qXjLhUzHII/zH8/3DduO0asrSmZl/MaNvT97PdTMcxnB9IcK2I4crO9qnsslioM6VMpbhUozO36JNolw4wwV8JF13eY7eI02G6aWqr0tSIavCmBu5TKE8P/VfST6vdnOMvFiVvKM0Gf7EUjaGW/QNctTN/rqE7xU+5SwcbPdAHZX1O+g+zS5LTG/5FsSuSCwxkVc7AwCoLU8XsBODujLkoJ38N41j7+TAR0uk5iR6znznqw5wzDxSDTWGgobLZIsngQE7x1f+QejQujrXzM5+UnHYwX5/eHboF+mNr3ruXXt4S1zG/QOiCpWneoWOHSqHvC6xE8DRQCGqBpFUtZBlOt6s/s/fg40BfMiFsT/aU6CF6jvOR8UjlHeCp3YEb9IkVenyBJcGwEOA6M4gkUOfFwq7FZSMIRInrg2mSvbf0NTKzfzfBuAqsgKDIehh2Kk+5UVvLi2UpbMIJZvQuyPf7lAU5SlRx4Lw83sy2nQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LY0PR12MB727857.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(10067099003)(261009223027099003)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmdCaVIrWjFIbWpQNTJObWdPL3hYUUJxdnoyb0hHMzBWNFZyK0xZVXcvYnR4?=
 =?utf-8?B?ZmI4Qnh0TlpTbTBxQ1lyRkxtOEZWb2JNMGx4ODNNUVhkY0Q3aDNzaGpvY2di?=
 =?utf-8?B?OG4xTEdVdThSY3lUb3BsVnZwR0kwSEp3dDJURlAwVTRDOUc3RHZrR3lsK09y?=
 =?utf-8?B?aWREOGRvTzRrVTIvMHdNMHROSkhXVjFOUFpBWm1vOTVHUmM2Q21ScDM0UVlv?=
 =?utf-8?B?VnZpeTBwTGZHSTRZbWlaUWhCai9ybFRSQmdvMVhGVmdtM051T2dLTjRkVEY5?=
 =?utf-8?B?aktsdUwza2JnV0VPdktPaVEwZ0VURExqOXgyTmE0aDF4UlBMdkl3aFN5RnpK?=
 =?utf-8?B?aGtkOTl5dFRpaGNnVjFmejY1M3J4N0tneGZzb3NSNFRhYllWbis1cjR0MlJ6?=
 =?utf-8?B?WUEwbDUxUGplcVQxcjFsOURiWDBKdlVpQXdoZjJmTmVWNHU3WkE3VVo0bWZS?=
 =?utf-8?B?V2FPSXF6SzNISDljYUNzTGdDcytYQnlCeHpJcklEZENMUnJjMmVKWGdKOGJK?=
 =?utf-8?B?NmluM3JMQTJ4MFdXcDRyVnJjZmVnekZ1SUozWUxJdSt6M3ZXQ2N2eFdGa2xr?=
 =?utf-8?B?cUxpUUJuNFBTY2FrREpMcHJ4QlViVmZBMXR6dk5mTFNodWtZRTE0ZFUxRjc4?=
 =?utf-8?B?QVR5Slo3cUlmalhESE5vTkZyVm5sek1udHBuLzFXTnppTGFVZ0tpaUlTenJV?=
 =?utf-8?B?Z1FxNTliRGFtejlmM2l1eUlqNkRZV3F6ZFI3b0RvWVIybDA4a05TWGdKVGVj?=
 =?utf-8?B?bzhJTm93bGpsWngzb3kzTTJhMDF0amM0MHlxSDY0ODdGWG1oTDRDQm5PeEJL?=
 =?utf-8?B?Z3R5dXlGaE5NSXNZbGtLa1hnMkd4OGR0Q1V6QW9NVFZzVy9kbGlkekJoSENw?=
 =?utf-8?B?NU9DVUp3Qm5uM0ZZd3JGSG5xVWdvK0M1Mjlwa1o1UktXYWx0Zi9mOXFWNS9S?=
 =?utf-8?B?QzAycHdhdkhXOHNlRWZ5T2pzcG9helBNWTQvbjBJcllKWFhlcHZ6WWU0TUVl?=
 =?utf-8?B?M1IwUWlEWE9USnZ4NUtHODNGRkkwZ2hHK0ZTU09XTExORHJnQ2RiTkdYVTBW?=
 =?utf-8?B?TFF6RGkzVEdhaUQ0d3h0TXZkYU5RTVZtbDVDZzg2eVNuTnJtdjE3Y2RJakV5?=
 =?utf-8?B?cFNOMDRPTU9iekgxeS9SSFZwNmlFN3FrbEc5RzZnd3ViaUUrU0U2dlpYR0tU?=
 =?utf-8?B?SThkSFJld3RiaHgrbXJBWWNydVNsS0VhTHdXYWh5LytZWU5Ibzkyc1llRkRr?=
 =?utf-8?B?M3c1Ty9sS0x3QU9vRXNwam54QzNVQ0ZBdFlhcnhTcmxmN3JtZW1qTGMzTS91?=
 =?utf-8?B?d2lvQ0NIYUxhcTlxY0tmbldDcmo2VjFsZFNTYXgwVlBzNjVxK2I2RjBXUHVa?=
 =?utf-8?B?SVg1UGZPL1Y3eklMQ0ZYeHpPbE5uMHRuWjQvSi9BRCtoZGlzWFR0TlBDYnhy?=
 =?utf-8?B?SEZrTzNFdWhYMGdGc09vVDl2MTFZVlE2WjZHUXFWS1Z6K3QwdlBxNTJyTVVM?=
 =?utf-8?B?bDRJb092eWVSdEl5WGRNMmNCWFAwVUlvR3ZTQmlURThPdlo5UGx3bzI3SEVw?=
 =?utf-8?B?YnFYUm96cGpNNzhyb0laaGg2R0IvV2w5dnRWUUxWQXdadTU3MS9LYU9aak02?=
 =?utf-8?B?UExuOWdZZFpxUmNLWnNKVksrS1FOL2g0YmlvL2lYODVuMkd5ZUZ4S1Y5eEF2?=
 =?utf-8?B?bHNUbC8wODVobHlvVnFnc0NGazFjRk5TVzMxTTllL1BJdjFQUTA1ckdlRkh3?=
 =?utf-8?B?SlRJZFhqUitQQ0JVS0RBbVVJZkhjbnBNVEY2R041MmNxa2lZaXphT3J4aEk2?=
 =?utf-8?B?czV3ZWlLbkNSRVhBd1BUWGtmb2xZTHg1ZmVLMnBjQ1RHWDV2bjJqbExyMG1i?=
 =?utf-8?B?VmQ3L1Q5SjZYdm9MNW03ZXR3U254RXJ2d09ONDZSd2N1MGtjQWxZTWpMZWFK?=
 =?utf-8?B?bitJMXFCMTJOOEcwYTlXYUlZVzBpRGZjL3MwQkFEdUxYcjlma3FiWUdtbm92?=
 =?utf-8?B?YWwyY1lKNWk0TDFvRUg5WlIyejM0eC9ZaWdGMTBsR0NsWGZlMjE0N0JVMzlx?=
 =?utf-8?B?S3BJRCsrdFRERXk5WXlJUGVBQTQyemFiS25Zd2kyV01ndE9kdlBYL3Nnc1l1?=
 =?utf-8?B?N1Q3bGJ4ZkFaQS9iTm8rczZNTXpESHRqcmpFTHV4Sjc3c3ZzK095bXlRb3VD?=
 =?utf-8?B?dndhb0UyclVLelJXYXpWc3BCV1hmMlQxT2hTNFVpZCtLS1dpODhMMnBOWmZL?=
 =?utf-8?B?N3J6bHpjZlNDQ21XUTdRQkd2LzFOMlZBNkx0WTJ3MnZWeFRLeE5VWGtad2Jt?=
 =?utf-8?B?Ky9OVDh1QTFaNUlSUGhwbzVzUUdoRVZzVTVDNUtMdUViV0k0OEhzdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 975d38da-4823-4124-3d30-08df28f7e7e0
X-MS-Exchange-CrossTenant-AuthSource: LY0PR12MB727857.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 07:02:12.2685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVip0UqxhYyJhuX9czwE1nvBhTDYgbq62S7eoMjJO/i/VPuWeRIdl0Z2qtOBX1wngJUoV2X5JMOSfYYNer8TQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7416
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_000221_775865_4D53BED5 
X-CRM114-Status: UNSURE (   9.85  )
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

Define SMCCC Arch function IDs for CLEAN_INV_MEMREGION and its ATTRIBUTES
call, and add RATE_LIMITED/BUSY return codes from DEN0028 for callers that
need transient error handling.

Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
Reviewed-by: Jonathan Cameron <jic23@kernel.org>
Reviewed-by: Bence Csókás <bence.csokas@arm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 include/linux/arm-smccc.h | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 4de81848fe2e..2e205320d88a 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -116,6 +116,22 @@
 			   ARM_SMCCC_SMC_32,				\
 			   ARM_SMCCC_OWNER_CPU, 0x10)
 
+/*
+ * DEN0028 v1.7 defines these cache maintenance functions as SMC64
+ * because they carry 64-bit memory range arguments.
+ */
+#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION				\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_ARCH,			\
+			   0x5)
+
+#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES			\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_ARCH,			\
+			   0x6)
+
 #define ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID				\
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
 			   ARM_SMCCC_SMC_32,				\
@@ -305,13 +321,14 @@
 			   0x53)
 
 /*
- * Return codes defined in ARM DEN 0070A
- * ARM DEN 0070A is now merged/consolidated into ARM DEN 0028 C
+ * Return codes defined by Arm SMCCC (DEN0028 v1.7).
  */
 #define SMCCC_RET_SUCCESS			0
 #define SMCCC_RET_NOT_SUPPORTED			-1
 #define SMCCC_RET_NOT_REQUIRED			-2
 #define SMCCC_RET_INVALID_PARAMETER		-3
+#define SMCCC_RET_RATE_LIMITED			-4
+#define SMCCC_RET_BUSY				-5
 
 #ifndef __ASSEMBLY__
 
-- 
2.43.0


