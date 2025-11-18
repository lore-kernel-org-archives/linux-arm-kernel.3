Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2025CED240
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 03:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+2VIr7Itu1MVUJ9/b3DX2jYqIGQ+RMtUXX9ci+sIqFU=; b=0MAS2RZi/x23uhhujIA9r93CmQ
	HGfdyP0TO7u+jub16zhQROOidpNWIvC3SsU4uYdkLUxLwYig22G0/j9jMcrdjCJdRuQj3SYCZ9FuG
	wiM7LxT5bJY/ubpBQI6LGefP5UhAK9kEn0WljwNNB9Vhj5sDY6br4rJwyw7x1ak7mLUr667fZ+gJ7
	IbceXqmYXQM6Ea7wrzxZbVLVl6/b+367zLa7BKBCOycAvetK0h8R6C8BeKdgTN/xAz6c0BVe9f3yb
	zXDfgiN1s8xi+TmDmLIz5NcHIOpENtegFr8VkQ/K7AtkB+A16LAGPDlrrlZdTLWe5Tk/k5HMVC1yf
	Va//V7rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLCR3-0000000HIsX-0O1n;
	Tue, 18 Nov 2025 03:31:17 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLCR0-0000000HIrx-0MXK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 03:31:16 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7c6da5e3353so4178660a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 19:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763436673; x=1764041473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+2VIr7Itu1MVUJ9/b3DX2jYqIGQ+RMtUXX9ci+sIqFU=;
        b=tqdlg37DNOcLqEMKryvCGdNDHNQ4i9oczh4VTu55+1TkhWVoqp73vQhsJPn0qGeYnW
         MNI/Y6sITo/nJU8Lb4q3ZQKawHXLYdbI8qTJvcP0IS917FL15yNcad+mGcmmE6O1xf/1
         1nvEgwEvIpJTjPZE/+JA2b+hcVdVAGDKFkSFjg8ynRtllx31rK4Y7OOlSehcoKXC1tAv
         DCaRF+KFyKGxIj4G1PfOAC6D1M/0zJsEI+JMTyOYcHm2ydo+R5whM0IzrTz0kDI/X0mz
         OBVuvG5RHjMXnTLeenWXZ4QUwFp06FMyPqhtDP44PEQWch0DoubR0e4GvRy039NyU91A
         1ZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763436673; x=1764041473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2VIr7Itu1MVUJ9/b3DX2jYqIGQ+RMtUXX9ci+sIqFU=;
        b=w2QUcNeWgUNPmk9EW3eb7eap3jWs0J4EoAmMT1AFgnTa7y5Fb4NmCSw6AZ0h1PoBvG
         +KJF/w3PFw13k/m944DKOdAmyC9dSGtcWndxs6g/C+gfrylxYPF1eCbxDqRN4gQ6iFeA
         Ln2feBdkADhcGCOlFP3lT82oJZ4XYr+wvPHyAZK1mJUYavR+975fUloWklaSR7F0rIiK
         9KFnlhZ4ZRnzq+zDG+NzL0iAtpQ8iNT8FBrWcpBVrrXGTBksraSw6u3r3MuKGUBWbF/6
         DTTlv5QxeAXfYcnbS4poYDy+nnXuA4zaGuDOugprgPw7UAqOQpHvpSCnWJtn+TGAjxO+
         4Ofg==
X-Forwarded-Encrypted: i=1; AJvYcCVdg70RbS6TlfdUCTKSxxI/98wqwfhpcZ/cWGKaOSl7jitHUIrle2Aw4/y3wM5lYi4i3ljEXxCFgyOhgPbVoNN4@lists.infradead.org
X-Gm-Message-State: AOJu0YzgWdYvffKxUvsYwlegg+l6+vKYcZS/4NiprjjeU54bsykQU00A
	PtLRMHFnwRqv/n6fdzd6kC1UhbbmvJFQndRHpY5vcluoNStMGkuWY5NyvF4nXEat0ZUqC4Qtqz5
	jDUMN
X-Gm-Gg: ASbGncuSE2TSGrtFhji+kKc+7pqP51yeg8zw4RDat4pEEHlJROTKBubUHu5sBKu64Ej
	f7JqLXIXFWkv6UEyQ8D4ib44iBfNMNfe9WFOCDq+HCB1uyryzSpV1nsWYber3XNSJwMAcCPQzXT
	UAWDo1jfROkHX8L+aRqRyEPnzweuq6JSw+HtNPBMi2PjpIW8BXGrTBiBMTzXHdVWDZjdmsg3KXO
	S1Aa5S13vLfES0lXvPTLk53BRuNjGHofQUnyTCHPkdu3jlDO8juTsM6l0ObtuQQBxlnRogU8xML
	5sAxYsxQMxoVAbkYIRg9tk6/noDnfRq4pSW/YC0++GRcZj/b8m4UnNncQ09JneZeqlX6/fMiM/I
	W588JX1uq18E/ocHrBcrdkMwyiNBvSR0jSexiea9/40SrSt0xBCNHy4TB6PtYXUoZmyi7hCjBCH
	t/U2QtgH7tiMPE2vm4x6KXoUj/Xph1f/w=
X-Google-Smtp-Source: AGHT+IEMHqQdc1INNBQbtxgj3o3MgrbPaBCaNwlBCSHBEht2hzwf4u6FgeGrcMSM+vy6VZtOTMmvqQ==
X-Received: by 2002:a05:6830:448c:b0:7c7:69c8:2d2 with SMTP id 46e09a7af769-7c769c80f47mr3600708a34.13.1763436673018;
        Mon, 17 Nov 2025 19:31:13 -0800 (PST)
Received: from localhost ([2605:a601:81da:7100:264b:feff:fe59:d7f7])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-7c759cef21bsm2585506a34.16.2025.11.17.19.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 19:31:12 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mailmap: Add entry for Sam Protsenko
Date: Mon, 17 Nov 2025 21:31:11 -0600
Message-ID: <20251118033111.23382-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_193114_139235_3E7D61B1 
X-CRM114-Status: UNSURE (   9.39  )
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

Use 'Sam Protsenko' as my name consistently in git-shortlog. Also map my
old GlobalLogic email address to my current email to stay reachable.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index 3a3ba16c2601..9901716af12c 100644
--- a/.mailmap
+++ b/.mailmap
@@ -691,6 +691,8 @@ Sachin Mokashi <sachin.mokashi@intel.com> <sachinx.mokashi@intel.com>
 Sachin P Sant <ssant@in.ibm.com>
 Sai Prakash Ranjan <quic_saipraka@quicinc.com> <saiprakash.ranjan@codeaurora.org>
 Sakari Ailus <sakari.ailus@linux.intel.com> <sakari.ailus@iki.fi>
+Sam Protsenko <semen.protsenko@linaro.org>
+Sam Protsenko <semen.protsenko@linaro.org> <semen.protsenko@globallogic.com>
 Sam Ravnborg <sam@mars.ravnborg.org>
 Sankeerth Billakanti <quic_sbillaka@quicinc.com> <sbillaka@codeaurora.org>
 Santosh Shilimkar <santosh.shilimkar@oracle.org>
-- 
2.47.3


