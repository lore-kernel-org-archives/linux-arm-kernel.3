Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2243DC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 10:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YiZPdINyfjJtYAnZKaHv2MfxtG1OcVQesKXKvaLIoc=; b=SruONzk+A+98iJDajeXV2FLv24
	KeznmUWXPSmb88OwUN/HaUHZEFyxzlyn31UwLJhR87dVtcsOJohUNv7o0rrV0y/+ADD/uJpJn3CUX
	KBgIkuBJueoZN08oqVIeQ8TI81GqMTrRVnagvmfqCsnHhx0bXVBXkC9HMd9Mmn7Wq6FeY/KoyFMYw
	nVGh9jltb7ywA9dCdgcf0zX/4cXZv48hLzaMy7ex0f4w2PtnC/lknE7c2n/cbDvpmaQS1guTzfVQR
	GqNDr56WCc1O/hpSEH20tsConmHiTQE2yGJ4yDV/t7If0I1ZkBhN19TDVMNeoQqAkYJV0h4opIaTN
	ldB9foRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Hxv-00000008aoi-2dhO;
	Thu, 03 Apr 2025 10:38:31 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HbK-00000008X0D-3xCO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 10:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1743675301;
	bh=6YiZPdINyfjJtYAnZKaHv2MfxtG1OcVQesKXKvaLIoc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YjHebHiXBKcucM1B5xCxyF7McIWBWvSfR7Oy71lKvde+bw0b5DyjcJdXoFNMkJpM7
	 wguVnfH/FpNTX4NRS5O57Kbq+qf0TiNvMDMPioOwjHzmtoidj5Iv74hr0rK7f1I8HR
	 mfbilxoenBUuSg7fD+YGMLG1g2aTCjGoOMCDu0NpHAuhVyYrrG6qc8JEqEzZxgQts6
	 /aUil5JOL9KdckyutnY5QCssgu29OKMSu9+Aj+2vbU/WtAV76DCPb7Flw+y5vg7Xdz
	 OQubU3vZ3QkC349Yojaye8/QLM8F3LRkXt1iYoeqJ2b8gx7XIkX9aowLewqg4VOurN
	 hTmFaKjc9s+dA==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B6C8A7C3B3;
	Thu,  3 Apr 2025 18:14:56 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: joel@jms.id.au, gsomlo@gmail.com, heiko@sntech.de, arnd@arndb.de, 
 herve.codina@bootlin.com, andersson@kernel.org, 
 u.kleine-koenig@baylibre.com, Henry Martin <bsdhenrymartin@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250401074647.21300-1-bsdhenrymartin@gmail.com>
References: <20250401074647.21300-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v4] soc: aspeed: Add NULL check in
 aspeed_lpc_enable_snoop()
Message-Id: <174367530124.3067819.2690843491529168690.b4-ty@codeconstruct.com.au>
Date: Thu, 03 Apr 2025 20:45:01 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_031511_198103_33974CA6 
X-CRM114-Status: UNSURE (   6.43  )
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

On Tue, 01 Apr 2025 15:46:47 +0800, Henry Martin wrote:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> aspeed_lpc_enable_snoop() does not check for this case, which results in a
> NULL pointer dereference.
> 
> Add NULL check after devm_kasprintf() to prevent this issue.
> 
> 
> [...]

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>


