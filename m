Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7ABCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 00:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1NS3MB4nA8GhCODr9+c9hyS+UbNOcqm6SUmib9q3KY=; b=17wNF9gFQb2Fzq39pPrNYTUkTS
	m9t2ukU/Rw1Wbt4gdRuQ3UnvNkFgecm6sviFF4nmPVMdcgtmdAqBQBF1ai4zRzhIxbH6TgVGfmn6j
	n4pHp7vhCFTzcZKeoZS/gV5T/7IKcAnLiAriQflB8RgPDCjTmHyFXHYUcIUIPm7t5BjOfHtpPOQm8
	z88lJs2syBF7QrLthKTlg/HRJ2Cw/EXCdF03vGa8hjcUo4VErpKIyLJfNtj+LJagN6JmWDWhIi12h
	4HVJ5eQYI2RYbFxtnqt9WbAZPCJBY4E3oawHjRPLMqqde+r8akkn35nV3yamM0EBUMWsFT/PL/qbh
	4mEI5zPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQTd-00000000LNR-0jdE;
	Wed, 06 May 2026 00:51:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQTa-00000000LKY-1zyJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 00:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c1NS3MB4nA8GhCODr9+c9hyS+UbNOcqm6SUmib9q3KY=;
	b=T3eECoQMkT+XdSDYj4vxRwB/g0JVHYY7TQZtgKqAaKQ8tm06oTLgJvt0GK/vip/Djp+4jP
	tJxUi8mEueB/RexfXhOigTFH0iySOsvzDL/JZHW1WaRd4nNJTwHba32wmGcrZMEsXb7/Vg
	i6PMK8iPZM6ms/q4IgD92my9IsNgCXI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-4OsVjy9LPRiJv018NBvnZw-1; Tue, 05 May 2026 20:50:53 -0400
X-MC-Unique: 4OsVjy9LPRiJv018NBvnZw-1
X-Mimecast-MFC-AGG-ID: 4OsVjy9LPRiJv018NBvnZw_1778028653
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8eb82634cbeso1174161985a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 17:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028653; x=1778633453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c1NS3MB4nA8GhCODr9+c9hyS+UbNOcqm6SUmib9q3KY=;
        b=eEUsw+3Q7Iees+ynsDT87cajpEOJZgYTMOuB1ZlqhNtKfDgxIvU8MVOAA/vP0AmczH
         g1AB0QWqa0e6IIbleOdOjAvqnGOVcHYWjy4pUNZ2U9dhjgf/Yjle+TV6hIhnoEotwzRC
         LTm60aL7mV5zHoMDziNS9RIuyIYasNzO2e79yv8Ezm16ZbjF3Q4XRS9YGxG6O8ygyD+b
         dE3drBP4CMmMqHiYsg8dp5DBQ70MPzeox8QeISfzq69oZwXFTvYSVQHq8ovOWXHnSgd8
         xmPstwO7f7lM96gnnrETaAwLMOFt+8cDI4pNt/kCRbQXKH0xkMtPF7bAfQxLcal45uRU
         iqXw==
X-Forwarded-Encrypted: i=1; AFNElJ/MWZbe7seVlD1kLpdW67BrozJpq5WTYahwlucETKtge1M1Q3ta9teN7SnDE8mzcz6/pb0PyIwGmRy+vDUt6sMj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7jM1HAdgdbX5oOxdUlIlI8j/I95Pe4cLeqNaG8wH6pEVrAm0X
	ryqjQMKuEJAF793dYzf5Qnyyq9CMCe/7LQM7JRULhwdO4HKrktpKaZeLUDYYjULlsgwJiug3bWQ
	e5kyO+JRsMfwQf6F0gyMe6RejSILNTver3z5k0bzCH3pakduB60eq7j1UqQbK3Gzd7w3149YoWJ
	sH
X-Gm-Gg: AeBDietLx1gXHwmPFCNigZp8z3Biaw3Ga9aAqdkr/P+NUlBjq+pHVTOo3gkew7hnnz/
	xcDrP8mXzpCcYomZ2rr4/m7E6FZzK/FPOa2PUkOymeEBnhORDk/VXUYanLCDdoLRkdmgg3gFTp7
	HxHAyw+B11kwaqcs0N//tNhchSGGMBUfxxT5yZ0VllRDW3pHbf3zNIxffO4cpPSQCkYKHYHrMhZ
	ps67Lb8i7kFc2TqGQOArhZsXcL3vjCsyD5xVvzgJdnMVjzVAqLLlEbcWJgWNi+Vzd5Osuv9cD64
	qQgs8Fy9t0CvFHYj+FZWWyT5JDaZPhTlzUMb4uB0KCvJT34cV2IbvieLe7jUrwmBISA6Jnoy7cs
	nZpCoexsJ3Pgrvr1QFCoSlbo4xqKvHi8gk7/xPrDD5tRehKLzgosJEFVoJmvmrwaO8OW5FoOU
X-Received: by 2002:a05:620a:1a19:b0:8e4:ebbb:b162 with SMTP id af79cd13be357-904d3eac012mr213947785a.9.1778028653011;
        Tue, 05 May 2026 17:50:53 -0700 (PDT)
X-Received: by 2002:a05:620a:1a19:b0:8e4:ebbb:b162 with SMTP id af79cd13be357-904d3eac012mr213944785a.9.1778028652575;
        Tue, 05 May 2026 17:50:52 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:51 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:07 -0400
Subject: [PATCH v3 11/15] clk: scpi: use clk_determine_rate_noop()
MIME-Version: 1.0
Message-Id: <20260505-clk-determine-rate-noop-v3-11-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=uUN1TpCq5A1biDW7SQgzXIgDhMit0DTFvaH+q74KNes=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfC5ocugJFak4SEcpDV3dvLfRGGpIu3MTFEVqeJSh
 akmFy50lLIwiHExyIopsizJNSqISF1le++OJgvMHFYmkCEMXJwCMJH+uYwMHwyW3E489X77H/ne
 hbXsFi63otiCTsoUrXPOEE7VCp5TwfBPT26bDlto571A73XFyXvmZoiofOlws9J2ncPJ/N+x4DM
 PAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WGj_EEsqhpwbE-PDdnLCpYDcg8F9n8nxghFSR983eDk_1778028653
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_175058_713679_DF7113B5 
X-CRM114-Status: GOOD (  14.13  )
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

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Sudeep Holla <sudeep.holla@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: Brian Masney <bmasney@redhat.com>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/clk-scpi.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 7806569cd0d5..650c85aa0328 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -32,18 +32,6 @@ static unsigned long scpi_clk_recalc_rate(struct clk_hw *hw,
 	return clk->scpi_ops->clk_get_val(clk->id);
 }
 
-static int scpi_clk_determine_rate(struct clk_hw *hw,
-				   struct clk_rate_request *req)
-{
-	/*
-	 * We can't figure out what rate it will be, so just return the
-	 * rate back to the caller. scpi_clk_recalc_rate() will be called
-	 * after the rate is set and we'll know what rate the clock is
-	 * running at then.
-	 */
-	return 0;
-}
-
 static int scpi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 			     unsigned long parent_rate)
 {
@@ -54,7 +42,7 @@ static int scpi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops scpi_clk_ops = {
 	.recalc_rate = scpi_clk_recalc_rate,
-	.determine_rate = scpi_clk_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.set_rate = scpi_clk_set_rate,
 };
 

-- 
2.54.0


