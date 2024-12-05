Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F16E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tR8Gx4YF+iGaCMV6DuY+XQYSDcjVdzyIfn9PDc6LDOM=; b=DZANR5WNff4c/YolBTt9U8n9pm
	EoZH56qut3rpg2ESImzXAjbyWAdGVw3DGzVyZtP6tEjsHhtDUOQN8VDMqWKRgsQ2PptQ2i35VO4XY
	ophFK596RlGMjQBoXcQXRQVUYKoYxW41K77KO8jEyHpTVKB917c8+x+M49FA/DLQlXVcCBmkcybxA
	2poN8AC2t03DMyxs8T8/sDrzm+K7sShB/mESW/cxqM+AUiB8gCr2OVaYnMSMbdrsNtvCqEU0TM+Ez
	egE3zrdqvLaSP6zke42vpetf5iUbvKagItj+snM8O/bR9yZ0q9o15S0txxrd92tw0QXS9661w80Bx
	ptnq95qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGoq-0000000H8n3-0xHQ;
	Thu, 05 Dec 2024 18:43:20 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGnn-0000000H8dV-3pxy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:42:17 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-85bb264993cso278920241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 10:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733424134; x=1734028934; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tR8Gx4YF+iGaCMV6DuY+XQYSDcjVdzyIfn9PDc6LDOM=;
        b=oPFs7nypFPPxFNhIELyVnoP6Px/ZB6k7Gte1L7A5jg6zrLAt243PIrLOTrJ+LeVsK3
         7GEyrkwXI6Cw4rb+iGBKw300FdWHf0aWQeOuhDOueJN2VCHAoflIliILYZcfTg4xN2oZ
         sfgsq7BytVv5mN8yOaFs+gMVLEooylWpFYJ1ey8QmnZUJ8gyCKG/McIW7CTxDDJfFgRn
         sDvCvUuFfy0bkmHoXOK90/PJTqStx/bHQZ+s/YmPb72iaIO0/wennUWYTxIZCoOvydMP
         +1w3tzg26QIMHsYaQC0kzuraL6yCnvtCe2UbGK2cJ687tOsRg8cpycWJHifNaKUGBj9h
         K5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733424134; x=1734028934;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tR8Gx4YF+iGaCMV6DuY+XQYSDcjVdzyIfn9PDc6LDOM=;
        b=NwmbSWORsyqqNA+i43wVd2J8DxfViggD6vRSTJcnmFSqQZYYwLbADpTaXpStzpmbq+
         14Gw3NBPI0a/qo/EIoLh32dR6t9zANVzMX2pAeAOsZTtqMJ0c2rGO71DdVemz8zparnF
         +4cTXvktx4PAqsqWleD2oc6s+VPNOJuxH3/57tPciyacLvtdbpp6WPNtEOob/KPA1sux
         U4LsYH9LYO9KKMUZXU8ai0jxqZAdPg7AVhcU6XJySJ5z6wwDk1cwjYwIm9uehgox8Gle
         2xLdTTNI81FBdhslT3uMmd2hLL0zusCvb2OH4YUT6s09kZ06rjVh2SdrDgEY+3JsZ7GB
         fngw==
X-Forwarded-Encrypted: i=1; AJvYcCVf2Fucs58LpM/RbwtASwR8mG19Q1SSmwOwZ4WzJckuq7SwNyLRSM6TQtL1v2U54ArNskID/ACcU+2TumBDYL49@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9gYFMr8qNYICRvsLeMJQdJvfoz5gsGSicn52uXM/dwV8GPcvo
	mxPUtny3o14R2Rqh4PhsvbfU368BNh5RDE17SDi/QnNxtXx4179wOTQ4m027KLjtFKowyvdith/
	I11bQcayjMiq9tOGqqOcYGpPvAlwS3ntlBTJfKg==
X-Gm-Gg: ASbGnct6/PpKSu8wZXdevkvm4mSC+SpACTfbEpWl3i5tqms8u5jLY6wpEY+uShLrV53
	AlakScTnJZJ960OGTpYF5zUbQBZ9rOcwr
X-Google-Smtp-Source: AGHT+IG269PkgdVPpsUfRMnNfyCTRw+6b9s1FqQamygLLFlRX39CxuzaR647OcbZrJKkKII8mvW1s/GWCnxsPXgxkTM=
X-Received: by 2002:a05:6102:3909:b0:4af:bf45:39a8 with SMTP id
 ada2fe7eead31-4afcaa4f74cmr835447137.16.1733424134670; Thu, 05 Dec 2024
 10:42:14 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYsT34UkGFKxus63H6UVpYi5GRZkezT9MRLfAbM3f6ke0g@mail.gmail.com>
 <8dde5a62-4ce6-4954-86c9-54d961aed6df@stanley.mountain>
In-Reply-To: <8dde5a62-4ce6-4954-86c9-54d961aed6df@stanley.mountain>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 6 Dec 2024 00:12:03 +0530
Message-ID: <CA+G9fYv5gW1gByakU1yyQ__BoAKWkCcg=vGGyNep7+5p9_2uJA@mail.gmail.com>
Subject: Re: arm64: include/linux/compiler_types.h:542:38: error: call to
 '__compiletime_assert_1050' declared with attribute error: clamp() low limit
 min greater than high limit max_avail
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: David Laight <David.Laight@aculab.com>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, netfilter-devel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Johannes Berg <johannes.berg@intel.com>, toke@kernel.org, 
	Al Viro <viro@zeniv.linux.org.uk>, kernel@jfarr.cc, kees@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_104215_966452_6F82FCEF 
X-CRM114-Status: UNSURE (   7.14  )
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

On Thu, 5 Dec 2024 at 20:46, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Add David to the CC list.

Anders bisected this reported issue and found the first bad commit as,

# first bad commit:
  [ef32b92ac605ba1b7692827330b9c60259f0af49]
  minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()


 - Naresh

