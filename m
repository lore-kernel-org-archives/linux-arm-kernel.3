Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1754C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 03:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WhR61nr7Ljl2PHcEGBKT0kq+BKIGjpo8813I6tRUqE=; b=pFV9F9FFkCb90a++O//jng+ezA
	xozWX/nvPyusRFfssu+6oP9FCkxyZmBI5U/SU3i8nT7pK2EeGTAgCLbdWjMqx6fcflHtAuMp3+QFq
	LTnCzU/02e5YvRntrbPi0GJw88PVjQfWioBWiBInVaGcuw/Uve1BWZ9eh3UtYDELs0RKFILyuB9Pl
	ECvs29tAOZuynxV1J7pLYzSrArTZdksEC3pjjPezRo9GRrptoLJ63Ve8m92dDpJhmpcjXzxZrEyQ4
	qd1KTbQD7zPPA8ABNMYoKYG6HAn650TzSzV28W7SNnsNMRIh7GLRnjVCYt+hI+Dc0O8JXsymK2p7k
	/iMvL9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9bwX-00000008Ds0-1bvn;
	Tue, 29 Apr 2025 03:47:37 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9bsk-00000008D0o-1efq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 03:43:43 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-306b78ae2d1so4553266a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 20:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898221; x=1746503021; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WhR61nr7Ljl2PHcEGBKT0kq+BKIGjpo8813I6tRUqE=;
        b=kMUEZMBtp2LXid/PYItsknlSem17X5V9h0xrZaIpq9wKDVsjmEXpASXaglPaISnZCT
         W3nvjNgkv49XYhLcpWK+O7tFdYWlxZnB2jeepViYnjm+RX+2mUUp1mlwP26QXa2r10H2
         xqVj5SLRiu+oyobZeFT+R2w08ZO+6vca8tSVT1JPID1Va5G3o/ShSPlPJRmv4iWYBTI/
         JL8l0RT2xO6YMKewCOZEfpigMOFH8OFuDYcc/RKrkAwcdofrnODac/YWJSfnw4Cmt5dj
         IZS5YXVJkO9uVZXRZ7obpmSib62I3QDnOHBLaxX/nrA85LU96Il1fwwVC+GQHITdGjhD
         x1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898221; x=1746503021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WhR61nr7Ljl2PHcEGBKT0kq+BKIGjpo8813I6tRUqE=;
        b=MeU4Aqp0GD9qFm+oleV3GLtXwTPfS7ghfWyt5KWVOnMwKZJSXC0e9zuEOWrFHRMrDc
         3+/xdzksOEnFrNL7rCUkyieQ/5zIR/x/qUQVQMZj7Sjm009rYRhI6U3DNzqg3/6zBu6d
         T1lcMXfJXzgxsln+ASCQEzvYvFj37qIALchjWCxIj2MuY5zJUTc5fAJDtriWGGR8jXV0
         nNN7z56SgRnuDXRmV3MfC6cFSwQOXjnMNTd3bwwCBPYsWPmSLwOdxoak0GELvcr7hHsE
         Khkk/8jwDGtw4S98MzlhbvXXX/vBsZ/Eev+Gkub9EmNnWZEQFJHxMGFdKjbQAwFap0Sg
         puMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS/JUzgNM593jcmydknbjDYplqRo87MZNMkQp54c1BVycT82PUzqh3airXWnQ4krfS00RCGjVSKfgmnJRGvQsR@lists.infradead.org
X-Gm-Message-State: AOJu0YyokXfJIHaOZpPfjuNSl+6Y1+oAHFRv9l8sDNbRhVCklffAYaMw
	1PWcjUF01TGgSrSNCktTAGLdBd5DX11doUA995j5lg+ltq+kiSq4
X-Gm-Gg: ASbGncshi/FhkgHlcPLy+LPuF/oInpx+Pt3dhN9FlZzvvAy9MlldvsKGMSnS/M6xZlb
	IinFTPNxJFJXvlqKggkjyzdkuDvjeJgqK9yrL/gbPo2B5g5LKlmQZyq7/uHZOgtlCVM/ETqYzZG
	f1NWRIhO0O5sdvUGiDHQt6DEKpxvpJ7K2OrqaaefS8SQkqjF1tqfe8DlLYhj2VhyQ2XzWeqCGQW
	SB6hpiDPXyHn4gqxSiXnhTqNn0fzpLkh+ROg9Wz2xoG5RkWbtmqOaayY38SRUdkffo97JMFKKup
	XL39RhqNJmU+bs2FuL/jueYcathl1gMSSV8A4IQk6bRJKTJO9ARD5Xr14g==
X-Google-Smtp-Source: AGHT+IHxJGmiZrM+UP4fV1uraj7Ls/Dnl+1bFIYjcIjwPE9ECbSPIYWETr8srWkn7rAXa0xGoiF0UQ==
X-Received: by 2002:a17:90b:2dd2:b0:2fe:9581:fbea with SMTP id 98e67ed59e1d1-30a013bcc03mr14960690a91.29.1745898221389;
        Mon, 28 Apr 2025 20:43:41 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:43:41 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:25 +0800
Subject: [PATCH RESEND v6 01/21] dt-bindings: arm: pmu: Add Apple A7-A11
 SoC CPU PMU compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-1-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=nvc6B3SNJrX+OFSnYkWwiXKVem6neRj112hzdXP5HLQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErjd3c1yTBwKCGhxeXkedW/lfSOfnH23+dzW
 l2135x2zHGJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK4wAKCRABygi3psUI
 JLgGEACdUJeDNRMtqm3nhxyhEQAtsOix+3CT7D/67Vr7UWwXPJP2Oh+1DwSLzbn/zFkT9cugxIm
 GnSmZ4m2NYOn2WoAUS8F7cwsdDNGku8hnOj9A7YESw3yavZ6LVysiB63Iv4cSXfSxG3nB2YAq6K
 AgKxNOrluLF+fR+2zdUEkbhiV6pyZKtNCyQZPhUeRmDQXbEiBXgJ2UKA/N4pZc7c3YMbky2BSej
 +0eDrhVaQKHqmz5s+9Uh//vS8JStXzwFfiWjuD+mNFrdlf8ZKy9dZYvKJccDRO4/JIm6VLxIdtL
 t0CdhX8lL3BLVxOJ104+qC2OlUGI2K0XruyV67ivUtr915c4YfnTxYa1dY6DcpzGGGLQn3RZSxJ
 1rL09HBeggJZWWKpANaz2AHyoLthHE86+KhruR1m3MMu5+EkEgh6+rSXO6dbMnGpPVvLbFqhAQO
 //uuyVAsRC2uHgRUzt8rS0tXfx61BZDj1yK3UF7AjiVBDYZIpsPbhdD8/xO+Dn6Jj5AYISVg1y6
 yUz4EbfU4tjfQGuc40RCBXX91X8TLxf3h+pY7p9qU5NQjuNSX0IS9+JCAQPJgJdQpEkOhHFH7vg
 Kxcqt8aLrBEv1oph/C+FeG1tPYwGHeEkseunNKO83OpZRsuw6iO0sfFheenVmHndUjkp+juqRFG
 kSxUqdmoqhoaJkA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_204342_435503_F17790D8 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index 295963a3cae799a54560557137dd6b3cf4bd00f9..3726e1b78c42f150cf1dc68a6b3aa3541517c311 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -22,8 +22,14 @@ properties:
           - apm,potenza-pmu
           - apple,avalanche-pmu
           - apple,blizzard-pmu
+          - apple,cyclone-pmu
           - apple,firestorm-pmu
+          - apple,fusion-pmu
           - apple,icestorm-pmu
+          - apple,monsoon-pmu
+          - apple,mistral-pmu
+          - apple,twister-pmu
+          - apple,typhoon-pmu
           - arm,armv8-pmuv3 # Only for s/w models
           - arm,arm1136-pmu
           - arm,arm1176-pmu

-- 
2.49.0


