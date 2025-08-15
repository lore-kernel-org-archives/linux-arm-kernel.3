Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A3DCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 04:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mH9Z2Inhe6F3feuLMWx4CuDByALoPXZot7i6CuHr5Ig=; b=3d/ZTFonVQBHaaSdEJQBJtS31J
	ymhJKTdXagxUzc0iIxAPl256/LdRwqw/li0peDbJf2atawCZVuNV5i2A2KQx/f7DULFOrQnsVaOHs
	j7vVRUwBDx1Y0nMyBkasxJvWVDsapcS2bbrWelVK4PhrR1bCccDKDsnoQhtWR4RH/TDMo8b6aki6A
	28ZFwwSqpsKWaGJF9SDwbHTg9taC114u/UejJEQ/PRxoY7hoh4aeXYv7qy+i6dj+ah4uYq2Rha8hI
	7nnSSNEqS+FhWshwmVWeS7zcAYWSFrstr/dEj3/g8kLX8OiY3wu30flTEwhWVbg7/6RwpX/ZwdWRM
	d0lsnAXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlzI-00000001PYL-1o9w;
	Fri, 15 Aug 2025 04:24:20 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlwd-00000001PJB-36WS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 04:21:36 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3e56ff1c11eso7800975ab.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 21:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755231694; x=1755836494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mH9Z2Inhe6F3feuLMWx4CuDByALoPXZot7i6CuHr5Ig=;
        b=nSRXsVtWUFdQ6SqKSGkLFZ0mzxzOsDYzwmlh/dreTxfYHIZs2bT4OMvu4NqLhnj2Tw
         VhrMSCDb6WFvmUHnJDH1QNq1gp4JVxcnVStIbmcOJU98ryp1sAtGCO5cWBCnntGHIEzj
         Cy6RDeDE3olpa0HBOJE/hjEFk7bSFd3V6vRyyRRAs+YfGIs8Vk7hJAp1CvIz5jb97EdO
         KvrTEN6WwvqaEqfuueI6ROC8as0hEZyWDGAYf8s+VYSKZSRfqUr/jUbOjcb8Z8rC0yYU
         qbMFXmCvaIf4iIZIHoBOiRJfIcPiBn0ht+IAw/ZEbwXfkzDdpchzEf/YqmVbuL9rXVf9
         z/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755231694; x=1755836494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mH9Z2Inhe6F3feuLMWx4CuDByALoPXZot7i6CuHr5Ig=;
        b=gl4h953pedvbqVD7z5rJUbmmCpG/ABN1jCGnHz6I1kOz7JXMk5qWpR8dJtF0CWvZUo
         qiCd8rMesO1r0aTKNuYTwI7eAMiTJLh9wgf/f8H6S+BQpCih+QyAEiRS3NuuVt7bJQbS
         GIAq/3KPPRHnTP2Mvt3l+MoZhdb6EO1vb5JnNpQVK+h7xlNrv3cHgz0ubi52KEybW4cA
         LGx0UO2XnuUazNu+qyUilZYVY9KWMJxMVLsZg/uRIsTfruQLGz6k7hcJzeezwZxN95Ck
         9Y67B+xafbzVt7nFw8xEOiZa2I4BtYstWlE2+NU5eFOP87EzbyODsBFvWd7Nj6qS3tDn
         iQBw==
X-Forwarded-Encrypted: i=1; AJvYcCUV2u/GCa9z12wLL+f+KEUkrlwm0aStDqc5WM69lq5FTK+6GtQ4KkVVfy+0loEE2ort3RmMvqqFnu45tF+sW+61@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf5zCpa1ATIUKgbH4toU1ttgGlkXz9twOnThdfbUCeCRVNnN/1
	Z163Zk30yI5CFlqJ62c1kxRCatoxfwKkpNurErl9s2pAqgOTYVbLGrnD
X-Gm-Gg: ASbGnctHUmXW3oIR6DMr7c5e8mtDZN3OnrK4anFlcYblbMhNU238zSVGN4kw014UP9H
	nMHgQGiLhdIYsuj7anTfSP6ZyBjKjKVkwkH13dzOt+Rm/qL76jdm0a2UaSo/SQpUWEJHoB5OurP
	BadH2FQ1MYpKq/Ymfvlvk0O2jfN2FLYxFSebevdiWGi8qR0LG3/xr0GF5Ov0FKbjpAyjFKLiUEj
	6VdMeP+fBUzB6HDoMiFKxFW/c/Q2ZJK4lR4sRhcK0h3owkclrVo7fJOnuWRjdxlDB1RoQ37mOXp
	gtJRDzWYJKzQ4PyXgqvzhtojXJ342+uLxV0jzWGWWhDW6ohcvoRNSETpp3pwZFOtQa8M8DtQ/YM
	mEYNH7kcD9Pg40qW4DYnY84A2+XNFNU5eln2g1FAoapVq7L+oIGGJzfGr+6bpq1d5uUc=
X-Google-Smtp-Source: AGHT+IGUnuQr4kTd8Pwi79vrAZvrte0ZA2n9301dvRr3oMR1sAmt1Ja6G7GSU6Ymha8EALPUtkN7mg==
X-Received: by 2002:a05:6e02:1a85:b0:3e5:2646:df03 with SMTP id e9e14a558f8ab-3e57e8a63c7mr12535545ab.12.1755231694279;
        Thu, 14 Aug 2025 21:21:34 -0700 (PDT)
Received: from localhost.localdomain (65-128-248-47.mpls.qwest.net. [65.128.248.47])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e57e5a585esm1689365ab.16.2025.08.14.21.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 21:21:33 -0700 (PDT)
From: Shimrra Shai <shimrrashai@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shimrrashai@gmail.com
Subject: [PATCH 0/3] ASoC: es8323: power and mixer controls cleanup and revision
Date: Thu, 14 Aug 2025 23:20:20 -0500
Message-ID: <20250815042023.115485-1-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_212135_782382_BC3C2D33 
X-CRM114-Status: UNSURE (   8.32  )
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

This is a revision of a previous patch submission of mine wherein one
part was accepted and one part was not. It was originally phrased for
a particular device using the ES8323 CODEC, and I was advised to make
the mixer controls user-selectable so it was not tied to the needs of
any specific device. This submission brings the DAC and mixer controls
for basic audio playback on this CODEC into line with the DAPM
infrastructure and enables their operation through the standard mixer
interface.

Shimrra Shai (3):
  ASoC: es8323: remove DAC enablement write from es8323_probe
  ASoC: es8323: add proper left/right mixer controls via DAPM
  ASoC: es8323: enable DAPM power widgets for playback DAC

 sound/soc/codecs/es8323.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

-- 
2.48.1


