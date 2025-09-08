Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AE5CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEo2UMTG1DHQ9doDRWriJeo0VPUl239DwxNNYlZ42y4=; b=g/Wf2a4ruRVndFwPso5dqtX9Hf
	MVoIpKAluCKDj7STmKnKdRCpml87hIJ4BTHXbdch02y8476kcJAM5HptrHDr1G324F6cMuUCZK/SJ
	PAuApMfgrIlakitkDEqL7r/V0oyF5gQlRvkuQbtCsR6JTw3jq0jHbFviEOoHeqOadGw1L/IIQ/KLx
	6sScivSRg6JdLmSaDZL+1+XFYNUMWpAse9hH0jZQW+63IcPl4yPYQrQxyzNtovx5hWjLACGWOaS6G
	ruUoiE06OFsxyqYA7vBqwa/es76QAf4J6Y8PGPNfkw74mqiCMsuL/bQxEJGklbIcWARHlQeaN14OD
	LhfNyLlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfLe-000000010aV-0QyD;
	Mon, 08 Sep 2025 17:08:10 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvauZ-0000000GzYW-3djW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 12:23:57 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3e3aafe06a7so1857910f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 05:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757334234; x=1757939034; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MEo2UMTG1DHQ9doDRWriJeo0VPUl239DwxNNYlZ42y4=;
        b=ypi+A9OEiYW+zKrgscTlzhil3Ho9pjhQLcQmkS45uFiyXd6p9ifXD2+dvnCf8bZjUi
         hzxIHTfnL/7RwldCCmjMxJag5a6hzVWzZviaHUA9PP0Rdk8HWWnx5wpesxfsqBcIPCyv
         nh488KU10fZSOt8/4M4gfIiRVQlY14RQSI73nC/XimDS2SxOaAXk4OjcNOMjQ9maJeks
         hgeg3s9GpRg4Iid9N4yF1AX4/u9PK5XuKb8YV7YXJfZdOgkcFbEcFEfga9Wy8DnQOH20
         0wMUwzcdYqVoE/qWTCMTdV39uUcxKAHBT+vk2fVnr6iWKCuBO4cVhhwDG9gIna5eWR9E
         XzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757334234; x=1757939034;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MEo2UMTG1DHQ9doDRWriJeo0VPUl239DwxNNYlZ42y4=;
        b=d4KE8ypZdLDXClOj6YRMh8JywrF6Cm4j2R/NqWi2bUoPabEc7eesXM+UdkLRYgkSCP
         v4yYfV2H5W5iyVSUYxza8IsXXhxD9ULh4yvx2v8XkEqqmIHsCd0Zr2fEGeY8drTnWOXH
         tcpoXI18MJWjoBhe72Y4zXaGKbkEoc9XaTKLHVR9Yz/D8upAluWvAobxkHA0KLybAdNt
         ZGIy8+OccLYCLsOvQdlgNbfLe8RbHliiJbh+pTmfBUQJ606qlS15y5Atn1KAMe6plkqe
         FJ7qliZ4HykW1YVqjl0H5+VNEQ/9aIcqLPNTtkeEQavn5HkxSRwXB2lQLT96MHL0ms04
         VzTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyVGrANQqESPSdIFQXIaPIjgKXycRsuRHNxk4A+eKEt5o7d3EAAFrT8XFwNh4rNGzc5qZZM6u/5l2rppFpgBWs@lists.infradead.org
X-Gm-Message-State: AOJu0YwtN3OXKcPLPCacSksN2sJgYr/n4ta/8g+s/ZEnXq04EDKPBfKb
	oe3kgMEGK12s5X5QnGlqg8DKOkTdCDgBOeprc+s42Agv9O9ntCA8HZ4G5BIifzfmSB4=
X-Gm-Gg: ASbGnctIQXbGg/PzncX7QeZI6fNiqYJPszqkX0rC3zf8NV7Q56THVrbEuBCG1HpWi+X
	kFHz+0axvsR02Ze65w0/fa8Fydiq3YX/6MDlZM7zO/vYJlMx5fHdd1z7Fvw86fgQLGKa2Jscx7Z
	AGtqvfcZkBzZd+hXhL3CVynMU1F1mg6p3X7OrSt/9oJNqLzjLqg/exb9IVnaFYLSYqRt0Au/FU9
	FB/YwQLVPyeeSE4dpnWIbUdQd35zyHr08Vh1ntZpyABARr1bmBX1KgY1UNne/QMiFcqnByPNE6H
	GpRktlN7deJH+4vuYgCtmCgiwq3sFg+ALtPuXFniwZ1UZGn+9Ck/x5I78Ji0sva+59FgHXPzN9A
	PWb1JVNHCT0hOp2YXi2iwJISApQ==
X-Google-Smtp-Source: AGHT+IEvdnxT8KmvlyrKaJbNer5T3dfHeAMIhWoCV/LtrGm/Qs4KGg5Ij/jKkb1ZiM1wDinTCtyDQQ==
X-Received: by 2002:a05:6000:2302:b0:3e5:5822:ec9e with SMTP id ffacd0b85a97d-3e643a24592mr5641636f8f.41.1757334233888;
        Mon, 08 Sep 2025 05:23:53 -0700 (PDT)
Received: from [10.1.1.59] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf270fbd01sm41989069f8f.13.2025.09.08.05.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 05:23:53 -0700 (PDT)
Message-ID: <33b7a0cdf62a7f980c362459963e243ba78de540.camel@linaro.org>
Subject: Re: [PATCH v5 0/2] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas	 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alexandre Belloni	 <alexandre.belloni@bootlin.com>, Peter Griffin
 <peter.griffin@linaro.org>,  Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Lee Jones <lee@kernel.org>
Date: Mon, 08 Sep 2025 13:23:50 +0100
In-Reply-To: <175398041189.3513.13629420060562627196@lazor>
References: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
	 <20250730145100.GA6782@google.com>
	 <1a72e672995ef6cd186f8ff18a91bb8b72d86554.camel@linaro.org>
	 <175398041189.3513.13629420060562627196@lazor>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_052355_916767_DEB09687 
X-CRM114-Status: GOOD (  21.26  )
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

Hi Stephen,

On Thu, 2025-07-31 at 09:46 -0700, Stephen Boyd wrote:
> Quoting Andr=C3=A9 Draszik (2025-07-31 03:20:56)
> > On Wed, 2025-07-30 at 15:51 +0100, Lee Jones wrote:
> > > On Wed, 30 Jul 2025, Andr=C3=A9 Draszik wrote:
> > >=20
> > > > Original cover letter further down.
> > > >=20
> > > > This is a resend of two patches from the original series that haven=
't
> > > > been merged yet. That series was merged except for the attached two
> > > > patches here. Other than rebasing against next-20250729 there are n=
o
> > > > changes to them.
> > > >=20
> > > > Lee, I think Stephen's intention was to get these two merged via th=
e
> > > > MFD tree please.
> > >=20
> > > Although I have no issue with this, it does seem a little odd now tha=
t
> > > the set consists of only Clk patches.=C2=A0 Let me know what you / St=
ephen
> > > decide.
> >=20
> > Thanks Lee.
> >=20
> > I simply went by Stephen's ACK, which to me implies he wanted it merged
> > via a different tree (mfd). I guess at this stage it doesn't matter any=
more,
> > since all the core changes are in already.
> >=20
>=20
> I'll pick it up after the merge window closes.

Kind reminder on this.


Thanks,
Andre

