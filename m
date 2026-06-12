Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586FFCD98D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 06:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID
	:Subject:Cc:To:From:Content-Transfer-Encoding:Content-Type:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aUM1JKZgsiz4BTWpIEMqUtQNjD2PvyR1abZbR4aAuFU=; b=KOczF6xF8vPWeWzSwi9Snzz1E/
	ShuftsEC4TH1qIY5AwRoR5nw2FoyXHtEKrulpD8CuscOWx7mxv9yBmdQ4yRFsYHjEEwuy9uSsnTZT
	n9DLSDUxfBYvI5hAysHUHUdFok5z5escap70PUnPkEPBTd/GURPrcf1dKXUuTBSbPFitH5/2yyEXs
	S3pwJq6OKQO6P9keSTzTRnwtQyjMDx/yTwyucN8LWoLyExfuQCJXz/hKzdQW7XrDtwuzwi/zpn7zf
	VLLsrJTvoKwNx4OlS6PN3Gwh2H6PsDsAKjYrBtBXH51q7c4JWrkPoMJIcNMW69/B9DJSy/7uTswbO
	C4uZT0YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvjZ-0000000AQRK-3Xgw;
	Fri, 12 Jun 2026 06:51:17 +0000
Received: from mail-eastus2azon11021088.outbound.protection.outlook.com ([52.101.57.88] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvjX-0000000AQQy-3R5e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 06:51:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZCSZsvJG0IDIz+Iu2OgorvSCzp+NnkY0gUIt4CLv3lnwmJvYieqHpyF352w5FMGHeYfeefx+DebklSQaFQJzZhzKLPeZa6dormC+pKrIru3xuyrotQma68CF3o2tnPkGfvZJA3GGjrP9mzsKBl9b5Fd4RRc34umfOEuF+3cHy+pxZ4PcL0oTjlG8en0hcHiBvu2fNRE+H4pXwAtBRpp53hTkVGViYSZv8uAMlcSJeZ9RjwpMZQj7sGloD43eBpaaGgvPxbDohpTlBhqDvLWN8FwB6H6yn0DY/jUZ47VjhJN/LXOAX90goyCtyJ0LXKDzMv8bMuSLJrdkHoJ6+izlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUM1JKZgsiz4BTWpIEMqUtQNjD2PvyR1abZbR4aAuFU=;
 b=qvX5FlJs3Mm1S4naAPxw11ohS6IyZPPcUjT7R7AtGIOhYP88ACkEynx4K/xOT5KVXIoBXrO4SQ09ksRINVvEKQiP2VMtFt9h+MMI/UPnCFAdqacLLcAiG2dBQ6ho0VdWoRVd5tS3cu/q+pFjT8rXZaLvtS0L5HKqIAoIXcXvrU8odo66VS+914iLSC2BwhiXHBloW5/ASkFuzxfmoSIg1cUyO02J7lkgJwQlIP4QWhhOXrWTFYtD4SZY4uyVs5vyHWHx4D1mjF5lvwnwbsaH8Hk7RGe4a4vuNqHsfDc9db1FMVAJaUCYWvQDkjcMCmAcsrA2TCKzt8/GUKSO2AoZkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bst.ai; dmarc=pass action=none header.from=bst.ai; dkim=pass
 header.d=bst.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blacksesame.onmicrosoft.com; s=selector2-blacksesame-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUM1JKZgsiz4BTWpIEMqUtQNjD2PvyR1abZbR4aAuFU=;
 b=FDKGCY9XSj7J6b6F+IB5wUUMyy6vVpZ7kPh/iAi16lSAuVahkgQzeoMDxkYgh+wAVI/8KZfOMc+HAWBymj6oSD56D4QV8NxMYsMAjoGHoNcCG9d0Ox4utykVv9keJejgWO5WDFizS8gsMthM/aqhYKty6tcpDd02KAIOjuKCjg8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bst.ai;
Received: from CO6PR18MB4434.namprd18.prod.outlook.com (2603:10b6:5:35d::16)
 by SAVPR18MB988338.namprd18.prod.outlook.com (2603:10b6:806:4e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Fri, 12 Jun
 2026 06:51:10 +0000
Received: from CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885]) by CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 06:51:10 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
From: gordon.ge@bst.ai
To: soc@lists.linux.dev
Cc: arnd@arndb.de,yangzh0906@thundersoft.com,linux-arm-kernel@lists.infradead.org,bst-upstream@bstai.top
Subject: [GIT PULL]arm64:Add eMMC controller support to the BST C1200 device
 tree
Message-ID: <178124706736.583168.7192372166865774364@bst.ai>
Date: Fri, 12 Jun 2026 06:51:07 +0000
X-ClientProxiedBy: TPYP295CA0055.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::15) To CO6PR18MB4434.namprd18.prod.outlook.com
 (2603:10b6:5:35d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR18MB4434:EE_|SAVPR18MB988338:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d82495-7001-43a3-a4d2-08dec84efc3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Tpms78EwgOpmVsT403dKE57VWDGXAaigjm6vPmUESgiDGHAXiMEzR8SBWpquCa2lKqTxPQghP+f4qzUx6NhI+agBE2KfwHdGEcLsBSAAgY8IGb74TFwgFKZVh5qZviCmYZNGMdo9cvIGdb3UqyiOcdf9uyDnF2zf1pyR4jfOr0/0LtVGCta/FXbTUGl+kKlg+40BCXJgzO6aoNtUbBVUcFVz3on40IDCLWCPU1MaoO3CWnBicAnqs+uOtFQz5fxOho5g+q5Bux15Io1E9UQcuWQO6Tdv1ssT7L7xl6Ea6JEwsnHdlBkRDCugPhWapIuzxwp7xCgi0Z6dzC13SGgI0tcFTb+i+FELWOPOLtI0G7rwEBnyd1lMQzV44xCJMCi7hnsDsWJFTpHmRUNC0I6uXchsEIxpdRFOQj8jZP7szL6IN/Tslvtkww3bzJTDdzoIlwPrzAJWKXRNmXXmeq9DC7CEm8CMYc0I4emubBN/eJCrgj6Q75BkoxY2nha+7/qcCyulcBbRP6g2zbIyUIUuFtZIV4Pd60clKY7hKFQZGgLdBD4RydZYKS4CJivDnkmen6JMmqeN5klGVt/KKH5XhND7C4AzHR13qskXVjS0liaMYp9BvtV2oiQHtaawIBxGccc3kvKxcEIfyRX8lF47v7rafaEoOATHVAcichly3h4opKuSWSS9OdL+/NLD7Zdqej49ox/Z7dQ1OfCOXu9gag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR18MB4434.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmE5QTNjR2F5QWh1c2NsSEZUS205aTdRbUlWSXhSU29HVy9wanlpaGMxb3F5?=
 =?utf-8?B?NXpwUGxQYnI1WEptQWk5WXc4aFhBQ3lzRlBqVFpneitZZnkvYWhrT2p1Tzkw?=
 =?utf-8?B?ZzE5ZCtRS09qTXZDVjBJazNpSkFkZ2srTjJ6bWJydzJwZGxEZHY2RUtzN2dM?=
 =?utf-8?B?MmV2MEVSL0pBSE9aUDArMFZ5MFFhKzNtUjlieEhJTGhqVHdubXUrOVkwQ3BY?=
 =?utf-8?B?bXM1UnpuVGIxUzE4UEpsZTdsVGRvcDJyZ250bEtoSW1qTHUxN2ZBVkVVbk5S?=
 =?utf-8?B?dUg2VzNad2lISy95OUJML3ZpQUlSQ1RzM2NGY3pRTEs4UkFFbDVrQzJDUkJj?=
 =?utf-8?B?MFJGYnN5NGZ1aEtqZFlDeWx3MGFjY1NOdGtsY2lsdnRTZkZxeFgwa3MrcWYw?=
 =?utf-8?B?cUp1WisreSs0NFY4WUdYNHFJN1FGMjVML0d6UzZ2bllNakN1YWxoeEFJTHBM?=
 =?utf-8?B?VFBYbVliYkd1R29XWGJMWm11RnlFOGo5bkhUazErdlQ3YlkrcFZmNmtxWHpN?=
 =?utf-8?B?T0l3RWhhbjNhK0ZKbzBnZnA1TCtQS2RYV3dDTWJCV2xPMk1SS3hoYlBwS3F3?=
 =?utf-8?B?VmV0Zi9ucGUrYXFFeWxVcjc3WmhmM2VYaGlMcjhsOWpZNnBHTkR5ZmhkYWUv?=
 =?utf-8?B?bmljNHFPSmlMdlpZZkhkNUVBNlJjN09sRGZkQ2tZUmpyZ0hFNERTaGw5SUVE?=
 =?utf-8?B?RkFUVFY0dkF2MWorQ09FcExEZTdKTWlLbDNBdWRsaDRCaXQ3SGdJSFFOR00x?=
 =?utf-8?B?Y0lVMUNUVnNXNTQxS0NzMjVpZHdzaU1ObnJqUVRHdHAxdlUweUk5TmVvRDFv?=
 =?utf-8?B?Y1kxYzROaGFhalU0WWRDWmdGa3ZEWkJKeUhUWFJHbUtaMVBKdENxQ2NPY21W?=
 =?utf-8?B?cnhKWHFzbE5CZ1llRzM2VGlWVjQ0UEpzSVJvWnRabTl3YkJLWGNIV1I3SlRl?=
 =?utf-8?B?MjhnOTk4R0JSaytpVVg2YTZkQmcza2tyQ0RCSXFhRXluT0M2dVlwUDB5ZWJm?=
 =?utf-8?B?ck9qdUtISFRoMVliY2VjTjc0Wkc4VnoxNitmbHNmanM0a2tWN0plNmpYQUZz?=
 =?utf-8?B?WjZERE1vUTNIWjBDUGRuUVlDKzdBN0pBeGZXU1pRdDNzcC9Qd3JxT1BpVmVi?=
 =?utf-8?B?T2h5S29YZm1SMlQrZXdvVHArcnFsZVNlTzg2WkdiUExwdkVZTlZ5RG82b3Bi?=
 =?utf-8?B?MXN2NDhNZi8xdW9yaXJta0I5OXlkTS9hcUVIS3ZPaXFqVmFuU3p2Y2hTbnZQ?=
 =?utf-8?B?dTJLUUExdWR2TnB5dmtqbE0xZmxaSEUyS2hpL09yT3FKZ2RQMDhmdUhKUW1r?=
 =?utf-8?B?WmRhK0lvQnpwUiswOGpBblFEWVFTV013M2UvLy80dDZGVVp6QVpVVk9jcGxS?=
 =?utf-8?B?QnRNUGZUc3pFUXROYUV5TUFKeEJsN3E4cFdvVmYzOGViYmEyQ3dlbXV3bWNh?=
 =?utf-8?B?TGFYdTB1YUxyMzNCaWRHMVZWL1VwekFpVzJlcytlc1Q2UHRKVnNMRXJzMnVX?=
 =?utf-8?B?aG92MnY0cmFhVUF2N3Bxcm43ZFhUb1BwbkRyaVE3T3NOeERKTElOMlAxVnQ2?=
 =?utf-8?B?NkFpRWJ5WUJuSnM2dmZiNGFzQ002Qk94a29xY29MY0lNdEVFTzNJZnllZlRY?=
 =?utf-8?B?MFJiM2FDRnNWU0dZMmJZcE5MeTlvT1Nndi9WSXc0Q0tzc01MSG5rMG5mOXk1?=
 =?utf-8?B?aVlWVEQ2N2J3bnVFdENYSndTZW1mRStEb3JGSnZueU1iV0RoZFYrSXpmTVQ1?=
 =?utf-8?B?bXZuL1o4dFhCWUUyWXNhMjRlVkkwYzNIMDBxQmMzOEEyS0JaUTZjYU5SdHAw?=
 =?utf-8?B?TDBIZFA0UTZmRXcwazBTR1htZTAyNUlsY1ZTT0lIRXhUb1FrNDFCdHRUaHdC?=
 =?utf-8?B?ZkpycS9YVmowMUZiMG13V1gzb3FTTW1zYkp0VWE1eEQzWk1uUmZWVG5LSHJm?=
 =?utf-8?B?anc2ZFM4T2t1OVJKY2F0ZWUzRnJGV0JHU1pMMmYvRkZZOTUwN0xnS1VRdDJU?=
 =?utf-8?B?TlcyQXNCR3Y0NStyQU1IaVVPblg4clRLYm9qU0Y3NWFDdVRaczBGNzZKa1dx?=
 =?utf-8?B?NFVaTjVoUk1wTUx1b3RDc3BYSkNJSi83d09VQ2lPMEZwM1E0L3VoNzVlTmlM?=
 =?utf-8?B?b01RdklDY0Q1bHZsd0NWdkQvdjVCZW9OUTBqdzNQWVgvY3p0WkN0OXp2dStW?=
 =?utf-8?B?TjFYT2RUcDBQRnlyMWhZcWd6ajNrN1dnV2N4c1NOYytmSjlheWJ3UmpNUVVs?=
 =?utf-8?B?SklUV1hlMXVWMkJFWXhvUjM0b1dJZlpHRzh4ZFpSSWVySG1wOGFrai9qeCtr?=
 =?utf-8?B?MGdIMVMyeG4rSlZPTEFZV3Nob3lST0FNeXNYSXI5VzZtamJuOWZLZz09?=
X-OriginatorOrg: bst.ai
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d82495-7001-43a3-a4d2-08dec84efc3d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR18MB4434.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 06:51:09.9483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00dc1a43-b766-4686-8706-33adb3b74360
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccGBYvt97YAz9novHw7FOXb8tncyhwyn25hTJe7ClPbj+VRAvkrVQ58BowKpK6A5sRKKR+qUhCtnH2EKaUNH2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR18MB988338
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_235115_856501_F45F7F73 
X-CRM114-Status: UNSURE (   6.27  )
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

SGkgQXJuZCwgVGhhbmsgeW91IGZvciBwb2ludGluZyBvdXQgdGhlIG1pc3Rha2UuCgotLS0KClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMjU0ZjQ5NjM0ZWUxNmE3MzExNzRkMmFl
MzRiYzUwYmQ1ZjQ1ZTczMToKCiAgTGludXggNy4xLXJjMSAoMjAyNi0wNC0yNiAxNDoxOTowMCAt
MDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRwczov
L2dpdGh1Yi5jb20vQmxhY2tTZXNhbWUtU29DL2xpbnV4LmdpdCB0YWdzL2JzdC1hcm02NC1lbW1j
LWRyaXZlci1kdHMtZm9yLXY3LjIKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA2MTkx
YTYxZWM5ZDlkOGYxZDFkMWQ2YmZjYjZkMzAzYmU3NmMyODA0OgoKICBhcm02NDogZHRzOiBic3Q6
IGVuYWJsZSBlTU1DIGNvbnRyb2xsZXIgaW4gQzEyMDAgKDIwMjYtMDYtMTIgMTQ6MTc6NDUgKzA4
MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCmFybTY0OiBCU1QgQzEyMDAgZU1NQyBEVFMgZm9yIHY3LjIKCkJsYWNrIFNl
c2FtZSBUZWNobm9sb2dpZXM6CgogRW5hYmxlIGVNTUMgY29udHJvbGxlciBvbiBCU1QgQzEyMDAg
Q0RDVTEuMCBib2FyZDoKICAgIC0gQWRkIG1tYzAgbm9kZSBpbiBic3RjMTIwMC5kdHNpIChEV0NN
U0hDIFNESENJIGNvbnRyb2xsZXIpCiAgICAtIEFkZCBmaXhlZCBjbG9jayBkZWZpbml0aW9uIGFu
ZCByZXNlcnZlZCBTUkFNIGJvdW5jZSBidWZmZXIKICAgIC0gRW5hYmxlIG1tYzAgd2l0aCA4LWJp
dCBidXMgb24gQ0RDVTEuMCBBREFTIDRDMkcgYm9hcmQKVGhlIE1NQyBkcml2ZXIgd2FzIG1lcmdl
ZCB2aWEgbW1jLW5leHQgaW4gdjcuMS1yYzEuCnRoaXMgaXMgdGhlIHJlbWFpbmluZyBEVFMgcGll
Y2UuCgpTaWduZWQtb2ZmLWJ5OiBHb3Jkb24gR2UgPGdvcmRvbi5nZUBic3QuYWk+CgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CkFsYmVydCBZYW5nICgxKToKICAgICAgYXJtNjQ6IGR0czogYnN0OiBlbmFibGUgZU1NQyBjb250
cm9sbGVyIGluIEMxMjAwCgogLi4uL2FybTY0L2Jvb3QvZHRzL2JzdC9ic3RjMTIwMC1jZGN1MS4w
LWFkYXNfNGMyZy5kdHMgfCAxOSArKysrKysrKysrKysrKysrKysrCiBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL2JzdC9ic3RjMTIwMC5kdHNpICAgICAgICAgICAgICAgICB8IDE4ICsrKysrKysrKysrKysr
KysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspCg==

