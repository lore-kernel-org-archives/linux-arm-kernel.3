Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C13DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 13:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CuBgNv5cd1S2PD2hevcSRahDNpP8CA3ZoLvuCSdO+No=; b=rbCfej95G3GVUx6r0imRJM+QnV
	77s14uCdTCDPdn2ESOfawl4rZC12E6mEN11TQg4cwpxiThqPThLjf4gmUqt0Bgv9R+pDfnmq9PoJJ
	VqL896uNVRiBL7ccKyDzvrM3me/tO4xXeu1KoqGK5NkiQ4a9RsJ9r73nSZRV11qa2I7vRrfJOm15h
	FjNC5arLPOfFlvfkuh1f29gp5w9p6y2G37DqW9fGQ0/kU1bWH/SP8G0tKTqTdT8S/NXCHp42i8D0d
	AaQgFEEaVY728/f7THOFN5M6m3GMsQY8k0s9XnD/ZjeNN5gP5gsVAoIXb0UF8nU4S2A3vBSa5kgYL
	6P32IsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5mBh-0000000GJqL-34Zv;
	Fri, 18 Apr 2025 13:55:25 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5m9F-0000000GJLR-0MFL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 13:52:54 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-acb5ad040e6so23295866b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 06:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744984371; x=1745589171; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CuBgNv5cd1S2PD2hevcSRahDNpP8CA3ZoLvuCSdO+No=;
        b=RaPO1e041dVfL8gi3z4KgCj4hAWYCCZmxmy1IBvJ120bcC1RhUCSqySNNbE4qAe/zi
         Xgk0EYuMO4U4rokC9dps4eG8kCY6qzhJRfxNjrfaOHkfGdH0ac29iWNP7xVSmZJ+Dy3f
         glLj9XjiaAH8XByXYaJiDL1sgIxRtn6pkXIAbr3n8q/jPUIeiyNiJM5YgkVaXHsbqh19
         D7YprcyQBwiHG5ney7Sb8A33K7Au/hAWgvppGMsRIcf3wm9N0EPo0TNTTwhkTREMWglt
         RnDVn3FLmA85hxuQ4mWliflEUwaxAi1LCg5jGU8vuc2h7di7BlSDlHcUeGm/1UUwUWQx
         7HwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744984371; x=1745589171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuBgNv5cd1S2PD2hevcSRahDNpP8CA3ZoLvuCSdO+No=;
        b=R4ujrglVzxF5LvydlRqsXJscn1lAlFCny7wk64B/8vi+WBU+30z9sS0HWKildhk13i
         fEwsOennE8Ds6pnpzHC5riHfUBjUHtyrjJf9xiCObRSD2kTF7NMVR10VmAbHicHX86Ma
         c32kF01ZT5xzE/IYSZcd5q2ha28kE/BrcHl5qJt0WQ7rodzIfQbEnZAV4YguHQmH+lL7
         2QtsnuqhkUJ0iWXQcvSZOylQI3jO0BgcFNTrs2C0cqeToM/GXkPyC7a0LUOpAy2fZybH
         e8FRXb3k3TestFcsyqriHKgWQHaecCGZxHpjEe5kfS/nuHXDMkT0PG5h/gMUUtwFQIqg
         tEcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3ZcyE+TrEw1Z+4qyrY0Rlgk4KP+3FfOS1ZYTVDPnhukn34tElGGRGbQ7OJGPfHHESnyqpwp5XBphIfGPGRFS8@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx7KQNnhj5sHojAe2pAEaznEtEqSWhR/98OdHcH6Dwigg/MbXD
	Ka56Ki1heySzyzZxACfT3NKSKGNqwYtRvB2EEllNVZcCWGd23MkF
X-Gm-Gg: ASbGncsPygdJA2zbJ9Z84m/QwycK3JDNDMhHnTlkjKDtCBAln5Kn9r/XgEfF+aZyODp
	jsnkr2LcF47lmnU4Ks6YzFQKTUW3jFfEiGyPO1QvFiQJ7NCW149rmt3mk7q1Gz2YDJqtW2Oidce
	UdgV6I7T+dyvUBWsSWpdUTBpXwwoJt54jFe1YzoaaAt6DwDp/+oDW3y3/xSrOHlJG8SViXBBz58
	mFhdI4kFqO6JRPfanBnw1oZ4yAwMcWWgkBlXEo12NxuQdLLLlB45zUf5zPylZiAXwa0qzEPUunk
	wmI8UWyI7Q81eLV6nY43rJGYL4iO
X-Google-Smtp-Source: AGHT+IFVtlQMaZys0yRiOygdgzqKHFtvYUnzaYsTx8NK1/CznrSsNWU+sPquLkREls3wzbKnT9aYMw==
X-Received: by 2002:a17:907:7f0d:b0:acb:583:c63a with SMTP id a640c23a62f3a-acb74dd060cmr67927566b.15.1744984371062;
        Fri, 18 Apr 2025 06:52:51 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0bedbsm124885266b.16.2025.04.18.06.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:52:50 -0700 (PDT)
Date: Fri, 18 Apr 2025 16:52:47 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 net-next 02/14] net: enetc: add command BD ring
 support for i.MX95 ENETC
Message-ID: <20250418135247.kf3syqrv3lznmcbf@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-3-wei.fang@nxp.com>
 <20250411095752.3072696-3-wei.fang@nxp.com>
 <20250418132511.azibvntwzh6odqvx@skbuf>
 <PAXPR04MB85105C88656FA179985C8F0D88BF2@PAXPR04MB8510.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB85105C88656FA179985C8F0D88BF2@PAXPR04MB8510.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_065253_122010_068C606E 
X-CRM114-Status: UNSURE (   8.50  )
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

On Fri, Apr 18, 2025 at 01:49:25PM +0000, Wei Fang wrote:
> Do we need to retain cbdr_size in struct ntmp_user? Or just remove it in
> next version?

It seems redundant with cbdr->bd_num, so yes, please remove it.

