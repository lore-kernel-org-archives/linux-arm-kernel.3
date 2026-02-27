Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C03FD9E29
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 00:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H6vKWKLpfsyxBMubQgRFPWbSfZlv16d5pU856BJRsKQ=; b=wX+j+6LzNy8n9G
	8rFDlBIGKHJSRVgX5L3EXqHcYlPqyuMltaTTHTNSvMwvtwSDTXduvsstzf9z0xzsnvhAkWmeOahW1
	lM/Nbr5HC2n3D42nsqNFerXFvZUdZnwJjieuuajgpYWhdrItHHxFXESm0iB+soYQoIUhilFaglh3B
	R/qzcSCqD7on+z6c1mthjMqKpg91+fbbHYE4oX5VnKJTExxxS8Xu2dMhUQVWgrnVlwUoQXPmpZwbS
	iZgmopuUTHS0bnaWLEV729THLC2wlaGom42WM67U4lRPGuOFXMFNLn5CBVCWxp1UAP/D9St8SgvEB
	99Rr+bwdsvyCVIK+9ztQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvlle-00000007Qso-0TTk;
	Fri, 27 Feb 2026 00:31:42 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvllZ-00000007Qrt-2M4m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 00:31:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOvpr9WLoC4N2UFwj2WJR3ZKlsQe/bLeYzpbV5jeoGN5WqnO29+SkZt4jc3MSJ68dr++RAoHsU5wH2qOB+6kE0mOt3+1+E1/NNfWPKjmb0YQNeBu+WnMLdG7i1X3CEfRYOuJvj1sVX/dEw01zUbGJS9gAB4W7+TJ2ABkwEY+hhn0OeKNZ7NWwcvb/5T5uIBlCAppKv/Emz4bDlsrNomzXch0bEyJkgcczNm0l+np1c9KgOrGd4wiPGxz9l/z2jcnnfnw6eeObtoFuJWK5NyX01i62ytZU+PqANHAM5WYBc6yHKvV9Lrl52V7nM31P3ERBEM9DVZsx3bODD28l0gIng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6vKWKLpfsyxBMubQgRFPWbSfZlv16d5pU856BJRsKQ=;
 b=Yboe6QMgCb4td11GDT+riZKGD4sm2pwcDz38DODemImaSuwNFYwTuPnSWqC94ObbC/GPTE81uHYjpcACt89uGG5mt0DFzvaiSP2nvI6bxSgBKaxgPQ6V7DesQhpFX7WzgORh5iaKkw3tXLaNrcO6Ma22d+5KWwkq3/+8IDq3nB0XSYyt06ZnYy3c2ENIHHMrcECCXI6TZ2rmZLnLPmiQQbut4K44eQyqKz5HODxizPuqgYk0RH3DLV/77X+CEmcKaszlEvQA3fnjpf2jVu1WzdlSsPbsUSaze5UKKT0dLs6FEmJ85kl48UkzdB6TiKsfRt11RIPFRSSHp8+iQ8LexA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6vKWKLpfsyxBMubQgRFPWbSfZlv16d5pU856BJRsKQ=;
 b=Xso6VF94z/eH1RAoK+da5LiNnxlOOYuis+O85todTRghOxWjCPdJ3ot+Y02KKCfka62HVm0wDKdUGwuj2mUV3frR2lV58IYMKXCoxidpIVAxrSnOBBqmEvPZmrBtYpx2P8N0lmJVMhafaXUpygI474kjLwFx2zj91o/Z30a3UqHpJo/PfzC1m5G1P0YLOnxMV5zg47JYH8wFz+4MNmSAc6ozOY9nVGvrxvS7RCUxe2EtMOeyDR6D259aiLmtCkJgMQbZTjcaOa4tvaKaZV7we6OyPIGYHY18++MyKNTARsTCXewwWMII9rBaqmUKKtGNbc5ScdFkkjPXbHxRTsyVeA==
Received: from SN7PR04CA0040.namprd04.prod.outlook.com (2603:10b6:806:120::15)
 by PH8PR18MB5384.namprd18.prod.outlook.com (2603:10b6:510:257::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Fri, 27 Feb
 2026 00:31:32 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:120:cafe::37) by SN7PR04CA0040.outlook.office365.com
 (2603:10b6:806:120::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Fri,
 27 Feb 2026 00:31:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Fri, 27 Feb 2026 00:31:30 +0000
Received: from vm-swbuild02.AxiadoRD (unknown [10.4.1.182])
	by smtp.corp.axiado.com (Postfix) with ESMTP id EFCCB4157BE1;
	Thu, 26 Feb 2026 16:31:28 -0800 (PST)
From: Karthikeyan Mitran <kmitran@axiado.com>
Subject: [PATCH v3 0/2] Update Axiado reviewers and ax3000.dtsi fix
Date: Thu, 26 Feb 2026 16:31:25 -0800
Message-Id: <20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-v3-0-a3b095989823@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN7loGkC/x2NwQrCQAxEf6XkbCDu4or+iohEk2oObstmlULpv
 xs8DMM7vJkVXJupw3lYoenX3KYakHcDPF5cn4omwZAoFUqp4Jut9og2RxaxHgJyFeTFWKaoTEQ
 36W74mYW7YhrzUfflfqJDhhiem462/E8v1237AZhqFt+EAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=kmitran@axiado.com;
 h=from:subject:message-id; bh=dl7URhZfQoj8I76rnREeEPqJMGg8Nos2W9N9Auhx0CA=;
 b=owEBbQKS/ZANAwAKAfykr3bAxbrPAcsmYgBpoOXgrQqCQ+0xi88y1J/VWM45O8O3OBGZWL1t+
 PkeR+fq0+SJAjMEAAEKAB0WIQQykBiJeI5kfMQLrdj8pK92wMW6zwUCaaDl4AAKCRD8pK92wMW6
 zyzzEACE529f/RyZRxGu9JHX7Zhivyxpa37C1inBIi37+Qi31pvg8TnMd2yTNuwpded1qKk1uJj
 TYqFBxoP0D8+dMbG1EBUGOWBJHfad9GGkIreOVwqT9Ghe0hurGs19K3pRfMR1U7S8gzvRvqwnTj
 QT/8Pv+o4V0yxxxEkvWQMFfcbN6nRIHyxD5g1k2KtJDR3bUAcJBfAYF7YNoHSPTmYmAJAmIxL7J
 aGiEdutEZsZsP7oGL2K3+lSEEhnnxNFgBQe6k3Upc/DV4oEXf1MtDH8e8k0lJBR7QV/EiE4GbPa
 cGU1Xv9Fb23G4kOJJAbx7faPzx3gCepjEExsWBtHRxkmbLUWnYmLJatejyJ2dkICuESf6KD1fbP
 v/svn58Tk16VDHGbj1AQvwq40gHmBNFzQUF4i2cxwYrgmmFcuHqbnO9hwKJyZTKCIl06kLNUI0Y
 lgPmJMR2PlRXg+9PuNu/Spf1cPJCKxLGScVn2oV0zacA0pOiTtvB4hrMTiaSXfuplxfbsHyVWM9
 sj3w2lATfC82tBJ3Tdw7dcKZCOxPpeR8563GgVV6F99qkl6jtdy17h8+t0dpUX5wdTrjCvp6KDD
 w5+9h3KA2EHSxJ89Mh408VtqZc6pJ0YJt8mjt1HKiN4gYMA6kTAN8CbVWWTviv6szIo2k2S7Qp/
 RxVSVexcjmGSufw==
X-Developer-Key: i=kmitran@axiado.com; a=openpgp;
 fpr=32901889788E647CC40BADD8FCA4AF76C0C5BACF
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|PH8PR18MB5384:EE_
X-MS-Office365-Filtering-Correlation-Id: 845a1f21-ac30-4716-d547-08de75978d5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: JKr9miMiov9WqpPfS6R08kg6cdYLVZfLypZOFsnDcoTXAJYhxpkZiPVrZqzaxfIj85pb633PqyecwPr30lp5IG5CLfjYhZ0WPfzK2+Id/2yLm04Sv8Q2+ZbmEcI5ADD13GIzNp9s4HtkfhFr2SR8jTz5n7Jq4w6R3pnouv6AKsuXWRdHcioWCZeWcqwCch/CncUrmnKDv0wRnRzBSmQsGEIJu51/j3Njg2ERlsFjPJyLrnLCg+FaDGfZYNJ6wrI8LtELKq6wuOxcCVmASOMowUzyMWIBwAo2QxvS4bBwR7gBrHSZ/geDJ8X1AV5uSR6/21/zHq91+/Lf/fQFFOuNqwvhq5Ahra/W8LpSg975vtYjp9CZOAl0m1XWB5QuyUANKTZtdE2p9uADvBnoIdP4uXrdFIRXsE734581zE28H6lMwavzlUwtBvq63wGmqX9ClSkF9CHxlmGBWJHhhHRikcmlM143kUL2V9ZuEu+eMbqVQE3B/LI64nLoz3w8UUUXnfBLNPDA9doos7HdQvalIQoKpnYmy1OpjTy8L0VC5dSETfOoxdKrL/uGM0yBRSN4T6otfY9+DaL3AdQrdLy+FeXmxgbGsRfmbueXBrb0wPY6x1W/G9illdcqaajeXp9jsW4SnFY6ShtWxysrn4gE41BvM/Yamn9CruWesIOn1asJp3XD7/xBHQVDEgjBWuFNseOQj+1sTG4USOS13YWvmM+1oX4AYsKQZsMYFx3Wro+Jm/u4O4rrNIkMK19utpxoDYjT1YfhowAwVrmx1sqhz+Hfo++gLfmxW7P8o987ZOx2Jg4hGwpHPcv3wtGORxsbcQgJse9YpVqXQq7hwqtaDg==
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: G+NSthNt0BFDMrdhx/tvpuz0AN873v95/PH37PGbEQIDIDILBOGnQFSzR/KFV6zgMFp3Kg7saauDkDvSYsXgzmhJAEyalNP1NssKZH+P/SlKdSxPNiu4utHXO76xf+SH22F1jEujQzovd9VS1c65eRDSqesogubmGOieOJL9h3H0YESASqeU8J2dK9IOmjOfLS3iYiPy62VScgGS4NuV4TkkgZKXh1vKoLYSxDUUl4Tsm64EfUOEswRMlPQFpMuC69rCwlgfk87B1+IQUSH+hpWQQ+WOhBlnj5/0YnThwArTq1pXTuIxk7OjCr69hQKdxpbryBgmz/FZZZ4JckEQN25YbgV9WC7uGqKYujcQ/M2ywCw1DPLy4/SQZksHymliOyFrYwaJJGEu8LXTfjMyE1C+RR5YVvk9uixkJplQrqf/O5d4sGYuGji6h6iUgwGJ
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 00:31:30.3998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 845a1f21-ac30-4716-d547-08de75978d5a
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR18MB5384
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_163137_606469_5D188D1B 
X-CRM114-Status: UNSURE (   8.44  )
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

----
This series updates Axiado SoC maintainership and fixes devicetree formatting.

A maintainer has moved from the project, so we are adding three new maintainers
(Prasad, Tzu-Hao, and Karthikeyan) along with a reviewer group for broader
coverage.

Patch 1: Removed one and added new maintainers and reviewer group for Axiado SoC
Patch 2: Convert ax3000.dtsi hex values to lowercase

Changes since v2:
- Updated commit message to clarify maintainer additions
- v2: https://lore.kernel.org/linux-devicetree/20260220044550.4152148-1-kmitran@axiado.com/

Signed-off-by: Karthikeyan Mitran <kmitran@axiado.com>
---
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


