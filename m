Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957DDD29DC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 02:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHQDWCh+NRgqnWxAXwGi0xidd1PaBziYcGzk9y7BoLw=; b=CBZBS9SBpBM4I3i3zjBvQSSb2F
	Imm2k/LeusQ6LDqwnHU2ecffpN5wQwH0l4wZuEQc+HztN6R3PgctYVUHnsAXQxyXYMM8NbdRFZvOh
	hWgH8V/wRk4DTUx0oZ+1RXKRPQLyXBdKkq6j1NsyOrtf9Qu3icWdM8tmGYxLnI5pW8oj3BWl+0BsF
	PvdTDnL1zLaPoBRbqGH6kLYOEK7gwoMYFfTEJ8mY7IFocUmYLosKK/INFG4fihbW6lu6NycBYwOJD
	uSTTx0v4MiOvOhvYwInhfTqbdC5j5J6WjWmqJs787BuhGyL1DPcjKfn42XO8uUMHBth1qXCW96E7x
	Zpe2DyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUbo-00000006SXA-1NFV;
	Tue, 13 Jan 2026 02:58:16 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUbi-00000006SVv-08Jq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 02:58:13 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-81e98a1f55eso1686153b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 18:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768273089; x=1768877889; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHQDWCh+NRgqnWxAXwGi0xidd1PaBziYcGzk9y7BoLw=;
        b=ZlCxPzNmgpeG//Enzt8c2/8JYmfiXzEigqIGxAWqoYRzDtq1nc1FgGghiGK4jr8SE4
         hnqUUpkNtTuKzEkzTivd2LA5rTjuCQ0ofU3FhFw+nvlcm801SCdynP5dVgaEogNEZQ9R
         qq88c0yzxRzqJXuyhHKkAnxpPwQJO/RXMRZLn4qPm9FXgMu7hUGRypyKsmvhVQj6k92u
         VtlV0v6CkqwKAQxnd9jVIGWYdL0uCseH/wTfpoB2eKdi8AZojOjmcNC06OXlDIBbl8NI
         IgkKQzgu2n/iodlSLawBRLFZtZXgV5nB3o4enbwm0oKUPVcvvx/9f+3LIGDigG3TWL75
         GL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768273089; x=1768877889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GHQDWCh+NRgqnWxAXwGi0xidd1PaBziYcGzk9y7BoLw=;
        b=MwspLxmllYGGTKuJiq2APkEsSUhxv6oIIWcEBFPsPtHAePbbRT9x44RdnqfQpsII/0
         BckKeR2HT50WLw1qacAnT+mcNUsup6fX0Q7gC/IfgRDCFV8BD7U2xosWPFNudsowqTG0
         SuKAFZn+u9ViBUSMO8NyeF5bdvQczm6eEYxRvM5R20ztENNszah/oIZpxvSDFTGZ57wk
         cDVNuOgvaipazF4N8iG79WYjv8ECZw/c7YqEFggQzQCjaIVsqmnAKSkiDn4+4v8PNExr
         j1iBnafJNIZGmSnXjb8tCMn5sB2hQAEOEA8Tw9nzet9o69Ni8HX25yHzVbSI+z+u6iKB
         fzfw==
X-Forwarded-Encrypted: i=1; AJvYcCV+ABIFN334h8Vg1P1I1F7nAqwV1tpXSSRgA2vF8JRRrDuuhnXQjjw2H0MZ1rD46tMBdWUl6lhyv8AtnNiLQd8p@lists.infradead.org
X-Gm-Message-State: AOJu0YzDB9FdYjZdnBoExL16x1a2yXHwFQL4rd+fvTZWf5Ly8Hyqnoh+
	8CMXfaWvrwIi31kceyBtbn707l42b7+XhwEwynBCyfvhggw4uwl7QN1P
X-Gm-Gg: AY/fxX55dwkoMo3CA9E5NIWisBDv969iPZgCD48arGwxhf8XZy4t0Ehnzj28PemFDO3
	FwgZcAQHLj1ql9r2YaP2z42glgxAa0L8hcTzKYAgzZFYemun+IR/NZBhhED7GEnKT0Qux8E/7jQ
	ZLUTQl/8fXTnimnutioXRoBFSJBkTCNau/kAvWOHjccykDOI3lLTgLEo4RHPyB5HApHgeyCp3/t
	FZS4uDctnR1uvVoddwCgsIZ7OdyRoxg1p+VofVQNXzcgm+yrV0lN70upx5DQgnpkIY3pIANYioo
	NSl9iZUBjQGWUVJWas67k1e53HZf7kvq45/PJCA7+ti7HHEC7CQKztXna2GArQ8Rc0iimQpf11H
	2N8oAULDFbLQPBjIuy8p6JUOFyDofzHg0behsiaHTRoYUp52YrRwr4OrU0UpHyAAMEaR9DN+3sS
	QijfkllbDlEsiNNlzV7uqeUHocvDL0UNDlRNj0/e0XxZobn7vXWGp4WX4+A8nxKA==
X-Google-Smtp-Source: AGHT+IFbfsiwk3WMmRA98lrcTj05l0HYZLZt4FJsgOL46xAEGL9tHmyDVUsE6JBArvoMUM//+uW2Yg==
X-Received: by 2002:a05:6a00:6c87:b0:81f:4a06:6f5 with SMTP id d2e1a72fcca58-81f4a064368mr5838699b3a.4.1768273089128;
        Mon, 12 Jan 2026 18:58:09 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c530133csm18702724b3a.31.2026.01.12.18.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 18:58:08 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Tue, 13 Jan 2026 10:57:58 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-ventura2_initial_dts-v3-1-2dbfda6a5b47@gmail.com>
References: <20260113-ventura2_initial_dts-v3-0-2dbfda6a5b47@gmail.com>
In-Reply-To: <20260113-ventura2_initial_dts-v3-0-2dbfda6a5b47@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=839;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=VIUy/ojlhS11xqGBbDRHLcMgrMJfETQ5L8/p2m/YihI=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBpZbS8dfk3NFCNHd6m+XrVE5Wa9rvTmzC8B2ZPs
 /sYTNpUCQ+JATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaWW0vAAKCRClg0K3CVbE
 gZQuB/42UkYp21m/7ZZCMwoYuNYMF+tzuCHT+265cU9fnLv6RMB1XvbuPOv2WTMC/Pfl9F6/i78
 fYlkW4IXiHMe4ubSl8p3n17P9pihudh8gKaOkI+sA7CWDHJ+1PVpUC6ybbVkBEYqdlBpZ9unCcl
 WXHm019M8JhxDLUw5791HC76BVGDtowDeI0UqV0pzlseM8PcR1VCKY/eU3XAXViNMtFQFB39bV5
 Q+VVQbcYWeil9gw9IVq0tpoSSrP5fblFSo8w4ZGt1/EColvQUhAfeC8+cM7Sd3KoLH2jd+QqE/y
 Fdp3zBG1827Ptry5cijbloluw1R6kAwp95MLtoM5XR9retL/
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_185812_186875_B747A584 
X-CRM114-Status: UNSURE (   9.57  )
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

Document the new compatibles used on Facebook ventura2.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..d48607c86e8e 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -92,6 +92,7 @@ properties:
               - facebook,harma-bmc
               - facebook,minerva-cmc
               - facebook,santabarbara-bmc
+              - facebook,ventura2-rmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
               - ibm,balcones-bmc

-- 
2.34.1


