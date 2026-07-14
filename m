Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D30C44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 02:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hwy8TmhS2W3rQFf7Woi0Q29KBeUArQbasGbepDlbTHY=; b=mgqTC5UyaUGEwgPJDxBMfTuoc9
	P/Yb0rC4YWTmkawXuSmSd8WLThFwT7c+7mpg4LW1a1az3Bd1qveSXO4U65gLmPEzyIzvy1yayAom+
	b7yYosxzVVEeAyJttRFlhFYgI/T8LUtS7AgyV2zx7jKHMAW2w0viLKl4d0qLA/F2tVY2n8N6uvyiX
	/uR1ywN25k+VSqwyDhOrCdRhAV/75LnNOEJfvxCPn1EI7yLAFhWu1I0nXLyHPQEUa8EkwqzG2mPfy
	Rm0SWIrvQLykV5NcYYB9xOKhBp2RI39O047z/l8Jdrey5BWDAOcnb6LIRO5eohdcDSEVDVJiyFxxM
	MJB7VCLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSe9-0000000Aia4-2CsQ;
	Tue, 14 Jul 2026 02:13:21 +0000
Received: from mail-northcentralusazon11013029.outbound.protection.outlook.com ([40.107.201.29] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSe2-0000000AiWR-1DdK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 02:13:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFFAk2ibOiSiPaqOe656i305QfeaJpewllmKR0cInax1IA6rG96EaLhi7k9NG0PYIxZkdQ4KerB/oVbAun/k5xYXNrt6C4SaQa0GszCKbQQuO854j6lB3386ikHrtlStjYigw2qAQ4GHGiuPI3MRvo92sy9ebqeeNcKxbyMYkQyZ4BG5olVKC0JCQd96SWiYLkPk33HlwaI/162IUIOz2OZqbR//73LFV/VQeW1Ei2ip/h7giWnObZtH4ktF/OVSJncNDxH6OFZ20ZlKDV8KL0TvhonDXt5BlR/K4s4T516PfmLFafs7TM3ClXQoweU0Sp9f95GmFp0nuMyee9+Uaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hwy8TmhS2W3rQFf7Woi0Q29KBeUArQbasGbepDlbTHY=;
 b=qL9NC5Soy/HNU9I4khuiKZRJCNcXYKY8xTlICjumoBKxo5au4RD54GjlbepLyW02z49/dAi5Y9UuVF9e2AG7V0d8pLrLgU7NqsuNx7tCoQGE6fY47VVFjJFT7no0/3SmRlFZnM+KAkRL8fNV5RuNW2PmUR/ZzX/KQuBkQXNNT0CoCIy9CfE2xqggN8w3OsMWMGPdXYCe4AiOsDb0kC97L+F/bDIXuYz/s9PiHN47y8iT1hhjAZ9IU/mKqNyJATp84upIZBfNPe1Pxxp5N6SJP20PEH/RS+seZtNCHXwoVnIKxdGlqLmAOR67G3NozFJtcBQqbEUPjyMXDx2aP6r9pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hwy8TmhS2W3rQFf7Woi0Q29KBeUArQbasGbepDlbTHY=;
 b=hG5wuLZMAsK7VDNl35gqqFYVxIcmBIkkWJLRSmuIr9Dtd92PKKngN7I6lJhlYbbFHkYh+BfC6sV+vhObyqPiN1Y78HY6+y+NbkSQlhq97AYFwnTQn/QULNHmOsmu1xVnRjTMVC+8+En0SetGOR2kEe0gLMQCAYMCc8KWZP0WphsYz9IKi0yYsWUwxvKQ+SAT0HMt6sQ+yzWC78J9f/FQuRoFyGeo2kUvIDYDI/NTxEVnnnSe9IUQE8HyVknfPmIebFdeWTyExxK/8oSXZzuO9tDjm3fZec2rTcirXLSyhaYztu6BlTXVd0svYsuHAP8ItkG0o6IQqSFSNWGUaOsHtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by BLAPR03MB5410.namprd03.prod.outlook.com (2603:10b6:208:29c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 02:13:05 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 02:13:05 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org,
	maxime.chevallier@bootlin.com
Cc: rmk+kernel@armlinux.org.uk,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: arm: altera: Add Agilex5 SoCDK TSN Config2 board
Date: Mon, 13 Jul 2026 19:13:00 -0700
Message-ID: <20260714021303.30042-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260714021303.30042-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260714021303.30042-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0214.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::9) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|BLAPR03MB5410:EE_
X-MS-Office365-Filtering-Correlation-Id: a175f419-4fe1-4401-0027-08dee14d70ce
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|11063799006|56012099006|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: aJEZg6lt+nOeinsM7mQuEEaB2PwIvnSuf7fBLVa/ehj7eKAMPYjoh0mDwf5rlPFOQ3pkwxMLH4d1a0DMupr27ODhX3LsnJnixXh2D/ZQzId8C1xCOxkpswDVPYlW2FrSni0cIFnYwLs6qLD1ltDRqHqJh60ibamcDiPGDToMtY1j9gTgO6RYVVkjnp8asg8IADlXy8cnfP5z16mQ2YCPUF2qTOx1nk0RSNoP209jAT6odaHA5LehX1TF33j460EHEujZb2c7/sxTc69CDcQpagG3ocl4bf0SfjWXdJlzk9KJh+opK4DQLhNTgqFoPvbQ8IVOThj+oTCXHtRmM/zJxcE1DJU1kgGsYplgpG21+YhsMSTq1OaWPUV4ykOfiC5EWhPvcM5lW/zCbxc5OkGtn5cDcuBx3vBzxW09hH4dZQa9+UZziOv/KrCN+OX+QKd/PeIO+gN7SHYL4MRgrEX6ivLARW5Lw1KQwFzfIYwwanX3CrXzfsPkgDZYOkk6wseCYPAaTr6z5VaybsOmFa0XuUH0dc0grf4GQwyPZg4RWpQgY4KylLduxRRo5H7fHV5ADktJH5wnKG4XPaJaWClsFZFEPgTD0nbGT78YP6pwEfYidrkwF0COs65tDeq0Icrq6svqZxvj6Kchk+4N4edls+gf7OcHVdh9XxVkQZHpeoY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(11063799006)(56012099006)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xhZK3dddB6HFprAbCjJShwXAsrT+FOyykNfp1BxEAI7zz27tjUjvAL8RmIB3?=
 =?us-ascii?Q?BMK8leHmjScH1807DppEBgPV3aIdxo3hbpleDIZljM9+Pl+SSQQVY/wlrhjL?=
 =?us-ascii?Q?CBs1r2B6Jy7aEdr1jmOXTM6UyBgdcbQFhKATTEb6Xtp0AjLzY/V+ZGmCWy4y?=
 =?us-ascii?Q?S4OxDdPjZDyTCOvYjCmrNZAGeCqpejkeKIhDJweXXtK99CvnnX8vDkhoW3E6?=
 =?us-ascii?Q?gnHnLL5dMWJvlfDk3asHYcIIXX9hzH7Q6XAoTF1ms6fMNXSSzGHP1ZX5vUqv?=
 =?us-ascii?Q?CfLrjrXus61535SQZpwCb75XxX4f9dOK9WDx8AYlKefuunV8sq/sQsklCfxX?=
 =?us-ascii?Q?UcfwaudpQOFUTvCi6z/PJpm1hRkhO0bYW+aPDg+FFm7OEbOk5OwnmKlA4kY0?=
 =?us-ascii?Q?d5yNiJYUUY5aKnodZHUgvq7w8NvkPBSq2h0RnuXcNJqq7qiY1fIRAFqgKy+H?=
 =?us-ascii?Q?HlrijvIYuQSkDlR5r5tKSDxwXyBpIGDvbAZpA4DUn3L46qa9qE5yvFhIhMXS?=
 =?us-ascii?Q?kmfYJ26WynxdpGaiSbGumdC7fDRVCL0WjZdkFSqzzaMWnqwGQDNB7zzl8vlv?=
 =?us-ascii?Q?l5plZpnp4k7SL66zMI9tBl+m4AyxAcj3Zjnwu95myJI5WsIeJlLfhMxKlZw5?=
 =?us-ascii?Q?FB/6unK1YeCoUv1zTfTBhI10hC1VxuakYY5aurEpRytQhXqRU22oQLK294vg?=
 =?us-ascii?Q?pR/dBsgzgRfoeMxs/QaqZdWzrJVY/646y68VoOKX7qg1NLe6nK0HMkISiEYX?=
 =?us-ascii?Q?b69CmIyMNV85iyIUTv6Gk27739Sa+QDqU3NTqTxmaIFJ9l+qRsUfT+w93dep?=
 =?us-ascii?Q?8JTpjhC/bJ6Xzs1zsWNRhaOYm8HkwWLPwJCBQ09oqgOMe811Dh+RGMA5KXTI?=
 =?us-ascii?Q?VRWeoG3B/zHYZOIPPlVB7GMm5yfRhowdfTPbflW0W4/GAkYRtIXKCJel/mfD?=
 =?us-ascii?Q?2FX7zPfjPsqgNl8L8npZnAVX3IAnIG0vndELaNjMGC8rauMd/GmW2WLfql7U?=
 =?us-ascii?Q?VOk2kV8L8MUqVSJjMPSXEfYTlpGl8SBWtrxKReRAwbd9BKh7iVcaHD09iQgV?=
 =?us-ascii?Q?QIYwk/M5uH94ZcfCjJotRrqhkgcTF3G1jIBf7YNS181qqSuE7+kdM71OHUP8?=
 =?us-ascii?Q?Z1tBeH1RguQ1FzCGX6uSLbjeaNcC9FbrcKNpt1SIxAYdxh5FzJK+Pu7PKg9K?=
 =?us-ascii?Q?N3hlDWMOXxE+kp3BwjKTp/Sv5kutdDvMfI/UBK9vfhE8JQoU3n7v3p73CquA?=
 =?us-ascii?Q?Kx0jxktzra/3cP6rM0aSpLilU3oL63LVdIAYJnNLkqIQDgGnIDy8VbcfQmdX?=
 =?us-ascii?Q?g3UnANsy5WP9WTTuKXQSc9rp7uBZ04lxWH2rtfaaNjIaJH+tfmctDANUOcTW?=
 =?us-ascii?Q?EBOCBh67BgVsGB2Yn2cumHXS7OTxY0C11TtZ/y2zZ0Gaskjq5+PdfG4OP6Fn?=
 =?us-ascii?Q?fB/WFxaE65ivgUGxyT8UJQF9E3wy9TPX0SaQvJEr6BPgD0H5PxeISn4AAuwF?=
 =?us-ascii?Q?QYAxIkr7Uam6y0yG54My0QwBrcbFGIvJ54mD3f6Co0DZDVYtB5cEhrFFIssf?=
 =?us-ascii?Q?sB+4uR00BO5foFPCRsN8iEwID++Up+5oQvKn7dOWnHII6X3j5SHxgpcjajg4?=
 =?us-ascii?Q?rx16YvXKC/DdUtpSWwX5ztIkDVUaEKrYTHtgtVNsvKjsaUhVoS2rx0HXAhTN?=
 =?us-ascii?Q?amUQWfrBPyB85MfXv9NY5yR7V7HOlPPxsScvJx30FUk70CzPt5dsmoeAUdlL?=
 =?us-ascii?Q?eOfoEtEVfWfq7Tvkyb1TTLU7mNptyiyt/IA8TgCRZOl9UoQSrAyR+L3GFfVE?=
X-MS-Exchange-AntiSpam-MessageData-1: XlLM2C9q9QsxpQ==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a175f419-4fe1-4401-0027-08dee14d70ce
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 02:13:05.5569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqL3iXJwYZ5fV1111/rJAPyMwtVIq9va27OaKXpUrN67+YvmklITpOX1Slo0pneFPXObr4hLcJpaLYNhiKB/Sm/pG0FeGfBXSvPm7W16B6hHreoTfSFEBFhCViOTXlQDCVqVnPSHTfef0FyylJ6anQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5410
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_191314_333160_75173113 
X-CRM114-Status: UNSURE (   8.66  )
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

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Add compatible string for the Intel SoCFPGA Agilex5 SoCDK TSN Config2
board variant. This board enables gmac1 as a TSN port with an FPGA
GMII-to-RGMII converter providing the RGMII clock delays.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Acked-by: Krzysztof Kozlowski <krzk+dt@kernel.org>
---
v3: Add missing Acked-by from Krzysztof Kozlowski inadvertently dropped in v2.
v2: Replace mac-mode DT property with compatible string detection.
    Use phy-mode = "rgmii-id" to reflect MAC-side delay handling.
    Fix Makefile indentation.

 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..e431469a7175 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -114,6 +114,7 @@ properties:
               - intel,socfpga-agilex5-socdk-debug
               - intel,socfpga-agilex5-socdk-modular
               - intel,socfpga-agilex5-socdk-nand
+              - intel,socfpga-agilex5-socdk-tsn-cfg2
           - const: intel,socfpga-agilex5
 
       - description: Agilex72 boards
-- 
2.43.7


