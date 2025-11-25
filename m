Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5441BD0E6EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 13:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=erz1zwGa7q1QFJ0zfxBY/HluYgM2d2IJi2gpOkUhWGg=; b=Gwdj4KOny3XCbCM+Mj+QHS7Sav
	T6xpImK1DIDKT7HU9600zwsh1SDaa8XChhV86O2YKKJdWnanThEivdwinJBZhz41BTFbb335MZsEX
	ui7v3f0cYGo5P1YuPjqYtcaodzgpLGvoh7YguSb4xq6qNNRXViH99iMfFncMr3+M4IGoICsI8r+g9
	LkOTNJajeE1opVYKAgLzn0GS32Yer2iTSmgWpLdc2zJ2JEkMczTiRCBd4Fj0wERdggvWizg2Cwtdf
	YBpL3KqauNmrNQmfbNG2RAq3f3SQTaeZ/8FX3zyMAJrIKvnLdRRhQz65SvSGJ1tqWGKcGNmZpaUhP
	GzW8mnSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNta2-0000000DOKD-1SzQ;
	Tue, 25 Nov 2025 13:59:42 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtZz-0000000DOJS-2KtP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 13:59:40 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7aad4823079so4870524b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 05:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764079178; x=1764683978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=erz1zwGa7q1QFJ0zfxBY/HluYgM2d2IJi2gpOkUhWGg=;
        b=CGpRie19qSFSOoK1LmzaR9M6VJpyDQ2ORnAiDHxSRqXDGQ0BR10xQYuDD3/vq9+IYl
         d0Y9xxkbx6P6mOVGD0WX5Y/P4zEgO7As8qOWqWBm8c4VfBcRS/wPxtSpso/ucH0SvkYF
         +XwabMjh9gKzKkCAWUHMjJfjZlUBcMpCmUr8gguLXYXt1ncwPqkShKhj4ErZhu6t+Hhm
         ncP/nCZcnwC/FiBvrYUtjbFzix2Iv0IPOvRGzljEa7/+Wovi5QeSSMhRT++2Tyeu0rzV
         l1Q+qe+vMFb+659WC2zm/V1mmyZyLSs7Hqz+c4KOPTvV0ON4xj8JFSIDxfjpMxQnyxhH
         x/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764079178; x=1764683978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=erz1zwGa7q1QFJ0zfxBY/HluYgM2d2IJi2gpOkUhWGg=;
        b=UdtVFoetmE5gvqsqGg1QckcohaLeaPAXMSqILqwCX+SsQ4jVFzl6c+CUlZp9V4H18Y
         CGWnUweiddw0ght62qPhjJR5lfcbRT3XMkKwATQi4PJS/p3zPq9DZ780OVEdU24bkZSr
         mBIjJtCvD10J155azJ5ZCJPNuEeJO9lEvH9lrW1xZh6NZ403echJgyM77zncD4LTrLgz
         NSqWmqJJmU5Uiqh8MMrfzgGkdAi/ff0pouhD7/boIubv8UKN8+qr2PwUSb+oyGB2h6wf
         LZuE2sxqrwqJz3I/MHBwl1Xb6Ap8mGd/Zoec/tcaCFW5h2ZBw5xOlBb1ZKosL1Qt0Qay
         jtQA==
X-Forwarded-Encrypted: i=1; AJvYcCWDZxmvdl+Skpm7qafmBPFgLu9Sq+WeOj2vQpUwp09KgMa/3or0KKc8JAzHuZSVIMamGfhhTea8RBxKTFNiGD1Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt3MSXj1odcLz93b1RbuD0Ts5AYfcudwg3If9w9EYJy0Okw+73
	Ig47Y/TJXzVf69BR7tKPSyxa0bH94DoCpAzD9UdfEka81OlY2PxmYMuR
X-Gm-Gg: ASbGncvA2Uz61bWGHwpkZN+Fo2ptt7u8LJjG7Rl3WbQm3YVWHQXm+TtqKvGbOXaOgcD
	wHKdtXKdE9y/Y+yld5QUCi3345Pu4dgXRU5x2G9v8DbglTPH7Wv5MyVbYXKSgT/d4WnDbqUgNrz
	u0NQ7ECP0kvDM04am7YVtmUqGHh+GKiVNXVPA9E/fLWa77KCAz84BIlyCZM+eE8zn7Hf5YIsUdm
	OMcFVZqbwrwtNb2VyfFi7FxK7x0+TV23yVzXDyEJpMnljGRQDTT5Bs0EjkL8VYjSJcpX1D15CfO
	IbUmeINtI0rsX55E5em40vFlpT6KW+kHyAYuXYtrLIK+p3POGloKJ59qKnaRpNPG920EMvtqXzv
	yiB+luAwDUETtU3VllSOn0qAUFS1OaLG/b36AfXnjapgrhp4McVnyFnvp13hX2quNksdA/Q5hys
	AzqRbaGkHS4l0blbefPz97ypXNTi/lnMTGeeBmw3KNeQmbF/Y3YhBOe1DRbD8/SxhducLClS6lj
	dc=
X-Google-Smtp-Source: AGHT+IFVBajfyb+jYLNhskTrqSPpLmpzWD4wi9ojL6pd3vnt1+ELM9ZLZ7EskwccDjqdCqnuHCwSjQ==
X-Received: by 2002:a05:6a00:2e9e:b0:7b2:1fb0:6da0 with SMTP id d2e1a72fcca58-7c58e602d9dmr18324022b3a.28.1764079178410;
        Tue, 25 Nov 2025 05:59:38 -0800 (PST)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b63dbcsm18216028b3a.50.2025.11.25.05.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 05:59:38 -0800 (PST)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Revise Meta Santabarbara devicetree
Date: Tue, 25 Nov 2025 21:59:29 +0800
Message-ID: <20251125135934.3138781-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_055939_594927_9456647F 
X-CRM114-Status: UNSURE (   8.52  )
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

Summary:
Revise linux device tree entry related to Meta (Facebook) Santabarbara.
- Add IO expander node on the switch board  
- Add SGPIO line names to control ASIC module power  
- Add IPMB node for OCP debug card
Fred Chen (2):
  ARM: dts: aspeed: santabarbara: Add swb IO expander and gpio line
    names
  ARM: dts: aspeed: santabarbara: Enable ipmb device for OCP debug card

 .../aspeed-bmc-facebook-santabarbara.dts      | 29 ++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

-- 
2.49.0


