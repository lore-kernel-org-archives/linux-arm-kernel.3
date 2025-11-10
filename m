Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67857CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 12:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mokE1STeYnllduXZ+33QLu6bZS1LJLoqGu+1OJ9vbsE=; b=MozE2wtqVJnGjmOpSiNH4hPLd7
	BQe5EUz5EncPUtmgHQG5+qpp7ml7LIax3GF5UJ0UmuGeY7IOSlx89YTWb7/3ZOfH5iLvjyC3jxZ6v
	cNarHa2LA9Cj0u7tJxsQS/U2WND/9suTI8+e8TWKhc4nEMwHghpaK9BHSNVr1b2hWtVcqNVpfYXMA
	OzEgmQuHQcZZ86RV8o6t7SRasFK5MlOiZz/ODtidgxBzPRNeB+hXO2jqzpQB00cCTH5iFf1CbFrwA
	sglAQugB5xGSeR0qZ8aj82j5Tzz5hJ7chiQ4FrayhfwoVXgRAJWOaSQTSbVhQc/k+/eEw/fRBncpI
	gHQlUWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRFV-00000005QoW-2U3k;
	Mon, 10 Nov 2025 12:43:57 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRFT-00000005QoB-2jLK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 12:43:56 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8b1b8264c86so297273385a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 04:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1762778634; x=1763383434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mokE1STeYnllduXZ+33QLu6bZS1LJLoqGu+1OJ9vbsE=;
        b=p84bBoZD97ymD3xRPjgsWVk9+wG3qhtKZ3uyEfchho+gdwNIWXg5AVEWhmzxEAEYVF
         4H+jLZusmWQ47VXB6ccjglGjfVvJw+eogrLDiY4tibxunRy+oppdmFbmZnI/lMMiNiFW
         B2unpu3LFaro+K4nUeNsTmeK1tqJ0PBFrkru/eROG5kP6u23iLXLRKlCzXh6qM/leOCd
         9pEsuqt2CIMFu3tLT/N0ke3tssBCgT/Zr9WPvc+fnUeoDMYFc8cnKgROOtFzetI8vFrA
         kPeZwlKHLkZfM/9WV7YiK/XHTMNtgxcL6GdmPpx9kPtnoB0BROH/Cf5no62v0lt4xcfR
         VDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762778634; x=1763383434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mokE1STeYnllduXZ+33QLu6bZS1LJLoqGu+1OJ9vbsE=;
        b=lTbI5KuVDi34oarlhe6T/EEebVrMsbzM4Pu5mRa4kxGWN7N8nTkkymNuAn9tZyi9PB
         xH3NCSIsG/jxOEyLLAxNeSLN9ArHPO65hKUHfG+TrILE+jSf1UC9sa7t1QBMukGotNzU
         0n05NKD+f0d8VZWu8CFppx0HmC9rj9tjbrwHHgmoa/G2wEY6KOwkJrp0/y2iRMrUG+VA
         Uzctu+EGAh2LGOcNf6gkEElm5xUXUM5itay96UKSrqj0dGg1JfRxF+SgERoFMQusyQ5B
         BJtdJ9x4kj00DRmc02zkYBKoA3n046um2Ve2Lxpl0mX07UqSkTHAo0ul8Xk/NHueToWE
         aSYA==
X-Forwarded-Encrypted: i=1; AJvYcCXAWkFKM2QSFFLPP3N1OvdAVxjnUBtZKrZ7w096uTxyKbhKxP5GExNE6FUEHcmC2bVgbVX32Jk69+JK6ZhavBtD@lists.infradead.org
X-Gm-Message-State: AOJu0YwnDJfHv6UN4/BBD/ubtt//N99TYx4lmb4vts3R48KVwFgzHBKi
	SzJh0r3GqF8qDhK/5Vumw4yuoh1lXFSirmo0p1hhfbc5cGpJIUAUrErHUyQ5NzjGG9s=
X-Gm-Gg: ASbGncu1TsN6NVDvCKAGwEpHc2g6ZOlsQtbZAhKNn5E26HVAbOOh+uapcdv7iAMMsiB
	L43paALcMIUUowQk0c89Blqk8E7GM+h2KTKju3mgrrYvIBsFtmt5fvL16HjnZwB9Ee6tBYpz6zX
	fmc6BfD9wIPxWYtPjdmpGxGpxKygdlzci1oeHmQw596wwlKHipTV8AMsRsWT7jOShw8kyfwIqLP
	i50AZ9eFKYpIiOYLfs8OJpGsdu8/r9OtCFnkzz//J7rcWv+1KEPtj90Mxuj9+0fqu8KYdLxaCGc
	AjCCBM6ghiwl1et+jaK2CndliMb4qkf86DToxC10rtKrhrjCyJA6uq6oh0t2ue7kbnu3eP8Jnl1
	qoEGY/16bAzQB6y10PaPyMH0Y32E/vDAFtrrnzcFHMZhS6Are9kh6Dmk/P+ke3r6TsaaZSSiuvB
	nfiURCYwo1g96HSQD9ZTBLg3Yr0e+yqQk=
X-Google-Smtp-Source: AGHT+IHzD9vQiWPhgW/CmDZ0Sh3mVAM0JnEabgV9DyCHXVHZqLCr17WfmN9Rv8GMnK6YWCsW15692w==
X-Received: by 2002:a05:620a:2982:b0:8b0:f2bd:474d with SMTP id af79cd13be357-8b257f6bb13mr863976085a.64.1762778634203;
        Mon, 10 Nov 2025 04:43:54 -0800 (PST)
Received: from fedora (cpezg-94-253-146-68-cbl.xnet.hr. [94.253.146.68])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-8b2355c24f6sm1002765885a.6.2025.11.10.04.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 04:43:52 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	horatiu.vultur@microchip.com,
	rmk+kernel@armlinux.org.uk,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v2] net: sparx5/lan969x: populate netdev of_node
Date: Mon, 10 Nov 2025 13:42:53 +0100
Message-ID: <20251110124342.199216-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_044355_725082_BA2D3004 
X-CRM114-Status: GOOD (  11.02  )
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

Populate of_node for the port netdevs, to make the individual ports
of_nodes available in sysfs.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Per Daniels suggestion, set it directly in sparx5_create_port()
instead of doing it in the dedicated netdev registration function.

 drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 40b1bfc600a7..582145713cfd 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -395,6 +395,8 @@ static int sparx5_create_port(struct sparx5 *sparx5,
 
 	spx5_port->phylink = phylink;
 
+	spx5_port->ndev->dev.of_node = spx5_port->of_node;
+
 	return 0;
 }
 
-- 
2.51.1


