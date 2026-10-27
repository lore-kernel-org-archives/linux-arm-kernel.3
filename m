Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EAA606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 08:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b5tO6416;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k1d7V2SM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3RB9/BBVxLWwbxPMnMEoxFiT0diAW+H5eMLXzJurFWQ=; b=b5tO6416Q5/H/xO0TCkAwTO95n
	TOohasXo8ch1w8Elj8xijD26cfBBm9PtDzmsECkbS3VkEFEHDnV0ecPX9FRrwmZzZ80xee+klBz7+
	VjbAalmBKq6RTA2PaGC+LlfJrhHOY7ysUAX+nnCeAutE6dSMGchCGHVroacPDvHq9+38qPR2D+j4A
	3iqsnYtgcefocmtqvfEaCJMlau7fZi1QOAvLSNsQYabcdAO6H29tzrZyIU4UTU0DbIUsox0VcmcTn
	J0wHXNDMUyntgWBGt3OvXq0KQWb/y8bSPmSjDlb52AJJeCkLYxqNcxSqBfPLkQA9Ngm350ATVL/qu
	rkc7FO9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcmf-000000044Mp-07Av;
	Tue, 27 Oct 2026 08:43:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcmd-000000044MF-3wLE;
	Tue, 27 Oct 2026 08:43:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 62B20601F9;
	Tue, 27 Oct 2026 08:43:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793090631;
	b=AqQcwigiMYzjy0M/fOGhVM3xui6MqGbmOIz/pPUu7cspDKVtkOfVTsz7FrSO2vFAxHZY
	 KEabLF8ju18NS8zfaDO7ewKCirN8Ig6WqzAF7dr6HjJljDStutFZ5CJRyM2i+wpAFAb0r
	 zJ4b5+yhrOIX1IgAZKQ5NfI1esgJXI/KnRh1pb07HtCSTzoEVtGY4s+H28tYuTr+heVIb
	 RQYSB+vJ+BQOZ1ZXpVjhZFSK6uVvAJb40+Vuq1U20nxjFBhUYVAlALetIcQbZbJLKpFcw
	 IVIlRhDIxt1EqLIkoTIJpzMZ2B2BpWx0ogJ3sVnFqGXqjmJspOXPBUPIBdBldYRE2lA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793090631;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3RB9/BBVxLWwbxPMnMEoxFiT0diAW+H5eMLXzJurFWQ=;
	b=GrV7NLDStmP4UnCjO6tv3U7AAvUgDHq7R+tav27mwX9skWIMsdY8dZZ+k5OVtr6kmm3P
	 b5iFkECaqQ/1XpPSXbbqaTxQsuc63e4pAvBrHwocT1mAh9p93jRaKpGx6NZRjc+gDiUNE
	 GPE5srw09xS7f/8VvbMsvxl0V7y9r9ergGJuyVtD76ozvPRfiKX8/JXCsNTi5yRKLVunk
	 r8AsoMqJrBJDVsRwQpq2q62ZE8JXZMj5gB1FnX3/IR/T+1QX7pZ9IROY71drC2/M7B8Ug
	 FuGfzkmkrqBIs+06BbugElfGwHgJmP+eCozW0IUr2q4+s1ww3LYP8TRdJ4fV3b500qg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98B441F01825;
	Tue, 27 Oct 2026 08:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793090631;
	bh=3RB9/BBVxLWwbxPMnMEoxFiT0diAW+H5eMLXzJurFWQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=k1d7V2SMIPFx9TqnAtkw83vozp/RdSQjO2ygzEjmmABRdaPNBQP+TwgLCLvanU0Or
	 h7QnXaQ+3RQAvw0Mon1APAYl3wTNYWdn3m0Q8Lf0q0/DEAWm2rrp5dpXszKEaBsb03
	 vjCHYoLSsub00fOQwHVvfBQqo/KqgWzU+CdHYTCmWfDgEKWlRSIyoyJVgIKKEOpez1
	 G1/7rnJlLZoAxZUDLx8+0aI6U1Z7RdkmYdun6pmMHMtPIM/bO4ykWTgwQv+fzMbBHA
	 onIZJu4FogzCYsUeYQb9CWyFY47We2K7BQcWEf6LXanIBQjQFaN04wCM43fXdzihft
	 UKS3MI4jDjXKw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EABAC4503F;
	Tue, 27 Oct 2026 08:43:49 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Tue, 27 Oct 2026 16:43:39 +0800
Subject: [PATCH] soc: amlogic: clk-measure: Fix AXG HIFI PLL name
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261027-fix_axg-v1-1-741388f1e851@amlogic.com>
X-B4-Tracking: v=1; b=H4sIADpk4GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyNz3bTMivjEinRdy0RDIyOzlBSTNMMUJaDqgqJUoBTYpOjY2loAfPi
 LY1kAAAA=
X-Change-ID: 20261027-fix_axg-9a1226dd4f1d
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793090628; l=1118;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=wHBJmRVPOh0SOfv0q4EbK9DeqGUv8x9se7z6Xr31Dm0=;
 b=V8lYaYyG4Nu3SIhK5LElEYnwNp/ff94wpX+2hnl69vnHiMjifymPuy/FBED9Q9X9X/PeG22Pt
 GbA3wgEfVW0BSejd/avhTZ++DXq4bng3liJENmCbXDNtGGs4SornlnR
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: jian.hu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jian Hu <jian.hu@amlogic.com>

AXG does not have a GP1 PLL. Clock measurement ID 5 corresponds
to the HIFI PLL, but it is incorrectly named "gp1_pll".

Rename it to "hifi_pll" to match the actual hardware.

Fixes: 19e0bde7bf6a ("soc: amlogic: clk-measure: add axg and g12a support")
Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 33767f0bc67c..c1ffa2537464 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -182,7 +182,7 @@ static const struct meson_msr_id clk_msr_axg[] = {
 	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
 	CLK_MSR_ID(3, "a53_ring_osc"),
 	CLK_MSR_ID(4, "gp0_pll"),
-	CLK_MSR_ID(5, "gp1_pll"),
+	CLK_MSR_ID(5, "hifi_pll"),
 	CLK_MSR_ID(7, "clk81"),
 	CLK_MSR_ID(9, "encl"),
 	CLK_MSR_ID(17, "sys_pll_div16"),

---
base-commit: a848d72aab71e19ea78180f2502ad7d12818723f
change-id: 20261027-fix_axg-9a1226dd4f1d

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>



