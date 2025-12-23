Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE1DE6F095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 14:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SHgO8c3/7WE1Cv4CaupX7YH2/KCHPAJCS+idU9yLXI=; b=gtErS5Xbwoizq1bO4w8z6fWg7E
	qlNw+uLgRvQ4wH2PZ9H5bfvuq9pi05X/o51wZSfjK8Kqyx8+6vD8Tnz6ds4mezn9FNdWQTLhb6g67
	fGotWGWm7dOWmCfwO/P6L9FiwpPlfgJaYkXGEDO6i1snrnchJvWeceCW8IzXvbBZsXSe7GTo2aEc/
	QcOI2zzpYlKLB1Yr0uYaN6hn8EA7qOrKcsI7GD1X8B176G890PBPc3V7bNU8gCw57oOmsFPK1y0xG
	UoIVo9WzD/bo2IjruUtlMqsNWlE4Gs6QI5pzBFzqUlsLXHM+IXipFvNbDkrwi7e2/FBz5v/zPYscu
	XeHSXW3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3VD-0000000Fcwt-3fhH;
	Tue, 23 Dec 2025 14:36:43 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3VB-0000000Fcw7-07gh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 14:36:42 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5957c929a5eso7276871e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 06:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766500599; x=1767105399; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4SHgO8c3/7WE1Cv4CaupX7YH2/KCHPAJCS+idU9yLXI=;
        b=gIbS3el8PuH1ITpibYKQQUnqDKSbObMetWOB9ZuF6FQk2bL7c9UxHH0vRdKbGwB0Dj
         SblGhc0SErc/faxqeo6a4Ld3wFXp/HKyOzP20EX37InHxiHpDUhc8hHMfCfKoU4IKY3W
         BeRh6ClMOYVAZ2tDzr0SxQQ+u573FNv3HLXm53917TTrzyY/zZk76iLZljxUja59Y2N4
         mC7luCrZRJZcIRhZ/NiK7HyTzSBvppuI6fP46knZdIqA0FAwxxdnzcKv2AgL31fpLnGv
         HMiFRjBVVZ5Pi8S3uLDtV7hJIPVjf95kz+FuPjoErY3i5OBHu2h6obtinLhIHc16Kiop
         He5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766500599; x=1767105399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SHgO8c3/7WE1Cv4CaupX7YH2/KCHPAJCS+idU9yLXI=;
        b=KHxGPU7+71sWuIhARQASTpkCP0rvB0vFzZJPN9Qp7xNy+qZOuFCINLi/S7jdWxMcOP
         C7qEEQNt62ZiGKihJw4VGs6txxvnITA2CR1p7mtnRV6JlzXtMmrGUvW0fhkOStNKokc7
         mq9aBI4lGzwpl243qynVTy179AYoPMklosKnAZ64oFj9Yn+dX1KVwnJiTVC36L+xd6qU
         rGXBXSo2JkuTCrFpobDEtAnU3uFlqHXVl/6B6oChcV9/rRdEkLVf4065XkKq9nvpH6vR
         BVZu6EEy7N1+EAbmRfSIhygFoIbyrZfZW6wlcKjLwli3Nfw0622w5ZtIXh8i21m4+s9P
         l7MA==
X-Forwarded-Encrypted: i=1; AJvYcCUEU/JbqGlrhF2jPNMzqSsMosK5BUe961SVDZDqRLdnaUMaFOBOPJ8ooG7ICepUU9lZ2L+NF8zMujisXzzpj6wr@lists.infradead.org
X-Gm-Message-State: AOJu0YzcCRHIc2G7B+vQv1Mr5xaVoLb4DofjaPZxpaoJ0RxoVITyfH/g
	W7aSDeUQgsD1hgJ/NVUgIO189RZFoa59ZXr1NBeEoqhOJRCPmMOmXoEwnXhnXbkjyxE=
X-Gm-Gg: AY/fxX4eYAxee2S5W+la/DeX5dFvvAjIuZwYrOw4HYdMWlgrjGuESBWxWvhzVkEHKCu
	2j2qEeHrBk9Hsr349CX9rlK1nQXmxGzCOisaOlSGXuXMohlgNqKNyN1OSTAWdQzZenFQysudLQJ
	pRYglGEDHza54Gmoug+DzblGz7FbYfsQ1qBoKgHH1Ggm1fiEmZBtPZ0GvgkM2FgzPkR8yRmN325
	1Zqwya4HOMKiHyYhRbPaqBUfveF9qD9NnsnJNWGtpLMe8PZ13dIgBWDEwYY+NpUsgY9e3+KddHL
	OMuy0U5N9mwnGE81JGGgO3OOJ6MI8cmp1p4Q0s61d4mAYlqunHXPaJM3btv20rF4Bf/CmvoKp0x
	sPLuXY+F4tZHt3SONYlGmaU/zKEupkmrit8LMqVQLl+JLu1DmlWV0laTARPD5iXSOlkxT0dnFJK
	2faQ0U86Ey0YFriZk00cY5fY6hXgYnLR9UQAwjvMQrBA+V
X-Google-Smtp-Source: AGHT+IGtMO0XTb0xSuOY6uFq3vC2FmPaewkwMSxc/PhmxY7K7v9FFZuFQk5Z+2FAsbQYsgwuvCb6vw==
X-Received: by 2002:a05:6512:3503:b0:594:34b9:a817 with SMTP id 2adb3069b0e04-59a17d462dbmr5270390e87.33.1766500598618;
        Tue, 23 Dec 2025 06:36:38 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ea248sm4073402e87.43.2025.12.23.06.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 06:36:38 -0800 (PST)
Date: Tue, 23 Dec 2025 16:36:36 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>,
	Eric Biggers <ebiggers@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: defconfig: remove SLIM_QCOM_CTRL
Message-ID: <aUqo9AV2zSJqr_oE@nuoska>
References: <20251223134807.3543642-1-mikko.rapeli@linaro.org>
 <c06878f7-bb93-4de2-b54a-e97fbc1a333e@kernel.org>
 <aUqgFCgmBy7H9yW0@nuoska>
 <4f99f3ba-ef5b-4163-ad1a-99527dd96f8a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f99f3ba-ef5b-4163-ad1a-99527dd96f8a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_063641_098883_7475ED3B 
X-CRM114-Status: GOOD (  21.64  )
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

Hi,

On Tue, Dec 23, 2025 at 03:10:56PM +0100, Krzysztof Kozlowski wrote:
> On 23/12/2025 14:58, Mikko Rapeli wrote:
> > On Tue, Dec 23, 2025 at 02:51:45PM +0100, Krzysztof Kozlowski wrote:
> >> On 23/12/2025 14:48, Mikko Rapeli wrote:
> >>> It has been removed by:
> >>
> >> by commit foo bar (see also checkpatch and submitting patches).
> > 
> > Ok will duplicate the info then.
> > 
> >>>
> >>> Fixes: 7cbba32a2d62 ("slimbus: qcom: remove unused qcom controller driver")
> >>>
> >>
> >> Drop blank line
> > 
> > Ok
> >  
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>
> >> You anyway need to send to proper mailing list for this soc (Qcom), not
> >> random folks.
> > 
> > Which proper list?
> 
> The list for this soc. get_maintainers will tell you that - run it on
> any soc driver for that soc.
> 
> > 
> > I sent to addresses reported by get_maintainers.pl.
> 
> There is no output of get_maintainers.pl for this file. It's one of
> cases where script does not work (I think already documented in
> maintainer soc profile).

Sorry, I don't get it. This issue is a generic one since now arm64 defconfig
has one unknown option. Tools which check kernel config for unknown options
trigger warnings when arm64 defconfig is used.

If get_maintainers.pl is broken for this file, then please fix it. I don't
know how to fix it.

Cheers,

-Mikko

