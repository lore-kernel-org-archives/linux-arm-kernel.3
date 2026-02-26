Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A070BFD8FF1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOmhS+CGJJS73EIAbtnehSXz+HvsF0X0dYkIrrZ/tRc=; b=pZ7TiytCaMYaJ1b8GQy5Obfh04
	c3R79p67V0iKlIVluPuhuFOhrzXY4zD3z1y4+WnXiRDVYNNnN20wVNHLbs3BWeFc1u5nhtPODO5Pl
	ZKePNalVausoENRC9E58/r2VNIjDpWLrhInPtjCB2b1anRJWrXED2OtFaCkp76zkgDBbkozraxium
	OpmGKNQ/py+0onXPyTzo8VgTtiCtB7/6VnVdhtkasu4pbTaQq/CgWQBex8Sqk8gXa5fgdtZGoWf+k
	0fCoAn6H671B7Le4hbnhqxlZIxXJux0i2TgcEpgNsKyEPkeRvraNhjblIeo7PSYYXU9ZAvSv1O1z/
	nWbpIOfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfvv-00000006wRd-328z;
	Thu, 26 Feb 2026 18:17:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfvt-00000006wQd-2UqH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 18:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GOmhS+CGJJS73EIAbtnehSXz+HvsF0X0dYkIrrZ/tRc=;
	b=atK36s2r2w2vUOJrgLFJaUh1iOlcAdG3kwIHq41ibUG0s/jJ88fnEXc+4ST2rCwHXM3a0Z
	/YytuqJbJdHfnpeQTPUXFmuiX21eIFRV1B/p6VtX/PRmL10nPbxZCtulmt+nPA9lw3RSuC
	AYrrcDX9rdlgPeOeAdP/5SYgY2SD1KQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-qlKMIsE2PRmRS7CHwha1Cw-1; Thu, 26 Feb 2026 13:17:49 -0500
X-MC-Unique: qlKMIsE2PRmRS7CHwha1Cw-1
X-Mimecast-MFC-AGG-ID: qlKMIsE2PRmRS7CHwha1Cw_1772129869
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3b6b37d8so700509385a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 10:17:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129869; x=1772734669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GOmhS+CGJJS73EIAbtnehSXz+HvsF0X0dYkIrrZ/tRc=;
        b=eORPIeKoi1yleQGobtoVeeGzU472WXlRRX8Lv+31xqTfa9i2sb9QNBX3GPQCJcRoLh
         D+iDyuZERX5DXAYJHDlKqVLhaz5MDabY115BGYQ6pdm0GKC0uG5oI+neLFVKxWJWHvqJ
         VP62AfzKCvfu6Ls1b7jyJ6qUiYKa3E0rHdQFXp27dwJZaEZdR9HTu9VPO71ysYzUPrvJ
         smnF5O0ykbEwHO7HsLEzIMc5olG0jyCpA3FYEZ6k7Uo2RPowHA+tJiRnx+tdq3rnoCVv
         1YNq8L3ahhNhO1AC8WQbnH1hqooIJai3RNIPfQnixgHRPPmZXj2WX94mfn4dY2GKE/mV
         /IZg==
X-Forwarded-Encrypted: i=1; AJvYcCU4JpHuoK1fejrgfQebIMSNAz83bss3U6vs1kluUOd4cRfI+8+YjNHBGE7Uah4OSq/88vupbHOY+gQHQqHXUvXd@lists.infradead.org
X-Gm-Message-State: AOJu0YzQQidVCQ28SHGdqIospYzc/MGNnHCX6FdWd1MkB6UPbUA8ovbU
	e8FNouPst9DY4CEoi1isgrQTFgUyukjCItuPQXAEC5Uxyw+PUDNufFYg61jiM8lDcRQf1ZKE/jH
	cF/FQxiXxvvfJJrbyCsy6bR+lzfhoIj7r7sK3qCShIUMEUe3g6OqPWva2obNa5/wJ/JtDgMHl2Z
	ov
X-Gm-Gg: ATEYQzzlWDBh4V5dxPJdtFykFXSrAudZUkWUhsWK9iEKh1+R4D4VuAzAK9VJSWFc3Wp
	pEjTH0fxDSebzZNhoyx9ak1hu3FYe5U2TzAJkzGQxgobqsmH5osYdXWzu97dpv2wHrXp7TsSWAD
	mMF+aJu5cvowGepIuRZ9CLbRtk1zbFnx0IdCrfuqwvRYV57AH0g40KQJMmvoM7CZahoDU+QxBH4
	TTJJlezXXnP6cVEidpr9CIrBCmEw7BJvc3cTJZTSrP/r+VfJYy9czvJ0OlqY4J1n1HvHt2o283z
	6VUOk2GMsoVfptCWdxVYAr6LV/pAiaOLp3D6YTxJ1S/8uPWNMmCWKukSVORbSHGyUFHOsJHh8OP
	lZ7YVKSEUtC+y+sVMg7ZpiilrbDP3Qzi9YoNPB2nRv/EeB1t9njkd+R7bDVpN
X-Received: by 2002:a05:620a:164e:b0:8cb:b062:c2ec with SMTP id af79cd13be357-8cbb062c85fmr990471985a.29.1772129868739;
        Thu, 26 Feb 2026 10:17:48 -0800 (PST)
X-Received: by 2002:a05:620a:164e:b0:8cb:b062:c2ec with SMTP id af79cd13be357-8cbb062c85fmr990466885a.29.1772129868100;
        Thu, 26 Feb 2026 10:17:48 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:47 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:48 -0500
Subject: [PATCH 04/13] clk: scpi: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
MIME-Version: 1.0
Message-Id: <20260226-clk-det-rate-fw-managed-v1-4-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=CpmJIm1mi9VsZ5KOMr74w38LszgghieeQIGldzTUnSM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9OmaTY/j2/LluciBDxLHnnZV2+cV6rya8nT+wUhNm
 8mck7f+7ShlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiCkGMDHsyV548kKK/+d/G
 rPzbZkYRu8+qJHdNvc+Uo71x+qS2pUsY/tmXrv/TMn2SjkDwfJ+i5FrlCqZ0yYb2RuOVMzL3q19
 6wQQA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wLm--jJTFchDoGg083WtA3v8T39qgvzrhNsJ8k-XX1w_1772129869
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_101753_712007_D3C52353 
X-CRM114-Status: GOOD (  14.60  )
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
function, and enable the CLK_ROUNDING_FW_MANAGED flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Sudeep Holla <sudeep.holla@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/clk-scpi.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 7806569cd0d5c4e32700edb10e4edf2185610a81..e13f09cfadc70551c3c7955538e5a212fb0601a3 100644
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
@@ -54,7 +42,6 @@ static int scpi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops scpi_clk_ops = {
 	.recalc_rate = scpi_clk_recalc_rate,
-	.determine_rate = scpi_clk_determine_rate,
 	.set_rate = scpi_clk_set_rate,
 };
 
@@ -156,6 +143,7 @@ scpi_clk_ops_init(struct device *dev, const struct of_device_id *match,
 		if (IS_ERR(sclk->info))
 			return PTR_ERR(sclk->info);
 	} else if (init.ops == &scpi_clk_ops) {
+		init.flags |= CLK_ROUNDING_FW_MANAGED;
 		if (sclk->scpi_ops->clk_get_range(sclk->id, &min, &max) || !max)
 			return -EINVAL;
 	} else {

-- 
2.53.0


