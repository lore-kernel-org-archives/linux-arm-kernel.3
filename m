Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0849DCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 12:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+YfP1CniJwGInA2vQ6HDM3aMcUELcqgKMynfNA1KCUs=; b=FNW+SJGEKhZc1AE3Mu0zOt/cHg
	iQCVDGHE5C/0bM6eNmPtsZFrnrZQgTJqMO40Vxy87OUzKu6DKsVJOGQ+CIR0pevT4Ll1vONtA0bnh
	ahe/IEsPKurgGXzY189XtlnqKyj6DX2n+3yZmOngYBv4ozX+hEWhEtSO/vmIYwiCgVgpfCEKbjABb
	Rb8ir6dalnkTgOJ3/SNmuHl7vOAFo8jW7sQB1/hnKeMwqL547dzsYhJamKCWglO2euwlb5JaVuBoa
	hcSCUF5YBH+Lldbgz0M9Xz8gtuLGFr/nC/G8MqVPCPsj2Gd3dB1fmdJkD+zFl30FZiu+TRPU7BHqq
	dffRUpCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7v1c-0000000BJWk-0Oe2;
	Sun, 12 Oct 2025 12:18:08 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7v1G-0000000BIhj-3zu2;
	Sun, 12 Oct 2025 12:17:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=totIIHISeop8ukCco/CwRR5xNTkHvivcZWn/3zzLG9TmRnTonsq/WIO1C51J9O309NNcitfC0pkkOCxnrvo1WsHbFPXfZZsshTQeR7HXfmKezOrOeJUt+OulRRmYDwrXttBrS7OfLVwSJmzjFYR2K6O3DF0mPPUJHsmYAJXHGthXAXnIct5DZyIB+fQLgJKmK1scESNKQPlkFWGjuG4HHJpii6Czhpq2PldkXAKvAn1U6niJCZ3BMDh/RQhixut27ggi81fU7CZWE/6T1u9MSSbpt7NzRtOvbHcYOPIr8PlPOsTFT2CoDnZGs8j9AsLDcOFTioVgmLsyfJKLO4K2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YfP1CniJwGInA2vQ6HDM3aMcUELcqgKMynfNA1KCUs=;
 b=C8C4nqwWaMkSAOA8Uqed8kKekUHDl2w4K14202qyTZ2BAGV+dNd0qmWiY+OReLnLmQFUZektmpQKUznaPBDXsoNy35b/oeiYSo4Yc/X5JE05BSLcNxjiC1OqVSOy49C2YWOEU11imuCPukQpCKcsmD8G+Eyf1ydghezUmTSbe7b7Soht9RUGXQbmis9euGv0VFn0k+C/2TYQPrlusC8uMOrn0AZfcTQZ9hTHdyPEPuS/X0e0O+GemYnBOjuvjpOJHrys6DkQ/2hZeiVdZa4AN6g3ENIRKuntRD3d8WEvdoWk0RJQZs5rcCWECxerYFK6NuHU/JKA1gaztwck3uL36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YfP1CniJwGInA2vQ6HDM3aMcUELcqgKMynfNA1KCUs=;
 b=wkoz2gQwljdgGhyvqOGewl1tn+Az9B0HdktWBWt8c6EVAAxf9e/NqjgOOTyIsKCBE3LeDBszH9f4x6tylj3s93jtVBETGORv0K8BEnHZJp2lzZd9wnhZn81kY0Dn0shUWlRVnG/oK8B9RCGtdDeRqgTFB3IJZYMGquzQcI7AZoUtqXYXIsvL78gTgsWqoZhJIz4IdFAD3kT5e9Z971qJRub9RB0OpUSMXFLFPvO0JVxldcnkYQ64yNbdN9vnsjf0i86vI4Z2uxZ6nPtocubYM7tOSXESMZGDcuUqoJX2gKFT6VmR+cG3u2bESTvW/wepTXekL/4jMc+tzBbhx2vn/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DB4PR08MB8056.eurprd08.prod.outlook.com (2603:10a6:10:387::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Sun, 12 Oct
 2025 12:17:39 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 12:17:39 +0000
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
Subject: [PATCH v10 13/16] spi: airoha: buffer must be 0xff-ed before writing
Date: Sun, 12 Oct 2025 15:17:04 +0300
Message-ID: <20251012121707.2296160-14-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0424.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::17) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DB4PR08MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: f326f54a-776e-4829-5939-08de09895611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cQh1lfRA4CZ+xwS4gbq6ROj6dv3QxJyjnV2UQEhDUjhuTgR8ZplwpdREro2/?=
 =?us-ascii?Q?jLV/pJJl20XOJzdSnarse5LxVew73ZoiqKvMRSxV+sHFtE1a6nMOXoPHdCO8?=
 =?us-ascii?Q?yN4omLKRPKwP9KOIu9iVMgyywJzponRWWIKwjE91mYBds9wZlM1AEO/KApBO?=
 =?us-ascii?Q?oidgDjFaWBUvA++Ax/RTTWawQFBAUSyOZ42IBauza0tpJ72cYk6cArcEY56p?=
 =?us-ascii?Q?Scr5UFLxib+3onHugeeXYmbxJafLGE30yF0Tg6fIY8AxmQyLrk5vl5oTQbti?=
 =?us-ascii?Q?oPu8+YnFbJSRM4rvAfX45xR/fzLwiKPr3e2r/HsO5Yh/upC5FUmo4+FxjrD1?=
 =?us-ascii?Q?LMpbLdKUiENFIoOw2EZnlKgFab768/+NX7BQHEVSbv+V6Dso68LimklRTVQ3?=
 =?us-ascii?Q?H4s7amHkXsuJGqVHFiRaagBDwj+VGwqAzyUJNzcS68g5mdqb0JCEPBbosyIZ?=
 =?us-ascii?Q?KrDFbWIEf3ScMMccXReclxt4IZCyTzSaUuaadiY27dFR6hl9PLecXVa8gezr?=
 =?us-ascii?Q?+Rq2Ymt/+t/BGjDffAYTia7s6Y33FW6uXdYMlAjZxA2/IskpQe7pPH2MV/ZI?=
 =?us-ascii?Q?A469no/6SKUcyn17K28rhf7aeaMcXvjr+9zWY41A64Dnw+Zq+c9W+bf9KyZ2?=
 =?us-ascii?Q?Ev31zoy25x9lwudTfMXKCWIl7FqRv6oEiSHqj0euLsSyPpAOj5LsvsYczcBc?=
 =?us-ascii?Q?bS/Jtiy6dCf+iUX588/QZQrdPDIOWrfipX+aSXACNXRdt+3MV6EYZrlMwXmO?=
 =?us-ascii?Q?sHGCum1KRXMAV92628MNy6Ei3welWjjteoVylZcOQk/JQUih60EenWtIBOTh?=
 =?us-ascii?Q?hqcghyRxce3kgj1BP+8yI5RLoOGgE5WGp7VPwLWMfl8reuQqsy6ZhPBvbDtV?=
 =?us-ascii?Q?R2aGHrUUdEwJRlVv/zm2leQq0u9dNG3Irg07j+n2ghxLvYeRpw1qhehqEFo1?=
 =?us-ascii?Q?f0UfKPt2Wo+taE2+e/xYCwNDCV+fBSV69JQomPY0FJpiUqn1IOlfSRJnvEgV?=
 =?us-ascii?Q?sh7UT28IV6TRmYDk1R6yda0GRDY50PgBWvfIq6L7SZlV5Sq0Y0OwZDv1CQ5j?=
 =?us-ascii?Q?QUs67uFUgutknlDvsokIoCgXZSOHxodZV2JaEiTYpRjiFWKoLfirw13csKEB?=
 =?us-ascii?Q?hxQYnwDG9tAptuSX0HhWf4RKdiuzfvlj158KCe+ww+F0rbAVjh7siQFCWLAj?=
 =?us-ascii?Q?WGJRgm+B+kx7otYonGgTvUrLPHPrWixHz2dBxYpl2QRKDSXg26AlWLN6imO7?=
 =?us-ascii?Q?zPdco+KydcpPyUW3nxQfTI3orNhmzj/e/Pq+8Z8T/1Cm4TaKbXiFWNOh80il?=
 =?us-ascii?Q?IWDhS6N6MIeee+BkHWe4lzcKYC3TKjW/fpRS17zdPzHuBhUcUABeBirl8tbm?=
 =?us-ascii?Q?fm4mcpAnq+cFteSbyt17pyvRMIZ5R9hQ3CmU+R8R/vFlIGeK13tuT9u407MV?=
 =?us-ascii?Q?luOplTHU6dZi5fBjtzigbQ/CLWHgae21Od3siKpkRXiUytU1ZWQCRuAPIoZ/?=
 =?us-ascii?Q?npZ2nx4CmOzSI1hwhsW5unD4D3X7tzlJ2/RPnVp5+s9RuZhpeaRiykwi2g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LwcsuY3SOP9ag5LECn+awjWMZUYg31PZAzkJ8OFANx0IgJHg0zZWlNIdbquN?=
 =?us-ascii?Q?oGveNp8gAEIm0yEKgQvE4PJbkBOBHQRtn0R0XKu6b3tr2ezyuvLVDbDgxhuY?=
 =?us-ascii?Q?h/9pUvB58Gm9IKayvnGTuYvs9fQwaXEQaNxgFLFo3Jt+zOtGVJPTjZA87kuC?=
 =?us-ascii?Q?0skapPngzLaMGt/ohH+r6faeXh2zRgzcxjGmowfciVngebf8EIKouZ+ExP9e?=
 =?us-ascii?Q?rOiuwUffdOw/VYNbFuOD2qwmTfCFgtCeyqBNwiWvOiYGmmjUnc/5Goi1Kb79?=
 =?us-ascii?Q?7S5CSlNu+k8TJztcdSC3cuM6NOPd9bd4r9tR/dbe73AScDvOLj9lo9ebyFpl?=
 =?us-ascii?Q?UGP/8jkGq9Chq/5RfjF2hcMLXaaofLmTKa01L3I6VTEIQqKAPJAf/rAab3AH?=
 =?us-ascii?Q?ZMLmdhcb4TJ/z1V3ydFGkKX+V3kn7b/4/6yrevj5ZJykKWrAZdfMenk8D2Hp?=
 =?us-ascii?Q?4Nc4slabKinC34u5KO5U3QLIUS4grP77PDGrZ9YZXARg6HtA9e9byULSc318?=
 =?us-ascii?Q?eFw6NA+7gOZBeKH2m7eF6UpoZZ5r876kBpb+hf+cbUDcMS/qv+DeKQCyx14P?=
 =?us-ascii?Q?L19ARJjENmoVD0nuhhQ8+V1vayXvsTzQru5Sf0xcksY4dyIel+9JriLb6r40?=
 =?us-ascii?Q?vWc0MpwLb/xEXEUkqFYXzqJyfI+kAKQWpGh0VOUVqqz6CgPckd1+7vD7Agqz?=
 =?us-ascii?Q?QhHX3PzxGMSpmw98U/wKzZ7J/7JQ1/OYKpj03vHfNGeYSjnl+YDauQF0XogR?=
 =?us-ascii?Q?s2nQ4rwho+93opK4/3KVlsNAJTVJP43hinOAdsTWe4thxAlDSHvA9RHGmUXd?=
 =?us-ascii?Q?7hEoMIypmDMe5pNExL6nAzXs95s2Tn3KBVZ9b35/aD2ikOdH1wXApSLo9Aht?=
 =?us-ascii?Q?/3r95mcQ9H9NFY6mzsY+Coqxm9a3m/FP2Rc4/WP5L+Qtkk9OPTGS6z6sDRg3?=
 =?us-ascii?Q?D/ZaOG7yHw3ebwQOdOICTr26Q7xvcMmKAYBr1P+rKQlXwhAi7KkrmXFv1EJx?=
 =?us-ascii?Q?031VqMtIzUK3fBMSFvBnV+IKx1eVlZntqvmbyWWYL6Jm5A7G/8q2pXTaZKx0?=
 =?us-ascii?Q?K4HfnIDER/WKkHJmfQhdHz/Jt/xLDGERERXbeHoxiIEEEJXyjf/jGh1QCNbR?=
 =?us-ascii?Q?rIfU+2oxf9fRdiMLJ2emx4qv0rISJ2v1+Tjz1nNyj5kQwy34vU/629nFUw9K?=
 =?us-ascii?Q?ZUTXT3Yj+NP0HSz6lhGBYLe0du7jILdRsPBfW38RBKlK2mvWbU5sl4ycjPoz?=
 =?us-ascii?Q?qTIsvsOxJt9hfOdEnPcZWh8UfIxWUyXVUVaXpC1sEZcXdJIIcvyubv6JjeGW?=
 =?us-ascii?Q?tHL9ma3HYvKNRRmSk4gKx50yQ/89jb9HvZM0ZixoZycEZXO5SnDAeo1znxmP?=
 =?us-ascii?Q?HaYkJBtVI1/T7fwrZLvacFfsLvc1qjiJSliz04aqhB+A7W2I9X/7zUpCTITc?=
 =?us-ascii?Q?gaGlTg0UXbC7JIknUFUO2cLtchF24qrlWavLHE4Cf0Pb2qPWkkbUd8QEdmng?=
 =?us-ascii?Q?ibgagc0Gvo7ksVvFTLOCAMzqZJt+e4ToIctg6ckFyLaORs0B+jUDELhr03Qa?=
 =?us-ascii?Q?gjWuSOzZwby7fygsVU9pgfTRl5UrPEQ5mpRD4eVHzsRy9KD+kleLrc+5N2o8?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: f326f54a-776e-4829-5939-08de09895611
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 12:17:39.4195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CfXlIl0nn9fKE778uj4can5CavBqcA6Nc5sauXv59XT1U0evxssoxm8SDBo3id56vtSugJgBuefCtebXGAVmVmUKYL7k7wglDXjpiHQHsQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_051747_014458_5D16A0F7 
X-CRM114-Status: UNSURE (   9.62  )
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

During writing, the entire flash page (including OOB) will be updated
with the values from the temporary buffer, so we need to fill the
untouched areas of the buffer with 0xff value to prevent accidental
data overwriting.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-airoha-snfi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 437ab6745b1a..8408aee9c06e 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -776,7 +776,11 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 		return -EOPNOTSUPP;
 	}
 
+	if (offs > 0)
+		memset(txrx_buf, 0xff, offs);
 	memcpy(txrx_buf + offs, buf, len);
+	if (bytes > offs + len)
+		memset(txrx_buf + offs + len, 0xff, bytes - offs - len);
 
 	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_DMA);
 	if (err < 0)
-- 
2.51.0


