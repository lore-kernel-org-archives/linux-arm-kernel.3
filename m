Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555D1CD98D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 02:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID
	:Subject:Cc:To:From:Content-Transfer-Encoding:Content-Type:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qBR/9RwlJkrvCt3ctMlmsq+WNOAjEqBJ2TW2DZp/7RI=; b=5DtrbC2hEC5v7fnCpBXAhKf/fp
	BgRAF/hNFkFDDIje6NnEKFXG8U4fdH+b/Fte5S1BrKoSDVUgrCr1tAEnfBed6+quaaYJT7yuDBGe7
	FwhIQzj46/BbOYpV3XosYkS3WgOwru19eZmWCyZlcWscOi42C8zuQXQc0ePDDazAgRu5aPayF4Ls4
	bukiNYuUlsLbXBW9FXhgn31760BcxP5bV6sf3pqYvfx0wkfJ1flpsKJPMcKDodZ5NlAGYLcvgqAgO
	o+L2j9Wb+8015IGeiTteW3QcniAv7cw7we80NNh80c1LMAAv/pTg4UENTtWZmy9ty4oAxm/DtN69K
	XERxvaQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXrOO-0000000AHYY-3YeP;
	Fri, 12 Jun 2026 02:13:08 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXrOM-0000000AHXx-2ipK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 02:13:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yz104aGThL4NJNUEUxd6aLDDs6ObcYIYCUC0GKBStzpanG01EJwS2q5rHDboh6+L+lI/fx50ns0d5vAg9S8ceMkS6cYrEmf6L0qrzgWIVnMzqatszkB17DJV8ed4EQq5MlMroAQIcQxVDv6Rsequ96rBif8pZXhSeOKFrX2SKfS/d2BBnPcpwrPBX6duEOonu5KzV3tAhK31DoEuG4z43X6YHlXQp1yqXI7j4se+hlRdSWe2oprn01rt1eKgDZvdKk4pf4JpLJU9YhCfPbcciDXPwtcSFioSIfESPHVdrObU+6jNsJOFnPC8I8mNVo+wI7FotuN7MLfnaF8rZ5ot9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBR/9RwlJkrvCt3ctMlmsq+WNOAjEqBJ2TW2DZp/7RI=;
 b=jOcGHzi0gpUtPUn2qBN2lWvC1KZY5QEfPAHX7JEx6QB5pRrmTq8QPKsZCGJcFW0Km8xjYiuVY+PZElMo1cbU9HFxYfp0Bc4AlGk1ZkYyTkspDjWhZW21E2BrBN7T9xWxE/Y2l+wwbNJ38nlIwhD9lqWQj+PW2R3YxxMsNCPhJlXhNwmrRAvXQfdDKxwLOuZjZwMIj0Jpqnk12sPt2i+8svJGDf7ki0owC7pTYse1N25kPPXOHyXJ6puBl5NoYD6fgtwhxOrqUn2UnCx+IyHiW5i65y7la3j1JRxM/5CTWUYxGhuZznCIPWPTTCE7jAaIkWMCvxk+XmdtNRADc2VJgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bst.ai; dmarc=pass action=none header.from=bst.ai; dkim=pass
 header.d=bst.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blacksesame.onmicrosoft.com; s=selector2-blacksesame-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBR/9RwlJkrvCt3ctMlmsq+WNOAjEqBJ2TW2DZp/7RI=;
 b=fo1O+81qhWnwg/NSfvrDy9QcRGygvbtMLADS4cCbBfoaksCRHmMtJIrQ7CldK+RQMvyA5uFM/UT+AdgtwbImF+CEYZ4JK0iF+22ODCnsNZL7DUv0a3BdVVp+tT4xCVE0vFJP/MKvRVJPSCaKj1tTpIMakXRI6vQ2FISjN8N4o38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bst.ai;
Received: from CO6PR18MB4434.namprd18.prod.outlook.com (2603:10b6:5:35d::16)
 by MN2PR18MB3480.namprd18.prod.outlook.com (2603:10b6:208:265::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 12 Jun
 2026 02:13:00 +0000
Received: from CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885]) by CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 02:13:00 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
From: gordon.ge@bst.ai
To: arnd@arndb.de
Cc: soc@lists.linux.dev,linux-arm-kernel@lists.infradead.org,yangzh0906@thundersoft.com
Subject: [PATCH] arm64: dts: bst: enable eMMC controller in C1200
Message-ID: <178123037729.455092.8454252669856079676@bst.ai>
Date: Fri, 12 Jun 2026 08:40:23 +0800
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To CO6PR18MB4434.namprd18.prod.outlook.com
 (2603:10b6:5:35d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR18MB4434:EE_|MN2PR18MB3480:EE_
X-MS-Office365-Filtering-Correlation-Id: 3209da41-a866-4d48-55b1-08dec8282046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|18002099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 68nMO+NPBkmZaSKHGXjrRo14DXOhCFxRDks5h+912KqjwWFNBGKdQXg+CQH3JbEB6QkOXnoxgPB2NcUXBp6bvhVa2279TtiLaljyIIg5nqddooXcjSKdautB34F4AAvI0Nu8nwyL1K38pLOxLoLgxdAfxhMhwzLBYn6Q13kr2iB2LJpGe1u1K7IIMx/3DNGLifelGF6wVUfie3iPKaCwGEIiAgmaVmD1970O1JYjpvXlMxBiJnfWa6qMZ9k9bUcOJfM6BzMdys0THKYMAPCHpnW7i8bMkSUcYg+OXcEttTI7Gkz9YsnwRqHpRN7XB4i3pB8Yf8OWdd+TIApQFwqL6UtVVqJ3A2qdif5JWVIxiyiJ6Pke1tRS1qiUM4bauj35DFBVhAMmTORObUVjGlRLO11AR/xDpzSw6PlTwCrHn9fu4lcWplVaH2rjmoyMurY6I53fJM+LvzxFYAfMdsdoSQu3rQYRObvS8tJkE6OirvB8eDDEKlJN9z+gH3WuHb6Xo1F0I67rEh7g24IHZFMUSavkTErxKExF80EJRNyib8uvg1/AXiCOpehYbSIeo5JV95zinoVezuBgjzKIOvTnfK++7YnHF5mRMJYkOGdKYRGBkBWV1YNhNVvv4icuUGv8TXOXEjgtgnJF7T64uGyKbd8z5I/NYlhj6Yd6V/9Xy8M/G7/gFCy8R59rXQXtJeTm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR18MB4434.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjBVbDVBNG4zYzNFc0hQeGlhdUp3SVlEL1dGNHpKUmJkMG1wRUxobGZ6RHE0?=
 =?utf-8?B?VWNJWEE5dlZyYllIWlEwd2hzTTVpU3dPaHo3M1pNYWxTTmxadTZDTHlEcGFW?=
 =?utf-8?B?Qk4yUHNicm1NY3FiL1RHQUgwQlk2NFhXWmFFcFdCRE4rRnBPTHBNUW9MRDU4?=
 =?utf-8?B?cUZUaG0yQkhZOUhWWnVhUzM3QitnQVV6QmcvaXIwMHFmRTc4Nm95T1VyeXJY?=
 =?utf-8?B?QTZhcnFROXZHQjdoeHlYTEZWZW10bjQ1UGV0SEdlblR1TUQwaUFMSHVxZ2lT?=
 =?utf-8?B?MHpMcWJaK0k0YTIwMmRFL2F6R0ZCUWxuWTJya1Z0azltR3RlNFgwanN6aFZo?=
 =?utf-8?B?b0F2MkdtNldwOWt6bWMrSFBEaCsxWTVnaU1xVlhZTGdvUTdqQjhNckJVSkdR?=
 =?utf-8?B?OEYvK1Rldll0OFNzaDlYQmNlVHJFOUdxRHRrdXk4M1hpMktWcTJ5UzJSL0NL?=
 =?utf-8?B?ZEpYR1RGRW1RVUlNRU82TVpwSmZ1ejZRZTVndGpYeTl0dlE4UDVjdm1SYmVF?=
 =?utf-8?B?NTBBcDd4TXloeEhsQ3JVWWNaV0Q3V0Rwdnp6bDFpWVFrRVVRMG00RzFxZ2lG?=
 =?utf-8?B?NlY5S3hHRTVjcEtSbjlIUlp0N0gyNVdpRktWclZYTWc0MDI0ZEV0VHd1Yk92?=
 =?utf-8?B?SE9EUy9wclVmM1QvR000dURUYnNpNzFRem9HOStTSFI1Q1ZBZkorY2RMMkpU?=
 =?utf-8?B?dGJjT3dMNWo0c05iUTFaUFBXaTdYUlplcFhGbW5LYWVmRjY1N3hyZERJdXNs?=
 =?utf-8?B?bUVsSjlqOFh0QWt4QTROR2JvK1o3dVRSWWFlZEdPMEowOWlLNDJmbEh5MVho?=
 =?utf-8?B?NnhueGlJR3V6YlZjRmtLcVB0YzV5SDFad3pYWldBNFBJNzZkWWxrZ0N6MkRG?=
 =?utf-8?B?ZDV4OXpXaXhVVWlvaUpjZkpsNTJ4Y0hHYnBHdlVtd0N6YWFZSWxvSXhhdEVC?=
 =?utf-8?B?OHgwdWJOaEtxd0pjLzR5RERzaEU1SlZSREZVVmtIMzM5VmJ0d1lWYmN0QTVx?=
 =?utf-8?B?SnhLclJ5akhYSTBTVW5lbmZHY2M3aE9oeDUyMkJwM3JwSWV5QXkrYUhQQmRq?=
 =?utf-8?B?WVdwR3pVUjF1OEVNMWNraGtnZWNteDZyOHE5U2RRekhLVjhjd0VncTVxMS9G?=
 =?utf-8?B?L202R0hJN0J6ZlVQSEF4T2MzZTExQktUb1JpaGJEMlRQd0ZtKysyNHFkSFdY?=
 =?utf-8?B?SmhxMDJIZkRYTnRzdFJpQUVVM1QxazZSWVpDY1JJa1pBOUQ5M2hUVWZlS2dG?=
 =?utf-8?B?NGZLY0xHd21ZVlFZeWE2VkNBRUwwdFNoeWk0WElHQ0d3MzBKU0l0VnVpOTF2?=
 =?utf-8?B?aHdzM01uMnRRZzNpM0U4MlFyZ3pNUXp3ODJBcW9HQ2VWcTlHR2JBTjFjV2s4?=
 =?utf-8?B?Q1UwS0Z4TExWVHF1ci9SQW5FUjZlY2IxaENoaURXT1BYcWNnK3JMdzNuNjZY?=
 =?utf-8?B?WFlDZWRuTlZCMlJKdm9NWFo5bURoeDE2Z1VqQ01VRER1U2lYSnZBNHY3dmFG?=
 =?utf-8?B?VlIzeXBDSzdHcS9WeHdob2FNeGIzNFAzQ0NvTjlFaGNNK2xuMXg4ZXg1RUpp?=
 =?utf-8?B?Qzh3QWM5NFBCRnlCM2Yrb0ppMDVJdVVabndSQlVOYlZiMEVsbjl2K0M3Z0lZ?=
 =?utf-8?B?eW02cWs4YWs4Uk5hdTBxbnE5TjhpbnZFeTVxZUg5VU1pekhmVElONkdQOVg5?=
 =?utf-8?B?eG9PaysvN2lDckVKbFZpYUVad3h5alVURjE4bWJMUjRUWjh1VS9CSDJiNU1k?=
 =?utf-8?B?b2FFTzk4VW9rT29QUnBGQU9tdUNWcEUxZmVqUmc5TCt3VVhvbDlkZVFabFBQ?=
 =?utf-8?B?VXRHOEU0OC8ybXVWUVVHSDU1OU9KQjUrbGl4bFNzWGZKM0EzdnNiWXNxY3Ns?=
 =?utf-8?B?NHVaUHBKT0JjbUVYUFd3cnJZN1VWR3lJb05lMEhzVkpkV3Q4QWtnTXQ0dGVs?=
 =?utf-8?B?M2xGdE94d1BMa1lrTkN3MjhZVU9ucjF1d3ZNay9QWmZ6ZnBZaTdRcjZJZGNM?=
 =?utf-8?B?M0gxYVNER2Q4a0RkUXFXTzBUc29VVkVHNSs1eWFoSVBVQm5zaDlJNUFvODE2?=
 =?utf-8?B?QUhpbjI0YkN0V0JaZXBIYXpHb2F5QjhvUGdsczd6K25HVVUvaFhTODF4SWVI?=
 =?utf-8?B?Z3RYZ0dKNUc1QzBwMy9ieEFsZGF4cmxQZ0d5N0EvdXdRd3dhQnlyQ3JSMzFk?=
 =?utf-8?B?L1lwMi9qQ1Yrc01xaEpKYWhtd3ZyRkd1ejExcERkazZOcGNKUk14TzR0djA3?=
 =?utf-8?B?cnZiMGlkVktFOU9WUVppMFhyNFNVd05UbHZMalFtOElOemJEU2lOMnVyQ1hC?=
 =?utf-8?B?ZDgwUkp3anpQRHVaMlNraTNLK1JtQ25BcUlIWjBYZUxRbXBTV0tyZz09?=
X-OriginatorOrg: bst.ai
X-MS-Exchange-CrossTenant-Network-Message-Id: 3209da41-a866-4d48-55b1-08dec8282046
X-MS-Exchange-CrossTenant-AuthSource: CO6PR18MB4434.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 02:13:00.2254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00dc1a43-b766-4686-8706-33adb3b74360
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQeFAMrNfETb+wNk7PBn0t35UjblFHLmYiZK17jcyRou2i/Ij+aVVxPQuwCkmFM6a9VMuSwtXlewcJTLUlatKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3480
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_191306_719188_293CC893 
X-CRM114-Status: UNSURE (   8.95  )
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

QWRkIG1tYzAgbm9kZSBmb3IgdGhlIERXQ01TSEMgU0RIQ0kgY29udHJvbGxlciB3aXRoIGJhc2lj
IGNvbmZpZ3VyYXRpb24KKGRpc2FibGVkIGJ5IGRlZmF1bHQpIGFuZCBmaXhlZCBjbG9jayBkZWZp
bml0aW9uIGluIGJzdGMxMjAwLmR0c2kuCgpFbmFibGUgbW1jMCB3aXRoIGJvYXJkLXNwZWNpZmlj
IGNvbmZpZ3VyYXRpb24gaW5jbHVkaW5nIDgtYml0IGJ1cwp3aWR0aCBhbmQgcmVzZXJ2ZWQgU1JB
TSBib3VuY2UgYnVmZmVyIG9uIHRoZSBDRENVMS4wIEFEQVMgNEMyRyBib2FyZC4KClRoZSBib3Vu
Y2UgYnVmZmVyIGluIHJlc2VydmVkIFNSQU0gYWRkcmVzc2VzIGhhcmR3YXJlIGNvbnN0cmFpbnRz
CndoZXJlIHRoZSBlTU1DIGNvbnRyb2xsZXIgY2Fubm90IGFjY2VzcyBtYWluIHN5c3RlbSBtZW1v
cnkgdGhyb3VnaApTTU1VIGR1ZSB0byBhIGhhcmR3YXJlIGJ1ZywgYW5kIGFsbCBEUkFNIGlzIGxv
Y2F0ZWQgb3V0c2lkZSB0aGUKNEdCIGJvdW5kYXJ5LgoKU2lnbmVkLW9mZi1ieTogQWxiZXJ0IFlh
bmcgPHlhbmd6aDA5MDZAdGh1bmRlcnNvZnQuY29tPgpBY2tlZC1ieTogR29yZG9uIEdlIDxnb3Jk
b24uZ2VAYnN0LmFpPgpTaWduZWQtb2ZmLWJ5OiBHb3Jkb24gR2UgPGdvcmRvbi5nZUBic3QuYWk+
Ci0tLQogLi4uL2R0cy9ic3QvYnN0YzEyMDAtY2RjdTEuMC1hZGFzXzRjMmcuZHRzICAgIHwgMTkg
KysrKysrKysrKysrKysrKysrKwogYXJjaC9hcm02NC9ib290L2R0cy9ic3QvYnN0YzEyMDAuZHRz
aSAgICAgICAgIHwgMTggKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDM3IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2JzdC9ic3RjMTIw
MC1jZGN1MS4wLWFkYXNfNGMyZy5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2JzdC9ic3RjMTIw
MC1jZGN1MS4wLWFkYXNfNGMyZy5kdHMKaW5kZXggNWViOWVmMzY5ZDhjLi4xNzhhZDRiZjRmMGEg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYnN0L2JzdGMxMjAwLWNkY3UxLjAtYWRh
c180YzJnLmR0cworKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2JzdC9ic3RjMTIwMC1jZGN1MS4w
LWFkYXNfNGMyZy5kdHMKQEAgLTE3LDYgKzE3LDI1IEBAIG1lbW9yeUA4MTAwMDAwMDAgewogCQkg
ICAgICA8MHg4IDB4YzAwMDAwMDAgMHgxIDB4MD4sCiAJCSAgICAgIDwweGMgMHgwMDAwMDAwMCAw
eDAgMHg0MDAwMDAwMD47CiAJfTsKKworCXJlc2VydmVkLW1lbW9yeSB7CisJCSNhZGRyZXNzLWNl
bGxzID0gPDI+OworCQkjc2l6ZS1jZWxscyA9IDwyPjsKKwkJcmFuZ2VzOworCisJCW1tYzBfcmVz
ZXJ2ZWQ6IG1tYzAtcmVzZXJ2ZWRANTE2MDAwMCB7CisJCQljb21wYXRpYmxlID0gInNoYXJlZC1k
bWEtcG9vbCI7CisJCQlyZWcgPSA8MHgwIDB4NTE2MDAwMCAweDAgMHgxMDAwMD47CisJCQluby1t
YXA7CisJCX07CisJfTsKK307CisKKyZtbWMwIHsKKwlidXMtd2lkdGggPSA8OD47CisJbWVtb3J5
LXJlZ2lvbiA9IDwmbW1jMF9yZXNlcnZlZD47CisJbm9uLXJlbW92YWJsZTsKKwlzdGF0dXMgPSAi
b2theSI7CiB9OwogCiAmdWFydDAgewpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9i
c3QvYnN0YzEyMDAuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYnN0L2JzdGMxMjAwLmR0c2kK
aW5kZXggZGQxM2M2YmZjM2M4Li45NjYwZDgzOTZlMjcgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYnN0L2JzdGMxMjAwLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9ic3Qv
YnN0YzEyMDAuZHRzaQpAQCAtNyw2ICs3LDEyIEBAIC8gewogCSNhZGRyZXNzLWNlbGxzID0gPDI+
OwogCSNzaXplLWNlbGxzID0gPDI+OwogCisJY2xrX21tYzogY2xvY2stNDAwMDAwMCB7CisJCWNv
bXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOworCQkjY2xvY2stY2VsbHMgPSA8MD47CisJCWNsb2Nr
LWZyZXF1ZW5jeSA9IDw0MDAwMDAwPjsKKwl9OworCiAJY3B1cyB7CiAJCSNhZGRyZXNzLWNlbGxz
ID0gPDE+OwogCQkjc2l6ZS1jZWxscyA9IDwwPjsKQEAgLTcyLDYgKzc4LDE4IEBAIHVhcnQwOiBz
ZXJpYWxAMjAwMDgwMDAgewogCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJfTsKIAorCQltbWMw
OiBtbWNAMjIyMDAwMDAgeworCQkJY29tcGF0aWJsZSA9ICJic3QsYzEyMDAtc2RoY2kiOworCQkJ
cmVnID0gPDB4MCAweDIyMjAwMDAwIDB4MCAweDEwMDA+LAorCQkJICAgICAgPDB4MCAweDIzMDA2
MDAwIDB4MCAweDEwMDA+OworCQkJY2xvY2tzID0gPCZjbGtfbW1jPjsKKwkJCWNsb2NrLW5hbWVz
ID0gImNvcmUiOworCQkJZG1hLWNvaGVyZW50OworCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE0
NCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCW1heC1mcmVxdWVuY3kgPSA8MjAwMDAwMDAwPjsK
KwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCX07CisKIAkJZ2ljOiBpbnRlcnJ1cHQtY29udHJv
bGxlckAzMjgwMDAwMCB7CiAJCQljb21wYXRpYmxlID0gImFybSxnaWMtdjMiOwogCQkJcmVnID0g
PDB4MCAweDMyODAwMDAwIDB4MCAweDEwMDAwPiwKLS0gCjIuNTAuMQo=

