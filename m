Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40372CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 12:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2nJDFZ0RQJ1vXb5m3w+4361WDqY9OZe6RpHvJSGou50=; b=ueXahRimmY/QFK
	blOF7BkDp4uMS0bvh9sHllSqxGiamsBGjUsh03vkcYxDUHq6Zqp53TUz61VCaooUOLaeFeWVW/jub
	rSgmOuNkGhbgZY4ti/PzDiWm5767RfneOAHVKiPf+o1rQUGNkVdZmtRMWZD4Owp1P+aciv5ZNCi6f
	goFISyYs/V34Zl65F1S938aMfJJiqgSAVI2LiqknBNEcNw67Pg2fDaQaBmAZ8JbVspf61447wp0CU
	gX5Fd6+Ya7U4mcp71+Bp6RXt9OFNyNpoBoirrZqU+bBiv3M9w1/TN5crbfaBz7gxVkMfUFlAYvGkb
	15zq0YVv38YkNtlEcVDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYNbO-0000000CHT1-0Dos;
	Sat, 13 Jun 2026 12:36:42 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYNbL-0000000CHSd-2xKF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 12:36:41 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3078e0dcd67so2137537eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 05:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781354199; x=1781958999; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2nJDFZ0RQJ1vXb5m3w+4361WDqY9OZe6RpHvJSGou50=;
        b=NGKmx3N4Mttf8ANtzHVq65lH7PmtHjK7WZyFrEATJ8uL1CftpK/b7U2iQ143V1y4An
         qxyp41gjsRxlzGhaVRLjYFkVTss3Sn8zNKACuSj7vwPCxDyJZdYVOvW169WrG/U+sMG/
         Lsme/DF/C3dol/TP+4+0mVUQZJkhgffV438tzwaxITpEEgHa65q9Dgr+8KBF6UCRdl5E
         tfPhsIosQj+A6Vb1rmgK/IpsTr6UIDlx62g2nrnutf9fK2KhpC1/879e5HsivwJK34au
         PmSL0fz3XF+3Y4o5zPWlx4wuMZ1mjRWDLB13jgc7Cs64mjYIHQVfD4uSgJrGmbt6jac6
         Xpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781354199; x=1781958999;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nJDFZ0RQJ1vXb5m3w+4361WDqY9OZe6RpHvJSGou50=;
        b=Cn1tpxIMkX+rqDrp0tYc3vUXGIyclXwBkCiHdsw/8+8Zl0VnFWUHcEbzbJTs5T8KdO
         mM6ijtYOkJkx70w7gId6279jjbc27/jcTCNaaB++uJWiRemFInGCXIFH8qA/oNe4uuo+
         NI3a5dlY8rndCcVd31MV6SWb/QrMUzb6TkM33u4WTSCd3vUIebV6ul8pmCWm5bQuqIMB
         saoFNTvTl8xXu7iCCw4pjASbWnc8BA43iN+6nmsMQw9zXAWwcKMLEuqPH2Z7HdC3Wdvw
         YsQ+pJJavSK8yyt57PeqTaa1ZDqO9/c+kKCfos0PK8n4+1Zh0eiPqMtpDWUcQWsuGB3V
         n6gw==
X-Forwarded-Encrypted: i=1; AFNElJ+UVtmVN+iv/UFivoAuN/GeSM7a1SsCxncX9WIZob7rIpa/Z5Pa+hBWgbytsNaYq1wksOWl7MPxLQBph2Yg+VQw@lists.infradead.org
X-Gm-Message-State: AOJu0YyuL0Fb+mo+f94p3P8WMKn+cyjEzZwroiNTP9AzP4oN+vACsAK9
	O/iVHfKPO4jmdC7d6chJ17zKz/ck+Kr7uoMWhRMAR6CddZoZHAuhuS++
X-Gm-Gg: Acq92OFGf1Ds2utBwMXnOH838UDvS1h1zOwXW/uscmwqsS0i46MELYA88QamnklPIHz
	QuYpSAloQQHHUeU/b1j3jCf4DLvERr9iU+XwfaFFIpJmg0XunLdwt6q7RFApBQKn/r1lD+Mri34
	NxVZXVu92FqW/UMdw0gVf/Tpj4zBK7bwejdjNwvd7ejx462EvmWBNJcl7pXTx4+EK4nSs4BekBA
	VDqmZpaTWunUVI2m054/+O2o6PeNcAKxlapxBxhJzLWt97xLBe92lb41bzp4z+oqRnsZOv9WGSd
	Xj75lWjNljeUgDQ41+nxe0S3/PFPM/bbb6PsCj9N0QRSozuGMecxhmyN2IleE5HXEWHmLgCj80e
	NlMHpx2EKK9RzVLyAQMK3XtEkaylzm0/WToS4Jd14/u1CdCalZVV6XjlotE3vvEhlw5jWkt6Tmt
	ZJJ2MphdmPBpNxJ3SBgTk9ZToilCJP
X-Received: by 2002:a05:7300:6d21:b0:2c5:220c:5670 with SMTP id 5a478bee46e88-30935239b09mr1654447eec.2.1781354198696;
        Sat, 13 Jun 2026 05:36:38 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm9176630eec.28.2026.06.13.05.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 05:36:38 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v3 0/3] clk: samsung: exynos990: Fix PERIS gate clock
 parents and add TMU_SUB
Date: Sat, 13 Jun 2026 07:36:15 -0500
Message-Id: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL9OLWoC/yWMQQqDMBAAvyJ77kJMIBq/UnrQdG3XQ5RsFUX8u
 2s9DsPMDkKZSaApdsi0sPCYFNyjgPht04eQ38pgjfXGlw5p3dIoIRictBTsecXFYd/GMnR1Faz
 xoPGUSc1//HzdLHM3UPxdNziOE7hRLWV6AAAA
X-Change-ID: 20260613-exynos990-peris-fix-v3-fac19b879206
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781354194; l=1267;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=WAkp6NOqHTQF9JqXMs+Q8InAsPduDAdJGM1CNG6S2qs=;
 b=ge4xC/xkTrmRFZwUxQ3xLwJohhzxi5kZoo5r4alnDXRKRBCLCvWbw6d6atLzgZAkFVx9jMxiT
 ba+T7t2FpG6BvzZmRKoeZttk5pu4O0nXWqNd+GfeBywsrRv4c9H034W
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_053639_775267_B6AE9226 
X-CRM114-Status: UNSURE (   9.28  )
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

Fix several PERIS CMU clock parent mismatches and add the missing
TMU_SUB_PCLK gate clock.  The dt-bindings patch adds the new clock
ID.  The second patch adds the TMU_SUB_PCLK gate.  The third patch
corrects eight gate clock parents and reorders the GIC mux parents.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
v2 -> v3:
  - Split TMU_SUB gate addition from parent fixes into separate
    patches (Krzysztof)
  - Now three patches: dt-bindings, add gate, fix parents

v2: https://lore.kernel.org/r/20260613-exynos990-peris-fix-v2-v2-0-3dff7ade75b3@gmail.com
v1: https://lore.kernel.org/r/20260528-exynos990-peris-fix-v1-1-5b65aa7def2d@gmail.com

---
Denzeel Oliva (3):
      dt-bindings: clock: exynos990: Add CLK_GOUT_PERIS_TMU_SUB_PCLK
      clk: samsung: exynos990: Add PERIS TMU_SUB_PCLK gate
      clk: samsung: exynos990: Fix PERIS gate clock parents

 drivers/clk/samsung/clk-exynos990.c           | 24 ++++++++++++++----------
 include/dt-bindings/clock/samsung,exynos990.h |  1 +
 2 files changed, 15 insertions(+), 10 deletions(-)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260613-exynos990-peris-fix-v3-fac19b879206

Best regards,
--  
Denzeel Oliva <wachiturroxd150@gmail.com>


