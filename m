Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4FEF5A8CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 23:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ufPgVDBbM9kVZQF2498czX2rJ62DJlm2iNO99og33OM=; b=0NNHeiLpKtNB8R
	47bSPE7UYfmlAJZes2+ZlTok15euy4xX6aMFH9hzfwEcES33YnHljcOdaEwRqDTmq+UPXena/Wi7Q
	tEAJZPEwM4ulih2RgNIJce91xKr40wALVPa9xuoYY3w7npfJXcmXL1u+SnbuLKzhOZPio8+4LV4Ch
	DqxYul8aqjm7yvxK1p2WWzEc+1Mf092D0ssshbJQ9LCZSHQQ4byjY+nZGG54PKNwkvrPT9Ml4WfH3
	u2t7hISQja86e4zFzS6uU5hDLnzeu2CBnARjTDX5bkIzOdGSW+R3pF0QVOtWR4YWxNrFKwgCF2vHJ
	Z6dSmmQZzYQX1Lkg8baQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEyOm-00000007qLJ-1dI5;
	Mon, 20 Apr 2026 23:51:28 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEyOi-00000007qJv-2Or3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 23:51:26 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c79506f3c40so1325305a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 16:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776729083; x=1777333883; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ufPgVDBbM9kVZQF2498czX2rJ62DJlm2iNO99og33OM=;
        b=T4UdUBr/7/Tt5g7vZaQdpQJjVrsOTYAZhcDi44g7md/T22RYNcNoQEY+ZFeT1bo0WV
         WuOLswXOLodF8oduZx9nuU179PRSr6N+QuwPWlFPnoEAwXPxuti9oJ0+Q9N0cXOw9EzA
         xDH2TtGMwHHtugT9KAecIFkFPxF5rHVeWU/GeaERf4sZf8ntX/GIXPuDNz8rSeWA0H2D
         hLbAJ0qy9cn4ZtNoD89yCyPbFWAvWOmPwNP7cDf3zskPWnHN3Yuq7x2fZov4Cw6xCezX
         P7tAe6czbtaWohZyIr+4wwK+oS1uvk1a5qoGMM062uTEp3oUVPyAh48ZL881rb6u/Rfc
         gDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776729083; x=1777333883;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufPgVDBbM9kVZQF2498czX2rJ62DJlm2iNO99og33OM=;
        b=JjtG5HnMmHXIt4tBkQAl/vfU++8O5x6yJPfnhu4Umz/mhtG0qN6s/yLOeV1ZEB+HLm
         jW38BD6h59+ZsZJt2cnTTR7h14n3I6JllaB0zCRK8+073O4Go9U5Fa2XPlZXaNTpjID7
         uKReY5l17EqKhDSkRzAt8UzJSxAMbmMvGbp9neBJ2h2bF+y5jKav6pOCWW2YHEt/fVdF
         VU/Crd1ivX+ov9bIAwiEXzphuM2oP6xTNCUOBd8UzlJowk7QnVI6FC7fNLYBz3CUSMa5
         o8BW5pF9H1XBrHfh8mIVH2doCqGEhMF31U+hZzSqdApTQ7Sqts/Sexsifyz3d7kcjaSp
         l9jQ==
X-Forwarded-Encrypted: i=1; AFNElJ/BEISXhd6mC5qXwvHQDkt+3/L0DjhmFD2UhxqfkcqUjvyrUjJHe8j26NwcliiFXARptfSlsltiMJTyO8MV/IEZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwtSdgXSsTZy/wN9N5sRD62gmpmwwKIsTg4JV0GlBjyylbHPM4r
	qzBpJb24jW2EyfuWmIkDFOStNveVXM3DdBU4Hl1jL04Y4x81XB1RumMK2IGVT0KK3jg=
X-Gm-Gg: AeBDiesDOP4vC+SWNjOaggS09Zqv7Yn+AL0LInHw/VbUPbdGNQNVjZfqd5RjMzSMjAa
	VMYwb/ky/vXhipnmMYOTfq93RAYcfUPCDm/Sqhn8979ZHF+GJzweAEJAYGTAt4Kkgyb/6RicVKg
	VFUUs2tU5g1vCsPrelyq/iGtsKQtuV5/Fw3YyRCefVemYh7AWSl9AvbfdynI71+wkTIYQqslk6S
	y/EhzYO4zRKV76A9dwrZCkxjELcLUh9nhFtjsPGgSlbUg2Hvgctn6H/CQfRhNmqw9lRc4L8rOZ/
	kzwE1PsGbx/6Q8ANRQEeIS5gg3gZGPmsVhk/Swp3bcbG2YDbk5oQK8UEeeG1qjn1iko9jJU6/uW
	Lj0rUF+LK9w0k/qofyPJlPMHxxuLgC82K/hChe+2mY0F1ORC1aGrH4Sqf1iQDYG4bTwKYn9MK8u
	j9b5/jZhPFA2EYPhpMjp9IeKBQd4u6Wg==
X-Received: by 2002:a05:6a00:3496:b0:82f:52dd:4446 with SMTP id d2e1a72fcca58-82f8c9cc390mr16844270b3a.45.1776729083514;
        Mon, 20 Apr 2026 16:51:23 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d2fa9sm12324138b3a.16.2026.04.20.16.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:51:23 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Subject: [PATCH v3 0/3] pmdomain: core: add support for domain hierarchies
 in DT
Date: Mon, 20 Apr 2026 16:51:16 -0700
Message-Id: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPS75mkC/43OQW7DIBAF0KtYrEMExsYkq96jygLwOJ7KGAcIS
 hT57iVOpUrdpMsv/Xl/HiRCQIjkWD1IgIwR/VyC2FXEjno+A8W+ZFKzWjLBGU1+QUunxdHF9d5
 pnKkdcepLL1IQfdtpaDvWMFKIJcCAt43/PL1yvJovsOlp/jQCXK5lN71qxOgI1HrnMB2rLPdck
 efpiDH5cN8ezXxr/u+nzCmjrZBcqk5zNQwfRt8nNAH2ZWWzc/3rNW+9unhKiIOExrSDMn+8dV2
 /AefA9htWAQAA
X-Change-ID: 20260310-topic-lpm-pmdomain-child-ids-e3d57ae57040
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3250; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=6WxIAiLE/9LRIR82Mb4m+MqABJehEcnrKw/oRJbTM5c=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBp5rv6Rf/zytON0i/RmuShXkpqsPFc/gGPasid+
 /3oPG9tkoCJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCaea7+gAKCRBZNxia0/vG
 ZfTVEACfWnHioXc95XXtaqx6QRy/RYoNMGYwwJQguRkSnNMHV6zscT6TciPxDi1Q5gXr5AIdiBu
 4M+C8XiRKN3+EnnsRnKHszeTAO15Y1UOSJRhB5gcaEVj0WfVMBK6i1ut3GJtcFudnV0ytQt8HUY
 ahctQg8nYMyAP4B4JWAGwAJ3lMUXm4RLPEKsILBM+2vZ2TGx4xLpPNSZNqv4I9swsW+CHUmDA0b
 1paRmlmFS2oRiB+pQn9buKKflpUDq7Wvpm/V62QUBjJt4iSQsUVv180djB9J36ygcZ/NJiKR1/F
 mkR/Re8ygxw5KyWbfi6RMSzTciGbH7tRm4IP4bxWq5umYuAoTIwdLfnwIwwcpNqhQ3joIPgCupZ
 F835lTbFS1JgxUYPHYeA+iA8u6wsdSd61u/M7ZdOf51AJaO9qSZCQekxR+AT8joe3dLyC1Uxlyw
 4HfZ+td+PFqA+NEzWgXP+QfvoQuAr0VsrQtFZ2OYY7fNMNnFl7/SrMFJcwGsD9n2kHvCmpf9cXo
 alpU14tukrPoBKa3x0gM0GrrdBV9yee4sc/y097c5UHkzHeqCkkhPzaaDJaWzJyBu348KpvOTc2
 /TCsF3YhMcutog7n4MNWbwigLxdMQVInMLTIjZ036/9l88aJDv8fhpxMU3aU2TXeNFtci0wh+zc
 Z1h0TtbyeS3bgfg==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_165124_878458_D490488C 
X-CRM114-Status: GOOD (  15.05  )
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

Also adds the first user of the new API: the Arm SCMI PM domain driver.

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
Changes in v3:
- cleanup return codes for add_child_ids()
  - < 0: error
  - zero means no child domains present
  - > 0: number of child domains added
- arm_scmi: adopt to new return codes (only <0 is an error)
- Link to v2: https://patch.msgid.link/20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com

Changes compared to initial RFC[2]
- dropped RFC
- rewrote the parse/add function to use iterators/helpers from of.h
- add a remove function for cleanup
- use child domain language instead of subdomain

This idea was previously discussed on the arm-scmi mailing list[1]
where this approach was proposed by Ulf, and then an initial RFC[2]
implementation was made.  From there, it was suggested by Rob[3] to
use a nexus node map instead, which led to several more versions
attempting to implement that, culminating in v5[4], where Rob and
Geert then had second thoughts about the power-domain-map approach.

Therefore, I've gone back to the approach in the initial RFC[2] to use
the child-ids approach.

[1] https://lore.kernel.org/arm-scmi/CAPDyKFo_P129sVirHHYjOQT+QUmpymcRJme9obzKJeRgO7B-1A@mail.gmail.com/
[2] https://lore.kernel.org/all/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com/
[3] https://lore.kernel.org/all/20250528203532.GA704342-robh@kernel.org/
[4] https://lore.kernel.org/r/20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com

Changes in v2:
- dt-bindings: fix warinings from make dt_binding_check
- scmi_pm_domain: switch to dev_err()
- pmdomain: core: fix locking around add/remove domains
- pmdomain: error unwind if any children fail to be added
- pmdomain: fix node reference leak
- pmdomain: ensure power-domains and child-ids properties are same
  length before iterating
- Link to v1: https://patch.msgid.link/20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com

---
Kevin Hilman (TI) (3):
      dt-bindings: power: Add power-domains-child-ids property
      pmdomain: core: add support for power-domains-child-ids
      pmdomain: arm_scmi: add support for domain hierarchies

 Documentation/devicetree/bindings/power/power-domain.yaml |  34 ++++++++++++++++++++++++++++++++++
 drivers/pmdomain/arm/scmi_pm_domain.c                     |  14 +++++++++++++-
 drivers/pmdomain/core.c                                   | 167 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h                                 |  16 ++++++++++++++++
 4 files changed, 230 insertions(+), 1 deletion(-)
---
base-commit: f7b88edb52c8dd01b7e576390d658ae6eef0e134
change-id: 20260310-topic-lpm-pmdomain-child-ids-e3d57ae57040

Best regards,
--  
Kevin Hilman (TI) <khilman@baylibre.com>


