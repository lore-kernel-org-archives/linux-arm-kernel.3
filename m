Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB60CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 07:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+RNn5SAyspBzcMxDZ2Rf29ksnCDKjgLyQJRVVyZXvxw=; b=X7NxlYXbuqFGLh
	05b+L0recVtPnEjdS5y4lG5JVBgZsnSqcgbcnpUgTNTy6qPUl5AcZCN5UcSOJx91pb0xvPE+cCt5N
	IiveyHQFXvnqFCIKtYLWcb5lomGgS8yWH1fo/1HAPOE77Fec8v5muhgG68jon0mq0QLahRLT6S4Hc
	JZNE9YzKOo06/CHGzfOdH6lA5OsdHOZliuxsNpxBcUYB1QJq2ZZcow7erQsf44IQJ51aGsJCfSr3a
	lFm0T9FVl9FB90UTW/Gc4n+pAta5JOQqehfldHserRQ2CKGNhcd2MBDaIRKIvkXGkYygHcTSoGtD/
	h3LE6rQtR4bTErWvgPVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gdY-0000000GhFG-24Dy;
	Mon, 07 Apr 2025 07:11:16 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gbn-0000000GgRU-1r6o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 07:09:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39c1efc457bso2192217f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 00:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009766; x=1744614566; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+RNn5SAyspBzcMxDZ2Rf29ksnCDKjgLyQJRVVyZXvxw=;
        b=rJSHXdTslT3F5c8cClNdtmPVq7blo/6DBvawObJesAEy5cMbXLDiC6yXcRf8ErNfcD
         gh07PULhio1Ax1A19oj/idNtyxLgrBtcFFVSq4EuyPKvXdZ+hlSAm6ZWCkjDLiZXSnhN
         IQlbOyMmp6xe6/m6tm5/HHDxl+tKZ1sq09jqAXzoQ46Z7ik/9XWYOnuO8cvcdi6HJ3VE
         InGwK79O2HsMF9zSyn0tZarmubiuh90M9/Q4J9hO024SJUj3kXWI9paoHCKONGBak2Qc
         GdIuUmxCAJ53E9AHO34wGEqNxN5xAOUXq2tHtB3HJI8lf2RQypy06B6u8C/RpOwTlT8H
         ISnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009766; x=1744614566;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RNn5SAyspBzcMxDZ2Rf29ksnCDKjgLyQJRVVyZXvxw=;
        b=ASQj+4p7hYh6IzkCqy8CiGWhTJ6hxEibdygCdcWasaIevgY9XWq09Tk6GjqFo904xV
         QrZcLdq6U+gXhmqVi7sAzLqkqOlu97fmK3W+Y/OLJpaxoEYdtiXZ19HCkBwZYuQeyHqo
         Ua3ywTOwGT2lJk0yzYEEc+3jFPSLpkxiVOX7UjXXVm91uN/tvPi6F565uG0yygfTtTyi
         eEmnyDAfTr+wtjOo3Ih5jTnyK1xHMRcVXQhnoSb+4jGMEUHDfIc7VwhHdiAUUcBN8E9K
         9j6qA+56q+A0pnXx8PudsMZn5b5HEnzjP+KV5hekVQNC4y7Om6hoOaQNHRYuhYBLnjUe
         XPLg==
X-Gm-Message-State: AOJu0YybgtTzkdqjqPJKruvB+J50bXVauxNhOTiF1b56k3ELX9eoOKb7
	vGEzha6IvnQATHEUT5zGL7UQmW5iQVWXLW/tKJTg5ZZvmdXhYq+3pS/qvPymjiM=
X-Gm-Gg: ASbGncs6hV/nblap7nEFeEBJHdb9Impy61E+chb4dmo0/SNy6zbabxt7U4TANtOO8zP
	at4lk8zRJXXNu4RXiTcWfDXkV6ZEcCodb1NRyBbLYzTSoKcXBS1dBCgZwdUqtLgGp+KGfOhzvV0
	05TWtqGtFMkFJB318P8YrfH1T5AKm5QcWI1E9sNgf4a4yGMaP0mG/6ZhbZw/rhDtbEPoUXk7XVz
	CWZ35jEpA50NHhGwrDvqB52A7U9GGcNxdFilrniYB/T9JfpGrZi2v45MCuF9XK7BuDJBsZ7v1XI
	iTuqWRktk0FOHT14ibXgEZCRp5+9shYHoePkEg==
X-Google-Smtp-Source: AGHT+IFsqC1d8hUahT2wAGNxMelgG0ITSws4TQAzfYlVRfWzJHmehfuM8/9lVQue9+N1lHyMNtizRA==
X-Received: by 2002:a05:6000:290d:b0:391:2e6a:30fe with SMTP id ffacd0b85a97d-39cba93333emr8618200f8f.39.1744009765319;
        Mon, 07 Apr 2025 00:09:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663060sm124622795e9.14.2025.04.07.00.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:09:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/4] ARM: convert board-file GPIO chips to using new value
 setters
Date: Mon, 07 Apr 2025 09:09:17 +0200
Message-Id: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB1682cC/x3MMQqAMAxA0atIZgM2tYpeRRzExppBLamIIN7d4
 viG/x9IrMIJ+uIB5UuSHHuGKQuY12kPjOKzgSpylaUaQ5RjXiVi4hP1wkk3bJaaWuM7R2whl1F
 5kfu/DuP7fqYalfplAAAA
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=oCmtcQ3XuI+cx4a64CkUUMq51aBbMji8srIW/rMRtig=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83ojKJ4eRLXH81clnfKezriaN1CLisDQ3rqzk
 JzFkrrZruKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N6IwAKCRARpy6gFHHX
 cn37EADA08bCYfZqeBjZXtU0G2h35f8c4btZsNDcBJ50euRl4+vHxdgj3v3AMhDWTGMak4M29wI
 mqwP3NcSrUPXLqTTyFkkPeKbvEP7ZdsPTmNJ+8pn3TikB97L4abj+HREE5sYr6wL6Q8CvqGpamO
 U4LHlghdIhxtpetGhz5GkamZ0KXJU6IKSossfIsCRLABd49qWLHXQthEByton/kQovIW8vntk2w
 DH+ySfLHgMUmSaRP9iCpwPMFIvRiRPwpl8HURtr030oYgufHYVTo+Xixu+xTm9w2r3gJaHgxLwr
 jdgUedVvYMuR2LyiPPxv2eX+M8IH3BMjlLWxQiw97tLhXfrBFy+7FCze/L2zIKgDedkThxWhr/n
 u7A+bgXLWfR2Z7DC0RNkkBk9oEKtSk6l8CUZ5MhS4mqgf6UaGgD8Zjd5FYEtlEb7j/YZ3aqHFT5
 fEkp5mg9spn8dunvorQSGSAagKX1TLrKxjWDAdmOdz2tgvn4+81SEhHtuZewsvjqAuoQMx7+RTr
 bPjQAvLINEk9+8vNTJ6vABE73WQZxRgmyPa9byuNWianYti/rAX3TOxpHAQrHfgk32JYLme9ITi
 lPbmshT65lPcnXMXjeeaXuZtMPL3okPYm3U+RCo7Qg53ZX2RHb+j/ESgG/8Ud5PFrh7Qqfe8ZzF
 y7ZKh0TnWVrqazw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_000927_484500_64596310 
X-CRM114-Status: UNSURE (   8.84  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all ARM board-file level controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (4):
      ARM: orion/gpio: use new line value setter callbacks
      ARM: sa1100/gpio: use new line value setter callbacks
      ARM: scoop/gpio: use new line value setter callbacks
      ARM: s3c/gpio: use new line value setter callbacks

 arch/arm/common/sa1111.c         | 6 ++++--
 arch/arm/common/scoop.c          | 7 +++++--
 arch/arm/mach-s3c/gpio-samsung.c | 8 +++++---
 arch/arm/plat-orion/gpio.c       | 6 ++++--
 4 files changed, 18 insertions(+), 9 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250324-gpiochip-set-rv-arm-6f4271d952e3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


