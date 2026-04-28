Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640F8FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KxmAjhkR2AzcW8nmiAYVzvrYXiY3Tg7vT2+EijDw31A=; b=b//Km8AS+IsxHGj5o6i/AZM36u
	MBQVp1nQ1ssiFFWgCdcfZsBk4SqAEG3gL4e5Wl6qa1Xs7mXk+nBpTOoERMFzFhwfrDmb3CmDhK4Ux
	MBOEvu7qyptTpikAzSMxXZmPAWZQSY3b7dXemDIyzgxRkfPvwSje6o7mw1IFdfpG134tc++xjvpw8
	ZGwGE1ZdEjkWd00xBV1mJ2iinH7pV/mf3kLSxaigpOEJLmpckKnJS6E9Vt7gIPCoYjn6CTjICI+bq
	Pu+w0N3zfhAk3klc8e69wqPq8zettFY5aO92hZq2XAkf5kMN5QSY1uMtcf2bhyefA3ZVkYXU3e+i+
	QnaChBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHpN9-00000002U3J-1nlp;
	Tue, 28 Apr 2026 20:49:35 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHpN7-00000002U2j-0ujR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:49:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xre3r+s6xA0+Tcwux21VhFc5dEIutFqHMBl+b+g7FxI4IVYtYAOeadboSbWTEWuznGwy39LOmYM3dJO/QaOOio66jqCVQWgE48fw5Rp9i5ewL17zARgx2l+jC2rb7AM249FV0iDQnpuvTBeKvqMfgrNKd2pnuZqwdrZcpml9TMGMGZyAghpxi7PgFBgGAZHP/DNlVuyBeKNAfy9OH7Hn2uw2TFHaAh2Nk1FndTNXIrMQybJVeJV+xH5WPqv1qeXCC9aVc7Zq+daFJFVmSdgcuPxQ8Hym8ElnyLoDw9v0sjDabQJu4XTis6I5i3Mgj2mgESD52N5ZTdOFgecUYGALow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxmAjhkR2AzcW8nmiAYVzvrYXiY3Tg7vT2+EijDw31A=;
 b=yV3wjcsShan82zFDP04etOum/Rvfc9kM2Kp3kdDlKYTt4BO6i3EkYya8lAcH0S9KC3WjvuLu1LOnOV0ceC7Pi3HOVZQy8b502o82kIC/DmQmvixms/is5IS1nUyxdMYV96ePr4XNehwaKo1yh9ikjrdEC1YdWUzGxbay4bpYRv0wSZYk77pRpJid9YAFLUfdDzRjjickFlJiVMPEfPVr/99zVTnqlAhneMvUZ4UwWfkWit1XhMXmBCzJGcozYpA6t/1tAMpMU9in0w/S7usTt7rpU02WzC0Bb1C5oy+EVE57caR0VpYDpoIJVAoAsb8jmwyBNFQw6N7KHRlQojeY0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxmAjhkR2AzcW8nmiAYVzvrYXiY3Tg7vT2+EijDw31A=;
 b=aeBi/F7qXzImuinaWpBOjFoJiVEIPr2eRBDwn8P5jRJlrpQxIMpZ/9QwOoeN7MOYStfRf95gUktRzHi5/Sj/wRZjY3iC4VqbjO8PEEjZSRoEWbsP5it8ZqOjNABBst2tEXfIloXuzdekwTmOkUXxKIV+GsGZg+Sn6xBGePxAXlGzOYk8arrotuDbAaOc03e/vLaufgnGfA2lS5QAuVCSo21nEdhQ+I7EWC8Xsqml9AdCceBSiJ3i9XfKbHROZxH4o4DtEIGLy6ZwFz+gFuaHcacO8/HxFzbYEztKTmLQMniEFEwbtxIHM1QtpP7JgJp3BkIpuxgFZkkTqec0o3B3uQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PAWP189MB2611.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:336::8)
 by AS4P189MB1894.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Tue, 28 Apr
 2026 20:49:24 +0000
Received: from PAWP189MB2611.EURP189.PROD.OUTLOOK.COM
 ([fe80::b400:cf4f:b2e1:d884]) by PAWP189MB2611.EURP189.PROD.OUTLOOK.COM
 ([fe80::b400:cf4f:b2e1:d884%6]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 20:49:24 +0000
From: Fredrik Markstrom <fredrik.markstrom@est.tech>
Subject: [PATCH 0/3] arm64: perf: Skip device memory during user callchain
 unwinding
Date: Tue, 28 Apr 2026 22:48:57 +0200
Message-Id: <20260428-master-with-pfix-v3-v1-0-c384d3e53092@est.tech>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADkd8WkC/x2MywqAIBAAf0X23IKPyuhXooPUWnvIRKOC6N+Tj
 sMw80CmxJShFw8kOjnzHgqoSsC0urAQ8lwYtNStrLXFzeWDEl58rBg933gadGSVNb4x3eSglDF
 RMf91GN/3AxeNnXBlAAAA
X-Change-ID: 20260427-master-with-pfix-v3-ae7173f538ca
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Olof Johansson <olof@lixom.net>, Tony Lindgren <tony@atomide.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Nicolas Pitre <nico@fluxnic.net>, 
 Fredrik Markstrom <fredrik.markstrom@est.tech>, 
 Ivar Holmqvist <ivar.holmqvist@est.tech>, 
 Malin Jonsson <malin.jonsson@est.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777409361; l=2932;
 i=fredrik.markstrom@est.tech; h=from:subject:message-id;
 bh=WcNa5lgwRqyYlPhgtSu9SZtFyBWPxnCJpYYbdDPxHwk=;
 b=YVgxDT6iQHwbCBBrHPO0HkqqW2xxU3myrxeXURPqBQB+9UHE3VQjRI/grEAicq7LUsD9LFfxk
 3COY2IRRWIxARuVuzndw3icdBLJzbI6kLtYXkEG6I7cm5DkjIFsUH+G
X-Developer-Key: i=fredrik.markstrom@est.tech; a=ed25519;
 pk=0a8IXHEgAX55JPS8VZfTf1sDp7q/oAOf459tDQd40Eg=
X-ClientProxiedBy: GVZP280CA0031.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:276::11) To PAWP189MB2611.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:336::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWP189MB2611:EE_|AS4P189MB1894:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a70f8a0-4ef1-4f1c-d9e5-08dea567a18f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3mkep9zQWGeRIT94bADVwWYUMq8UIOCgi9wrWPGZFfy2yiJkMdv2vRkWPyTZPwNFu6wgpumA/SflFwe3VP5XQaL6mu6pfK2KzN/kB8GZA8iwQVZgnE2dtCPhxZWIW0b/dBI5/F2yE8DN7zzrW9K6cDdJaZj6XYEKVGo9BJoTiR1u1Su1BNrgyp5t5YIyM16vmmP3d7z2kDnmQMSRNB2uQGycjU0OIK/3SAjZC/nqW56cM7hdmOWZoFjtOAYN8eU08vGm/1F3KrrXvCwuqKqwHbmsI1loHnYN8Roc4Xf1s4G3GhOf3tRuhYyoGdM51HhadnJJe1uKZiuWIWN+1OTUYblv3V6A+LLJearQwLzZya+84k/qiM7W+8LmZj46qbvFscFvlXtO7OduJgYzMA1kjnOf/AvqY+LtGoAP6y3uosAAze+er/RZrDK7YVb/NYPAipGC/lim8i4qqDvhzmMQQAa37BOX57swBBJtP4uVnV6HI7bTZfiWq5vRsN6wbUiyLl9GlytZgGIzZIZzW5OaJyVjkbdwD23F4ZDVQzEf9K4TrNixqKfY36bu/AlN9zP2pHiMXYrPQ8YLe8eJ6CDt5PB5eHJhhnSFVWNrJq21ME2IF4LVRUqHgUsnsiE9wSdepTIE/uXqdlbg9B0pTqUMDi/eAaW3jAKx9Ln2femRhgSankDAGJkghIeyuKk0k0c6VAI13nlwS2VkuGinzeYS/Ai2jFC18f3yubK7LAGuGeIr+nRe1kjWf7Snf1NxxkTQunWQxBW7DclIN5Y+asW/fJUlq8DNXrClrs7LFD78FL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWP189MB2611.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHlsYzEzbTBmT0dzWEZ1bmZ2RFFRUWZzd1ZFeVFjOEZ1RmFpbGtlRWtFemVS?=
 =?utf-8?B?c1VBb3JhTGZmWHByZTBhdGR2elUxakxLS0FOeDljcDBVRnBLdjVmZE9JWXM5?=
 =?utf-8?B?cWN6TjRITmx4TEV3cERQQzhKU3NYYTEyVGV5bnJvMTlBT3NhNzlVRWlScUxY?=
 =?utf-8?B?aCt6a2tnN09OV3NNTENRb29NTFU3RXAwaFhZc1Y2YWVSeEY4WldCZUUrWnFB?=
 =?utf-8?B?V2N0bDJHRjNrWEdvMWpxZmtsVmE2Z3dqYVZhTGRZMkpzRXJvejQzQS9nSzVE?=
 =?utf-8?B?NlhISVJzY1NoM1VxRTVEZFZSdXRoWElrYjROcGhPZ1dIKzNhRElxaVM4NWJF?=
 =?utf-8?B?YWpIbklXajVidlNUYTBESkJtM3NibWhzbGdOWXluaUM0VDZMNHZrQkZtODlt?=
 =?utf-8?B?Tis5dHh2QnpDNTNXWHVvNzNMcUJYd2lVLzBTb0xkSzRibFdLOU5FdDJSb0c5?=
 =?utf-8?B?MjRhN0c5bU5ONGtnRkJvdDZKUW9zQ1duSGwyZ1YwdldJUk5GSmp5aHZlWW1R?=
 =?utf-8?B?eEVydDNwRDJtRDdSYWJ5dXhkcnJFNWJSZlhSZnc1WmoxVS9yYngyeFl6eGhX?=
 =?utf-8?B?MFMrZjJmTGtFK1BlRTlZM0tQZlNsaEYyMlNJcWpmU2dIWmxpdEpMbjFvUFU3?=
 =?utf-8?B?UU5TOWJSdFpLb2IzTklxNEZQNFM1T0kwQXJXb3o0emMxNTh5QkdEMm11T0di?=
 =?utf-8?B?czlqOWd3eGZyODF6eElMYzJXZTBBT2tHSWhMUytvV1RoSzF4WmNkeTRqSkE1?=
 =?utf-8?B?WGloa0UxRFc5RGNDSnB2S25NWXEyYlhsWUZRU09CNHU0N2cxY2lyQ3ZBZ3R3?=
 =?utf-8?B?aGJDRjlGNkpadGUrSXBmOHRER2VRWUg3VldBeUhtNFNLekliQVNPZm5jNkRO?=
 =?utf-8?B?S1Q3K0x0eng5RGpDZW1idnhqVVF1MDhyQ3RUNCtybVJjeGFmSnlMRWdFUmNY?=
 =?utf-8?B?Nk14bXdDNWluWHpYa0diRStMbktlZ014WTUxVUxKckxPV0EvYndsNE9iSW0w?=
 =?utf-8?B?Y2VsdjBJNFRBSTR6R1grUWxVM0xlQWxYU0hLMi8wU0ZyUVZmUGhpMjJmTjhS?=
 =?utf-8?B?VXpGSndmajIrWjh6L1VtcHVCNjJMekhJUmdoSW1LemNKOVRIM256YXRrdklF?=
 =?utf-8?B?d1IwdjVGMFVjM051R25PQjBSZTBDRWhWNFhMZFdyajk1enpCWWZYbnZQWVV6?=
 =?utf-8?B?T1hGSEJIQ25ZTkEyRkNuZWJzYXB1UjZ6VXh5TmZlMmlyZVdibDZvU0hacXBo?=
 =?utf-8?B?cWw1N29zWC96UlU5UWNHRFdzZGtUdzNROFhLNW53bzJFQXV5OXlCTTdlUjIv?=
 =?utf-8?B?cVBxeDVzNSs3ZnN0SjNDQ1FFcVdvdDN3TGtTd3pBTE1SbGkwQjJsSnE4ZW9q?=
 =?utf-8?B?dVVMa1hSVktqWjRYK25HSHJOVGFDN2VqcVpza0FxbEdUWE5qZUlGK2tWUXVE?=
 =?utf-8?B?RkxYemdaVWFCWFRvUTh1STVHcUNCaDBQemgvWWFkV3V3WDF3NDltNEFuRlIy?=
 =?utf-8?B?TFhKU2R0UUpScWV1N0plbmpmK2VubjJQN2NYbFVSRTlDS25ydTNmNzQ4cm8w?=
 =?utf-8?B?bzZIZ2ZRY2o0YldMZSsyelJMbVl0eStkMngzQWl5MFZhbVhqeGhmM3U0MFJi?=
 =?utf-8?B?NWNSTGZGZDFFSWZ0STFSamdVeXczNVY2TUpFT2hNbVF2SlRKOHB1em1keDR0?=
 =?utf-8?B?TFlSR003WUFSTzN4dnBxeFUzLy9jZUpYckpHQ2UwcWRKTXE3QXBkR1oxeUNO?=
 =?utf-8?B?YW9uTHltZm5BNytDV2VoSzFYMzFaQ1kzcnlCeWRyWHpuRnY4ZEFjNkpuZU90?=
 =?utf-8?B?NlZsWGowSFl5bmQ2aWdLQnFZRTM3WUFzbzB4SnBFN0JTeVF5S1NLMUFKVDVh?=
 =?utf-8?B?dis5L0tML3VmRWdWRHF3WDg5MEdOWWJPMDcxN2JvUnhPcFRsVGg5ZEFMMXJw?=
 =?utf-8?B?WnpvcFBGbFNpZm1rMmwrSjFVcHBjNU1aYTZlY1d2d0hSWmRiMkQvVjN5bGky?=
 =?utf-8?B?VHVJM3pxTmhpNXlQczMvanNFRmdBVndWODkrb21vUnFzVUJIL3h5TjQ0RVlG?=
 =?utf-8?B?TDg4NHh0UG1oUFM1bE41UGdtM3AvVTVveUl2WVY5NTAwLzFkVzNZN21ESXRi?=
 =?utf-8?B?QkQzM2ljM213cndoZlluQU9rYjJCaURwR3NpYlg1RzRIQ3ZqNitrcTV2d0JR?=
 =?utf-8?B?dDlGOE1sTkRCWXBaZXM3Tnc1VkZBM01aWXJPT2pYWFh0WDJ4NVcvNjZRU1dB?=
 =?utf-8?B?K3pqR0hBdklWRm1NYVRqWURJSjlWbUF2SGxQZm9ubmNVZzF0bTZNZzlhcTNT?=
 =?utf-8?B?OVAwaTdkUTkxeXVHd0FzSElxSk1rUWNLUWhBOVhkSCsrQVNkTURyamdnVjg1?=
 =?utf-8?Q?QarsscF7inabZeFI=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a70f8a0-4ef1-4f1c-d9e5-08dea567a18f
X-MS-Exchange-CrossTenant-AuthSource: PAWP189MB2611.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 20:49:24.6159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7h+S7QsZKHfcWwQFC1yWocplE3b0yxHNW9T5rdGy1uu9c69FKVYMjAE5VOheso7FW6dK/S7ToV5dg/yvG5s/M9IWSKP6RpZhcSLsYlFAMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1894
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_134933_281466_D27223A5 
X-CRM114-Status: GOOD (  12.73  )
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

Perf callchain unwinding follows userspace frame pointers via
copy_from_user. A corrupted or malicious frame pointer can point
into device I/O memory mapped into the process (e.g. via UIO or
/dev/mem), causing the kernel to read from MMIO regions in PMU
interrupt context. Such reads can have side effects on hardware
(clearing status registers, advancing FIFOs, triggering DMA) and
on arm64 can produce a synchronous external abort that panics the
kernel.

This series adds a guard that detects device memory before each
frame pointer read and skips the frame.

Patch 1: Lockless page table walk checking the MAIR attribute index
          in the leaf PTE to identify device memory types
          (MT_DEVICE_nGnRnE, MT_DEVICE_nGnRE). Follows the same
          pattern as perf_get_pgtable_size() in kernel/events/core.c.

Patch 2: (DO NOT MERGE) Module parameter to disable the guard at
          runtime for regression testing.

Patch 3: (DO NOT MERGE) kselftest that exercises the attack vector:
          maps /dev/mem, points FP into it, and verifies the kernel
          survives perf sampling.

Alternatives considered:

 - VMA lookup (mmap_read_trylock + vma_lookup checking VM_IO):
   requires the mmap lock on every frame.
 - RCU maple tree lookup: lock-free but still a tree traversal
   per frame.
 - lock_vma_under_rcu: sleeping lock, unusable from IRQ context.

The page table walk requires no locks and costs only 4 pointer
dereferences per frame.

Limitations:

 - The MAIR attribute check is arm64-specific. Other architectures
   use different mechanisms to identify device memory and would need
   their own PTE inspection logic.
 - The walk only detects memory types visible in the PTE. If a VM_IO
   region has not been faulted in, the walk sees no PTE and fails
   safe (skips the frame). This is conservative — it may skip frames
   that would not actually fault.

A QEMU-based reproducer is available at:
https://gitlab.com/frma71/qemu-kernel-tests/-/tree/vmio_perf_test?ref_type=tags

Signed-off-by: Fredrik Markstrom <fredrik.markstrom@est.tech>
---
Fredrik Markstrom (3):
      arm64: perf: Skip device memory during user callchain unwinding
      DO NOT MERGE: arm64: perf: Add skip_vmio parameter to control device memory callchain guard
      DO NOT MERGE: selftests: perf_events: Add device memory callchain unwinding test

 MAINTAINERS                                        |   1 +
 arch/arm64/kernel/stacktrace.c                     | 103 +++++++++++++++++++
 tools/testing/selftests/perf_events/Makefile       |   2 +-
 .../testing/selftests/perf_events/test_perf_vmio.c | 114 +++++++++++++++++++++
 4 files changed, 219 insertions(+), 1 deletion(-)
---
base-commit: dca922e019dd758b4c1b4bec8f1d509efddeaab4
change-id: 20260427-master-with-pfix-v3-ae7173f538ca

Best regards,
-- 
Fredrik Markstrom <fredrik.markstrom@est.tech>


