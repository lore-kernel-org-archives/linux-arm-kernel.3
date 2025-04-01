Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48E5C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rHGgSQdD2hCEm7pwASM4ZVE3/ZfNMjeU9kHI9pQmKw0=; b=caRe5zK4zRukRs
	5JMov+PYSCucKYlH0e6NyYGX/4RJvIn3556WuYpV723sF/ImCCcblzhK9BT9Vwmblb4SQ8dF5bVZ+
	XwHKqefpevpLDqIjnQECRYEmWjxQrR6Ps4/g/0oIIfjvwJQfz3qckurDQu4qGO6aqlarrQJE83z5s
	D7JqkJ1eA+oWPGER6vxz4bahx/mHQQq60z/RBhX3tJgQ4TkQ11e/hO47kZ+i/bvLZWbrEF3SXRmqI
	H4L4Nu0c+b1WMTlWp3v2KZulMeEhqkNAMHuZ5FBFUybMqooNi0jiPzRqLeX7vLCg4h1FpcJAP1zfg
	aqHhPH5ArpRV/XNgty5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYsh-00000002dDM-1uIJ;
	Tue, 01 Apr 2025 10:30:07 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYaN-00000002aa9-2WVZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 10:11:13 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e61375c108so7019555a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 03:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743502269; x=1744107069; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rHGgSQdD2hCEm7pwASM4ZVE3/ZfNMjeU9kHI9pQmKw0=;
        b=WHg1ASUUOq0lpiL7A2EF05PdrsmhV9LuyXgO3JZZW67tS+q7efguiZkWxnDcyE8MdU
         oy9msQ8UTQwUFJ+ovAXP1H5T1vx/ZVY++UtqKPoQ2OfmmF6cFqEerjmCF1okzYJAS7RN
         oU+GPTTig64Kp8EybfUI7HOL6aZyAFY8dDYY8WdIkfjtbyTJTP/2NHlWuzf9bt309ExW
         HKAnWHVHAPxtvV4JomkBnkZWqu5JY++GQp+9rC33c97lr4ndWP4r9Sg04CaTBcwI7a6f
         JF7nwT8ZUiB+OvA28u8kPkoT/oJVvtJuzYBHGWd7J5UwJVYN35OjvLWELkalI/78HVBK
         u6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743502269; x=1744107069;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHGgSQdD2hCEm7pwASM4ZVE3/ZfNMjeU9kHI9pQmKw0=;
        b=s+GLkNcf9ulKjhnvZLS8AfkG0gYJAWn7PiGmlBnG/qsN0NbanIeBXqN95o37iY7XYW
         1kiWXqG/wte7f5PbXr4Mib/XebHjaAOBrASdHS1dX7iNHDyU7YfHwBJbv1zH3JJc4bP2
         9i/Yrpn246cvzcpbITUU5azWLgS5Tq1kQ2rncjwsG5hwgjD75p7g0do8Je8O+ZiX12Ag
         zYnnUyybnUY76B60shPzWf7cAoyMmRCSmu0jG2veFIAFzbfNnOSqmPZ2Sb/Z63VJwx2f
         zmLaffb/LgMfsntFTUDunLjuVDb4qriArCervgmG6P1JTY+SALViZeu3KWAhM2D5TMAG
         /emA==
X-Forwarded-Encrypted: i=1; AJvYcCUnl837AF5FuazBQySLjZc6ymAsXKMLegdyd29yYvouSseeUskm/4i61K2FIIvda1X1kxPACyUs48iIKXMgwKHm@lists.infradead.org
X-Gm-Message-State: AOJu0Yw28EV8WKgIR26FvoLLprgeU0EfICmvAILLiB2LcxTpjfo4DhbZ
	j9gHsXGeapkz76asSBthSfIpF6h8hvXzBCn4OICinoBfJSi5I1JthJLEj4RrEFI=
X-Gm-Gg: ASbGncvuRbOuuT+yH5UjaTqc8/o1nR/wHI2S7VKrBhjfAb0iUp6DfNe77qsa3MeJKqK
	V9vMGLndinOARKn0fOcuDt8qo0jQo2cY9562w2Vsgdbtn5zay6zYorFKpgCSw/h8JkVkxyMte4R
	/Ud13KMfTBgG09c/IuRrItgVApQ7UN2GZ7k+Hz1WnaTE592eqK8fyGUdBka6Ek+C4sZWlGYQcV1
	P3mHpIbi2f0LAwEaI2+s/LWwiIpmqU+fUMO2XS8qCXml+SAKI36UmSWfD+dV/2k/4JCAw1wGh4y
	n0fkrk0RPN0vjxU2pP//ki3IcBlM/nb82vsnJjbxB6gDz/PoWtmtHQCayaq4/5fuWys0n0O1IOo
	zmhuGfEV+nLKvmC2KwjDgjmJHF1Oi
X-Google-Smtp-Source: AGHT+IHT9jkz+UCs3Db5OyfIYrlRo4mz+SAmgujhurHxk3CEiZo8YgaUE+HWHRECisppy8g9djLtgA==
X-Received: by 2002:a17:906:f85b:b0:ac7:3912:5ea5 with SMTP id a640c23a62f3a-ac739125f39mr976557566b.58.1743502269438;
        Tue, 01 Apr 2025 03:11:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71967ffcdsm757406966b.140.2025.04.01.03.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:11:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v5 0/2] support Linux reboot modes in syscon-reboot on
 gs101 (Google Pixel)
Date: Tue, 01 Apr 2025 11:11:01 +0100
Message-Id: <20250401-syscon-reboot-reset-mode-v5-0-5b9357442363@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALW762cC/43PSwqDMBAG4KtI1k3JwzzsqvcoXSRx1EBrSiLSU
 rx7o5u2COJq+Afmm5k3ShA9JHQq3ijC6JMPfQ7iUCDXmb4F7OucESNMEMYkTq/kQo8j2BCGXBI
 M+B5qwEJKobXVpQKK8vgjQuOfC3255tz5NIT4WjaNdO7uQEeKCa6oo1YyKqWB8833JoZjiC2a1
 ZHtlViWGk20llwRa9VK4r+S2pD4fJOojBPcca7NSiq/Emd6QyqzpJQ1QinCjfv/bpqmDxxViaS
 fAQAA
X-Change-ID: 20250226-syscon-reboot-reset-mode-566588b847e1
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_031111_645620_5D27AB68 
X-CRM114-Status: GOOD (  19.78  )
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

This series updates syscon-reboot to support warm/soft and cold/hard
reboot on gs101-based boards (Google Pixel 6 and Pixel 6 Pro).

Linux supports a couple different reboot modes, but syscon-reboot
doesn't distinguish between them and issues the same syscon register
write irrespective of the reboot mode requested by the kernel.

This is a problem when platforms want to do a cold reboot most of the
time, which could e.g. wipe RAM etc, but also want to support rebooting
while keeping RAM contents in certain cases.

On gs101, this can be implemented using different syscon register
writes.

As Rob pointed out in [1], register access shouldn't be encoded into
DT, though. At the same time, at least on gs101, the difference is just
different register values in different registers. Therefore these
patches:

    * add a new compatible for gs101 reset. In [2], Krzysztof suggested
      to simply add that to the existing generic binding
    * update the generic syscon reset driver to support this new
      compatible 'google,gs101-reboot'. In this case, and as suggested
      in [1], the syscon writes are then deducted from the compatible,
      rather than parsing them from DT.

The existing generic syscon-reboot driver seems like a suitable place
to add support for that, given all of this is straight forward and
simple and similar to the existing code. If the preference is to have a
separate driver copying much of the existing generic syscon-reboot
driver code instead, please let me know.

Link: https://lore.kernel.org/all/20250227132644.GA1924628-robh@kernel.org/ [1]

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v5:
- Krzysztof:
  - drop gs101-specific schema and add the new compatible to the
    generic syscon-reboot schema, with all appropriate follow-up
    changes to it
  - reuse existing syscon-reboot node for gs101 in exynos-pmu schema,
    don't introduce a new one
- Link to v4: https://lore.kernel.org/r/20250328-syscon-reboot-reset-mode-v4-0-77ba57703ace@linaro.org

Changes in v4:
- Rob:
  - don't add more properties to existing 'syscon-reboot' compatible /
    binding
  - add specific binding for 'google,gs101-reboot' compatible and
    related driver changes
- Link to v3: https://lore.kernel.org/r/20250227-syscon-reboot-reset-mode-v3-0-959ac53c338a@linaro.org

Changes in v3:
- support <reset-mode>-reg in driver, not just in binding, doh...
- correctly parse <reset-mode>-offset
- add a comment for all the BUILD_BUG_ON() checks
- Link to v2: https://lore.kernel.org/r/20250226-syscon-reboot-reset-mode-v2-0-f80886370bb7@linaro.org

Changes in v2:
- fix whitespace issues in binding
- Link to v1: https://lore.kernel.org/r/20250226-syscon-reboot-reset-mode-v1-0-91c1b62166ae@linaro.org

---
André Draszik (2):
      dt-bindings: reset: syscon-reboot: add google,gs101-reboot
      power: reset: syscon-reboot: add gs101-specific reset

 .../bindings/power/reset/syscon-reboot.yaml        | 42 +++++++---
 drivers/power/reset/syscon-reboot.c                | 98 +++++++++++++++++-----
 2 files changed, 107 insertions(+), 33 deletions(-)
---
base-commit: db8da9da41bced445077925f8a886c776a47440c
change-id: 20250226-syscon-reboot-reset-mode-566588b847e1

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


