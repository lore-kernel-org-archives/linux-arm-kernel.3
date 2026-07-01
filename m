Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90914C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5TXikx4hZmPeRKOOcOq+CLP9fnpVst44xqj1gd9t5iM=; b=Pu/FH6ax5VvMtMKpC/+RlU2UaX
	X76dF6Y8n1QyROT/Y+429eb65kvLVvbjRE4jdRxA9OvyuiEYf6UDiV/gMjdNkTbRd1rYHGx75E2Bo
	5E4BAnGni8kDMTiKpulKq5CEsvjG4igUKgwjxAkOqBOM88j5trEcgd5jh0bJIBDS+GUqskHrNqqAQ
	TmL8RBIml3cVI40XCMvU0GNscbTzSYFeIGyCLkcFM7oJLvCRN7jK14JOtSQy0gtoyzjsoaUm9OuBL
	f3gWhWbBtpF0e2ueEVRCvIoG3xoCpDlPsBXWtjTDBoRxB+a/3Olxm438e57Jx69G8RdeVhkCWQ4T6
	AdqS9stg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetqR-00000001oaL-0f2N;
	Wed, 01 Jul 2026 12:15:11 +0000
Received: from mail-japaneastazon11023115.outbound.protection.outlook.com ([52.101.127.115] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetqO-00000001oYf-3be0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 12:15:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Muryw1dSpwo5Bhkia1kWzBmUPiTwWWA54KQxsmmYDJV+jQBZiQSBBrmdhE66HMZi+sbxMycyu0oaIju9EdRsIjEgAqaGCZSbEHHTjrjInclx1sLFM1rLSmtUwdF/7C1Vxjwt8r1ZZ71cX3Xs4YPP/Bhzwx86Tl1wtsKn3Y0Wq9jT5CWLqEUpGuXnjFGF0aqSwrKGUsidV5CZZEvMj+Nw814iSOS24H+v6+LOSiT6ISqzZDq5wqHZnkePRn6IRnYdSxJwaErFbJRs9G8mcv5/NbMnkTM+E1A59kJE4hXlhNg7UNmA+PoWKXmZuieC/PjfQXIG4F3vdYkG0Bzy6O8big==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TXikx4hZmPeRKOOcOq+CLP9fnpVst44xqj1gd9t5iM=;
 b=GHL+f/PACqmqmQTt9a3wwo17Ic2hKJO7daanVHK9mGqJSQjueEO3xMDxSyCqViJTJS0rqOT8m4xnrbWZbBUpkKfM9HlWubXNHz7LYStCyxHJLUBYReyktlTQY92spK6mP0DD+dEk8V77AUOArdJsOivAfG4PaeQX/hP4G2f2t4fd1ZnmeO9rKuwneZM3jRUQEEPzPdHnGTSkz0fzkhK8dJwnFsxah4mcxfdaXiacrI8Vo/L2FQ3XgAd1BNvF5BumxySb3c6NmAhpEFTPuY1zTg4uBH0aipcuIw6jYas2ZPkFCPUb6Zm8xurc0fOIMkjnMSMhsYMHmGOtduCYDVJhiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TXikx4hZmPeRKOOcOq+CLP9fnpVst44xqj1gd9t5iM=;
 b=NpUhzH1WhcamPbRAbZEhQbCL4dd6N2+osk+6TXph0PkVEEmPnqBpM4JDjt5BEMWOMeFebMofQ4CfyY46f1gl6oinShokM//xa9trHUar3e6zR7TbTNalyAIgztiGGH8NaHo3uREiabDr0s8KbJxZfflaMar9lidAJb0lQqpRDJ4=
Received: from SI2PR04MB5648.apcprd04.prod.outlook.com (2603:1096:4:1a4::11)
 by SEZPR04MB6573.apcprd04.prod.outlook.com (2603:1096:101:ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 12:14:55 +0000
Received: from SI2PR04MB5648.apcprd04.prod.outlook.com
 ([fe80::8ce1:b82b:3b19:f79d]) by SI2PR04MB5648.apcprd04.prod.outlook.com
 ([fe80::8ce1:b82b:3b19:f79d%5]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 12:14:55 +0000
From: Pu Hu <hupu@transsion.com>
To: "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
	<will@kernel.org>, "naveen@kernel.org" <naveen@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>, "mhiramat@kernel.org"
	<mhiramat@kernel.org>, "yang@os.amperecomputing.com"
	<yang@os.amperecomputing.com>, Hongyan Xia <hongyan.xia@transsion.com>, Jiazi
 Li <jiazi.li@transsion.com>, "ada.coupriediaz@arm.com"
	<ada.coupriediaz@arm.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-trace-kernel@vger.kernel.org"
	<linux-trace-kernel@vger.kernel.org>
CC: Pu Hu <hupu@transsion.com>
Subject: [RFC 0/2] arm64: kprobes: Fix single-step fault and reentry handling
Thread-Topic: [RFC 0/2] arm64: kprobes: Fix single-step fault and reentry
 handling
Thread-Index: AQHdCVM5llIetQ2+U0epMS9G7bPoCw==
Date: Wed, 1 Jul 2026 12:14:54 +0000
Message-ID: <20260701121448.3926-1-hupu@transsion.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=transsion.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR04MB5648:EE_|SEZPR04MB6573:EE_
x-ms-office365-filtering-correlation-id: 2d5f92c0-20a1-4f66-aa0e-08ded76a5c48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|921020|18002099003|38070700021|3023799007|56012099006|11063799006|6133799003;
x-microsoft-antispam-message-info: mRB+fJNS8kM27mzyF6pS3wvhbocWKUpQGmNTa8uqk8VkG4+l+1tsK+QytTUzvEUKi0TbNVdgKjClanJ69qE9PDfg3Hh1+Z+DOITuIlQMX9vJUOFC9Sg/kcBF0WdMF3/r7c0qIgKxT1vmcO1jfl7VBqaA06sI5Uk4w+IesVjUs4AVJkEOtEY+OT7LS0qGaaNodiZYWwC5cWlFmLo4cnIzF/kzTYAXDMnvP+fkTBxtk75j+4RLVUP4qstC075eYIc6oW9wgb+pvNJkdWHE+z9r3+GoZ6yU9dOEWH8PbmDaTpIiIs/wbqgOCqqkuVzjIVOh155upu6IB/e8Pcp624uHvTsuwSxcYgXz24XA7dnIza1Sss1kmlK5HIJ4Q6JwjJDp/yQ5kZ5YUa5DtftpagUAk4NDFZKYEEnbW/lXXKPLJFnHDCcIihmVsmP/qtIOpW/6jLD70PelQeZ41QBTvlELBStjtSsd3daBjoiQ2pZCWsk0Ha65K2OavFJGZdO+etb/sxCCxIKpA2Qme1fC4Al5AuBYnaCQhuRwQpSCDhkzmHN7bbS99f3Trl7x5Q4TpOJCJ3R3keBT/3V3SOqN3JDspJWa/w1ywuuP0GxoK3S4zfnmDzmNnLDW1WpdS5sUH7/QsYNgYVIVhLPhDf1pKyiR4gUsSyeqIxzGhg2TmbQGBpiECDLqwxgMAQqV7lcuX6kjGIh3qaMGgtDro6i/X6mhaFA3+UOvWWhPe43OUugJzyA3RBFzBkg7eJwpwigUmqSa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR04MB5648.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(921020)(18002099003)(38070700021)(3023799007)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?m55Tvpngxyuk8ffSkl57X+gOapOUA3huj5Cs4M1Fjf3NZfonBr95YdszDQ?=
 =?iso-8859-1?Q?l9FFvMaAm4+xIeXJyV1niDRRYxA2IqkB8lfpXpzV58w8seTrW04QLntbu2?=
 =?iso-8859-1?Q?0a81sWVVQcAMvIFAfz5a0dWvSKxNPhGyivTq6aMGfC7C9DymDESF3E7kZI?=
 =?iso-8859-1?Q?FwqgerSZ/ak/nre8RN1uLMaT6QfdvRciNJ7SJ24W6QTdUXvIDQ/XT3GHgC?=
 =?iso-8859-1?Q?QLnvYeBJ8PE14Aedc9WpXT6cDKoGWbjhu+vfMf02O04TlS8DsArtgqgI4A?=
 =?iso-8859-1?Q?1ZchQ56vsFX45TZohbAow8IjOZ8imxyRyNBU/+vGYl0/4j+lBRMrEbSZRx?=
 =?iso-8859-1?Q?2xzFDI++Hy14Q9fn+T7FZx7JdWUUJGwBHGtzXVULgRdtFIa2mOLSTPFGK9?=
 =?iso-8859-1?Q?gp/cqAUOevFAfIEalINHhUQa5wT+ITHBuOG5Qrq9+RrPG0++Q6v3dRnhGH?=
 =?iso-8859-1?Q?/ZyOJ2/OE1ClUJC78+IYSh2hJAyzs6LHVV956ZjPv0lKXwKHcEYfGDrSbg?=
 =?iso-8859-1?Q?bIZU3AqwT1PxZHTl/S9fJ2Qsb7XsAKcEYheBPTXRXpSyEpnG5b0kwcvsRQ?=
 =?iso-8859-1?Q?KWiql4GsR96mCZyBLpLPBNlprdInni/lpGKz1WXqt48ub0nsUZAv7P+Sjt?=
 =?iso-8859-1?Q?SEYxXYNUcv52WQ1RpCkFt4U9Zxtd60Ycn9x1hXHwLdb6hvb3XjIvP0zzmo?=
 =?iso-8859-1?Q?DXuEAGrBbsBrJst59twr5NMVIAIvl4y2m012erwid6wbGcz+7tBgQdGPn9?=
 =?iso-8859-1?Q?/r7j01mZEiSLTO3egvHQ8DYvgSsyt51RilO/jBM5FuAFLZK1FKZMNUsiP6?=
 =?iso-8859-1?Q?R6qCohiX4MoZO4eir7JlHXGQy61CN9ZXebPtdDhqOkoJ+t2UagZLB4ugVF?=
 =?iso-8859-1?Q?gyB6ySF208FB5hzzzmdz4Funi95yqcxtupL3RZyD/aZhQu4hf/UP7OVT6o?=
 =?iso-8859-1?Q?8cH9zF3fWd4fvAF9UtNmL89vAt2FS+aVkbEZGBq+mVrf8wgyDWPtNQXTp6?=
 =?iso-8859-1?Q?aNkSY3ZzmjLX9CSu3Nq9Pu+Ng5EwhCQBLZY9Nu11achFVx3nsQvl1kma99?=
 =?iso-8859-1?Q?acwcYARrWuaEu0/0hdtnRC7akBG9Hcs8kvDdyfB5Rn/92ikC4L+W7F6qDy?=
 =?iso-8859-1?Q?DiEucpB0UDbV/mNTYRV1tbPxDehjo9txKchjnsYBeNTXkMXY8mZ0cpGcsC?=
 =?iso-8859-1?Q?pCCjyQbKzjPRCFxZ3SV/BAzjmK9tgVUsTiclD+QJKCfhYbR1O4Wrj6TSB+?=
 =?iso-8859-1?Q?VOOdkregpiCwB2kl7bmO0mosEss3MJHDlVJzq57ebG73OpjmTpMnqvqaSs?=
 =?iso-8859-1?Q?IEs+O/vvfsv1Heh61XXnkhlD9NRRt60V4CdAfw48ocHxnvU8EBOwJCXCcR?=
 =?iso-8859-1?Q?f/DOI4ZaYXxW7MOoFJg8CLgW/PDTLsBpkgg9lpNhUpzZJr3JIjRd/7cODB?=
 =?iso-8859-1?Q?oD0F/qPIg47EKUKw9MzVf30OtdW4CDhTV75xbDtsNIJLz2JtPBId1x5oXT?=
 =?iso-8859-1?Q?52xEpy2G1I2XV6cXYJkYQI7A2HmiJrHnPUgIyTGbkyOMMogFUz/zFVe4Mp?=
 =?iso-8859-1?Q?8QdZaYbET3iY3z04o6GgawehvibMSvGEGVci6aGonaaHxuZoGT3RorSYlC?=
 =?iso-8859-1?Q?OjYWBzkfvPZclUofbBiV1Xl9f7/B/dBCtU64qxQtSynGSKxzRRobGVRYwR?=
 =?iso-8859-1?Q?GnWuXNUTzkaWFDnkhuI4WyWeC1TOtmzPnavaXk0Wl6q1Dd+ziLZjSvPW7X?=
 =?iso-8859-1?Q?f1MZChtMLhMvBRWQpsAEnOOvYPYes99tjCVHWdC3RFGmVg?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR04MB5648.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d5f92c0-20a1-4f66-aa0e-08ded76a5c48
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 12:14:54.7405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ugtpl/KYjO/P9UpxqNN7Fhi8VafimWb6MWfWJaXgPASUTFmbQx+7+p3DjvnIKi6xJV9zkGhYLGgoubdLGvRLZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6573
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_051508_918129_9B9D0ED4 
X-CRM114-Status: UNSURE (   8.08  )
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

From: hupu <hupu@transsion.com>=0A=
=0A=
This series fixes two arm64 kprobes issues observed when running=0A=
simpleperf with preemptirq tracepoints and dwarf callchains while a=0A=
kprobe is active on a frequently executed kernel function.=0A=
=0A=
The crash happens in the kprobe debug exception path. While a kprobe is=0A=
preparing or executing its XOL single-step instruction, perf/trace code=0A=
can run in the same window. That code may either take a fault of its own=0A=
or hit another kprobe.=0A=
=0A=
Patch 1 makes kprobe_fault_handler() handle a fault in=0A=
KPROBE_HIT_SS/KPROBE_REENTER only when the faulting PC points at the=0A=
current kprobe's XOL instruction. Otherwise the fault is left to the=0A=
normal fault handling path.=0A=
=0A=
Patch 2 allows a kprobe hit in KPROBE_HIT_SS to be handled as a=0A=
recoverable one-level reentry. Only a hit while already in=0A=
KPROBE_REENTER remains unrecoverable.=0A=
=0A=
This follows the same logic as the existing x86 fixes:=0A=
  6381c24cd6d5 ("kprobes/x86: Fix page-fault handling logic")=0A=
  6a5022a56ac3 ("kprobes/x86: Allow to handle reentered kprobe on single-st=
epping")=0A=
=0A=
Reproducer:=0A=
=0A=
  simpleperf record -p <pid> -f 10000 \=0A=
    -e preemptirq:preempt_disable \=0A=
    -e preemptirq:preempt_enable \=0A=
    --duration 9 --call-graph dwarf \=0A=
    -o /data/local/tmp/perf.data=0A=
=0A=
Before this series, the crash reproduced frequently. With both patches=0A=
applied, it was no longer reproduced in our testing.=0A=
=0A=
hupu (2):=0A=
  arm64: kprobes: Do not handle non-XOL faults as kprobe faults=0A=
  arm64: kprobes: Allow reentering kprobes while single-stepping=0A=
=0A=
 arch/arm64/kernel/probes/kprobes.c | 22 +++++++++++++++++++++-=0A=
 1 file changed, 21 insertions(+), 1 deletion(-)=0A=
=0A=
-- =0A=
2.43.0=0A=
=0A=

