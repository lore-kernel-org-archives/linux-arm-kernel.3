Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD4ACA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 01:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wPKyOmuQWUf8l01OnPw9ehRNwWWfONhetwr0Nv+M8qA=; b=qf8bG6u0jsaANJ
	Mzj7qkIyuxXQHdL1/tPRuTUKoNQP1X4o6BHB7E77Tqs050Zk7oGv0HDl5EpgAq39xv/M2k7rkZwpc
	5K/Rz6+U0quZtO6vimOjR+CZ8OPRqwLI1QNV4lmMgqJMaPLT424rp1M94DmpM6dk/MdwYs3MuFl/k
	itun8jWEfZ0jE9UqkfUgrddwivZBaPM26NTJLF7+xvS8KY/w3Vytz3m/21ZfPF2t6jZEC78zlKuGY
	86KMJem2RJ1TW50e5OqEFn+t7NvK8zQS8DpNbx5XTOn+GgQQ+BIARQakw5rvELD5rN6B6/sWUyU5v
	pmeQ/f9M5l2Lv5JV1w5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyLV-00000002V8I-0w7N;
	Mon, 15 Sep 2025 01:49:33 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyLS-00000002V7y-30or
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 01:49:32 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2445806df50so28393855ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 18:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757900969; x=1758505769; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wPKyOmuQWUf8l01OnPw9ehRNwWWfONhetwr0Nv+M8qA=;
        b=VjmOOxS+vj0z3Q+3YaTVeTlqmeuLDk4jYPvewkDznnRnloMK3FSbWLZVU8nLx3sh18
         RUu/Gd1dvh3/HwaT+qxWqfhUzc7qviu8EdE4i9cgb3dI6PTaSPtuB8K9h9jwqaEslJnV
         SHhbP79oxWC36a95MmV+fWfqAzRxA9AhPcinVsfg3TO2HUHicvtwIAqN8mcpH+EjaDTU
         jbcuRe0gpApZDyuH9bdc3cA/SAzU9kk3lJgxXT+/MS6HkqonPc6ghInfuVgJ1zePUfN1
         S8okVAcctDG4TB8U+tQ2fmmxFVUoi5j8tYLeIqoNFPxoftjF0KjHQfRQT6RSjbJ+cdjl
         DsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757900969; x=1758505769;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPKyOmuQWUf8l01OnPw9ehRNwWWfONhetwr0Nv+M8qA=;
        b=Ji1piMmEjwbf8seh3lx6aZN77g3PDRFQq26UczFDgcK4VFvFdirtImYQ82ZW0+TwQw
         +FcmeM+w5wckZYJ4v1ze2XiJ5xZ8sEDnsR1OtolyaC929XkW/HmLAOYdMEm29esfbWM5
         6gm/QZJrEhSZueQPmd/4bCBfjqIvRurBE8H2nsuyOU8RVYUCCgXLygaOKvWQGElPZGpe
         jQNPpYhUfA3klzZeg37jg1p/xEEODMMbGzIzYuaWv/loMzgwYaNL4zGaZEqeaDVgITrm
         0f+PIqsC6Dj9HmW0+eNBAEoFYbb38rVR68gBuAIDq9gTkc1ldvfP7WzrhSCkHBTlUnFc
         37og==
X-Forwarded-Encrypted: i=1; AJvYcCUVPb0vLYDrcrzvnis58k5Q3o4qL+jbXn78RvrESgU2LFrGYcx9IUOVg/nUcysoCdPuJNr97iX9EPB0JcpGrj+n@lists.infradead.org
X-Gm-Message-State: AOJu0YzltBbvb8dFtUOuYFQdEl8NG8gCqEtnK06HF02GSu/ErqBgNME8
	2fFur+oV1qf7RGdddXD0XZFjdwFR8uQxxVa/IFOA1FKHYOnee698czBK
X-Gm-Gg: ASbGncseneT0lkXjqJ4KvtWEsyvu4SoOBwB/QKHrkZizIScO911rpSBAM9sOlmjTZ4v
	puM9jgW+eSwtAvyXMsiWRVU46ceEIt8tIXRLpQ/rxEtOUmhPdk9mnBDAblZy7blCC7w5GTFLULR
	GGvP7beqfFW+R/MTPNdCAG9PW0kjRT/Efgxh1bCq/8GeWDsjTDvYeGOxUeVa9bHBEC8xqs/qIgl
	Hzg/OGx1187ffJc0A6EvFVL9Rq8IHdFsFh5XFQBIr3PtXFDBj5iOsfHwh0pG397uFiAWZDMwtEB
	Fb/Sgbre76UGxr4SZ4dUW7+lxkXCWKgmtX4CWogzSfp99NVb8zIS4Q71cI80CAWc/cAIVfljq2a
	x7yDCBItkYy5Mc2xI5v056Zuf
X-Google-Smtp-Source: AGHT+IHBNABRw3UbSzvGuIrlP87lXKciHZg0JsaKpxSUDEQmCGa7IwYsb8d2vZMsVK2RJ1/SO3YUyQ==
X-Received: by 2002:a17:903:22c9:b0:24c:7bf0:6e6b with SMTP id d9443c01a7336-25d26e47c11mr110147975ad.53.1757900969374;
        Sun, 14 Sep 2025 18:49:29 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-26686623f10sm11523175ad.23.2025.09.14.18.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 18:49:28 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v4 0/3] SPMI dt-bindings and nodes for Apple A11 and T2
 SoCs
Date: Mon, 15 Sep 2025 09:48:53 +0800
Message-Id: <20250915-t8015-spmi-v4-0-0574eda4ba5a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVwx2gC/12Qy27DIBBFf8ViXSqGhw1Z9T+qLAYYEqQ6TsCxW
 kX595J4UafLO6NzRndurFLJVNmuu7FCS655OrWg3zoWjng6EM+xZSaFNMLIgc9WgOH1PGZulfV
 eu6g0EmvAuVDK30/Z577lY67zVH6e7gUe01XTC7fVLMAF9yoYg1GAdvBxGDF/vYdpZA/NIv9QC
 /CCyoaidIAhiah79x9VG1S+XlUNNdaDIZLBSrNF72ubQpdr+8i8VmIeK/G2H/O865x1Aa1RMRI
 ljFpbH5MfBgBQCZMLQVvhVN9k918eiBEbZgEAAA==
X-Change-ID: 20250527-t8015-spmi-838bb49d34ae
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1979; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=oSreoU6ZmkSN75RCTco6kgjieWSOH7uDaMA8CsUlAvI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBox3Cg6vCkFtk2gUKfofkTMYN1rFg/vlHOsb70A
 qiMAv3+rPWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaMdwoAAKCRABygi3psUI
 JMeMD/4ry6RelVSMt+gVOgcbYvGaKJQNQepagwG0kBxfvKJSzp2mDb5ioYvyighK9C5Fqazdis/
 NdWRCrGuNzcZY7tIaO3aPyeHf5yTa5148SP11XAPQG3t+rmg9ufFE5tFEJtWFb9YcnhGM32NlR8
 har6l8XzrunRGFCh7T/bO3t6LZLxwPfTx6ZZo0EXEbsKzEGr0im/njL9dvS7q2BUwArPSbvxqio
 am9yN+l1h/TjdWvMi6OTYgwnjEr0aWGly3AGkJ6Xv1R0731Sle5UPZxRnkOVilxe5ywKW3sDJ4i
 VbDygmzgetzxAh/UH37Q4e7mhYaq6/dAS057qXBoASrbTpvVq9mKANKWiL650xF8XvpkxqPF5+f
 VGxS7phVfNZfsQvWjjssk4pFIIqnbo0W/8hVIw/NDaoqP4Dziu6hwecl5JfXaPKrJbLGPxgo6Jq
 c4ySFOtg0h87IMvAh/egNye5z+5ujnSxrx6mcVdpj5/Y8A7BBSbin2RUrLnWp0UTvPa7t/dn751
 rp9i0Fu8URTXXycUpLfSj3n7WjkV6+oaqmEzBN+SVVGv9KpbOdyL6fsR/dSubD509ykCJpl1ZF0
 adYBzhymPqGlJoX8ubNHB6io96cmYd930j/JrtCckSvNC2GL3d25dvejoGTKav0ye73PFMoIYk9
 1fOv1NDd7Yv/9+Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_184930_766908_CD35C5F1 
X-CRM114-Status: GOOD (  14.47  )
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

This series adds dt-bindings and nodes for Apple A11 and T2 SoCs,
and the existing driver appears to be compatible. Drivers for the attached
Dialog DA2422 and DA2449 PMICs will be in a future patch series.

The dt-binding patch depends on other spmi dt-binding patches that are
already applied in apple-soc/drivers-6.18, so it is best for it to be
applied through there.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v4:
- Keep the empty lines as is in the spmi dt-bindings file
- Keep DT includes in alphabetical order
- Drop tags for dt-bindings since they are sigificantly different from v2
- Link to v3: https://lore.kernel.org/r/20250829-t8015-spmi-v3-0-58b15ee2c825@gmail.com

Changes in v3:
- After discussion with the DT maintainers we agreed not to extend the
  generic compatible[1]. Change the series to the agreed-upon style.
- Now depends on a patch[2] adding the t602x spmi compatible.
- Link to v2: https://lore.kernel.org/r/20250811-t8015-spmi-v2-0-a291acf0d469@gmail.com

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
[2]: https://lore.kernel.org/asahi/20250828-dt-apple-t6020-v1-22-507ba4c4b98e@jannau.net/

Changes in v2:
- Rebased on top of v6.17-rc1
- Collect Rob and Sven's tags
- Link to v1: https://lore.kernel.org/r/20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com

---
Nick Chan (3):
      dt-bindings: spmi: Add Apple A11 and T2 compatible
      arm64: dts: apple: t8012: Add SPMI node
      arm64: dts: apple: t8015: Add SPMI node

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 5 ++++-
 arch/arm64/boot/dts/apple/t8012.dtsi                   | 8 ++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi                   | 8 ++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)
---
base-commit: 989ca853ddeefad448bdfb771113faf9cc480936
change-id: 20250527-t8015-spmi-838bb49d34ae

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


