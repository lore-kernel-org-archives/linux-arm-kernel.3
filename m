Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2747AC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 18:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wt5Rmy0uVOqRi7rmJd9t/jB7p3lVqpF9NnQVrBaYYw=; b=tnYdHVR8nf+iE5jF4dUxykzvzS
	mQxk4qz8wfoJ+UE8rkkQq/l3g6tDXa6xILthICkzqpRpXWKyjShb4jDC678ATQOTVSyNB5wk7zN9n
	9AqueRn/5piGFVAK370GnBE0lOkbaahzEjRMNIPeH2i3rTQTB21UfoUVkD02nOcfj6r5EpYW1ly0+
	w/s2X19ZOhKSFeQyTgQib5hjFEvBhNn1Z/KghFiNXr+fX2QmQXK4wL75Yh4J4eBJa4NIrcQat7Kku
	7N2gIQluDdZAoekW5Ve5LHQbYdrHSNAsJakJkhTM7yqc8++pxSmyK9WiTS24EsKb6Nug6D801hpF/
	D9CDnHWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQPq-00000003hLY-2IxX;
	Mon, 27 Jul 2026 18:51:06 +0000
Received: from mail-westeuropeazon11013060.outbound.protection.outlook.com ([52.101.72.60] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQPo-00000003hKu-02JM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 18:51:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWN2rFLzMgs93RSuO4bvV35qEG2iARf081H1z7wO9BDz6vKyt489PIfNMQrntGipzAP7+WykonvOvlveNCMmFwsfa4EGMh7yWPMsow18LXep2s36ch2/pmN8E2mPzYyOD5YmDcYDLyaX/gvxCt1kq1xEFTRcHpp0Yj1Er0FeYJHcbJKVcNBOVh05+xSK6mrIaF0Xyxv2sE1QSwVysxppWhrjrcECg5Czda2nFSGi3aMyQQTMtBjDFXxHaZltKnLI5iiB9MPoXVPxqe4FK8etq/QFeYNZ9Kd4ejedIw7xO5lLPTyEhZukvGl2T7tpHr5xF8tRiU0ugKpOqLdMS7Jx0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wt5Rmy0uVOqRi7rmJd9t/jB7p3lVqpF9NnQVrBaYYw=;
 b=NqvtULycxlBQQWwIMYOCuXGuTrXFODW1ibN0Uyk5HHLLzwkMJxgGRRhX/mrkVPgYNdj+9D0+QJX6mZqug6DhfvRmHVruijKDZU4ygSIgqlDMZsGC/AmAru7eyJHHGUQvtJR77SGtpnet3klgmuZ7f49odKkwzzenq2p6FvZdBOtCUxSWwsshzVUyIa+HKND6Bc9dliBkjw66+lPS1wU0M5f6vtJCMXAQ2d0MIukemWaqa0iwKV9TbXiilzBlnFEZRh81WXAUnnLAIBvUIn8zEFFaC+0Z24JLGnzoGBylObRgz9NuzoOM77a866HQdUknslj+Q3HnzD1nxtG5Peq7OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wt5Rmy0uVOqRi7rmJd9t/jB7p3lVqpF9NnQVrBaYYw=;
 b=lLicz0d+LHsHSRlo0wULR6eh4/SP2Qzx7Dcgjgzn/ByFaWm09MqBc8IB/gCQtQ1hW9hHEcrsKdTp4O+mVjdOT7Tsxflo+j1zewuyhxlf/w9+h0U6Ul9lheikaVgwsz8CzQ2WEeDEwgPZVUNXzZ4zTohA89N1gKtx32/ajrPKny1++a1M/3fL6EiapaWrELa0vRKHcTkFIab4Tw+fdDepW47RbXZOeIYwHKbZsTNhif9fGvZtbIVX002es4C3gJfCyHU/p28KrQ4FHF5LqPveBp0vJ6B1QCBZA1PCdfWDj2N4G3kiXmn7fRcEAVruoZd8hggp2JlCWLsSgbfP6eCQ5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB6979.eurprd04.prod.outlook.com (2603:10a6:208:18b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 18:50:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 18:50:59 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: imx95-var-dart-sonata: enable in-band status for SFP
Date: Mon, 27 Jul 2026 14:50:49 -0400
Message-ID: <178517824021.2617539.7703161586818075681.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724193004.51978-1-stefano.r@variscite.com>
References: <20260724193004.51978-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: b128c8fa-e14d-47c7-6965-08deec0fff7c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|23010399003|19092799006|1800799024|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: qoXqpbBXbW4qv/0HhpnDyB3yh+JS1+tR1PQIr7qE0AxNOm+GwGKojiEaCljkgBOzUVDaky7kFYqIgvd9Q32CL5QzsOjpY8H0/nGuMEVxN23qnG1okFZlbOqDqTcUQJrNG9tCJERO0rmZ6smWqRDWskBwA9jGgbwYKFhygAXOneGagJZ1+hovM7AKyhCjllVL+94cwPAsiqlAmK2bSp+xO4XWxyDGdpALCHOnW8i66VeiCNqe5hHYEOLkran+IhmXWZX6ECBdthgLIA2hos69abY0/Zywn6Q8u4RcsURn3v3ANAkMokwsmzGUyAz+nqD1+w35OWeaGldu3TvLdc7i0Oo9UQ4N/F0Gv/l0kZMsNroflcNvVgSZV8EJOmgdVpTbUwbRQu28PA1kPEM64WuPXMa1g7Wg/Kj7l3Aq3wg6t5sObtOMpb0wAqd4L8KinpFpQ6plnQU8NgYsQxCzlhUFFw7Qxaoshyi8fCIQIdimsaT0gyqOpiykRkFJ85ifMns9CHMBUjqvHJfCmM8K1vGZeSBlOcBz8jgtiMzOdkdH1YMvIKzKDsnBRKpEsmjPh+jRCndMtKF187rwufMTAC18vzTCIhuerYRxGXwdn4Hez2zKWSqEfsmQdU4HvVrP9tqRnXl6IuQ6kdJaxDwnxWYbZfnJUhrQSuSfHQyIxyCpM2c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(19092799006)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVZSZEgzYkxudUkwbFRrM2h0VkpxcTllc0wxTWNFS2ZrK0JPaGE2enN4R2tw?=
 =?utf-8?B?bW5CSVVmYlBxRHV5OEloSkx4M2QvcDdJU2hiMFBnSzFVN0Z4MElGeURHMWxI?=
 =?utf-8?B?OWZiZ0VDNXBhTlkrd1RQMDFNMDcyTzJLcHFxaHNLKzNlOHQvNEl5NUJvaE5x?=
 =?utf-8?B?QjllM0czTVdpVnptbWZ1RkhRd1liU0FtTkN3MEliV1BUTzRyUlZQa1BQVDY3?=
 =?utf-8?B?NnE0Nkg3QW9VUkhhak41YzhJeWxKZlBKeWVWdjNVejMySjFSYm1zVGVmVURQ?=
 =?utf-8?B?bStqY210T2JxbENFVVRBRW1jRDdOR2dXcFdCenZ6emR5NkphMGF3RFhnT3hI?=
 =?utf-8?B?aXNwOGN4SmFIN00wQzR2WnpKYVVTT3ByZWJQOG5sYmpKejB4UWRPVHFDY3VO?=
 =?utf-8?B?cXZTM2p6MEZjKzVBM0ZRZ2M4emtBN3pjNGlsOU5jbWFVektQZ1JEamxwMVk5?=
 =?utf-8?B?V0hlK3RKN1RCVS9CK3JoakF3WHdzRjFRM1hySkZiWXc5WnlJaExhQmZXM3hr?=
 =?utf-8?B?Vk9yeHV4UFpCcEJxcVZYVGlJbFlSWTBGQlBkOWcweDR5T0JsV2xIYXkzVFJh?=
 =?utf-8?B?bWNFL1R0OUpCWG9ReTNSVG1zR1AwZEJDc29jQVkxQzdHbTdKNk1uRTg0Q1N3?=
 =?utf-8?B?Z2p3Uzg5RVQ1dndJRGxSL0I0U1JWWHhoU3p2TjEwZEFzWGxpVVBFcFhsZjZG?=
 =?utf-8?B?VW5GdEd2RjRsZXRndldxY3FKN2ZMTDBzVEVMOEppV0xzQ2NDQ3U4dFlLVk5J?=
 =?utf-8?B?U2VVM3lTVlhKSHF2M0VXZGROWEtPSTZqc1VTdnNTWlZuc2Iwc1grWU9qemhL?=
 =?utf-8?B?and4ZjY2QjAzRFNVTEd4ampsSUVqaUNhR1V2RGxIZXJ2Y0t3WVVPQTdPa0hS?=
 =?utf-8?B?VEJZRFBSQXlRRW8wSkpZUHRKRWdGblVrU0l3cVZaQnRmNmYrSmwxZ3B0aVdm?=
 =?utf-8?B?TDZrMVlSTzFSdW1lUFE3N3VNVmhhU2lBRkdhMityalBHQVFNeXpXNS9sdjNl?=
 =?utf-8?B?WVY2RFA1MkdNSXc2ZzlDWjRwR29XWkQvVkdGZVVBejg2cUl3TEpuelVRdExW?=
 =?utf-8?B?V3FpZEJ1ZjVRemd3S1h2bE1PWHh4dXNUMDltUWR5ODhwUW1JczkzeVlYYlBq?=
 =?utf-8?B?Y2xDUmExUnNjLzcrM0R4RjlLUmJBSnF2cFd2Rk0wSjU3ZmpxNm85YTVkZHg1?=
 =?utf-8?B?U0g5TUJKVDFaOXdMTHg5Q2VtSVpwWXFyZWxDd0VvNnVLVFl5aUd5ZE9vdHhr?=
 =?utf-8?B?cnZiSkprYjZqWGo1c09LRlR0Sko0SWlJVHdJVXRtT1cxMm1yak14cnpNRHEr?=
 =?utf-8?B?bHQyMU5OTU1FOTZ1Vmozak5pRTZjMldwcGxzNnhwVHdMOU1kNGNyeDlVZDRi?=
 =?utf-8?B?WElUQUptZzMwNU5GZzltU0pCaGxDeHBJcTdjOGcyUEhFTllzZFpLYlBSMjhW?=
 =?utf-8?B?VVREaWVkdE9sRVJpRXZoRzhRR1M3MzFrMktwWm1uMjlRaWgxbzlweThRc0R0?=
 =?utf-8?B?VjkrK0NSQnlkempWQ21nNnp0M3poN3BvTVVyZWduTVpQQktpb21VUFFRUmdn?=
 =?utf-8?B?WGNNei9nMWJZd2VycENBZ0ZLVXdhYXE4MWplWlZUdThjZk5LUU0zWFNDc29u?=
 =?utf-8?B?eFFzK1JNUC9XbjVBeVlkaFhIS0tadnl5bm53ZTlZMTYrdGF4dHQ4ZHBpSHlI?=
 =?utf-8?B?K0E1YVBBd2lEVXVJUHJqelRRNjhNdUtyN2U3c0oxN3lDZFpxTDZUWjl5NHdR?=
 =?utf-8?B?QWR4R01WZ1RoWEExYjZOU1JDUEZjb0JwZDhZK3BkUDgxYjQzUDhlMDVEWGRK?=
 =?utf-8?B?Q0d3elJIU211SlpXdi9nUjRnWk9GRXpIUWdLS1V2SXMxUCtGWnRrYzhacWZV?=
 =?utf-8?B?bU5GNnpya0RVSGE3cDdWTFF5encvUkh3MFQrWW5VNDAzQ3hVUFpJWkI2U2JV?=
 =?utf-8?B?N1hkV3Nzci9BTUNHRi83ODQ5aDQ4ejlyY3dwdzBDRnpHL0k2eWllOEhIckJQ?=
 =?utf-8?B?alZzeW9wTG5XZzJNbGt6ZUlDc3J1ODd3UkFTZ0hiVXhJOEVQejRYNThrajZk?=
 =?utf-8?B?V1M5dEo0aXdYUFZHM0tuTEI3dy9VYXJINXIxY0NiaFBQOTZXZ0hySEhvdmRC?=
 =?utf-8?B?d29QYkEvOWJvSFdsMTNvTURVdTR4ak5wcUZodUVzc0d3V3BIYk5WbEw4aitO?=
 =?utf-8?B?dVZmWjF0a01WbDdRNGNScGUzWXZGOUxadFlSYWwrNEpsM0N2aW5OKzdTWTFs?=
 =?utf-8?B?RHpoaVFhbU5OcEVQR2FVUzNYMmJhTGF2VUVPMHlCNlVCck8zejhaOXBJMTZh?=
 =?utf-8?B?T3FyWEQwZFY1bFhtbzV4SXRxRjlmWUtxZ3dmRC9KejVtVExMMzBlay9SdmNS?=
 =?utf-8?Q?aYpinq26P5MIVzV7xj8z2wSY5LYlF4toTDjP7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b128c8fa-e14d-47c7-6965-08deec0fff7c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 18:50:59.0517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yx/Dt9hWllXo+2h1D7T4mhJyZAzVwzag9ikRDkF+XIL16gTy866RQ8mKPpAD8psihCzsi4ns35M8P1Qdr3E0GvHX4SuImn3XxxPhtYHR9Nm1DGQAmzj8gQGvds8Ebant
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6979
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_115104_056273_EA29E1BC 
X-CRM114-Status: UNSURE (   8.83  )
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

From: Frank Li <Frank.Li@nxp.com>


On Fri, 24 Jul 2026 21:30:04 +0200, Stefano Radaelli wrote:
> The 10GBASE-R port is connected to an SFP cage and requires in-band
> status handling for link state reporting.
> 
> Set managed to "in-band-status" so phylink can manage the SFP link
> through the PCS.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx95-var-dart-sonata: enable in-band status for SFP
      commit: 95870e5eb88c6efa252de89bd8dd360f1150b388

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

