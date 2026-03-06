Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAF9F5140F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 06:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6UzmXKeeCe44GvgiQXGEXz7ViU57Sx4ETdclGODk5U=; b=SpwxfFreY2hnj7ES3buGqNepKC
	6sCbjcb28rtXFG/L1VS8K0ug4sGAQhN4quiXl73RTdiuTdKCoIgUQnEUDN661Shgov1iA1zTJkvt8
	5X7uyOtnyZ6gvEZMz5ffx4pZ7IKTh1FT1EGqtzan1M5HD3C/iqfRPlgLfgPPdz8iTCi05MhngECDO
	8uWWFBjOk97jitkodNb7KtKcTY4waETrG82HVjJMsTHBI0aMqw8StrQt6opL9WiqynVXUFGcS0iIT
	Lg/ZuysRJMdI0mInLu/SgUb5OW7b/qA/Hr+CnVcd/F1bNGuILrgKnHxEB8/ADRl4/GodsIndNDoGb
	JmkVmbcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyP9k-0000000379V-2qL2;
	Fri, 06 Mar 2026 06:59:28 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyP9i-0000000378v-1OlZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 06:59:27 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so5536046f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 22:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772780364; x=1773385164; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o6UzmXKeeCe44GvgiQXGEXz7ViU57Sx4ETdclGODk5U=;
        b=Lid6w/tKXA9WnTSWPH0AWzR0M2l8BsReM5qUpjOM5PU09TS4gpQAHAGHxmK6SfTuit
         p/5qYwo4k2B0TxDAtCbnl/aYQWepPP/YwyXFra7LB0yw2eSAxI+Uenart4wurkPUkUhY
         lQJGKoJKJKheXSo/UANoEizdicLON/5M9AuwJt8qmlpauwwMQe3KOaiNC+JJU4N8VLnw
         gSzKXaHwhaB9jFtKJEoFw8mM748wBYZ3hRVMvZfiPmm3wPDnXM5J0Fwuid0FttuWWOxv
         BIOWoqpWCkTdTjCBZoB4l72gGjQ7cZE5JJnDk3K4roctZ7HFuKSU339/cgui7f9XGExY
         n+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780364; x=1773385164;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6UzmXKeeCe44GvgiQXGEXz7ViU57Sx4ETdclGODk5U=;
        b=h9AfbOyYnmUy5XIt94xy5xe6WUyE7AA81SNq+ZH6IydUjtnKCvLtLwqgxEbnyGjRRZ
         JtKbSQeFmkYvJsTEBTaa2MIPx0/RwQkhGI1qipHBanMY4URFFkKeg6edVD24PiZ6IM8U
         AB1YA2ZWU1ZaXOtV+UaPeowCcpQ7HTuD5IB8illWyXwRG5/OLTChhQ7Sb+Fm75xkXLzn
         9LmkH9Bj+OJn4bdTp/5FciarDM2hN+iBb0ECmmOUB0xhLDzqEHawmsZ8rh6GsESyhWiD
         jcU7hDFUhji1p561tqTX+YWZZNDGRU6QfYv9nUrH4JduYGKoH/WXPlcp6dUQdLJbDXEE
         3i5g==
X-Forwarded-Encrypted: i=1; AJvYcCXUCCHj1iUwBsyoRatEypZd1709339yIesnuTdPZWro9ddJJKpkSBZxbHzwFJoQjPpqN6kjN197/EF1Qsx/4TiL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5oEg5wEQNF5RbpPpHiJo4hkBrso781mDGRV07bZruFu8+y52h
	c54muEnV6vwOquRpXMyo9ZLqLtQb3eZVyX+JL+u5R7CUP4WYQqdixcSuf01wVEIEgtA=
X-Gm-Gg: ATEYQzxkwp+UqBNndXr9GbLYptnXoel4+RGEvt9PX3NaSSgKXtmCnT0wo2sS2uFFZ4K
	QF5ILAkhbMawUZi2M0fLkjZqBjEF5sgi9NOg12BsTjQkoaZUW6mtZILVxYJ1bq7GbzYqyKJLrRs
	Z+WHwIk8D7K8PsOKWGkF+oD4AMrK2iRs2z5TK/WbXDUDIEsZ+0pNdpHStOdeYoJuQYHuT6KywF+
	NQ7YMXnfFXWFddFlAejkOFQCRWhBp/PvCcu6XH2TueQhN2cooJ/fXDxuaFK1MrduDo0K/DhZkQo
	BRfF7dH5tcNsj7UdQmKx53zRPkf1VdfiokNkMdfj5RDB3I6msMfAwNTi/Om0TeUXt1dW+L3lRAG
	cZSPy9R0FSsp5yUE46TCzBySMM8OBIMpN47/308LV4M/C3twx6+kapjGx/SybQ1J6WPYyAs7/Rp
	46TPtsj9pnq6eS2bKz1495dsVlKXj6cSMcYq392d0=
X-Received: by 2002:a05:6000:4009:b0:439:c8a3:45f3 with SMTP id ffacd0b85a97d-439da555695mr1568221f8f.6.1772780363666;
        Thu, 05 Mar 2026 22:59:23 -0800 (PST)
Received: from draszik.lan ([212.129.78.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2ba06sm1701166f8f.24.2026.03.05.22.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 22:59:23 -0800 (PST)
Message-ID: <c323298f8a16d62aae47fdbd24d28d3d3c302d46.camel@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: exynos: gs101-pixel-common: add Maxim
 MAX77759 fuel gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar	 <alim.akhtar@samsung.com>
Cc: Juan Yescas <jyescas@google.com>, Amit Sunil Dhamne <amitsd@google.com>,
 	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 06 Mar 2026 07:00:45 +0000
In-Reply-To: <20260302-max77759-fg-dts-v2-1-12f1109a6fee@linaro.org>
References: <20260302-max77759-fg-dts-v2-1-12f1109a6fee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_225926_402361_30883C8C 
X-CRM114-Status: UNSURE (   6.99  )
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

On Mon, 2026-03-02 at 12:35 +0000, Andr=C3=A9 Draszik wrote:
> For DT validation purposes, this patch depends on the binding updates
> from https://lore.kernel.org/r/20260226-max77759-fg-v1-0-ff0a08a70a9f@lin=
aro.org
> They have been ACKed, but not merged yet.

Just FYI, that series (including binding updates) has been merged and is av=
ailable
in linux-next.

Cheers,
Andre'

