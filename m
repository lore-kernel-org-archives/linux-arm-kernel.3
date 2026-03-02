Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E67EB363C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 22:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ryJBDdK6sIDP/m6NJ8hXuVJGM48YninxgbxNzBURJOU=; b=Ju2U93ZQH4O4dr
	K6WLkNqA2fyflly4l9CHv7a8sYslo0/PfNoyzFAJRjqeJwILffmui4F3s0FGAheNzf/qZLZXEuA8a
	LWID8XtN5WkMT0qDifRquBCpoUhtxEGr0ljYmgEQ4L+gCPFBIYBQ8D1hyRnIcRacoy+Q69aoVJGu6
	EiqVkp09Q7BRRaiRYBni186/p986xlRcwNWUfGLIhxZgdmJ8NUQSOzwtICcy4vKP/Zckr8mnldM84
	U18GaLDtROQghPPHeXAfU9ZOMzoTRq24HHhTuWXMS+9eHWn9dopMXM2FnMV4upJDg6hgv6+rvfVuC
	usSlWX7lg1HlfYMz/DTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBKB-0000000E4li-2ocZ;
	Mon, 02 Mar 2026 22:01:11 +0000
Received: from mail-eastusazon11022090.outbound.protection.outlook.com ([52.101.53.90] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBK8-0000000E4ji-2NUe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 22:01:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qW/zSEnvuRggxMJ1JN7GioBs5JxOUmsP0MqR14F5OjDW1Wyi9p/PbbNn5GQ4hKivXEoy0EobSBpbtp2mAgMFf+O1uK9mikiO6s3YoMJicvbaT8z87f9PAFb41wlX7PC2sOtFeNLRdOYMzYARoNJbPPFwTw0ccVgZM40njeXrgCMMQX91eOkFFfSrxoX7dJ46iR6h3s4BI0qIdx/j1HHN07aFIsi3OboLSvd8w9CFGbxQqAsrni2TqJNemRuZjNJLl+1KPDFx5n+1rdwwDBCpuvsh2v6j+rXV9FamY37sfpTPe1cdq/joWYPF3Wuhrd2JSt31NIYI1WMS5FxgE3Gftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryJBDdK6sIDP/m6NJ8hXuVJGM48YninxgbxNzBURJOU=;
 b=hH1rqlWmt+radxrXE3O7loGyuS8P2NDp8ecVUSBd6Qk/3kQU8YFKFJ6UEX/fqzcm/mmhOML19+fmm147EMxnqVTbH3J5axizwIMnQtEpQt5HAMV+g15I/QpEXJIFbSmaOnvaRv3aEVXTieUlUbdn6H4lKdglu9haf/h8DOTEluWwasKPnJWLWFYHzXCIzqBcGO8nROcAk6bIjUyOcLixCuII+igH3v/TwwttD3UVWDYFY9EhaVxYmhXmOT/h16mqRhcAKyg8SW+ZhXcdasP1RkpWbOue6436rmvRv4Ca+LqUGqPYD9ehTDDAh7qOOFJRPGo9vFcmiyxkxOJxI/VVkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryJBDdK6sIDP/m6NJ8hXuVJGM48YninxgbxNzBURJOU=;
 b=Wfa1LSwui74IK8NtwLxzPCg+bMCtgu0yUlEIcvlnrTUZ6eskP5C3AkrmDzK289W/Ex1kmpJXjU5ONq9hQ9NIDue0n7A6gO898pp6JhXpNzx4v88CoZmFE1rHXDIK72vt7AWmGdw74dhlr8FawDECUkjl5bdOZWM5nRICv/Dm3L73ub4CkAyvaRnuGQroJnF8/Y4/ARrUlEcG/eMF18mmSM4StfOciyQ2AA2PWwQ3U9/YR46iJAGcVHPH5nREnSdysz493DVtkOTz2t4JZJiLw+qfbbxxsRgD90dJ10aFlQkIPvBWZ/3aYD7Ecyd2fgTxmmeiPCLVjc4q16T4zHv40Q==
Received: from DS7P220CA0037.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::30) by
 MW3PR18MB3660.namprd18.prod.outlook.com (2603:10b6:303:55::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.15; Mon, 2 Mar 2026 22:00:59 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:8:223:cafe::e3) by DS7P220CA0037.outlook.office365.com
 (2603:10b6:8:223::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 22:00:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Mon, 2 Mar 2026 22:00:59 +0000
Received: from vm-swbuild02.AxiadoRD (unknown [10.4.1.182])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 846ED4157BE1;
	Mon,  2 Mar 2026 14:00:57 -0800 (PST)
From: Karthikeyan Mitran <kmitran@axiado.com>
Subject: [PATCH v4 0/2] Update Axiado reviewers and ax3000.dtsi fix
Date: Mon, 02 Mar 2026 14:00:38 -0800
Message-Id: <20260302-maintainers-addition-and-axiado-ax3000_dtsi-update-v4-0-84a5c9df6689@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIYIpmkC/6WOQQ6CMBBFr0K6dkxtBakr72GIGeggs6AlbSUYw
 t2teAQXk5/382f+rCJSYIriWqwi0MyRvctwPhSiG9A9CdhmFkqqSipVwYjsUh4KEdBaTnkB0Fn
 AhdH6LFpK+bApMrwmi4lA9fpCp6o1stQiH54C9bzspfcm88Ax+fDef5j11/2rbtYgAXUrTWlqU
 yt9+2WPnR9Fs23bB9z/GRr1AAAA
X-Change-ID: 20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-2f37e16b9053
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Tzu-Hao Wei <twei@axiado.com>, 
 Axiado Reviewers <linux-maintainer@axiado.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Drew Fustini <fustini@kernel.org>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574; i=kmitran@axiado.com;
 h=from:subject:message-id; bh=wX9sIx4UgZXQxGsC/zhEZzmufE0XsSlPe8hzNiDsKbg=;
 b=owEBbQKS/ZANAwAKAfykr3bAxbrPAcsmYgBppgiZLSuXzTD0jDmyYg50tzVgmgF7ILfP4Z+64
 6rkVOFSetuJAjMEAAEKAB0WIQQykBiJeI5kfMQLrdj8pK92wMW6zwUCaaYImQAKCRD8pK92wMW6
 z13AD/4xa2fB8FMyUJsHQRMFmIynlfEZKCXu0qx2qN1Ns4VG2pcAfG5+OYiXf1AtZJlkXCm3t5D
 Ob/f2pYbZex+K+gxjiHF5xHjaUNwhzvY0D3tmLfQ3tyuKLl0FbISFWZEPYUbOKOKEljosVMWOJn
 GAk3migTY6V4pYVb7Z+Ya0WM0p0MFoV0jOMpJ5EGW8XpIziXKn4ROrX8iZSSz5dt07z6OxyShxf
 lxO4ZFcwedwmRvKkzwc+ni5u4xPohw1U9m4CgCvFGDJEJv6vIR9o12AmJmwYiaBF95k49L/p1La
 KwqdWXMzJliIkKZJlylcCIunxj3FET3E+j4uPHPOjqBCJ0Ozas1YoFtMZCF36+UkklizPX/uU9s
 rElstWskIlUVCKKaaSCLM6B7LLkB+Cwi6antlA5Z6zwRwjS+MwmqFRLgfoWPZPYZMx2ihQf7/fc
 01hl2JLTrVRUCinl8y4kzgJolicBl1lFpQqbSoiUdvVWOjfE2/3kPve+Cou8MFeYeAVkQrv55eE
 Ek/iBpjfh9WZGwNOKwjufzobjNxPeSdIKj4fk5MU/mA+mwxkM4rqsjpSSqxKcu8ul/s95yPmYd8
 MFxWbQ/iPnsqor+ryAXwZYALj5U8nFLdh/ZNWZZA8coCmQ1l6MH+oSIvy47p0tQsHxYHR2Y69jP
 9DmooxtU8SvXxDA==
X-Developer-Key: i=kmitran@axiado.com; a=openpgp;
 fpr=32901889788E647CC40BADD8FCA4AF76C0C5BACF
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|MW3PR18MB3660:EE_
X-MS-Office365-Filtering-Correlation-Id: 22dba004-3668-4fbd-82a2-08de78a72ff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: dGNl3prj3wBnA/lPIqJB339BNUQQGZIkN8qL3Ui2yS1QWnRXPNXJNM74lUWdSe1/qqU0Tduo5Y06zKy+FpphjNOGO9Ygox8Dg5JH4vwxPuNYM+hLQ2Vqol34hw2McGp8Du12Qyy+3eIiFDBSn8m1VQFLk40bRfbv6amuKAYAeGBOxaCm/wXltUAxu/OvDxV8mxA76xPyvM9YdB3Q16NmPePcY4/rX8ySv0LQFsqU9o3EsiEafAytXsKU+qmMKSl6uAA8nzGy7TYQ9kiRQGDql1H+qxOOXQ41JJfweQFQXj96pyMmbzDvIFa53kc2F0k7WREIBcVMGjnf3+tLgtP3BwNKUJ6Gl5m2+NXP4Cso8ydo/JjUO6+/bPL/NBAoFOOCr/Nb+WY/N1I9Z2O35EZSrxVwr+insg2IktdGtTJmqrkUj1XSWTTLtb9N6gbe+WA5UUBzgpLDuU6aDl7blNE0j2wvAcd9sz+ChtyQgbVRIGYup95KtM550hNFiBsqtdhRm8c/szvjFpyikDsyEcKTDE0WnH4bxS2mDgBakkzG3tD/Vi2/tkcxS26VZQuka6UT0PSxN1wx774LNzwGtmIKQML1nHUu15VnvfAQ8X5LKeGInlce000hX1lCmNBU8AYqq1oln73m+spqNJUX8ttzoGySA92S/VEHNJHa1XYoIcxhlEaGu7UQHzmebroeI1iZGhjZ9t0rYh5xfYL5ZCj3XdQZ7jQb9fkQj/RwBg5dS0zCKKhYcsqiEDIscLCoR45plIncTaac+AW73NL98OD1TreMg5azXCBR5WiTUV7Wt9YH0JL9pR43Z0eBNvSpIaxXfqYe+MJ6uy7tF52oiqhjHw==
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NfhwS8JE/mffZMwfNaEEzzp1srI4mvyVUB1o065oGYagD73IsFjqyThLqp3NUXdQXp2HN3bWHk4P2s4IW7gjnPqgsS9MK8o3k4PPXJiH1GW8+o8w0wOchJguTo+wExc12qTqMBzIOIa8DGBaP/u5szxrOeEwS2/uLsK3UlrAgt//S7yDGBWJY+wej2qXrMzUkAMmrwaMHDx1HmqASZB0LrmG9w9ZWymLWHp20HDQrUDV+QefYdGdFCJ0oSVKctn/eUhBTMdjvy2+i0NbGYDgWFkowmATHoMYd2OGjyFcc9+OO+EsBfK/zPgfQkk3FM2m+4wQVplSmAaB1ENFloTKXGtXveXlN88bnUT9zAqgEsuuZRbVLk+bHtpepLmVT4S/FTGGGi6GhbxjOjC46YuZN6tjVwuA68VY5dvOHGbl7UcPzX918H8Ftdd7LRri/o6W
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 22:00:59.1078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22dba004-3668-4fbd-82a2-08de78a72ff8
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR18MB3660
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_140108_642142_E8DA9C0E 
X-CRM114-Status: GOOD (  10.74  )
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

----
This series updates Axiado SoC maintainership and fixes devicetree formatting.

A maintainer has moved from the project, so we are adding three new maintainers (Prasad, Tzu-Hao, and Karthikeyan) along with a reviewer group for broader coverage. also commit message amended to have the same. the other patch has a dtb address hex value change from capital to lowercase.

Patch 1: Removed one and added new maintainers and reviewer group for Axiado SoC
Patch 2: Convert ax3000.dtsi hex values to lowercase

Changes since v3:
- Updated commit message to clarify maintainer removal and additions
- v3: https://lore.kernel.org/linux-devicetree/20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-v3-0-a3b095989823@axiado.com/

Signed-off-by: Karthikeyan Mitran <kmitran@axiado.com>
---
---
Changes in v4:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v3: https://lore.kernel.org/r/20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-v3-0-a3b095989823@axiado.com

---
Krzysztof Kozlowski (1):
      arm64: dts: axiado: Use lowercase hex

Prasad Bolisetty (1):
      MAINTAINERS: Update Axiado reviewer

 MAINTAINERS                            | 5 ++++-
 arch/arm64/boot/dts/axiado/ax3000.dtsi | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-2f37e16b9053

Best regards,
-- 
Karthikeyan Mitran <kmitran@axiado.com>


