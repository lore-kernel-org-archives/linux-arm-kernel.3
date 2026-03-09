Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A2DF417EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 14:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJJogOm7mAlsex83R1hkauB1mXrgfQo2P5H45OLn0pU=; b=wcBJ9K8Nz7NLp0vsM+57savpdY
	iunHWbvn56UkvqS2jYccKryBeEmjRc3LpNjPYMJS9f3SwPgQ5kmusGvJ4x28KN5ZhbSc9OkL3rxfZ
	VpyZTgw3/OGNJLLxaLIxs1ThAS9qTcFdsnvWvWjjUIHj1lYgZxhE8IIBURqjqe24wexrxX3PEcxIu
	5C4vRZwhTphE3a4TJvgS6Qsnw9XinVts/WLZu/LESeTZqWHm3E70XUzpDTMjz3qk7MUfyc1V4U6xI
	qJW56ZYBnMV++rlJLl1vW4Sgzb41ebyNbw2mL8DxG4q2/xR+Qbgdmn2ZYiHgJt+GGJFuPNxEHjoeL
	hZpdWwMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzblk-00000007Ubc-1nn1;
	Mon, 09 Mar 2026 14:39:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzblh-00000007UYr-0buI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 14:39:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FJJogOm7mAlsex83R1hkauB1mXrgfQo2P5H45OLn0pU=;
	b=IlzwUbMLYyvOay7dxHEsbotBO4UrtlsynbHn6eS91gMH357ExK8mxAEyH55OOnmmYI1KX+
	4MDJNqavM4wWRpnapRK4IpoA4z+neMqvyoxkyAhFtMFTSZXBBSlU9uIZuPPjirz5FHQgv5
	X+52VhElUP5drF5QfFjvyyVIKuIimmg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-5IZzpOsvMTe-ykL_6QK5fw-1; Mon, 09 Mar 2026 10:39:34 -0400
X-MC-Unique: 5IZzpOsvMTe-ykL_6QK5fw-1
X-Mimecast-MFC-AGG-ID: 5IZzpOsvMTe-ykL_6QK5fw_1773067174
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd827a356aso743455285a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 07:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067174; x=1773671974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FJJogOm7mAlsex83R1hkauB1mXrgfQo2P5H45OLn0pU=;
        b=GwHYW4IIaS+a1EJonj2/TNjLGxeM9FjyHkRfKC2rAmGKkEbX1giActClvmOQtsrOpo
         D0QYP2t0UGwxI73APnDLrhp3KcsSJhdPHajF58sgdXCyLj7LF3JCn0S2gUgwAXCyt4hp
         QKBBerqBbbc6jkhKmsn72dslUW0cbtmSQCi2nB6921jrB2kkkRoQrGwz01LEhroQcdci
         TE/oHAzxphwF4VZcHU/aSjaSKLDaqie8Sx/LbbzA/KZrmxzhkGMy9tZD4ftNbrP3I2Rx
         rtVCL68CkR8pGZo8J2GEcU9yiBvqUeELttnN9o/U40iDFyU2KKmghXns9L77aqGHCvlg
         TaZw==
X-Forwarded-Encrypted: i=1; AJvYcCX/tkDvugWbtH4LvJzG0TWJdcAs6LrIpbkeZ8euIsRpXtxPodH2zIxikUvYkRm+P0lo5MTi+MgkFk/7LP+N3UxI@lists.infradead.org
X-Gm-Message-State: AOJu0YyL7lGh6jGPi6vCPmJpCfQmN1ZKMtrXJWWavYaCEWVSK84O9CzP
	+CZ6K6zuWMqS4PicAD3pcAyrnebIrCUVdtrNTjav+lSc4/MPx/JRplsm2wdPAruVRosLpnLwZav
	DqLO1+SdWzAJtwRxrwQWd/mzsYd1IgRxWnPAHInwWFQDTXL8dtqHEs5HGTDUG/mi5oAkXzpGlIj
	64
X-Gm-Gg: ATEYQzyLItGSZIVhcFqgQHLnw66y2jr2YRKXc6yPdj+bWf4LqzVyh865DFXgytfPueR
	oIEVMlL1ayUEWsPxtd4Jf/BCMEILJWoTzGKgvY/EKrqqKkZcFc65e+vPBv5ExWUfN4uYOMhIDTM
	WNQ+e0E2nRNzeoN/iL2muHM6/Po+mfDpvRWs4naVQsyK9JyMN51XEWnxWQm+PgUzBnaq9/saYGe
	H7HwR4FBtGYxmdD2wBupxO2P5wC+vbI8yJf0FcpZ/GjCy9lOsRExHmkVOKCwRLto+Dq7+ucXDck
	MeAAL0RBSCE6OmAzEvAr1Io2c2DFCbA8rdrqbj4Z7JLijFg82OUTMyy92qp+TIxmtTLvjbEDT9g
	eqxz6uoReGtN9i3mmoWa5Zrcax0ROPLinPt2ZvOFmjfiNX1W+vGI9Y9STRpTsBA==
X-Received: by 2002:a05:620a:bcd:b0:8c9:ebf3:7623 with SMTP id af79cd13be357-8cd6d3847f8mr1387164885a.20.1773067174203;
        Mon, 09 Mar 2026 07:39:34 -0700 (PDT)
X-Received: by 2002:a05:620a:bcd:b0:8c9:ebf3:7623 with SMTP id af79cd13be357-8cd6d3847f8mr1387160185a.20.1773067173790;
        Mon, 09 Mar 2026 07:39:33 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:33 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:46 -0400
Subject: [PATCH v2 07/12] clk: imx: scu: drop determine_rate op and use
 CLK_ROUNDING_NOOP flag
MIME-Version: 1.0
Message-Id: <20260309-clk-det-rate-fw-managed-v2-7-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Peng Fan <peng.fan@nxp.com>, 
 Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2909; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=GIQeCWpXzFUtNJp/mJUZgo1pJ+8bxueWsKYYeUgP+vk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3Z4oJ3R3zSTjPU8qrm2YlCE1aVbV7+2GsQknTcoOH
 u/9VXNgX0cpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATydvN8JttUR6/67KHqj2N
 jU02NcpW0pUXDouve7JATG36Du4NTmEM/wz5HP7ZnliZvbBZeUPmgSXZZuwM3VuKa/ydc/JZFjP
 p8gIA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0iHHEWTdY-ZWNEzOaSdp56r3T5Iol2j_4QmflXZfdI8_1773067174
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_073937_263312_9E62A71B 
X-CRM114-Status: GOOD (  16.80  )
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

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_NOOP flag.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Abel Vesa <abelvesa@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/imx/clk-scu.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index a39c68d664655537e81df55c7e6d32304de9338a..13fb77562b031bb82d6fa2d19f9092ed33966aa4 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -262,23 +262,6 @@ static unsigned long clk_scu_recalc_rate(struct clk_hw *hw,
 	return le32_to_cpu(msg.data.resp.rate);
 }
 
-/*
- * clk_scu_determine_rate - Returns the closest rate for a SCU clock
- * @hw: clock to round rate for
- * @req: clock rate request
- *
- * Returns 0 on success, a negative error on failure
- */
-static int clk_scu_determine_rate(struct clk_hw *hw,
-				  struct clk_rate_request *req)
-{
-	/*
-	 * Assume we support all the requested rate and let the SCU firmware
-	 * to handle the left work
-	 */
-	return 0;
-}
-
 static int clk_scu_atf_set_cpu_rate(struct clk_hw *hw, unsigned long rate,
 				    unsigned long parent_rate)
 {
@@ -436,7 +419,6 @@ static void clk_scu_unprepare(struct clk_hw *hw)
 
 static const struct clk_ops clk_scu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
 	.set_rate = clk_scu_set_rate,
 	.get_parent = clk_scu_get_parent,
 	.set_parent = clk_scu_set_parent,
@@ -446,7 +428,6 @@ static const struct clk_ops clk_scu_ops = {
 
 static const struct clk_ops clk_scu_cpu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
 	.set_rate = clk_scu_atf_set_cpu_rate,
 	.prepare = clk_scu_prepare,
 	.unprepare = clk_scu_unprepare,
@@ -454,7 +435,6 @@ static const struct clk_ops clk_scu_cpu_ops = {
 
 static const struct clk_ops clk_scu_pi_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
 	.set_rate    = clk_scu_set_rate,
 };
 
@@ -491,7 +471,7 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 	 * clock status from HW instead of using the possible invalid
 	 * cached rate.
 	 */
-	init.flags = CLK_GET_RATE_NOCACHE;
+	init.flags = CLK_GET_RATE_NOCACHE | CLK_ROUNDING_NOOP;
 	clk->hw.init = &init;
 
 	hw = &clk->hw;

-- 
2.53.0


