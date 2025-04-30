Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A72C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 09:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h85WwBxgjjn53Or1a4R/LeK6fA49qAjSeVWXN4Bs6A0=; b=LPFCFB5+5EfsNimGtZKWL8Duss
	1Uq/dSbRmdxfjYuGXonK7L9PgAEqGVV9KRaJR4age1fog+G9HQGPwRBoAfP7RqD3YYx4/ZRKPsh8V
	CwDtckPxn2ukFVZju//TWN9qGheJXxItq4IK3Qb8f1SnVC799Uk0IxKVTmMVNlFqAyouPKy77br9C
	vl2Pej8QyPjBFGdeASeG2nf4gofMbiHn6gCFR5NlNIPL1CB0ieT0P+enwvhSPLo3B1EfhdLtyZ2O1
	S60SYUbKUIh6+EANjOKXX8MlkO9mDnbBoE8zkqeUQhd+DqTAnMZDWw3SmLLOIakduhG2I/bAZht6l
	U7TeBl9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3jf-0000000CMV1-0Qd2;
	Wed, 30 Apr 2025 09:28:11 +0000
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3cw-0000000CLF3-2Uo0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 09:21:16 +0000
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U5KOv4002619;
	Wed, 30 Apr 2025 09:21:03 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46b6uj0jr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 09:21:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1xGN/6yP40k7wHRvr4i/HfMu1+0rLAnILmsg/iRQSuPWJpKk6YzzlKCw2eDn70eRLbnINColksTLJKPBriOVicfRHpNKpBS553p9XgH/+fCa9VTVpWFgX4+7JE4GuuWlZMj7FDHXbwjKzeT4usu3AusGu5iorVxtMiiaCFA2bfxwUmKH6v38zlkm5BuIt/r4YXJjqjSEajWc/DZwvWqHoe0Fxky0tvyVjSuRzA4SMGOrgPlh8oOu9l5QP5CINa6eh9vKWwzYyBY0ixWPBlSOyytvCkxXejmGBGT7pVMN1/VspegSVrFnBo1ObCe+GJ1GlVxJcqBuvtKlKD5bMS8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h85WwBxgjjn53Or1a4R/LeK6fA49qAjSeVWXN4Bs6A0=;
 b=B7l7NTejiRBRIM5zmrS7xvzyP/eRetx65Us7Z5U2ZguidNGfuq/FrdC10ylIihDF0v8Fsgzp6MNzIJUbI09HUEdhoaN5Lk/x5AyZrC1rpOBS3JnL+eO9SBGoMeiAV0LJl4oSkgTpn87ZdcMMv8OW1TZahLvQRj0AdNMajqa+zuWaWBWZM8LCrWhAEsFHPC9rXCftx+JQRbjr7wWqDmRvjlKAmIhUNFk5Zh7j3E4JXSPutcfkcrlM1+ZEjosIkfPIBlb2+8EE+fJyxCne+m0sdbBCELzhq+4geq/CBk8B/4opv34ro0WRHmCvZOji7Bo4UB307p7gxodI/QJ+7ereJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by DM6PR11MB4546.namprd11.prod.outlook.com (2603:10b6:5:2a7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 09:20:59 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%7]) with mapi id 15.20.8678.025; Wed, 30 Apr 2025
 09:20:59 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Fix two memory leaks in rproc_attach()
Date: Wed, 30 Apr 2025 17:20:41 +0800
Message-Id: <20250430092043.1819308-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0039.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::14) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|DM6PR11MB4546:EE_
X-MS-Office365-Filtering-Correlation-Id: 8205fc89-6b44-4790-ec88-08dd87c851c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LWfjWeLUpm7FCFCwEtBLiQhRC1G1oDFaA7OXXQNoEYETYLTruib/JQsfkoIw?=
 =?us-ascii?Q?Jb2e1uaAV3tIx/81DOdSy+An51NIkgZEIFRVsRxAp7DNXsJdciiAtilT5nXe?=
 =?us-ascii?Q?s90zgVIG7DrHrcLE+tWxdXY3YDjV9u/Ya0CTe2MmaSKHI7ymlLIChB6sagoy?=
 =?us-ascii?Q?zWuEoEUBN0oMbXz7imqA83bcC3KUUZiEn1AXFEXiB0FoWKVTLgdC3qk+jImw?=
 =?us-ascii?Q?/KN/MK7ixMvsmPdZEOfikILZUNNyLC3YoulwwU7xlV4yjf8j68LuqySPt0s+?=
 =?us-ascii?Q?wvNeW5nGQf8cUFd9lb958OB8VYLLbLIrs5c/ZjzOBhtcJnb/qcysqAh2OxJy?=
 =?us-ascii?Q?7YK9FFTo5NoZ8Qo6RpV+PfrRj3i4lFURNyMTk/nr7wMFwIVKo/CcD6WImZVK?=
 =?us-ascii?Q?xL65iECmQ4OSErL2zLtiwHqotLXefaNH18rKyLAV1Y0d6hlXLQiyrFkoo4ZQ?=
 =?us-ascii?Q?D7pgDhaQQ7DgXL9rBz3jvGFhqXSYkTNP82WJX5yjyWUsqRwDvPc8xACjNMDc?=
 =?us-ascii?Q?WG0pAdtsFurki18RyGkOaVXTVy8sIscHP+kxAoXjsGQD6V0NQdiGjE8Um0C3?=
 =?us-ascii?Q?O+sL0Zi91hhFDuWLA2wkrBRGWbZB3xLjmgDASUMbLtTHjRUPeFukR1t86fyl?=
 =?us-ascii?Q?iPeeksiLYwv4hw2KDn0tsxRKOhl1g1cgMLVb+in0pu4G99BkaFBT0Dfaq3uS?=
 =?us-ascii?Q?N68+6cvGbnItK7kr4H6ZlHcodkTReGfsFiSrzdUnJnptN4045r2wJ5vJPjqY?=
 =?us-ascii?Q?5H+6E9S+ixTEd5c/NYMTRfezLgIr5CBFoxs1cxSImPf0WCCkGexEhk4/m7SC?=
 =?us-ascii?Q?RqbEAtXjPi6Cw7ouIU7OUOc3uoo0dMpk1T7cI2tJopN/Yx0ywmC8lq5FLOec?=
 =?us-ascii?Q?ojYF9Q9ZIwf/f+jvwElAMFeWllPN7iqF2u/8Q4d2ZuzpGAIXrMMbts+EUZfD?=
 =?us-ascii?Q?OU2UdcHVBL/6z/C24kxCbxMm/2vo6ACIIY39DuXDKXkJuOC/5XH5VBxHck/v?=
 =?us-ascii?Q?KZuX6rmwsDvPtmqW4khjpVH40q3g1AHhm0IBgMKKHQ1ttPR5nVguk1cjUMFr?=
 =?us-ascii?Q?uP+i9yM8Yjn1zURTJwUbtbLbNGUfsk/Ztr0sOIcU7iOQ3fxqfNItMiqhxMVp?=
 =?us-ascii?Q?hxFtKKTelJ7EN01omI9cIDYYPL9tqG3Ww+O9q3yT7uF9rtq2TXb3EPoYR0CA?=
 =?us-ascii?Q?vwLfVhBgSzpEcbDGv6RmipoL2aCh8tumWjG2AeXEI6slCJV2PzJLFAKySfzV?=
 =?us-ascii?Q?OqmUVCirrV3cTfQcFVPeW7MQW8DlNuCurCUZgc1VV+7QWAXtUQko4Ngb1mgN?=
 =?us-ascii?Q?DZyI2d1coo1c5zHczHIUICdF2ey3Mrwt8d2IUEgfyXq3owU44l8rTuQ/d47j?=
 =?us-ascii?Q?TNxcVuExKZ5JdQrR9r7P+rfqVWUKriu6ZmWk0n3cK7E/+/ncmfmhOJKOJ/vY?=
 =?us-ascii?Q?kMNmGAueOGq470B6lIoEYZpKjCTlql+pPDIQ33ZzKd4zz890beGIQIzDbsB5?=
 =?us-ascii?Q?3cgPGF911FIZyEE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GJjF0Et9rIcHX6sLFbxoeJtMHG0bkolPpBqu5ppyWhWMJCnFqVAkTwqMO9UF?=
 =?us-ascii?Q?EISvc0TVyDencuUp29axBNfdI5YDNR0yWpLQ89VBpBbnz9p2hr/gZgrpyYv6?=
 =?us-ascii?Q?Ausz1Lg/dHj/q/af3M1Tx8WNYd1QuAPGsO22V9dueQLPyRomEjU9h1mUfdNw?=
 =?us-ascii?Q?Ck7qBSiUtjzQNjPgnHdf9q87Ozov4oztiPXyOjVRW6F0K1ek30oJw/z9HO32?=
 =?us-ascii?Q?6nhaThl5+bhvOIVuiSjc9JgOBpzk86/067ntftIBhgMA4Y3xm1AlwTVoWZKn?=
 =?us-ascii?Q?Lb6WOuEUFg/H2+vsov16eHJ4YQbhdGQ93upUvzmlzMmB+iPCjvJn66AujpZO?=
 =?us-ascii?Q?p1PtyU3oxX7jYIJbr6jmYgu4VuAsP24ZMskTL+011NYtG+smgOY8ZQbKfRnH?=
 =?us-ascii?Q?Bg5vA1OPLlxwwJXPE2iwj9D7n+IFDCgwZ0rLIEcjcyyklX3Skk2lbsb1goZ3?=
 =?us-ascii?Q?NnM/YYtoPdC+p5AHV35aT6YJ9efSCevuya/xtbjGJPKvpVKuswdoXyNyfYxa?=
 =?us-ascii?Q?wLOjqnCdw/dLwmnk1/cpydU5pd2ApTu4v0Mnek1DIRwfYvsRMvqr8OlFtfgK?=
 =?us-ascii?Q?+1WViQBI0S+y1Qmbe47P1uva61eV9EdzSLJG+BbAa5Y9zgjq2MzvnXseU2zc?=
 =?us-ascii?Q?oh5xKnem/BRPrULBuTpqn8+GKK6Z/wJBSt7Hg/SshAOjoonvjCmmABStpOuv?=
 =?us-ascii?Q?YWF9ff+p+vfFOngT8kCztHBA2omEujCgnonNnnoAQaYuhbGqctDq/W+b61nN?=
 =?us-ascii?Q?6cveeCYVqCja7TmNPHmrXkFCJoHwec5aqnpIYQwDcWwfnFemxMsGj/d/rqUX?=
 =?us-ascii?Q?RJ+knt+3JZejgZwFDmfr3k5CLdBg2Gdd0Ikojf7Ru0CqK4EGBN9EGqdpYnCG?=
 =?us-ascii?Q?/oLo0kdaOg2On+GJi8LoLuu2oeC79KLKk0kMhIQ6YI83C7s1K+5mf8i7aIb6?=
 =?us-ascii?Q?1acKy5Zg4uwRDsbFPkye/tC/Mt98yJRNijvuMHiUAXqh5SBvsyCdY55QDzO0?=
 =?us-ascii?Q?NbTIqQeUXSiEZESMTYTLO1eXaND0dj8r937IobP2xzAYZTJ26iROY2RG9JMG?=
 =?us-ascii?Q?wuYrXOYc8ludZ5m1DVuvnvunAxC/8AdXNWKng1LzKAvXHGPsVLKdpVlV2h05?=
 =?us-ascii?Q?PF2tg7YD1NgVD30ISGCAq/VVYyhYadV8KJWtO+9oNA4BTXUljAWHNEocv8nA?=
 =?us-ascii?Q?j5wDloq2nS4Zn5Y3EgvyxoKM1b+dSd74m7jUUwSgl6WNk7yVXJuWBqlSjoWV?=
 =?us-ascii?Q?EGyX1vLGJbbwg6HgB0lu4avOfqFSPSfgcfhz0oIy+yYN7SlwXvqIA2dGJcVq?=
 =?us-ascii?Q?KjNRWQ573YtfkGlUuISfYdJNN5CNO48YxgzsVuUYhbFdrzCo0KG9nqQxR3nz?=
 =?us-ascii?Q?+C4bPrNyXFKL3Y7Cfu6Us5trGvUgTBgm9bsNjdC6rTN6GdIsqcNHa5cW37RF?=
 =?us-ascii?Q?zfSiWbL8y7aKm1iLeLZaNqR7jgUJhpmO0z7XE+/VW0AEDm9J6YcYX6qo+NYu?=
 =?us-ascii?Q?58o+lXwfL+tObOvLtvQHKdYH+v8us534E9mMrmwiik7GsJ0bgS3G14KyZdzr?=
 =?us-ascii?Q?trvt/shahs7O2Sn1WLrVMmwYB6j+XcszGRN2nvs+8MfHw1aYhGwwUMuqsbTR?=
 =?us-ascii?Q?Ww=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8205fc89-6b44-4790-ec88-08dd87c851c9
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 09:20:59.6100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGiPFi88gLCccT4+MzVtSBpvwK1Bj2uOuxvwP8pUlErs59UJxPDWMTTUmpBZLvTgW+r7qK0PQmpU7/rQUyKcmBjEYDhndHX7EMyKUlpFJl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4546
X-Authority-Analysis: v=2.4 cv=DZUXqutW c=1 sm=1 tr=0 ts=6811eb7f cx=c_pps a=x8A/wAfU1CBlff9R7r/2ew==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=r6V6WfGdMcT6DEXCHtIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 9UBD1sNmoG25X2yNw4CmPI5FopGFw-AU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA2NSBTYWx0ZWRfX/BUTuZYaJJyS aIWlZc8n6Ch+8s61jRG40IwDt4IwZ67cjo0TeFMRBoL4HvLqXNHuxPjBX//YRcBGGGV5O8QnON6 M3FMCduZM8LRIEcT870jbQ+xNwsEk/8tndIq/9cvPsgaIrnQxbl3xkXoE/i7qz2yjiThoQyfRGU
 veHS/es47h8kAOdUgPf1+KzR5r/Nk2ZGh1D5DSt6M6J4yuOw5HD43CwBUKPogvCNn9+Aukq+BUZ QPJAYeww6bS3ODnlvxiKCVo4KYxgxEC4znZ/r6in9YDD5P04UqzMqxjcQb1zqMmIuujC27v41DZ Rx13qIq4ZaTL92drVnF5lNv1ffHrcToLW4zAjZ393ciGSY7ixuEmgZmFVUP3Sw3i2/pQeGUk8UT
 ebiQDmaBG1WFYQ+V+T0Src/ukNK1P/l+BDnWsiEuAWndrya8YZa1/OgaHc1OJ41LwOPcMyGM
X-Proofpoint-GUID: 9UBD1sNmoG25X2yNw4CmPI5FopGFw-AU
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 mlxlogscore=867 malwarescore=0 impostorscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504300065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_022114_756571_83AB6DBD 
X-CRM114-Status: GOOD (  12.33  )
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

In the rproc_attach() function, if rproc_handle_resources() returns
failure, the resources requested in imx_rproc_prepare() should be
released, since almost the same thing is done in imx_rproc_prepare() and
rproc_resource_cleanup(), Function rproc_resource_cleanup() is able
to deal with empty lists so it is better to fix the "goto" statements
in rproc_attach(). replace the "unprepare_device" goto statement with
"clean_up_resources" and get rid of the "unprepare_device" label.
and rproc->clean_table should also be released

Changes in v3:
    Update patch1, replace the "unprepare_device" goto statement with
    "clean_up_resources" and get rid of the "unprepare_device" label.

V2:
    Updated the commit log of these two patches
    https://patchwork.kernel.org/project/linux-remoteproc/patch/20250426065348.1234391-2-xiaolei.wang@windriver.com/
    https://patchwork.kernel.org/project/linux-remoteproc/patch/20250426065348.1234391-3-xiaolei.wang@windriver.com/

V1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20250424122252.2777363-1-xiaolei.wang@windriver.com/
    https://patchwork.kernel.org/project/linux-remoteproc/patch/20250424122252.2777363-2-xiaolei.wang@windriver.com/

Xiaolei Wang (2):
  remoteproc: cleanup acquired resources when rproc_handle_resources()
    fails in rproc_attach()
  remoteproc: core: release rproc->clean_table after rproc_attach()
    fails

 drivers/remoteproc/remoteproc_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.25.1


