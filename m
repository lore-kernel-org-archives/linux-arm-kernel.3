Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B53C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqQ0c1cxoYl2N2Q2vFVFFoPIeqLYjgaTaw2HcL81u74=; b=D/BoZ21Jm7nn8W91URdYpWWOGW
	iY3W7PJHSM1H2F2PnaKHlo5ttnKEWCaV4lJ44UoJkpTQ5Pl6/hDf2D6wZCR8jcS6Fc33HSJ0xgXoD
	yVERD/Vhh7ZLBW9ia5qqdKnDK1RvwfFoxfDGhAzdERzBPnLaTqE/zCEO3+uHBYmqurwtNLYOZ1ua1
	35N5PPfsFRx7l+3+/cBF00fRemnQvhRALcbGkMh1e8k0awYZ90JoYBO8SEbT1wlh/tJ9HKZy6+cBJ
	9iHRX9uuxRJ39nhHHVYtzL68n6+swZ8bL0FuqlVLPlkZbWmU273OiU/JntUXn1S8W8pcVHDCazQc/
	HWajaKow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnEwB-0000000GMY4-0fsl;
	Fri, 24 Jul 2026 12:23:35 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnEw8-0000000GMWv-0kkI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 12:23:33 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ce98cb8165so4280935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 05:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784895811; x=1785500611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqQ0c1cxoYl2N2Q2vFVFFoPIeqLYjgaTaw2HcL81u74=;
        b=ekoyhE4w3oxlPRO0mD0yDm8b5VSbsV3l77Prt8+69fS9pDhodFGqwCsx+U+7yMWfj3
         EmfqI4xN7ZMiqBKeZ5FecI9bkO5W1CO3dJ+jfcWt4rOj6Rg4UYLpk/OEvWYsGaxd+Xfg
         lSqoLU5O5oVq6rDL6VB1mpddj0PcBQ76J45+RPRx+PQIdTx6PmsWvL+WWw7e+GpsiYkX
         My8Qbo3KhYtKctuDIBJukh5lbxLFwJES0DCX2YALSaH6zn8WrdO5rQORj6epYDLRHcmC
         k76942hfNemTN5twumkZv2+ltiZvZiik5i+sN9b6fcP57tTtmv8evBU4wvONUta+k6Lv
         haCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784895811; x=1785500611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqQ0c1cxoYl2N2Q2vFVFFoPIeqLYjgaTaw2HcL81u74=;
        b=QdLcHDmnImW5p1KJ427YcVXuvVoxOOHU+PWSd3CTXc+zapChUFupVw6E0/z+3G/fzU
         Krp2wQEI6HUYw6vAsVyUqCT1LPFjhf7wzeU3bYVcoKzMLnZWrHWA/5nhzp8HOqB2fpk7
         1Ur0PKIMeHCyv9P/1SF1FgHR40mNLv6haiM3G2rt1uJQvVP8MgKUM3TYKI5R9v4QIEY0
         PSjRCIYm8yRGWj9vCoSrn3/UCGW8cgIsTs68I2hAZ4Jvj3scFd5gRQZwk/7xI2nRCkMy
         ohvBE4tIpCcRwyZaJTs80DWUrHYG3Xp4pXpTLFt2PHYl0erl9tJEb9ZqZ0GIHyTFiv2h
         BzLg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2G+46RM6FW60HM7cwMGxA/IUEh7lr1tEIUkf5Ej6ZPLOVmPv3lU3ZAfRMRETf/vFxbPANbSNVdY6p824NZLs5@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4zLrdcDAwZqQGdvJ9WzZZrZ9iLfa6iu2K9DS8lrqhBJqsFYWg
	OhY2OLfCMk8+31HiQx68gJikrvNEj8CPiy9MMmuJolbHU76nJEOC5CN/
X-Gm-Gg: AR+sD12sMeCA3nctubYlIWpVGyqzi+25fsvvhfWRcRB/RqygTkwNwwoSRSQHCRsiZ47
	oVDDuHmN7R6iLZlwPzmsZYTmJhz7X4Td+POCqiQce2typVvXGeIwIUXR18KaA1K3A1bnEX0nOgI
	eoZgdHEA2qejfw6mtVBTJJrs+0oUKdM/eUE4t1HduJ+ReHXQLBWQbVvCrGHG6koNlIYule+3xsV
	/8AXieUNZo1rHx6ifvQUHI0NysCYRDCMjfMza8hYES1vSSoqkPj5q6Cmm5lNrVYjLqbmIBX7nNp
	Fm3sfWHPNczuIZtC+6IQ0WHs00sFQs+A/xugVgngDBtpRmFjZiTJtp97vddX6wXKbREmmhXuf/x
	/R+4GrtsG5Q/HaJ3AHJ8u/Vaf9tRYGRQFsqjW8k4kfDGMbTF+mUmVhMuZUiLY4aik5ZVkV5lgBb
	35loDcEma13ZA=
X-Received: by 2002:a17:903:228e:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2cfd72c810emr2927585ad.30.1784895811180;
        Fri, 24 Jul 2026 05:23:31 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:9261:769c:50a5:6d0e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e081985sm31448346eec.23.2026.07.24.05.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:23:30 -0700 (PDT)
From: mdshahid03@gmail.com
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/exynos: vidi: use memdup_user() instead of kmalloc() and copy_from_user()
Date: Fri, 24 Jul 2026 17:52:54 +0530
Message-ID: <20260724122254.121935-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705110221.153481-1-mdshahid03@gmail.com>
References: <20260705110221.153481-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_052332_219219_5057FBEA 
X-CRM114-Status: UNSURE (   7.15  )
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

Hi,

Gentle ping on this patch.

Could please take a look when time permits?

Thanks!

Mohammad Shahid


