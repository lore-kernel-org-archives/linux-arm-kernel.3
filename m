Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD4DC44500
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 06:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbSvCcfoWv31zc9JW7KurGuMh+YqXma06vI0j/bjWmQ=; b=YlTxqX0CF913/nh52Ybs2ofjHn
	tfUgFpN64b2qCmMAy1ty4QY1V2PdKrjgqn3G0SUDzK6Ivv1lYdqSWOJnBBImF0uy5EWARf15+iDfI
	Q9RKkkDT1zH9ULaHK+vl2KZNcIHRV8qBgEzux3Cmafbdr7J95aEFS4vv2El5+uqR0B+uAQ1KivCPD
	NZydqQ6DxS/DbsoFFPTfeuafEIwYL3JbYkV5Ln97VMgVTTE3bOVRAB2ht8WcoXSABYnAVuhtWbM/6
	CZglYD+ALQHUwd3OY/hJYywvA7WdvJH1HKj6CR3+PgHaIVJc/5uMnTrXAbKAeB+/bivjh30gBlMDf
	QTe643yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzkZ-0000000EGgW-0ReS;
	Tue, 07 Jul 2026 06:57:47 +0000
Received: from mail-westeuropeazon11013056.outbound.protection.outlook.com ([52.101.72.56] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzkW-0000000EGf6-3AzU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 06:57:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iB8r+Cz+2Y7+WB5RFHEnexRJpnbpn1mgONVxF+6ixd+4oUIecWPTI33lPb1d2trxbJsMBblbYIXF2T1tCAk76qu5mq6ldHPR+KZpb1No9dOLw3iRm9vM8E6mrduO93hFIYp2exm7Kr9rckVFAvssxXKg8z9LTHS8wDN/CUzgCCtuzxc/APeIBLoY3BGT9Qzdo+F4LKevS1mzCTLhUxeqUOrw9gr/x1NFw/iJUJqMJ2B/FMds70XLoORCZ+JJ4/qsxcY7rY1U8EOtobI8NCvu+cZur48vKx+rFnkSCzs2MetII1neJvResPpkSG2RMShpKVHPQkh5z7BX2jIkB4YAaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbSvCcfoWv31zc9JW7KurGuMh+YqXma06vI0j/bjWmQ=;
 b=VqvD+3j6Zf/kAe7ZIBrSE8PEexuEt7tQpO/wA0JTk/Hvp1mxtuu+Xqb1znbKzBYg8zM973jkAqOIfX77GKW1iF3Os3hyrzoK6lTVXa7t7J6pjbxtlbnWAElC163T/ezHFdYaVicqWTtUZTv/4DNUpN1o7QVw6HIct1jjJ/nateTWc6aC49YrYHeUIveSYeYVEKls6CLMjuTspwZnQaZtCI3eOwg6TDGhlA+RIA2i3X+w3h0m7FqmwpMVSImaOeR6N/hOJ08HwYUlWqlOyvvuz+z6n1Tc/ecFVYKftsb208r4zB84MpICRr2tFpbGXOy2ZNW7+EeXIbIJezvgIU9mpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbSvCcfoWv31zc9JW7KurGuMh+YqXma06vI0j/bjWmQ=;
 b=VPBN50rz0SVIkmFyF9UMMdmknlhDMhBFmmMQ4scT04eaXysAXBOLCo+vp+Q8CS54HIEkV7hqdhw4EUq4c+FIG/u51DMTdAf0tzXR3z5o9DLEypGPk8Y7aGTNLceyLeisioF6gK8Zk/e7v+ImdhbWu8T5WuKolCfS1XZgz3fYM6yOIbSMADNdnoFYrFYIxKqichZY70ZQT3X2+gGYTT6T0IkyrdyLynW2Mve3gy0dEPJYmN4aPRE5fJ6niSnKY//ktDmEe0tucuDvq0Oy75xgUjm5FaDaLXIrqrzBtI6OvV1OAtzBFtAaJtKfobNmhpgvSmjbJYUORDo/2OZFLC/6jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by GVXPR04MB10945.eurprd04.prod.outlook.com
 (2603:10a6:150:21e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 06:57:39 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 06:57:38 +0000
From: chancel.liu@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/6] ASoC: dt-bindings: wlf,wm8524: Add audio-graph port support
Date: Tue,  7 Jul 2026 15:57:20 +0900
Message-ID: <20260707065725.312450-2-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
References: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0184.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::8) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: 1127aee9-8fca-46fb-05d4-08dedbf5084d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|23010399003|11063799006|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: BroT4B/oaAY/Fz2TfoNC/h1aOT/ZgwypdENlgvw3ogc+oDAOMsoBh4AbMZWugR41SjfUJdN+SZQaNmHO5ZhZqfKXlCpsdo3iys5/YoO/0BjWBMJDu9gufFHay8HUYV2wZJrbH5ETEByuZKzwl6qwyKJ55vI7ciHBBipwUS/C+jbO69+JTX3kMyx8NxWTaffQoUHbA4i+oHlRpN+ebOqKojW4eYDKdbGjbu92AN8qUsmF/rUIinoHz6d0Kl7nanWuX5wgHyjYHfPQEaHpDLG0gkaBu+PK6f288J2mFvVX+meBQI0Jq/D4CR491+J//oojTBe8beViMVOebV00QM7lX20lC5ayntgSQ7POx9OBoxf5BcVQ549QenQx/mnUzW+GzBYgmSw8UBqJjt3J6+aPEJalDgazoyXc8oQOvbC+BNpA4cbcGoCnWX84tVUwS+iquSrhKjYOcp53vv77awlhSAmD7CGH29Wvz11FX76V2nZHEUNfzomU5WClk+BdVDdWYndS0u2TvYHYlsso4TM5K6PawZXRdgDRvvbrBahE2cqI4rFI4+FZH/RK42CDPMd8eFtH0ODPYJxX4hvaY26Nr6yMckXID7FnvwcZ2DBoGQkFNGcv2HRRti1CL4txGRAA8sTkv1++rvciJ62bsfVOSNg4pH1sgOshkHD+RHoRyio=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(23010399003)(11063799006)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1cvLbqUnA7iO0zIReXzYtQlH8/LfPXDo8V8RW7QXyk0ti2bw0ZUuPxhWkq7X?=
 =?us-ascii?Q?kiG//ERcWurR25G4WVgXL3fhZyJTDtDtq4XF065pbtC+2QrSCw3c9e6ZJK+z?=
 =?us-ascii?Q?862lbDMSXnUjbQHQrH0ZiZVVk2Q+vDGF1mPvlLT8ku7e4kSF9+TAGDEeVluD?=
 =?us-ascii?Q?jhQChyoVQsogfwTgBOoM8lyi1jMgLpC/3EkIdyJ3D2dorp94/wcw414Y1CP6?=
 =?us-ascii?Q?XESUjkcVZaptA2VuwfXxxGWz7atZbV0pVmdYV/kA7coA5TTwoZ6Tx6b1lmN0?=
 =?us-ascii?Q?N/FbFk0JnU5aNY75PJFOHXzBwd2cnStzX7clWw6HMMaCJ850F9SawN0HyZg6?=
 =?us-ascii?Q?ul+/ItiAfg7EVXSrk2bS1MOfAWjtj+KcWYoungha/Rfwm06g09SYRmTokLO8?=
 =?us-ascii?Q?hvJ24PiFC7ch7KFhEXeKI/Kd5dP7Pb+wZ+Dgo+sFtAWf0Tsg9wPxX9eGw/HA?=
 =?us-ascii?Q?ic+ppXPLEnWLkUmFjIfLNHNA8nLyp/452FWlqsQEpdTQe+fg3PFS+aeRM8KQ?=
 =?us-ascii?Q?5fJSfRnh0+qQqDpC1y198Dr73032n29WLX8Yg+QyLLiOBQP/CkQCnT+B6zj7?=
 =?us-ascii?Q?ZHwgCpObCrRSwbexijZOZ1Rm+3dC87PBZGyxuM5a5s9qhtOUz+bwo/gUEftO?=
 =?us-ascii?Q?54VHM+4zsyHAXa9GAFW0DrdVoDJNCL9pv3GRoqQ3TrjURHvozd1aI/yJupff?=
 =?us-ascii?Q?PXA0NcrQQ3rzH6XQTZ09zPaTDAgKznMio7QLd1J1oLJ7SSDhQBzxFh+5L4rM?=
 =?us-ascii?Q?wTuaabGxfhQnCvFJd0C81imo2ysNPH1E2T7G5Xsxdyme/k6C7QJdp/moxF8V?=
 =?us-ascii?Q?ydeBKSVMnKFrm6XVWmi7OydVA3mpbc00OE+6q/VPhCwmOo/dzBcf0m4NlJ99?=
 =?us-ascii?Q?CtDpnGvdNLCk4mGCL1lL9lkUSQz1632JY+izLhyfnozRmYWh8l6Yk5ajPG3/?=
 =?us-ascii?Q?8uFWA9Ld2EqDWdeNzH4sgmKqibdbm6pyBYRMbmoqxRlE46Hky29fIwQLHF81?=
 =?us-ascii?Q?Sm/iEYqotJRhQqHAywxcyBenfDWXT1Wf45vavxyOB31Qus0ISpspHIT1TteE?=
 =?us-ascii?Q?rjZhpwa7ceF1rq4Kaam50YRdoOMdBdFex3y7Nncc/Aq1DqWOpjanY3jvxJew?=
 =?us-ascii?Q?DRDzi33n/gpXlxvr2bvjH7yQBCl/kzyMDzALoaBE2pg12fu2o4xxh/KhJ4Ud?=
 =?us-ascii?Q?zywi7pXpd7WrNQsw8kXjic9PHIojMSHCVgTgx9OWuT+fVpaKlWTxKGOWREn2?=
 =?us-ascii?Q?Z7OGvzzDtmsGSIUxva5oQ5mjjpBBCc9+wkQ79bAv4Wf+h0epreJtja5yWMbP?=
 =?us-ascii?Q?2Zq4OtXUe62RxktUrg9CAtvXewPN9YUYqovpi6WUEe42Pr2OOOYHbwf1qzsv?=
 =?us-ascii?Q?v4RxP6nnmVcFcKPWrMRm1toKmbv2ey5EVPzpGF/GjSTxjD9iDk2PGNucU9uz?=
 =?us-ascii?Q?bHHJnB/rZgWF8fWLXKWMaZUIL6Z7pnX5Zh9VLrhh+T/wJoh+se3hvKgxMJHA?=
 =?us-ascii?Q?+PTLFlQO1F7iagcZ0Ddpk/0jjgncz/hrxlk7XE3aBtK/WFYpBBKHEP2KuH9j?=
 =?us-ascii?Q?ChqgiP8ZKvR811mWnFx7YpnM4smQ7sR6YCYB+kPZI36ABOPvGI7FWYb4jC1Q?=
 =?us-ascii?Q?LXjyqmAAvI9ROFvWGWUmXpcKv97BCZckKZHcQ+ltgl1j/DHXv22xDeyyOzXy?=
 =?us-ascii?Q?9vZbxJlc6xIvLQxcjl8c6/t7918agTV9DpFOUP+U6B18ar8K5vOGu0MN3fCr?=
 =?us-ascii?Q?IzMeu8u7G/+QSNo+zl+eSZEnNXWgHK2Oc9Yl9gjMzWKWEtMzltoK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1127aee9-8fca-46fb-05d4-08dedbf5084d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 06:57:38.8236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0k9RlKkL3RcvtwdP7ZSuJ527UNnDK/olEmoepYa0YjEgBDc4cckdiiekrFC3NOdGr8tEWOED1StoPSreG7GjQDRCQyr7oebR2g9Hw2rfYH6odg/ImhJaFrPgRiTkTgXu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_235744_799221_C5F68361 
X-CRM114-Status: UNSURE (   9.55  )
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

From: Chancel Liu <chancel.liu@nxp.com>

Add port property referencing audio-graph-port.yaml to allow WM8524 to
be used with audio-graph-card and audio-graph-card2.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 Documentation/devicetree/bindings/sound/wlf,wm8524.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8524.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8524.yaml
index 4d951ece394e..dffc41d5f7de 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8524.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8524.yaml
@@ -24,6 +24,10 @@ properties:
     description:
       a GPIO spec for the MUTE pin.
 
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
   - wlf,mute-gpios
-- 
2.50.1


