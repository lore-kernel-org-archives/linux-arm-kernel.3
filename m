Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28CFCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 17:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y7wt65Eh0qxK+FXODcyVSRUfC2/FGp7c38rfv83jttw=; b=ct4iVkt9Ti0nBMZAhO+ZBrVT9H
	5o0aEO3dGv4LWLEwIGja8GNwl1u/TQQBe/Drd1D3mEL43OeV62nVXIAz9VSw/QXaYx4hhkwJV5yTL
	4iC/52xnWuTScZjqjTvuNrKvx3NxaJ7AvlhCrrsn14sxib9QFByKpcLfGHKrSdlxIPkl1VGva/YGi
	rdaQ8ujy9nfcOOpr5SbbA7EgqM/Mi0XR2fam/j+Al9KZRmsx9GhYafmG1zUon2JmUZgBMaVAuzR6C
	XeDKnsBpeeLqm1a+KbUbCFMms201k/WRkjryy5hNLMpNvqD93jgW1ttdZ3r9FfNs9JyuRwmRWdIrn
	QsicX0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL31z-0000000GXTX-3nX8;
	Mon, 17 Nov 2025 17:28:47 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL31u-0000000GXSr-2uus
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:28:43 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3437af8444cso4728661a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 09:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763400522; x=1764005322; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y7wt65Eh0qxK+FXODcyVSRUfC2/FGp7c38rfv83jttw=;
        b=DEVPUTEkK8IEq3QaXn/qfsHML5Vw5IqbpNJkgkoIBwkcJ6gulMD12KQJEadqqrDWl+
         vN8g9AUHJqZlj21iQld4S96c31SCB+AWSa+6MX5pA3NJrVqXWCi8xJ0OeOzlxb4gaazD
         xKwVaC+bWUwpeGFgZLhNZUaHwmKBj28H7FPEequM7iVDTN20gku9qgSCQFLHhyg+LypA
         C7ro3RPO4kK5dgEW14M6IVmLzmJg1aT9RFozlZ5i+x71vd2ZtwS1pbsSnQr+4e48mFXD
         jdpiLubPaNtiVAZTnqsf1urFbl6W5C7wCn+mKVZKGDs/eRzCybulcMAByq4As8NhbgPi
         pfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400522; x=1764005322;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7wt65Eh0qxK+FXODcyVSRUfC2/FGp7c38rfv83jttw=;
        b=H+2Or4epeqQrAC8i1e/vlxPPcENyyHhj+O9eNgq0+J5aXqx90virZ/CRdKx2tuX7bb
         DL0Df89ZKXvC+EWqHgy3iUXJ08jB8Ih8MUTrQxcfR9OswY3/6ZkSpOGhDKUK0SGLwVFT
         nqh1EPdnYPbIPNl2SqFF2ciwo2XyhJf7n6XN0aNdrDJ0cOlH6sHNK6jawSkHlSgFFuAk
         CNrGWUd767N4Hl9pQdc2JZgQTEhhokPbLswhrnCCLF2OK5JHjcOeJdu55S7OozpIzZyr
         1LI35z6GCrKv4qwQ50Xfz8AjXE9hEdb8j7KcclEJiNB7BwnkdISylCr7TbmgNecLrdKr
         k1EA==
X-Forwarded-Encrypted: i=1; AJvYcCV73sYmKQrtHI2KdHOCKmbrFiA3evasoBB/yI9k6hi0dRuUgAfPwf2vdijsEjzTW4ohFdN/s7N4MO+bGUybsqcb@lists.infradead.org
X-Gm-Message-State: AOJu0YxyXS5gphf2yoXiCKgxlqxIAVzK6w8r8F5gcGeqV+Gsn7bGFuNH
	xaDSwp3hPHE9g8zmP4NV+bFFFjwasmOr283sg5lN0w7TC9OSKAVigkMO0hjHSpXbACQ=
X-Gm-Gg: ASbGncseRWKEn/YHQ/iwdqQaLtznYJm9QJljyuN18EZEqI42nDeTcpEdrSUveVV23aU
	tKRztn65OW4D73lNsT/kCnUW8xuOE4Cw90hDiVbhtWRCpL4BKvlXfP+zuwY4Io4aIEf1gExj4Yd
	SEK4aKo1C7jK1a5iyCzf+M9lLQy49SxUOe36B0ha49cWpUrI1Y+F1yk1i0A/XAs3NBxZPzdyHNy
	0OWsqH94LAe3RE1oAj5Vj3TViIt4Lw2mXgbY8Vo8mrVbDK/0nXs/ANSK8vq4mW32VyJU/ZI+AGh
	4bqyUoDr79BECyfMLJ1e1iADHbXLnqPP352r2/Fvfgbs/9Wa3YW/jZcmns6JtYYmo8njHQV+/C7
	WkkD9bbD0hmQFHg8s5EItF58R4yrWhetvrUCENW8p9Fd9qrZothEzMovvEx+J4IVGTyOhd4nTLw
	==
X-Google-Smtp-Source: AGHT+IHYbjHg19oozELCuH1Sepl41Hl6vXq0kA2LdsYPKUkCrFNp41EV5hBuCCfJikNQi6qXu7K8CQ==
X-Received: by 2002:a17:90b:1d0e:b0:340:f05a:3ecb with SMTP id 98e67ed59e1d1-343fa74fccdmr13709653a91.28.1763400521875;
        Mon, 17 Nov 2025 09:28:41 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e0794ed1sm18965400a91.12.2025.11.17.09.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:28:41 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc/drivers: OMAP updates for v6.19
Date: Mon, 17 Nov 2025 09:28:40 -0800
Message-ID: <7hzf8kk1pz.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_092842_732613_C1B7F1DE 
X-CRM114-Status: UNSURE (   6.06  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/drivers-signed

for you to fetch changes up to 3f61783920504b2cf99330b372d82914bb004d8e:

  ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx (2025-11-04 14:48:47 -0800)

----------------------------------------------------------------
ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx

----------------------------------------------------------------
Matthias Schiffer (1):
      ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx

 drivers/bus/ti-sysc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

