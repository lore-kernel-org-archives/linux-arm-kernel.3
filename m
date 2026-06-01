Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9EECD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 07:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysX8HVe5tI0y8KixQmCJcom7RXVurl7yJ/4ljZeiGh8=; b=hcEJdEFKOGqbt3HoN/mZl4cks8
	PD/LiH8iKs1lqReKtNi6Yj2odYu7+ZsOXZYu9+XCw0ns6+njsH/90GaNVpNjDx2G0Yjj/1796veri
	Pu0tRKyiIkgCOpg2TtDoTQ+pn9HeW69i4JFgFi0KVzX/y+TM7kcjx4RAE3o4bfzK4smcWrqL2IFR3
	kIhvrACG0gbjURxX3x3rlYSUpNNlizIWP8qpj3mTD5XbFY+mvCWhS/OkrX/DwWKZKC4Si448dr4Qw
	L8fx4buuVYND7jMiuxxJ/bgOf2KO8lEAoaOtlRl02aJ1o9LPo0Mgi9XNJ7TBZfg+woKnmJlCVmy6V
	K+Gk6bFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTx9Y-0000000AJ3m-3mp9;
	Mon, 01 Jun 2026 07:33:40 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTx9V-0000000AJ16-3GTZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 07:33:38 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VLpD8M1007224;
	Mon, 1 Jun 2026 00:33:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=ysX8HVe5tI0y8KixQmCJcom7R
	XVurl7yJ/4ljZeiGh8=; b=L70mGwZ6ZGH172jiqSkJmz3SG+Rgeg8CYOf3PraLU
	LIvQebe793ffoClrtnrdt2K9wg2alXjDJnjN1Z3pUXNY05xMHt7gVeruAdVZHjVI
	nAcPgCFOlY41CCJ5+RiM2F7Bne2Z7UeA9JJUKzObvObysCUUKTzDbtuzihWoWpc7
	6turwA6d+gOB+GW5L7dEIZ7gzROhF4PDdHsEOboEN8wfKYEz1L/eaAW1B3PT1WLv
	fN/MTxs0E+s7jZhHllL1oZh/vR8JfoFfjwu5QxdP9R2UC2qT/n+CBpOh/oFHBKhM
	ju7wZel9jurM/PHR28sy9YieaOK+b9Csan53isklEfKuw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4efw8hw76b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 00:33:32 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 1 Jun 2026 00:33:31 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Mon, 1 Jun 2026 00:33:31 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id ECE8F3F7082;
	Mon,  1 Jun 2026 00:33:28 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>
Subject: [PATCH v8 3/3] perf: marvell: Cancel CN10K DDR PMU hrtimer on device remove
Date: Mon, 1 Jun 2026 13:03:18 +0530
Message-ID: <20260601073318.7098-4-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260601073318.7098-1-gakula@marvell.com>
References: <20260601073318.7098-1-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA3NSBTYWx0ZWRfX2k8a47EXMGhQ
 x3VEZO9QbSoe8fgA5vxrxQH8ATjXXakMeA7G/1nNomco3kkBzpMIici4EWLcq+Um95gA96TFJ3g
 /C66ZaMGhLsYt1DnZ6s724EVuhAxvzv+wz1mahfW1RKELqb1URRd1dLuqREhKPAdb69HiMNCq5W
 h2FTVEG9FSfJUARQi0FxA+ih9uK+c7fvUPt2eLCMLhbDcl5I2/nTmQ0XBM3yzgFkMvG3r82y2ri
 tNE/DDwiQeUlfRYLgKZIx8UjIjrABGKfYn/hWXN2Xh19Olsh8leRtNEciD9D4XpwBsDG5G923Vo
 JEJ+3KP9pdWOwI30hOuwYQeWS/3sFRUDYPj7fzoa7fxr7OTfywPVaOb6QFpL9ix3uV4SDC0qvg/
 GOxRZkDbeRu5ckO1WAS/5k0JYp+IC76IRfrI9bGYOEsPfXMTPoid2ne2zZTJKC4/ZaVb6vXSwbo
 Zjekkc81U4FhfW3EgYg==
X-Proofpoint-GUID: stzZQ0fRULCmDkINP2iZGQPWSZN_R5e5
X-Proofpoint-ORIG-GUID: stzZQ0fRULCmDkINP2iZGQPWSZN_R5e5
X-Authority-Analysis: v=2.4 cv=F99nsKhN c=1 sm=1 tr=0 ts=6a1d35cc cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=EAYMVhzMl8SCOHhVQcBL:22 a=M5GUcnROAAAA:8 a=u0CBKMH8rBo-bx1LD9MA:9
 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_003337_818788_F9E568CC 
X-CRM114-Status: GOOD (  12.37  )
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

cn10k_ddr_perf_remove() did not cancel the poll hrtimer before returning.
If the device was unbound while perf events were still active the timer 
callback could run post-free.

To fix the issue by adding hrtimer_cancel() in remove().

Signed-off-by: Geetha sowjanya <gakula@marvell.com>
---

Changes in v8:
- perf: Cancel poll hrtimer in cn10k_ddr_perf_remove() to avoid use-after-free
  on device unbind (pre-existing for CN10K/Odyssey).

 drivers/perf/marvell_cn10k_ddr_pmu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/perf/marvell_cn10k_ddr_pmu.c b/drivers/perf/marvell_cn10k_ddr_pmu.c
index 6f638dfe829b..9c82bf4ee2c4 100644
--- a/drivers/perf/marvell_cn10k_ddr_pmu.c
+++ b/drivers/perf/marvell_cn10k_ddr_pmu.c
@@ -1284,6 +1284,12 @@ static void cn10k_ddr_perf_remove(struct platform_device *pdev)
 {
 	struct cn10k_ddr_pmu *ddr_pmu = platform_get_drvdata(pdev);
 
+	/*
+	 * Cancel the poll timer before further teardown so the handler
+	 * cannot run after this function returns.
+	 */
+	hrtimer_cancel(&ddr_pmu->hrtimer);
+
 	cpuhp_state_remove_instance_nocalls(
 				CPUHP_AP_PERF_ARM_MARVELL_CN10K_DDR_ONLINE,
 				&ddr_pmu->node);
-- 
2.25.1


