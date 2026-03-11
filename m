Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2291BFD88D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 00:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q4gbKDbPXbOL00FNYZLFnwugvEIUZemApaFjbSsjN8o=; b=UEiPoomm9MB9NU
	s4zXQsAkH0TgqIOCgg659mgoOMJqYwu3cMSBUS8FSqqVoJJTMZdFGKBpqFAj8RoQaGCJWranD1FnK
	mCMyVSAPLqVxZGSCjuFiJwJ2el+pam9jWRLOLDdrxF8eLaFMXcJ/MhZ4J/UVxgpxhmgx0CrQjH2Gh
	PlLv870ZCpxLgkSr1VTebzuV5aw2cZxGM4dcIZKEOZh7tuQrKfziAf+sIF/r7D9BXR4+XxpIiQv6A
	fjU2nD1JdZLkL2wJYs6chnAtWnhx561zotzsYUNPw24j0+9zMiNzbN6rcjNjMhHd1dwVHoTJNdMH2
	aDaDvfdT6IdeyXIWWJ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07In-0000000AQJw-2qAX;
	Wed, 11 Mar 2026 00:19:53 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07Ij-0000000AQIV-1out
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 00:19:51 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a9296b3926so104604125ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 17:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773188388; x=1773793188; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4gbKDbPXbOL00FNYZLFnwugvEIUZemApaFjbSsjN8o=;
        b=xFf7ASqlC3S/0WpgtU4OyY1Uf1WMImEcWz5wkw6TZvuqjA9LiokfIOUTYYwAO1soCo
         wlzGNk3wFwqRatWZbl+mVDdKuEHlpXJgtwNUnF5YAIL2wZAyOo2DPh0BdD8UYhp60zNe
         x3+l/J4UKXto17YBKt1VFC8ltFFqAMeyaEmvg24G1tQR+sKPcO9P6qXE75QCgRIhopbK
         HD9jVTmB0aoaB0uANodI+COqQuMiRfNyilY/2GRWW8gDLMZzAygZcXBqPxqJGCmolxui
         WY3qg/eV8t3h41fzuKHZ7ILVX8xmdmfMuJw6Hz7jVSptRn8tSg0EiH3/WgK8u0jaoaKg
         7xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188388; x=1773793188;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4gbKDbPXbOL00FNYZLFnwugvEIUZemApaFjbSsjN8o=;
        b=JpKl3lNmn0CD+zn5TRtkhr6AiCB07bIza0rLHcpgMTeboa59Cr9XH3GcxREzBGflXk
         8Cv4jhtPqFCLUUIshrOHIaxrNq9Wc+GT2teEm+5yYQFeTkMP2XoZgYBOyaxyk33m/A/a
         r7bWnkPcyLhz137Jb2zGU8nvHius99NyCSgaMqqujTNr80748/M2AUl5ADS+/Smlu2U8
         lrkFEqKPRYxDtvPl4PmjK/E/kOOu+hBeVGoZcg5jgYOrA0kwT3b85FxIorQMEhgd/AXN
         zy2boAbEjht6gVABkftrPt3tOMwxOsGTNNLL4NpDzFdJ45nF1rT9vQtegiKReslI44BP
         Rjqw==
X-Forwarded-Encrypted: i=1; AJvYcCXmXzqw3YI1Dh8oLRtyRQaLLN2WlxyhAyfmuT6lk3ax9hB28f7jWl+tA6rNRE8iu6BPdQddlSDPywLiQ+SWmd2r@lists.infradead.org
X-Gm-Message-State: AOJu0YxwNyiRVNhgxiEfnnl0Y/gR6kFZecGTHN2ksk87Flftw1Q70BIz
	5w6lhKm/BpEGob5IoKtuofT4v7dE1zpmojoiOkDIM5gXRpdYSBAIt1z13y3mbFJBabxwd/0TvGE
	dNWIK1b4=
X-Gm-Gg: ATEYQzwC4vOFt6tagus+hssWPIlkiGBlT8eSmEsL5tSUpEEt3BKhIjtJYtDQFvKfSCF
	PKpTTbttAIn2dFNFvFSfBbqWieCJu8b9fgxUIwZKSOR1gCGcztxMnXjUXECVnqFoWrDH8ZTgo9j
	bQD1+jIEa1ripJ1MjPejBPVYve9XZd17UaQk1d86i1ueqcymg9kGaXQwFdQzC4+djjaAqVUDKGY
	fajSCIC/pPE/sda9Juh96wzxgqoZXqO7bKFzhaxxllmzVBcP7TAKCqq37uOgpKQBqLcAPIE2ZZU
	8b8mapksy7vu+G0YpcQLRy2fulZ4ksgXOR9SlXi3PZXDscv2HxoSfbSsxY0QAEuBFg1iDR7ndXZ
	O1K1l7uIyMoipilEur9RwM0dDF5nbnoIhTjDEYFpSjkoBNkmBsUeGRv0ytYub7ckJ6XcdmZvCDo
	0pdg4+jOCDyjPMymsIurmhHk0NM705dyM=
X-Received: by 2002:a17:903:1249:b0:2ae:4409:5993 with SMTP id d9443c01a7336-2aeae90f919mr5730215ad.55.1773188387884;
        Tue, 10 Mar 2026 17:19:47 -0700 (PDT)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae361a00sm4023795ad.76.2026.03.10.17.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 17:19:47 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Subject: [PATCH 0/3] pmdomain: core: add support for domain hierarchies in
 DT
Date: Tue, 10 Mar 2026 17:19:22 -0700
Message-Id: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAq1sGkC/y2NQQ6CMBAAv0L27JoWBAxfMRxKu8oaSmtbiAnh7
 1bxOMlkZoNIgSlCV2wQaOXIbs4gTwXoUc0PQjaZoRRlIyopMDnPGidv0VvjrOIZ9ciTyV5Eqkz
 dKqpbcRGQEz7Qnd+//K0/OC7Dk3T6Nv9GoNeSv+nQYFCRUDtrOXXF2pzlFfp9/wAeN1H/qQAAA
 A==
X-Change-ID: 20260310-topic-lpm-pmdomain-child-ids-e3d57ae57040
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev-53144
X-Developer-Signature: v=1; a=openpgp-sha256; l=2366; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=6Ortp2qq9rULdDJuVn66N0Ei8iDpZMGkkqjcAu1CgyQ=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBpsLUiM05+PR9pR5YLqjfw9+cFI+c5ucZfyQF5p
 p+lPCd72oaJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCabC1IgAKCRBZNxia0/vG
 ZS1oD/4x2mqWfLt1MAFIqsfziojPD3xLYTRrYeJyPAT3KCbqlFVTfIM+6+Xy4IJrB8w0JvadZR0
 Vqwd0ukODb2BJo3AIFTiw1NAQQG9yXNSq0JTbohmEXaEEa9Q2Do0neOaeaxUnwQ1nkhPg8X9zjM
 SW0or1GABD/q4bR1HWDcgAGynbTiQbnB/tsR1jd9IfrMUjI7rQ5UyA2CMq5oLFTXOIgd1d0rsQy
 NjIftYUFNHL7g4oUTLAg6IKrM5CiAm7V4STroOqyR3E5t4hA+nIswqoi0+epBeG9Eg5vBl/o8XX
 csibD+sW0GefgcHfAMU+EjMu6xq9d53fC5uFJMU6Mfku88ZudHWiO85hCh7K7l5d+pSzhFPQ+PO
 uV4mV7CjNqF5optte9B61Vi/2007ep6sLMtbz4VA314IDmWbVH+FECnpGdkLkuc1n3kku7GuZQO
 nlH6RC32zOzjyfxFmSv4zXGqA4w98NnMNgnkggXxxYmSUn3Ez92baszynk+FtzTweDCB+2sBsKG
 Z0K3qET3l8OOjN4aiG4XhBxDe1Znz1hk2cuyCE4yMoSI5uruPY9/XFiAdNWZ5n0h4SLV8Gl1LRH
 OYxbcRqvAoCydhb/2iMn2ne+cqQYc8+VSVuzV0K6Gp+YaqeMiVonRB1ga4RgtmoOa3EIQOJRYOv
 1qnWae3pQguJVSg==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_171949_503553_55374D1F 
X-CRM114-Status: GOOD (  13.09  )
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

Add support for oncell providers as well by adding a new property
`power-domains-child-ids` to describe the parent/child relationship.

This idea was previously discussed on the arm-scmi mailing list[1]
where this approach was proposed by Ulf, and then an initial RFC[2]
implementation was made.  From there, it was suggested by Rob[3] to
use a nexus node map instead, which led to several more versions
attempting to implement that, culminating in v5[4], where Rob and
Geert then had second thoughts about the power-domain-map approach.

Therefore, I've gone back to the approach in the initial RFC[2] to use
the child-ids approach.

Changes compared to initial RFC[2]
- dropped RFC
- rewrote the parse/add function to use iterators/helpers from of.h
- add a remove function for cleanup
- use child domain language instead of subdomain

[1] https://lore.kernel.org/arm-scmi/CAPDyKFo_P129sVirHHYjOQT+QUmpymcRJme9obzKJeRgO7B-1A@mail.gmail.com/
[2] https://lore.kernel.org/all/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com/
[3] https://lore.kernel.org/all/20250528203532.GA704342-robh@kernel.org/
[4] https://lore.kernel.org/r/20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
Kevin Hilman (TI) (3):
      dt-bindings: power: Add power-domains-child-ids property
      pmdomain: core: add support for power-domains-child-ids
      pmdomain: arm_scmi: add support for domain hierarchies

 Documentation/devicetree/bindings/power/power-domain.yaml |  35 ++++++++++++++++++++++++++++++++++
 drivers/pmdomain/arm/scmi_pm_domain.c                     |  14 +++++++++++++-
 drivers/pmdomain/core.c                                   | 169 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h                                 |  16 ++++++++++++++++
 4 files changed, 233 insertions(+), 1 deletion(-)
---
base-commit: f7b88edb52c8dd01b7e576390d658ae6eef0e134
change-id: 20260310-topic-lpm-pmdomain-child-ids-e3d57ae57040

Best regards,
--  
Kevin Hilman (TI) <khilman@baylibre.com>


