Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE968CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=scSioPZgaBWmEVFJ4bgMUeN7W+hZwLguTW+C4ze8WMo=; b=Da052r/xb1+OKS
	0VlB8W18CeKq6J74Y/LeHe/zWVLmP0azhEDddLMisjeOjPmpD60WajxvdeGSojLGEmF2M1WWWMBmH
	TAonVD0lydsrcBf0K53zqV/NFWvBXpD3uMaCDjyp47S3B0A3O5tX5xX5llxMVydpsy6/C07rnLU6y
	lILhQfyA+AU+W6Uwkq+LHKU9xsrMTSubWamSlUFXuWBpVy6TBNAySpvjzZ2NZlwAhi04funxkCJSr
	CpZKH7SH9UMjhynIrFqsi5mY5pACo+y7NKZLoIIpl4OUrhHZcU2VkWUHaZ0XOX0l4KYy4s5MhorLf
	QPqMIDY9sP0FIh9Ak/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLkM-0000000GbZV-3KUa;
	Wed, 27 Aug 2025 19:23:50 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJj4-0000000GHYH-2qBm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 17:14:23 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45b49f7aaf5so146675e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 10:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756314861; x=1756919661; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=scSioPZgaBWmEVFJ4bgMUeN7W+hZwLguTW+C4ze8WMo=;
        b=hMGeh7yXdpk/cpCr4sVcWVosvX/h1IuaCnQUGXnDaack7GXnMza/zYDHKn0VoWDIOE
         TapqljOmkt45lTy0BcuoGnzPeAkJGZ9tkptCpCPdq21ZcPyQvHvfiGyhFtoQF9/816P1
         kBs1m/Xx98TqYXAe4YZrEQlGdl8foDNVb4g5P7Obc6mQcWMRLi6r+Ayo3f5WsKme5TSK
         wA/WwHWery+lxEiuwrUMxd/PUaITGNj8SGJk3g4xaIK0hkUOoqlZH0FQufy81tSi9gYR
         9NvOZFXX+4ZQpY5Nk5+ErfJ5/V/dBu7Uf0tZwWzYppxSpOQwVSxpuamxXIebC/BAjtu6
         LCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756314861; x=1756919661;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scSioPZgaBWmEVFJ4bgMUeN7W+hZwLguTW+C4ze8WMo=;
        b=eQGJuLXeAtwOMhqDPlIfDUrkxoMD2byXRiLEJoBBRa+2p0PA432XjjXoizRzOI1ikZ
         5zM2hErZkA2DkEa88W7GohGq4hu5STcvXIFS7gKHAlU6wZ+OGWHemhUHSLeQpymp7cDM
         xpUgeZqZ8xU+m9WdnuEuKpDGrVYGXfNGBZkQCa9xp3zmt5BXdLhR5CbMqxZadpgCBIlO
         fz4u37jFmi26wzw1OQyZGmSqvcuVKjcOF0aeCJicW9lW1uQPas1i89lASvXlLc9vVv/R
         Tdc+vdJsUXM0BXs490V+nPIWrWCg/k2jJIVEiokBc7+SDOowbNl0IiyppcolHcw7dqRZ
         bOJg==
X-Forwarded-Encrypted: i=1; AJvYcCUZm/Zbi1riKKWbD8Wlj7Io/K2qo58q62/TxLN9rxPCskjGrmH42O6Zbux5xx7uPmLK1MYxnn4Dz7XU49RTZDjV@lists.infradead.org
X-Gm-Message-State: AOJu0YwwMcpUleeSwBVJeAOvHJDlkb0kmbOIjwXCO2JTYT8SaQgnv3aF
	r6FYj6qBLUd+1hA0DTeqhhLeVtkf3D+ooAzGV44UV0nFt5QjpGqkrTaS
X-Gm-Gg: ASbGncsKE+TemZuRLDxc5CphVVdyqskhAaStKbv8yZkPL3DVPX2ocMjPIlNc+OLMK5C
	/EmEDixwcYnbNxR2bL+lQHHAj5OLElP+rhoBap1mm71IzDtYWMpmx5/7cLD/xuCUzb9eaB918JE
	6rmC1eIsChWzzoYH4volFogOYgCqkI/qnd9M+YRB/vCCAvM1CyN9n3GnPWT09PSQ0dEEBNr8jPm
	l9xE07tG3qh0kzoQvcQ+ACHkDmBz4GDqwTlo3jGz990EsyyuXWPVu+4L/MZpq4OxRint54FIZpO
	Vj/Omrm7cFoLwbwNJtX1lN9Y5lHxxRiAlYDoVpb+xP9RRStVzqepdHBb1UoAinWKc/7Iy04dDz2
	fm6+NAxmJLtyGTBslche96uF/ksFDmB9tN5eWADl67MWLYKpiOpc=
X-Google-Smtp-Source: AGHT+IGgJZpfwG160OMwKEQBo65DWFs20A2jVte44M8RtyboFyzwUBOR1kqkVxkJxvfq6Bn3mVaojQ==
X-Received: by 2002:a05:600c:5247:b0:45b:7580:6f46 with SMTP id 5b1f17b1804b1-45b75807d2fmr9107245e9.20.1756314860766;
        Wed, 27 Aug 2025 10:14:20 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c7113fdacfsm21272365f8f.35.2025.08.27.10.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 10:14:20 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH v3 0/2] i2c: pxa: fix I2C communication on Armada 3700
Date: Wed, 27 Aug 2025 19:13:57 +0200
Message-Id: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANU8r2gC/4XNzw6CMAwG8FchOzvTDUHmyfcwHpatQhP5kw0XD
 OHdLSRGb9z6NV9/nUXEQBjFJZtFwESR+o5DfsiEa2xXoyTPWWjQBRQKJGknh8nKB03b7Pq2fXX
 k7MiXMsfSo8LcgysFG0NALm7+7c65oTj24b29S2rdfmW1IyclQaIBc/ZgLKjiWreWnkduiVVO+
 qdV+5pmzdmTRlupyjvzry3L8gHumdmkGAEAAA==
X-Change-ID: 20250510-i2c-pxa-fix-i2c-communication-3e6de1e3d0c6
To: Wolfram Sang <wsa@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Hanna Hawa <hhhawa@amazon.com>
Cc: Robert Marko <robert.marko@sartura.hr>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, stable@vger.kernel.org, 
 Imre Kaloz <kaloz@openwrt.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_101422_728052_2BB91961 
X-CRM114-Status: GOOD (  13.54  )
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

There is a long standing bug which causes I2C communication not to
work on the Armada 3700 based boards. The first patch in the series
fixes that regression. The second patch improves recovery to make it
more robust which helps to avoid communication problems with certain
SFP modules.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v3:
  - rebase on tip of i2c/for-current
  - remove Imre's tag from the cover letter, and replace his SoB tag to
    Reviewed-by in the individual patches
  - rework the second patch so it does not need changes in the I2C core code,
    and drop the first one as it is not needed now
  - Link to v2: https://lore.kernel.org/r/20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com

Changes in v2:
  - collect offered tags
  - rebase and retest on tip of i2c/for-current
  - Link to v1: https://lore.kernel.org/r/20250511-i2c-pxa-fix-i2c-communication-v1-0-e9097d09a015@gmail.com

---
Gabor Juhos (2):
      i2c: pxa: defer reset on Armada 3700 when recovery is used
      i2c: pxa: handle 'Early Bus Busy' condition on Armada 3700

 drivers/i2c/busses/i2c-pxa.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)
---
base-commit: 3dd22078026c7cad4d4a3f32c5dc5452c7180de8
change-id: 20250510-i2c-pxa-fix-i2c-communication-3e6de1e3d0c6

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


