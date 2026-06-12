Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22479CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 06:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID
	:Subject:Cc:To:From:Content-Transfer-Encoding:Content-Type:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M74ArlpsW+K/mmkYKyr9C0SuNiQDSml7cX4kKQ/09Xw=; b=F3pWOr57iNwF3uoVic7j3eukLR
	5zJu3MCPDumvbj+E1f3Lun2ccpwiPYoxPXHDm0BZrwT390VVURYjJiV8xAbb0iDy8S6w3yelhkN1Q
	o/xDg6wxskDQCPYAOeSCmW+d+RqFV9P51WUzHNV633dwqE4LJsF7T1t2ahZAIAiJc4SxuIVOYqijP
	58O8DAI26cUnk/exb5XUScxqnA0/fHaLMr2iljphMNA++Vgri4cMRNN5KpamwDkXuIni/3giOr9/v
	T7d/cgeXb8zDxRrfoTYK4XNlRjTMpMZcRih4X8eSWmfyX8vufeN4vdmabGUEC/nY9c5iyTGTykxC4
	SPotpPWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvfh-0000000AQ4i-1VNT;
	Fri, 12 Jun 2026 06:47:17 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvfe-0000000AQ3s-3qmK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 06:47:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wymy3NWD5jrkyJFlqG9HzhW/veuAoqIb16zLMvVRBRuiUP3dQRXlVkg2russEjuaNXZOGueAcq6fz65Dcafw/yJk0U1qwh1qGJSrfH9kKJBeeL53n0i8b6n9lPk834z7qze7TYdASTXTn3FITQdea6MrIO2TVucqJ2sclgUCxygv5xTJO9SGloFZ2hJh6NmroG8BN4bQ3hEBx8Nu1vftoBC2ZpNs7qYFq2ywiTm41URX3flZtb/T2OYk9RAbx+hfDuQyEMFazLSU5kr4YqgfXBB6wlMUr5yC6HVhRvqIYmK+m7w4VGrtAYcNkZQuWYdfsizH3lcORs0crR3bnbJIkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M74ArlpsW+K/mmkYKyr9C0SuNiQDSml7cX4kKQ/09Xw=;
 b=QL4tFfn82ubVc7Y45FG14G8KZhHn0zVuWoC/bxIcbQMQBybQHH0bZyqRih726STnnqxJyUjYnohfO+PBogu7O71OiX8SOnzbtBIda6YkGeBiVzJXsSnwol762jv8iV6YzuXtTkxlOc5WPCHfFpazSdxcDDVSErMovyVG0J7tNTY24bYchYu4AVJLP//BCfjm4+55TR/arCRHVqgHVdobRxGMRsWpHvwunCN3BB+ycHtSn2Mj8Jf+vv95thH+svv13qkV59VC3Pcx6aAjHE3My8qPPYL+1cdbEYv4eUrJ1Mzal8asKv9aG/erd8peEaPPHDb4Zf7I9hbG/Mhevepz9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bst.ai; dmarc=pass action=none header.from=bst.ai; dkim=pass
 header.d=bst.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blacksesame.onmicrosoft.com; s=selector2-blacksesame-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M74ArlpsW+K/mmkYKyr9C0SuNiQDSml7cX4kKQ/09Xw=;
 b=Azl0JcVQP8qU90nLB8r2ybGH8i00My+PCOb1YwnXyM2h05lQvTyutaaI9fhOLVHOCrhzInV6yvj57xK9tZ8UhJRIVmk/Yk1P9O4wTvWFrkssYLPeWvBviWhSZSXhT9PyTo+avFlotFiltB2hTNEBdNQouaYUT/o4+PbVs+3uWcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bst.ai;
Received: from CO6PR18MB4434.namprd18.prod.outlook.com (2603:10b6:5:35d::16)
 by SAVPR18MB988338.namprd18.prod.outlook.com (2603:10b6:806:4e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Fri, 12 Jun
 2026 06:47:10 +0000
Received: from CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885]) by CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 06:47:10 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
From: gordon.ge@bst.ai
To: soc@lists.linux.dev
Cc: arnd@arndb.de,yangzh0906@thundersoft.com,linux-arm-kernel@lists.infradead.org,bst-upstream@bstai.top
Subject: [GIT PULL]arm64: BST C1200 eMMC defconfig for v7.2
Message-ID: <178124682783.542254.4976938369452006836@bst.ai>
Date: Fri, 12 Jun 2026 06:47:07 +0000
X-ClientProxiedBy: TP0P295CA0038.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::11) To CO6PR18MB4434.namprd18.prod.outlook.com
 (2603:10b6:5:35d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR18MB4434:EE_|SAVPR18MB988338:EE_
X-MS-Office365-Filtering-Correlation-Id: 5065e5d9-953b-4a4d-161e-08dec84e6d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: F7v56y7dvETmJjkeJxEzD267Q/rGcaBwPxVL0w3Xub3xKHSGduQnfpYUjNs9420zMCO0ou4QGyL7fGB4T1Iee4sXpN28IaThuQSmOXfEQWeQV22dcBoXzsDR2uN3F8WdOF+1HAicDnK4qd3Xcv5ZF36a3m3OJ7uUzJBinvRKDkpvKD5EbzlfxFRO9c29pbqeuURHCg4O7Ls8SaZh6qCyN6DE1Voyt8Xrp2wWm0Un3T84UNKhaC+2oy7iLPT6smY2Y+7JH6h7ElEaxAkzs+tIPB2ZdF/7NQXdj52VPeAJkFjs/1bL+XNlrmQvN49oYVfrdGNjh8nj77zvau4RHv8Gt0H2MMaiqVQLSlUePI6ChHMGqeIPIQ1/6TcWUjg2yV50UeY6rJ1F6aLR/VTzHhTakN2GgXsF9vDE9zJFoXfAG31b3TQ5vNRfM5VL52XlchEv6/bgeJYPRe5PoTTem+H0aVqemd4L3KEv8pW9+a1UW2kFl/cmIwOCGbLw66sgwh4yp1PMPxfi7moAo7QNSDcSSxwtabbUvD0bRYZ/JHaa3yh7BlUtEiWDQoR0KBTxOsXPP02+fyObYu7i9vR8khBf/SF2ELWv4MJBiEVVGQQ6EJF4zkUxUPzRbP2iWLyXTgnzx8CGpJPZqJvopvVQ++1H2pjcKC9qUllXUC2uz4KFkYutJBPSfLLDMB1w3CJSomj4WhvMeV0NtxjBO5hLLyD/xA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR18MB4434.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REZxb3k4ZmZ4SmNzN0V4bHdlTVRRU2puY1B3NGpyQ1dEMUZsU1M2Umt6UVhO?=
 =?utf-8?B?ckM4b2VHZ1RLWmVxUHNZKzRTNHcwQXVJVU1NdUNoSFBOMUIybmx0VEJPcFpV?=
 =?utf-8?B?czhwcEczRjR5SDZSbUJ6dUVDRWVXVUIyYnEwd09xR0MvNUtOdkNocldDeXpG?=
 =?utf-8?B?UldreWpnVzF0OCtuaVo0WWlRbTN6VlI3QzNJdnlIYk4vd2Y1Y1g1bFl2cHBC?=
 =?utf-8?B?OEhBNWRTaVo0TUNVdVhBS0JTTDA0a1VzTHRZbjZ1dVRDMllVTnpudFpDOFd1?=
 =?utf-8?B?VjFCeENyVnorenlnamFqK2krUWlCNUtJK0VxOHNEOXJPYkJPam0rdk5wQzZr?=
 =?utf-8?B?T2R5cG9yOVV3S2owNkNVcXgyejR0QWxNNTd5M3dsUnByTDB3SFlZUE9IUUtT?=
 =?utf-8?B?ZC9rTTIyUXJCYjdCSlNrTytaK0dtdmk5UXUweWxMcjZ1cG9hRmlGdUdWMmp0?=
 =?utf-8?B?cGRaa1N5ekZOYUl1Lzc0WTYyUjZUWS9iV1RRb0lkaW9xQkhmMUp0Qm0ydENW?=
 =?utf-8?B?a2YzTEs5RzQ1ZWcxbHFkTmsvOGh2WXFQcndLMkNDTW9hQlMzemt3YkxSeVU5?=
 =?utf-8?B?NVg2a3hpVDNhUCtvaTRxbjJRbnh1NWN4SkY3ZUFtQ3UwVnJ0U1lKY1V0U2Fy?=
 =?utf-8?B?SGpFWFBhdFYrQ0dOTks5dzB5clplSTV1ek5jVEtmQTA4eHV5RGV1dHVucTl1?=
 =?utf-8?B?cXpqcnNJMnpkQThBV0N6THBkTExQK003dHZNdGFTTzZYTU9ZZHZqeWgvcXJT?=
 =?utf-8?B?OU1HdXdCck81TkNyMWR6dU52WlJIS2wyUFMwbHRDc0lwem80UWpjRGVETVRC?=
 =?utf-8?B?ZmI4UVR0SVV3UGp5VlowMjJKaG5JV1RuVHQ1K2JCTCtVNU84Y3RsdUVPOUl4?=
 =?utf-8?B?MW9aQWg4YWNka09taFhTZFlUSkMxWTlrYi92R3I4NVRyNVpQSW1RK3FOOUND?=
 =?utf-8?B?dm9KZDhub2oreXNxTUN5akRSclhWVm1UcVJMR3hobWFWdnNob0tmOEJQR2Fu?=
 =?utf-8?B?Z2F3WE5BY0dCLzAxcXVmcjA5VW5XSUJ6M3ZXU1U3NXdWZmZrakVzK3JLSHl4?=
 =?utf-8?B?VTMxamFBcGtaaVJjMkVweWhPVWNvWEpuSU9vYUdTQkhLdWxWUEhXN1NQaXBJ?=
 =?utf-8?B?S3c4eFpKNm9QV3lDSGNSbkl3djJsWmgvelZWMGxMVDhjMG1abk9DdTNnbDFy?=
 =?utf-8?B?L0hOdkt6RCtXYlE1ZXRPeWZqMjl6WWdBMzhVbU15eGFiQzhWTTlueks5MmlQ?=
 =?utf-8?B?OExNdFNZSk5IUU0zdVlzSDd0SVdQNlJ2L3NDM3JLZ1hjbUtGN0xrdnltR0Fh?=
 =?utf-8?B?M3VsMkYxdTJtRmMxS0Q5T1FEazBjSXM3VjJJdGF6TDZpam1zNlVWanFqNTB5?=
 =?utf-8?B?ZEdNdURyQmFqK3o3Sk05cGRvV0Y1bmlrZXRteWUzRDhvZjBKMEFYbVBVU0d5?=
 =?utf-8?B?VTdXZ1ZwNmMvUXVYSUFoZ2NFNFhEbVo2Q3R6ZHNoVEd3SlpIRm5QR2JXYk9H?=
 =?utf-8?B?Y1NLMExBTUtoa2lvbURhK3RNMXlnNFk5N1dEUUllRVFiOU9XNlB0bUZ0QWNV?=
 =?utf-8?B?azFDSktJajFtTTltR3BkbUorSVB3ZytZWk1XL3RtMmsrMjJLUkdzRG41MWdZ?=
 =?utf-8?B?YnJPTU44WUFNNHFML05PbkV0KzJkbWcwcGhKSzBvdktKS1BMOVdpR09jaUtt?=
 =?utf-8?B?elFDYXFjMHFQVzBkRHkzaXRGM0lKNHdyRHdnL0ZqWDIzbXhmV2IwM21Pck1i?=
 =?utf-8?B?Rm9veWhrQWVmMVR4MS9md3R0N1Rpd1hTTkR5RkJuajZ3dzBvVkZTNmpXTlR2?=
 =?utf-8?B?eWxsT2FDbDZRVzcrMEVmWEEzVm15Q20rdjcyT1V6c3Vkd2RWc0YvOVkvaE9P?=
 =?utf-8?B?MFJzbEx0UEdpZlZVL3VkT2loVlZKVitsMkR2aC9nUmlBanNaRlZ2RitZR1VL?=
 =?utf-8?B?ekh3ZlFodzJSWTdueTRldGVlbElkN05rN05RdHZrUHlLQzY3WTlJS2gzUXBl?=
 =?utf-8?B?WGV6VnR4dGZBMDN4Y1VHUTVPMTlNR0hlME4ya2M5SGQybjNzMHczQ1NtcDBK?=
 =?utf-8?B?S2pOMXU2bitGQVk1alpBUXhiOURqMFFGeUxHYWU4eHByUW81a2ZGQ2tuMk83?=
 =?utf-8?B?VlU3TmlFbnVqcGJSVGh5OERETnJJc3BXSEJLN0RBcHdVd0Z3OEtRMkkzS2l2?=
 =?utf-8?B?ZkZxbkpYcGN5KzQxYXhPaXA2N251S00wd0ZwZXc2Y2toQWlMOWg0VThoaGtW?=
 =?utf-8?B?aFNHMmxmSFBzeFdvVEQyY3d1Vjl3ZlV2Vklyb2JIWWgvaWxoM25LYzdlMUJX?=
 =?utf-8?B?Zy9rNkpVUW56MEt4VWREYXdsZTg2bTFPWWpzS1pTVE5QczY5RG80dz09?=
X-OriginatorOrg: bst.ai
X-MS-Exchange-CrossTenant-Network-Message-Id: 5065e5d9-953b-4a4d-161e-08dec84e6d71
X-MS-Exchange-CrossTenant-AuthSource: CO6PR18MB4434.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 06:47:10.3196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00dc1a43-b766-4686-8706-33adb3b74360
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGLO2KnBoeF/wV5QckXc2fKaDARz4rxBMagakvXCYmRD8MhU25QEobFG6OSrjbSkeQ8zGjeQO+PA4qXpeW5oOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR18MB988338
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_234714_963684_EF716C40 
X-CRM114-Status: UNSURE (   5.85  )
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
LWRyaXZlci1kZWZjb25maWctZm9yLXY3LjIKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
byAyMmNhNWRmN2M5ZDI1MDc3ZTQ0ZTMzZmI1NzUxNTgzYWE3OWVlMjFhOgoKICBhcm02NDogZGVm
Y29uZmlnOiBlbmFibGUgQlNUIFNESENJIGNvbnRyb2xsZXIgKDIwMjYtMDYtMTIgMTQ6MjE6MDQg
KzA4MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCmFybTY0OiBCU1QgQzEyMDAgZU1NQyBkZWZjb25maWcgZm9yIHY3LjIK
CkJsYWNrIFNlc2FtZSBUZWNobm9sb2dpZXM6CgpFbmFibGUgZU1NQyBjb250cm9sbGVyIG9uIEJT
VCBDMTIwMCBDRENVMS4wIGJvYXJkOgogICAtIEVuYWJsZSBDT05GSUdfTU1DX1NESENJX0JTVD15
IGluIGFybTY0IGRlZmNvbmZpZwoKVGhlIE1NQyBkcml2ZXIgd2FzIG1lcmdlZCB2aWEgbW1jLW5l
eHQgaW4gdjcuMS1yYzEuClRoaXMgaXMgdGhlIHJlbWFpbmluZyBkZWZjb25maWcgcGllY2UuCgpT
aWduZWQtb2ZmLWJ5OiBHb3Jkb24gR2UgPGdvcmRvbi5nZUBic3QuYWk+CgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFsYmVy
dCBZYW5nICgxKToKICAgICAgYXJtNjQ6IGRlZmNvbmZpZzogZW5hYmxlIEJTVCBTREhDSSBjb250
cm9sbGVyCgogYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZyB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCg==

