Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B37CC369A9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 13:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j/lAi5eaVA+wpovEOgd7NZL+lXloOZBsudzotdqZPWU=; b=Uxw6svtnw0bRJg
	NvF2E7RPPgvvJ5GUGunaPKQ+y1G8DFiGHavptLVZFTvsFUxUQdqDBpRhao0oDcRQ382SVKsOqE281
	IYX9VPAgulxbHyZwkoSF6pef52z8eWQdJwL+mYXUl8rb76kzM7/rRTewqzoP2pRJ5pA+loLWXSYJT
	/jwvniQIXPtMmxux92YPuE3uyrl5csOsN3EzOSz6JEAfYSgQUzewQYVfgq/S79neeV/rO4ZuLZUN5
	SoyXjMmuGols18jYB8pIvbmflnuu1OpsbisdmqwoMRxrxd0X+zX7piUQ2Wn44RJenUBiQcVCgJmFC
	a3m2SmBsGBRK4+kP+y1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EDt-0000000DsNA-48R7;
	Fri, 11 Apr 2025 13:15:09 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dk6-0000000Dml2-3Lxo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:44:24 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B9W3go002131;
	Fri, 11 Apr 2025 14:43:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=j/lAi5eaVA+wpovEOgd7NZ
	L+lXloOZBsudzotdqZPWU=; b=UqoyPyu2cZP4mweG/lilyfuugIK7/mbywr3lMd
	AgfwdAyouFafno9I0oD9rQsb/gIFq3dAYA/YbKGgEKmL8uQbpaZH9N+Qm6MRZkOm
	KgXO9cd3Xdp8PFwqK30hPEsphF3xBi/9wbNIVUFhaQpbsTLOtf+P4ajc0TyggAfU
	YQg0k3PsF4dbmlq7lvObAPaQU3p9wfIXgX34pWgQdLmcQQGfCFpzEeiCrLOtD6EK
	vNRUbvRvd1qWUyeIRrq/m6qtKSTt50cJtupz2GIFDzqJIfyEuEO0Z/oR2OzTIyH1
	OlCyQnIwKhu8VMS151okJ0buvtJfEQ55rNPOzh7lqORSlEfQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw8pwnc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 14:43:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 58FDA400D4;
	Fri, 11 Apr 2025 14:42:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30E629EC282;
	Fri, 11 Apr 2025 14:41:12 +0200 (CEST)
Received: from localhost (10.252.25.37) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 14:41:11 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v2 0/2] reset: Add
 devm_reset_control_array_get_exclusive_released()
Date: Fri, 11 Apr 2025 14:41:09 +0200
Message-ID: <20250411-b4-upstream_ospi_reset_update-v2-0-4de7f5dd2a91@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOUN+WcC/x3MQQrCMBAF0KuUWRtoQiLoVUTC2Hx1FrZhJi1C6
 d0NLt/m7WRQgdF12Emxickyd4TTQNOb5xeclG4KY0hj9N49olurNQV/8mJVssLQ8loLN7h0OU8
 IMXFhT/2oiqd8///tfhw/o5oPsG8AAAA=
X-Change-ID: 20250411-b4-upstream_ospi_reset_update-596ce245ada1
To: Philipp Zabel <p.zabel@pengutronix.de>, Mark Brown <broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.25.37]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_054423_283971_F6349C28 
X-CRM114-Status: UNSURE (   7.11  )
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

Add the released variant of devm_reset_control_array_get_exclusive().
Needed by spi-smt32-ospi driver as same reset line is also used also
by stm32-omm driver.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Changes in v2:
  - Rebased on spi/for-next (7a978d8fcf57).
  - Remove useless check on reset.
  - Add error handling on reset_control_acquire().
  - Link to v1: https://lore.kernel.org/all/20250410-b4-upstream_ospi_reset_update-v1-0-74126a8ceb9c@foss.st.com/

---
Patrice Chotard (2):
      reset: Add devm_reset_control_array_get_exclusive_released()
      spi: stm32-ospi: Make usage of reset_control_acquire/release() API

 drivers/spi/spi-stm32-ospi.c | 15 +++++++++------
 include/linux/reset.h        |  6 ++++++
 2 files changed, 15 insertions(+), 6 deletions(-)
---
base-commit: 7a978d8fcf57b283cb8c88dd4c9431502bd36ea8
change-id: 20250411-b4-upstream_ospi_reset_update-596ce245ada1

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


