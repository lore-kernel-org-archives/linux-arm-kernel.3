Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FA9CDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 05:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/7ep4EgngMi756SBUztuInzLdyJ5R5zqqGXrsQMtkM=; b=4NExMqQnYIfw53r4Ezd1jYhu5a
	ydQVJQpvt7rFFm9PhfCI53hsGe7Vm/LaaaN9jF6kQYkKeBTa8LM+z4bVr7YCHtJUBJKuTOoSSN6ac
	wgZhoshLSiCBAGu/xwusxIRW2nn9MfA7wSMkE1JRGa7WK4ouGchbCy1pZJqwBiwdg2n3i3dw/1vw7
	dM6J7jku9BzCEW3jsv8TnFKma7+a1MjDtpMRu1v6qRZHkMsR8f+wIWCIvnXyl6rCGitntBFWERSUc
	rVUjmJaOxuYIWBYtDsZAJ7TBeFxBcg29s7W2azsPM2tjAtda2xCfSBOknZ+RKzbXDlfDTLbP2MCsi
	FiEj8zhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waoPS-00000003B9s-3RVi;
	Sat, 20 Jun 2026 05:38:26 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waoPN-00000003B93-3TQz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 05:38:23 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c6c101aeafso17106615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 22:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781933900; x=1782538700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/7ep4EgngMi756SBUztuInzLdyJ5R5zqqGXrsQMtkM=;
        b=n8iANc3FbjNjGR9o4iTjb9naxp5+MPalo9eBzF6HDOSi9nCIBAfN8Ws3TxZnU7eeqn
         ShzQiZrIJCMGOU20y/p0YgW0RlkiS9xAsBV+3kxCAIFnk3c9Nb/hf+5a9KGVCpo7K44B
         ZudFbYXK/3gu+xCY3u/Dfe0RMd0CymI45VvPNuQmkvHIXDwKjFCmRQohehuGFT5Q5taQ
         BYNNnMUBj2ZeJNyHLA+zsZVW7BKULSQzMcC7QyEIogj9JnHpYNZN4mqTTQRSIDv35DHJ
         A1VqyG/4vEWFI4c/5Gs80wTyiC/QcjH/1LHEnopNki1vyqnL7vpxk/KvgOnq/KnNjzzm
         lT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781933900; x=1782538700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T/7ep4EgngMi756SBUztuInzLdyJ5R5zqqGXrsQMtkM=;
        b=nAJuwUGQwoWbbWR5kbVULAkXF/lim3OfsGQqgsgkldcgw+ipGvck/2ONZ+cykeVXDA
         T1JdMVncjvpM1SkT3ttbQcNob5yt2EbBEJ0qaOzile49GwYUOs6fSJ+1SNBLrZFB/e/m
         UyNPUSo1epOawKPQ9I7Vdfpb9uKJcpwUygZZd3+0MOznUw3fBkvPn+QpE2CgNRQdehES
         Axdfc2i8VOd9njyrwsF67gBl1uB6IGobvsieiUMLUNalBmbO3h4nTPhpo6ee6+L0wxZo
         W7+ER/lYzSGOKqLuzwoiEF/uGMR2wVZMzfPukJRbSauT99jFrzT9AUkbsuqrhNaUKaOa
         h+9w==
X-Forwarded-Encrypted: i=1; AFNElJ983L2PF9dxDw4LWFUEsxw/hOQ0SOOyQxVO+6ylcz70NjAM/YfiI+9hpDUvjQDlWnghjAqWjL9KcGfbYiYUf1Fr@lists.infradead.org
X-Gm-Message-State: AOJu0YwSAnbIHtSe5kP6hipMXJi+b5+MPl6GP7YL/tm0nMKmF/vF/MoP
	ky7wlwahMq9ASicRzzTiZRg6PMgHg2Ctf9Sd9J9ozOpi54r+g27vIS50ECYqe7cH
X-Gm-Gg: AfdE7ck2ZyGHGCstFH+hbkiv+YAlsWPVGopHIyr/VT98sjYlmoxbEA8E5pweaSF9Isa
	cyRdqGNHsLFOMtyCWJX3+cXKK94OLanq1MAFKuAnQbB63iDmjOSPqaHvzUQzhr63UeucqzoVqjx
	DM2Ne4NwoOLyzL9hvIfln82abMzBeu9CQPhimW6ncvXSu+nTEMEWVtu81GNYyAsP6U3coveXVUP
	LfytYY2byyDrApK0rqwlTm5qvcgmp7vUchJYIidm358Mpp4n3r1k+GaoGbCV+DrWBO4n89sey22
	99yRioT020X0shnbEdrn3oanxv+Z4D7TGnDndJL2YBdBv1x1p5K6G0HTi8G8bmlVZ2kOQ96MGa8
	lw33HZmRb/2Bvsj2MxK7TD+RBtJrT464WpnWKx0vQwYgbKh0bMSfGYDKUlCGfjOhKdhHaRwqddY
	ZDUYIE/UdSx4e8yhXEOe0=
X-Received: by 2002:a17:902:ce09:b0:2c1:ef9:4516 with SMTP id d9443c01a7336-2c71904ee57mr70697045ad.35.1781933900305;
        Fri, 19 Jun 2026 22:38:20 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f6395sm12161565ad.28.2026.06.19.22.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 22:38:19 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] arm64: dts: rockchip: add Vicharak Axon board support
Date: Sat, 20 Jun 2026 11:07:59 +0530
Message-ID: <20260620053759.9841-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608060940.52549-1-hrushirajg23@gmail.com>
References: <20260608060940.52549-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_223821_861951_2C2C2608 
X-CRM114-Status: GOOD (  10.16  )
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

Hi Heiko,

Just a friendly ping on this series.

The binding patch has received an Acked-by from Krzysztof and the
requested review comments from previous revisions have been addressed.

Could you please take a look when you have a chance? Any additional
feedback on either the binding or DTS patch would be greatly appreciated.

Thanks for your time.

Best regards,
Hrushiraj

