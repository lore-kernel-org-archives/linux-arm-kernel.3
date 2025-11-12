Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88934CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=27w63Mz9ccc5XxoJlnWhVXxnQAo1CrV0jhbhR0EbEXg=; b=2ve9RyW1jmEVMS
	C5FzDpJP2vYqte8ofkr0x3H0PQLvgOLQ+BFps08ikKKH+U4+a7vln3Yz7JJ/oIExeN/4Ymt3FQPqX
	6/9a9s9DDrOrbqDB/Zll0TZpyLB2Bm8ddBJVp28PRaXhBdtQ66YBzQbAcr4POKjwQ3XZcJes2kAeG
	vjH6Z8DFdKgRy864FHer7u9xE8ft343QeX72itP6lFB1OUZrbhzxN66itWXA0SwRz3Th0hX/KHFA/
	SIMZHXkTEVNKs5UQFO/+hrA/yvHAgW24u+UeYME1dEd8WlvNEKFLqLq/rlxarvAjsS4tWg/CLR5qC
	HUvIHLCniOqfZ9EOeMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6Wx-00000008NxV-31Lm;
	Wed, 12 Nov 2025 08:48:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6Wu-00000008NwS-3wHx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:48:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-475ca9237c2so2880615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 00:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762937319; x=1763542119; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=27w63Mz9ccc5XxoJlnWhVXxnQAo1CrV0jhbhR0EbEXg=;
        b=p2PRtpf/IW7XK6ndnXM1DFEZYUgYH8+GiE8t78Q+nLBlAhtuRAbPKVYrEFMy99RNnF
         jhqSvm+0sZnNqExbBr/9OYbuAyuqhgJKIo6iUegv/WzZMF22dsitylkI9dRk0QWqjE9Y
         wZii/Azk95GO407Q2lZ3KojhKOF3S2+awEkm2QmjuL1aM+7PlGGVif49Wdt/4HSKN2pK
         JfQ17FpSamgoeJAXGbPhG3E1TlFlESzBZwOAmY/1UR+s5rubpU5KQ65n1/yRsK1VueD5
         1nw3Zx0ctmxnqx+CiJxZJIK5MkFiN2fMuA4SHmoVe2rcveMl+vuISKceb7PqpO66bU35
         SHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937319; x=1763542119;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27w63Mz9ccc5XxoJlnWhVXxnQAo1CrV0jhbhR0EbEXg=;
        b=ZhJf1O+rEMYNTm0S7bKL5w+yWWjmerPMw9v2/1Z6RcmdhmB2Bj+R/IM5C+eAXKyl/Y
         q7TQaYrVh7lc69+yetHRBVoRu33QfeUEzs5PJTqVzqX+eLcd0+ia6MbpXOMfdkQn18Mm
         Sbzoi2oYh0FidMgvjj8BwQvNlrBGJzrTvcf7skqJrcmlbMGoVlm6ztBL6fcYDslH0o80
         4RdcUQ4pKpEu9B80cMQg/l3C34UKqDC91wLIqRq1FrROpc8mZB5TfDE+ISOlVrDGNRJ/
         +CjOSzS1LiR/N0//r78vkh/4kszDX53cu7d6LImnO7oQio1TDPhM7P7fcuiq0a1fAYHc
         +fSg==
X-Gm-Message-State: AOJu0YwD7MetEhZL1SpN3abmE7jc/kjW+pe1VIRMt4Bij2Z8ZyN9yqkQ
	GWiovS7LFvTkTdWUq8cRVgLgk7cDb2msdvpekF7l0pS850fdeLzBgOPRqZh3ZxoLV2E=
X-Gm-Gg: ASbGncsoWrNaVDaojqvWD+VepnuEMAhWKCZNsmqgCKTW3mYHe9sD3svvjA8zH+2Lzpb
	Q7w1Ze8HQYFz7rIVKAXiQ/ePcYk+dc/8TUcnXG+omIgdu8IYxwAUdm1vzrQj4I6ERJKPmdke7Zx
	FD80NSHsqda4Y9Mzxw2ntGV50Lczu+OK5H2J6LIe1eASCxtI8hB7zfGUlmDgodfjwRMy00rI9sf
	DD5J7SIHMTQnk6q+mKrS7/mWf6+bEqNKMRNU1qc7x5xdnbt91TaQY9H/y3p6ULKI3qDRkiwINQN
	5xb4R99b2HwRkoO8Gi9HfXFjJu0+OXaVcd01RlkTrUC2YEqV3Rs136c5qgtyLAGZGytqsuxkh+i
	YrH0Gq3/t4fuVaSOzztIB3CLcP9lphH7iN7OFmv73chHywXuFP0mSjo5FYSnGiS4ai3OnmyfAes
	lDM18Zyf0fRwsmPQ4zawd5etkcLkUewwY0SxMYHD23X87dD7zpr7p+0FiY
X-Google-Smtp-Source: AGHT+IF6Pkp2SBzU7BHGsBfFVqx2Oez9GDgT/TNsMjLzGrA9exqcgbd1aqea20wtto2EL68roP/Ewg==
X-Received: by 2002:a05:600c:4fc7:b0:477:4345:7c5c with SMTP id 5b1f17b1804b1-477870cdbc2mr15394965e9.38.1762937319130;
        Wed, 12 Nov 2025 00:48:39 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47789ffea1esm3732645e9.13.2025.11.12.00.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:48:38 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/4] soc: samsung: exynos-chipid: trivial updates to
 simplify code
Date: Wed, 12 Nov 2025 08:48:19 +0000
Message-Id: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANRJFGkC/x2MTQqAIBQGrxJvnZCC/V0lWpi+6oMw0ZAgunvS7
 GYx81DiCE40Vg9Fzkg4fRFZV2R34zcWcMVJNUrLgrA7Apy4IjLMIVrTWV4GJ3utqEQh8or7H07
 z+34Cm+j4YAAAAA==
X-Change-ID: 20251111-chipid-trivial-6a7ceb9d1852
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762937318; l=785;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=RSbVXOg+8C0nJD9ShcJwOT4ddmb41onLxh0rOGHpDn0=;
 b=adt7/AjQ1uwdIeYx3p54fiNoG/+DM7YPB2T8e/yk6GrwGO6jZf7hdNUYf3xy+SldOWQUGihTB
 24qLgSwTqVzAU5RuNRBK2D2sefLgH4xnZcygwFbcLgdbdZ3D4w1dytH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_004841_016828_1D1B5C23 
X-CRM114-Status: UNSURE (   6.79  )
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

Trivial patches to simplify code done while handling the GS101 chipid
support. Compile tested only.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (4):
      soc: samsung: exynos-chipid: prepend exynos_ to a method's name
      soc: samsung: exynos-chipid: downgrade dev_info to dev_dbg for soc info
      soc: samsung: exynos-chipid: simplify with dev_err_probe
      soc: samsung: exynos-chipid: use devm action to unregister soc device

 drivers/soc/samsung/exynos-chipid.c | 43 ++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 24 deletions(-)
---
base-commit: 4b67e4c65c1e0740ac12bd0d790eb5a9d0091aaa
change-id: 20251111-chipid-trivial-6a7ceb9d1852

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


