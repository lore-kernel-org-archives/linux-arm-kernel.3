Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C2BCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSZ/gXDOHxG9VvtIRs2yHB3ZSsRLqGiGUtuNcgzCuxo=; b=f5hT8xbM4SNANu7WxZIBnJHbJF
	1//d5C34iMQ5BSD2aneUGQhSMkG7TpUjXefGUqLKXF6pgtmKqS0KqIkF7zfWUFcm7z/0FCRuXhTpE
	xn8oe1363jwThdrEr3DGX6xDEytzIYSR9f0W0VqmdhQhPDsf4JkwUWkUaqQdTzgd5ITykUv7D+i9H
	RblgVjWPsyspuF73bRfVVtoMlEEvq1q5n9pucIm6bUtGHWa4+2axSMxgB07Y8x8BCciDSpjVDc9jJ
	pXaz4Kvaoy3TpHEQGzCJ+lpTbiVdCG+St2722MIvYhPDTD/HvJ87jRxCurnfrEVcN3ZW15Xctrto2
	3etuk4fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV4z-00000003AFR-2VaW;
	Tue, 29 Sep 2026 10:28:57 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV4p-00000003A3D-0wVK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:28:48 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so14225455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 03:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790677726; x=1791282526; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BSZ/gXDOHxG9VvtIRs2yHB3ZSsRLqGiGUtuNcgzCuxo=;
        b=p7dSRkL/GY+Vb5JcljHi0eQIILkTaR3VdRMQhdKruT4wp7e0FG0E2Phdo7n2viEsVX
         7jO+7RJo5Uh51DSpP38p/Yf+g+0Im/za6ZVIzJDCr8j0hwdhXs3+yVAJUKpCDiCxCuCo
         nW64fWoyGzTrYKiS0VF3SZTa7sHMTsbvgaZBaZ9zKYS1ThOgVGRA+fQwXP8NuT74viCa
         fDp/KmipRyo+EUZtXCvGnRnSLCdfKqTL0khXWihCBPKxoW4wQKVWq+G/OmnBQYxJ9+jL
         G+sgTwJG40APp0DY4uw3j9bY3PPCB6rqI5AFMnU63/JUJnZ2CmsWmPN14iQUmVRqSlPs
         xujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677726; x=1791282526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSZ/gXDOHxG9VvtIRs2yHB3ZSsRLqGiGUtuNcgzCuxo=;
        b=1vnfOdxbukmSQ7wnVfxCs1PH+rhsRHaliKfu3jr0tTAgMm7yjXBlKxUiQu5bDw0WKM
         f/W6Ed/BSUI84pXFj3y7bshUpr6yMdl8SfBOUqICw/ri4JI8FP0kDoBG/BqCKrVWrdEj
         pWA9HRyb/H6jCndk29ga8r3+G1/4dpFHEDSrOqX8eYuONWEhB8nalmkT8/sLv8TICdPH
         gPYsQc/oTcopeFOvrDuDuKfWcK0rosKdzgXFO+RJ947oaU+cHt0advgZ3ORmK7G61/ZB
         Nr9UZhHz1DoeYRd9cHBBJZqW8hXGxmBZUpjWHO3vtGne3zLpp+t+zxeBeKu31OwEw/WJ
         Joxw==
X-Forwarded-Encrypted: i=1; AKwUvBzbLua2QWHMOzFqQ4HT5Vc79P8q2hxEn0uHHgejk5waDJFz/1qD59ifT2FVmgwbS1NW4hqkj57z3okxEw7xQZPm@lists.infradead.org
X-Gm-Message-State: AFuF++nQMSgoptqVjlCprJ5c5/2VDAyK57OCSpgZ6WD91R9CAzIoaOMH
	Ib9Y+oD+VKf5pPcUXGlGmYaXvh7xSl6GcqmMCfLbPfOuJklogNJf+9lwH0D+9ZEoYzU=
X-Gm-Gg: AYBFou0Y0lR42DxCscxw5ZMvstnh40IcXJVgkYL+S+4PBgou7bs6zgYAuLZLLbj6BX4
	NLUwgAz+eGZEbmoV70pjFWImJFZELXH8bo4YyAZtO6/j8NoPIBUW9T00nVQ5f/o4pDT2kSvFrNE
	2fQWYODUigQtd3yA/1B1G68NzJU0qySn6cWY6hG7Js90lIMXvLNWl+reQNeLccHX0XcfFkvNz02
	MvEvgzJPSpUtPjDu+v9abF7s0SQHTRPtFKy2HZ1BsT523e3n+1hWDkZXSFMM/PrRVbYZTqhU4G6
	x3FEnsZ0fH7jm7wqezmaLL8gIM3g0B+8wX8wotOBVcmC6xzcpVFmtTukBDIOSb1mntyU74fhh/2
	YMUDIczauag57f6gW6FAQHZ3rl1cEh/5ySfWtBa1ThH44QBKpWuwgJOiTiBSexdy3cZzYLc+B9Y
	0Zz+sj2pSRYyI5YE0/4E0xocAadCVGacXs0O+F98BTZI3/lNLQa1qQdFBQ8vz++skH1sINj0QHw
	usLO31hmLKJv9zgxw==
X-Received: by 2002:a05:600c:a08:b0:49e:73e7:888c with SMTP id 5b1f17b1804b1-49fe66c8a3emr289485105e9.4.1790677716604;
        Tue, 29 Sep 2026 03:28:36 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm66579305e9.15.2026.09.29.03.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:28:36 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 29 Sep 2026 14:28:18 +0400
Subject: [PATCH v2 1/5] dt-bindings: soc: rockchip: add boot ROM download
 boot mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rk3576-reboot-mode-v2-1-5a34ca72065a@flipper.net>
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
In-Reply-To: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Shawn Lin <shawn.lin@rock-chips.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964; i=alchark@flipper.net;
 h=from:subject:message-id; bh=q4j4QY4leyzrLjrQxisvqoEVE4/IisdbZD2H5tvHyPE=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtnnSxWWD91pz53CYh8tEJyStOv7gqYVyyf5PzVjlrr
 Xs+ly83dUxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV9v8YGQ4ZW0svarESvfuy0Ulrrcjv1b93zzsscyboaOf9B4WPDkgw/LP7XFI
 U0rP8gUaIUFOywwwtRY/Ev3F/tySWzU5YpfeglBkA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_032847_285688_952DAA9C 
X-CRM114-Status: GOOD (  11.45  )
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

Rockchip boot ROMs enter USB download mode, commonly known as maskrom,
when they find 0xef08a53c in the register they take the boot mode from.
Add the magic under the name U-Boot already uses for it, so that boards
able to request it can do so symbolically.

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 include/dt-bindings/soc/rockchip,boot-mode.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/soc/rockchip,boot-mode.h b/include/dt-bindings/soc/rockchip,boot-mode.h
index 4b0914c0989d..88684f4184df 100644
--- a/include/dt-bindings/soc/rockchip,boot-mode.h
+++ b/include/dt-bindings/soc/rockchip,boot-mode.h
@@ -12,5 +12,7 @@
 #define BOOT_RECOVERY		(REBOOT_FLAG + 3)
  /* enter fastboot mode */
 #define BOOT_FASTBOOT		(REBOOT_FLAG + 9)
+/* enter boot ROM usb download (maskrom) mode */
+#define BOOT_BROM_DOWNLOAD	0xEF08A53C
 
 #endif

-- 
2.55.0


