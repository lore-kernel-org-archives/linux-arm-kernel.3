Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AA0C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 11:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QyqLyGoljlA8lLDgpfeeDuyVTQrzc1QyULf6gL8NNgk=; b=CI5UgsrfN2V/eL
	/B+g/TQjTt98OYiqhsriavdz93bS4PTo7Swla0nkKNP1+ZM/4qsaxCtXb06Sus6mLYHvtxP40qJcW
	oj+qDgZ4UigV69sHV8v1mH+ufBGbNSyeML5pCuVKJgk7W46i9SAlfW+Q3Pl80rDShS2PzvQRuSVVj
	nG1qlgJWyiKSGxO4C+yeTLAj17ftv7Z7psWcyqL9X37XRJUZ4CiXjLK2DyXGefqmtKnkHWKjPqcLn
	roURGzLDWySfdWXN4zkNJERWoyHNmEh7+BeHPvP9+kYkQWXol/b46M4+aUPqiYh2t0zR9Fn8cRdbP
	eh3U5CTeG57jOjCmLSaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnt3-00000007vvh-3Cfi;
	Sat, 22 Feb 2025 11:41:37 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnqb-00000007vW7-17ap
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 11:39:06 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5dc5a32c313so567935a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 03:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740224343; x=1740829143; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QyqLyGoljlA8lLDgpfeeDuyVTQrzc1QyULf6gL8NNgk=;
        b=KAk1qXqBgfwNSpLLgpBh7YdeNfmDmIaUlWhheN1QuM4xiAbbjUh58o88CdyqJkZE55
         NSZhSgrdMzj9x4fRn4goDZ2huKSa67/3E3aSehbeXLuzQ1HiMa1T4oWPLMRX5CszH9Vs
         0rIQhHvsmLVidnkgRnwpxB7HpRXM8Zc0JOLAwNFtg9B8oXx0ZreNRdB9u5rs4YT/zSE3
         GCyZGKBsRQJDj311Fd2RsI1BBl2zs12XwwjvvWQdY6XKNoL0NwkJCS/8bA9c1zMIjaPd
         dM8FimwNK2s9v03/meTfZVfsy1rMSIOCJ1/WUArwveAT1lhoVxpsSi+QqHgSG6hE15gz
         GzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740224343; x=1740829143;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QyqLyGoljlA8lLDgpfeeDuyVTQrzc1QyULf6gL8NNgk=;
        b=vrXFRmSt2GT88iDofZaPfJd3LvMnRgg05lvc4GyFhCgDocOU1trND5ttoz6ck8nOGo
         16ImY6fdqWf+42pWwvmPqwFHFB4gNzZxLKdq3dAExIelAssqvFLGzXSxxfkX03lzytiP
         mnrMq4y804ZGrVMTXaITGZUx2zk+LTCZu3WqmBVUMFFBuRYa/M8iRVouBbhZ9PLpqVVk
         0CfOlaUYOqqV5EuoJvttu1N7ix62f2rAIHLd+y2XJ+WwOA6YDcD0ZplL9Ge/yvOQddAE
         WP86FHPqCsBMGXNU4zGZ2FD+q1C0Q2gxgwtj3OmkHiXfmxmWFYTvakk4QPmc2p23sbyA
         p1Ww==
X-Forwarded-Encrypted: i=1; AJvYcCURXdKMvtd0/pzKVThhaTdDnG7r6jGK9PXaHCXepv7BInsKNLOKsOEXc66hYsS40u6tf3Y8noj96Qj6IIKL5Lo4@lists.infradead.org
X-Gm-Message-State: AOJu0YygcR8ok9M8KqOvp07IRXuSbKKdl27/9WYfqSpgVYBPWSYD64s/
	NHqKqa0NkC/2uSoIJPru6teR9ZXoOYhPCXdI+/7heM2xBaU4rPvYSISL84p3xv9laRwjYPhDPm+
	fVVs=
X-Gm-Gg: ASbGncvFxBorfEwXC7PpAW8e7SfhqQTN46XiuJkPzISusYVcJurX3G91MOyRUCofofA
	+UwojMir7Nt22GzJqyxyW1Y7l0Kv5/S7ny2JpsJZM/MrB5C35580sm1gDQo9jKGKfdhfXhfDi2V
	9E61LJnTQzEKshnbakqow/Rh8vrOBbi9tUe6q3TvinP1CV4veAsM13ri3A2Yr23vsaY9u7zfI1s
	JplTt7X/PCxHkebpcPQdk4pRxBFcrWU6y661dcLt0UzRwT8SimYixaVgRhnNsKbxgpuWFhoGvQb
	Ojp2lw8OfVMD+ijMDWa2hlormIF5nxKWSK93NVYm0y0FsJ09mZJGS7O2zAL0PGi0SywNlO7DHNM
	a
X-Google-Smtp-Source: AGHT+IHujKTVj/r91Ef/aaopjdtssNonQEGvU9LNR6WW5J6HQjMTi1TWlBVXqMMYeJjAstJ/4J7egQ==
X-Received: by 2002:a17:907:9722:b0:ab6:d3b6:d825 with SMTP id a640c23a62f3a-abc09a578efmr209735266b.6.1740224342670;
        Sat, 22 Feb 2025 03:39:02 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9723a559sm1202702066b.96.2025.02.22.03.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 03:39:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/3] hwtracing: coresight: Minor const fixes
Date: Sat, 22 Feb 2025 12:38:56 +0100
Message-Id: <20250222-coresight-const-arm-id-v1-0-69a377cd098b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFC3uWcC/x2MQQqAMAwEvyI5W7DBivgV8SCatjlYJRERxL8bv
 M3A7D6gJEwKQ/WA0MXKezHxdQVLnksix6s5YIOhQUS37ELKKZ9GRU83y2aJi6FF38au9xjAxod
 Q5Ps/Hqf3/QA8z9pIaAAAAA==
X-Change-ID: 20250222-coresight-const-arm-id-f54214f68125
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=634;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=STGodYbtojpRzBwDBhIkXxC3zzCqdL+G3w+jmR/EteY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnubdSbtcWbGeUk4k+qC4pVWWcIjCt+1IVka5op
 zJGB7lwLXKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7m3UgAKCRDBN2bmhouD
 15OND/92EHwxbamqEoVNKc4qIcj8dgQSBgErtstBlguPoSdbV7MOzkQgiq3/N/eJKW0dE/2PszG
 HUf2SvsP3/ILRVJthX8zql6XERxvIu95gvozOWmtyQsKpIkRph1mdBfbeJhmU6NaDGfFhyWtNzu
 eNKE63nW5P8VLwihe+m3NOy1E1Ni7CCuFht/WLfSf7hpDrWGpeeaaxvs/FTfJZBGfSz1Yp+YnKd
 H1Bb1f82ZTGsdmfbKLnqAbDQHqvX9lyxpePXDErDG7FoSGPNCNQ9shljB+Cv/Al5fXwtyVcxozR
 kZ77FEwQlbaxQMIH0ob1pCwESjG+jeSnusqjXrK9fumnyzwZEKLOIXOOa1XLVWOxB4If2IdAYur
 TPlwUx5JS367jjYPCkhX7L0U31qJLPcp5J8nNHT4ynI8h2DfDGE3i8E8pengZL6qRkSDScnGfFG
 OfS4jgKB+sPGslXx+0qY7R9oFzZlhsRUrnndKfWyRKvyE1Q1l8V1MEBRKHTg2gRXaZ/zG8Uad4k
 SKywDiQxS1KsIpvVzXzlJLSpegj1yMbQXOn4f2LcHG56ZCCpn1GBstWrP4ET+H+/ais64N7rC7Q
 DvbH0hucl5sioCDof5cDCT+FrAGYYZ0HiGlwvjW3ysD5v4lkVkHsLlmpj+EAV/RKC/LpRsUhTQ0
 R/Jn9iSi/hQ8HaA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_033905_306086_56D955DE 
X-CRM114-Status: UNSURE (   7.69  )
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

Just few improvements.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      coresight: catu: Constify amba_id table
      coresight: tpda: Constify amba_id table
      coresight: tpdm: Constify amba_id table

 drivers/hwtracing/coresight/coresight-catu.c | 2 +-
 drivers/hwtracing/coresight/coresight-tpda.c | 2 +-
 drivers/hwtracing/coresight/coresight-tpdm.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 8936cec5cb6e27649b86fabf383d7ce4113bba49
change-id: 20250222-coresight-const-arm-id-f54214f68125

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


