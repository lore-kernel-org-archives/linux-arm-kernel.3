Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF902C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 22:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beA6gjGZdB5oydWLbpWxW9pYKOlWwgtrMIKBgVMVP0I=; b=O6Z0bklRoqEcTCrFNx1f8OSPwH
	4e34FGzuTCl8WE+VDw0VphxkuA97901SoAONXdMA8QZTxwkOB41PlH6e8X3uSBFZ4UrT5UrZaOipZ
	3L/LVCwpNWtbnwAI4EVj3k8++bV7BchhDHj0Y6i+uVHgJ/8lZBG5LY2c5gV+do6DjxM2QHnU/cAfp
	30232FqeDKbzA9IOOpxntmlZQlg+psyNKeyb0Zi8fqzO/QwnbTskm8o+xz2P4gbesut4jx7n8KHCg
	B0K4ltyacf8tR5hGm2kxFS1A7aO/Z73ellCnrSw6LM7zGyQmISyET405nNUE+D/mSr8wWifllC6n+
	npbT1VPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnw2-00000004k5O-3RrN;
	Wed, 05 Feb 2025 22:31:54 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnpo-00000004j3J-2NRb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 22:25:29 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-4afdf300d07so122761137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 14:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794327; x=1739399127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beA6gjGZdB5oydWLbpWxW9pYKOlWwgtrMIKBgVMVP0I=;
        b=T3eLvSChZaxigSkM9+64kB8D98WO2M5xUb/3jot2LxnvkM8RFpF7S84Ylvpl3O5Mit
         r6G5QSkFQX64Cc1U43tVEtJIkbRNujRO0t4tdORlVOXqHNXagV8i/NuuoZAjv/qJ/wl6
         ci2BKyLjCj2bocLvnEdmbbI8ITMk436CZtfIECstA6VYbriuAII5WFy1xYUOWk2sm/+i
         Af71QElZcuiUEz830oF6dajFhCY+N0z6MQPf32Bs6E/kB96rzeLuPdbLF3aC14TWQGIv
         2Bhf1gHjXfrna9UPbCH/JUJ2lKv9u+ABMgW94xkkWJ67T9fYxaXMhOSP5w5PQxvI9+LX
         9ybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794327; x=1739399127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beA6gjGZdB5oydWLbpWxW9pYKOlWwgtrMIKBgVMVP0I=;
        b=P3P3kDiRJTe55lg/J4F+QHNw9lXwmdemwm4WDadtntlfDo9p9VG/jhAARDErtg8cwM
         EG6dyPs4cT+uk1wuU4ZwNEUzQLKEa9oDZUJIvG7vpNztnumREwx+C2Lb2VH2M7xT1ZiL
         +2AleW1TWeWs5W4bHlgP3A30He9roRP3GxhdKWwFCPhKqrtlFkWuC+j7ErYSJziVceQ7
         9FB+OY30S4NLssk7HEbvitKqaAxmrjCC6idNRu6zOKw3t/fDLdUyDKyggTKt1ICZmx8C
         PYR5io33NHtfGu5fN2lcdIe+LK5/Bq/piUEzUIBgro4YpqGDJdUD/5T1ttMoBY2xtudF
         o6jg==
X-Forwarded-Encrypted: i=1; AJvYcCUMNQT154F87LR4JyOWqEWgM3hjHKttdG07F4l1c4LhDV1U10QRk+OKYFfcDzZDlT3moPpYRMYFSAo8uZfZWeCP@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9Pv1FfIl22kShwSTLPsp/fIMkvNZkj01ROmMfiiruRnumqMyR
	RLpbXFkpK9tln1bXZ2lC6SBvKcLwXyre8m9l7XkaeV8PCgbeFaHv
X-Gm-Gg: ASbGncvAVU9m4T3KLylyWnAiFnTWPW17xqYGCGtcyv/7nYOmmLj/SVjdyTmprToFFc/
	gZpcJf+8kzp/z5sPjB7Dy0YsRyDfO8lI5sFsl5TUArBzjkCmluRorXfJS297MMLRMstN5vGuu/p
	g4LITz7Wb47GGNIGqywprmVyebaFiSggw7KdUeC11EdNT6MyVcCp6BiCN7ez//mDwFTDAB+FGPI
	YkZwSUDuNbqeEiWqh1z6yeEKlhd59BVCua+LZlMPkvHpfW8QfRO4pGZWqX54CQo1fERThF13TLj
	sGmOgjNJzFTMUmSQr/x8CbKwENrv3wFN0smpj/FLOAL1D+NDltsTXzWSn2EJkL9mpAnkjTFqgI9
	a8Q==
X-Google-Smtp-Source: AGHT+IE3nI+T7UN/svC5dEEyiI49AVWPcqQVx+uU5ZAnx1goXIkB2M6UC2RNJ+9BdlxIm9Bylg54jg==
X-Received: by 2002:a05:6102:8086:b0:4b6:4502:4a84 with SMTP id ada2fe7eead31-4ba478b3533mr3842089137.2.1738794327322;
        Wed, 05 Feb 2025 14:25:27 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941edbefsm2475354241.28.2025.02.05.14.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:25:27 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 4/9] dt-bindings: samsung: usi: add exynos990-usi compatible
Date: Wed,  5 Feb 2025 22:22:18 +0000
Message-Id: <20250205222223.613-5-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205222223.613-1-wachiturroxd150@gmail.com>
References: <20250205222223.613-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_142528_607109_30F20548 
X-CRM114-Status: UNSURE (   9.18  )
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

Add samsung,exynos990-usi dedicated compatible for representing USI
of Exynos990.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 5b046932f..4283d35f5 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - google,gs101-usi
+              - samsung,exynos990-usi
               - samsung,exynosautov9-usi
               - samsung,exynosautov920-usi
           - const: samsung,exynos850-usi
-- 
2.47.1


