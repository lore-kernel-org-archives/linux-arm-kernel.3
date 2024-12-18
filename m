Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24DFE77184
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 00:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10XjjyPazYz96UW7zdW6cEy1z9xnYjuQKnvErT0G4/8=; b=tZl/+W7aBMGTDLerZv5wOLqeRo
	uVaCNim7xJStRmIrdBple+RQ+w3nYDdzrmOM6u0Dxmj0aKxI1mWVzK43NrnBYofxYIEc8Dkhayhm2
	mXFDyd5bS1xC0e/P8xy+7PJl9B956G9gru9eW2m4x2YiP3AkFkkGUml7A+vjtb6Pw5aalz/qoKJ4O
	f3MH4PByBtOSw14rDRp/5NAEkm7kLl87koZDv99xE3PzRvpmyqtmk0scfqrdPjLSEyHVXs/kEB+HI
	gLoPfp5LHWWLzdRFHTf7u7RwZqaLCUOPPssUy4pT2QtF9dkJjnxOM26iCO6yIJRuH6sRIzhfziqbZ
	gZH1thXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNhit-0000000FBo2-04x0;
	Wed, 18 Dec 2024 00:15:31 +0000
Received: from mail-westcentralusazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c112::] helo=CY4PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNhho-0000000FBiy-2Te1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 00:14:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xxuo6inxfLHxL7hEMyaiK42Wj1gIpfwDCB7cralVH9nOwpavkcK1NZPTZKt+IY5BRoviIeTVYKwPeNWjhOXk9c4nSyL+zytpbZEUxrVf3y3WpIfDGo4o/7WKioADPmFa97FwlOMPHsZ8Kdx089p4MfKACGvHa4if5g3lVo4DPxgtiP+l9XgPno112szlWmVEMbn1TqrdbayZOvda2zhCz5vGkHiELchFBOJpzUndgvUXYitWMIOzmW/dTdc5Dia/ZwyMDG5R3SF+hh7MyrANSLoOZuSKrrWNYpsgvrX5JQchF6P0Dp0opch76Whby972KHxwCMzrlmNUKrRwfiHiLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10XjjyPazYz96UW7zdW6cEy1z9xnYjuQKnvErT0G4/8=;
 b=wd4XjJEwwRH8fStGwAYQilZodXdC55teuJHpBdMGZ/oyRM3bgZF0hTcoSp/4rRt+NOOihN4/AC6HSgJAXmDTYe1BHvlXSoa/JrFb2Pw8E97WB/NCAvkoS/XxRT7vG1EYgwSP08bJoq9LUe9IjVjB3lM3Bhh9aQyULh+Ecmw+TR92pecJhaKdSuwQehUuSxFkdrn4GToVsw1gbkPFraP2iUwzWvh3K/a8c0upYaAJxNhfKdICjcKjfyZtQk7tLc8GipVdVrnoXiq2wPfCBQZW0gZ5EjEtjU+pRCpE+e2Qq2u8rbpP9ljM1kmi9iHZjA3u30qLucCjl9yz8njom2f0QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10XjjyPazYz96UW7zdW6cEy1z9xnYjuQKnvErT0G4/8=;
 b=otgKrG58VMmNpTxciGokrvZxtf5EOB/OnWsd0upOjd5nUVJ2V8zdy6l47MFmBNm6gU6THtQ9kEE/+6smcvYzpPv9I9sjq/l56WwHKyNhVXv6/gNgKJQjtDk166yt2ePyjWXz+Yg/pEjfHswdugYwg+Km8WkSHkjVIQgbW4OhMhg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SA3PR01MB8501.prod.exchangelabs.com (2603:10b6:806:39e::18) by
 PH0PR01MB8137.prod.exchangelabs.com (2603:10b6:510:29c::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.13; Wed, 18 Dec 2024 00:14:17 +0000
Received: from SA3PR01MB8501.prod.exchangelabs.com
 ([fe80::f7ae:9cc3:b435:c49d]) by SA3PR01MB8501.prod.exchangelabs.com
 ([fe80::f7ae:9cc3:b435:c49d%4]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 00:14:15 +0000
From: Paul Benoit <paul@os.amperecomputing.com>
To: linux-kernel@vger.kernel.org
Cc: Paul Benoit <paul@os.amperecomputing.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3] firmware: smccc: Support optional Arm SMC SOC_ID name
Date: Tue, 17 Dec 2024 16:13:38 -0800
Message-ID: <20241218001338.6247-1-paul@os.amperecomputing.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114030452.10149-1-paul@os.amperecomputing.com>
References: <20241114030452.10149-1-paul@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::12) To SA3PR01MB8501.prod.exchangelabs.com
 (2603:10b6:806:39e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR01MB8501:EE_|PH0PR01MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bcdd85c-28dd-4895-a70f-08dd1ef8e7dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z5llQ55YQmH6klNii5b1hJfvCJKRcA1nFBxbWhSErCKO98sBaqh1g186sclQ?=
 =?us-ascii?Q?wCODusdtC8/cdLRWiHM+H8+5CoZ20RU7Vz2SsO4aGpAQvSnttubYm9ITEwsY?=
 =?us-ascii?Q?bEaRxuqVE6kVwI7bhwwM3IW+tLr7m0G3cqWIR69w7m1YC5pirWALgQwnPLBe?=
 =?us-ascii?Q?Z1qHxKNKthw+bdMD6Vwy410o5/FeIxBEzrgp5SUDFJXDppZrELyvdLiIivWH?=
 =?us-ascii?Q?d5JVNjaOuADCGb8l5TIu4wufiLHaG/8FXJJ9JwbdXmCy+SnzJ/7M8mh4V6lF?=
 =?us-ascii?Q?9LY3mALOfMLFzp7YNpCDiPVpNsIXwXx7e5B/QkH6GAGzcniP4cx4egrrgHIt?=
 =?us-ascii?Q?vBY8wrUPEXECOYTfm/fFpx0xChLEVqjcKUAL6aBgVDvSJU7oKx0k9WB1fpx2?=
 =?us-ascii?Q?7GBRkoLpiRGmBrl437EgnXA/+7bt8wezG+wDMR1rfBugE7ZWvZJVmtBL61KB?=
 =?us-ascii?Q?SJ40cFtIWzWp5T+oslOYEmmvYwbV4Q0sb3JH3cs+/mPzeGk1alF4Gg5zggNx?=
 =?us-ascii?Q?ZvWGbUaXZkBSAiZ5v2CxleQZN64rUvxvAUPoEm6ORp02zO8gZWvt5wqM2Epi?=
 =?us-ascii?Q?q3BJNyB04UbF/cmoLhfQQObuE0PrNKAVdh+GRju+zLRT9M+a6kBCZmDl4gbW?=
 =?us-ascii?Q?B1sM32PRqzt+baSBMhoVMVvYdIQRGWSu5JJjsm7B2cn5aKCDbY+lAEixG6+E?=
 =?us-ascii?Q?n/LH+gGl11O09n8L2ziCke4T39MLqT+8pjfF4ok3D1L7AHMO1iwNEw4lXNZL?=
 =?us-ascii?Q?LH9Nm/pD4XGMxF5pOyrmZBhioxMdjKIq1QJqcuFKDA7172FOFRu1ViBrdcYZ?=
 =?us-ascii?Q?51MJSaAaqv75E0tPAkgFn6P235AtuCii+dudLSPIAlFgVKsLvmMhjcVum9e4?=
 =?us-ascii?Q?PWGivCsqB7MwjVbVZDAa30IbQHozi8KoqVW7efsYm+JTBMtwV4gcYc/ELRhF?=
 =?us-ascii?Q?terfeASolYToxpxOjPREqhbOV8GzgDTbzTd6q/4s6XGcTcmCsAWakR9Av5k3?=
 =?us-ascii?Q?xUYtvWpjps1NT7I8F9dafNBv7AQamdzaqPtyoWs3NTt3Jg34joGZnltCWxaC?=
 =?us-ascii?Q?jd/VSA4rvPxMtfhoJlmrzYc4+do6rvvJtfquemOId1QCeaFfkGMr501MdrBb?=
 =?us-ascii?Q?EGKf8SWdoY+efLIf35C4y6TVvwEugtMPPFvqzY50yIXq79Nj27NUvGmsTXdQ?=
 =?us-ascii?Q?F+Cdi6JvhLQEydMC7y1rIIjP8BhMlAu0JaV/ANrJtUr4fWfxxiuw+yhvUZ7X?=
 =?us-ascii?Q?KRFfPwmBARjFPmhkPo6nPUQGfqvh8j3PcibiOE0h8S2q+EIETLQ3kgz1OgQy?=
 =?us-ascii?Q?5IlxJIQNwQXPW86OWcpmPMT+cwlDO+yUNxq5VTJ1qFsgUNL6v066wWmt2uF7?=
 =?us-ascii?Q?Dxz6xIraRAinXjh413PxBEIuPhE8v7O2AnrSAw4/MsSnvenCDOvWmdYsILTF?=
 =?us-ascii?Q?ldnuSPfG4MRNfoZHYJdg5ioHJEJ358Gx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR01MB8501.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WNHoxmCBp2NMXw9fbyYID6TyO3qqUO5mXFw0f3SIABM99wVXA2dkUEQNaZRe?=
 =?us-ascii?Q?lTp7Z9LUtrUVNexLj7DUp7yoF6eJAVvkj+Uk2fjqdAPLJrlE0fog98Ciyh74?=
 =?us-ascii?Q?5PcpJJ5fAj+5Q9qsHhWENXthVHNg5ViLWU1Plrvp552mpJKTjrVK9H0QsLrN?=
 =?us-ascii?Q?zEw5YNnKYWXMZ+V3I4AzLrsAQROeFCnwbzz4nEJiGZKh3ao7gnrnPrKeAjbD?=
 =?us-ascii?Q?vInH5L7VdVIYwFEq/yln79xU/cvTccJThAWTd2knSfigBWNfzFWOj683mQdi?=
 =?us-ascii?Q?8WLkXHy6LK8an24qQ72OEqq3cpwJilSwT9oLE6MXFmsvfr37B1cOoU5WUIii?=
 =?us-ascii?Q?XPOyqOSyJm2H8rQMle85ufdB2F99qBIMZCeX57XQf4tNWYEQSORhQ6mpfXzY?=
 =?us-ascii?Q?bHENuoNwMV+tvmHALCUYOZIrV2HyI2bHmZ1UDZHnrqIxqqz1RqgepbFe/AY4?=
 =?us-ascii?Q?eQAWTSzCw8bvmwtwUdCmM6ZFF2uFz3y/wFUJ28jfxB4VbtN6tcy+iIIvQFBJ?=
 =?us-ascii?Q?eMcDOjnQWZqEesJPVrIpIq/m4+YeOWnuA0VBbQtXRIxdb62zajgmkyWbQA3e?=
 =?us-ascii?Q?u73tA/5DntMPBUoa68dQCm8R7VkcsT2OQrqGi3pQcAT0IjJNk8D7CtRuJ0ZX?=
 =?us-ascii?Q?IIoSvCM/pi5Ffeigpm6FYaxLOO5RVVLhgqfFyoxfEW8mYrD451VqE5PLUp+s?=
 =?us-ascii?Q?VCq0sHimwM+X02EsduvaV0kngXu/nOBoj1K0vKLyVWPOgMJ4DyOOCq+TJpc3?=
 =?us-ascii?Q?PpULgrRG9UUG++zxL7GWOgCF+O+zQmNcN0Ufgl0YfknhwRvTmAj1skDLbr7F?=
 =?us-ascii?Q?tukWCpnD0vQYqIg14eLuA8WZqlE2Nba1vcNpecdJK0UeF3Xv0hfEnHRFPA38?=
 =?us-ascii?Q?1ZBIqdXkmGILDaEADznFDODBqc1IRI9dCByMgkw2Ez7Ix3GourInIWm/MQ1o?=
 =?us-ascii?Q?psIpcCd6cx4R11UAA88W47EerEB6Vne+YPt0LxtzTq/lD2q54hGOM/juMSbz?=
 =?us-ascii?Q?YryQUG8tz859BiKqz9dWSSuxroSUNy06GdFZxAcL5K9XlAjUZuw05uu4qDoh?=
 =?us-ascii?Q?YhvVBmi2XGbQgpjFnmP1aZHgGuO9LvMCOkYtTkufrgMdwdzu7VoYMx8T3hn7?=
 =?us-ascii?Q?22QjAJyUqgZj9wI93Td5FnjmJga7Z0rppOhDY6iZ3/FIgaJK2DkryYCeXpJh?=
 =?us-ascii?Q?lMcqayM91/yWlpLaXJLFeJlRKLygorqXCxa0KY73I6frsqNT/5eBANLX3zsL?=
 =?us-ascii?Q?7Xp42zqK3HIccZnKLLIJA1xufh1aRLa/edO2EZltDOeQUuc2SxGyj4+SLv2n?=
 =?us-ascii?Q?pyaY5jy1r3b6D9gJ+hze48PMHOaWfPEAFpYG2yHrtIrFk5hndS5ANvrrwwtq?=
 =?us-ascii?Q?9D/TO2PKsmxREfO7PIqfy8SRgWHtZwIIwTpTY/5ynRVvjk7TIseRnXSAOl7u?=
 =?us-ascii?Q?jWwf/IitT8TVofe/KeqpShFxrM76Hs2rYbUOpRKXDPkCVYtUqS9QEJu+Vzee?=
 =?us-ascii?Q?YfMUme3zSs9OFaSvO8PU92IidueacFDuLJ/ELzoD2LehsV/pNgtpRE4ugp8P?=
 =?us-ascii?Q?07qwJCR/7ysCk9ntY9duKspJpdCRVy1syqxL3lcScpevSB1nxyyQ8DSC7I5p?=
 =?us-ascii?Q?ENeLbVdwVOT08lYVyxCdF0c=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bcdd85c-28dd-4895-a70f-08dd1ef8e7dd
X-MS-Exchange-CrossTenant-AuthSource: SA3PR01MB8501.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 00:14:14.9573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wH1OX+xGtoAiygCDEQ887EyH7Ja14zs7NpPcW+2XMIc3eOmIM5VjKgEy/BnyYAbXwzFs4GSCNV5hDz1TMPZeOopkg8cskmXcH5B21mgoYvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB8137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_161424_697958_508C2ECF 
X-CRM114-Status: GOOD (  17.82  )
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

Issue Number 1.6 of the Arm SMC Calling Convention introduces an
optional SOC_ID name string.  If available, point the 'machine' field of
the SoC Device Attributes at this string so that it will appear under
/sys/bus/soc/devices/soc0/machine.  On Arm SMC compliant SoCs, this will
allow things like 'lscpu' to eventually get a SoC provider model name
from there rather than each tool/utility needing to get a possibly
inconsistent, obsolete, or incorrect model/machine name from its own
hardcoded model/machine name table.

Signed-off-by: Paul Benoit <paul@os.amperecomputing.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
---

v2->v3: Add conditionalization to exclude SOC_ID Name from 32-bit builds.
v1->v2: Address code review identified issues.

 drivers/firmware/smccc/soc_id.c | 79 +++++++++++++++++++++++++++++++++
 include/linux/arm-smccc.h       | 37 +++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/drivers/firmware/smccc/soc_id.c b/drivers/firmware/smccc/soc_id.c
index 1990263fbba0..3b50ff5d2cbd 100644
--- a/drivers/firmware/smccc/soc_id.c
+++ b/drivers/firmware/smccc/soc_id.c
@@ -32,6 +32,12 @@
 static struct soc_device *soc_dev;
 static struct soc_device_attribute *soc_dev_attr;
 
+static char __init *smccc_soc_name_init(void);
+
+#ifdef CONFIG_ARM64
+static char __ro_after_init smccc_soc_id_name[136] = "";
+#endif
+
 static int __init smccc_soc_init(void)
 {
 	int soc_id_rev, soc_id_version;
@@ -72,6 +78,7 @@ static int __init smccc_soc_init(void)
 	soc_dev_attr->soc_id = soc_id_str;
 	soc_dev_attr->revision = soc_id_rev_str;
 	soc_dev_attr->family = soc_id_jep106_id_str;
+	soc_dev_attr->machine = smccc_soc_name_init();
 
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev)) {
@@ -93,3 +100,75 @@ static void __exit smccc_soc_exit(void)
 	kfree(soc_dev_attr);
 }
 module_exit(smccc_soc_exit);
+
+
+#ifdef CONFIG_ARM64
+static inline void str_fragment_from_reg(char *dst, unsigned long reg)
+{
+	dst[0] = (reg >> 0)  & 0xff;
+	dst[1] = (reg >> 8)  & 0xff;
+	dst[2] = (reg >> 16) & 0xff;
+	dst[3] = (reg >> 24) & 0xff;
+	dst[4] = (reg >> 32) & 0xff;
+	dst[5] = (reg >> 40) & 0xff;
+	dst[6] = (reg >> 48) & 0xff;
+	dst[7] = (reg >> 56) & 0xff;
+}
+#endif
+
+static char __init *smccc_soc_name_init(void)
+{
+#ifdef CONFIG_ARM64
+	struct arm_smccc_1_2_regs args;
+	struct arm_smccc_1_2_regs res;
+	size_t len;
+
+	/*
+	 * Issue Number 1.6 of the Arm SMC Calling Convention
+	 * specification introduces an optional "name" string
+	 * to the ARM_SMCCC_ARCH_SOC_ID function.  Fetch it if
+	 * available.
+	 */
+	args.a0 = ARM_SMCCC_ARCH_SOC_ID;
+	args.a1 = 2;    /* SOC_ID name */
+	arm_smccc_1_2_invoke(&args, &res);
+	if ((u32)res.a0 == 0) {
+		const unsigned int regsize = sizeof(res.a1);
+
+		/*
+		 * Copy res.a1..res.a17 to the smccc_soc_id_name string
+		 * 8 bytes at a time.  As per Issue 1.6 of the Arm SMC
+		 * Calling Convention, the string will be NUL terminated
+		 * and padded, from the end of the string to the end of the
+		 * 136 byte buffer, with NULs.
+		 */
+		str_fragment_from_reg(smccc_soc_id_name + 0*regsize, res.a1);
+		str_fragment_from_reg(smccc_soc_id_name + 1*regsize, res.a2);
+		str_fragment_from_reg(smccc_soc_id_name + 2*regsize, res.a3);
+		str_fragment_from_reg(smccc_soc_id_name + 3*regsize, res.a4);
+		str_fragment_from_reg(smccc_soc_id_name + 4*regsize, res.a5);
+		str_fragment_from_reg(smccc_soc_id_name + 5*regsize, res.a6);
+		str_fragment_from_reg(smccc_soc_id_name + 6*regsize, res.a7);
+		str_fragment_from_reg(smccc_soc_id_name + 7*regsize, res.a8);
+		str_fragment_from_reg(smccc_soc_id_name + 8*regsize, res.a9);
+		str_fragment_from_reg(smccc_soc_id_name + 9*regsize, res.a10);
+		str_fragment_from_reg(smccc_soc_id_name + 10*regsize, res.a11);
+		str_fragment_from_reg(smccc_soc_id_name + 11*regsize, res.a12);
+		str_fragment_from_reg(smccc_soc_id_name + 12*regsize, res.a13);
+		str_fragment_from_reg(smccc_soc_id_name + 13*regsize, res.a14);
+		str_fragment_from_reg(smccc_soc_id_name + 14*regsize, res.a15);
+		str_fragment_from_reg(smccc_soc_id_name + 15*regsize, res.a16);
+		str_fragment_from_reg(smccc_soc_id_name + 16*regsize, res.a17);
+
+		len = strnlen(smccc_soc_id_name, sizeof(smccc_soc_id_name));
+		if (len) {
+			if (len == sizeof(smccc_soc_id_name))
+				pr_warn(FW_BUG "Ignoring improperly formatted Name\n");
+			else
+				return smccc_soc_id_name;
+		}
+	}
+#endif
+
+	return NULL;
+}
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 67f6fdf2e7cd..9d444e5862fe 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -607,6 +607,12 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
 			___res->a0 = SMCCC_RET_NOT_SUPPORTED;		\
 	} while (0)
 
+#define __fail_smccc_1_2(___res)					\
+	do {								\
+		if (___res)						\
+			___res->a0 = SMCCC_RET_NOT_SUPPORTED;		\
+	} while (0)
+
 /*
  * arm_smccc_1_1_invoke() - make an SMCCC v1.1 compliant call
  *
@@ -639,5 +645,36 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
 		method;							\
 	})
 
+/*
+ * arm_smccc_1_2_invoke() - make an SMCCC v1.2 compliant call
+ *
+ * @args: SMC args are in the a0..a17 fields of the arm_smcc_1_2_regs structure
+ * @res: result values from registers 0 to 17
+ *
+ * This macro will make either an HVC call or an SMC call depending on the
+ * current SMCCC conduit. If no valid conduit is available then -1
+ * (SMCCC_RET_NOT_SUPPORTED) is returned in @res.a0 (if supplied).
+ *
+ * The return value also provides the conduit that was used.
+ */
+#define arm_smccc_1_2_invoke(args, res) ({				\
+		struct arm_smccc_1_2_regs *__args = args;		\
+		struct arm_smccc_1_2_regs *__res = res;			\
+		int method = arm_smccc_1_1_get_conduit();		\
+		switch (method) {					\
+		case SMCCC_CONDUIT_HVC:					\
+			arm_smccc_1_2_hvc(__args, __res);		\
+			break;						\
+		case SMCCC_CONDUIT_SMC:					\
+			arm_smccc_1_2_smc(__args, __res);		\
+			break;						\
+		default:						\
+			__fail_smccc_1_2(__res);			\
+			method = SMCCC_CONDUIT_NONE;			\
+			break;						\
+		}							\
+		method;							\
+	})
+
 #endif /*__ASSEMBLY__*/
 #endif /*__LINUX_ARM_SMCCC_H*/
-- 
2.47.0


