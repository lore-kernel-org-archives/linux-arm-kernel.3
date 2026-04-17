Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7B8F8DFFB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 08:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAqSCBsmg7LkYFKFwxiSbG+2c8wiA0mcTIFPmjOUECM=; b=WpaLkhNCME0gZRU3vrS8shKkj8
	KONwTr6Vrq57Jbza7VPjWs5Sq6vvuvz3gMtsgjQ0ky32Rp2ly6ikXVhCH5XfSvVXqpucnvH4/0yNC
	qhGP9pTLEQzVKyDadfa9+moK/WHZcsmDDoqgy+90nyLGVhJiBSr55tbuIX9rkM/O1TmQtp7ZEay2F
	p9Mp7wOEqMDSM5ytDxxSvq1n8fAlNsXJW4HFrmJA6qVA6wM8JePYrXm+j6+QxXKtsbrE5KCWqXmgX
	kHYrmbdQjXSqXzNWSb6ymqT29x7E6nxXQjJqEVVY2GutVOwkRVyzhm6py2neNSIputWoYJ1purO9S
	jmNCjWgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDerg-00000003hi1-3X86;
	Fri, 17 Apr 2026 08:47:52 +0000
Received: from mail-westus3azon11022077.outbound.protection.outlook.com ([40.107.209.77] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDerd-00000003hh1-0hBh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 08:47:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UON3VR83TQlsQUgLeR12X1fWePwlzx+kMNBqXAdIv/z3M/H84JYcNew163EmovtWA1CoJ9laJp+I7ONlkcSsOdDIMHB+yjd+TYiBpmqxUdJdl5IP/p3daq/rRIqJTArz1x+yYE0dZL9/wuFbp6PqiEF+4NO73jELYvBqhTJeeX/QxZACssHK9JotvwHnbTq9nTuLLGgYzcg9SpZMH6HkNt88oV4shJEwf5m1TSONDQ8SG7+Dju4Nyzw1JHIdqhL2/j5bFmQFMgG7SksdgR26C2oN4jTvh93Y5zaPE0XgeyelCPdoAuJ1cTCIKCggOEEN6Jr0SHW2IB55SV8807O2yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAqSCBsmg7LkYFKFwxiSbG+2c8wiA0mcTIFPmjOUECM=;
 b=crPQU/5FERMxkz2qV2dg0HHNLsG2i4ERo43yZ0sVNP8kjr4wsYGTteh9XdPXk/sDgXGrYyGhLHQSg1oTqyMPpNzAlF8qNRl8PkC8xVYSNDA+G/o+nhEa10nqtq8KyZg5e9vENTF93YkwLvYaB+5PoXsFytgXMJCF0HOBfOfC06vZCdYlKZcVEdrOtCv6unbyzVq0JMA71XLO29DYs7CY6GdZCifTqUUZswK6mMNcZBy6Adty4XKRM3BAGCeD+BRIHy2SAPGnqrpQylSZGNp0ah+9+550ttc8iNWNRbQWdBR5yBTms05S0Ml8nPrtYCzhbYqcL4APnOhuPaBiglsYjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bst.ai; dmarc=pass action=none header.from=bst.ai; dkim=pass
 header.d=bst.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blacksesame.onmicrosoft.com; s=selector2-blacksesame-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAqSCBsmg7LkYFKFwxiSbG+2c8wiA0mcTIFPmjOUECM=;
 b=efJ8qD6lEdcMa9CaHsT9wwxdrAM+oXljnfY1O9JtQ20ie4q68mRBSpoOI+VWjLl9wx0iwYy7jUrtuFN5/Ac7vTPgBkSM2YVrgkRNLtf42haE+hpOuivBF41DL4k/ZvFHhSwSC6SueWsV7b+JMI6lN52vWxsDhJHmPFGaMR4aDlo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bst.ai;
Received: from CO6PR18MB4434.namprd18.prod.outlook.com (2603:10b6:5:35d::16)
 by DSWPR18MB988345.namprd18.prod.outlook.com (2603:10b6:8:36b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 08:47:43 +0000
Received: from CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885]) by CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885%7]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 08:47:43 +0000
From: gordon.ge@bst.ai
To: yangzh0906@thundersoft.com
Cc: krzk@kernel.org, arnd@arndb.de, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, bst-upstream@bstai.top,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] arm64: dts: bst: enable eMMC controller in C1200
 CDCU1.0 board
Message-ID: 20260417.164709-gordon.ge@bst.ai
In-Reply-To: <20260310091211.4171307-2-yangzh0906@thundersoft.com>
References: <20260310091211.4171307-1-yangzh0906@thundersoft.com>
 <20260310091211.4171307-2-yangzh0906@thundersoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Date: Fri, 17 Apr 2026 08:47:40 +0000
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To CO6PR18MB4434.namprd18.prod.outlook.com
 (2603:10b6:5:35d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR18MB4434:EE_|DSWPR18MB988345:EE_
X-MS-Office365-Filtering-Correlation-Id: b1477b45-5cc5-4a5d-f0a6-08de9c5dfda1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: oCh6mqXT7+wHJm8JU4P3rNaaD/upxSJUnU3Sceq2EGdHyVwV4IHGPl/DE1l3ivFUWUNM0ImFtP5JC+ywIoUgDpxSCPZQQPlYD3f3Qr4rT7zwwO5tWWWFlAet7GtiCPtj7JBunBfiHsNDOFo/tWhRXjvBg61jJLxG3N6JLPGsEE17KksS55iP3vKbSA24RuEdEm9V55MGnnbnyytALojOzy5f3JXp3+o0/l5WSJHX+PzJs8hdEvDfk6HpW+Pb9agUeiZeo1MvODAj8RdTNClclFzBFs+kJrOM2rYovCXoipYrwKL35fGUNeUVeW3F7c+XEjL9Y4Js4A5/cjIrKKx5gvlLQvcSVa6fIHrUfqKoUZ31ZtIufwMRG8RfOwvg+wilWIDcuiAfSi3cpPaNSSCu5obIMCBQ6XbIxOFlvWDH07ah12hFXdjVqPgblKRisfo0fzkLuIG1nExiOP5JAEPc2zfLsIxMq5CIcVLEYumFEexzAVxMG/1lGpuAOai5UO+tPd5E8w/GMDCm6Lov/9bHfoyO3K1QDIkupY0lynm83M1fF4DY1UFjmmZ9Y0CpKHuMHxf8FoLKJVFsr+cTtXx+Wzu1xJZTOJC114GKpTNzLoV8S5x0rKdbvVMN6xZfIGsT3Rw4YwE00xqTy5WfSs8NSZOXWlbeN0AgJtnBIcqrE6T3Zis+q0yly7cZ1fi5ZpiTvvPlSY+YTRlf10WhmbsbcFJ3yhvMKD7NKeDqnilFZ34=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR18MB4434.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elZ0OUdmWTRtczE0anBjRkU4NW9OUnJFVmtvbW1VSTVnK1ltL2tuajgzWVJF?=
 =?utf-8?B?SkQrcTlEOUpreEpFQ0p5VG83SkJZcGxPc1VHOUJWUGF2bE9ldWhNTVd2RGhR?=
 =?utf-8?B?STNMdzRiYVZiV3BoNysvSzBrc1BNcUI4Q3dJTFZQcWNlbHRtaGhwSzVwZ0Iw?=
 =?utf-8?B?SUZjbUpjOGZVZHhsRVlMSHc3NCtWU0FtVlE0TCsxQzlQMHJuUllzc096M2JV?=
 =?utf-8?B?MDFmaGVhMGdaL3BnbGR6cFltTlVUVk50NmFBOXROLzJKckNKOUhyTGpDUXF1?=
 =?utf-8?B?M21FbGpNaDRvTmlZK1BGY1NlcjN4Tmg4dXFZYmpsSWVVb0VqVG5nWC9tVUkv?=
 =?utf-8?B?NWRadDFMN1N4cUpSUkZGR3VsakxLQkkzUlUxNXZZSTJkUE5OQUlOdDB5K3pw?=
 =?utf-8?B?VkdqdHUzN0lYUkZPa1J3RVBhZVVSNzZhckJBMmZrdEJVNXFmNlV0WTR0a1Ar?=
 =?utf-8?B?ZUJZTUNmblVNd2xLemxaam16QzlxN21GV1kwUkN4aGthNTgvelhJZHN3OCtV?=
 =?utf-8?B?ci9MdDVJOHo5Z3JqdWhOeHROT09IeEpJcDB5RU1HKzRTQUQ5L2QyS01XQXp0?=
 =?utf-8?B?YzJIR2VSVXpCWW9mOUdURmIxY1U2cWRWcGRRQ3RxOUprWXIxTTBna0V6MHFB?=
 =?utf-8?B?b3BUd1NLV2hoVE1zSDVXWW4rMVhiRk50YjFxQnZ3ZWtoSHpvZjZTUWt5UVhj?=
 =?utf-8?B?M2ZtUFUrMG1vVllpdHhFeENOY2ZHeXhKQnNzQ0FKdXR6RXE2R0ZMbTFmc1Ey?=
 =?utf-8?B?eEZpV1hPV090SEExWEFhV2NmRzU1c29YU2hpYzNEczY5U0hrRTU0NERlNndF?=
 =?utf-8?B?bzdUQVVWL3BicGQwMTYrd1Q3SlNCem1qaTlNTlJaMm5ncGR3NWlheVB0dGkw?=
 =?utf-8?B?RTRQak1xU3pONzRkY2FOWTVpSmlyVlc2bVZKbGtCMnZ1YzhqWGFaU1VzS2Qr?=
 =?utf-8?B?Tlh3dmR6SnR4MlFwNitzNDJjNjB3UzB5UGRkY21rVUxHVXQ2SVNqSlJ0NFNP?=
 =?utf-8?B?NVhGSWRnVUE4TTZ3cC9Fak00Tk5mR1ZkWmNwbHM5RTluN0kzaFh6dWpmTEti?=
 =?utf-8?B?WHNhU2EybHVUandZdWJ1R0ZneU9yMEl6TnRvTHIxTmI2aHBPT3MyMzZoVmlm?=
 =?utf-8?B?R0tSZFlMNEJXME51cWQyL1A5OHVXbFNaaEdVUWpWYzRsQ25PbXNOYUE0M2JD?=
 =?utf-8?B?MUJsTkhiclJOLzcwcmhDY29hNmpCYzZGMllwTWtIY3VqTDJscktPY3ZlZGVR?=
 =?utf-8?B?VG9TMjZReG9Ta0FkOXd5TEcvTndIaVZHY3NLUUpVNm5xU21kRVFIVEtodTNa?=
 =?utf-8?B?Wjk2Y0VsRHVKbXJ6K09rWEkxbUZVTWJELytBTUJZVXZPVlpUZk0rRXhHUjcv?=
 =?utf-8?B?Yk9sVVdMRTdmMWZnOVY0eWdtcml0bjEwVlZVMFp1Y2NMU2RGZzdZNnpYa1Zi?=
 =?utf-8?B?KytTMWh2ZlZGaGdnSnhuZ1c5dUcvNGtiSjRJQjMycENzdFlSWU53bzZUdEwr?=
 =?utf-8?B?YVF1Zk4yNFdoWmNxUnhRd05URStwN0Y2cllENHR3dG5qWmc1OWlHYXBzZVNs?=
 =?utf-8?B?d0p3LzN2dmNta2lCWG5Dc0F2SWU4b01JcjIxWVZBNWdFdXg5ZHhUSE01NVlC?=
 =?utf-8?B?Qzdkd2dEM3hrQTVaTW5sYWhHRTFtZkhQLzlndkcwNlpCc0xQSDFNd2lwVmhN?=
 =?utf-8?B?T2l1MSs1R1VSZU5iKzdoeW4vWCtHbDJvVUVPd3U0ekpMMm5ZcTROOG13bWh3?=
 =?utf-8?B?MW56aXhEbEFOU2grdTNWWjZmMlB4L0l4bzlYaEtGSVRGY2p3bmdMVFVQR2ZY?=
 =?utf-8?B?NjZrdkd1S2dXOUtNdjVFbEczWFh4S3g5eTgxNERMeUpwME1JeGxaZENUUHlZ?=
 =?utf-8?B?dDUrYVlFOE12NnNhZExUeFBXU3lxaG0rcTR6RTJzdDJUWW1jbG9KOUdtZDIr?=
 =?utf-8?B?Z1c2c0FoeXBtQmt1ZExDT2lhakkxYW1HSGU1R1lnSTdneDQrR1pYcHpmeUpr?=
 =?utf-8?B?cm9CNlNBa0tjYzNJNFpPaENFQkxhOTZaaFU4c1dDQkJoeE5jOVBXQmM3SUZq?=
 =?utf-8?B?d1paM2lya2tMWXlrQWV6SGRIWUNOeHRvWExBZmZTeFRqeGlVbDdQcERCUW81?=
 =?utf-8?B?ZUVFdG0vWVlWY0NycldTZ2ZKMUQyaEx5Zk1TejdId3d5eVlxSENOS0VIWGFV?=
 =?utf-8?B?RFAzTUc5M3BpalA5Tm9NdlIxQm1ZaktxQjFpMmNscGdqWGhVazRTM1JBK0VS?=
 =?utf-8?B?ZXczRHdOa1gxR1IydnlKalczN0thTGtVVVYyenQxa0c3MGR2RjNNbmUzU2RM?=
 =?utf-8?B?WnJjZVcrd0VncTFkemFUd1ZBa3lCZk5YUW4xbXVHUk9iTTFIRkRtUT09?=
X-OriginatorOrg: bst.ai
X-MS-Exchange-CrossTenant-Network-Message-Id: b1477b45-5cc5-4a5d-f0a6-08de9c5dfda1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR18MB4434.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 08:47:43.5304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00dc1a43-b766-4686-8706-33adb3b74360
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbP9oYcujElWuQWSdRjDj307auN7VHqLVBXdSIRpyGB8zXturBalv2/GW2dtlT1ihYDY3XvAOzikKgIk9Zxppg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR18MB988345
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_014749_198262_A94B659C 
X-CRM114-Status: UNSURE (   3.55  )
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

Acked-by: Gordon Ge <gordon.ge@bst.ai>

