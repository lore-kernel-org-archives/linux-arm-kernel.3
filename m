Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D734DCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 06:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=My1PIJVgQpM5EU1o0KTJuSzA87j4uP83Hs1j1/0ESPw=; b=H6+GqLqad8SBp+hHxpxFOHIypp
	Q31hLq7LmKcJzJkInyzB/T5Mzoj2qhgnWeuaGjrEfsRE6wcRAcp4t4zMb7c7aR4ZBmxxUOZGxPtSB
	eepNjhe0drbHRgpGLz3EWtRd7C3tLeC01jeYZZTpHe0dgdMJmUa19TewEXgAAT7LfFiHCtavGhjdI
	Cq6csd93b9Z405N9idc+M+m0wVBc+b7KiaG3atbL6GJG7nqYdvM20xY1q9biWfTUzRFLo2JEy+FVB
	mQvGW1vxy+5zlFxWMR0Kq1VF1SEuKtrjk4+w7Gp52uetrQY/yL46FZqu30TQIKmpdtsO6kwcuiYWo
	XA54VgSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyt9-0000000090l-0HOM;
	Tue, 06 Oct 2026 06:42:59 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyt6-000000008yq-22kb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 06:42:57 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-34bb8b31647so4134112eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 23:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791268976; x=1791873776; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=My1PIJVgQpM5EU1o0KTJuSzA87j4uP83Hs1j1/0ESPw=;
        b=FKBcNmz1q2OWYstpNc5DBvtiK+EQapXRdDWSvtPWAk2nlfjnkTOUlszfJps3SkzLdi
         OtidBj0zV0rxGHmoPlTeZ1fmme8hEby8cARNdT/yuBPkfciwABYc3D+j0SMyweivI2xG
         /2+Xz2YHuW1wtgbj6dWkIr89hOhao1JQeLK6rzEqO/vR0bAK4mW/wHMYp6VLYbjketsA
         u5d1pmkdAShbGYPJWVHxQffZyzINHywjPDgrf+BeLpGM7BnInU3vjwWTW0soh4rm23+V
         XAB82GsQGpZQMpUxt5UsQsSobpLM5aX45jgeLhSpFDY4ec6TzKboMBj4H6qiTJCa530Y
         xFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268976; x=1791873776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=My1PIJVgQpM5EU1o0KTJuSzA87j4uP83Hs1j1/0ESPw=;
        b=VJ1Q2VQs2Ny/j1aQjN6mCHmAcMNqVrABROVzFGxciEIICWQR2+xXbEQAj0BBMnFXmN
         NU3bqDvK57hRVKcAmjSh/VOyg/r+fjqxrfzN7cragfmeNws9gJD4XYi85pPegwLnGiYY
         3FVmM2X3+QknG/zoXAgMNzjNPe8kqj4ISAPhAT/gfFNv79WLdvAjPHyIgFcCMZ1itdkS
         Kax0GyaRTxcZMV9qiXQdDUlZUrFDBJ+Bz4sRJPr1UXagrZGTxY8soOkrGkJMrufzAUoD
         PTDHntuZHjcWZ/xkDBrzrGKiZe3CIMHXHxYFAIL3lRpvejWp06FJLflxRbAw5Ipqpxuq
         xPDA==
X-Forwarded-Encrypted: i=1; AKwUvByf5TzwJH4Tio5BNC/eTO2mCJp5y401y4oBjb0RbZPn9CKGcM0kzcx/8EpeEnTS2r0hl0QWGBWSjv4ou3Ux+6Xl@lists.infradead.org
X-Gm-Message-State: AFq9FYIZgImiycM+YcT8I4hGLIjkA+8qu/MLKPHuZUpNM7BpSrL2JhhC
	2xk76Cpnj64wxEbGWW/N4i6/BbZ0m/WnXg98BfWNdVb3rkYgoZyIwdwx83Ol6xg1
X-Gm-Gg: AYBFou0GWfFJKkEB0uulkqN7WtjEXO0NGipuXQ35jkk0zw8VhrVJvdVVmTk644jVEsO
	Ml8K/2admi8Rb4aUvAW1MphoQjNc7q1mRBLbthyQx0q0yfkj9pWZiRkYCjIOe9db3gaJ0JxekVi
	dJPg4QOcwx3HrKrPdRzPGAOhe0aSSvd4O8gJRwI+l4rTCtq+SJaQEUa4vnfkdcbXhCxMN2X/Ym6
	Jxc1i2Lct9wCvy/EURHj5MpsyivdzRB9UUpqOjr/guPhmC6T5PNCY16jm54c/4sit+ADFm2wVcb
	xg/BQ95vKaZn7J81Zs02DDRpsJ4ZnAwEIgGQEaUS7rCHmj+OWH6Ukfqv3dQH+C8Dnmj8zHvpNEg
	HkEnILpE0tXTCNGzqUG7r3QMkX/Fn/tnb35Hq4hikjqP0O4e5XmysZOp5B/idMlw15AnATSy7Rr
	h8pufOe99Vfi5iSIffNl4IT7Gh92idHdl32hZINTG0KVqmHA4AIcm3Sakkg2b9Sf6o9RZy5Rgur
	lNV9CBT
X-Received: by 2002:a05:693c:20cb:10b0:34a:c4e6:27c with SMTP id 5a478bee46e88-3514e2a5347mr444919eec.18.1791268975568;
        Mon, 05 Oct 2026 23:42:55 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:55f5:25c3::3c3:b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2c991sm4617347eec.14.2026.10.05.23.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:42:55 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 06 Oct 2026 14:42:23 +0800
Subject: [PATCH 1/2] dt-bindings: clock: mediatek: mt7629: add RTC clock
 IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-mt7629-rtc-v1-1-e556386df816@gmail.com>
References: <20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com>
In-Reply-To: <20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_234256_520039_103C1934 
X-CRM114-Status: GOOD (  12.70  )
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

Expose the 40 MHz / 1221 RTC source and the RTC clock mux. Keep the
existing CLK_TOP_RTC ID for the 40 MHz / 1024 source.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 include/dt-bindings/clock/mt7629-clk.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/mt7629-clk.h b/include/dt-bindings/clock/mt7629-clk.h
index ad8e6d7f0154..aa94a398ae05 100644
--- a/include/dt-bindings/clock/mt7629-clk.h
+++ b/include/dt-bindings/clock/mt7629-clk.h
@@ -115,7 +115,9 @@
 #define CLK_TOP_CRYPTO_SEL		105
 #define CLK_TOP_SGMII_REF_1_SEL		106
 #define CLK_TOP_10M_SEL			107
-#define CLK_TOP_NR_CLK			108
+#define CLK_TOP_RTC_32K			108
+#define CLK_TOP_RTC_SEL			109
+#define CLK_TOP_NR_CLK			110
 
 /* INFRACFG */
 #define CLK_INFRA_MUX1_SEL		0

-- 
2.55.0


