Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C652ACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJKvOZhbllWAuBX18vIWbIQAL/ixJ+gKlACZvpQCp80=; b=t8683tb0QmehMQX7pDgTqGFpv+
	LQEFLypacBEYQh0zlaPxrnXtz/5eqRglv5/7r3iAK3UjG5aZ33Jst0K/ZW653o92wBqjFkv/fsl27
	yNjCEJu5QKmHFoOOJxFD3/BWUZwMUUTjW/W+8uioGnSSQgHaSK3RQF3zrXPox9Yh3Tb03+PFZjp2h
	dUpHLMs3tbdAvNTUrLhZObSWRWfWFkmj4a5jgbzKKtHH6JdHqvqiTfig9y7mWqzm6QGkPkzSMXQou
	Wbuw07XusjaKLpSygT+SDDLp1fHy28lj9Iv+nakzFhdlcyuOetx9QnZtzfOTTvu94mn8JEeU7CKuB
	NDk7jZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kQ7-0000000B8uj-05qp;
	Mon, 22 Sep 2025 17:33:47 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kQ5-0000000B8tk-1s4F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 17:33:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyayUMk/+KGqmpZwE2YZoQkzzrOUdtKYGpaGm2qVs15NJcGVTavDiqmLUw1yio/efI8FnJ/uJ4cGaGV83jrwBYQgffF/hUQ9tez/fRRQcPZu/lw7NrIi1cX+Ytewcxn5v0PsBKuOed8o+kKxSNQ+T5eme+BckceuTHye5fNcGQH5viZsksT2stPlg/0IjAk1rSOAP8EyKQK9vpC+DEuDedJwnzapYTDNJyt/xuY//f5i5IGVarwD7EuUM/84jbPS5g1md2cztV4WYTwK1YRFGyNXTKPKpTSg+JCLiFkzf8KBl2o6ZaQssGcpmmF3RwxzpROvAkHzsqvxzbDglGN3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJKvOZhbllWAuBX18vIWbIQAL/ixJ+gKlACZvpQCp80=;
 b=hdYXLtqwNDH0+XkBad5WSxx0iyvS3tceymYyacNAmbWdYhFDXnPKGjB6drN63xFCef3Qkw9D+yUc2vm6w33xiJ6oeveS+BZVtaBty+IH9PNfpwl1WoDpEKPZZeGzXtvOWTaoR8DhbQwsoV4M+U58OITOch8k9+3mwAi7lEcB3nOFgsOPm2BT+wFgwuCA4fJ0P5UT5c3RbyU+f1lsn+uCE3vj1KydQTvFO5Z8Se9M4g6cu0CTrW6WeyhxADM+zRyVq5P7yc/Fv9N0X7fNpLAdwf9Fu2mcJf4Ydy6edhI7oLjhSBx5ws5PM61n7vHdmiqpD00XTI4UKfehJqjABCCDyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJKvOZhbllWAuBX18vIWbIQAL/ixJ+gKlACZvpQCp80=;
 b=WwGrrmeVesFlqtd34LicQzN+zJr1mzcETbRiNnNIZa2ymedWq3bazuEawVHLVbLZAC1l1GBwnsRHPNVUSdxH/w8neJwKveb4eLe1Z7Eb4C+PW6cT1nxFESpIHj/I4DkqZGBtiIGm6FhPxi/CG2kYUnqvg6a56GTvGlwNK/giz30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN0PR01MB6862.prod.exchangelabs.com (2603:10b6:408:161::11) by
 SA3PR01MB7917.prod.exchangelabs.com (2603:10b6:806:314::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.20; Mon, 22 Sep 2025 17:33:40 +0000
Received: from BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83]) by BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83%2]) with mapi id 15.20.9137.015; Mon, 22 Sep 2025
 17:33:40 +0000
From: Carl Worth <carl@os.amperecomputing.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, James Clark
 <james.clark@linaro.org>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jie Gan <jie.gan@oss.qualcomm.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] coresight: change helper_ops to accept
 coresight_path
In-Reply-To: <20250922-fix_helper_data-v1-2-905e8115a24e@oss.qualcomm.com>
References: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
 <20250922-fix_helper_data-v1-2-905e8115a24e@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 10:33:28 -0700
Message-ID: <871pnyo0if.fsf@rasp.cworth.amperemail.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::21) To BN0PR01MB6862.prod.exchangelabs.com
 (2603:10b6:408:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR01MB6862:EE_|SA3PR01MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b423053-e840-409a-770f-08ddf9fe2b28
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LrKl+X1f3MrVWHP4lkRxGyHtGbCOUljekg2P78Gn88R1liehSSLo2e7mLAIn?=
 =?us-ascii?Q?mdazJ3JjbEpNe/wXS0EEx0Xjv1kccGPy8jhpjhTPyWcUzrlqxRpEtd7TRpNE?=
 =?us-ascii?Q?yLRNt8IkYNy6P/bYTOrAAIkRKqRn4xGHZz5fzsqJEUsDPOb5fc2JxbDODc7U?=
 =?us-ascii?Q?XioJ+eVJ+3u2LyXP3MqpX9dHzo7uqHMvLXFAwrJIOgZ/HQEpn/fir+DR73SC?=
 =?us-ascii?Q?eGfpB1yW7l+dEujq9xKf4LVJX++kXK8cGudDMDFAKljssP+xdLS6JleN30GY?=
 =?us-ascii?Q?psUidqXGDViTFsAep5YYt607fD+4xOux+Z0liy6kI2ywnbMZndFRLt1KJPT7?=
 =?us-ascii?Q?169yjIoLpKfBXMHcEps5HMQOayAJkb4W9brlxO+AK4ENQcnx5QM8eZL17YFW?=
 =?us-ascii?Q?KXaAtV/CBSCTDbLvt+k6Hkdz+pIkKriJatbAuOQhHvW279fjo3rEsCvq5NRz?=
 =?us-ascii?Q?44UHKtf97efXBH8dZJng4jkHtjuhnTK2UFfHMWWM0OITdVifrHisLibzwzTf?=
 =?us-ascii?Q?56YfF600y+hYOkb5LuqcoyY2dW70RSZcPACBHBAxe29+r0KBoxWC/NRxaoPx?=
 =?us-ascii?Q?DXYjDtQ6ehRqGoTouztVL51GtjCQhzlzlODbkTVoviYcTfz2qz5zl2oNedMJ?=
 =?us-ascii?Q?QfCNn6TuUsJ1H8IX1aSqWC6X7ISuWv/egJfUm7h5L+mK5+PWnrqhzCdJQo64?=
 =?us-ascii?Q?UO/WjgfthZgf0j504dRRePQ3CHP1i46K/L0HbGa4ojsL/lHdN3PLn4YJeAK8?=
 =?us-ascii?Q?jVocZJBxo0xaIpn+eiP29xH2rVy6gTXQ68uAKWWhy93X7uOHPuRU3mta2f3j?=
 =?us-ascii?Q?kvSXfrjU0EXf5paVQY68AP7OXRDWpw0wzf7cs1smcyHhwjEvDypIMgjZ//s0?=
 =?us-ascii?Q?fM8xvI/V7zmtrxlD+ArOyJ+kyEXudDUIPFZC9TMyZlzkxYbDsTY/EH4a/Gc4?=
 =?us-ascii?Q?3kDvxV0B1d4kNNnvoV4tKTaLoTKNwX9Q65tlWtgkeeT2xVqgVsJHpFT21Dmi?=
 =?us-ascii?Q?EctLUnqDsUS1JsJjVoggmlB3uRwALH34+JG8H2AKUrMog2S+NQItL6gMwiBw?=
 =?us-ascii?Q?lUsXvkJGILtBb+sXntO1fre2TrgSk3DrSPddySILgA3Me7vzutfzZIJii93b?=
 =?us-ascii?Q?n1BdrYDcD0sN3IUuxPVg0PjudTFGxSh5k/8Mb6VWoJ4Fs5XVdzMHzez2QYBS?=
 =?us-ascii?Q?oYt8HBlvLv/SQntzkwVw0tWpyGv7vSCOYGtqf7u+0GGsBU8Ldlo1EKY3M0aq?=
 =?us-ascii?Q?9IGkGjhr+i/Tk/cZ6zE2D9Hh5fyPiyXAOht9JansoUhCmYCc2WKy1llF72TW?=
 =?us-ascii?Q?bN98VpEpaofJqNnhAFIkBLoEAO2cxuAAK6sEopYv/DZMFbp7bALDP3h5uY4K?=
 =?us-ascii?Q?RgZKafHupL8qrbythgDdmTuSoVhxd0X79HZvvbLXk+Yf6zrbrh3xaSejSIsF?=
 =?us-ascii?Q?GQn2cFui9HlQcPYirzlAz2lnHVVTiS9hujajqTZwLi7/5u/oegi4yQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR01MB6862.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cpWpqr4ePEtRUuwy/z7ZJdn/ZIbJNHNlkbR2LT5+u5Bjvbk56/2eUT4Qn/m4?=
 =?us-ascii?Q?UvmWFgo8C7Z+GQOSyPOzQUOmw4rOi7ZrKKvfOCJy8ooHGna50XPsBQpQdBAU?=
 =?us-ascii?Q?ZTuPDzbdgsm02WP99u7D1HrENlPprZGP2s7xGptXiSr4YVtMz5v0QWLAFv7x?=
 =?us-ascii?Q?Q98wtPcWkI0BIbo8RXs5nz9s02bn3RYSTg8GdrhvGAeJ9MPg/A2SxmhP8SeS?=
 =?us-ascii?Q?sSDgkrHagGNX2HCrA9xKNxMvNtSoUZ2DcjWICPKsxb31g+fmNVJq4srajskl?=
 =?us-ascii?Q?e/freVl3eYv6KvCiK0PMXaqfcN8Bhm4EFxAyRZQG3tVtPOMLvk5XBF3l+Sia?=
 =?us-ascii?Q?PWRe/sxlGQKupvzaVn5hBHfcL3PdH9IRmV2ju3xg+HtHO8I/rGVAHeunRboX?=
 =?us-ascii?Q?B2eQpalrm4X0GfH4ZPSuPofsKlS1N+eThdW7Y9xZZDG6HToI5L9qczZ5kSG1?=
 =?us-ascii?Q?9BjlUL/PjTnG2pPHekKrtmTaHPDh31Rg01D0hUNaSxX8HkWltbNp8Rheqd9o?=
 =?us-ascii?Q?uekuFf4MTo2n0PNK59y219Qfc6YNJVtvbLIB6QWKsspD8vcJ7f/6u420heyM?=
 =?us-ascii?Q?eRyC4fLTPn1vpzvuK4Ik3gr9Ww8R8ZNrYMfm9TYiE8+Qb6yUHYbrp+B7DSg6?=
 =?us-ascii?Q?6wUBcljLIjYX/Wwn5rIBQJavjhm36KxGHq3I4CJclb2uSRSwpoMZQnIv0sF8?=
 =?us-ascii?Q?2phQSveok/p6G0tTi5r7EJYKj7umUU22ylS65vIAVnhk+E2+I0Hz9rtQKniQ?=
 =?us-ascii?Q?9VZ37r0AeJoT4TQuw31VFpE2mDg7oRjEST97Q5uE4igDAukbYuE2IU+mwKfT?=
 =?us-ascii?Q?il4tAAnOOGIXHuRXsfUtjErwDGKDp4/kkQDv7E1GP0qBY4rnf4YVR+p0yUyn?=
 =?us-ascii?Q?WxB941m0l8Tlk3hLknDVJ0VODa9dH3p5tYI5COc9Vw90stKVM3zvU/CtwpXz?=
 =?us-ascii?Q?LwFfdSOrLGs/Cl4cyePX5rfS5r6cXWRz8uMODM190uYf7O4FAPn6toGgbrfc?=
 =?us-ascii?Q?zxFTDV6+x/gpV/a7gwWSrTts+z7mnWxYqgK6oi8gtZXKHIPp/qSTOn1APC7I?=
 =?us-ascii?Q?WkTgf3O4ufkfIY3K7k/FPomQYhP6UvsY8/+226+bbteTHesu6IBGTIJ/CWI/?=
 =?us-ascii?Q?MMv3aGmYRxrRfCFuGEv21sKHnH7L2Bq3NlPDq5AcYhuJ4gHlSbWgfqqk7WfS?=
 =?us-ascii?Q?1GfuIkXpw9nnFX16KCfrBMiHQZ/MeypQapLx1ckoLV4C7Pmv1YgRDKwQk/Qh?=
 =?us-ascii?Q?7vw5L3WiaUOXAu/ZH51+sjVTGQbM9Mg9ivPvsHrm/KuP3ApLMQPPPtIW6W5w?=
 =?us-ascii?Q?6u3aq46T/qmNm6sw4ZRDUsqeHsfG6mv/oVYe+wCcVaFeiNSgPC2ND8jbEKIE?=
 =?us-ascii?Q?OlRSXoaMrD896lH9l+IpXu4Nd4OmUsHVt6f0k0tCL80jVz5vx3eTl+JX+s8K?=
 =?us-ascii?Q?d+su6BrJsfojfF4K7agjFac3RkVZ0dp4SQC01XgohJg2gNc5xUZ+xSC+BtwV?=
 =?us-ascii?Q?duO2Q9HOZ3sa52n/viJBujQ9tRhiBjjuUeqj0XRaeD1XJSFuoHnXysVeNd88?=
 =?us-ascii?Q?x5ovWaOTpHAOm+BNGns3t88JMuVl/iw5PUpkk3oy/RrqEUCtx9Jm0rQn+vjF?=
 =?us-ascii?Q?gcGVW4j2Eq4s0pdd406hREE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b423053-e840-409a-770f-08ddf9fe2b28
X-MS-Exchange-CrossTenant-AuthSource: BN0PR01MB6862.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 17:33:39.9710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+TfpBIeuRsCRt5St2mNBLz+A4LBJe2ZpyDli2rUgdCRYBuUROEbBDlbf9A55w1SdHrV2q6iJKio9Wt56KGU9jUDvNRdWfWDHKYWPgZ8BeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR01MB7917
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_103345_484122_68380FCD 
X-CRM114-Status: UNSURE (   6.21  )
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

Jie Gan <jie.gan@oss.qualcomm.com> writes:
> Update the helper_enable and helper_disable functions to accept
> coresight_path instead of a generic void *data, as coresight_path
> encapsulates all the necessary data required by devices along the path.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Tested-by: Carl Worth <carl@os.amperecomputing.com>
Reviewed-by: Carl Worth <carl@os.amperecomputing.com>

-Carl

