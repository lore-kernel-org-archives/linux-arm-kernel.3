Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1445CEB2CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 09:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43JeYWuHKtURhUFg3KcuzTVi7n2XDdHqu+mEl6pMXsI=; b=i0x6Hqd4OlJpXzNShUo18QUNga
	xZ2wn1L+6q3b8DGrnzkFkVljtG9ISLtAXa5kgCapw8MCbmQuuE8nEKzGYWnWKGJJF15u902Z8knq0
	a36mrZj9G5LzVnYP9BjdOZptOKBosMrVtiJejCdLlztKWsLi2SCvVY9LydpbLg2fOT9TvNF757eeL
	KilboqZ3pAgZeCVpsvYjhPdDq0xyUINnuuiMNboeXFfAadPn6IrvEw35150n/yZ3FuUwTIGCnLnKm
	uv7LykvAaqS+c81eYhMqOFF1u3XIz3tjI7o8hmsfKR1QKZ+K/syGcNNOK95aNgzwHPqD5Lrd+saBX
	kprkxEow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCIx-0000000DdKW-0Yph;
	Sat, 15 Nov 2025 09:10:47 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCIt-0000000DdHr-2GDU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 09:10:45 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-bc09b3d3afeso1677439a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 01:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197843; x=1763802643; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=43JeYWuHKtURhUFg3KcuzTVi7n2XDdHqu+mEl6pMXsI=;
        b=YgWBi2PUoSGErTmGpOHU3tDwdU9mRtm5YKn9NlebaJDlGdr3lD5Z4gI+imeJO2ZrYt
         eBQ1NKJQtkxfkm/e1SSXFrKpbBiOqDMY2xfKTfx1Q8YT4F3qqEOpzk85efobjVt90Shj
         yFIFeTVpswfI1W95cyXp7jc6i5eSjY4KY2alNNw5lRr2LmUhUPdRr1NqovyYvn8HsA/1
         3Evw0LSDnYtqxFALqbzlF4yAaiZFJTDQNMVJ9fa/9vyYFiBt6WJ+KEqt6Jq/cUopfCoW
         DVqvfNeMj47DaG4JPXhDhWupXNQ1baVQCuY5SJFXAbrbz8ePXgShoFoxNVsaNxeO/Nsp
         FZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197843; x=1763802643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43JeYWuHKtURhUFg3KcuzTVi7n2XDdHqu+mEl6pMXsI=;
        b=RVp+4zbRG56iW0sN4DpXjywPWbsfE6mnCC/yvBXbqFoJysrcUd0zdcXCtLpW6eNyFK
         +v8v6ZkAOUZbFy8DyUep1IPyPSRC62Z7dcmbIEzqJcocNySGTKlzfgh/KQYW7WYDOWJ0
         XA0u5P6NCt9H2dTmLGG//3Zy+LLC246C2JsCZOpBUXvUH4rhLoUDYsbn8YkOCg4IgGR3
         KVqrU7UuUDT+cYpZ+a+4tJWDzyAA31mD0BbA48G/YiMO3/upyilf+xbY9wJPar7fN2G2
         ZR+k9VVJXpU2889k3/drJQY0Vyua8Fb5ZXAi5mDpPS8Nt+3YKcjKU8T/krv9Q4yJFQU7
         a8Qg==
X-Forwarded-Encrypted: i=1; AJvYcCV1ViFBICrwJrKjPoBzeD51V4FvXHelQjkAYO+/6aV/zvrKpCWOHnMSfVr6EvaG57FRPm8KtUpfhnwamFzIepao@lists.infradead.org
X-Gm-Message-State: AOJu0YyxbKfVFfAAPRQcwp0I9RL4X7fNRLe5mJVpbelqUfW6Gwf9eYMf
	9pHZEn0yJ4ZeEoxsGwpltfKJPWhHKSsJOS9DTFwr1IB4WjsxQjUOMOGm
X-Gm-Gg: ASbGncumlTruOdfsQ12fbasL9sIGpKfuzTXPrlgxWF/RUqafpaQeq8moxfau/56Kfqm
	T26ydmg+Pu0X26U7JSZfdK0HJSVAIgn6DjTq7tK0I9p//UxIe7b7S2YpeSm8X96BZMXELyOfQmZ
	bvIu06+wG+NWzZN/qPw5fic5xIgrJsj3KPm8MqOWNgX7gVqraHF7Ovrjd+xKVxnfEmE5XNMPAre
	vYN92HjoszxWxF21YEi0gP6msEzwD7/I9dapzmCng0Y5Gf0ENNdd+7I0KcVPCqEvmNOu3Ise2NF
	JzZnV+jCSQ47RtSp8Mok72+ShttEB7S5pEWIsKzf9AqxWo7VrBnE4xlEbEnI4xWNrwQIB8hVujg
	mYJf++JT16f3GZN7YFbUOYMprA25qKpwiudRRY9Jl4zaaLpzsKhJb52QOHt07lgUaaNmVTcXjtQ
	==
X-Google-Smtp-Source: AGHT+IElHt3OAfMQunNnxmg0BPEu4aQyjchDbhYGwGxKZcOlUa5P+fzvsHcgcZg533YgbRMtBY3msQ==
X-Received: by 2002:a05:7301:5787:b0:2a4:3593:ddd7 with SMTP id 5a478bee46e88-2a4abab9ccemr2414709eec.4.1763197842582;
        Sat, 15 Nov 2025 01:10:42 -0800 (PST)
Received: from geday ([2804:7f2:800b:a07a::dead:c001])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49d695821sm22796380eec.0.2025.11.15.01.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:10:42 -0800 (PST)
Date: Sat, 15 Nov 2025 06:10:36 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>
Subject: [PATCH 2/3] PCI: rockchip-host: comment danger of 5.0 GT/s speed
Message-ID: <b04ed0deb42c914847dd28233010f9573d6b5902.1763197368.git.geraldogabriel@gmail.com>
References: <cover.1763197368.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1763197368.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_011043_581272_5C984671 
X-CRM114-Status: GOOD (  12.86  )
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

According to Rockchip sources, there is grave danger in enabling 5.0
GT/s speed for this core. Add a comment documenting that danger and
discouraging end-users from forcing higher speed through DT changes.

Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index ee1822ca01db..7e6ff76466b7 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -332,6 +332,11 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		/*
 		 * Enable retrain for gen2. This should be configured only after
 		 * gen1 finished.
+		 *
+		 * According to Rockchip this path is dangerous and may lead to
+		 * catastrophic failure. Even if the odds are small, users are
+		 * still discouraged to engage the corresponding DT option.
+		 *
 		 */
 		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
 		status &= ~PCI_EXP_LNKCTL2_TLS;
-- 
2.49.0


