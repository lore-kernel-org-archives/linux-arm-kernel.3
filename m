Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A344AC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 10:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgngQ5cwyLNamE6ancq51PnK6HtXgBQEA02M7sZW0+g=; b=mkW3IL31dsOULhEEKy+lTo+COZ
	6hiSZccyKoPjWb9B5FU8epUZWquN0bEshnsOASJ/gWEmOaLl/vanIz4X2RJyraDdj7TH1OS2+kI+y
	KZATH9+zdlwNpLu4mt0pwojt7aOxb1KGsvttjugRI2hW/f0t0OMWmdrBxt4FIBpWI/yLuUVAacYk0
	Iu+A1ep7qaOZAdI+hTyKVZbU/QEEwZ7I+MQ2LzxrdYuYyKR3LuTtktTO8yfX0RQS5bcDXwOf7fwR1
	AlySaf//GXdljg6KZnKWInx08GH1+t+nHXoCfy5shP3PvnYe52rL2Si08rvt7WleItvyMsqgArUgz
	60fgyYGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjXh-00000002DT3-2VC0;
	Mon, 07 Jul 2025 10:57:49 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYixP-000000027sr-29xW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 10:20:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-451d7b50815so23267155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 03:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751883618; x=1752488418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgngQ5cwyLNamE6ancq51PnK6HtXgBQEA02M7sZW0+g=;
        b=gwl/UGs51kDLSLBQolu/UXJgDmnFrusTV+e37Rol/rEZP1PifkRuNXzh9j0SbLAzsI
         G+koOrkyEzTA+wnhLQrfiognpIr2eEhpeNcpxdOivIbBLHqW/cQyCtHzRr1fIJGv2us2
         WR/40BwxsDjhfy0a9b/OS5q/M8TiS4svdSE2+3r/lw64O1fpLpTJUqzDltaH3eUmiolR
         7qELXFgEsTMQ5h7jTaNoN1R6JWCiOAOmIER9LXZPoYG/I9rMTLyQZNhfALYHsS8zYZUd
         DKpYHkN81C80aTnm/CiegrG8RWfRoBuvxH7yVNZaDYih93A1gDhDM+FO1UTjBiTso6K5
         JD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751883618; x=1752488418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgngQ5cwyLNamE6ancq51PnK6HtXgBQEA02M7sZW0+g=;
        b=OQVVezmHso3q9xPzC/sNeesLCbqg8/kPb11QELbz1GXNzSN9k8q0zGT89UhrWRuQY3
         qPV92jZdGnQ21RTzdn2h8QOQRSCaPxU+UG48GlIlvtnAu2aFNnFzL50nmlgL0wr85zSx
         9HNa89nSTjWUJsPE2le+eQHy7iIG+D1uBA/nh092A0NkFbbauuKRNcSBWawjWIgP+ZJa
         CZDIux4qL1pBmJyUea2E/zIHlTqxLxZgROMs9AdJ1oR+3kQi+2xviaKsfhw7T1SW723U
         68vJMo83F4SGZBU/mR6dcuX5X2Yws6/S8Mfd2DJtDl3+7xMdzm81YnNGAuoR0HF/KPC+
         9LNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ77c+w7MVm+5tsZz4lUErELsJs7kJ/Zf38SkafKzu9fzL2btVo1rDp1LPkjUWqW+j5FE8zEWoFrBOpkiXLhJC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu8+xHSuKhFLwXAqNdYkxMnOCdtpMkSKJ3e9aXaQmfLIdOpi2M
	TLNEztE9Tj6XzRLCilIjo1FhjdjRYaSBx0bf/m8IJg8HHVGQjXADPH0Q
X-Gm-Gg: ASbGnctPtxaPVuECUmN+C2oDH90O+rw1AqcYsmUFfWL8CiWdr+pnQEuFOIfwFwfCagI
	Q8nzVw04YMH6oF3l1wAE+jxfN1+/YU7Ly4ILULCU2J5VNpiCbk6WBYSdWCYBK7FUr/oOQZoDxVs
	NohZNrx2a6Di6ZI6G2uYQ9/XREvPoCJVZ903TvWecPuq06n7Lz24lDR30T4S3enFBCPutDa53NI
	JoltlWAMwLJhicpuB4Euj6qzyNgrtKy/0+fHsyVuEXQ0Rvld2qgvU9qYosL5+W1mK7dtg72qJAF
	P82m+29Bitxatq1YD9CdDptuvMtUicrnZ3dSeGagwwhbg0LBjtCbftHShePQJgFIRglgddSSWqB
	OQbUi83B62Ac0zffnW4mgT5lb6FTWOX84GyTG4HzlkFsNsg+Df60gYA==
X-Google-Smtp-Source: AGHT+IFlwyq1JL36vI4kEVmS6ptNKCLnT4KuHGJOKhnlhY6M+0BNbx8hFlwNIUih31YBk17w2hDEGQ==
X-Received: by 2002:a05:600c:3153:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-454b315fee2mr86803105e9.22.1751883616214;
        Mon, 07 Jul 2025 03:20:16 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a9969a8bsm137399495e9.2.2025.07.07.03.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 03:20:15 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/11] dt-bindings: mailbox: tegra-hsp: Bump number of shared interrupts
Date: Mon,  7 Jul 2025 12:20:05 +0200
Message-ID: <175188357610.1321171.12415641034815981953.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250506133118.1011777-3-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com> <20250506133118.1011777-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_032019_552973_00C2F70B 
X-CRM114-Status: UNSURE (   8.83  )
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

From: Thierry Reding <treding@nvidia.com>


On Tue, 06 May 2025 15:31:09 +0200, Thierry Reding wrote:
> It turns out that some instances of the HSP block on Tegra264 can have
> up to 16 shared interrupts, so bump the maximum number of allowed
> interrupts.
> 
> 

Applied, thanks!

[02/11] dt-bindings: mailbox: tegra-hsp: Bump number of shared interrupts
        commit: b6be35ae29a38431e554d3ad35ec552058058ae6

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

