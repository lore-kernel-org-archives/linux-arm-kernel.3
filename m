Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792A0CAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQINu9fJW9+xt1bW69VqgmZeDthwxC6ZybeJa/0e4HM=; b=JgUDtG64jf1sWZyISplhGfbXNF
	D0b9gdWUCxz1K7PHdaVz2sFoGomx6FuPNqImyrK8/9ni485t7pcqrrc9a64jk93CDYW9x4zy5RgXV
	j9C//byZLX9opk8oaP/bkcwqDlOW4W+w3xuyaM6WOxdKk57tagikr3G+qftOyfYdePlYdpgMdIhT+
	iE8n9uAK6M2DbyPUTzLAc3ChYX6abrb1mW0ebjGcRKFrsN1V34qLF/Nvy5HPKt7I3PgIv9buDNccJ
	FptIb0fqlry0pg3GVq/yKWipBr4Au6t0kKK7D8nrZ6Xo7bGHJnW2j4Dm+t0ecRUuiPywbCoh3gRIJ
	5b2JsTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFSO-0000000CdGj-0hFQ;
	Wed, 10 Sep 2025 07:41:32 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFSL-0000000CdEq-3TFA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:41:31 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45de56a042dso21741995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 00:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757490087; x=1758094887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQINu9fJW9+xt1bW69VqgmZeDthwxC6ZybeJa/0e4HM=;
        b=ce9DX1YEmGUmGXHCHy4WoAyhG1Nk+xPt0ndFDpLZmy5bo+WvisjMTDk5Yydb1aqSLx
         D8YC3QTlmGqrQdD0M/XLOsA64a7cmMQngZorQqnkX5EobbwdjDZAQBNF7s6HlvhGFaJn
         uUjWaXvqepAysHiLVVmah0AGXNuMK6iJScXRyM0+mE7oRQU/Ucf854p0PPC4fH1Aw8Lh
         1DXNdfQ/gK39Pv07PklV/62+A2Z+burmMCGbgDymKPZ5qH6ZnySfium0NmKy4nr5QcDG
         ZH1xsFKZW9pka3/vxcoZrqE04QNNXX78IpXPoum5JaugTAL1ErqFA0EWS4vDHE9cUJAv
         D35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757490087; x=1758094887;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQINu9fJW9+xt1bW69VqgmZeDthwxC6ZybeJa/0e4HM=;
        b=ZanKdqMoYUsCeLiMaZIdMV1meXUq2W37afs1QlnkM7L5obW7qFyhXZWwo1r3AGf96g
         r8+az0h8F/q7mBc3NR2oWYigdYQZRS6Kt3MZBKxnwABGD7M7/FBnbEHm8xiVY9joW9vC
         jC3v8EPBRinLJbDFasxAK0djXMbzkzUHpIhwdsSkSEJ+WF2rBUx8SLXU6Ws3vPikZ3TK
         6HOGOep6DN06gWJhkA8n/RmZAoqnvjJIii7sPXmmKtPdi2nfk3bHZs/n+knxqIAKvcy8
         smer+Rj++6Nvk5VUkjAcxVHh23E00IxmVyvfLxHwGIKMgx+U7lh42XzbzvJIRzBiLx54
         k4RQ==
X-Gm-Message-State: AOJu0Yx/nGYhtuQD7Soq9z5p7juu2Xgr6H/XMaPMfFmprvNS1fC3Dkf7
	I+gtfRjpYwxj+O4fHGPmC/BVxB4NauwULf9DLRTKZpdqz3a2SVoEbQlb7+LLBPcBnhw=
X-Gm-Gg: ASbGncvsH8Oj7inkTUoDHZA41ONmoT4Bt1u2LrWV+KxbpyJEDuuMLuTQbtgF6qKW18Y
	yu+/m7WTMX0xw1Bnakho8ovPGoJ3JKN/R5F5GMD+8yCRIG2LIpweF9sYIrnA1j5cgeL/52n7w6p
	xGNEPcp78LLV+xvFtRe2F1BQ0FqMGu55PxQp1G6ehKadwEEJCOI876uI2T18+qjw44szzVVWl7l
	RwALb4VGbbkinkNripu3QiFmU4tCgTRejYD9GdE6b4Bdj+5Q52ok2GpGFrAHOnwxq1DOKyjRFPz
	H/oPBMUhZj+9DTO9yJIH8vDXUKyvRK8B3Z72yeR+2WPvU4lAMvQVXmvDjih7tvicLA3u29GB2S9
	2/P5Oa2mLhha6RP1Zc5oGNunjr8+wAM9eEtm2gk6hVZvp/ipc17XVnQ==
X-Google-Smtp-Source: AGHT+IHFrHs/AQbTtdmpcTDbnBfFFNqmYeMTeKOdyAzndhMB+Fk7gzlF81CDMGzg4BTKrAQ7R4nr/g==
X-Received: by 2002:a05:600c:c177:b0:45d:98be:ee91 with SMTP id 5b1f17b1804b1-45dddeb8f1emr124260285e9.9.1757490087519;
        Wed, 10 Sep 2025 00:41:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8259cb1sm17003035e9.24.2025.09.10.00.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:41:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250717-fix-pwm-node-v2-1-7365ac7d5320@amlogic.com>
References: <20250717-fix-pwm-node-v2-1-7365ac7d5320@amlogic.com>
Subject: Re: [PATCH v2] dts: arm: amlogic: fix pwm node for c3
Message-Id: <175749008683.1189257.13747268542905887474.b4-ty@linaro.org>
Date: Wed, 10 Sep 2025 09:41:26 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_004129_882100_8A2E5A20 
X-CRM114-Status: GOOD (  10.74  )
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

Hi,

On Thu, 17 Jul 2025 17:29:54 +0800, Xianwei Zhao wrote:
> Fix reg address for c3 pwm node.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.18/arm64-dt)

[1/1] dts: arm: amlogic: fix pwm node for c3
      https://git.kernel.org/amlogic/c/f8c9fabf2f3d87773613734a8479d0ef9b662b11

These changes has been applied on the intermediate git tree [1].

The v6.18/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


