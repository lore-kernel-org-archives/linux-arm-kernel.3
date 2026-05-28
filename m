Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD387CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 08:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PkrQzmvEpFXEZiY0duvIXNXXGn7iqqOfhl9m0xS6QW8=; b=LT9GgUYUSmo0fK
	JOFdI1mZtnw6VfBmBnW3PB30q+D4d8nUAUP982GK71Xbpkbd4QMLfDNsftQP3F5v5PZA+OdqrLTcy
	f4jhxl4UBofMuSaYRLX/hirPN8zCgBIT9utPTdQACL2GBbDvwLFnRyAP9u49XAiBAwHT4GOBVE+1v
	RRT4UFFL0QwGlEmcBGAiI3s3wKA8Vl9NYLUHDiHX6A1ajGP6Y+8w86MP7BUcc+6TeiWs00B0pEdA2
	1EdU9l5wM0XIHTQw6neNjaMRS1Hs5z4WVK9vRgNEjNfBzeQuGifc52oTKhLU3vabzv15ynoo1OMJ/
	EyS1ezgV8Lm/jROuqA2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVpG-00000005Ldv-2CoY;
	Thu, 28 May 2026 08:10:46 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVpE-00000005LdM-0dc7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 08:10:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2jJUZTDZGOSF5NlOIx8/rkUiY9mYj4obmH8CV75Es3venGGIwNzH7yC5lObqJVy5KsbeQV6YIqgyLZLGuoBCtQJL/CLWrRjB9IMp9NaJ6dFSW5sr7S5zEuuTu3sFCHF8QCAie3tjlecWw67wfW6dV3ZI6RfM2wo6Tf6dkZXKuOhKDkaQ+nFJ0h3qw4qqjcLIVKqnY5GNCqJ6SDrPzqFWhn5/lUxx38/dm7nQ68SGtW2WZOGz6LEGib7OfSUcJJkKplFBX8tcjQfI2GEHNt+F3TDqvokuVeoF0wA0MKuRLYbBOn+/FOnv+NAH88WVyEI/iUrqOKdwTbwJotw02rLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkrQzmvEpFXEZiY0duvIXNXXGn7iqqOfhl9m0xS6QW8=;
 b=WqLe2TnR0cFA5j2jd8+y2ag6GniS3z+El65aq6Cb5UjFU9QQmY59AElTKZUY/G/ogrePdPjtrhuFyJegsChUmSOcC5RJTQJWlIYP4Wjupg+TQewptDy4JZobVfD99wHM3wmXL9W92SNviEIn5Jqp75g40bhJ63lJcW5mJApT+i5+aaQDRXWjMTCJiQDkZ0JfZ+308ombpaUEszG7pbjwg0YYWO+0W9Gg0PZISf6x2A/dnil+vts/lvWmuWPxFJrfa7iwDswr/0+WTxckVzHpvhyivAUCEZ/3CSOPZydYhIC5VDiVjWt22MQarW7zOtx8OxHBKCEtQdiRUNaJXs6F/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=analog.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkrQzmvEpFXEZiY0duvIXNXXGn7iqqOfhl9m0xS6QW8=;
 b=IC3W5JATHQAV3cLD19r52tX9j3uSKZh7Qj6MjYjxE8oSiz2mMvNMOSILpGvh0AYUSokdSuNiIwUQMDUGAALgA3VcpUmrut0zKXyyQ7HUxN7Rxsj/aeU8mqjaW8QQIGGvamMxTPNg3OetlG/tQhXvRE4MyQaBi38A3TFgmKlmisuHUfYgwJFyJaCo9RfYdbqCZGGb9AUbOvHjMN029IRgMyRogL6ounM+fEn0gewXnHXPbTicUFr0GPe5MuGk3L2pgEr7QgpVeEeYcLgIkfuncfOyhvk5iFeKJhxdt0BUpNYiQ3xbmk0NxfsCUGPezVMiSjsoUQw0lMyfzbIJIzBccg==
Received: from CH2PR11CA0011.namprd11.prod.outlook.com (2603:10b6:610:54::21)
 by SA0PR18MB3581.namprd18.prod.outlook.com (2603:10b6:806:93::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 08:10:37 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::75) by CH2PR11CA0011.outlook.office365.com
 (2603:10b6:610:54::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 08:10:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 28 May 2026 08:10:37 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 61E544186B51;
	Thu, 28 May 2026 01:08:17 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Subject: [PATCH 0/3] Subject: [PATCH 0/3] iio: adc: Add Axiado SARADC
 driver
Date: Thu, 28 May 2026 01:10:22 -0700
Message-Id: <20260528-axiado-ax3000-ax3005-saradc-v1-0-345dd5f6608a@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG74F2oC/yXMMQqAMAxA0atIZgtpJSJeRRyCiZqllRZEEO9u0
 enzln9D0WxaYGxuyHpasRQrfNvAsnPc1JlUQ8DQI+Hg+DKWVNMh4h9yhTPL4jx5ViEJJAz1cGR
 d7fru0/w8L7rIkCptAAAA
X-Change-ID: 20260508-axiado-ax3000-ax3005-saradc-151aed5d25da
To: Akhila Kavi <akavi@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Petar Stepanovic <pstepanovic@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779955836; l=1237;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=PH0nvEF33nUZ7C2M61fd0VD8DNnINTublH5/FIR9p7c=;
 b=B4XOzSQssf/tVaL58xrxm1NlrkxrGckp4GbpOyktuvsJoJA271+ezwn06r0ih5uFqOVWtVkX8
 EHsua+hSI0aDCeo0G+eSqz+XxNbPtCnRzbI6N2WSiJ4DIXXGDrMR0mE
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|SA0PR18MB3581:EE_
X-MS-Office365-Filtering-Correlation-Id: 710ad4bb-fe16-4559-9a20-08debc9099db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|921020|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: C7x4nJYoBvA+KeDgr3hQSn/U3nVuCI76G20RPBw0+wwgKqEeLR7XyJpaC/LJ6k+3RXTYgRZvg4mHAgkG4Jrs+XrvfCou/vod06ylCxlYWbkr0rdCSXCwDcEqCSazp39DqC1/B1DiNzHhZ2PXmd5k5OhYBi2fD7196AmVHVv5s71GZt0KD7zROH91ar51lwBRzHAkMAhqUfGEOIontTKD2c+2RHhMPgZLbjBrNkrOqTI6XkjE7ArNd4B+5de0W4y/ihY7MZMdpdei5QyhVlauUYlIKHIwW19fsYtzUyk+hYrsBfdiMvofruowA/AYSEIjHLQ2sFPKqHOj7GEyrvoUxtCmFS331m7t8y2DOBlSR1S6bp34tywQ70ngkfL4fM40QgRxa1ZPNwGmECS/YHKRyjjt4W8VnhlwZQmP+Ac3CWKl+m17uh1x9uW4V95wDM5MHoul4A1Ru/KPNo7G0hu5k8wEK6/9tOa9YwhAUOtYqMuoANwInvXk0aB4tlZJPZaZXBPSRXi90LtV1kXGAkGcjavhqcHRS/lbxnJJ5/W8D6r2afqpPHtIgVkOZvDsjYptJkeCqZEP2PdvvCjtXTuCw+eBWCENwAGnkb71TyIFDO9Tab5WXYscw46OwvrRqyDzMbnZCPntHn8k3LTcy053oycycPKP8t6s8AMh8t9HTONu5cn9o0XF7WaWKwRWo9asumGfLKNA/iPe7ISo1mp5kuvWh0KaeZw/q0WfzN/dOvTQIfDFzqCFOSlWPf2ZvRWZ+tWYcTDj1Nr5HjrmyX53Eg==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(921020)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RJeDornFd+Zqq78ftaVm6bB21iiA1JGHIO5rX/ktHi1NiYCXli41uuEgYIArCbAoMv0cH7gL5E8e/5YBYZXHaCi1b1K4ri7jRJAhehoXtHjlpGcI3cA4uXUdQDbkSKDJJvTawE3mOj2R1Vzp4MJGacDZF79Ir3pZzBjnVAkBCV5gz6Y0FJpnbRMYEbUS8tC0L/Lk9Qbqzlal+C36j2MYK4FMVgc8EDn25OscMWB4Hq+gtwnrBlxdd5VaMFGlWRuzWT3Z1TuNdu8DwK5SBLza+IKP69w3wssiXhdmE2cRk5aUnk8heQ+0ePlqiIJxlrTEdVHuhDHLfKgQQlaUZ914etc9R1ru3bPNUhXJPAKkbgTPge+bbiCfzM1XnyqHU2gtkwC20Nfm/odbqWbrf8WUparn7GkCDbvts4wyLE1GKcQdKt+w7sY93sVlrzMu3NN/
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 08:10:37.3982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 710ad4bb-fe16-4559-9a20-08debc9099db
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR18MB3581
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_011044_238430_DD087860 
X-CRM114-Status: UNSURE (   8.31  )
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

This series adds support for the SAR ADC controller found on Axiado
AX3000 and AX3005 SoCs.

The controller is a 10-bit ADC. AX3000 has sixteen input channels and
AX3005 has eight input channels. The driver uses SoC match data to
select the number of available channels for each compatible.

The driver supports single-shot voltage reads through the IIO subsystem
and uses the reference voltage regulator for scale calculation.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
Petar Stepanovic (3):
      dt-bindings: iio: adc: add Axiado AX3000/AX3005 SARADC
      iio: adc: add Axiado SARADC driver
      MAINTAINERS: add Axiado SARADC driver entry

 .../bindings/iio/adc/axiado,ax3000-saradc.yaml     |  58 ++++++
 MAINTAINERS                                        |   8 +
 drivers/iio/adc/Kconfig                            |  11 ++
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/axiado_saradc.c                    | 218 +++++++++++++++++++++
 5 files changed, 296 insertions(+)
---
base-commit: 51f0c0b8545b23963afd5d43a8f56ee05bfa54da
change-id: 20260508-axiado-ax3000-ax3005-saradc-151aed5d25da

Best regards,
-- 
Petar Stepanovic <pstepanovic@axiado.com>


