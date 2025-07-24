Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612B6C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sqXMGBHlqKjqzJ5Uc1Wd79zCDuysqgTw75+tS95tfVg=; b=mmCdLsdWWwwWQj
	lrXSnQUPask0WdXZ6fz6JesnO9MdK58YH+z5TzqF/tB3nRwab9z8e23HPMPhjurlgLmRPeUx7UylM
	/5m2m/mEdf9OqEhCbmDVv9f4PeRgcF23BdSTYsJSyZAm9hFkNydgIX0tUWmQKrOoG9rPCRvI8vtWx
	sgeKs38n39oVDybxAUb2R4md3yIrhie5NMdHTzf6Gx6i53OkzsTOGucwOLTEhDnyFsXDs6QQiVbF/
	JYPbqRnJmb/PlFjs1ZHIWSMDKQ/DzSuR3zX72Y95O6BzV0N8v7bEpvrhwpHN5/vGUP6zdtmr7BlX3
	LSBDzPnHRhYaMQkFGv1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewP9-00000007cqM-3XJl;
	Thu, 24 Jul 2025 13:54:39 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uev8y-00000007Q7p-3Owg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 12:33:54 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OBYXDI023834;
	Thu, 24 Jul 2025 14:33:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=sqXMGBHlqKjqzJ5Uc1Wd79
	zCDuysqgTw75+tS95tfVg=; b=L0kMObykL85QFNblKq7i/emOOIjVASM+0GP3bf
	OZPA6MaVRzfKHEeAYXnk62xPnzdhv2y06FUfKOA8sMPUcGXpp/8xg8VuSj9r0g5c
	ccrI+DbWmOzFFi1E4CJ4fZEhNQ6GZpcFTgBTsyu3K6ozH/cSjQXMuA/zkHWnq5RW
	FVxDEZbVr899jvyjONW47gXBAhfAEGoYHFAwAqXvjnAbRzf5AKmFM1ztqLO0J7Ii
	KNf+n806Bu/RsTmv5l6Vl+Dp6unql62e3U8joruODm0BtdC0vfKZccm68unwOKRK
	9iwn4b1nVOlZaOjO0mmp+GF3qN59qDjzDYK4Fs/n05gVC71A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 480mx4xgp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 14:33:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3D41340044;
	Thu, 24 Jul 2025 14:32:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 04A915E2FFB;
	Thu, 24 Jul 2025 14:31:39 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 14:31:38 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [PATCH net-next 0/2] net: stmmac: allow generation of flexible PPS
 relative to MAC time
Date: Thu, 24 Jul 2025 14:31:17 +0200
Message-ID: <20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJUngmgC/x3MQQqDMBBG4avIrA2kEWnpVYrIqP+0A5KGJEhAc
 neDy2/x3kkJUZHo3Z0UcWjSv2949B2tP/ZfGN2ayVk32qcbTMTOWQ/MsqPMISQjzE6WleU1jNS
 6ECFa7ueHPLLxKJmmWi/w3qndbQAAAA==
X-Change-ID: 20250723-relative_flex_pps-faa2fbcaf835
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474;
 i=gatien.chevallier@foss.st.com; h=from:subject:message-id;
 bh=4FAUw/jtnxHapOktpghfP7Z0CEuQ7323akubFkWFyg4=;
 b=owEB7AET/pANAwAKAar3Rq6G8cMoAcsmYgBogiepus5bsLZjIQ054I8ikw2Hg1ohSh2Wm9N6g
 /9R/6648pSJAbIEAAEKAB0WIQRuDsu+jpEBc9gaoV2q90auhvHDKAUCaIInqQAKCRCq90auhvHD
 KBMQC/Yi/2t2mlpIQKBnp5ZrjZ0p3wScXMAyboypYOMAqKvH6vOef5EkkWIbSdfjczmfxBlrEy+
 Lg1GqErsxW0M3uRIqV02awfKoCxo72WbFiJvKDYFLaRrQLVgTTnd+dzF9iyDfQR8JDOJ/DZKT/0
 52yfZaQw7tjitIT2tTrnbSzZnpKTcTkDkYhqXKva/hMSO+iTWQlTZLc5QLgMUSOsQZg8gi62bBv
 6jQAQoqIM/T4sDhKvGW//Xg6w5TQNC+tfskYyBtxtBBI+lq9nw3UIWPnjR1Q2RH+uI1ruQGCpxx
 BqsfXTABNYY1GMmYsia+pdrakXZipOKe3Jk4t4ECntK4NpWpJ087k0sdtGkFjQotPL3B5Y5p7OC
 /jZfbJ2vWZu5H6Qp0CkzHhLHJby7w8y5TqVneP3hQaa1PslrV8Ir9KxswU6F3wt+Wf4nOvZai+2
 xZYxZ6ICMKpeBrRJqq1Pjznlpf7ZCl3rOtVMcQlO4GSyzWRRMO4gNnAdQwb1/WmBjmkw==
X-Developer-Key: i=gatien.chevallier@foss.st.com; a=openpgp;
 fpr=6E0ECBBE8E910173D81AA15DAAF746AE86F1C328
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_053353_142025_97736999 
X-CRM114-Status: GOOD (  10.82  )
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

When doing some testing on stm32mp2x platforms(MACv5), I noticed that
the command previously used with a MACv4 for genering a PPS signal:
echo "0 0 0 1 1" > /sys/class/ptp/ptp0/period
did not work.

This is because the arguments passed through this command must contain
the start time at which the PPS should be generated, relative to the
MAC system time. For some reason, a time set in the past seems to work
with a MACv4.

Because passing such an argument is tedious, introduce
STMMAC_RELATIVE_FLEX_PPS config switch so that the MAC system time
is added to the args to the stmmac_ptp driver.

Example to generate a flexible PPS signal that has a 1s period 3s
relative to when the command was entered before and after setting
STMMAC_RELATIVE_FLEX_PPS:

Before: echo "0 175xxxxxxx 0 1 1" > /sys/class/ptp/ptp0/period

After: echo "0 3 0 1 1" > /sys/class/ptp/ptp0/period

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Gatien Chevallier (2):
      drivers: net: stmmac: add STMMAC_RELATIVE_FLEX_PPS
      net: stmmac: select STMMAC_RELATIVE_FLEX_PPS for stm32 SoCs

 drivers/net/ethernet/stmicro/stmmac/Kconfig      | 10 ++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 13 +++++++++++++
 2 files changed, 23 insertions(+)
---
base-commit: 8aad37d16cffb6c0940d9b213456a2733a786f57
change-id: 20250723-relative_flex_pps-faa2fbcaf835

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>


