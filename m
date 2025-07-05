Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069ACC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 08:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+YexH0/Cw2vK3u472+/AmEbOqyns3fkq80p4YuJEWCw=; b=W4pzSw8bNRLmKj7jmfSOczoq1k
	9fC5kXe2aha5T633/x4khW6wUUUQ7SBZyO7PqnHc+QTYRBlwe+LVnkHolWvIKCPjhvhObI7nQRiNR
	VUODFOnlk7M2y5CyMg9eNgkAVB4wZJyW7OWJYAXue5Nj+CRxF8LjgJNL61SR/FwCFezF/JdbJwNHn
	CJUaAC7TqvUcHlkp4o3OSaKohZWplgYESxWgMtkO6WCdHWl3NNCOboBqqJ7uH+gwFEeY/dFDDoFto
	JqPkK0hpM0aqXk0/n4l3T9Snt7L9RGud4zciwaY1/ZtMk8choln70/OzsIiT0n6RrU98Jg0tVazuG
	1WgOlXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXyfN-0000000GJgt-3SDL;
	Sat, 05 Jul 2025 08:54:37 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXyd2-0000000GJWX-3ekY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 08:52:14 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so265071f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 01:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751705531; x=1752310331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YexH0/Cw2vK3u472+/AmEbOqyns3fkq80p4YuJEWCw=;
        b=lITaE5MHrCS4h1foTXygGqA3eolO2P+TaV5cV9qLuqxziotu+Fdu3NCaGjnVhWswhX
         oi9xkHmI53OsBKuAB6NSDObBxQQ7txt7AEfSeN/QMC23fxNDgUsMcaKHAWlr5YSPqt7n
         mmjqvdrQH3dwEXBMr9V1AjWa/ecYMdE3kcXz9KxDAVd+L4ODUaPMpHg9hSYX22JGr0Sk
         54QlYb5MPqHuNVEVE+SjImwfbWtvBznEkQ2wJFyGQ//YtCd+CJ7f4G2Rud0xBPwEsL2p
         eGpDYfc8cVQEE7w4IdCSIkRA38CCLG9r+V+TmcP8G5h3wl2PN4e0YHaV72OsruGk/2Uy
         C1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751705531; x=1752310331;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YexH0/Cw2vK3u472+/AmEbOqyns3fkq80p4YuJEWCw=;
        b=qE2umgRfW7NCOE3Kt8ZGapiEMqLBVXznsKN1rYZ/PbQC/1gXZxtPEv3W8bvLqvuBjV
         d5k8WI3KyHov9b3FL5xB63MgL0ZaC+2zWIy4zmDcLcErnyDXh+gTrXp0kZeMuiBykloI
         EF/+aNbxnNrzC2AOi0D2I9RUbXDepK4aYbMtWrkOVkOk0vXI1eRowhdRV/xYrINeCYaY
         e958+nOqozbioB2W4tOHiEy+g6tcFvACEl5ioqnfbFrtW4N6yN52cwOP/0v3F2nxxHP2
         vb0N8/D8n1ERr5T4M59jZQyb/+qTXXAamNR8Weid3Scn0BGIcVOn+WqqDl2PgYGikQWN
         8t9g==
X-Gm-Message-State: AOJu0YykbedvRo1ji97lyRNucyGc3krNUx5kRH9bAALl4t37HopTiHs2
	E9X3J3gFMIgooQ+ctP6l2oKVrZ/ZbQ9GPMKkN4K8alBg3StQ3izNitHA0UsnwGjW7X4=
X-Gm-Gg: ASbGncsPWFg7CJN7a5L0VdX6d9q7KscReYZKbEgZY+UJ8IxjdL2Sg3rh9k3YXkvdfWb
	Tn2QiSTO/g2Fv2jkhxRmONqXY6KWJB39F8vxXvBroZdxgTWlPm2cbkmSmu5RnnCSLSBzvSml4hj
	fa/efXQwdTeUBirEeKZ5dTc7z40eR3jHJc4Fb+WC3BQQXrMbybXG880nTxcaWiP1qoSFnmG9nHO
	SVQ9pZrdjPZKRd8VhNrVR0/6LxgJI1wKdJ5gHhd8FP36j0N0wWtsqZHhhRKRml4gItRKWahnfWk
	EbY9cVizIWG4K4hEenZSa7xvVZMyiOEdvKM43DsJ+A80CFG8NET96BYgHMsnyi5Y67SBavni9K/
	J
X-Google-Smtp-Source: AGHT+IHKysufxmIYEaUhEZUWuBYxNVyIKb+YxnegutQsUA9aWiJMJC1+caAqnYzQR6tuQ9454ZDmhQ==
X-Received: by 2002:a05:6000:2281:b0:3a3:63d3:368e with SMTP id ffacd0b85a97d-3b4964c4845mr1539622f8f.0.1751705530869;
        Sat, 05 Jul 2025 01:52:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453b3542838sm83558635e9.1.2025.07.05.01.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 01:52:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
In-Reply-To: <20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72@linaro.org>
References: <20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Fix gs101 irq chip
Message-Id: <175170552946.13533.13306736962764996194.b4-ty@linaro.org>
Date: Sat, 05 Jul 2025 10:52:09 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_015212_932983_7DB4694C 
X-CRM114-Status: UNSURE (   7.06  )
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


On Wed, 02 Jul 2025 13:15:24 +0100, Peter Griffin wrote:
> When adding the dedicated gs101_wkup_irq_chip struct to support the eint
> wakeup mask the .eint_con, eint_mask and .eint_pend fields were missed. The
> result is that irqs on gs101 for the buttons etc are broken.
> 
> 

Applied, thanks!

[1/1] pinctrl: samsung: Fix gs101 irq chip
      https://git.kernel.org/pinctrl/samsung/c/683d532dfc9657ab8aae25204f378352ed144646

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


