Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562B9C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1Tvnq+LrVTpNcD6SOjzWHbTaQO8qIplkrwBXtqGldE=; b=0xit4rbJw8ydvz9AonUuGgsjcN
	n2XYJUoneUV7jbjIrBr94RHOdvBYHFGreWD6fhnOPlo+QI7OGHSkGJS6o1YhaTXpmfGcIwQSB7ubk
	JpEnw9wrhx5cci2zEa5rQFi139a+wnvoX4h/u4d8SZ7zSY11UcM6YHaQK8stJqhaoeUxDO/58dT9r
	AL+3d3DGUy0hNoItn0ipC4qN8ePJEL1ZCEqpKacps50GPfyKnA+6qn2NAdoPpgtBYWxpqvQdY5vtq
	ZuesYkNQLcOcW5gzhZWACl36l8sD70b8N1QIOs0//8zQJSoVKIk6NID2Ec12foyNhWucg8C0TkET5
	nxmxINYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGXM-0000000HZV8-0uNa;
	Sat, 15 Feb 2025 11:40:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGPz-0000000HYZQ-1vvj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 11:33:08 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so30504315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 03:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739619186; x=1740223986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1Tvnq+LrVTpNcD6SOjzWHbTaQO8qIplkrwBXtqGldE=;
        b=ZyZS8wLeOTgNItppzZrkxSol+BznWnQ5OhJEtrd5IpnqrKLkT5GhQZ4Ato5M5irmlK
         ihWc/JlpfEYONEp4weWIY95fGVG9SMtZZcMS40UfQujmAD2r5qPwVLBRji3u+nQtvEHr
         ybkjUx+yxVnuuMXqXUU2hPE8hNxjgMATl8tkNSYKEHWL6e/9ILu3sgpKs1IcVs0f1D7v
         pKvGjuJ++M3BoEPEinDPjatH+lC5Kk8TQ17MvDjS1VlZEZqDfcPvDDo3t/BbG9IWj35a
         27z+8BaqJKs084gfSil4ZbgW7oq/m7NHcfNJ7fJYKkuMAysP+QEP2Lee+gse3s6f5iKR
         vhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739619186; x=1740223986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1Tvnq+LrVTpNcD6SOjzWHbTaQO8qIplkrwBXtqGldE=;
        b=Rsv7UQ33VIWYI2XA6wCGaCrPqVYRDKS83IcCjIeCPI6sWBCWnBYIbVox8WFR7yg9fY
         DS3XlgeY1I2cjw2loLKiThfxYp9Mae/PwHlsClfaChU1qhSQTdKDHgBulg1C3igM3PDI
         mZEsagJxjkQqadX9Ky4165ldljdddArEhPK8Fnfir6UFn21S9tULURtclGyUORxDW7wK
         kqeqHycyOn0CLSiDguIU88zwc55wcbndspkId6V91elMaWMsgvFza9H1CWnzCR+I4YCu
         kqHoOjZ/wPVi5AJdsIF75ngd7C/V8HDCySrT9+4SQUaz1o/ooRWrM+ksv9gw7j5//znm
         ZzZg==
X-Gm-Message-State: AOJu0YyYlT4Kz6UHVZefPZot5vzDl7Da2Qhxbn82XPzuBfg/lGlhFMyK
	LgACo8IFv7jG2OC+vw5w3zp2TBlwdm6xnD7VzhOs7S+vnQU99GVG/uVESA==
X-Gm-Gg: ASbGncvcV+fwviXHcyZmwYyW7FzAZJ41XXeIR43URNh/Wg4RamnSuD+IJqGqN5QqhKq
	3rTyJCBDrEVntbDwEvlYRs1H7Pwc/TbH9UydkQVfLwkDX8jAxBO/NdRkxQ8XYAG4N2M6IVHYjBQ
	Ql1t89wu1EFwFggnND1ReQ23J+7K+NLPKwHD6iFVlGOorHTRNlCCkXHe3S6LTAjJEv/Yn5Kyn62
	LUtgiM+t+S0wYjHHHXDxhBZ8b97pufEN2vqnmV22eus5oSr/shzvsVrnVw9spEbYVFOqyAyF4x7
	hzXIXfUWAezhciMwdPoKI4FZa1ccPJoYqdpab+ZWX8AAfoz5uMHb7d9kEwlPpnOHoLg=
X-Google-Smtp-Source: AGHT+IFmakpoCCXWSEw/L27VxX7gbfbjGhmA9fL1AnfWp8TEfa5fuTujZtmv6nXNEKdXKcoQ+q7oBA==
X-Received: by 2002:a5d:59ab:0:b0:38f:32ac:7e69 with SMTP id ffacd0b85a97d-38f3406786dmr3053506f8f.41.1739619185887;
        Sat, 15 Feb 2025 03:33:05 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5e9esm7147538f8f.61.2025.02.15.03.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:33:05 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: pinctrl: samsung: add exynos2200-wakeup-eint compatible
Date: Sat, 15 Feb 2025 13:32:46 +0200
Message-ID: <20250215113248.159386-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_033307_495325_CA39BCB9 
X-CRM114-Status: UNSURE (   9.21  )
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

Add a dedicated compatible for exynos2200.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 68ed714eb..64db551d8 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -47,6 +47,7 @@ properties:
       - items:
           - enum:
               - google,gs101-wakeup-eint
+              - samsung,exynos2200-wakeup-eint
               - samsung,exynos9810-wakeup-eint
               - samsung,exynos990-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
-- 
2.43.0


