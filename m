Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F95CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 02:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWO8Dz9nIHqrR+SVTleBzTnUpEyDVDhvHJs2y9irGnw=; b=oFe+YlKmXjaqkOp+1YppZI/I8y
	hK5wIJxsMCOafMReUQudO9sPnb7mreW6qpazpbZ1Yj7zp3iu/hs+AokH1HQa3ezZrPcXX9G+8BnHU
	9h7p5/2JUfozlAzvZZkhHSO/BH9Bqc2eOiQhGcENMUNh9PrqYNeaEfdAbwG3EYj3g2cq/wj0RQwcJ
	uULSxVJg+PGSVQCbvSeCmoRA19XA0toxkOBl7tJFDeJrt3pQzl9AzASpWJhOGHgDI4cn8u0e10jJR
	wjbS3VE/ZbhbGXq2/Fp75OxZffWSVu1L+YSpCaxyXaiNljL/7zWu49IunTmWf90NS3RYHly8oe8iC
	6p4tZtog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uromb-000000046xo-32TN;
	Fri, 29 Aug 2025 02:24:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urn8q-00000003tds-0GSG
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 29 Aug 2025 00:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:Date:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dWO8Dz9nIHqrR+SVTleBzTnUpEyDVDhvHJs2y9irGnw=; b=OVw52Xub2/qemO/+zcrCZogtSn
	dU3FRgBVvLcER6LwsauABeq5Hp3VEsIo/p/pOV2BjKJ1vWG0EgbI79+ukNYkSMA4FaNWFqvm0Ba5/
	l0zaxdXQ0fCmxm7qYMKe4/78CF2KMyOdjh92yo5qGuvYN8Uai1pXv4EJMNecYRMPesg0VkyQh4SwK
	8OUGfV2HbUtc/cA6fZmJflB1ENK/ZV3qlF5BCZXIV9ltaPUCKshr2tExSEMf4XXHrZ/qce41A0tp+
	9MD6Jqa8HSzX37VTB8eqWR7SgXN1ZwYme4Ik3wwSa4NpcuJCat9DfsYOwJDclZbO+fghvAtWgzeDk
	dkrA7Z9g==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urn8n-000000030K7-18di
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 00:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dWO8Dz9nIHqrR+SVTleBzTnUpEyDVDhvHJs2y9irGnw=;
	b=J54z5Hej3esLVDyFTX7JBas0AtBPdqUFF35hSf1q7rGnb9cahKtn0V8XDUCz3S/RrUCfuK
	Z368YCdVmfP/lvaElEb9YUp6A618zU4cnFwhteoq5fcGUZyKlfaxewTeqixlWVg3uxTQf7
	SA/WcTgqwh5lY4K7FWfXZxQpvvv8BqM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dWO8Dz9nIHqrR+SVTleBzTnUpEyDVDhvHJs2y9irGnw=;
	b=J54z5Hej3esLVDyFTX7JBas0AtBPdqUFF35hSf1q7rGnb9cahKtn0V8XDUCz3S/RrUCfuK
	Z368YCdVmfP/lvaElEb9YUp6A618zU4cnFwhteoq5fcGUZyKlfaxewTeqixlWVg3uxTQf7
	SA/WcTgqwh5lY4K7FWfXZxQpvvv8BqM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-RrlQTMOdOMqhf9g97fqHCA-1; Thu, 28 Aug 2025 20:38:50 -0400
X-MC-Unique: RrlQTMOdOMqhf9g97fqHCA-1
X-Mimecast-MFC-AGG-ID: RrlQTMOdOMqhf9g97fqHCA_1756427930
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70ddd80d02fso18605656d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 17:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427930; x=1757032730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWO8Dz9nIHqrR+SVTleBzTnUpEyDVDhvHJs2y9irGnw=;
        b=KhI6Zq3sXG6Z1o+2Zv8ZxnpoDza73Ngx4vFBwAifGyEhNWWDd5/im6VcKkN/NqxBrf
         /iXYChfcMIgz3h/IkA7mJtrDAWcDQ24tdMeL1oMwqgIK2oprP1xjaIauVLODHDiHnuT2
         iVjmjh0o2S9UrWjJwTabYOeamODDz09tLXYqGLqAt7hNvDNCMKdXz0hg6+T7gTufG5mJ
         1gWUfWk/VFCHbLSS9qli020lns5+kO2U99bZSgTfvfi7nwM68E1fRnfuONP+0BhPIK0v
         oi5/mMtKSANAswEh0JxDIK7BMTZRTlEHZZYAjwVuswy2pNU5Pb6raX7qYP5nXBrDUlsz
         DlFw==
X-Forwarded-Encrypted: i=1; AJvYcCWn0nc3hXQcXXVh4VjvaspHKBWAUm2nAQL4mSFycS3NvddgnmK+wh62FXxij/2PV3ufqoEqZzRSvnkRv9FJVKhm@lists.infradead.org
X-Gm-Message-State: AOJu0YwrzfOVMJpRpSKBX7sYer2asmDUlh6djlldlr/it/k83NdapsEp
	tDtX+xjSUwkyKKKnOWUAHuwR4JoIfGE3WqdWhH2Sa4J78VI4ohlxRjfzG03lEc7ILjaZuqFmxKw
	44AZfa72mNLFml1mFO+nZzV/gwG3rvj8a9AvNlL5W7pJJFMci4GqdQesrLDHEz94zhJqpvxixIP
	jH
X-Gm-Gg: ASbGncv7wtqpDy2BkF4Ag+THLsLaPyJdP3yufnFKkGJlzNRaVOCMR8Qz4A4XVPT62aP
	U7QhG3sOoQb/lZUgjLGCg0wKNCmRKoX6hLr9GLV4ZKDVNC23c8mLG1NUT1FrVDyNI3svjGjLwTf
	cfBtDnXqqwjsO5UGEBhQXlC3pr/J/l4WhbPURBjdXUo4riWbb1xV5Db+SS5OSoE9wY8ruWdAKCG
	gqKM2egtMcV0cYOxQer3Yh+NIz9WmdwQ+zI8FwcSITnRcVn2u4x3AjWBftm2Tbdicpek6EBN1n8
	QqvlV0Xk4ZKhuPp6Y5wwWQBpfAyb3zxx4G8ztIqVyChFnkemQw7dN9MKTxrGuDd00bsiiftf1Ir
	RB0USwl4ViDpSpit6SIHDQvPjlqrh604mwA==
X-Received: by 2002:a05:6214:252f:b0:70d:e4a7:1b38 with SMTP id 6a1803df08f44-70de4a7272amr93091316d6.59.1756427929808;
        Thu, 28 Aug 2025 17:38:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0zJ/btEpUgEaoIIvfrO+RJjlxl3Pv9v+fWpYa9u5ZWZV72zvhLGJUbbr2PZPa8Aw72GLx4g==
X-Received: by 2002:a05:6214:252f:b0:70d:e4a7:1b38 with SMTP id 6a1803df08f44-70de4a7272amr93091076d6.59.1756427929458;
        Thu, 28 Aug 2025 17:38:49 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:48 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 28 Aug 2025 20:38:24 -0400
Subject: [PATCH 5/8] clk: sophgo: sg2042-clkgen: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20250828-clk-round-rate-v2-v1-5-b97ec8ba6cc4@redhat.com>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=2463;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=sqQ9Idu7LND8TQvnc9CGktCQVk853FsqtiSZ1I4901o=;
 b=OqClB2gKvwUjzcBuWISxeT+XMsrr1fq+AKWaKypJZsPPPqcYnCjdJ8UA89aYPddHv0+EsQ93z
 FAS6xT63b+ACxX8kvKkjjNayIxis6/FhWL13CkGrP4I8GMEnTIJ9PfM
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3a__cdMisU6HCq8Zsg9oD4LnGdk9iTTIS3dvg3gfNI8_1756427930
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_013853_447237_FD09E469 
X-CRM114-Status: GOOD (  13.67  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/sophgo/clk-sg2042-clkgen.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
index 9e61288d34f3757315702c355f2669577b29676f..683661b71787c9e5428b168502f6fbb30ea9f7da 100644
--- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
+++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
@@ -176,9 +176,8 @@ static unsigned long sg2042_clk_divider_recalc_rate(struct clk_hw *hw,
 	return ret_rate;
 }
 
-static long sg2042_clk_divider_round_rate(struct clk_hw *hw,
-					  unsigned long rate,
-					  unsigned long *prate)
+static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
 {
 	struct sg2042_divider_clock *divider = to_sg2042_clk_divider(hw);
 	unsigned long ret_rate;
@@ -192,15 +191,17 @@ static long sg2042_clk_divider_round_rate(struct clk_hw *hw,
 			bestdiv = readl(divider->reg) >> divider->shift;
 			bestdiv &= clk_div_mask(divider->width);
 		}
-		ret_rate = DIV_ROUND_UP_ULL((u64)*prate, bestdiv);
+		ret_rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, bestdiv);
 	} else {
-		ret_rate = divider_round_rate(hw, rate, prate, NULL,
+		ret_rate = divider_round_rate(hw, req->rate, &req->best_parent_rate, NULL,
 					      divider->width, divider->div_flags);
 	}
 
 	pr_debug("--> %s: divider_round_rate: val = %ld\n",
 		 clk_hw_get_name(hw), ret_rate);
-	return ret_rate;
+	req->rate = ret_rate;
+
+	return 0;
 }
 
 static int sg2042_clk_divider_set_rate(struct clk_hw *hw,
@@ -258,13 +259,13 @@ static int sg2042_clk_divider_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops sg2042_clk_divider_ops = {
 	.recalc_rate = sg2042_clk_divider_recalc_rate,
-	.round_rate = sg2042_clk_divider_round_rate,
+	.determine_rate = sg2042_clk_divider_determine_rate,
 	.set_rate = sg2042_clk_divider_set_rate,
 };
 
 static const struct clk_ops sg2042_clk_divider_ro_ops = {
 	.recalc_rate = sg2042_clk_divider_recalc_rate,
-	.round_rate = sg2042_clk_divider_round_rate,
+	.determine_rate = sg2042_clk_divider_determine_rate,
 };
 
 /*

-- 
2.50.1


