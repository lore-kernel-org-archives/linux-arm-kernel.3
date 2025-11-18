Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D570CEDDA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 15:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6WPvFi51hSTGug9x4SN8j0sL2LdGeBDK68HLUzdBwf0=; b=4pTbPLSZNb6SmN
	ASc8fLW7YaYlHlFroVFI/hWvR6zhUXvkovhs6E6K1hjrrm+uSQMTVZhiDIaAteGYOKrz36sWyCwRr
	fW+QJfAZg/b2Mr0qB6AR8KI81jwhWRZbfze8A2EH2xJllfOStAQV52gnBhee3BF8h0j/9YJJOUx1z
	OBfy6BG5dPzO0skcsoe4Nj/ylA88ZfAYJVplCARj8rGvOr28Zle0Ez1EilI45fovH9mcfvHDuJESo
	VjwEvKpeddjVidEwQVrVyikIhO7T70tQwSrsVpyg99h/3KmOlPw2Fj6eznYEEBtIJPAExsaBy//vE
	y+EDkZp6f+GG5sPzDHZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNKH-00000000bNd-1j60;
	Tue, 18 Nov 2025 15:09:01 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNKE-00000000bMb-1TDQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 15:08:59 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47774d3536dso46773305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 07:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763478536; x=1764083336; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6WPvFi51hSTGug9x4SN8j0sL2LdGeBDK68HLUzdBwf0=;
        b=dAjObEWZBd/f7xpxQ53zqQ1axQ0LBlI+flmdNnohQ+URBmViHvo8XlFwxl9i+1MJji
         OIc/0I7N1ppmlzdQsssgSjcBIuh7FapDeB9z2l1vu1hYbi91cJrdGkDt2Vwp5cXEjiJF
         iI1pXAznTrH21QLwEdujt8TxCh0jPISNEj80v2FIcCOiN5uXYnBZaHi1wPMD8qUqvjeY
         /BdJ9pku3QrmLFiFM6dn0sABXIOgoXHi7Yz3mn7+owp1pS7vkZ5MdOsLlhgJIu0isOHd
         LYsChUsAQtKkMeNxjSLPytEgsMK4+L8vvvnLpQEESauZ5dh+f3969ELBfUZhUWqZjw/Q
         8Avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478536; x=1764083336;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WPvFi51hSTGug9x4SN8j0sL2LdGeBDK68HLUzdBwf0=;
        b=GJc6lY8xabGv4YOw84gD0fNKVFmfbc9wE2JOMyK1qeCD/eSDsU4VfONQJS4mIknojQ
         Tu5gwN5MyKNJuVHSwzvWfG7loffHlMnVveWokb6afCFLwrDw6E1zWnnGFnZBgP1eGvcc
         l/PxpFoJpHnaoCz7bL4cxQYJFctdp2Umeqx+sgLZ847IFtArI3eLgKTTGBRS5yWUmlM5
         hJAlBTP0+aaTuexYrpD7TG1CFE63WY7HeaSAkG6C45TV6Cjxlh3bb78Rtlwy4NNuf18/
         w5F6gUI2koD4D9pqut6K1Gzjoy1mkhXvgYXFr3hYYp6XqNT0rv+w2TG2+q9t5uGMrstX
         6CTg==
X-Forwarded-Encrypted: i=1; AJvYcCWNW2ce1kbJK5kQXxbmpqQFf+/RxhNfVprqZnZP3s+VV1CFOd7vByLG6bErfe6AYcJ+2YSAQe2PTOdwRF9qDym2@lists.infradead.org
X-Gm-Message-State: AOJu0YwqeQlFroWMEDJ0L98ORrfv/Nss6cScF1btERZHWFtjTrRa1QHM
	Hsh3eXG+up2W5XlWmVmGwyRVlgoj2SdkAkHzKKZPL3/yeFH7bC8hy11f
X-Gm-Gg: ASbGncsXlEvhaUgzLGpNJ6QhFgAAmICQorDQzjEjvUgvEVEldRD5RSX0W1bPcnngEv4
	ltIZWjbF7iatP4u2hBjDVT2/wmCpY6MwcRB9LKYxDyF0igElrdvkZ0Th3ZFG1NPDeLOM6OwNfpV
	et1jeTOd8glffP2dvFWAzRztITX1GN2hb120+id0Y76n8i3u4CkZ85UF5Y0hwYWk8K5W6LfwC4t
	lCoadLqPubd+r9H0yIQXv+zz4a+ADPHSh6eJ/7Zvr+W6Ik+NdWIkyqyqLZ9JRpVQO0h20bJvGDv
	6H6GhV2DQo7TYD6E6nhTTd+0q2z3fTXvk7NS3hwK5Y/OX7tOWUb+Tp0ZNlec4GWriQPcIxZAJ1u
	fYcQN2KUm3Jm2NHCpV2iTT6DcasFtLUL2D+uaDM1L5288oAd9MLTpvTWXrBiWdWq6KXik1IPH3V
	Ejv17OzXKLk8SEgwJ4Bv5Ij08QaElyv3l3pYrZyAQAsRLIxUO623aRGajqjc9P96z/nhs=
X-Google-Smtp-Source: AGHT+IF/6kXbFEjAEd63GYihy5Q8u6mMF1GK/dF5UenuZ7Kz2Ra3089BukNPLHYwu6f1QH+eFEoqTg==
X-Received: by 2002:a05:600c:4592:b0:46e:3b58:1b40 with SMTP id 5b1f17b1804b1-477a94acde4mr37754535e9.4.1763478535789;
        Tue, 18 Nov 2025 07:08:55 -0800 (PST)
Received: from localhost (2a02-842a-9b20-0d01-432b-0dab-f195-2b25.rev.sfr.net. [2a02:842a:9b20:d01:432b:dab:f195:2b25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a97213b8sm19970405e9.1.2025.11.18.07.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 07:08:55 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Subject: [PATCH v9 0/7] Add DDR4 memory-controller bindings and factorise
 LPDDR and DDR bindings
Date: Tue, 18 Nov 2025 16:07:56 +0100
Message-Id: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMyLHGkC/3WNywqDMBBFf0WybsoYjY+u+h+li8QZdaDGkpTQI
 v57oyuhdHkunHMXEcgzBXHJFuEpcuDZJWhPmehG4waSjImFAqWhVUraUiJ6adkhuyHIOq9yKgh
 MryuRrKennt978XZPPHJ4zf6zH8R6W/+3Yi1B2gJRAekSbXUdJsOPczdPYmvF5uAX8Os3ye+px
 KaDXBsNR39d1y8IwXSa7gAAAA==
X-Change-ID: 20250922-b4-ddr-bindings-7161e3e0af56
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-86b30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_070858_452573_CA653A18 
X-CRM114-Status: GOOD (  13.05  )
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

Introduce DDR4 bindings, which is the first DDR type to be added.
As the DDR and LPDDR use the same properties, factorise them in a
sdram-props bindings file and rename lpddr-channel into sdram-channel.

Changes in v9:
- In the ddr4 compatible pattern :
    s/ddrX-YYYY,AAAA...,ZZ/ddrX-YYYY,AAAA...-ZZ/
    The comma before the "ZZ" part has been replaced with a minus.
- Add information about how the compatible is constructed in the patch 2:
  "dt-bindings: memory: introduce DDR4"
- Add Krzysztof Kozlowski's trailer on patch 1
- Link to v8: https://lore.kernel.org/r/20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com

Changes in v8:
- Globally fix typo/grammar in SDRAM props bindings:
  - DDR4 bindings compatible description:
    - s/lpddrX,YY,ZZZZ/lpddrX-YY,ZZZZ/
    - s/in lower case/lowercase/
    - s/statis/static/
    - s/~/-/
  - Add an "s" where a plural form is used (e.g. registers) in the DDR4
    binding revision-id description
- Fix the number of chars that an SPD can contain in the part number
  field.
- Link to v7: https://lore.kernel.org/r/20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com

The v7 is a subset of the v6 and other prior versions, split to simplify
the review and merging process.

Changes in v7:
- None
- Link to v6: https://lore.kernel.org/all/20250909-b4-ddrperfm-upstream-v6-5-ce082cc801b5@gmail.com/

Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
Clément Le Goffic (7):
      dt-bindings: memory: factorise LPDDR props into SDRAM props
      dt-bindings: memory: introduce DDR4
      dt-bindings: memory: factorise LPDDR channel binding into SDRAM channel
      dt-binding: memory: add DDR4 channel compatible
      dt-bindings: memory: SDRAM channel: standardise node name
      arm64: dts: st: add LPDDR channel to stm32mp257f-dk board
      arm64: dts: st: add DDR channel to stm32mp257f-ev1 board

 .../memory-controllers/ddr/jedec,ddr4.yaml         | 34 ++++++++
 .../memory-controllers/ddr/jedec,lpddr-props.yaml  | 74 -----------------
 .../memory-controllers/ddr/jedec,lpddr2.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,lpddr3.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,lpddr4.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,lpddr5.yaml       |  2 +-
 ...lpddr-channel.yaml => jedec,sdram-channel.yaml} | 40 ++++++---
 .../memory-controllers/ddr/jedec,sdram-props.yaml  | 94 ++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts          |  7 ++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  7 ++
 10 files changed, 173 insertions(+), 91 deletions(-)
---
base-commit: e7c375b181600caf135cfd03eadbc45eb530f2cb
change-id: 20250922-b4-ddr-bindings-7161e3e0af56

Best regards,
--  
Clément Le Goffic <legoffic.clement@gmail.com>


