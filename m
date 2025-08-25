Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B05CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 03:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzpj6K/NK0lfU/oddIPqECK+bzvcazxbWbGc3Ogsvo8=; b=A5P/+ewVJFhQPCUZyhXpfRzuet
	TCgo6jMVL80QCYVXVQPjO1ZfcHrKwVMAX6+DqDb8E89XP5RmxJLvxf/4ZZhvYCcqxIM2NuHYBTTeu
	jHpIGOni9lzN211A8faiC9VxlQRqI4W8R8QXPlh4j4dscjFxNoqnoSc/CWLz54kuXQ408mlkLNpVU
	J5ts7rBq7WnPYLZJvZIBxFwANVcFb0Qzoc0uqVIK1F43f1MIlOH4B3tKmD0u3hnpL518AsaNWKjyf
	ctV0UO6TDfWNvWTvBMPZdqZ1Ts9OMvthmtYSsKya/oCHM/Asvz9eMV/3+kkAFaOMkzpAspD5xyRhB
	kHYB60NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNaA-00000006mxv-2h8Y;
	Mon, 25 Aug 2025 03:09:18 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNN5-00000006lVi-3Yx9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 02:55:49 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4b1098f9ed9so28859991cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Aug 2025 19:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756090547; x=1756695347; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzpj6K/NK0lfU/oddIPqECK+bzvcazxbWbGc3Ogsvo8=;
        b=K+kOiz2LonBdKW0nqs6cTmWWRA3bRmOUe45gET0bRIYXaMf9+qPJFwqyTnOOZK5/wQ
         KuVoGNsyjzULz2vgHsQJQsvga8QT82l0hCXvixu2fkV0QHuKiMtzuMiLmpiee3HYS/vl
         FhKsU5MEppvJtS8xpiENQ1ZP9YgM2It7/C5wOeGXNQNdpSRxoD3S5Ij/z0MzQEb1bmpq
         E2eo6EXnxCRLNhXyyUwfGm3I5WucepIPDFg2S04V8RAbJEKB2AMQIUtga7+fndf7AhoC
         heowpb2bEgjwRmNriQNo3T3OjT0w8TDt7g1U5C7f9KXMFxvGNIEicleNs9feoDK2JAlo
         34Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756090547; x=1756695347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzpj6K/NK0lfU/oddIPqECK+bzvcazxbWbGc3Ogsvo8=;
        b=iaPL2IDELz+3v77YEDWY5bXM410emISW1+TTp9iKrgsr8p3CE2HTGR1CdrDssVU7gV
         M41ieqoY4s9W08960ipv6t1EL0hUNL53geYKp6d2krdDn1Bb67NzC2nvhEwwNikuZ/yJ
         z3a21wC6qqNUKVOssCDI4ZQRi67mnZ37oPGGKOpAphyfV/fh+52cmAco7f7m3XuYQBa8
         imM8Hl2TCc+/w0Oz4HE+YlWjQvMxOHbnlEEA5vx2r9Ojm8iDOngpdc36qGMBy73kej1T
         vsEgJZX2Bb+SDJpmgCOt4j9b4Bde/qYB3j1zNZcs5qSTEzZ1+n4s+F5/0MlbqEviNOwd
         sVAA==
X-Forwarded-Encrypted: i=1; AJvYcCVpjclh4SfuekkMKI02jTo3xG2N0opQq+ze2XDpHbZ+jDCVgvq6Ak9BtL6TRQRWucV+z3D+vIuiZgWkJyq8y/Iw@lists.infradead.org
X-Gm-Message-State: AOJu0YysW7c1vH1l0sd/sJFr94HN2R6rl3yq8xnTvUENP7dlwNRiYToo
	Y2Qj/CY/3/NMUnMZlVOrdGrb0H8TTchwOL98Braoa+dI+FLkDhsmSah8
X-Gm-Gg: ASbGncvhCkjdLMqITkF7rwR0TnttDDJ6FDLnCMYOQFPsFZUBzLTUpXyjt+K8sDnEIdA
	cUA0acBG2Q9vspPBj/iBFe0qcn9Fq8LM1wMhXOwNiO8FjLA7CPhWqGeqljWtkoi2Ay2k2gbyHbg
	hX8UyjT/VCit+pWck3UMIdrwBWkzJAtfbbY+1eLAoJmXtBQVbSUN/uROBZE58ncHvvRv6/+/1fO
	TDnc76U6AAQiLxLdNcZhgiDBpr6mZFj46r6FeHN/5i4gfmJe2W4No+vfM/U9ZLRJm/wkEhnRxlt
	nibsx4txVTH+VDZKoOqtN5BMvRITnEcIsGh9lYDjaTEVgyY8S4NF6hWwZsAP9DPd73PLVsLhNEM
	olMVGjz1+g1OmTUnW3dHGRnuKALz9Cg==
X-Google-Smtp-Source: AGHT+IG5/DhycIBodT+LKCjopALmQuIyavcR0PAsa1w3+0elVBg4MOiYitZhsEpotEOdtxeixBtpJA==
X-Received: by 2002:ac8:5dc9:0:b0:4b0:6ffc:e0d2 with SMTP id d75a77b69052e-4b2aab20aa6mr116269011cf.44.1756090546683;
        Sun, 24 Aug 2025 19:55:46 -0700 (PDT)
Received: from [127.0.0.1] ([172.191.151.57])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8c61adcsm43970491cf.5.2025.08.24.19.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 19:55:46 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Mon, 25 Aug 2025 02:55:44 +0000
Subject: [PATCH v3 2/4] dt-bindings: clock: exynos990: Extend clocks IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-cmu-top-v3-2-8838641432dc@gmail.com>
References: <20250825-cmu-top-v3-0-8838641432dc@gmail.com>
In-Reply-To: <20250825-cmu-top-v3-0-8838641432dc@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756090544; l=806;
 i=wachiturroxd150@gmail.com; s=20250825; h=from:subject:message-id;
 bh=NIyMpKHBZUuqr5ne5L2t7WiYe4nHYXRCk/VKYE7gmyk=;
 b=OeO0Da11Q8lGEHcQ6UoFPu50yHKr9VuWTwjnww1KHCg16TAziCL/MI8cEFZ8z6t4XB5kS6E67
 N1Te+lEvVrfC6uIi9aMAYQVvxmbiSTLQBsYa3MgZZ1zdAZeoS6u9n7M
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qZrip2idhSTNQABELWG6WKCrg9xOKep//pV9JGKmW5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_195547_918589_764B250C 
X-CRM114-Status: GOOD (  10.21  )
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

Add missing clock definitions for DPU and CMUREF.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 include/dt-bindings/clock/samsung,exynos990.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index 6b9df09d2..11bdecb19 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -208,6 +208,10 @@
 #define CLK_GOUT_CMU_SSP_BUS		197
 #define CLK_GOUT_CMU_TNR_BUS		198
 #define CLK_GOUT_CMU_VRA_BUS		199
+#define CLK_MOUT_CMU_CMUREF		200
+#define CLK_MOUT_CMU_DPU_BUS		201
+#define CLK_MOUT_CMU_CLK_CMUREF		202
+#define CLK_DOUT_CMU_CMUREF		203
 
 /* CMU_HSI0 */
 #define CLK_MOUT_HSI0_BUS_USER				1

-- 
2.50.1


