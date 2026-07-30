Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE91C55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+bHVUngGeTETwXfXs9HjI7OF1XFZgEbN/iyskzwq8ig=; b=RY/zRuMv/VuXca
	RZ+uyefWrDzLylPk0Gc0PqGjfjo0IQ/t1DGBjD+GlCl9kgeg/epHcqlQuVfQpYeWF/McoVrDa9U4+
	MaQ4N1p1Rx6tCJbXvs7kGilMPkgwijbgb0eUdpggWFAI3Fl+mnPczGB+ec7h0Bd1+WLHCTo367mP6
	oDucz1SuahnQ/Mmgdu6xhWzDKmKk67ZFmFvHMWv4D4e4GJCD5bZfOdQ6WBr9wlImquMFBK3X9yNv9
	f979aOqcqQyQxPIe5g5o5iWX7k6HZM4HnMsYVeMlBDzrblZhLpug5BbAdcn5v9aA/AALmf8x1QADs
	IUVbSoOmTNzdC5N3D6cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLA0-00000009jnD-3h8y;
	Thu, 30 Jul 2026 07:26:32 +0000
Received: from mail-westus2azon11020132.outbound.protection.outlook.com ([52.101.46.132] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpL9z-00000009jmV-0FMf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:26:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVbCMwuFRL8uS1kpFQkLdwk//SID8vLDRHXbdA2TwuvRZE3C7r8Om06KaPBqGS9TahO+x8z7t4UHUzLqVUiM3hln/A7l0ZejOxbQN5ArEmcEtidgMnwEGIe290sdj54jWQFi+Y8qE4/F6hJnDZweuFVQRGFVJ8zN1szZKQhEYLx7F9vruJiA2omX8BShtmQRAIhfaRbcgQpDisPCo+0XwjQj2dyLTHpyBldNjtsPM+nX7jZw7OhTLsBhUaD8ZwPddgouAoF8BYAEoORsjs+JsfoUnG9aCqaoqGSaO6cVZKt8L5M/dSrE4565drKt6Wmk/L9w0n1/gz/7W4L3S8szzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bHVUngGeTETwXfXs9HjI7OF1XFZgEbN/iyskzwq8ig=;
 b=J8cpH86Yi17i6pJE6Lg2l0JmOQfIdEJa0eoXsRGy6Fnh8rhc1Lu9q0prh4OP7r7oXCbmIEzl7ENyiWfl3xg8J4e0GGuzIRKkigq3puH9bq2bBDZ2+ws5MdwxRXWhhvPYSQHVQtLEovqsL0jcFqoUtigakmSsCSU5Q9dI5avAa8HUGfHwh8hNcECBHRONLHzAIGG8jK1zZFk4+puVdaPvYpwmVJ+scuFdULeWO1+rBXDQVM41m+oKQ8GijaQETcdsf6B47emjMY/DmSoJMtWjfa8tlcNp5XyG+HNWjNq0ScEZDqtUEhVC8LUqrzZfAxbGbgFdYgc62UFd+rEJQFRzqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bHVUngGeTETwXfXs9HjI7OF1XFZgEbN/iyskzwq8ig=;
 b=aOX5oC1NEBYjDNRy+vZb8L43qcGWIBJPSE3yVezxQNER6Ma7t00mWNGCsjtlsLZNyEIip9JyrQc0fJHtys+Z7VpZetAULbrspRcs1Jgr+WTcLGsDHeZeajujijnsYgZfdnVgQLIKLKYcspCh9vdxh12P00lNVRRjmDDs29ih8bZAU2eE4dvOLiNKoedZDmLZBWbJRjgUaSZc4PobZBIW1DuEjW2Ryrqnmx4+NZ/IaMCzXT/h2buTg6F4N2Zn2tuO7Wby5Z+nHagXGkQlcA2NwHw8zS6VvB2jUeO8p/i5MncqbSYaP7BGN3AiwsWMRhtlAzuKHz6OjxDDcEi+uN+uxw==
Received: from CH2PR16CA0009.namprd16.prod.outlook.com (2603:10b6:610:50::19)
 by BY3PR18MB4738.namprd18.prod.outlook.com (2603:10b6:a03:3c9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Thu, 30 Jul
 2026 07:26:24 +0000
Received: from DM2PEPF00003FC5.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::17) by CH2PR16CA0009.outlook.office365.com
 (2603:10b6:610:50::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Thu,
 30 Jul 2026 07:26:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 DM2PEPF00003FC5.mail.protection.outlook.com (10.167.23.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 07:26:23 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 6AA7B4186B53;
	Thu, 30 Jul 2026 00:26:22 -0700 (PDT)
From: Tzu-Hao Wei <twei@axiado.com>
Subject: [PATCH 0/2] media: axiado: add AX3000/AX3005 V4L2 capture driver
Date: Thu, 30 Jul 2026 15:26:07 +0800
Message-Id: <20260730-ax3000-display-driver-v1-0-4fbd4d0c85d3@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI/8amoC/x3MQQqEMAxA0atI1hPItKB0rjLMIrZRA+JICqUi3
 t3i8i3+PyGLqWT4dCeYFM363xrerw7iwtssqKkZHLmeeheQqyciTJr3lQ9MpkUMIwdOIQ5+9BF
 au5tMWp/v93ddN7B7oxhnAAAA
X-Change-ID: 20260629-ax3000-display-driver-ca9ad9c73b3c
To: Shubhangini G <shubhangini@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717; i=twei@axiado.com;
 h=from:subject:message-id; bh=18jb9AFelmHSEL34wzcAp8GJh9EnJnAxlvDCrDinXy0=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBqavybY6PKaivkNdLOu+51tihUbAlocp/BbO3sw
 xrCDkaS6++JAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCamr8mwAKCRB4EDBdxFrx
 1w5nDACmG3kKyAia9xTgofIYc3gwk9Ze7/BFe2XVIPcDjM36/e2ETBP0Jyv9meZweN3SyGx8Ez1
 tPGM6uAfsynNjh9hV7CoWsKXKX9DK8nnvwJ+YeLswdLI9YuJfiT5/h2vTVXEP6/srm8wOnpDjew
 wi2owwNJa/KQBiPerZENOEw1Wp2qd/3ehVf80d6IawACW/klqxoZHVdRc+nGKjZklRfmDU0hiLD
 9gQPgXLD00+dKtWgcohTBuoN7Lsv+5iLfIKWUvvtmmNZY/aqOtNiWBSQjJ836zGLQ5N0PqiiY2n
 v4VMnjN/Uq3n/VVl+FPH7VXjwSPaslkBtyekKJDtvIeNZUvaGxWTFR4t2Ch/lcTkV0iv02V6TNQ
 WyvIUtsXQJCz8fI1zLnyAxE3LUNQOwqSTN9SqDBm51XUtnKTlwTnHJkVV3URL8x/L6cEvWlY0eQ
 ccn+Rw7uAdumeDLgNFeXtV4PhADtJagY/rukGaVhAIDSBfuTAxs/9JAKMTgTXYfbQ/Akk=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC5:EE_|BY3PR18MB4738:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df52ce9-a67c-4e95-3319-08deee0bdbcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|42112799006|1800799024|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: VDoygt0tJm0OCDqrie3BaFEHi3YTIVuad3ASAqbjWYu0bQ4dGAAVGOTgy3UkWD2rF1qTHkrYD5cM8L9AZpnfa58FTGTWiLbQ4aJK4QDPOi1E835nc6rVxIs11BR3mfyl/QWgihLRMx5x5itaO6gx0m5NfGsZTiVRROVNsi8fjNeguYqkn5vghTXBdEDAOkdpb3xkWqHifh7oxFTnssL96NeyLdRPKQ1UrTdB/NjFAWCPFak3wYZCerKhG1xRoPpA4gBvk/AgNMgWO3sfpLt4Tc92SwbgEFugee2u7nb2O807/qCWrWDQhC4ojTyd9c+ODeZwnp6aPS306hgqAnoLZpgJRQpYpDh/JN9Z7pp+LFciMVqulC7OSryNMQdc3SDvZJcZVOWA7eO3i1NNKWBy2rn6wq7TsFtPUw4yT7FxEP1e1+IixxXSk/z6AkCUb+NpGa9JG47zEJfaUN/di0POtqhgTOh3s7JLrfxFDh1EgjaCo/otk6RoLRfSq522tzZ93qKV2QzXvRLLPl7FbgASNySQh109/BGJw+5PZAv/Jpgce9cQTDBfKN8l8hFNxZRFAFlJOJgTULLhL7fpLLhZxE7mQzyvHNffbhh25O+MnKSIPRR0sX09Bp+Wt0hxv/rsSfMREBoncp5EwPd7LHKb/GY3Ob6mgpkdJBJKIqhf3qDEYzaf8yuHvu3SY7wcZTi+rzmSnTyeHEHDlg42zoCtUA==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(42112799006)(1800799024)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EOq2LHsXbYQujejxXbIr3FaPgyjPCWig6FtuKtI12mPTha5HVq7Xa2JGiasXDjZirOD3GsIPv3XwXrTq3MSXKG2V2P+EHJyJ2ikh9Z0VIYbQhYjwxoAIS+hGWmhyuiD6VjsthKkZSKJ1D4qF+x0Et1ZERZmvM8CuF1m8OZ8vSMuwxGhvQTJ5DM0IBW/3nx5fs+OxjUCX22j0zSt/AFOSSYPuILGbrDuUAokgqrXrAV84A0aaq7EBgmO6OjEaBSi7ToxMTDa/3E+a4CF442Xo/9Nz31R7GgQs3eIsQCecChoJvQfR9kTkdWaMZZK35Xo/FfIFJ8t/4UVyVlK+tni4p9OeQT0MJa5WIdsUtKlBD77DYvnAxyEKKd9tieLqGydVlHHIMeLozJdSROZMwAtuXEiecSk6Un6bVrL+hpRRuv/suqrVlXWu5Pld1oZnBP+s
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 07:26:23.1337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df52ce9-a67c-4e95-3319-08deee0bdbcf
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR18MB4738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_002631_111814_22A42785 
X-CRM114-Status: UNSURE (   9.57  )
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

This series adds a V4L2 capture driver for the Axiado AX3000/AX3005
display capture path and its Device Tree binding.

  [1/2] dt-bindings: media: add axiado,ax3000-video
  [2/2] media: axiado: add V4L2 capture driver for AX3000/AX3005 SoC

There is no local register interface for this driver to program.
Frame delivery is controlled entirely by the host-side display engine
and the PCIe endpoint mapping, both external to this driver; on the
AX3000/AX3005 side this is a passive memory window that gets read on
a timer. The AX300X operates as a PCIe endpoint BMC. Neither the PCIe
endpoint driver nor the host-side display driver are upstream yet;
both are planned as follow-on series.

Tested on AX3005 hardware using v4l2-ctl (format enumeration, S_FMT,
REQBUFS, streaming) and obmc-ikvm for end-to-end capture verification.
dt_binding_check passes.

Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
Tzu-Hao Wei (2):
      dt-bindings: media: add axiado,ax3000-video
      media: axiado: add V4L2 capture driver for AX3000/AX3005 SoC

 .../bindings/media/axiado,ax3000-video.yaml        |  44 ++
 MAINTAINERS                                        |   9 +
 drivers/media/platform/Kconfig                     |   1 +
 drivers/media/platform/Makefile                    |   1 +
 drivers/media/platform/axiado/Kconfig              |  17 +
 drivers/media/platform/axiado/Makefile             |   2 +
 drivers/media/platform/axiado/axiado-video.c       | 850 +++++++++++++++++++++
 7 files changed, 924 insertions(+)
---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260629-ax3000-display-driver-ca9ad9c73b3c

Best regards,
-- 
Tzu-Hao Wei <twei@axiado.com>


