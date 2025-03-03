Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB4AC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 21:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//CA4dP1gRO/1RNRixCqJrbqKaw0YXw5wU7J/MVaxKg=; b=OCL6ArFf9N3gDOWBLak5Gw6676
	bXbkC/2V+HP7M98EXgRv8MHqWqzrk9BDYKBCyyi1W6zAgEHpsKTmItekXvEfSWCxlaIlRqlsG/YpN
	uUr+nL4Id+tOEBo7GSh6gQETokWKsqB2BjSCT7qa5qmo11wHKAvrOACCO5/jeiZtIJq5JWcvu4DdR
	7kXNJt1taoOkW2/op2Zcnd9gjUyU4ciAQM+HBy8/Hem0QtXaUfMdX5IgU5aeg0Gp7TNk+O8vigkVu
	ZW0wV3YF92LgWLWNgvWmh13zr17knW0uqfJ1fkef1snPpTnowArXUUjS7B34z2Uw+kGwZ2hX0eZ5Q
	MwjmrgdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpDYW-00000002Nx6-42eh;
	Mon, 03 Mar 2025 21:42:32 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpDWx-00000002NnJ-3IEg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 21:40:57 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2237a32c03aso15645ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 13:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741038054; x=1741642854; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=//CA4dP1gRO/1RNRixCqJrbqKaw0YXw5wU7J/MVaxKg=;
        b=KsxQcGRwkeYaOj1o3igCMUSccZBnLQQBgYKpOt/z0kFiAgx91cSZ/abmjPn/L0fnCO
         iP45JHCRO3Nsy6ddR+n3zT6VV17bwbETpcHn6O+ibNWAbuanOV+ldrtkQLeTAQzHOVDs
         BDdhlOKcX0U/x/vPbz2aRGYKXlAjansfPhlG96S+eiW4NIwLQpVkoUXAA51GU6L0W0Ot
         aDAQmJdPY8neGww6Txh8g4ENjCHOxqpLyfX89GXIK1hbrLampQgXz3NP1zGzKj5QqHox
         BtoLeC17fwMNXC56FEqSyteKkelA6etIBnwdrGXsMEECoHBAZobuRxJuF2dbQ4IpiclF
         oCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741038054; x=1741642854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//CA4dP1gRO/1RNRixCqJrbqKaw0YXw5wU7J/MVaxKg=;
        b=bZHmWiOgf6dDcqwmziaOuQ7hHibeYj5VYrcf8CUc6Pt54gx7PESh/iWj9gjivJWNhD
         pG7CCAsoQhHSr/1BPKMA+ADIBKl+c3AEtzmzC6TFprddteIVV1/SDVAC28oEqkgEiwKO
         Qrb8H1t2vvNibAFkb0jpFzLhEie8wt6etG3sPuqQ/ShK1ClSNFUa6pNt6leKf6I2NRsy
         +F63a33phkotE8lH5pXfPEhPprveYLv3pZ2ROlWyKRUmKO2g6LyIQPV2TA88KOOCUjRF
         agmKRKYyPGFAQXdz2Diq+CsxB980h82zon2IRQNbC15KWZyPsqtOv0/2T0DzEIokv3ru
         WiWA==
X-Forwarded-Encrypted: i=1; AJvYcCX3j4AhEJszLmpfC2FlHx6veqSUh9nfbdbvfl1ncARqz1rXBPSzsWogThzjRhtxwzQUi4BlAwJDdrS4LfxJH1AR@lists.infradead.org
X-Gm-Message-State: AOJu0YxeXuAyh9JeyY84Kw7EUH3f/isx8Qb02pMptVyyGjtwaWkugAjB
	PSH41r5knB4DttW9w1F1iB++7s6EXS12AiefsOUEXi7WXCNL7TvBjbOF6DAhOw==
X-Gm-Gg: ASbGncvSBPKtHWSpptr8DV3WTr9Q0HZ+TBoqxKFkWFlSvIhblo0DaMuyoCV8iaFOprG
	VqgijqOxzmlsVYd/bazZjOCKxLebCa0ZWorxU8y7mMA/nL6awdLcNlXxC1n9sWBCRK18kDH7iHH
	NXzPN6XkBta4dG2ZKA+Yp7njpExcYv/x0Y3Tc9xnpA5rjIeHi0HXkmqOAna8cIYj7EM+yc9LHJX
	y4jedFS0iySQzfPhs4BliQjb3lIowhgycaMmKSU0nZP7Arr7cIbZZ0nMjsZtSak+yEELjyYeQmY
	b/Qm46VQRITrgqXHht1lEng1DKq7fnvWZabeqAXfri1sI5u4uiF7FqemRy/G4LOkhULR66LJZ7V
	vfrBm4t209h0IlVI=
X-Google-Smtp-Source: AGHT+IEwj6zn3l1n1mEvrRIOd0S1KGWs/bgL/3cFaL+tQsr/6cABYrLinWLfgT7M2GWCtuDNAUdgLA==
X-Received: by 2002:a17:903:2592:b0:223:2630:6b86 with SMTP id d9443c01a7336-223db3fdecdmr77895ad.7.1741038053846;
        Mon, 03 Mar 2025 13:40:53 -0800 (PST)
Received: from google.com (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe514besm9424721b3a.71.2025.03.03.13.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 13:40:53 -0800 (PST)
Date: Mon, 3 Mar 2025 21:40:48 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: peterz@infradead.org, rostedt@goodmis.org, mark.rutland@arm.com,
	alexei.starovoitov@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, mhiramat@kernel.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com,
	yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org,
	davem@davemloft.net, dsahern@kernel.org,
	mathieu.desnoyers@efficios.com, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com, kees@kernel.org,
	dongml2@chinatelecom.cn, akpm@linux-foundation.org,
	riel@surriel.com, rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
	netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v4 4/4] arm64: implement per-function metadata storage
 for arm64
Message-ID: <20250303214048.GA570570@google.com>
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-5-dongml2@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303132837.498938-5-dongml2@chinatelecom.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_134055_832050_7F320A7F 
X-CRM114-Status: GOOD (  14.52  )
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

On Mon, Mar 03, 2025 at 09:28:37PM +0800, Menglong Dong wrote:
> The per-function metadata storage is already used by ftrace if
> CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS is enabled, and it store the pointer
> of the callback directly to the function padding, which consume 8-bytes,
> in the commit
> baaf553d3bc3 ("arm64: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS").
> So we can directly store the index to the function padding too, without
> a prepending. With CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS enabled, the
> function is 8-bytes aligned, and we will compile the kernel with extra
> 8-bytes (2 NOPS) padding space. Otherwise, the function is 4-bytes
> aligned, and only extra 4-bytes (1 NOPS) is needed.
> 
> However, we have the same problem with Mark in the commit above: we can't
> use the function padding together with CFI_CLANG, which can make the clang
> compiles a wrong offset to the pre-function type hash. He said that he was
> working with others on this problem 2 years ago. Hi Mark, is there any
> progress on this problem?

I don't think there's been much progress since the previous
discussion a couple of years ago. The conclusion seemed to be
that adding a section parameter to -fpatchable-function-entry
would allow us to identify notrace functions while keeping a
consistent layout for functions:

https://lore.kernel.org/lkml/Y1QEzk%2FA41PKLEPe@hirez.programming.kicks-ass.net/

Sami

