Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D78D1036D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 23:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rjN4Trg6+qmfM5ewD8fj2U6EqHGuGBC7gZ3T+Fm7YH0=; b=nYS+eePksM0YOaryCQyWCMO5Bs
	TPBHNGxGIzgVQhLAcoEJWm7ummykCacCrV5toFeh37a1ni8NesEdeRGHCB2xY//GHxJOQkt40Npp+
	WlAcgizuFbzg5ifcOW4rOpDtaV/xZa9oP7z2YbpZrGyWXcEMIUFBv5esSJKQ9tuqUoMqNgx1fjFj6
	CvwKIQGG04dr3ARaIjYU2icG8Qp8zNSWC1S06+l25xwmWkuFzeFyHMCPfgJ5z1Kn2N4fNYDRCvK31
	2KeNk32MzPt3qvPgb5Pl1r7gIVGziMNp0c5Egu+rugEXAVh8YSH5u1p1Ttm37a+aR6qZ56lbzMhTQ
	U8io6zdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO2eh-0000000E4V2-1Xvu;
	Tue, 25 Nov 2025 23:41:07 +0000
Received: from mail-norwayeastazon11023132.outbound.protection.outlook.com ([40.107.159.132] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO2eb-0000000E4UK-48Uy;
	Tue, 25 Nov 2025 23:41:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6GsfnEg6kDD+AXAgcuaN9rKZzJNygA+3iC876xz7IR1NSJE1PI3kZDsMVJLDgBDd4bOSbw5kpqslahe7XZW6CWfsl7uGGoF9i0D50GmRerKHXbTHSvBGT6EMWG+5M8jKDbYHhczvcMasq8CB/9nbwcAA8j8576coVohIIW5izGxPzAJV9OGnRHIyzi/nuHcFNQk5ut6xdgrh69S3qGV6kJeSCNGraJtZb6ixW1onrQqDq7vYpZgLYJEs1ew5vRZl69HThCrjh7xNcGPfYnoQngazDkIkFFqRF8PHRTMxXnO2NX2jcyzcDaXihJYuLsiccOUXV7Q8Whey+gdhKxuWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjN4Trg6+qmfM5ewD8fj2U6EqHGuGBC7gZ3T+Fm7YH0=;
 b=O9vTU+3qYgMJ2/2hkO1JQg80gTA+9PEEQFj+CHtOo3Z8WkRpMJepoWJDZrhlKCh2weYHmfZM4AqURymw7M7rThBvzPuoedBK4gcxbGtyCrbyPFNz3ygnlB/VFPA38nHLNcj1+MR6CsD6rwIUJhqd57HwlfYr0bWcAE/T+uRdLVMglRplZlk1tyR2VIwB/cFgrDd1Z/j+Q2tL91zJBEwIqg9wd1a4d13z+jqIGYaDno43wEYX3YkFQkLvZnGF6rxxYkdI05UwuFgvRuy/sjA07Jcev+914sCrO7bRrt8mUePcwrUAee4dUoVdHqz04sSyHWl2V/EwJtR2BEQ29+4Dqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjN4Trg6+qmfM5ewD8fj2U6EqHGuGBC7gZ3T+Fm7YH0=;
 b=kGcckujKCGnGyVLdzhGAFJ1LFlInFSiT7Hfjpdr1kP/sZZAIoRGN/NmGU0NA0Y/CzvzMBZyL7j7psApogQPx8Yr1S0/qpCDrHMkVA/qViTv3TCB0RwLSZPGNID18zRutjC9sHu/11nJTe54K3NEI+WYv470YVDjLOcHeLN8XyBR8Jyo2IIJZmAZyCmKWQh5NetTze8vwbj1wz5b1hjB1uP8zfBqT2ZyKmuRstRYum6y6G1oVrdbkemK5Zhp11CD+5znLzNSpEOYCaOFuDnyIVLp2krtUS37zWFs/GxQ37h2nAirL0piKU8qKDMaVlNa4cpErLPzQqhoK9VksVyY2BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PA4PR08MB6063.eurprd08.prod.outlook.com (2603:10a6:102:ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Tue, 25 Nov
 2025 23:40:56 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 23:40:55 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v6 0/3] spi: airoha: add support of en7523 SoC (for 6.19)
Date: Wed, 26 Nov 2025 02:40:44 +0300
Message-ID: <20251125234047.1101985-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::20) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PA4PR08MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c395bf9-602a-44b2-4cb4-08de2c7c13a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d/SFHm1FcK10H8K7YP+FtR8hj/3TlNDXey1J5BX7ODYZ7ze09PXI0Q0+Lxu5?=
 =?us-ascii?Q?UZeooQ6fxj1LN+W1q7zeux4b3YnFj0oB/L3TJ5zopeBCYQuHAckItnQW9N9C?=
 =?us-ascii?Q?8cgpe+YUl35/M52+uNC/ogLdJOvvwyXfor2911JHiXFysv22/HAlJ0pzDmXn?=
 =?us-ascii?Q?vn5OY0Q739FrrFYujX/XP9vErJ4znUZ3sQCAPHDLe9CRqbrM4Cx3iJjbFliN?=
 =?us-ascii?Q?1xKRVxtX/6ROl+3UIqW+yRDeH8T33Ezr5ZsEywnM8I+SkGK+v7WTOdSPb9l2?=
 =?us-ascii?Q?q1EehAdnxrfRnTm5/0I9233rIlqwGQpN7BSfgPS4lhgtiLgHQq6yiZFFPF27?=
 =?us-ascii?Q?h2cHWht5TfGRL8syCqCWGx9rirBiWfT3pndatjxvWT5pqf9U/ZSat36YBF6D?=
 =?us-ascii?Q?/RI4jHfchdVb5XP+f9Mrjfxv1wm+oKE+dPtY0egqmICk+Br9JQHczvg/3PP9?=
 =?us-ascii?Q?nNGsfgq04QRQF0uv0CjQxiWXYTiPeZwiJ9hjvHAiZjoqzV+qc8kcKqqOnBfx?=
 =?us-ascii?Q?YhgmSVBXzFi6/zioe+cXa9tPPSc1BMHeTrlSekiW6xE9sKYDSEhzoIMWYQL2?=
 =?us-ascii?Q?3c18AR7pkTAbtUwgzEEx8cFr5ixmnIHwNSL4ZFOh5c0rgQ5B5KvuGuLi5joJ?=
 =?us-ascii?Q?UpxJzmnVz8dLsNG99oATQMn7oDVPpnHUE65kfrDHsXNZtYTXr6bcq+1jISLO?=
 =?us-ascii?Q?dRTY31RxiDG/fJi1BYRWmokFUpLFvxYX3CD58Dkfs6Bo5nmQyOGVSWMYgb4E?=
 =?us-ascii?Q?mDzyi9gcEufTYwNOdKmfN1r0/QXOtdXLI8FzelvXDOG8ZBosmj9wLCIIMfRM?=
 =?us-ascii?Q?pLcmLj3Q2HDykWaKfpDSRmewOWYuQReDG8g/LlztJZYLx9SPkcvn8Xbdh0SO?=
 =?us-ascii?Q?4mBJqcoFuI26SVoqh7WhMWphERhPH8BKPpKdAUUoLtfE8ENhuwyrKuyzSAzZ?=
 =?us-ascii?Q?8VAhCIgenZV3I4+16C1F5cmI0IhmaPemr6L+cybDxedXw9Y50kgjgA50uew/?=
 =?us-ascii?Q?La1b1Ii4GOMkxNPSXh9Ehb/JHbQxfzT/csSnEJySyzLl2tNdcMitZnouiQYk?=
 =?us-ascii?Q?c75ck6B2LYzl1p1+ISfumQ01D+73NqQARjdoHoGV/eXb5Hm/5RJHKG9dLKWu?=
 =?us-ascii?Q?VQQZ4PFFOgAzSgo5UIvVYDd5Zp1EAFkmSPsdt2OfqhtJyFfainHXK2GbA754?=
 =?us-ascii?Q?XTmW4pHICpXwrT40HE0m24PL2StnzVaGRmryF/+7/RxLDkBFFeAJH5wGvBV0?=
 =?us-ascii?Q?Q6Wd4A7RP8+Uc47P2hQAA5APFJnJ3N/Y3QwxmuEeyA8wZaCZZfSCUkyo0s4e?=
 =?us-ascii?Q?hLGrA/2h2mxGOMt2paLC18J8iWlnutRmOtu/1vBqoyDLZM3ligc0bWIv5Gjp?=
 =?us-ascii?Q?YyYWuJ/XV1aP0KelKv6WtUrY4xX31VcUWBFF+Nx8r4+irduRNCJUrZa0yFzg?=
 =?us-ascii?Q?E8g48x87Qr9iniE9Bak2MJVmYb0JaalAD80ArTs3Ad/j6S0Bx7r3dD/QDDic?=
 =?us-ascii?Q?X3+lQEYHJaXkQjLNYoVu1BJkbYswbh1hBr0CBviQaGiZHD9U/lEKiTIeHQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3E3Gdgj8MeEPFh/3udYbfoUEAkZHFE6hbQOcPLjcdC0nqW+/GX65vLv4Jt7K?=
 =?us-ascii?Q?YA9H720h2QjbVvywmc6tE/Ry+GsraGt1fwrhzeOqC7F7FFL/msCDutyor60N?=
 =?us-ascii?Q?AgJcbvPvdF0EH0Ly3wT5ehynBfR14obdcoVbSEeY50dCnJHwTOqSOlg36t6K?=
 =?us-ascii?Q?yc9cK997UXG7DL04dIwAUg0XaJUasK2VceUvr8p1Tx8hzx9lGCaSSfc5DZUa?=
 =?us-ascii?Q?+ueOO5ei/62omSZ0wpC/5Es6AqcrixOvzDnHpI53ESU9Scs2CTQqWSNLbuNr?=
 =?us-ascii?Q?CKnBuYu8EyaX622XggeDDHR17CpOENEee3OZ2nQ7OFdyqx+FmpCeg0gAolca?=
 =?us-ascii?Q?19toOUB/f7Fb4TmyinNzqihv8YOd6wj7LDSqWq0jA+fN3pyXI5VxRqARafrW?=
 =?us-ascii?Q?l6w/qxljq4/xb4FJrjKOziuDpM2ddTg6Wh229k1AeZn5VX+zzhKlHfWhXDH8?=
 =?us-ascii?Q?FCjqRkGDJVDn3sDVw1MTm5IKR6T25jxtnqIp9Uwl0lz2fcnBAaSP+cpbHJ45?=
 =?us-ascii?Q?rS/Vud+cOOZ4t2b3W5805bJqYPkn+pONNmBTCdduUbKaLonjvkwcLpp7Vl2w?=
 =?us-ascii?Q?9lWm71m2GsRC9TdKs+3DkcpP1UkTRIkfYDG3kGOIeOYpx9lbGUVFFY1OMLXj?=
 =?us-ascii?Q?KLR2KQhTFyfN3aVHSNoYxzxFv0dmzxE4kXCdcfj+qClGyRPABRKejB0CeNMS?=
 =?us-ascii?Q?jWgvUuJYlmQgPydYNFk35/m5pDxYbrWfvhomDFz5tBDkFAe2tswFzmt8fTuI?=
 =?us-ascii?Q?9sFIfgiWJqkujNsjIWutcNJU4sdxyt46/lfZLo8TABz7iiTSZJqsB52BFpyk?=
 =?us-ascii?Q?sZUVMU4YTCd+n++q+3OwfW8klWR92pvYkG1rh/7aPmVXCio0TcaVF4YGhJPo?=
 =?us-ascii?Q?CPcrJDfFP/xLeBdYc/1ZWOs6fz989erVB05OloyU5YhFDvOPZIbRLGyb+ZBI?=
 =?us-ascii?Q?SJKObIZnOSzPtct0/O0dd/Pi1FVYiy87Aqc+ySfbClm/uWBoeuPbduudjh9X?=
 =?us-ascii?Q?SdnL3CdBrgVtItBCya3G3Ss52BS3NHcXcL3N5G2Q2xcH87xK0MtZsNbeTUq+?=
 =?us-ascii?Q?JspsDWxA4DW5i12LaMmimIAo1ok1VCMAAs5exrckFWwTFXQTTtgkNoxkepdg?=
 =?us-ascii?Q?wLsG4thuWNPS1DweR8M9+tRfhTqLCAnZ6vrydqKqfiX29Ry8RjL224iJ+1B/?=
 =?us-ascii?Q?c6JhTqs/JllKSr0uDY416y0qHN2hY3RgCh/yagYl19NP8SZWM7WBmIMEEDlj?=
 =?us-ascii?Q?Ql1dcVGX5SD9gjQ0LoDI6u6RxdCqQ6rV+xWY7otQxiCQHOYy0CcdERXjrPuT?=
 =?us-ascii?Q?20SXN9Jft2Da+kAIUWsaaHN04Ark808mS8lzpW9xE4NpyH9Ak0/4gNVPS8yW?=
 =?us-ascii?Q?fytMizC2zmpXvB192Jo1LCY5MfG7C3sE6G1gozmgrLGWdPLV82vtUHm/LONS?=
 =?us-ascii?Q?N7YmmCgetwwNZPNHLp2S4dGkaDDRuCfyVouGHvZtiMj2hSuvkf5LyXrfgGcW?=
 =?us-ascii?Q?LvvtXqDoE8tJO0Lf0VYhTz34FcvyzpzR2Q/y3JaCjY0DzMZ1JBbr+Fz75Q5S?=
 =?us-ascii?Q?7XP1vC/cZq5eYs+RJ1xou+dTL4ajFGL8ZDSdQjE56pFo+zYmFPsgsjnRnZ5Q?=
 =?us-ascii?Q?SJqrk9NfUAD2S1uRhjMzauE=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c395bf9-602a-44b2-4cb4-08de2c7c13a8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 23:40:55.5501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/zECNSr3d45kxMgDOgLS3H3fO5Bgmi2kZBfOupIjH7WWD70kDEjifUkQWM5azf7oO7BB0k+h8ekWje3vuVzuP8KVSQdAqtYtCyFB7yo8rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_154102_033562_295E939E 
X-CRM114-Status: GOOD (  12.74  )
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

Airoha EN7523 snfi controller almost identical to AN7581 one, so the same
driver can be used. The only known difference appears in the very specific
boot conditions, when attached serial console force EN7523 SoC boots
in undocumented (reserved) mode. In this mode dma reading of the flash
works incorrectly.

This patch series:
 * add support of EN7523 SoC
 * add spinand node to en7523 dts (so spinand flash finally becomes usable)
 * updates dt-bindings to mark driver as compatible with en7523
 * disable dma usage to prevent possible data damage if booting in
   reserved mode was detected.

This patch series was a part of a bigger series:

  https://lore.kernel.org/lkml/20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu/

All patches of the bigger series (except these patches) was already accepted
to linux-next.

Changes v2:
 * small improvement proposed by Lorenzo Bianconi

Changes v3:
 * split multi-line print on a series of single line prints as suggested by
   Mark Brown

Changes v4:
 * improve description of Airoha en7523 SoC specific issue that may
   lead to flash data damaging.
 * add fixes tag

Changes v5:
 * replace 'boot pin' with 'bootstrap pin'
 * do not use caps in some cases
 * always set dma mask (even if dma will not be used et all)

Changes v6:
 * Improve the message displayed in the case of UART_TXD was short to GND.
   Now it should be displayed better in the case an SMP machine do parallel
   printing.
 * Add note that reboot will not fix an UART_TXD issue. Power cycle must be
   done to boot normally.

Mikhail Kshevetskiy (3):
  spi: airoha-snfi: en7523: workaround flash damaging if UART_TXD was
    short to GND
  dt-bindings: spi: airoha: add compatible for EN7523
  arm: dts: airoha: en7523: add SNAND node

 .../bindings/spi/airoha,en7581-snand.yaml     |  7 +++++-
 arch/arm/boot/dts/airoha/en7523.dtsi          | 20 +++++++++++++++
 drivers/spi/spi-airoha-snfi.c                 | 25 ++++++++++++++++++-
 3 files changed, 50 insertions(+), 2 deletions(-)

-- 
2.51.0


