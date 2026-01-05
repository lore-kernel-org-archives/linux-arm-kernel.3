Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3A9C2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 07:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Smn7G9NNF4TKpSBrLZt6/rkru/ozPf2jYkxgsCOt/U=; b=P4Xc3qV2C6h9vjkHSRHujLBDlQ
	VQFQds/vipg0q8ShLlHvMRTgJHaLP3TloiDUzbUi+MInF0bjmxgd4QaYtLUN/JxSTJukjQJBPtZKY
	jZ68EXbXhd+Fkmid9CL3SjsjkdU8imbbbJnosKdz7pEkswtXBfIAfIZfx12qWM8hlWV6Sf7jvLhHv
	hiCSoYuE+PlNYVpRq94LiAa7dbO0bWSPRqGod8CFyiuM5LiIq8keDyKbj8krBAGlzDXg+XTlGjI4Y
	woeuTMa8OXttTbhJGdQuRtbyk3bi3dOrmkHyGGrX0WdDEhR8TSG1XiIrZAf5Y1HTmzupR9cyUDGEv
	tAMM9jyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfJQ-0000000AvfC-1OCx;
	Mon, 05 Jan 2026 07:47:36 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfJN-0000000AveT-1eFq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 07:47:35 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c1e4a9033abso12231513a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Jan 2026 23:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767599252; x=1768204052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Smn7G9NNF4TKpSBrLZt6/rkru/ozPf2jYkxgsCOt/U=;
        b=BiBPPtyqr4IQCbYYfTBKfXz1F7mRwBl5bvagFOFJIVnaJF2QTrrWpd/YMcgor5mEC+
         qNnIwWmrhI88sQ6MXAnKtZ0I3G/0FBHdfQ9YVvoLU536U17FFheESm1FL0xpj630U6de
         RgqVgG24GGLPrgcGvbT8H1dzjdC/4DojBqOKr/E4UPKEDPX91ZlSxWJS8LjAuK2s/itO
         joyeFm6ql1JsgQ1/+d8+1j4gUjrbzc3zhkNob4vzH1X+604bisj9i/Ksu2r1Gn8kPkD7
         TF+s0YtHeF/VTeLTLblJnuPBGeCn31p5R++YAP6RkcNvJSFXPXbMTY9ntRY1s6b4Pg0h
         Wjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767599252; x=1768204052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Smn7G9NNF4TKpSBrLZt6/rkru/ozPf2jYkxgsCOt/U=;
        b=B5Me+OZGzo0CbHCGCs4XXl7dvLb8lwHmetjRQMmjllC7R2JstO2fVxfedxqoIuvcOl
         mlbwIiPWjZngWDZvnhksl/Sd5x4+/RK4eBTbrU2iIqgtwGD3abyRzIsK803BPDkTQ1ka
         hZstzEeEd6eHaue8rLPWJwp3aWYPXxb+3ocqeoDl4yiVucXu+VhkGi5GKPlZUSpOUZSt
         JWV1NxoMFxQPWVgw/RXQG0UhRfkRY/dci+f03xY8cOkq1OVn6MLGrjVnwkhg/qq9qDGW
         0kX6Iyb2iMykxs0QPnw+pTvBJesovoNNE1jVnZ96NuIlFP98kBC8vbAUc283+k3kiXDV
         KMLg==
X-Forwarded-Encrypted: i=1; AJvYcCVB8gZg9I0AbxgEawPKK/Hp/5Vnj9mR5ZWHUkTEbewbG7E1gGSa5KAZKZCSODIq6dmO7SsBkDcmrhjMela7Llcv@lists.infradead.org
X-Gm-Message-State: AOJu0YyuZXBwdwAfLquSgNHbyl7veV8hrJJ+tItk4/4sUpB3tR9dyDSe
	TjoT/CDvMTBR9VZP2Eq3iXGleyAIc2vQGtocJO5wF7/gxB9fu6Jb6wYRJvLUiCVwoLA=
X-Gm-Gg: AY/fxX5aSKup5ZtErcKmiLZ73JRJx4942pBheHPQD59mWmWGemo68H3iYZwLx8FHvt3
	AmeCJhAHOLwE1dXYYQFsOBTREt/YCL4AYKal4WNgtKBq53Fe8aA4kDkgyHZE/snY8k9ntNal93q
	N5tknM6M28pb5EOQtI8hSIMbPZfzXDwqTJtEX/bW8oGLho1jqnYou+Tn36JGeCJ63D+RpYVAYQo
	T6mI6sipAYg8YN0x8I2oaMnfDDG3NV+WQC2hFmqkxsnPXXb0EArKekEgpI8ADNyC86wPMfkKsAt
	lfu9etcpetA8Nqkabt5ncXh/Jap5Mo47CWUlGoYpjN8dscZCVVIyZsSPa0FuNimOU6LlWYsVbnZ
	clj2cq2acmqVyqpsJXEEHVWlY7lMKkJZpovFcElJGY+Y9rFUOqyRHduYzrAtH9ZgkvF+KOfe1tA
	==
X-Google-Smtp-Source: AGHT+IHVaBHzL3ldcoq10mQ0DvSoQNAzO29+h1IBrSy2gZY7Qh6quSoh5XWNmgIvhDzcT+gz+HyNHQ==
X-Received: by 2002:a05:693c:8008:b0:2b0:4f8e:3273 with SMTP id 5a478bee46e88-2b05ebd7223mr36936529eec.6.1767599252090;
        Sun, 04 Jan 2026 23:47:32 -0800 (PST)
Received: from gmail.com ([2a09:bac5:1f0f:28::4:33f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffad66fsm101610210eec.4.2026.01.04.23.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 23:47:31 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>
Subject: Re: [PATCH 02/36] lib/crypto: aes: Introduce improved AES library
Date: Mon,  5 Jan 2026 15:47:12 +0800
Message-ID: <20260105074712.498-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105051311.1607207-3-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org> <20260105051311.1607207-3-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_234733_425687_F5FD802F 
X-CRM114-Status: UNSURE (   7.82  )
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

On 4 Jan 2026 21:12:35 -0800, Eric Biggers wrote:
>  extern const u8 crypto_aes_sbox[];
>  extern const u8 crypto_aes_inv_sbox[];
> +extern const u32 __cacheline_aligned aes_enc_tab[256];
> +extern const u32 __cacheline_aligned aes_dec_tab[256];
 
__cacheline_aligned puts the array in ".data..cacheline_aligned"
section. As a const array, it should be in ".rodata" section, so
____cacheline_aligned (note the extra underscores) should be used
instead.
You can also apply the same to crypto_aes_sbox and crypto_aes_inv_sbox
while at it.

Regards,
Qingfang

