Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF58C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 18:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJ1TuA/FzareweD1/UHvvFYt7EZ5R2hI7CJIQBhh/t8=; b=xMdrhvq+zsps1rqx4vUk8cVuug
	d5jHM5Sr8Ho2lZVYDcuV5xNFp7CyO9Ko3vP5LUFTuKEWBxgF8ddxijw+8YtdrwA4MRPBkDiBzGJ/k
	dC5M9oEQ1522HzAjWp2DpnGJIoi7WlDomwP/19MP4jqynWkm3COXwPmj19JNtPellaE2oOF/4pe95
	cBiU+mNyRWXYsFrtMFS02EpPcWgMX4Q0nfGyW1OGsLdJKRG8fAB5s/7xoxZTYMZs3jgp5pIRfA+KQ
	/f5LCyJxpWzAAPF+B1vaI2lF1xI+9F56OW9ZYF3Hn5Kn8S6DZBljWuGGB9mo44A5gNapDEwojxmHq
	Jz2/FSBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0o7-00000008DoZ-2IzZ;
	Thu, 24 Jul 2025 18:36:43 +0000
Received: from mail-co1nam11on2071c.outbound.protection.outlook.com ([2a01:111:f403:2416::71c] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf06H-000000089l4-1FMI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 17:51:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0EjoEUcOWMWXPOQcUb02c0j6Re98btM5jvOtLVF1xWBYyYKxkN22TXKyC3YO3m0Umv514ThHbznw8HId9sFdAS1ktW2CgrNR7Y1yFbiRiJxTtvNBEHiRfROHilW3XL9g65aLvMzhrnPoVTtF0Oxo9DkZGke+suS/gMQeRisanerIfaPaTpCuNJovOHYnfaTt/Yb5ipqytaTn2na6W8Tr1mbr1zq6x6LMWod0UZ94z9vLajAcoOnhlkxubF4UFc/J3/FnNsnBRy/7+lT5FSDXd+EQreJqeaoe+Y/AYXwTpIGL8WLEd6ivmekTrIcelK8FA72LmMvK/ZrvISlVScA1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJ1TuA/FzareweD1/UHvvFYt7EZ5R2hI7CJIQBhh/t8=;
 b=ZIyvWs35mfyS/BDLEwi6yFY1g9/BRm+nDU/gblitPDEUGQ3tTclMR7u6QSwx30KfOYBh6uLlmTNybnzhFBnmRTZvSPLyWvLJlN2sXEZkINL928rgDjNTk2DT3pAmqlO4iC4KDEmpWhXLq73t6ZCzkRqq3cz9afn560TknYJktlkkCSROoPtfgx3f2xMvk9WE4gIuMjmrCh6z/By6l/7mMMKCS4dbrZcK4O9HR3potDIOh+jv2A1M22qSVjCpNvnWEFjo9jdIszwkD4UFFiTaDqDvLfh4hdjXpogD3uO1otpu7/yspm5kcawNh+9KJ3sbWsAxUidJK9/wYlne1jspBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJ1TuA/FzareweD1/UHvvFYt7EZ5R2hI7CJIQBhh/t8=;
 b=DS7XUot8t5Bnv0bPb4gG1vW7WunHjeB0EEiIFzhIHfIXMSjLL7OJDOkhXYelTK9sbpDVxRromo8cduA3WI6O0w7oImItXJLqjLT/tfmLgtu6X5HQIo3VA+WxliNHTiMyk3drKMvRnKnvt+6FH5/VDQ9Bnum+sU5MsvBrPomuFuU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SA0PR01MB6457.prod.exchangelabs.com (2603:10b6:806:ef::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.21; Thu, 24 Jul 2025 17:51:16 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%2]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 17:51:15 +0000
Message-ID: <a3437f60-669f-44b1-94db-58baedbba0cb@os.amperecomputing.com>
Date: Thu, 24 Jul 2025 10:51:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: Enable permission change on arm64 kernel block
 mappings
To: Catalin Marinas <catalin.marinas@arm.com>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, will@kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20250703151441.60325-1-dev.jain@arm.com>
 <aIHsiPtG0Ycm2DTe@arm.com> <b5570f50-8534-444b-8c7d-68d676840eef@arm.com>
 <aIIf8Q7EVsQ5MGOX@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <aIIf8Q7EVsQ5MGOX@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR12CA0008.namprd12.prod.outlook.com
 (2603:10b6:806:6f::13) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SA0PR01MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 58983702-e016-4151-5f26-08ddcadaafc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUx3Z3FZbjU2bXRmUEN0TFBRajR6THJGcjJnaTU0ZkFmY3NpRkNwZHRRb1Bj?=
 =?utf-8?B?OVFFbXB1NGYzd3Y0NmhNcW1JT0FiWkVZQVVmSlRmeG1aQnYwR1ZEdEZtVG1C?=
 =?utf-8?B?Q29BTjlBbnU0TWsrT0kvLzBzZlNoYjdHR3B0MklWSmtvYXZPK1dxYmlVc2Nm?=
 =?utf-8?B?Z0Z1T3lOSkRDSGlqNFRmM1Jkb2Ura01ZNThDTWdtWXQ1NExCTmxtcnI0TC9R?=
 =?utf-8?B?dDdXQ01Xb1EwZ1RYQnk2VnIwYlVta1l4eEt2Y1gyVC9YUzFQMnNxazh4cFZK?=
 =?utf-8?B?WkZ0Q2R4TndvSVFGZFFjeHNTWlBJZnFJcWZiY3JKNlh3VUFvMk9wQmVxQUNa?=
 =?utf-8?B?aEpYR2dPQ0dDTElvVUdEQ1ZVV01VVTNiTFZYclZXRnRIbVpQRzQzT011Sms1?=
 =?utf-8?B?RDJwcUREZGFKOTZ2eEVyaWpBT3lGYWR3ZThsbC9sWHQ1Z0c1WXhXNzF3bEht?=
 =?utf-8?B?RmptK1JMYTRCRmtkL1JrZ294YktBdlFUTkY1Qkh6dnFmRDRrTSt3WnlQejkv?=
 =?utf-8?B?QU5UQmI4blhpZjlXdUt2NzFsVStNNTd3TGErM1pmSGNWbEdQS2tQTTZqbkxj?=
 =?utf-8?B?ZW90eXpSUW41SUpyUXZLVThqbHlZbXQvQ3hYRXFnZFJvVFJQbXBTZHpSdXdW?=
 =?utf-8?B?dTRjQTZRa3I5YWo5NUZKNEtmbGpiRFJub205eWtEUlBmMDk1SWVZc0FpOEl6?=
 =?utf-8?B?M093dUUralRWaU1QdnFJSTlXWmcyWXcrZnNnQ0NCemZOMm4wdHZMc0N6Rm1v?=
 =?utf-8?B?UTNQaitCd3Z6MVdwdjN2RkpHTGExaTh1eUNjOVdCK2dFS1FjM2lrZVV4SmZ6?=
 =?utf-8?B?eHRibFZ2c3FMTWtOV2ZBcUp2YjhDbzVHd3lSb3lCM0d0cGpIY2xNSVN3L29V?=
 =?utf-8?B?OEwyczh2alk4Nmk2MC9IWVlld2NvTTlPTVRlTi9Qc2J3SlJoMUtzblFxWWF3?=
 =?utf-8?B?bzdqWTVYbzFEWWplZVhxeDI2dC8wV2tSN0xjeUFpQlZFTHpIYmVjN05HYjI5?=
 =?utf-8?B?eTN6d0VMNnQvOGs4eWxJVjF2S0tOZHRnTjR5YThXWGJjK3BOSnhSTmRjK0Fm?=
 =?utf-8?B?ODZNamMvZEt0N1dlNmUwa20yaWM1NCtiWk83c3dsMnhJWFFRRTRGdzhhVzBq?=
 =?utf-8?B?SThBSlhlSFlXN1RCYzVmQkJpeGJlUjMyR0xDTVp4aTVSalRwV0tjM3ZIK2FZ?=
 =?utf-8?B?V3RaTE5iWHJiS0xzaktMTmFKWm1zeTMvTUFJbWl2ZXlhRXVxbzhGSjhoODdY?=
 =?utf-8?B?U1pyM25JdmkwclNINUN3eU5FUEorcGZNVzQrREgwWDVvU2lxTU9YRzBOcDFM?=
 =?utf-8?B?L3BhU1djRDE5bnFlTmI5YzhlU0t2b0VrWFdBRkxlTmc5LytuaXplaS85NmtK?=
 =?utf-8?B?TnVzUGYvNUljQ0ExSUFoV0MweTg2OXd2M0s3biswN2EzNWpxSzNsMzVZbENO?=
 =?utf-8?B?azRuY3E2QjlXdEdBZno4SDBvR0lmSE0vRVFtTUp0MnpnZExsckF5T3BhWmwr?=
 =?utf-8?B?WVZkcUt4bk1qaG8xNjViNldwbDF2TmhFS3pJK0VhMjRjeUhHbTE5b3JsVThM?=
 =?utf-8?B?TzczRlVXaU8vOENEOXZ1cmFKakJPaTF5RzlBK1hjNnQ5MlhHc0IrY2VWRGEy?=
 =?utf-8?B?YjVpQzhsemlnYk5tRVZheWh5NU55TjNHdE9SRUV0eWZHcHQ5UHowRnduSzE1?=
 =?utf-8?B?a08zblVuTy9aUUtIdThrdWt6WnBhMDI4NGpmR2RDN1dCYk1jamk0cUF4Wll6?=
 =?utf-8?B?N1lwYTdtbGFnS2N0SnJJbGl3ckFpeWhTM2ZHYUtqWklBQlN1WDJjNkZsM0dk?=
 =?utf-8?B?UDNFNEx2V0k3Q0NMMGJMV3REaTNOdE5ML1lOSzBLb215ekNJRHR4S3k2L0Yy?=
 =?utf-8?B?MlNvNlJjY2JKN1NjWkNnL0lNNW05cnhTU250RzJBczR5SGRKeVFZOURjM1dl?=
 =?utf-8?Q?J9MaurKsHJs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk9ib0x6bit2V1hhcGNjZzFwSTFYU1JtYXhpOHl2ME9HZWZYaXp1RXo5K0pj?=
 =?utf-8?B?Rk5LblNDUEY1emdlZzlhVzBIU2JlQzBlQUoyT2tZb05iRHVKTmVxR0ZJdkNJ?=
 =?utf-8?B?OE56MjN0cHF6VnJUZWpmT1B3RXJNSk5sRzRpK3ovUmJhcVIybmlHM0pHL1Q5?=
 =?utf-8?B?OUZ4RzhxVHBlSXVYMFluek5zczFRTVY3cUVYQWJCTzBYektMMVkrMVhKNTVK?=
 =?utf-8?B?cVpjS2ZaTnZPbTU4Z1hBSkd6Y1NHNkN0T29sRUY1THl3QktmcnZVNWxPdGhQ?=
 =?utf-8?B?MlI1TjJ4QjFrTWR1RTJxUmNvQUhoQWJ6aTR3MXZlNjlscEhTWFdvSjFnZk9W?=
 =?utf-8?B?ZkkwQ3FMc1dLbHo2eEduUUllUi9GMGJ0TnljNW5zNVplaERDcmNHMENleVQw?=
 =?utf-8?B?Znl5VGdORUplcm9PTEJkUGhMZ1FJUlBWUlBZb1dBTE1MTVVxSHVTNHgvY2g0?=
 =?utf-8?B?eGxtQklTY2YwQlRqbnR5ZllQdkYrNXIxRUo4TFVHc0V3cnZDcUFkcjZmRGIy?=
 =?utf-8?B?cTJsQzdvc0pWeDNqVHNqQ0dlRnllTHFmOXhhNmtua0FWVEpmMU84N3Npb3lh?=
 =?utf-8?B?NW5KR3hWQ0tIMlVuMTdzYTArcTlkYUZMNHkxc3N1WW9PaDkyM3RrYUhIck5u?=
 =?utf-8?B?ZnNVWWZMUDM1cVovVStvRkdIYUtYYzMwby94b3ZzYzhGTGcvSzMwdlhXQU5L?=
 =?utf-8?B?aTVaL0tNUHdGRmNsOHU3bDlNWXlsazVZK2lqRDgyb2h4MFBOSVdIRUV2eUs2?=
 =?utf-8?B?c3U0V0V3czEvaG1KZG9NRkJzTC82VFh1V1hUVVVNU1JsYTJOL3ZMZlI1eE9J?=
 =?utf-8?B?Z3grU01YRXUyemFuSURsYnduTmY0ZjVRMEVhR3hHV2ZoazR6dlFOb0hMQUZM?=
 =?utf-8?B?d2lYei9pYXRhdjBsVXFkRzdJOEhRTEpwUTZGeTEyQjZrT1RjODRuZGRJbnhr?=
 =?utf-8?B?T3hSeDlVWUZraDhZS3JSazgybk5TaVNRUmd6QmhaUWJuSnFmMktMem15TDFG?=
 =?utf-8?B?R2YwaWl0SEMvR1hrLzlCbG1vSjFMbTJ6bERFbjd4bFU1M3NvOHJRVjBPVWIr?=
 =?utf-8?B?b1dEc0UvRlA3dHVtcVh1ZE1vd0oyeC9TN3FoUTJWYm1pRUR4eU1ydXBSVlFj?=
 =?utf-8?B?VG5NTXpzeEFLdk53dGk0dVlCdmYvVEJWTTVYaHl6cE9CVUErMGNJMTlLNWtP?=
 =?utf-8?B?ZkR1cTVDbUlwZEt0T0FWMHIwc2pNRXdCazM1Nnh1bmdaY3FTKzlTb1l6YllT?=
 =?utf-8?B?M3BISlVQUm42MGZZWVY1QlZTOERBUCtOMXFwV21VU3RHUWwrejI3d1lXNUlU?=
 =?utf-8?B?WlppV2JTZm1NYjBxR2dqMldIT2Jqa2tKVlJhYlIxV0VNR0VxSXI3dThSUi9V?=
 =?utf-8?B?SEFoUXI0eGtKODJwOExvSkI1cExzS1FXVlp3QlVlNXU3bVkrdzdyQ3AvQWZL?=
 =?utf-8?B?Y0prQUpsL0hpZzRTSFdlNVVRRkd2Z29QY0pyK0cwa0JJZDc1cE5STzRwUldH?=
 =?utf-8?B?a0hLY0RCWFNKKzZQcG1QWWl3RFl2bmR5dkhPSHZnTmM1R1hVa1lUb2Z0Y1Mw?=
 =?utf-8?B?SEpSbmhvelBqajJwVWZRaVdtWEFmcCtuVWp0SWV4WXU3enM3Tm1XTkc4YTNx?=
 =?utf-8?B?UC91VGpvVUZEOCtmM0RUTElLY2JnZExKL0FnOVdjTllwdkJ1c0c3Wjczb1pZ?=
 =?utf-8?B?cFhSVnhSVXJSNC9VZXdxTUppN1hxL212ODgzcE01QXNYdWdkdlZWcGtPY1hG?=
 =?utf-8?B?Q2hEK3p3K0xiRWYzaWhFZ2ZONUtMTTBUOTIrR082ZVRTSXVpSWlqdFhWM0tL?=
 =?utf-8?B?dzB5VEhXNEw4VERXaVVDUXNwSmdPeFlwOUdrQ2NkS1lEOVpKVkt0Uk4wTHVq?=
 =?utf-8?B?UW5xd2FvQTIzMHNSUkYwamovMTZ3dHlsdCsranNQZlZkZzRNOFJ1MlN4KzdP?=
 =?utf-8?B?UnV6Tjlmb0xtejVHM29sZkMrbGJKTmlvbmRjYXlLc3dZdlQ2UlVvZDZBcHhq?=
 =?utf-8?B?ZlRBYXpUT1ZGYjNlb2I0bGZrd1JjL2FObEZXUWxiaDBlTjZOb09VUklWR1lJ?=
 =?utf-8?B?Y1JDKy93QnR0MGY0M0diN3lia1NvK01EVDRpVnVuVDR2YXhPU0dvNDA2TVZ6?=
 =?utf-8?B?WWlFSnFSNEdRTEloY2VOT09GQUVBblcyWGlOcko1UnJvUnVKdjF0L0gvcWY4?=
 =?utf-8?Q?HvUpXrNWfKu1WLZCU7eCZoQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58983702-e016-4151-5f26-08ddcadaafc2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 17:51:15.8404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdMWxmgkjQ9xakgI0AQqY9o2ssSvF8DGzVAO1F+CDnwgiOCyoDTQUlTlqL/JRvEY7462PDB31JsqDy+lGQ5EFU9GhoUDH9DVOM89S2+QgXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6457
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_105125_332230_5A6F95AE 
X-CRM114-Status: GOOD (  16.38  )
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



On 7/24/25 4:58 AM, Catalin Marinas wrote:
> On Thu, Jul 24, 2025 at 04:10:18PM +0530, Dev Jain wrote:
>> On 24/07/25 1:49 pm, Catalin Marinas wrote:
>>> On Thu, Jul 03, 2025 at 08:44:41PM +0530, Dev Jain wrote:
>>>> arm64 currently changes permissions on vmalloc objects locklessly, via
>>>> apply_to_page_range, whose limitation is to deny changing permissions for
>>>> block mappings. Therefore, we move away to use the generic pagewalk API,
>>>> thus paving the path for enabling huge mappings by default on kernel space
>>>> mappings, thus leading to more efficient TLB usage. However, the API
>>>> currently enforces the init_mm.mmap_lock to be held. To avoid the
>>>> unnecessary bottleneck of the mmap_lock for our usecase, this patch
>>>> extends this generic API to be used locklessly, so as to retain the
>>>> existing behaviour for changing permissions.
>>> Is it really a significant bottleneck if we take the lock? I suspect if
>>> we want to make this generic and allow splitting, we'll need a lock
>>> anyway (though maybe for shorter intervals if we only split the edges).
>> The splitting primitive may or may not require a lock, Ryan and Yang had
>> some discussion on the linear map block mapping thread. I am assuming
>> that since we didn't need a lock in the past, there is no need to take it now,
>> since we are only changing the pagetable walk API being used.
> I vaguely remember Ryan's and Yang's discussion. I'd have to revisit it.
> In the past we were not replacing block/table entries since there was no
> page table splitting. If we are to add some splitting, even at the
> edges, what would prevent some other caller of this API overlapping and
> attempting to do the same split? It's not just vmalloc ranges but the
> linear map as well that's touched by __change_memory_common().

Per the discussion with Ryan, a lock may be not necessary for split 
since some kind of lockless implementation should be possible, but it 
will make the following up permission change much harder and trickier. 
So using a lock to protect concurrent split will make our lives easier. 
For the detail of discussion, please refer to 
https://lore.kernel.org/lkml/b0ef3756-2cd2-41d7-b757-0518332e1b54@arm.com/.

Thanks,
Yang

>


