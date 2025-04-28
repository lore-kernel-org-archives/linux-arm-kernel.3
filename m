Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BC6C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bKnxtUI6nx93CIB0imngqo7gf66G5/z4JIMwCRKMZE=; b=Md/bY1oBqZ2ElpkHDGU2UL2kZj
	l1yitTHWa9LtKMihPGa7aWgODOlPlZ4+a9V+9t7ty7axzE88YxMN58cX6VG9cvKG7mWX39BXJ3BnO
	Pi1z2sWnMU+JoFIgpCPSYmKkC206T45yKTQ+TCJuT9gMlZWJrZqs+jwuQBHTjjWXRq6fSR0sxWqsS
	LzNU0cy16RflAg6kpAsKuTgApOgVZBCty8dWb/RH4EaHOeeZHOxPXTPJThN++Vpg37M/n/7V7+c4U
	/NgEqxrswaxieW0Z8OZB/3whO3z2H7+j0BY+1dTYmfNE59VGp9bD4k5JzY8+U41p5alOQdRZZCKZB
	+MFBemjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rbj-00000006yKq-1aHE;
	Mon, 28 Apr 2025 16:45:27 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RXq-00000006xrs-3TE9;
	Mon, 28 Apr 2025 16:41:28 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-736bfa487c3so4193301b3a.1;
        Mon, 28 Apr 2025 09:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745858485; x=1746463285; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8bKnxtUI6nx93CIB0imngqo7gf66G5/z4JIMwCRKMZE=;
        b=bIEYENO2gb+Lk1NBa2sUdscj3TZVCGxguZt6Z2XO2wyM5LSVrEhGCJHRSN3E46kI4z
         IXpZGHB6f0gvXEr/RKBgtnZmTFbBSmT6aBIA9IF5kpJyIzQDnMGCn1RFM3SqgEm53gRb
         UJvA3qbjPgJp5RDsvgwjCmcUEFdj0LRUvvxNK86HzCUniq7XLU78+XUMmoCMSo7i/nCN
         2Tlbm0x2XtRYM3+CdMdPig4gw1UzTks+1iV3qH2ObG6o3EtlrBDfj8aqWtw7T7ltCWBp
         a9/jmDUqVdJRzc6kmko0Vzgy31TH1u2sKfvyKzHraIDY8ydV6Zc8RRgcmy0DcFMKdf2S
         EMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745858485; x=1746463285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bKnxtUI6nx93CIB0imngqo7gf66G5/z4JIMwCRKMZE=;
        b=moHE0DhhRdkxlgkCax2s4Hf08s8tVVgYDUyrkgHPNrBXmo1HV3fwuQMdLsdaDugWo0
         DTPVg4JY9S/f53IocJfodQqngmMCLUR5u/VAIUmYjxqqFJNO8WRzquF9DbwWunfWwUAe
         3rUD9zAUlrxPo4WGDJgg2hmzTOHJ7Vag+MZME9lzOKoBrbCJPZL2OVVhdWZ8hs83QCXr
         4H+bNIKnQuh9vDfG3QcJDcAG/+fN6BuZDoUj6Hq/5rbtdsxlVTcXBpDebmROOg6nEsZb
         5CYpUxni2v8gHcSRztm8/W7l90ORghdYc8cz46HDbFvp/BYoPjJt85tZVAVt0uqRwrAO
         SFbw==
X-Forwarded-Encrypted: i=1; AJvYcCUN5eHUkl1Sc0Wzn0IdH0cfShLKTFw5qUn/6ouRViTsz5UIN1O+nvHFdvNRwea8dSvV4rAOmrq3qrc/fYuBYXU=@lists.infradead.org, AJvYcCV0xygwi3GP95s1ZF/aJn3aLFG1I0GB10E4jQx+Z7jVMfGAwIUFjaa70Bj9tjzEsbRinv8C9HCoFrTQKCZD4osK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0ArrJUTZVX4iUOPLkcRHI/IqKbT2Cg0o2JRXNJ+zWiPpcs/8R
	HF42bkMbwvB7oqoLq1mRa8XglVkZVV30BDakR3bSfGQFAYc/sdyP
X-Gm-Gg: ASbGncuzs8s8q47adPdvAcQ6C3JZk9ikbGwm8LCyUzzIgzkvnqMf2rNYwxAgF187yHO
	Vm3sesFBLdF+MLO+cZezhSjNtw+nnf9d8oA0VkhVCw1+1ty3v/HCSYYevDHyRN2PINskKfPP2m6
	KQA6iPGamZeJ0Xj9WoH0te46Cw6HNhc1E7LPtnXRn/j88P5cldTwPZ3VsmzO++7R0yuvaVaQyhz
	govIxghbeNNuGLNt0HDbcYtBKNGstslSCr3sa7JE0slbqtR6ueh7rVY0bgRFYef5JZ0E+bcreeY
	/v9VQk5L2NHP2/msx0s20Y3VotO2UdC77yKC94iy
X-Google-Smtp-Source: AGHT+IHL69QrxwjhYu4/55O9zDlBA1SvHCz6iujXxZbkeN59cSS1ILYQAkqVjkEEReBaabOBFmdJjQ==
X-Received: by 2002:a05:6a00:2e08:b0:73e:1e24:5a4e with SMTP id d2e1a72fcca58-73ff73a63bamr14787124b3a.24.1745858485343;
        Mon, 28 Apr 2025 09:41:25 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:67d:4372:d1e6:def0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912c4fsm8163918b3a.4.2025.04.28.09.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:41:24 -0700 (PDT)
Date: Mon, 28 Apr 2025 09:41:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RESEND] dt-bindings: mediatek,mt6779-keypad: Update
 Mattijs' email address
Message-ID: <kapqp5k5mlannxgk5hkohd7q5xz755kfkdy2tqgkovp3xj5smz@6djbotrywt5z>
References: <20250428-keypad-email-v1-1-dde6ac76725b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-keypad-email-v1-1-dde6ac76725b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_094126_863852_8955DD16 
X-CRM114-Status: UNSURE (   8.16  )
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

On Mon, Apr 28, 2025 at 10:35:13AM +0200, Mattijs Korpershoek wrote:
> Update Mattijs Korpershoek's email address to @kernel.org.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied, thank you.

-- 
Dmitry

