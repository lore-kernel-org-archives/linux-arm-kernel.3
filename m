Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EB6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fY+hDpLzJtBhDrBf6wESfqlaw9mSea9W1+P81uS8duI=; b=SihD8ebjcmE8oWEDrSp6uGOh55
	iJgV7s6N5+EkkglFxZL/lfxOUjoZAP1S1ZtILcINwCFuZZtcgvi40/1dj498fBHsYG3dEFqDvfTNu
	4boym8kP7TVc8/mY2ThAGxhGXB4P/VJRA3i6JZ2tuA525xRraV4ruIZUxVqrcqOmeBmi1pGYi0vD+
	kv7n5wddfz0KxSpskxShgNZrgXzcIkb93C5rZ9xgGPcC+R3yX8KM0i64/Z/du29xD0YgcTbRsxHJ+
	ZYO/zBt35lhlXLZ31qvG9a2U9m2vfGa5IgcpRLwhH60xW4cZ61mcN2sHpsGqod0RDP0H+rDv329sp
	cL3CkhEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5m9m-0000000GJUM-3iJd;
	Fri, 18 Apr 2025 13:53:26 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5m6U-0000000GIkQ-1qSJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 13:50:03 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5ded500589aso287924a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744984201; x=1745589001; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fY+hDpLzJtBhDrBf6wESfqlaw9mSea9W1+P81uS8duI=;
        b=BKefdrYjWGbQw1LktIApsD45xHq2CoXi4xUYEesoH9zBGB9RzpGMvfNt8TN/surGES
         MKczF3ajRyGpOb4wImWNPBqb9L/wnz8WfwaLA1Qjo10G0pRaCjD8LF5u88iQTXFSg/UH
         aXS+7dPUwOK3Xd3f4s3hyBm1FCyZ+ve8t4Ub8geM4EhaY2kqs2wGHGSxb8lbhGzhcQXg
         U85+VuRsy3VsP9agnP96LOQUKk+tO71N1+AI47MDS/JNHnQ6lJS794cb9SO7snRG4bG9
         CX/FMFEPHvUMxloWhogfpYNSsokanlq5VT9UhGF7d5vzAC5d4rCseYHOBF9+4s/Z20oy
         8SKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744984201; x=1745589001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fY+hDpLzJtBhDrBf6wESfqlaw9mSea9W1+P81uS8duI=;
        b=Fbee2LzbuDQ9hDbMPk6gWDKVgCypCcC39zj7ROSY/Sld24WTJB2ARI2yJ1o/UgQliI
         k0vTbkKb11PqkEDFLeXZUHr1Zf35Ko3ID8MNkIwhucODX6hzU1ZRLRGV8+mfrHjsk+4Q
         +N0+qU10QINQxl2WknN1Kn1TUlyI/0qojw0cctwag3de5xOOhDO0ZRVpC4sLZNjh8w3F
         4lzz/echGU1nv5UJxNa54MlUHfvDSwQE24CzhRD+NCCVOowxbIyLWEOP9RJrnx/UWbPV
         EWAjtsVejC5+4siayp/1T7RpKD1cHHPUsRc6h/c6iO4jYeQ/lZ7f5+YQuE/sYbA5ewAR
         FiOA==
X-Forwarded-Encrypted: i=1; AJvYcCWcYjvCWpLLmeqHX2QGdkdOe1Y/ZR1B1o5bBqUKe8WBprLOlqsLiqaDsl9EAUijsqtcsr/PYZaXHIsZwT3Cx0K4@lists.infradead.org
X-Gm-Message-State: AOJu0YzyoTI9vNSvCfTpV1Qsb2KD+72J2oqbVG6cRFRVEiQ8zGEMPK6w
	y/HywJ5J8DZYU0hICVLq6lUWvRZAVaHO2ZFlThSsixcHoAveHooP
X-Gm-Gg: ASbGnctLeUJR5y9koWeqKZxQ9rNACOPJ7opxlUaFjZXo3nZdHVMObEF/P/rnKmcL2/A
	4xJGk3qtu8541trQKkUg8Wq21c1kO5qnwC2aLGmlghwTCsVXllUmG391dF78vjDwd0uxzlTs0RG
	tWBSlcYK6hK3CIV52hH342Lr2vuxqTyw5hOxJtM0OJOLN7DPfzxu7wQP4iCh2TVx/OW1nhdImzX
	fuFTgr75ea4t6PPiVttiE+RF1qnobPuQVmghPukQyWlMB3PnJt/YigMWs25h5syPgeT/gxS53Ra
	IIstgIPqzjWv0Bd2yE8h8+UsgGuW
X-Google-Smtp-Source: AGHT+IHjfpXDYgO9pT6Nw4Bezw1GjCosswQdk5p/7xF4ENGHQ2fIxqrauhJGFISGYIYBcl6ucEQa8Q==
X-Received: by 2002:a05:6402:4312:b0:5ee:497:5221 with SMTP id 4fb4d7f45d1cf-5f628628bdamr756775a12.11.1744984200603;
        Fri, 18 Apr 2025 06:50:00 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625578345sm1009703a12.28.2025.04.18.06.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:49:59 -0700 (PDT)
Date: Fri, 18 Apr 2025 16:49:56 +0300
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
Subject: Re: [PATCH v5 net-next 01/14] net: enetc: add initial netc-lib
 driver to support NTMP
Message-ID: <20250418134956.chlx2izlo6qcfzic@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-2-wei.fang@nxp.com>
 <20250411095752.3072696-2-wei.fang@nxp.com>
 <20250418124905.2jve2cjzrojjwmyh@skbuf>
 <PAXPR04MB8510715CEE1461C5CC8D8CC288BF2@PAXPR04MB8510.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8510715CEE1461C5CC8D8CC288BF2@PAXPR04MB8510.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_065002_489836_6B4CEA5E 
X-CRM114-Status: GOOD (  13.46  )
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

On Fri, Apr 18, 2025 at 01:38:31PM +0000, Wei Fang wrote:
> > Can you please add one more sentence clarifying that the LS1028A
> > management protocol has been retroactively named NTMP 1.0 and its
> > implementation is in enetc_cbdr.c and enetc_tsn.c? The driver, like new
> > NETC documentation, refers to NTMP 2.0 as simply "NTMP".
> > 
> 
> Okay, but enetc_tsn.c is only existed in downstream, so it will not be
> added here.

enetc_qos.c, sorry.

