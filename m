Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26CFC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 05:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6qTA6cHT7QQtMvCxkLbKuRSVS9SJ8QTSZ6o1ZHsFO0=; b=oyghTRR1lE7niOkuL05MAuaxEu
	7v76lHUOeNkJVlLY5NVAzVvbU/QsecrHu1IaHa4bQYrn8bnpndmsVMiHDjLsZ6bmbioKOZ/Tob5dY
	A5R4Hft5/Cf7BXX0BooHrrCPNyStqsjmcz+D8QtPYivwUIk5Quunl87n2+89KkQy1vHYtqsOHOhjm
	8PE22eYTUtkCnOobtfMPZGTBidI3Oyk95pw63XUr15tM4P3VWUi19pvJK1ZIij+6dvaclbDUc7J+n
	NAs6ILmLyhmFmhAVRlhUhMiOitl21TB1kffbJFbXxjIayh9rPq6OdpC3JWMViBRlaBMcA2qM7aTOp
	Kmv7IKjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGY0-0000000Dfxc-3sIP;
	Mon, 28 Jul 2025 05:37:16 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGVT-0000000Dfll-4AVL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 05:34:41 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3137c20213cso3858325a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 22:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753680879; x=1754285679; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k6qTA6cHT7QQtMvCxkLbKuRSVS9SJ8QTSZ6o1ZHsFO0=;
        b=lNL6CN7ogfhP9lAW3FWBVjiH7Mv+MPWfj71WRkZ0IGkG1WEdS8DInb67tPHU6tBXOz
         IIVnb0jkO1Xlx7iSTDVrYdAkgBysriOjXiaNA+yJ8fGf/qaj0IbwcWexDbanIRQ+EatP
         knyM0/3MboQM63GTRYeOaMQbvqC7MEBTX0sjVvTi+WyXDXDJUhxesVBGEQixRaEzRv9x
         heV/W7lelF5lXcblNNq5PoneYizin0RGRzfRfYLfa6UOo9tqsTw9TMvr1mFQYnpd4jr0
         C6qXwpH4Wq/YfhQheIC8LGMfd8b0ZqktLYC98XkRoSxXWX5E/b3w9W/P86NxhuFRXsuT
         CiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753680879; x=1754285679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6qTA6cHT7QQtMvCxkLbKuRSVS9SJ8QTSZ6o1ZHsFO0=;
        b=i4vFf2EGzbyBDbHXvvOwb90vZX4+lrDwiWmP6x87lis8nsShBVbZdug3j4cl+DUIvb
         hQtJeEDbmWEfPqEUyVzJ/OnNxR5eqR31YSOXvfEDVpORPlJ+wgNGPiqRFK5qLN0YQFXm
         StYYbHCA4GL5eQVfNabQIbHzpBWpwOnie0i+UtkAvRFmVE5wDxfddJdE78Byua50NmlE
         esNd5cgwYm9CI4sysfsHzZlsKxsyr1h43145atmdzYrq6x4lAn5sTk9WKrLhQhrohSW2
         j/r+XC9t/EgDsStWxtCL/FpmsYS5YOnen9llm2HcfvTe6l8t+DQyKlpF2IggSkICef8T
         VCOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKHbtEkPHxdOsfLMSgCM1uCXaKvsLSjX4uC9bdjfpzRuO2KjsNamD7UEIIVFgLepr3/KC+5VnaQeUq4RRtRDWe@lists.infradead.org
X-Gm-Message-State: AOJu0YyCwu/3bemtig+pyzItUvrmG98u83Jwlp72xNGsGccP/FH78San
	n9HrQV6Kmj1PldtOLoKE4e5cpmRRkBrHN3BqELBN2aqxwJsgFEXWQlI/
X-Gm-Gg: ASbGncvgJmFRL7JC0LArhBg3AplQkx0SkMku0Z+N7WOUzIYrMfsCH0Tl/JGVgMtI9Ao
	jAjXflX2Yi4uvjCqT1SiTznmQV1t3c4HmjljG2nBv5v9JqikFo51jJGAK0SmtOPsQVCRFDyODv2
	fg872l9se5zQ+z21XX3tqgQnshOSQOWn7EeuHvT/H/GVPnjL5oXfhC93RAtZhwMXpEg5G36YtDI
	JznJLvdk7Q+kU4EmAXd+Pfy0BqwxK1/aILC0TNSxMDIl61LLpJKWDYcfGyfxJ36Kkw/o5CnZMpM
	qG2UPwzf5K5bVkWcJ0vQ/KLH0kHa4yzodNYYCF7ay4W0ztbP4k99TwaHxHeFhq9LsjhECezwMIh
	LQLBhFQQ8Xd09xEaw5GBru8EAv4evvJOtuBJ45aK2w624oWISqccGHYZR4d34ZqPC6CA3GnPYrh
	w=
X-Google-Smtp-Source: AGHT+IHvKUeJgGPP2KuVZC7MV+slZ+Jy/0LanvshipPIkk1k/Fwjh/2vrhM3ta3T+sWIO3FTVGbo3g==
X-Received: by 2002:a17:90b:57c5:b0:313:1e60:584e with SMTP id 98e67ed59e1d1-31e7788cef0mr14119890a91.9.1753680878918;
        Sun, 27 Jul 2025 22:34:38 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e663a71fbsm8559351a91.35.2025.07.27.22.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 22:34:38 -0700 (PDT)
Date: Sun, 27 Jul 2025 22:34:35 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v3 10/13] ARM: dts: aspeed: Add Facebook Fuji-data64
 (AST2600) Board
Message-ID: <aIcL67c4VufhfVMY@localhost.localdomain>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
 <20250723233013.142337-11-rentao.bupt@gmail.com>
 <d09667e5-992e-4ced-ae30-7a4116a72c62@lunn.ch>
 <aIGGdbIX9HaV4dB/@localhost.localdomain>
 <769d6817-ee97-4a23-b013-29bc875a00cb@lunn.ch>
 <aIMTvUyHGd/ikKY9@localhost.localdomain>
 <aIW/xEfJX/UD1kje@localhost.localdomain>
 <9897e0a4-7c70-4e27-8591-09e9d6ef2263@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9897e0a4-7c70-4e27-8591-09e9d6ef2263@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_223440_054409_6F5F151B 
X-CRM114-Status: GOOD (  16.75  )
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

On Sun, Jul 27, 2025 at 05:45:51PM +0200, Andrew Lunn wrote:
> > As I'm not 100% sure where the RX clock delay is introduced, I will drop
> > mac3 entry in v4.
> 
> Many of the hyperscalers, or the supplies to the hyperscalers keep
> hitting this. The standard policy at the moment seems to be to drop
> Ethernet support. How useful is a BMC without Ethernet?
> 
> If you all got together and talked to aspeed, apply a bit of pressure,
> it should be possible to get this mess fixed pretty quickly. And then
> you could all have working Ethernet....

Hi Andrew,

I've already reached out to Ryan and Jacky from ASPEED regarding the
topic a few weeks ago. Originally I thought MAC-side clock delay was
only needed for fixed-linked (for example, in darwin dts), but looks
like it's also impacting platforms with PHY..

Anyways I will follow up with Jacky/Ryan after addressing all the
comments for this patch series.


Thanks,

Tao

