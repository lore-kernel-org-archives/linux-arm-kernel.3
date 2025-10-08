Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80251CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 13:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2LSe4ertuHY5UCTpJu4xbHCRSqUTutEtA/GWNFzMyBY=; b=e2keP/xEsx3LjyWSVDuF4QdD+f
	9NwLF1m6dTfRt7+bAcw/ITs1YaE2YxkjXb//ODeu9evUkrVKp2avOpSnrAvcDO19l4m/6LgGjFqiP
	D4pDx17CuW7sYvr0/02Be8FqY3qHT3K9hJIwD/J/eXvj6MYELkJdbl5sbkbOgdCP98BdZqdUL9B3j
	tFs4kKEf51YXVc9VXdm8jZMC54IsxVb2Q8hpZW5tO3OaJLrnYBSAH6DTR7jeR+Q4KUzyRqovALrrD
	Hf+ARH27cLioeqI+Dkt1SHPem6YmO4ZxrusdeX1h0bdUez4tsuY8rn5AhApjiziFkicxEoLKnSZ7T
	YBmZTjQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Tmg-00000003tHD-1H1R;
	Wed, 08 Oct 2025 13:00:46 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Tmc-00000003tGh-499X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 13:00:45 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-339c9bf3492so6805586a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 06:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759928442; x=1760533242; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2LSe4ertuHY5UCTpJu4xbHCRSqUTutEtA/GWNFzMyBY=;
        b=C25S075/q/TlNoOVlnWDqQKDuadAqcoPkEh+w0sEgGAJC7vofUZEuIcPi2x936tXoS
         TOpzYLoka/w502d0DZMlYllavm9r3ZgZc7ky4UghXuUaL5UcdcLXasQBFUCHi4h6nTG8
         Zr/ouSyPI6Fw8efy1j9qpZ9AOM2vF+nQlYJMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759928442; x=1760533242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LSe4ertuHY5UCTpJu4xbHCRSqUTutEtA/GWNFzMyBY=;
        b=jfOF1KBHqzrJjfs3lXdsb3Sv11i8dQxM2qNQp+JFugC6rvSIVGJYNebLn7uCUOLx3T
         RD0mftA8dT14X3nUTYrXmNN39TkhP3TufcX/PiqKQYYUNjVv+z+wwgz/DUg4Yj0yGBR2
         rfPQZjWUXO11TskSU9IN4Eyb2dK6Ra013PLOvw5ZsW+lAs2Xxp6TRlSdogXbp514n934
         DyGZf2brZ6BcxnNnRK6wnFGs1eYfYP2q6yVsRnYhhr0GCBc+2Pf0YGuQzj11x5l7FQIi
         MK/W1O5GGDYQGEFrEfvCkfkStpdTdYIr2gn6lVJH4F4a5DGLmbNmfEal0PpgLQ7o87zQ
         JyDw==
X-Forwarded-Encrypted: i=1; AJvYcCUB8reSJV3LcrIrgGcPY0BHl1VanpMF4sJ494ZCLlSjK/Tcuu0wzNcHry2kL/g60D1tSJ/kbYy4Z+VccpmtLoy0@lists.infradead.org
X-Gm-Message-State: AOJu0YxUUB11TnRHNDL49MLOcQ87hDGYHwa+FtenPG/IlOYW85r5uXXp
	teWIiyT3vSQqtdYVi3oYuUW6DiwPDPk4S6CgXHeNhRNeGXMAdsw0tUJwMmPclirS6A==
X-Gm-Gg: ASbGncsSjOZePEhiRiDi34EHW6LTSyK3x0xlv0zeD4BIBpXfWUlGwPu/PqDu3JBTG/s
	/vuQzfa79SEH9aBoS4jXCN5LyipKa0f6vzLpPwu7WPamvixFFAsE+Sk5EITKmElsOrVhFsSIwWF
	8cQTAhDDG3q3fFySPj3MBCIePczGUq9g9LHkkbRrtJ52biTO5HsvJxran5Slh15tHUHobw0CF+9
	lZ1HLWsJ0MoEKtOpzg09RIJfBIX0QA70qjkgU921kbt+OcCEStkUYLOWvTXGDPTejD6z5rkMjpn
	zjE8ACleLXDCEKyv+dX9cN3lFOPz6aMH0OuCjnsDgKphtcC4/dnFTPLMBX7dtB4W9YuUQoXW6t3
	ABe3sBuysZ3VnQdgV/ykvS5TLYaO6tWbc+S1WpsQ7hjygARImRS/P19Pk1yNSadetKxmpPjY=
X-Google-Smtp-Source: AGHT+IHp6lps6Tj0HDAkAwY/QdXKotjR6QS87QUoHQkIeAqcTqgqsc53Y+CMU+TaHQbQnjsgq+4XVw==
X-Received: by 2002:a17:90b:3e82:b0:32e:e3af:45f6 with SMTP id 98e67ed59e1d1-33b51112242mr4111189a91.10.1759928440572;
        Wed, 08 Oct 2025 06:00:40 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:465a:c20b:6935:23d8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b51113776sm3396141a91.14.2025.10.08.06.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 06:00:40 -0700 (PDT)
Date: Wed, 8 Oct 2025 22:00:35 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Will Deacon <will@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Tomasz Figa <tfiga@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: kvm: arm64: stable commit "Fix kernel BUG() due to bad backport
 of FPSIMD/SVE/SME fix" deadlocks host kernel
Message-ID: <qbiybep4kcm7hijtvg6qum4ubic37s6xnlzq2jvr5jwqjoffc4@htxzojej2zsv>
References: <hjc7jwarhmwrvcswa7nax26vgvs2wl7256pf3ba3onoaj26s5x@qubtqvi3vy6u>
 <aOYkuatjNVyiQzU1@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOYkuatjNVyiQzU1@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_060043_042273_E190711C 
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

On (25/10/08 09:45), Will Deacon wrote:
[..]
> > We found out a similar report at [1], but it doesn't seem like a formal
> > patch was ever posted.  Will, can you please send a formal patch so that
> > stable kernels can run VMs again?
> 
> Yup, already queued up for stable:
> 
> https://lore.kernel.org/r/20251003183917.4209-1-will@kernel.org
> https://lore.kernel.org/r/20251003184018.4264-1-will@kernel.org
> https://lore.kernel.org/r/20251003184054.4286-1-will@kernel.org

Splendid!

> Sorry for the breakage.

No worries!

