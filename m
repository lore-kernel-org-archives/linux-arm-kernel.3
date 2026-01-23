Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA35D6CFAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 01:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WRGD2YWjrtmwGYVwivTN08CsAVPXSr88y6f4NIlNfN8=; b=QK8Ct6UPA4hnFw
	8x5ruVm/70OEa0b0W/UcZv1qInXA3IwSfTWVDSTB2p/Iwafbejjy6qZH/P0jdr6PY9/4GWqrfVm2N
	64u+03QhmjjBQaj29rdxf3kwkE5tQeGa7Hup39m9l7FRNnRR99liMXHXt80o5+m6XSjR7tu+yRb0n
	69wYojl+nzpA0x4EKwaH46JrcZzpB80Rc9Hfl7bve8mLzs3CG/cEtHavK+gilfe09SkbbdSLKuc5B
	u+HwMlnDqDFdvIMbtbw9iyqQnDTw7ZN4gjIZ0Ooa7Gj1VFvjBRAZJhM8hTzTGKdxN1qxDP2l6bJS9
	77YY8hjbtzKpq21jpHtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj5ka-00000007x3a-3jmB;
	Fri, 23 Jan 2026 01:14:12 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj5kW-00000007x2V-3Pnm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 01:14:11 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c633984fbeeso514527a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 17:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769130847; x=1769735647; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WRGD2YWjrtmwGYVwivTN08CsAVPXSr88y6f4NIlNfN8=;
        b=zj0EJ+hQ3d2EsuVWCJP+ve7uBcJMctgyBVSZDij0OGC1fKywmpB7VYnFLcT5uQ1Qoz
         WfxRcCcS1NY/tRFrxwTshywvVyPzfC/dGPmqXU7N5HDJq+fPteY3LGwCWCqzVqLz6o43
         55/E3H8Xaz9IGWBpmujKV3SZC+rtEaF3PxIpbQiHa20bN1eUJWPDhahgYFDG4RrN3mTV
         P2ZGFej1dp3fF9AMy2/Y4lK3SqcTYqq4i/pX/FIJN8oGxQhpOxKhBjhw0uBHcofMkMGm
         BNzPvt8zM+llERJpnFkOiJS3R7aBRLrTXsrJHundq+zUzNsmj1NDV6JEdw1E3a3PZviK
         YSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769130847; x=1769735647;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRGD2YWjrtmwGYVwivTN08CsAVPXSr88y6f4NIlNfN8=;
        b=AaaRYSHwLRZkTjzu139wfK6bqWFvZYJ9GmBEPYHu5OBTBE9xPOisc81Yj3adMYHJVI
         nqSVg8IvpJtRckt+2FiyYEwx5q2h/zF+kztdwM28gNXQWjEwMNv8F9Nc+bTwYBMY0YEu
         vZBN57yxMm9eGxtBG24us5LfbfB808yCLlA7GksbF2cgzmXE4Z6J06KnpJWWgL2cb9D2
         Nzat5siANwb32yZCerVzWokHASg/0/+vvGvixi+DOA0cE8KX+LBVLeGTmFiNi2S5WC7Z
         8Zf5Fr6/YjBnTE/JSQ30/aalnmuWUo2kDwPMqNiGBhgChN0QnHL7ZJyzQQsafmVZ83kK
         I22g==
X-Forwarded-Encrypted: i=1; AJvYcCWtN24VTc67ljLJYb147k+T1phHckGrxqF3lWtJd2vWgm18aPyFmKle4knQTZs2GgUCjNSQXQZ381mWRO38Zhzg@lists.infradead.org
X-Gm-Message-State: AOJu0YzqJULPOGRU1GbcRRnhIvN6U0lJY0xVe3B8x85Pr6JsorsGzstV
	3DeQGJiGOgYXHUMC9Cp7WUe9IYtaZ4WFkGGeZRvs3lDMQySE8Ti22vUxy2rctFIoMZgniCiv1aq
	vkS2BHcA=
X-Gm-Gg: AZuq6aLGZEcga6XJ5vu7G34tZRLUIIjpTgpCj0Tv3hBF1yIVpYR0bS9paaeLTzH+izW
	Q3CwcthjRkRfrlrvY9jLJ9EcPO3f4FZo9WsYcTWiKM/eVS9sTeeClNPm0pjWx5HbiwzO5d+i1s5
	7pDIM1cYUOASRcr6qK8ta4AfBf3MWJ41Ysdsp6Vba6sdE5BjYYqGst2tIbzfylJzZpMZ4a+U3aJ
	4DGDgaKxdpJPcbAJHmm6d2/JnB53NgXjEnavcyByEopVC1vE6uEVxx9JjAas0cdZQuMREVFMC89
	BK0XNlMLH3iFd//K1XMDS4iul/h1t+8KQWtEQjJTpu7le7sdsYu5jelVQA2udMbH9i64N6RX7LL
	QPnJZjkZAPLqebx1/Nay4Q29ZPA1DRui5If8c/q5dOBnXz6FQKbJJJzrA93JPvRJJXbJ17LO7vo
	C+9dyYKoLd
X-Received: by 2002:a17:902:f54b:b0:2a0:9238:881d with SMTP id d9443c01a7336-2a7d2f7cca4mr48720845ad.15.1769130847498;
        Thu, 22 Jan 2026 17:14:07 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fda160sm3960495ad.88.2026.01.22.17.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 17:14:06 -0800 (PST)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Subject: [PATCH RFC v5 0/2] pmdomain: core: add support for domain
 hierarchies in DT
Date: Thu, 22 Jan 2026 17:13:59 -0800
Message-Id: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFfLcmkC/43RTWrDMBAF4KsYrTtBkvUXrwqFHqDbksVEHtcC2
 3Jl19SE3L3CLWkpIWQ5GvgemndiE6VAE6uKE0u0hCnEIQ/6oWC+xeGNINR5ZpJLzbV0MPZ17DE
 M0AZKmHy7QhzIU9cBKtNgrWzttGYZGBM14XPDX9nL8xM75Mc2THNM6xa4iG11j70IEOC0sI5bz
 r1xj0dcu3BMtPOx3+RF3q9J4GCd00hKk977K1r5qxlR3tTKrGlvLTfWNJ7sFU1dNCHE/qamstZ
 IjaLWXMrm/0/P35dN9P6R25p/znvEiSDv+zBXxWJ2OSN5wf7WWBWX+DmOwUM39hAb6HGE7CTMv
 cBiQDhAI5SySpZY+yrf9XA+fwHl5LjwKgIAAA==
X-Change-ID: 20250528-pmdomain-hierarchy-onecell-a46fad47d855
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2221; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=aY3lzdYo34rzzl5rEA1NOAbbPbFMvxFb3wjxISqu7SQ=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBpcstejbN/+il4BUXiOOZpRcNwNGsz74GvjwhTB
 7ou/Vz0eMaJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCaXLLXgAKCRBZNxia0/vG
 ZWeHEACe7CpdiIWB2PxK/uKxOKEiOMTBcVQNvq4lj1vZw4q9o7qyG5DQL5hUSCPWUWtvyoU+2EP
 t5xX53KzA2crRXbSzkhfOBRv/fJ2BN8eHrjBbca9OaSIpbLDKVXbjViDn2RpuOHwM3KTxFHV4w2
 5Dp6BngEnIPrz3IARPdH5R2tB04xMIUgevYw/83E6WkixELZGsNaof7uQQT6vE2nxHFlkOGRNrh
 29QDnZ/21z1p9uqDGjBAKvY17Pc2IckmEEWVWf3++3PzC2On+IxlAV9bAuKqjNbjqaELAFmtctI
 Tj1MoCTM3RywCAia85SjJPOCyGRw5NE2C1c3yPl+Vpnf4ZMeti0GZZ4MwHp3CO2IGFLuiiaUfvS
 SbVhmXjao4xXBL8xJHUhbKC5GSSYGjb49WQrbYP+RZCaZaqPXPy3afgS28rRqafd2hljFW5ilZ8
 jJLnntwZVYpqdskBDlQaor0Yz7mpBMIXuMzsOvK2WqRIIDqLTBMZBkE1VUjFOo1FnPb9LMma4ik
 42TKoQTflbbagSeoofQ9ic6gi1drt+ArEOyu3f6v4d7i3FsHzgwF9obnxVtLNrQseQql5nKh3DC
 2v39nHn7ooOwGGO4QM1lA9W0JS4xIEm5p0LUkpZdSUC1o1eFY3L7G2RlZ0mUgFyv9JpjNf/6NuC
 in79ZCaFdxuAF1g==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_171409_111127_B2B56C30 
X-CRM114-Status: GOOD (  10.29  )
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

Currently, PM domains can only support hierarchy for simple
providers (e.g. ones with #power-domain-cells = 0).

Add more generic support by creating an of_genpd helper which can
parse a nexus node map, and create domain hierarchy.

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
Changes in v5:
- update subdomain language to parent/child
- add remove function to remove all children
- if any children in the map fail to add, remove them all
- Link to v4: https://patch.msgid.link/20251119-pmdomain-hierarchy-onecell-v4-0-f25a1d5022f8@baylibre.com

Changes in v4:
- use new OF iterator for parsing map. See:
  https://lore.kernel.org/r/20251119-topic-lpm-of-map-iterator-v6-18-v1-1-1f0075d771a3@baylibre.com
- instead of mapping on probe, create of_genpd helper to be called by providers
- Link to v3: https://lore.kernel.org/r/20250613-pmdomain-hierarchy-onecell-v3-0-5c770676fce7@baylibre.com

Changes in v3:
- use of_parse_phandle_with_args_map() instead of custom parsing
- probe when device is attatched to PM domain
- Link to v2: https://lore.kernel.org/r/20250528-pmdomain-hierarchy-onecell-v2-0-7885ae45e59c@baylibre.com

Changes in v2:
- Use nexus map instead of creating new property as suggested by Rob H.
- Link to v1: https://lore.kernel.org/r/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com

---
Kevin Hilman (TI) (2):
      pmdomain: core: support domain hierarchy via power-domain-map
      pmdomain: arm_scmi: add support for domain hierarchies

 drivers/pmdomain/arm/scmi_pm_domain.c |   5 +++++
 drivers/pmdomain/core.c               | 160 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h             |  16 ++++++++++++++++
 3 files changed, 181 insertions(+)
---
base-commit: 3e7f562e20ee87a25e104ef4fce557d39d62fa85
change-id: 20250528-pmdomain-hierarchy-onecell-a46fad47d855
prerequisite-change-id: 20251119-topic-lpm-of-map-iterator-v6-18-a61447423adc:v2
prerequisite-patch-id: e5697df059c17cf967fa6e4b1edb70874fee4ad3

Best regards,
--  
Kevin Hilman (TI) <khilman@baylibre.com>


