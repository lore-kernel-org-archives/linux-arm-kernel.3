Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D8ACCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 15:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZTFmK7GZ1TVUPmzZfwKDAML+TZOEpqWW3nJyVTGLdI=; b=j3bssQ71NhLjIK/KEAErrHdqMN
	stxTTvAFAmZyQ89o9ct9KerpFWi8zMh/B2nPHk+JPiUpIG5qUaMzDpRyQwmrBiEBcswAR7TbOF4ez
	Lpe8rUZFwUB9sg39xUwJqa7dq8ERRiffK6QeE7B2/Sm0DqagC/dGDAmQW+itB8n6WRa80yX8GbDTd
	JBfaqYoxjmPItuuviqndyeuZW9AkKhJhVNNdXjso+hkXtkQMnlmk/WJ7rPUFz5V65QoUpE3/V/4c3
	3vLw9zo+0R/ugZFZmCMlJ3Vpy8kfDFtk+tApDryV8miC8Z47isVrPvfcoo6QISBK+SFPGmvIMfF7s
	DlIXjAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOzO-0000000EDBd-0NgB;
	Mon, 27 Oct 2025 15:18:30 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOzL-0000000EDB5-3uvj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 15:18:29 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4710683a644so40146935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 08:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761578306; x=1762183106; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZTFmK7GZ1TVUPmzZfwKDAML+TZOEpqWW3nJyVTGLdI=;
        b=Jr+s/OJvORjS198r/Qe0/sG0G0kblOxwr2ejToNfyQxFjRuoKOjEEbV/0vKmhzlyUM
         1MxZV0lJKe7yRa4B8Og7/lGS5xaoTAliJMVMkO0JYdfZ+h8bfHieaMZLdR6u7M+tYQuF
         bC0y3K45X+j3tNg3rhv9nHbmgHeXppRTsg0neJdEkrzZEFAFTQbVy7NbJfPDs6ZI6LGc
         QwkSMF2bS+Hs/FBuOkBUiYPtxZPUOOGNfcyljjGvfRAu062aDTXRMbS6p9sUwNvy6hiI
         W5VNpQprKukkcPeL+ILSBoz8S9QffK9nEZwTPaC/lYwVBayzrKldyTbV30oCNCXbnsql
         Uqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761578306; x=1762183106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZTFmK7GZ1TVUPmzZfwKDAML+TZOEpqWW3nJyVTGLdI=;
        b=V4c+8giAqw/qMkSNgaMUaKg0EzL3LWI4bqeH1frs1EVVk4vD+kVTDynWmywOTiq9ai
         b0MdvUhxzgYRFmq24nJmfaUQMkFe+rfnINX1/vIEDdrADZ0ATx2rHpFztaalecxOPVqo
         eb6JEiI1CO9kO3k3+uJTmMmDSG1XkmSDX3FK8inJpsJQ94whw22Ga0vIutYLPk9ZiTH9
         PLWNyVCoIDOTJuN7NF8NGeS8pCM6ofI08KYOd9M4KU0lrpYHKOhRIagX3fHa4QyqL8MA
         klZGsVsB5NpdPh/UhfFnteZLaItqQr4AVCW1UbMhzkPscJ1yodpd5ayskCuCdst1xGWe
         iJ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUy6SmXBgaDMK+02Uce+VrVZEtlj15XJAU8kKetg6igYabBmDeJOkKq3BBwyd1vtVQUWpdXMe0XtHMK7yU68mT+@lists.infradead.org
X-Gm-Message-State: AOJu0YzEpdfRxuGMex9Y1DHA06eOCCdCgz5MVQgBK9vpsjPeZoaezcvA
	ptQvmpCdGlklrgwSS6CGnGJ6OQnuc76m1FKfyJHEENScd0BCpFp8drywvtRKQhJYyqU=
X-Gm-Gg: ASbGncuVufA/StkhySYUk8jystoTvagi235LEpm58I/nE9vNa6Xn+Z1Rngxfisnzlvt
	0x98lhXtsxtQODyNww5UhVBH8qHpO3Hl4J3MB5fNO5g+jjq0XwQtIoBJJjOv6/8jhYyEFlrgO6y
	7eMsjYEVwsCvFoPdZIAnU+GN4/d9vW0yx8/739hmhSKBFo6IpATJ41wP6lWGjBa7zRvPH4NsoNT
	kp5BNqqFI+SZxvhJuHSdL5G4W0Ml1DWZmhgFsMXFCnH1lQ7PwEtD6g9ozN19rkYpwrZzRyn6iVz
	ez7A4GhZrpDLaMG+sx/6BA7nBE0CSk8rR8+FfccxMMfOm9DBVqAi3WMG2hbw35ufSshehL1K5Ht
	6LTyPpgFPVDUjmLfLYyzSU9HuacPcv/oiGpsSgLWU2j/4Kg5IqfGjd6fXAt4RrgQ+kJH/NV8edL
	jKRJScqQO8P666+8z2
X-Google-Smtp-Source: AGHT+IGdQ3Pl8WJ0Jr9WgElxkVUFCnaBaIruVM1SpSmzXhkaMb4CpF22naG2Hn16N7UnuCwyffttJQ==
X-Received: by 2002:a05:600c:3150:b0:46e:1a60:c995 with SMTP id 5b1f17b1804b1-477175ab715mr4793705e9.2.1761578305934;
        Mon, 27 Oct 2025 08:18:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475dd4783b8sm143053295e9.15.2025.10.27.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:18:24 -0700 (PDT)
Date: Mon, 27 Oct 2025 18:18:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl-scmi: remove unused struct members
Message-ID: <82a8a4b206ec02dd27a119d7f05d2bd6c8d2d3fe.1761576798.git.dan.carpenter@linaro.org>
References: <cover.1761576798.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1761576798.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_081827_982254_FFD50D94 
X-CRM114-Status: GOOD (  11.99  )
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

The ->pins and ->nr_pins members are not used so delete them.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I sent this as part of an RFC earlier.  In this version I deleted
->pins as well.

This can just go in by itself.  It goes through Linus's tree
since it's int the drivers/pinctrl/ directory.

 drivers/pinctrl/pinctrl-scmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index d14528b9aa31..af3ac031e362 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -40,8 +40,6 @@ struct scmi_pinctrl {
 	struct pinctrl_desc pctl_desc;
 	struct pinfunction *functions;
 	unsigned int nr_functions;
-	struct pinctrl_pin_desc *pins;
-	unsigned int nr_pins;
 };
 
 static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
-- 
2.51.0


