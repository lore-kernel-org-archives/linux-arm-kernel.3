Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D13C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rU7/4my6HqhkT0+Lx2O0XgxysZx4KZxVdbslyauHUzc=; b=FfaX3Wtwp/gONh
	U/kNaxxLId9OwbtByNKdbT9A9wjKu/ejdrvH5nWc4DTPuLESPOCOiXGD6/HdYehCdDSKTTgBGLVm9
	sH7OzqMXHwP1RURfZWOzrCbOiFzcFw5Kgy7Zc56MEhe+IGs12FmKhlB39L9qPQu65AlRJ1H1Bun1O
	mcJ3FPakxf2XmmsrbMq5Y2uFDj8gx5+no+jznTfUYaPTUIppNMAiov+q5T0Tb5DzVVryTaqdeOyzm
	XU4lQ08Za17/dqROLKvyZ3dtFnZYBeSjjR1NbC03RFVVnGDikUCZgfjUEWYmSQuiR0FfhEJ5jiprF
	Nb6Pz2hjDBiWve+OrcLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2EY-00000007XKg-0WiX;
	Tue, 10 Jun 2025 16:53:58 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyFi-00000006nX7-0NmD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:38:55 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a3798794d3so4629017f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559132; x=1750163932; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rU7/4my6HqhkT0+Lx2O0XgxysZx4KZxVdbslyauHUzc=;
        b=W0u5mYaTvTGnuZcpBbhNg3tyUiA3ESoQID/USp3Zvj0ecGBXtDtx52KfKgf6JjqxTx
         XbFdTZr0jlqweXzkp1E8fB1yKMMXMnhpEvFq1j3ywJeOGOOmKLy/mhfMc+AQToJ2WeSc
         ldybb860UVFIEOp2uvX0Ev3Oi/lQGlm8TG7B2An0WRXwHDaqvMNEx1uuWNWXimQK44A+
         JW1m8VQ90ikPdogCA6/QAfIF0ybx6QON04DBDOkzMm66IlSZbYzisevuKp7HBuKmyaQB
         vSQAGUec1fI2IpixhrLx7wG5jGxOiyOzn2rKbsiBcZlPfPFJq+eg6slRMfFySbSKRphx
         q4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559132; x=1750163932;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rU7/4my6HqhkT0+Lx2O0XgxysZx4KZxVdbslyauHUzc=;
        b=OpX9HDEOyaH4Tz2buFsX9k9BmijZFko34pEoKJa7G1lgGkUNKC9L3IOdc7fe8JPn8P
         wEpolFSNXpIo4iPVyhc5dwNe2VM6gl6/lOvvYtWstLT9Q4TJOHdAhQNGqewe0ojGNfi4
         bv6N8pf7yzTCfRKHGCepbkExczFqWhiG0U31ShS7NqKz0SzUP0uSs+H85MxkNIlpxL7q
         kQ5xtEAzKvTr5/14Xfo4mPHloqPtZWgSkpjdMnkBd5qNva1A8J17wF58Bna53FDXFr9o
         0LjywxPBWYSVw9fC8nhy12i/KgRrA6E0T4Qo8D3wEl8luTci/R69vKS2t+DK4sn2kS/B
         fAUw==
X-Forwarded-Encrypted: i=1; AJvYcCV/pK0Bc8jSR64legiJ/0f8lK1w4Vu5/YUkTgubD2xrgBdOdMWztglG6ELVvLFxNAqQtdPyOLDSJOe2wLH2uA2w@lists.infradead.org
X-Gm-Message-State: AOJu0YxpKaVFf2VBsh6aiOJgHypHfIEpMx2huhGiLzksDEuXGPMio3Az
	dlvz2y9RF9QZ8YIbkdhxj/x+Gns7eNI++aW+/CWdwdKRwqa9u1+tfkWPmM3SgLToMXkAIkB3Tvh
	UGNZr
X-Gm-Gg: ASbGncuOkqcIDQPTkzJV9R6zACfBzFhrydQnXhvh4UKl5j1/ORzHhpSABZpQKq91DLH
	73elQRfaX/fwolIP8EyWms7CkffdZzA2ote19WdRjghS3RgOPJlgZlZrhLF6ApOUWbeavZOP/Fa
	1WhK+ocuK1W5zSxMPuMCo+RiEZqsVDqVsS+D8T5D4X23ahftuEgO4TQJnx2L0phH9jDZXe6VJCw
	jGUGhQ95orw5+0YltbtXVGJF6RsJIiz5vCGpUnxuXX0MQMTGnU+cSJnupyLnH6EeawsodZFFepj
	qZdlw8Cb+aWPNukhnBZ2JGrSyBI+x54O4u319uz8BU4cACFSOT47SmJuN9WfmzU=
X-Google-Smtp-Source: AGHT+IFUBxicO7hQVJhltf8pKkjk8eVddbD5uhxdka17FsMWwGoc9zt6HgcPXCEgQzPEEyRBJN+3Qw==
X-Received: by 2002:a05:6000:24c7:b0:3a4:f71e:d2e with SMTP id ffacd0b85a97d-3a531ce8887mr13210295f8f.56.1749559132270;
        Tue, 10 Jun 2025 05:38:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de7csm12374676f8f.14.2025.06.10.05.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] soc: use new GPIO line value setter callbacks
Date: Tue, 10 Jun 2025 14:38:49 +0200
Message-Id: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFknSGgC/x3MQQqAIBBA0avErBtQM6KuEi3CppyNihMRiHdPW
 r7F/wWEMpPA0hXI9LBwDA2678D5PVyEfDSDUWZUoxnwShyd54RCN+YHJTrUlvQxW23PSUErU6a
 T3/+6brV+xtJg+mUAAAA=
X-Change-ID: 20250523-gpiochip-set-rv-soc-14e1d9414f70
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=923;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sGr/PNAndJxKtPVU5XNTYT21VZPL04qdLeA8uRGJeaE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCda3jdxUjB3y8y65I+EGMTPUKfUhIEDVrAHr
 JBuGF9gOJ2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnWgAKCRARpy6gFHHX
 cs12EACyEHdV65zoM07w3fER71x+bL/lzzv9ak6UL5WWCzMWUhqXM9fuKnO9LcmVm7mqDVNveiN
 AUdXK0/68zZkddeVHu3ENhI9tm92CrnaFx1V2dLwfSBZ7ASs5GEIXvbV3X8Dni3dGphkpvJ4Xny
 gacdtzbCW7nrjji3x1moDcgcET9rxgkmlmmzMcT8+avcRJ68DS3xkcr1GQKPM2RQ/PoKKiQa4Ci
 G2NQC5B3wBRVHkMAz04e7aGy1UOxNekQrxf+0QzO5zgfVb/oo/QF4wqd90GNJSlgjrDlIq5D9mU
 /nJn7XnqWUim/BFCyBola7xRLAr0tdrRKwdmrDdRVULix6Z0CXPXoUgNg9WH6ZSRAgFjSpQRCrB
 vnPqDPNpD/kpE3zZ3W419DvEvcfWKN77fmoIIlgEZt52ZAUV6qc0kOeNxbnEt5JZZSDfloLKTel
 yxBEzzydWWDhu6eCO9iZ+sqZA0266BG1djyrNkXJKzayOLu14ADuG2ul81SZ1DozyPTiO1PIXse
 Z5+pwSdNtIhCqSzmPK3Qod/pzzh/DrDzvMbfB5azT2yP8RymRe7ERcn8iVfr0LcAKOozsb6tx8l
 SxZwGqbUdg/HDLqLVXMx7GWD55Rc+O61o+zkaJxX2U2+7ElCLC6F7YHw6p/4rnKaU8Suw50DagU
 mF0i2p7lsP7AuBQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_053854_133047_4F726D00 
X-CRM114-Status: UNSURE (   8.76  )
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

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips implemented under drivers/soc/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      soc: fsl: qe: use new GPIO line value setter callbacks
      soc: renesas: pwc-rzv2m: use new GPIO line value setter callbacks

 drivers/soc/fsl/qe/gpio.c       | 6 ++++--
 drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
 2 files changed, 9 insertions(+), 5 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


