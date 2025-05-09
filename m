Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC133C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CxPInF1T9LVjEkvLtOyhGto+ZvX/qrXq2sR90esUvWw=; b=C76ZJTN2A06BPcYMIOcqkPG8Iv
	nCDLQduGJ5zCOpVTEeCrS1HkZtCiZ5sADLzX/ihBTkPBHxVpiefWv+uJYYlk7edg92I42ceAZ5T7P
	nyeYTgsvB6TNtxcPz/UWJ9PSgurUjXO164k5c+8fEJqywc5IX/3jnxill3FEpxmuyCa2uOC0f5Ruh
	LTBEwsAmr3Vwtclzepd7iMSYv9t1AO0hUW9aBxh5M2KDjjUZxrDVJAt9tNFV1EzSUwqI+3ctZebqh
	UMVHfNZUxrk4ncEAHd5pZqIMN1I9+5SoNnsqjgV9jh1Oz/mhsbd8YxtceKIzt9mEvyOdgquRidqZF
	avaj8EEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDM7x-00000003SmT-2Owy;
	Fri, 09 May 2025 11:42:53 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLE9-00000003KLz-138N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 10:45:14 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ad221e3e5a2so71275466b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 03:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746787511; x=1747392311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CxPInF1T9LVjEkvLtOyhGto+ZvX/qrXq2sR90esUvWw=;
        b=fRPwNiYlfBt17X/TuVd4oixZblsQhcFKW2qBY/cBmsmzjcMUgVdJhe5EkjC9+osVNa
         TPJmSgwgwwOnLG+c/iZaNesVYSK+Dw2L3h9U2UCsNp4zETkzM9ZLgFxrDAuBAQrL+KOD
         47nkiz15IVDe6oB8XZAY+r9+q6jz/CCaGAAy/BPU0th3RYVKGVR8XegxHNVZGTyb9nkR
         7XJKuba+YBSBSD7P1ckvT8nGdv10XvQKyzAtXt5FIPHbhHm59Fb+bFZIu5/hb7Sq1i+z
         vIJR4MWSuqYCA1Nx/fqfjMvIGWoxtJaTC0DyZuAUXFNa8E4DUj+20L0jHhMTiYBa5FQv
         dVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746787511; x=1747392311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxPInF1T9LVjEkvLtOyhGto+ZvX/qrXq2sR90esUvWw=;
        b=ISoFc0LVHhF1PEWokMQwTmfDyZoIBuGCj6SSYC7bJdGFzt8EODwTg0Ba1F5JREIcc+
         5eBF1we+Z+lzG5lqeIgzOScLkoumUFIdnp1Ck7A/njqy3AZ0z/AB9FE7uSEYMoxySijP
         2s1lwUt6QSKGsZiDGI/drkRnYeNifYpdULrcf5VHYyAICmbxoZZO+LLy5SrEO+Yo6Dz1
         RqIMgc6no3qFq1i2vZDLcmnEmpH5g3MKOK7j5gjoF6N7L7kLe+uSfM6eivRM4v0fFF8d
         uzicZ0nYIHZlKcjWxELwXWi7fgBcYianQfjqW6YppYr5N9fB9fIBk3qQtDTStgu6OurY
         Jwhw==
X-Forwarded-Encrypted: i=1; AJvYcCU8+4y6QhaAMGIHZ4qS0KU+MQiV7dbYc+vvj9sc/NpOAoYnIi39S9g6s5YA4YJwCrDF/MnosFv5FV2HaclKUVbN@lists.infradead.org
X-Gm-Message-State: AOJu0YyiSmJ9kBlcGiar0M99lUrpukN5mjp1F0y2AbYYz1kC2hU5nqRz
	B3OxHRyZPP+Mb6bFgqfVcjqStxhZty2YHcR3KijFw4Tg+oGTz+sc
X-Gm-Gg: ASbGnctyeXUPTA6uq0OW/XV3hEUVJmijS2BgWWvJ+qGzzNeQ7/CGeWM30/wq5SsZmzg
	y4Z3U+Qi/BB3CyrSyduaDenhJGRaef6x9IvOM7w0hYAhuq0vsg5ibbJME4GDHgimcaWlFL1puSM
	zDHa9hOCiwixUoY5pzz+gWw2Ph4DIriXp6mcRSDKFmN28fwcVYyWWyisLnJpMb87gqRNv5c6vXQ
	L6olQS2PtXIvy1INARTmGHHwXZ2sMtjoQzIlMqyWnmznIgGo21qnPlfnOh3/XBDgd6z5fYDNtJq
	/Et52V+TEUcFRTr0J0vxRWA4XNL/s4WOwuijUyA=
X-Google-Smtp-Source: AGHT+IGGLGNvENgsehRHPyd78blj4yJFAdejnjHHmOciST0qvwqR/4gxuUrwFEkkZ1cDCGVf1I/sgg==
X-Received: by 2002:a17:906:99c2:b0:acb:34b2:851 with SMTP id a640c23a62f3a-ad219170650mr281983666b.44.1746787510903;
        Fri, 09 May 2025 03:45:10 -0700 (PDT)
Received: from localhost ([87.254.1.131])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad219853421sm129131466b.165.2025.05.09.03.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 03:45:10 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] memory: stm32: Fix spelling mistake "resset" -> "reset"
Date: Fri,  9 May 2025 11:44:58 +0100
Message-ID: <20250509104459.28167-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_034513_291858_90B0AE92 
X-CRM114-Status: GOOD (  12.23  )
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

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/memory/stm32_omm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index 166baed0738a..bef7cf4391d6 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -173,7 +173,7 @@ static int stm32_omm_disable_child(struct device *dev)
 		ret = reset_control_acquire(reset);
 		if (ret) {
 			stm32_omm_toggle_child_clock(dev, false);
-			dev_err(dev, "Can not acquire resset %d\n", ret);
+			dev_err(dev, "Can not acquire reset %d\n", ret);
 			return ret;
 		}
 
-- 
2.49.0


