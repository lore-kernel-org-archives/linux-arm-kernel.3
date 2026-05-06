Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9146CCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 00:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTLKfYwhIwjZe6Ymneg9JySC2Ql7RJ72z20RwbSJyQw=; b=OH1YNoiQ2hqdb93BM3RfElRBp6
	vNwN/iRkCJEz4iai5sF30zXL2JSoLxrlqEQ2SdUScHb0G2o/KuRXYx3TCSNt1CIDH0pEbQgyS0/cg
	MYpKt2y7tZFQF5Vc7V/+3fBB6rdMKmyEeVZ0zLU9HTjQO+MGUMacRId7+i4xAYL8wupXl/fdQCaud
	yqyXh+unpHqjnOe19zEJKx19eHOsudkDu4SrTDewJPdulKXg/L3puX9s+qLapwR8gJMVqmBR1Z228
	7vB592mFkXcnJpjrmW69RzCWJg6AknArSjbqa93e9MN2Ry/cttbP82hIR5YgwaGMptzmd/0W8bMry
	K+vJTHhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQTi-00000000LTW-1J5D;
	Wed, 06 May 2026 00:51:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQTd-00000000LNG-203V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 00:51:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTLKfYwhIwjZe6Ymneg9JySC2Ql7RJ72z20RwbSJyQw=;
	b=JTbxIIWpUdwYjAtJsV1dz5uEHh5c6oyL33tsKe/Yo3GljpFcMc4OWuEDUhtGTtCVoQntyy
	QAOjU8JeauxmvnSBoBoNdyDuSKk7ZL66Niy3mw8x+OCuPljhPDzXKp49k3sJVEWnBFMIjP
	r6wIO2pPBpDTlG1hPk2PaI+hbuDaX5g=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-dlboJJJKOIKQJG3Lh056SQ-1; Tue, 05 May 2026 20:50:58 -0400
X-MC-Unique: dlboJJJKOIKQJG3Lh056SQ-1
X-Mimecast-MFC-AGG-ID: dlboJJJKOIKQJG3Lh056SQ_1778028658
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8bc140520c7so16429306d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 17:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028658; x=1778633458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dTLKfYwhIwjZe6Ymneg9JySC2Ql7RJ72z20RwbSJyQw=;
        b=LWdFJHsZpPiyWbLl5OXmg8HWklXVlsiSGM2OmqIVIWAj4E7K7o7ldOoYaufb0j0HIn
         hQArkW8nciiaUYuYBnUASS/ouWjG116upf25/UIULYDfQMXtti3TwGLnG+9ftppCT/Ue
         NX5naLrmqYTliBG70yuZErQSVMEMlv68/HLIQTr/X+R3xYCKSuFtuCTNEhUShMYGevex
         6ago2/ZREpd1O5mCRi5x+gu+KCns6C5eUnMtwZ3hhrrCR3KxqZfzfIXvkhP47sk9JyMY
         qx0opyrLpqrMrZ9aXndVgqtV1BHS9TEMSfvPKHq32sTrCKzocJJhADIFdcomhCSvrLnc
         Q1XA==
X-Forwarded-Encrypted: i=1; AFNElJ/IteG6ZTNA6Do3vNp3godNukzpyBIVmgylX6geshbiH+zfxz7BMERSTcjnr08JcCYtmAew1yX+IJSvUptBfiLv@lists.infradead.org
X-Gm-Message-State: AOJu0YzUAmv45y2KfM3haRWUKJsBhspQ5gsXLeXMHcRHVAjifg8H3bX0
	NRnlfbrA+s3XphCM3T/n0GrN2DL7Ljbtl9ODOthOZTBy9O0YFPw6rG0opYeIerqhdcmCplCwRQT
	CYrdr/F/6Jsi/p5bMJTNyD16zbsx74ZaxZbYr1LUM638dIkcfDBHROCuVf7JAy0LcOtF5FGXRd8
	IW
X-Gm-Gg: AeBDiesUSSuanwpWKkaprqwU5thV+ZDsg1T0b1QLTzvyRwXI6pphdPolpe1HXVlTZnX
	n8ArtIcrAF+Ev7a3inLgAJ6Pv346O1BkjHTfDYoSUNubIMxL0lP8k9llcX3YWdaSMI6XLlOnVRo
	jbCX3gbv9bgBSLrY0IgolMg0VvME2/mahj6D6fAwhd8Q5GxZ9sYm2GBSqUXf2aC9isaSp6opXOA
	AWk1FZtv9Zhx9TelOJ/2IEf9q5B6Z8EcUoBTs+1JQ3961h/HCorl6wAV4AW31ehTV3/vVBEv6F7
	78N5f7YNpFZov4DVlRI41chzFkGGSU4CebhaBNGv1mbRglPhJtj97qAyVb4rA5ivsOKr7/Nz1ra
	zFBOYQhQ/pwxm3sMXAiPkBJODfcpC4498MLiFOY0rDBoeCNvT/ue7YkZZC0UygOFnR2I7LiAF
X-Received: by 2002:a05:620a:280b:b0:8cd:9665:9ef3 with SMTP id af79cd13be357-904d4b595dbmr237797085a.19.1778028658211;
        Tue, 05 May 2026 17:50:58 -0700 (PDT)
X-Received: by 2002:a05:620a:280b:b0:8cd:9665:9ef3 with SMTP id af79cd13be357-904d4b595dbmr237794185a.19.1778028657825;
        Tue, 05 May 2026 17:50:57 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:10 -0400
Subject: [PATCH v3 14/15] pmdomain: mediatek: airoha: use
 clk_determine_rate_noop()
MIME-Version: 1.0
Message-Id: <20260505-clk-determine-rate-noop-v3-14-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Plh6jLnyb5HRCGfMAFTPcmpUH7qp8GtHhHTUy3setgI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfC79mKWzcFFEvubdgnc2iO7/J7kEsfk+WtOMl1ap
 2Mk+yr9cUcpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATSZ7IyLBs3fxvN1L+pLnM
 vLLFseeCwpsdgpUSQda2OW92ta9Tv1fO8Jv19CT98o3n2UuPedrfzXz8JXWS3L6au189Jhk75c8
 0fsELAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bFkbuvqqMlTu6LcWweAOZvzdc21pppy0MEr0LBjlFWA_1778028658
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_175101_593264_AB65439A 
X-CRM114-Status: GOOD (  13.30  )
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
To: Ulf Hansson <ulfh@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c b/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
index 3b1d202f89dc..5efd7a38f4da 100644
--- a/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
+++ b/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
@@ -21,12 +21,6 @@ struct airoha_cpu_pmdomain_priv {
 	struct generic_pm_domain pd;
 };
 
-static int airoha_cpu_pmdomain_clk_determine_rate(struct clk_hw *hw,
-						  struct clk_rate_request *req)
-{
-	return 0;
-}
-
 static unsigned long airoha_cpu_pmdomain_clk_get(struct clk_hw *hw,
 						 unsigned long parent_rate)
 {
@@ -48,7 +42,7 @@ static int airoha_cpu_pmdomain_clk_is_enabled(struct clk_hw *hw)
 static const struct clk_ops airoha_cpu_pmdomain_clk_ops = {
 	.recalc_rate = airoha_cpu_pmdomain_clk_get,
 	.is_enabled = airoha_cpu_pmdomain_clk_is_enabled,
-	.determine_rate = airoha_cpu_pmdomain_clk_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 };
 
 static int airoha_cpu_pmdomain_set_performance_state(struct generic_pm_domain *domain,

-- 
2.54.0


