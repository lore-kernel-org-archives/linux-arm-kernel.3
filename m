Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C5FE909C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 16:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBO6AhQqWag/0+NNJRZQvsAXIIMwJp6QA15wbRYbOcE=; b=rEJjQcU/hNWunhU4au9qQtLlN1
	mBCMw1daOrj0rhsqcgfNCd9KrR1F6uo55q56GrtvRn608nDq3GnteATS9t6vUegoo5Mfr7zaE5CCK
	SKsUYB7cC1/JkG31qJGesRr/GshgIvwJqAyh8gAxcD5gVEkqRYb3TaD7u7Ia62wbVLFMKnwkl7AFp
	BZe9JazZoNaoXhmZs/F8yQUcdmOSDhB4MkZkVgIb3aWpr7f3WG+P+0i36qoY+vk36S381WcoIwQvf
	uyhAtSd5I0d322AvcJFqBZgST0Xe3OkL1BSTkXhjm62gq5sPGS5YfP2WCcWpfrZU42EE3T30qTIIC
	u4HNFajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNVO-00000008XOv-23nE;
	Tue, 17 Feb 2026 16:00:54 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNV5-00000008XId-3nUV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 16:00:42 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-65a3527c5easo6259446a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 08:00:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771344032; cv=none;
        d=google.com; s=arc-20240605;
        b=D504P1KBWl267zZJwoKT+LAA8e+oSB8OqeveVFQSotMSrkNFoaP1aKNkmWnYPf7yFp
         EQ/d1cxRYsOmTo3eON4BIZRjx0cum4IemWw1wflEoGjQWI6LjoMquM29LFjUm7wKqB/U
         KVACCHD/LTevLgWiy8D4ZN0N+ur3TEnHBq7Epw8ZkBw2VeOu60V3kjqOU/SlplTVrTD8
         x27mE5cZwrEIe9LK9gDC7RiWh8sUW49RjKXW3UR94A/tJOjAe7B5G4Efnz8suV6PG7ks
         nncCaXLSmKW249KBkmCnKDSY2BUe7eLMjnhgJUC1SQsei+N//pwo4e7/rUm0oyvB4FXH
         mUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=lBO6AhQqWag/0+NNJRZQvsAXIIMwJp6QA15wbRYbOcE=;
        fh=2citxdzjMoQ74N6uMKv9pVVDYhYOxRvqsBZBmPdBWb0=;
        b=X6rb2rvf/rfz4Lz/RupDApFX23uW2tO1u08K40VRaNwmM1RBz4VIKcdC1/Ph5BCfZ3
         CnlBfIamhMZJsWX68idYYVNG7CjPHrRrisG+ugRSp9emTzFJBZSeQiPq4u5gozbkqTpJ
         V6G5lDJfwjl/DBL8WVH7o2smVKEdfQUFW46QLndZuvfaVCtLcTN9nD+BcAHap7MxExWk
         ww7J9VuxNlBbnFUhkPz4L8Enhdg5ZBw3jzO0fy6xgU846Qgn/GRJ2m713p+CDLsIi9Ig
         m7Ehn/PuH5lK3ylvpnWQBbWA519JK1w104Y7ZTnYeJSWMVuNyxss7axwlP6ig97/vldl
         m+Fg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771344032; x=1771948832; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBO6AhQqWag/0+NNJRZQvsAXIIMwJp6QA15wbRYbOcE=;
        b=feApMFWHXl52sjpLvjCze87o23nZ4YdSyF14ZBMh34MtHhq9lnsjfGE8QmsWB/UpTQ
         rP7ktvZeV6A5rLI+X5+65wtoOamtpu2zRAGjT4NVrSL4suU7zpEGdD1NxEgxq7S+61J0
         oMUeI51oW5VRt9K0evEMiMepVNAMIX+cbSz2/cDAk28lbZCdPMDrIaSYMldrL0BKhSu9
         48G4agR0vvAgUhDbaF0Q9fV8tUaIJDxwtm5aWL+TuJT7/Ulo6Yyao0UdtMw5rFa5p9jd
         Yfm5WSGKypSYa9IS6TvYjUOeFnAPaPWB5pezT9LJQyZZxG5f+OH/hh3CUIsEEpK3xGUC
         ckXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771344032; x=1771948832;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBO6AhQqWag/0+NNJRZQvsAXIIMwJp6QA15wbRYbOcE=;
        b=wpFn92zorAwcwUlN5MKDOgQopKb7mw7q131T+Ss+g6vPVezig50aRfja4NQ6EMIJL9
         u1qsOMlt0YOmA0hSZTqfBGB8vYK2M+krK2guG/OdcvZA17Doobq27QRpADQ3VFrrYjB+
         057wdgpqsgruuxbG1ZO8iE49j2CXzuUGSHJ2Xt82IWOxmHxSG5zKri+3YdUXXEbOoQP6
         poPbDsGv+0zZXSMdN0OgWpu2iweOWLsUlb6iFmTvX9MWmhZyrWLO1h53qy1QY1AwdLL2
         msm6bpdc+4uP6/XTpV11mytPrBC5VaW2o8ErMNgNIf+JOq2EebL0KJZmp9bib4cd+Fxm
         RUtg==
X-Forwarded-Encrypted: i=1; AJvYcCWbmgbes4vjpDFoEFdCxkZXd6I3v+ijMbnV33NLN6XzEzmBtPBOgQe8MpFi8eYVgZn3tN+JUl/HR2+ue4Mi6goR@lists.infradead.org
X-Gm-Message-State: AOJu0YyErFgxam0mEMMzlcVjXAkTtr4IE8TLc2Vn+AKq8KbwD4iLrECv
	zbR5WKo7iXRXPo2oanuEv28ND1j3AF9DvBnakf7o0ShStthu0AJPZ5JriWtQ6Lr3rL9BTzLjoP/
	DGZPtokIpaTMYAQDHZZVDoqzGUmGvBxM=
X-Gm-Gg: AZuq6aLRH1oK+LBcUJUXneRW/tzs6MN76siuBkc+P7PJm5GbsgUO1geaogAcJAMPA0v
	VnaqLM0apEcfnm9AIyuWmbhQmJLLpHUPk4Han3pWoqjw07hCr4p6y68qlSY7e/rZo3knMBKK2uF
	vkVhoBIxoPBtuNnYqphnoROfI5IoEext+Hf64vveTk1iznICIXyiSbqS3NWRinWJLw5/IgVrx90
	goCo6wriWb+7IsrnKAdEG/DZHt5Rhg1m4yEiVkD8EwYjsRd79iRBCTg9CBhHJGQRY2IQn7TVj9H
	YqElOw==
X-Received: by 2002:a05:6402:1ece:b0:659:329a:bc12 with SMTP id
 4fb4d7f45d1cf-65bb13b7f0amr6896476a12.29.1771344031210; Tue, 17 Feb 2026
 08:00:31 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 10:00:29 -0600
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 10:00:29 -0600
MIME-Version: 1.0
In-Reply-To: <20260130022705.1059214-1-inochiama@gmail.com>
References: <20260130022705.1059214-1-inochiama@gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
User-Agent: alot/0.0.0
Date: Tue, 17 Feb 2026 10:00:29 -0600
X-Gm-Features: AaiRm52I-Ps0aB0W3gGP80VOXo7IKX3SoIAUz1UAML5FnQLUef3qoiKkhjg5t58
Message-ID: <CANBLGczi6o4NwDF0fge0_RZ+TVX2dQ=vYD2PYMSupb5xSnabZQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/3] riscv: spacemit: Add ethernet support for K3
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>, 
	Yixun Lan <dlan@gentoo.org>, Zhi Li <lizhi2@eswincomputing.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_080036_988495_811671FA 
X-CRM114-Status: UNSURE (   7.56  )
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

Quoting Inochi Amaoto (2026-01-30 03:27:01)
> Add initial support for ethernet controller of the Spacemit K3 SoC.
> This ethernet controller is almost a standard Synopsys DesignWare
> MAC (version 5.40a). This controller require a syscon device to
> configure some basic features, like interface type and internal delay.

Hi Inochi,

Do you have a tree that includes the dt entries?
Otherwise how are we going to test this?

/Emil

