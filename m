Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E56606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wi7kk1fD;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MzVw2Drp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mDWvJ/spQ38SUWYEopGVk8Tl0kmsuPeTE8Bb7tZRtgU=; b=wi7kk1fDMLfE1n
	6NQpUNvAFYTSJknA2c7S0byCv8fixUYGR0HLotl22t8JwGFsI+SfRMzFCw4t4AYjvPeRWUxd+HZN8
	4wyxm8nMJkxifXnvJQeep/X3XnMA0dwx074BRgFlCdmIljIv8cc/Fk4t8lYSHVxXtTBYK8SYg7MxF
	Q6qkZwYzyyRn5ys9DL6fGs8Ok/46sr/LsUyfNjKJLV654/do7FNHDW/GI8BjDPN3jXrjridj+U4lu
	RRrJ367E8cgf0kHDjr0DzS5Z+QNRNuWcDjXO5STjA2wEVIlfvoW/arTYLJqWwnW+pdNTzcAYIZx5j
	BqsnPy+5PX5Fmiwblb4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPeU-00000009FXn-3mXR;
	Thu, 29 Oct 2026 12:54:42 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPeI-00000009FQ1-40Nz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 12:54:34 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48b042c0759so1082117f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 05:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793278468; x=1793883268; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mDWvJ/spQ38SUWYEopGVk8Tl0kmsuPeTE8Bb7tZRtgU=;
        b=MzVw2DrphdmFHBGtGIug0rFNC+JVBul7Q0F0eXYNar0151jgltdyy+3RXx55ASovhO
         RlSjHlpEH166v412ubKvLJ1q9U66mwy/0Fsg99gDP278+jDNNGaN7qkg9pSJNYO2SKrp
         DdlSmv/UKbs2a27h6CX6tdhDWxrarJKArbo5AKMwINnWUmgTiaaWQCnnAgkdLAZ389rh
         jc2KNUs32f2Hr3h8SflGZq23JdJehB3F34lPMDjd32tRo7aLQ6q03+mbO/nqu7yl1LDM
         V9AtEFmzLPK87QrcQk/HRfbkV5htsNSo9IxsQbx2MmGpfo0XEanHrp9fGOTjRf/EN4RX
         IJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278468; x=1793883268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDWvJ/spQ38SUWYEopGVk8Tl0kmsuPeTE8Bb7tZRtgU=;
        b=dBeZKEKvIqNgGE4FeIE6Tnd79pZ+X+wrGP7FQf4/EJxJ5Z1nMRbftjKHAtEunc0JR3
         xBZe2bqJITT9S+YE1MsYqev09+hIiFxE3LOY+i/5cXlZSxV4FpD2v68jgo2qow+eZR3J
         B9/cDAeWT3J7Of98B5cDPYJRDKItTwoU2H7m4o3bD6q1c+SltaO2CMTfb2gf83g6ycwD
         yo3SmJakZKcWiL7N1RbyYzVvaxdOTNfA9S02bBzkKFqYDZEYfCESKyM3BMktbivwyUXW
         X3iHlqb3fZibQ0NHXFku+yJpk5WeHgPNxLc+CTPVP/gu1L/nm3P1xyfv/6o258OecIwc
         Fr0w==
X-Forwarded-Encrypted: i=1; AKwUvBxW7MRqr+dTNfJEdE6+/NZO+qAFP5kFgrZzsco7k02lkcVoWSGsBq1cDtRCuvRuw1Q8/gawKJcOpuzmPebQ1MX4@lists.infradead.org
X-Gm-Message-State: AFq9FYKRWHtiMH75JeYpLW/Avgm6sTVSqzgjgFcrMQ7pgdTaY/WiXI38
	ILty3HH9M929qhp29Xl/QWFQ1vCnX48SFmsyY4KPFrPgEp+y/zqIzZaNKN8FwuqoA/k=
X-Gm-Gg: AYBFou0mkdU4UmPNCGyLuDq44r12NAle3ZxsAKMf6fXxTIPDDTfdca5hOjhfaOhFlVT
	sgHeZXQ/6e40OItOofqpK4dK6vGzXKnSu3sEnadBB4AWaaUeUygNfcaiZVhtcCtv5i9xpiCkDWV
	5MuSYPPI0Ve1/drVxlH2BjEJBawOaGMViEZAyljzWMQ1fBmPkO1m1/K4i0rFDpWQkdQtNSVXit6
	ty9jaXa8P8J6ATb1zJ0lw9Iaz9O+JSJTroBhsxGO1UObiX5cVUpvCBLoKkFwfJtVuFNp2gwt9OQ
	rCECj07t3cOohMs1MHQbGZokATI8Vu3tC5c88DmdzuE5u/bd+w94rpqTqvmLbJSKky9Hz6YQ/Vp
	wLCB8+4MWOVAFEJnhvSX8JAXsuJL/Nc6b7TYCpoJbu+XDarts7fkvG5OG/1GJsIez8q6JZmAPqn
	6DJ6k/Hrv2J7GohsU7Nb+tGIGWP4BvWUSBp/KYRMy4afn0FArZJVtPsDjp3V7yr2auZknHCzG6p
	7PVzSpH8blWfYfWGSkIF0sudzId1npOdMTavveqqx/Zvgr0HKdc+B5K0CdKbG1nyWlk9bp0khkH
	q90Ec5WBW0R4Y8+kHO5a7pWJNQEhT3kls0FQMVRlej9RnwnlApdnNskEy3MH7WN6O3oa3wmaEUv
	QK5XmUCxTmqAc5vyLlj3C+Xm5eb/MFtecBeUSl6hrtOChCC1NkI9YfxFohuwCV0iDbK90
X-Received: by 2002:a05:6000:29cf:b0:48e:2a04:4ea3 with SMTP id ffacd0b85a97d-48e5d284e09mr8938581f8f.8.1793278467853;
        Thu, 29 Oct 2026 05:54:27 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm35034622f8f.11.2026.10.29.05.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:54:27 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 13:54:19 +0100
Subject: [PATCH v2 1/3] clk: meson: gxbb: add the missing HDMI divider /4
 alias
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-upstream-clk-regmap-ro-divider-v2-1-7a375fd8f88e@baylibre.com>
References: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
In-Reply-To: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_055431_000805_A461D5DF 
X-CRM114-Status: GOOD (  13.97  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On GXL, HDMI PLL divider values 2 and 3 both select /4, but only value 2
is listed in the table. Reading value 3 therefore gives an unknown
divisor and an incorrect clock rate.

Add value 3 to the table. This also avoids a division by zero when the
read-only rate-rounding helper uses the value read from hardware.

Fixes: 5b1a43950fd3 ("clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs")
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 7a7b104182ff..8cb6404c0efd 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -350,12 +350,13 @@ static struct clk_regmap gxbb_hdmi_pll = {
 
 /*
  * GXL hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
- * A divider value of 3 should map to /8 but instead map /4 so ignore it.
+ * Divider values 2 and 3 both select /4.
  */
 static const struct clk_div_table gxl_hdmi_pll_od_div_table[] = {
 	{ .val = 0, .div = 1 },
 	{ .val = 1, .div = 2 },
 	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 4 },
 	{ /* sentinel */ }
 };
 

-- 
2.56.0


